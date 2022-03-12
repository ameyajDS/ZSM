using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Utils;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.Grid.Column;
using DCC.UMB.CDF.Lookup.Modal;
using System.Threading;

namespace DCC.UMB.CDF.MGMT.TAF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "TAFService" in both code and config file together.
    [ServiceBehavior(IncludeExceptionDetailInFaults = true)]
    public class TAFGridService : ITAFGridService
    {
        //public  TAFGridService()
        //{
        //    timer.Interval = 4000;
        //    timer.Start();
        //    timer.Tick += new EventHandler(timer_Tick);
        //}

        #region ITAFGridService Members

        public int GetRowCount(string gridAutomationId)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            return grid.Rows.Count;
        }

        public void SetCellInFocus(string gridAutomationId, int rowPositon, string columnName)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            grid.ActivateCell(GetColumnIndex(grid, columnName), rowPositon);
        }

        public int InsertRowLast(string gridAutomationId)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            if ((grid.Rows.Count > 0) && (grid.GetRowState(grid.Rows.Count - 1) == RowStates.None))
            {
                grid.SetCurrentRow(grid.Rows.Count - 1);
                return grid.Rows.Count - 1;
            }
            string rowId = grid.InsertRowBottom(true);

            return grid.GetGridRowIndexFromRowIdentifier(rowId);
        }

        public int InsertRowAbove(string gridAutomationId)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, true);
            string rowId = grid.InsertRowAbove(true);
            return grid.GetGridRowIndexFromRowIdentifier(rowId);
        }

        public int InsertRowBelow(string gridAutomationId)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, true);

            string rowId = grid.InsertRowBelow(true);
            return grid.GetGridRowIndexFromRowIdentifier(rowId);
        }

        public void DeleteRow(string gridAutomationId)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, true);

            grid.DeleteRow();
        }

        public string GetValueAsStr(string gridAutomationId, int rowPosition, string columnName)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            //[[see if the grid column is of type lookup, then get the lookup result and get the display 
            //text of the lookup result, else return the value returned by normal AsStr method
            if (((DCCGridColumn)grid.Columns[columnName]).Lookup)
            {
                LookupResult result = grid.AsLookupResult(columnName, rowPosition);
                return "" + result.DisplayMember;
            }
            //]]
            return grid.AsStr(columnName, rowPosition);
        }

        public int? GetValueAsInt(string gridAutomationId, int rowPosition, string columnName)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            return grid.AsInt(columnName, rowPosition);
        }

        public short? GetValueAsShort(string gridAutomationId, int rowPosition, string columnName)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            return grid.AsShort(columnName, rowPosition);
        }

        public double? GetValueAsDouble(string gridAutomationId, int rowPosition, string columnName)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            return grid.AsDbl(columnName, rowPosition);
        }

        public DateTime? GetValueAsDateTime(string gridAutomationId, int rowPosition, string columnName)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            return grid.AsDTM(columnName, rowPosition);
        }

        public void SetStringValue(string gridAutomationId, int rowPosition, string columnName, string value, bool tabOut)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            grid.ActivateCell(GetColumnIndex(grid, columnName), rowPosition);
            TypeInGridCell(grid, value, tabOut);
        }


        public void SetIntValue(string gridAutomationId, int rowPosition, string columnName, int? value, bool tabOut)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            grid.ActivateCell(GetColumnIndex(grid, columnName), rowPosition);
            TypeInGridCell(grid, value.ToString(), tabOut);
        }

        public void SetDoubleValue(string gridAutomationId, int rowPosition, string columnName, double? value, bool tabOut)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            grid.ActivateCell(GetColumnIndex(grid, columnName), rowPosition);
            TypeInGridCell(grid, value.ToString(), tabOut);
        }

        public void SetDateTimeValue(string gridAutomationId, int rowPosition, string columnName, DateTime? value, bool tabOut)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            grid.ActivateCell(GetColumnIndex(grid, columnName), rowPosition);
            string formattedValue = value.HasValue ? value.Value.ToString(Constants.DATE_FORMAT) : "";
            TypeInGridCell(grid, formattedValue, tabOut);
        }

        public void SetShortValue(string gridAutomationId, int rowPosition, string columnName, short? value, bool tabOut)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            grid.ActivateCell(GetColumnIndex(grid, columnName), rowPosition);
            TypeInGridCell(grid, value.ToString(), tabOut);
        }
        public void SetCheckboxValue(string gridAutomationId, int rowPosition, string columnName, bool isChecked, bool tabOut)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            grid.ActivateCell(GetColumnIndex(grid, columnName), rowPosition);
            bool currentCheckedState = grid.AsBln(columnName, rowPosition).HasValue && grid.AsBln(columnName, rowPosition).Value == true;
            if (currentCheckedState != isChecked)
            {
                this.TypeInGridCell(grid, " ", tabOut);
            }
        }
        public int? FindText(string gridAutomationId, string columnName, string searchText, bool ignoreCase)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            List<KeyValuePair<string, object>> lstKeyValPair = new List<KeyValuePair<string, object>>();
            lstKeyValPair.Add(new KeyValuePair<string, object>(columnName, searchText));
            List<RowStates> lstRowStateToExclude = new List<RowStates>();
            List<DCCDataRowView> lstFoundRows = grid.FindRecords(lstKeyValPair, null, null, ignoreCase, false);
            if (lstFoundRows != null && lstFoundRows.Count > 0)
            {
                return grid.GetGridRowIndexFromRowIdentifier(lstFoundRows[0].RowIdentifier);
            }
            return null;
        }

        public void SetDropDownValue(string gridAutomationId, int rowPosition, string columnName, string value, bool tabOut)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            grid.ActivateCell(GetColumnIndex(grid, columnName), rowPosition);
            SendKeys.Send("{F2}");
            grid.BeginEdit(true);
            ((ComboBox)grid.EditingControl).Text = value;
            if (tabOut)
            {
                SendKeys.Send("{TAB}");
            }
        }

        public int GetRowCountForState(string gridAutomationId, string state)
        {
            DCCGrid grid = GetTargetGridControl(gridAutomationId, false);
            RowStates enumState = (RowStates)Enum.Parse(typeof(RowStates), state);
            return grid.GetRowsForState(enumState).Count();
        }
        private void TypeInGridCell(DCCGrid grid, string toType, bool tabOut)
        {
            grid.BeginEdit(true);
            SendKeys.Send("^A");//this is control + A --> meaning select entire string in teh cell
            SendKeys.Send("{DEL}");//this is delete the selected text, basically clear the cell.
            try
            {
                SendKeys.Send(toType);
                if (tabOut)
                {
                    SendKeys.Send("{TAB}");
                }
            }
            finally
            {
                Thread.Sleep(1000);
            }
        }
        private DCCGrid GetTargetGridControl(string gridAutomationId, bool enforceAnActiveCell)
        {
            AbstractScreen screen = GlobalAppVariables.ObjMDIMain.ActiveChild;
            if (screen == null)
            {
                throw new Exception("no screen is active or is open");
            }
            List<Control> lstAllControls = new List<Control>();
            UtilityManager.GetAllControlsInContainer(screen, lstAllControls);
            Control targetControl = lstAllControls.Find(m => m.Name == gridAutomationId);
            if (targetControl == null || !(targetControl is DCCGrid))
            {
                throw new Exception("this screen does not have a grid with automation id = " + gridAutomationId);
            }
            DCCGrid grid = (DCCGrid)targetControl;
            if (enforceAnActiveCell && grid.CurrentCell == null)
            {
                throw new Exception("There is no cell selected in the grid with grid automationid: " + gridAutomationId);
            }
            return grid;
        }
        private int GetColumnIndex(DCCGrid grid, string columnName)
        {
            foreach (DataGridViewColumn col in grid.Columns)
            {
                if (col.Name == columnName) return col.Index;
            }
            throw new Exception("the column with name " + columnName + " not found in grid with name: " + grid.Name);
        }



        #endregion


        #region TAF PING LIVE
        //private static DateTime LastPingReceivedOn = DateTime.Now;
        //private static Timer timer = new Timer();


        //static void timer_Tick(object sender, EventArgs e)
        //{
        //    if (DateTime.Now.Subtract(LastPingReceivedOn).Seconds > 20)
        //    {
        //        Application.Exit();
        //    }
        //}
        //public void KeepLivePing()
        //{
        //    LastPingReceivedOn = DateTime.Now;
        //}
        #endregion
    }
}
