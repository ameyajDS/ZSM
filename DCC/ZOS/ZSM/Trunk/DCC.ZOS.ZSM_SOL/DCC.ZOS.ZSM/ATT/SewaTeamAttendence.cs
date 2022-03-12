using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DCC.UMB.CDF;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.View.Menu;
using System.Configuration;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls;
using System.IO;
using DCC.DBFacade;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Drawing2D;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.DB;
using System.Reflection;
using System.Collections;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.Log;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.UIControls.Grid.Column;

namespace DCC.ZOS.ZSM.ATT
{
    public partial class SewaTeamAttendence : ZSMAbstractScreen2
    {
        private Color backColor = Color.Empty;
        private int? sewaTeamsLookup1_IdValue = null;
        private DateTime? dtAttendance_Value = null;
        private enum GridColumns
        {
            attendance_p,
            attendance_e,
            attendance_l,
            enable,
            sewa_exemption_id,
            grd_full_nm,
            attendance_a
        }

        public SewaTeamAttendence()
        {
            InitializeComponent();
            this.grdSewaWiseDailyAttendance.InsertRowsMenuItemsEnabled = false;
            this.grdSewaWiseDailyAttendance.DeleteRowMenuEnabled = false;
            //this.grdTeamWiseDailyAttendance.ReadOnly = true;
            foreach (DCCGridColumn col in this.grdSewaWiseDailyAttendance.Columns)
            {
                if (string.Compare(col.Name, GridColumns.grd_full_nm.ToString()) == 0 ||
                   string.Compare(col.Name, "serial_id") == 0)
                    col.ReadOnly = true;
            }
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
        }

        public override string ScreenId { get { return Screens.ATT_TEAM_DAILY_DAY_WISE; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        private void makeEditableOnlyInQueryMode(bool isQuery)
        {

        }

        public override void ClearControls()
        {
            if (this.CurrentUIMode == UIModes.Insert)
            {
                ClearAllControlsOfContainer(this, true, this.dtAttendence, this.sewaLookup1, this.sewaTeamsLookup1, this.dtFinish, this.dtStart);
                if (DbManager.IsNotNull(this.sewaLookup1.IdTextAsInteger))
                {
                    this.dtAttendence.Focus();
                }
            }
            else
            {
                base.ClearControls();
            }
            if (!DbManager.IsNotNull(this.sewaLookup1.IdTextAsInteger) && DbManager.IsNotNull(this.dbFacade))
            {
                DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT s.sewa_id, s.sewa_nm, s.start_dt, s.finish_dt FROM sewas s JOIN CDB..satsang_centres sc ON sc.satsang_centre_id = s.satsang_centre_id WHERE s.is_default_sewa = 'Yes' AND s.attendance_marking = 'Team-wise' AND s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId()).Tables[0];
                if (dT.Rows.Count > 0)
                {
                    this.sewaLookup1.SetControlValues(dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_id"].ToString());
                    this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["finish_dt"]);
                    this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["start_dt"]);
                }
            }
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.sewaTeamsLookup1.ReadOnly = false;
                this.sewaLookup1.ReadOnly = false;
                this.dtAttendence.ReadOnly = false;
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.sewaTeamsLookup1.ReadOnly = false;
                this.sewaLookup1.ReadOnly = false;
                this.dtAttendence.ReadOnly = false;
                //CDF Hack
                this.dtAttendence.ReadOnly = false;
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
            }
            else if (uiMode == UIModes.List)
            {
                this.ShowListView(this.scListOrBrowse, true);
            }
            else if (uiMode == UIModes.Browse)
            {
                this.ShowListView(this.scListOrBrowse, false);
            }
        }

        private void markRowsReadOnly()
        {
            Font f = new Font(this.grdSewaWiseDailyAttendance.Font, FontStyle.Bold);
            foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdSewaWiseDailyAttendance))
            {
                if (!this.grdSewaWiseDailyAttendance.AsBln(GridColumns.enable.ToString(), item.RowIndex).Value)
                {
                    this.grdSewaWiseDailyAttendance[GridColumns.grd_full_nm.ToString(), item.RowIndex].Style.Font = f;
                    this.grdSewaWiseDailyAttendance[GridColumns.grd_full_nm.ToString(), item.RowIndex].Style.ForeColor = Color.Red;
                }

                if(((int)item.RowIndex/15) % 2 == 0)
                {
                    foreach (DataGridViewCell i in this.grdSewaWiseDailyAttendance.Rows[item.RowIndex].Cells)
                    {
                        i.Style.BackColor = Color.Wheat;
                    }
                }
            }
        }

        private void LoadAttendence()
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QueryTeamWiseDailyAttendanceAsTask(this.sewaTeamsLookup1.IdTextAsInteger, this.dtAttendence.DisplayTextAsDateTime));
            this.dbFacade.AddDbTask(this.dbFacade.QueryTeamWiseDailyAttendanceForInsertAsTask(this.sewaTeamsLookup1.IdTextAsInteger, this.dtAttendence.DisplayTextAsDateTime));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT = dSet.Tables[0];
            this.grdSewaWiseDailyAttendance.RetrieveRecords(dT, false, RowStates.Old);
            DataTable dTable = dSet.Tables[1];
            this.grdSewaWiseDailyAttendance.RetrieveRecords(dTable, true, RowStates.New);
            if (dT.Rows.Count != 0 && dTable.Rows.Count != 0)
            {
                ((DCCGridColumn)grdSewaWiseDailyAttendance.Columns["serial_id"]).RemoveSort();
                this.grdSewaWiseDailyAttendance.SortOnColumn("serial_id");
            }
            markRowsReadOnly();
        }

        public override void LoadBrowseView(int rowIndex)
        {
            makeEditableOnlyInQueryMode(false);
            this.sewaTeamsLookup1.ReadOnly = true;
            this.sewaLookup1.ReadOnly = true;
            this.dtAttendence.ReadOnly = true;
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1, this.grdSewaWiseDailyAttendance, this.txtSatsangCentre);
            LoadAttendence();
            this.dtAttendance_Value = this.dtAttendence.DisplayTextAsDateTime;
            this.sewaTeamsLookup1_IdValue = this.sewaTeamsLookup1.IdTextAsInteger;
            this.ParametersForLogOperation = GetHashTable();
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewaTeamAttendenceSQLSelectQuery query = new ViewSewaTeamAttendenceSQLSelectQuery();
            query.attendance_dt.Between(this.dtAttendence);
            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.sewa_id.Equal(this.sewaLookup1.IdText);
            query.sewa_nm.Contains(this.sewaLookup1.DisplayText);
            query.sewa_team_id.Equal(this.sewaTeamsLookup1.IdText);
            query.sewa_team_nm.Equal(this.sewaTeamsLookup1.DisplayText);

            query.AddOrderByClause(query.attendance_dt, OrderByTypes.DESC);
            query.AddOrderByClause(query.sewa_id, OrderByTypes.DESC);
            query.AddOrderByClause(query.sewa_team_id, OrderByTypes.DESC);
            return dbFacade.ExecuteSelectQuery(query);
        }


        private List<string> SaveGridsAsTask(int? sewaTeamId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("sewa_team_id", sewaTeamId);
                overiddingParamValues.Add("attendance_dt", this.dtAttendence.DisplayTextAsDateTime);
                overiddingParamValues.Add("old_attendance_dt", this.dtAttendence.DisplayTextAsDateTime);
                overiddingParamValues.Add("is_scanned", "No");
                allTasks = this.grdSewaWiseDailyAttendance.GetAllDBTasks(this.dbFacade, "DeleteTeamWiseDailyAttendanceAsTask", "UpdateTeamWiseDailyAttendanceAsTask", "InsertTeamWiseDailyAttendanceAsTask", overiddingParamValues);
                return allTasks;
            }
            catch
            {
                throw;
            }
        }

        private Hashtable GetHashTable()
        {
            Hashtable tbl = new Hashtable();
            tbl.Add("p_transaction_dt", this.dtAttendence.DisplayTextAsDateTime);
            tbl.Add("p_sewa_id", this.sewaLookup1.IdTextAsInteger);
            tbl.Add("p_object_id", this.sewaTeamsLookup1.IdText);
            tbl.Add("p_satsang_centre_id", ZSMUtility.GetSatsangCentreId());
            return tbl;
        }

        private bool HasAtLeastOneEntry()
        {
            bool hasAtLeastOneEntry = false;
            foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdSewaWiseDailyAttendance))
            {
                if (!item.AsBln(GridColumns.attendance_l.ToString()).Value
                    && !item.AsBln(GridColumns.attendance_e.ToString()).Value
                    && !item.AsBln(GridColumns.attendance_a.ToString()).Value
                    && !item.AsBln(GridColumns.attendance_p.ToString()).Value
                    )
                {

                }
                else
                {
                    hasAtLeastOneEntry = true;
                    break;
                }
            }
            return hasAtLeastOneEntry;
        }

        public override bool IsReadyToSave()
        {
            if (!HasAtLeastOneEntry())
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, "One of the row", MessageTypes.Error);
                return false;
            }
            return base.IsReadyToSave();
        }

        public override void CreateData()
        {
            this.dbFacade.InsertSewaTeamsTxnT(this.sewaTeamsLookup1.IdTextAsInteger, this.dtAttendence.DisplayTextAsDateTime);
            this.dbFacade.AddDbTasks(this.SaveGridsAsTask(this.sewaTeamsLookup1.IdTextAsInteger));
            this.dbFacade.ExecuteDbTasks();
            this.ParametersForLogOperation = GetHashTable();
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.UpdateSewaTeamsTxnTAsTask(this.sewaTeamsLookup1.IdTextAsInteger, this.dtAttendence.DisplayTextAsDateTime, txn_ts));
            this.dbFacade.AddDbTasks(this.SaveGridsAsTask(this.sewaTeamsLookup1.IdTextAsInteger));
            this.dbFacade.ExecuteDbTasks();
        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteSewaTeamsTxnT(this.sewaTeamsLookup1.IdTextAsInteger, this.dtAttendence.DisplayTextAsDateTime, txn_ts);
            return true;
        }

        private void sewaTeamsLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.sewaLookup1.IdText))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.sewa_id = " + this.sewaLookup1.IdText);
            }
            else
            {
                e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "(1=2)");
            }
        }


        private void updateAttendanceAll(int rowIdx, string colName)
        {
            if (!DbManager.IsNotNull(this.grdSewaWiseDailyAttendance.AsLookupResult(GridColumns.sewa_exemption_id.ToString(), rowIdx))
                && !this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_l.ToString(), rowIdx).Value)
            {
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.attendance_a.ToString(), rowIdx, (string.Compare(GridColumns.attendance_a.ToString(), colName) == 0));
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.attendance_e.ToString(), rowIdx, (string.Compare(GridColumns.attendance_e.ToString(), colName) == 0));
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.attendance_l.ToString(), rowIdx, (string.Compare(GridColumns.attendance_l.ToString(), colName) == 0));
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.attendance_p.ToString(), rowIdx, (string.Compare(GridColumns.attendance_p.ToString(), colName) == 0));
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.sewa_exemption_id.ToString(), rowIdx, null);
            }
        }

        private void updateAttendance(int rowIdx, string colName)
        {
            if ((string.Compare(GridColumns.attendance_a.ToString(), colName) != 0))
            {
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.attendance_a.ToString(), rowIdx, (string.Compare(GridColumns.attendance_a.ToString(), colName) == 0));
            }
            if ((string.Compare(GridColumns.attendance_e.ToString(), colName) != 0))
            {
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.attendance_e.ToString(), rowIdx, (string.Compare(GridColumns.attendance_e.ToString(), colName) == 0));
            }
            if ((string.Compare(GridColumns.attendance_l.ToString(), colName) != 0))
            {
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.attendance_l.ToString(), rowIdx, (string.Compare(GridColumns.attendance_l.ToString(), colName) == 0));
            }
            if ((string.Compare(GridColumns.attendance_p.ToString(), colName) != 0))
            {
                this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.attendance_p.ToString(), rowIdx, (string.Compare(GridColumns.attendance_p.ToString(), colName) == 0));
            }
            this.grdSewaWiseDailyAttendance.SetCellValue(GridColumns.sewa_exemption_id.ToString(), rowIdx, null);
        }

        private void chkPresentAll_CheckStateChanged(object sender, EventArgs e)
        {
            if (this.chkPresentAll.Checked)
            {
                this.chkAtendeanceAll.Checked = false;
                foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdSewaWiseDailyAttendance))
                {
                    if (this.grdSewaWiseDailyAttendance.AsBln(GridColumns.enable.ToString(), item.RowIndex).Value)
                    {
                        updateAttendanceAll(item.RowIndex, GridColumns.attendance_p.ToString());
                    }
                }
            }
            else
            {
                foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdSewaWiseDailyAttendance))
                {
                    if (this.grdSewaWiseDailyAttendance.AsBln(GridColumns.enable.ToString(), item.RowIndex).Value)
                    {
                        updateAttendanceAll(item.RowIndex, "");
                    }
                }
            }
        }

        private void chkAtendeanceAll_CheckStateChanged(object sender, EventArgs e)
        {
            if (this.chkAtendeanceAll.Checked)
            {
                this.chkPresentAll.Checked = false;
                foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdSewaWiseDailyAttendance))
                {
                    if (this.grdSewaWiseDailyAttendance.AsBln(GridColumns.enable.ToString(), item.RowIndex).Value)
                    {
                        updateAttendanceAll(item.RowIndex, GridColumns.attendance_a.ToString());
                    }
                }
            }
            else
            {
                foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdSewaWiseDailyAttendance))
                {
                    if (this.grdSewaWiseDailyAttendance.AsBln(GridColumns.enable.ToString(), item.RowIndex).Value)
                    {
                        updateAttendanceAll(item.RowIndex, "");
                    }
                }
            }
        }

        private void sewaLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND s.attendance_marking = 'Team-wise' ");
        }

        private void makeColumnsReadOnly(bool val)
        {
            //foreach (DCCGridColumn col in this.grdSewaWiseDailyAttendance.Columns)
            //{
            //    if (string.Compare(col.Name, GridColumns.grd_full_nm.ToString()) != 0 &&
            //       string.Compare(col.Name, "serial_id") != 0)
            //        col.ReadOnly = val;
            //}
        }

        private void grdSewaWiseDailyAttendance_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            if (!this.grdSewaWiseDailyAttendance.AsBln(GridColumns.enable.ToString(), e.RowIndex).Value)
            {
                //makeColumnsReadOnly(true);
                e.Cancel = true;
            }
            else
            {
                if (this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.sewa_exemption_id.ToString())
                {
                    if (!this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_a.ToString()).Value
                       && this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_e.ToString()).Value
                       && !this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_l.ToString()).Value
                       && !this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_p.ToString()).Value)
                    {
                        makeColumnsReadOnly(false);
                    }
                    else
                    {
                        UIManager.ShowMessage(MsgCodes.ValueReqd, "For Exemption, 'E' Type Attendance", MessageTypes.Warning);
                        makeColumnsReadOnly(false);
                    }
                }
                else
                {
                    makeColumnsReadOnly(false);
                }
                backColor = this.grdSewaWiseDailyAttendance.Rows[e.RowIndex].Cells[0].Style.BackColor;
                foreach (DataGridViewCell item in this.grdSewaWiseDailyAttendance.Rows[e.RowIndex].Cells)
                {
                    item.Style.BackColor = Color.White;
                }
            }
        }

        private void grdSewaWiseDailyAttendance_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            //if (this.grdSewaWiseDailyAttendance.GetVisibleRowsCount() > 0)
            //{
            //    if (this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_a.ToString()
            //        || this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_e.ToString()
            //        || this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_l.ToString()
            //        || this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_p.ToString()
            //        )
            //    {
            //        if (this.grdSewaWiseDailyAttendance.AsBln(e.ColumnIndex, e.RowIndex).Value)
            //        {
            //            updateAttendance(e.RowIndex, this.grdSewaWiseDailyAttendance.Columns[e.ColumnIndex].Name);
            //        }
            //    }
            //}
            makeColumnsReadOnly(false);
            foreach (DataGridViewCell item in this.grdSewaWiseDailyAttendance.Rows[e.RowIndex].Cells)
            {
                item.Style.BackColor = backColor;
            }
        }

        private void grdSewaWiseDailyAttendance_RowValidating(object sender, DataGridViewCellCancelEventArgs e)
        {
            int rowIdx = e.RowIndex;
            //if (this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_a.ToString(), rowIdx).HasValue &&
            //    !(this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_a.ToString(), rowIdx).Value
            //   ^ this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_e.ToString(), rowIdx).Value
            //   ^ this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_l.ToString(), rowIdx).Value
            //   ^ this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_p.ToString(), rowIdx).Value))
            //{
            //    UIManager.ShowMessage(MsgCodes.InvalidValue, "Value | P, L, E, A. Only one of these can be specified", MessageTypes.Warning);
            //}
            if (this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_e.ToString(), rowIdx).HasValue &&
                this.grdSewaWiseDailyAttendance.AsBln(GridColumns.attendance_e.ToString(), rowIdx).Value)
            {
                if (!DbManager.IsNotNull(this.grdSewaWiseDailyAttendance.AsLookupResult(GridColumns.sewa_exemption_id.ToString())))
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "For 'E' Type Attendance, Exemption", MessageTypes.Warning);
                    e.Cancel = true;
                }
            }
        }

        private void dtAttendence_FocusLost(object sender, EventArgs e)
        {
            if (DbManager.IsNotNull(this.dtAttendence.DisplayTextAsDateTime))
            {
                if ((dtAttendance_Value != this.dtAttendence.DisplayTextAsDateTime) &&  DbManager.IsNotNull(this.sewaTeamsLookup1.IdTextAsInteger))
                {
                    dtAttendance_Value = this.dtAttendence.DisplayTextAsDateTime;
                    sewaTeamsLookup1_FocusLost(null, null);
                }
            }
        }

        private void sewaLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["finish_dt"]);
            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["start_dt"]);
        }

        private void sewaTeamsLookup1_FocusLost(object sender, EventArgs e)
        {
            bool isCalledFromElsewhere = (sender == null || e == null);
            if (isCalledFromElsewhere || sewaTeamsLookup1_IdValue == null || sewaTeamsLookup1_IdValue != sewaTeamsLookup1.IdTextAsInteger)
            {
                sewaTeamsLookup1_IdValue = sewaTeamsLookup1.IdTextAsInteger;
                if (!string.IsNullOrEmpty(this.sewaLookup1.IdText) && !string.IsNullOrEmpty(this.sewaTeamsLookup1.IdText))
                {
                    if (this.CurrentUIMode == UIModes.Insert)
                    {
                        if (DbManager.IsNotNull(this.dtAttendence.DisplayTextAsDateTime))
                        {
                            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("SELECT * FROM ViewSewaTeamAttendence WHERE satsang_centre_id = {0} AND sewa_team_id = {1} AND attendance_dt = '{2}'", ZSMUtility.GetSatsangCentreId(), this.sewaTeamsLookup1.IdText, this.dtAttendence.DisplayText)).Tables[0];
                            if (dT.Rows.Count > 0)
                            {
                                this.CurrentUIMode = UIModes.Query;
                                GlobalAppVariables.ObjMDIMain.FireRetrieveMode();
                                if (this.CurrentUIMode == UIModes.Query)
                                {
                                    this.CurrentUIMode = UIModes.Insert;
                                }
                            }
                            else
                            {
                                LoadAttendence();
                            }
                        }
                        else
                        {
                            UIManager.ShowMessage(MsgCodes.ValueReqd, "Attendance Date", MessageTypes.Warning);
                            //this.sewaTeamsLookup1.ClearControlValues();
                        }
                    }
                }
            }
        }

        
        private void grdSewaWiseDailyAttendance_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (this.grdSewaWiseDailyAttendance.GetVisibleRowsCount() > 0
                && this.grdSewaWiseDailyAttendance.AsBln(GridColumns.enable.ToString(), e.RowIndex).Value)
            
            {
                if (this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_a.ToString()
                    || this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_e.ToString()
                    || this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_l.ToString()
                    || this.grdSewaWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_p.ToString()
                    )
                {
                    if (this.grdSewaWiseDailyAttendance.AsBln(e.ColumnIndex, e.RowIndex).Value)
                    {
                        this.grdSewaWiseDailyAttendance.SetCellValue(e.ColumnIndex, e.RowIndex, false);
                    }
                    else
                    {
                        this.grdSewaWiseDailyAttendance.SetCellValue(e.ColumnIndex, e.RowIndex, true);
                    }
                    if (this.grdSewaWiseDailyAttendance.AsBln(e.ColumnIndex, e.RowIndex).Value)
                    {
                        updateAttendance(e.RowIndex, this.grdSewaWiseDailyAttendance.Columns[e.ColumnIndex].Name);
                    }
                }
            }
        }
    }
}
