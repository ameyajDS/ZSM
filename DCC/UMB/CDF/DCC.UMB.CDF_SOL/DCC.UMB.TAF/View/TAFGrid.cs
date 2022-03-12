using System;
using System.Collections.Generic;
using System.Text;
using White.Core.UIItems;
using White.Core.UIItems.WindowItems;
using White.Core.InputDevices;
using White.Core.UIItems.MenuItems;
using White.Core.WindowsAPI;

using System.IO;
using White.Core.UIItems.TableItems;
using White.Core;
using White.Core.UIItems.Finders;
using White.Core.Configuration;

using DCC.UMB.TAF.TAFGridService;
using System.Threading;

namespace DCC.UMB.TAF.View
{
    public class TAFGrid : TAFAbstractControl
    {
        private Table grid = null;
        private TAFAbstractScreen OwnerTAFScreen { get; set; }
        private TAFGridServiceClient client = null;
        public TAFGrid(TAFAbstractScreen ownerScreen, Table objGrid, Window containerWindow)
            : base(objGrid)
        {
            this.Grid = objGrid;
            this.ParentWindow = containerWindow;
            this.OwnerTAFScreen = ownerScreen;
            client = new TAFGridServiceClient();
        }

        private TAFGridServiceClient GetClient()
        {
            if (client == null)
            {
                client = new TAFGridServiceClient();
            }
            return this.client;
        }
        /// <summary>
        /// Gets or Sets the embedded Table object created by white.
        /// </summary>
        public Table Grid
        {
            get { return grid; }
            set { grid = value; }
        }

        public int GetRowCount()
        {
            return client.GetRowCount(this.Grid.Id);
        }
        
        /// <summary>
        /// Inserts a row in the last of the grid and returns the position of the inserted row
        /// If there is already an empay row in the last then no row is added.
        /// Also if the current row of the grid has invalid cells then no row is inserted.
        /// </summary>
        public int InsertRowLast()
        {
            int  insertedRowIndex = client.InsertRowLast(this.Grid.Id);
            OwnerTAFScreen.Pause(1);
            Logger.Debug(string.Format("A row was successfully inserted at last on the grid with id = '{0}', inserted row index is = '{1}'", this.grid.Id, insertedRowIndex));
            return insertedRowIndex;
        }
        
        public int InsertRowAbove()
        {
            int insertedRowIndex =  client.InsertRowAbove(this.Grid.Id);
            OwnerTAFScreen.Pause(1);
            Logger.Debug(string.Format("A row was successfully inserted below current row on the grid with id = '{0}', inserted row index is = '{1}'", this.grid.Id, insertedRowIndex));            
            return insertedRowIndex;
        }

        /// <summary>
        /// Inserts a row below the current row of the grid. If there is no current row, then nothing happens.
        /// If the current row of the grid has invalid cells then no row is inserted.
        /// </summary>
        public int InsertRowBelow()
        {
            int insertedRowIndex =  client.InsertRowBelow(this.Grid.Id);
            OwnerTAFScreen.Pause(1);
            Logger.Debug(string.Format("A row was successfully inserted above current row on the grid with id = '{0}', inserted row index is = '{1}'", this.grid.Id, insertedRowIndex));            
            return insertedRowIndex;
        }

        /// <summary>
        ///Deletes the current row of this grid. If there is no row selected then nothing happens.
        /// </summary>
        public void DeleteRow()
        {
            client.DeleteRow(this.Grid.Id);
            Thread.Sleep(1000);
            Logger.Debug(string.Format("Current row was successfully deleted from the grid with id = '{0}'", this.grid.Id));            
        }



        /// <summary>
        /// Returns the cell value specified by rowIndex and column name as a string
        /// </summary>
        /// <param name="rowIndex">0 based row index</param>
        /// <param name="col">An enumeration element specifying the name of the column</param>
        public string CellValueAsStr(int rowIndex, Enum col)
        {
            return client.GetValueAsStr(this.Grid.Id, rowIndex, col.ToString());
        }



        /// <summary>
        /// Returns the cell value specified by rowIndex and colIndex as a short
        /// </summary>
        /// <param name="rowIndex">0 based row index</param>
        /// <param name="col">An enumeration element specifying the name of the column</param>
        public short? CellValueAsShort(int rowIndex, Enum col)
        {
            return client.GetValueAsShort(this.Grid.Id, rowIndex, col.ToString());
        }

        /// <summary>
        /// Returns the cell value specified by rowIndex and colIndex as a float
        /// </summary>
        /// <param name="rowIndex">0 based row index</param>
        /// <param name="col">An enumeration element specifying the name of the column</param>
        public float? CellValueAsFloat(int rowIndex, Enum col)
        {
            return (float?)client.GetValueAsDouble(this.Grid.Id, rowIndex, col.ToString());
        }

        /// <summary>
        /// Returns the cell value specified by rowIndex and colIndex as a double
        /// </summary>
        /// <param name="rowIndex">0 based row index</param>
        /// <param name="col">An enumeration element specifying the name of the column</param>
        public double? CellValueAsDouble(int rowIndex, Enum col)
        {
            return client.GetValueAsDouble(this.Grid.Id, rowIndex, col.ToString());
        }

        /// <summary>
        /// Returns the cell value specified by rowIndex and colIndex as a DateTime object
        /// </summary>
        /// <param name="rowIndex">0 based row index</param>
        /// <param name="col">An enumeration element specifying the name of the column</param>
        public DateTime? CellValueAsDateTime(int rowIndex, Enum col)
        {
            return client.GetValueAsDateTime(this.Grid.Id, rowIndex, col.ToString());
        }


        /// <summary>
        /// Sets the value of a cell
        /// </summary>
        /// <param name="rowIndex">0 based row index</param>
        ///<param name="col">An enumeration member specifying the name of the column in which the value needs to be set.</param>
        /// <param name="value">the value to be set</param>
        /// <param name="tabOut">should the focus move to next cell after setting the value</param>
        public void SetStringValue(int rowIndex, Enum col, string value, bool tabOut)
        {
            client.SetStringValue(this.Grid.Id, rowIndex, col.ToString(), value, tabOut);
            Logger.Debug(string.Format("A string '{0}' set in row with index {1} and on column '{2}' in grid with id ='{3}'", value, rowIndex, col.ToString(),this.grid.Id));
        }
        public void SetCheckboxValue(int rowIndex, Enum col, bool isChecked, bool tabOut)
        {
            client.SetCheckboxValue(this.Grid.Id, rowIndex, col.ToString(), isChecked, tabOut);
            Logger.Debug(string.Format("A checkbox set to value '{0}' in row with index {1} and on column '{2}' in grid with id ='{3}'", isChecked?"checked":"unchecked", rowIndex, col.ToString(),this.grid.Id));
        }

        public void SetIntValue(int rowIndex, Enum col, int? value, bool tabOut)
        {
            client.SetIntValue(this.Grid.Id, rowIndex, col.ToString(), value, tabOut);
            Logger.Debug(string.Format("An integer value '{0}' set in row with index {1} and on column '{2}' in grid with id ='{3}'", value.HasValue ? value.ToString() : "NULL", rowIndex, col.ToString(), this.grid.Id));
        }

        public void SetDoubleValue(int rowIndex, Enum col, double? value, bool tabOut)
        {
            client.SetDoubleValue(this.Grid.Id, rowIndex, col.ToString(), value, tabOut);
            Logger.Debug(string.Format("A double value '{0}' set in row with index {1} and on column '{2}' in grid with id ='{3}'", value.HasValue ? value.ToString() : "NULL", rowIndex, col.ToString(), this.grid.Id));
        }

        public void SetDateValue(int rowIndex, Enum col, DateTime? value, bool tabOut)
        {
            client.SetDateTimeValue(this.Grid.Id, rowIndex, col.ToString(), value, tabOut);
            Logger.Debug(string.Format("A date value '{0}' set in row with index {1} and on column '{2}' in grid with id ='{3}'", value.HasValue ? value.ToString() : "NULL", rowIndex, col.ToString(), this.grid.Id));
        }

        public void SetDropDownValue(int rowIndex, Enum col, string value, bool tabOut)
        {
            client.SetDropDownValue(this.Grid.Id, rowIndex, col.ToString(), value, tabOut);
        }
        public int? FindText(Enum col, string searchText, bool ignoreCase)
        {
            return client.FindText(this.Grid.Id, col.ToString(), searchText, ignoreCase);
        }
        /// <summary>
        /// Focuses a row at the given index.
        /// </summary>
        /// <param name="rowIndex"></param>
        public void SetCellInFocus(int rowIndex, Enum col)
        {
            client.SetCellInFocus(this.Grid.Id, rowIndex, col.ToString());
            Thread.Sleep(1000);
            Logger.Debug(string.Format("A cell set in focus in row with index {0} and on column '{1}' in grid with id ='{2}'",  rowIndex, col.ToString(), this.grid.Id));
            return;
        }

        public int GetRowCountForState(GridRowStates state)
        {
            return client.GetRowCountForState(this.Grid.Id, state.ToString());
        }
        
    }
}
