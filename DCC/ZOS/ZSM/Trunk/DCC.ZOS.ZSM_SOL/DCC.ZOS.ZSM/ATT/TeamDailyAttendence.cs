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
using System.Timers;

namespace DCC.ZOS.ZSM.ATT
{
    public partial class TeamDailyAttendence : ZSMAbstractScreen2
    {
        private enum GridColumns
        {
            attendance_dt,
            attendance_p,
            attendance_e,
            attendance_l,
            enable,
            sewa_exemption_id,
            grd_full_nm,
            attendance_a
        }

        bool enableRowsForEdit = false;

        public TeamDailyAttendence()
        {
            InitializeComponent();
            this.sewadarHeader1.SttsCode = "SttsAttnd";
            this.grdTeamWiseDailyAttendance.InsertRowsMenuItemsEnabled = false;
            this.grdTeamWiseDailyAttendance.DeleteRowMenuEnabled = false;
            //this.grdTeamWiseDailyAttendance.ReadOnly = true;
            foreach (DCCGridColumn col in this.grdTeamWiseDailyAttendance.Columns)
            {
                if (string.Compare(col.Name, GridColumns.grd_full_nm.ToString()) == 0 ||
                   string.Compare(col.Name, "serial_id") == 0)
                    col.ReadOnly = true;
            }
            this.sewadarHeader1.txtSatsangCentre.ReadOnly = false;
            this.sewadarHeader1.txtSatsangCentre.Lookup = true;
            this.sewadarHeader1.txtSatsangCentre.TabStop = true;
            this.sewadarHeader1.txtSatsangCentre.TabIndex = 0;
            this.sewadarHeader1.UseFocusLostEvent = true;
            this.sewadarHeader1.txtSatsangCentre.Title = "Sewadar Centre";
        }

        public override string ScreenId { get { return Screens.ATT_TEAM_DAILY_SEWADAR_WISE; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }

        private void makeEditableOnlyInQueryMode(bool isQuery)
        {
            this.sewadarHeader1.makeReadOnlyFieldQueriable(isQuery);
            this.sewadarHeader1.txtSubDepartment.ReadOnly = !isQuery;
            this.sewadarHeader1.txtDepartmentName.ReadOnly = !isQuery;
            this.sewaTeamsLookup1.ReadOnly = !isQuery;
        }


        public override void ClearControls()
        {
            if (this.CurrentUIMode == UIModes.Insert)
            {
                ClearAllControlsOfContainer(this, true, this.sewaLookup1, this.dtFinish, this.dtStart);
            }
            else
            {
                base.ClearControls();
            }
            this.txtSatsangCentreNm.DisplayText = ZSMUtility.GetSatsangCentreName();
            this.sewadarHeader1.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
            this.sewadarHeader1.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
            if (DbManager.IsNotNull(this.dbFacade) && string.IsNullOrEmpty(this.sewaLookup1.IdText))
            {
                DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT s.sewa_id, s.sewa_nm, s.start_dt, s.finish_dt FROM sewas s JOIN CDB..satsang_centres sc ON sc.satsang_centre_id = s.satsang_centre_id WHERE s.is_default_sewa = 'Yes' AND s.attendance_marking = 'Team-wise' AND s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId()).Tables[0];
                if (dT.Rows.Count > 0)
                {
                    this.sewaLookup1.SetControlValues(dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_id"].ToString());
                    this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["finish_dt"]);
                    this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["start_dt"]);
                }
            }
            enableRowsForEdit = false;

        }

        private void makeHeaderReadOnly(bool readOnly)
        {
            this.sewaLookup1.ReadOnly = readOnly;
            this.sewadarHeader1.txtSatsangCentre.ReadOnly = readOnly;
            this.sewadarHeader1.txtGRNo.ReadOnly = readOnly;
            this.sewadarHeader1.txtName.ReadOnly = readOnly;
            this.sewadarHeader1.intSewadarId.ReadOnly = readOnly;
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                makeHeaderReadOnly(false);
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                makeHeaderReadOnly(false);
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

        private void LoadAttendence()
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarTeamWiseDailyAttendanceAsTask(this.sewadarHeader1.txtSatsangCentre.IdTextAsInteger.GetValueOrDefault(ZSMUtility.GetSatsangCentreId().Value),
                this.sewadarHeader1.txtGRNo.DisplayText, this.sewaLookup1.IdTextAsInteger));
            if (this.grdList.AsBln(GridColumns.enable.ToString()).Value)
            {
                this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarTeamWiseDailyAttendanceForInsertAsTask(this.sewadarHeader1.txtSatsangCentre.IdTextAsInteger.GetValueOrDefault(ZSMUtility.GetSatsangCentreId().Value),
                    this.sewadarHeader1.txtGRNo.DisplayText, this.sewaLookup1.IdTextAsInteger));
            }
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT = dSet.Tables[0];
            this.grdTeamWiseDailyAttendance.RetrieveRecords(dT, false, RowStates.Old);
            if (!this.grdList.AsBln(GridColumns.enable.ToString()).Value)
            {
                Font f = new Font(this.grdTeamWiseDailyAttendance.Font, FontStyle.Bold);
                foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdTeamWiseDailyAttendance))
                {
                    this.grdTeamWiseDailyAttendance[GridColumns.attendance_dt.ToString(), item.RowIndex].Style.Font = f;
                    this.grdTeamWiseDailyAttendance[GridColumns.attendance_dt.ToString(), item.RowIndex].Style.ForeColor = Color.Red;
                }
            }
            else
            {
                DataTable dTable = dSet.Tables[1];
                this.grdTeamWiseDailyAttendance.RetrieveRecords(dTable, true, RowStates.New);
                if (dT.Rows.Count != 0 && dTable.Rows.Count != 0)
                {
                    ((DCCGridColumn)grdTeamWiseDailyAttendance.Columns["attendance_dt"]).RemoveSort();
                    this.grdTeamWiseDailyAttendance.SortOnColumn("attendance_dt");
                }
            }


        }


        private Hashtable GetHashTable()
        {
            Hashtable tbl = new Hashtable();
            tbl.Add("p_sewa_id", this.sewaLookup1.IdText);
            tbl.Add("p_satsang_centre_id", ZSMUtility.GetSatsangCentreId());
            tbl.Add("p_sewadar_grno", this.sewadarHeader1.txtGRNo.DisplayText);
            return tbl;
        }

        public override void LoadBrowseView(int rowIndex)
        {
            makeEditableOnlyInQueryMode(false);
            makeHeaderReadOnly(true);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1, this.grdTeamWiseDailyAttendance, this.sewadarHeader1);
            this.sewadarHeader1.SatsangCentreId = this.grdList.AsInt("satsang_centre_id");
            this.sewadarHeader1.SetGRNoAndFireEvent(this.grdList.AsStr("sewadar_grno"), this.grdList.AsInt("satsang_centre_id"));
            LoadAttendence();
            this.ParametersForLogOperation = GetHashTable();
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewTeamDailyAttendenceSQLSelectQuery query = new ViewTeamDailyAttendenceSQLSelectQuery();

            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.sewa_id.Equal(this.sewaLookup1.IdText);
            query.sewa_nm.Contains(this.sewaLookup1.DisplayText);
            query.sewadar_grno.Equal(this.sewadarHeader1.txtGRNo.DisplayText);
            query.sewadar_id.Equal(this.sewadarHeader1.intSewadarId.DisplayText);
            query.department_nm.Contains(this.sewadarHeader1.txtDepartmentName.DisplayText);
            query.sub_department_nm.Contains(this.sewadarHeader1.txtSubDepartment.DisplayText);
            query.sub_department_nm.Contains(this.sewadarHeader1.txtSubDepartment.DisplayText);
            query.sewa_team_id.Equal(this.sewaTeamsLookup1.IdText);
            query.sewa_team_nm.Equal(this.sewaTeamsLookup1.DisplayText);
            query.sewadar_status_nm.Contains(this.sewadarHeader1.txtSewadarStatus.DisplayText);
            query.age.Between(this.sewadarHeader1.intAge);
            query.sewadar_status_dtm.Between(this.sewadarHeader1.dtmSewadarStatus);
            query.department_dt.Between(this.sewadarHeader1.dtDepJoiningDate);


            query.AddOrderByClause(query.sewa_id, OrderByTypes.DESC);
            query.AddOrderByClause(query.sewa_team_id, OrderByTypes.ASC);
            query.AddOrderByClause(query.serial_id, OrderByTypes.ASC);
            return dbFacade.ExecuteSelectQuery(query);
        }


        private List<string> SaveGridsAsTask()
        {
            List<string> allTasks = new List<string>();
            try
            {
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("is_scanned", "No");
                allTasks = this.grdTeamWiseDailyAttendance.GetAllDBTasks(this.dbFacade, "DeleteTeamWiseDailyAttendanceAsTask", "UpdateTeamWiseDailyAttendanceAsTask", "InsertTeamWiseDailyAttendanceAsTask", overiddingParamValues);
                return allTasks;
            }
            catch
            {
                throw;
            }
        }


        void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            ((System.Timers.Timer)sender).Stop();
            UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Save|Attendance for a new date should be entered in Team-wise Daily Attendance(Day Wise).", MessageTypes.Error);
        }


        private bool HasAtLeastOneEntry()
        {
            bool hasAtLeastOneEntry = false;
            foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdTeamWiseDailyAttendance))
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
            try
            {
                this.dbFacade.AddDbTasks(this.SaveGridsAsTask());
                this.dbFacade.InsUpdSewadarsTxnts(this.sewadarHeader1.txtSatsangCentre.IdTextAsInteger.GetValueOrDefault(ZSMUtility.GetSatsangCentreId().Value)
                    , this.sewadarHeader1.txtGRNo.DisplayText, this.sewaLookup1.IdTextAsInteger, this.ScreenId, null);
                this.dbFacade.ExecuteDbTasks();
                this.ParametersForLogOperation = GetHashTable();
            }
            catch (Exception e)
            {
                if (e.Message.Contains("TeamWiseDailyAttendance_FK_SewaTeamID_AttendanceDt"))
                {
                    System.Timers.Timer timer = new System.Timers.Timer(500);//start a timer to print a delayed message to user, the exception below will break CDF save sequence
                    timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
                    timer.Start();
                    //[[Throw excepiton to override the default behavior of CDF
                    throw new Exception("");//Exception with no message would prevent it to be displayed to user.
                    //]]
                }
                else
                {
                    throw;
                }
            }
        }

        public override void UpdateData()
        {
            try
            {
                byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
                this.dbFacade.AddDbTasks(this.SaveGridsAsTask());
                this.dbFacade.InsUpdSewadarsTxnts(this.sewadarHeader1.txtSatsangCentre.IdTextAsInteger.GetValueOrDefault(ZSMUtility.GetSatsangCentreId().Value)
                    , this.sewadarHeader1.txtGRNo.DisplayText, this.sewaLookup1.IdTextAsInteger, this.ScreenId, txn_ts);
                this.dbFacade.ExecuteDbTasks();
            }
            catch (Exception e)
            {
                if (e.Message.Contains("TeamWiseDailyAttendance_FK_SewaTeamID_AttendanceDt"))
                {
                    System.Timers.Timer timer = new System.Timers.Timer(500);//start a timer to print a delayed message to user, the exception below will break CDF save sequence
                    timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
                    timer.Start();
                    //[[Throw excepiton to override the default behavior of CDF
                    throw new Exception("");//Exception with no message would prevent it to be displayed to user.
                    //]]
                }
                else
                {
                    throw;
                }
            }
        }
        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");

            int? intSatsangCentreId = this.sewadarHeader1.txtSatsangCentre.IdTextAsInteger.GetValueOrDefault(ZSMUtility.GetSatsangCentreId().Value);
            int? intSewaId = this.sewaLookup1.IdTextAsInteger;
            string strSewadarGrNo = this.sewadarHeader1.txtGRNo.DisplayText;

            this.dbFacade.DeleteAllTeamWiseDailyAttendance(this.sewaTeamsLookup1.IdTextAsInteger, this.grdList.AsInt("serial_id"));

            int rowCount = ZSMUtility.GetRecordCount(dbFacade, "team_wise_daily_attendance", strSewadarGrNo, intSewaId, intSatsangCentreId);
            if (rowCount == 0)
            {
                this.dbFacade.DelSewadarstxnts(intSatsangCentreId, strSewadarGrNo, intSewaId, this.ScreenId, txn_ts);
            }
            return true;
        }

        private void grdTeamWiseDailyAttendance_RowValidating(object sender, DataGridViewCellCancelEventArgs e)
        {
            int rowIdx = e.RowIndex;
            
            if (this.grdTeamWiseDailyAttendance.AsBln(GridColumns.attendance_e.ToString(), rowIdx).HasValue &&
                this.grdTeamWiseDailyAttendance.AsBln(GridColumns.attendance_e.ToString(), rowIdx).Value)
            {
                if (!DbManager.IsNotNull(this.grdTeamWiseDailyAttendance.AsLookupResult(GridColumns.sewa_exemption_id.ToString())))
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "For 'E' Type Attendance, Exemption", MessageTypes.Warning);
                    e.Cancel = true;
                }
            }
        }

        private void updateAttendanceAll(int rowIdx, string colName)
        {
            if (!DbManager.IsNotNull(this.grdTeamWiseDailyAttendance.AsLookupResult(GridColumns.sewa_exemption_id.ToString(), rowIdx))
                && !this.grdTeamWiseDailyAttendance.AsBln(GridColumns.attendance_l.ToString(), rowIdx).Value)
            {
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.attendance_a.ToString(), rowIdx, (string.Compare(GridColumns.attendance_a.ToString(), colName) == 0));
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.attendance_e.ToString(), rowIdx, (string.Compare(GridColumns.attendance_e.ToString(), colName) == 0));
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.attendance_l.ToString(), rowIdx, (string.Compare(GridColumns.attendance_l.ToString(), colName) == 0));
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.attendance_p.ToString(), rowIdx, (string.Compare(GridColumns.attendance_p.ToString(), colName) == 0));
            }
        }

        private void updateAttendance(int rowIdx, string colName)
        {
            if ((string.Compare(GridColumns.attendance_a.ToString(), colName) != 0))
            {
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.attendance_a.ToString(), rowIdx, (string.Compare(GridColumns.attendance_a.ToString(), colName) == 0));
            }
            if ((string.Compare(GridColumns.attendance_e.ToString(), colName) != 0))
            {
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.attendance_e.ToString(), rowIdx, (string.Compare(GridColumns.attendance_e.ToString(), colName) == 0));
            }
            if ((string.Compare(GridColumns.attendance_l.ToString(), colName) != 0))
            {
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.attendance_l.ToString(), rowIdx, (string.Compare(GridColumns.attendance_l.ToString(), colName) == 0));
            }
            if ((string.Compare(GridColumns.attendance_p.ToString(), colName) != 0))
            {
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.attendance_p.ToString(), rowIdx, (string.Compare(GridColumns.attendance_p.ToString(), colName) == 0));
            }
            this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.sewa_exemption_id.ToString(), rowIdx, null);
        }


        private void chkPresentAll_CheckStateChanged(object sender, EventArgs e)
        {
            if (this.chkPresentAll.Checked)
            {
                this.chkAtendeanceAll.Checked = false;
                foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdTeamWiseDailyAttendance))
                {
                    updateAttendanceAll(item.RowIndex, GridColumns.attendance_p.ToString());
                }
            }
            else
            {
                foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdTeamWiseDailyAttendance))
                {
                    updateAttendanceAll(item.RowIndex, "");
                }
            }
        }

        private void chkAtendeanceAll_CheckStateChanged(object sender, EventArgs e)
        {
            if (this.chkAtendeanceAll.Checked)
            {
                this.chkPresentAll.Checked = false;
                foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdTeamWiseDailyAttendance))
                {
                    updateAttendanceAll(item.RowIndex, GridColumns.attendance_a.ToString());
                }
            }
            else
            {
                {
                    foreach (DCCDataRowView item in ZSMUtility.GetAllRows(this.grdTeamWiseDailyAttendance))
                    {
                        updateAttendanceAll(item.RowIndex, "");
                    }
                }
            }
        }

        private void grdTeamWiseDailyAttendance_CurrentCellChanged(object sender, EventArgs e)
        {
            //if(this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_a.ToString()
            //    || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_e.ToString()
            //    || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_l.ToString()
            //    || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_p.ToString()
            //    )
            //{
            //    updateAttendance(this.grdTeamWiseDailyAttendance.CurrentRowIndex, this.grdTeamWiseDailyAttendance.CurrentColumnName);
            //}
        }

        private void grdTeamWiseDailyAttendance_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            bool enable = false;
            if (this.CurrentUIMode == UIModes.Insert)
            {
                enable = enableRowsForEdit;
            }
            else
            {
                enable = this.grdList.AsBln(GridColumns.enable.ToString()).Value;
            }
            if (!enable)
            {
                //makeColumnsReadOnly(true);
                e.Cancel = true;
            }
            else
            {
                if (this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.sewa_exemption_id.ToString())
                {
                    if (!this.grdTeamWiseDailyAttendance.AsBln(GridColumns.attendance_a.ToString()).Value
                       && this.grdTeamWiseDailyAttendance.AsBln(GridColumns.attendance_e.ToString()).Value
                       && !this.grdTeamWiseDailyAttendance.AsBln(GridColumns.attendance_l.ToString()).Value
                       && !this.grdTeamWiseDailyAttendance.AsBln(GridColumns.attendance_p.ToString()).Value)
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
            }
        }


        private void sewadarHeader1_SewadarSelectionChanged(object sender, DCC.ZOS.ZSM.Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs e)
        {
            if (this.CurrentUIMode == UIModes.Insert)
            {
                if (!string.IsNullOrEmpty(this.sewadarHeader1.txtGRNo.DisplayText))
                {
                    if (DbManager.IsNotNull(this.sewaLookup1.IdTextAsInteger))
                    {
                        //DataSet dSet = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("SELECT * FROM ViewTeamDailyAttendence WHERE satsang_centre_id = {0} AND sewa_id = {1} AND sewadar_grno = '{2}' AND screen_id = 'ATT_05' ; SELECT (CASE WHEN siv.system_info_cd IS NULL THEN 'No'  ELSE 'Yes' END)	FROM ViewSewadarHeader vs 	LEFT OUTER JOIN system_information_values siv ON (siv.system_info_cd = 'SttsActv' AND siv.system_info_value = vs.sewadar_status_cd)	WHERE vs.sewadar_id = {3}", ZSMUtility.GetSatsangCentreId(), this.sewaLookup1.IdText, this.sewadarHeader1.txtGRNo.DisplayText, this.sewadarHeader1.intSewadarId.IdText));
                        DataSet dSet = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("SELECT * FROM ViewTeamDailyAttendence WHERE satsang_centre_id = {0} AND sewa_id = {1} AND sewadar_grno = '{2}' ; SELECT (CASE WHEN siv.system_info_cd IS NULL THEN 'No'  ELSE 'Yes' END)	FROM ViewSewadarHeader vs 	LEFT OUTER JOIN system_information_values siv ON (siv.system_info_cd = 'SttsActv' AND siv.system_info_value = vs.sewadar_status_cd)	WHERE vs.sewadar_id = {3}", ZSMUtility.GetSatsangCentreId(), this.sewaLookup1.IdText, this.sewadarHeader1.txtGRNo.DisplayText, this.sewadarHeader1.intSewadarId.IdText));
                        DataTable dT = dSet.Tables[0];
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
                            DataTable dTable = this.dbFacade.QuerySewadarTeamWiseDailyAttendanceForInsert(this.sewadarHeader1.txtSatsangCentre.IdTextAsInteger.GetValueOrDefault(ZSMUtility.GetSatsangCentreId().Value)
                                , this.sewadarHeader1.txtGRNo.DisplayText, this.sewaLookup1.IdTextAsInteger).Tables[0];
                            this.grdTeamWiseDailyAttendance.RetrieveRecords(dTable, false, RowStates.New);
                        }
                        dT = dSet.Tables[1];
                        enableRowsForEdit = (string.Compare(dT.Rows[0][0].ToString(), "Yes", true) == 0) ? true : false;
                    }
                    else
                    {
                        UIManager.ShowMessage(MsgCodes.ValueReqd, "Sewa ", MessageTypes.Warning);
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
            //foreach (DCCGridColumn col in this.grdTeamWiseDailyAttendance.Columns)
            //{
            //    if (string.Compare(col.Name, GridColumns.grd_full_nm.ToString()) != 0 &&
            //       string.Compare(col.Name, "serial_id") != 0)
            //        col.ReadOnly = val;
            //}
        }

        private void grdTeamWiseDailyAttendance_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            //if (this.grdTeamWiseDailyAttendance.GetVisibleRowsCount() > 0)
            //{
            //    if (this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_a.ToString()
            //        || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_e.ToString()
            //        || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_l.ToString()
            //        || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_p.ToString()
            //        )
            //    {
            //        if (this.grdTeamWiseDailyAttendance.AsBln(e.ColumnIndex, e.RowIndex).Value)
            //        {
            //            updateAttendance(e.RowIndex, this.grdTeamWiseDailyAttendance.Columns[e.ColumnIndex].Name);
            //        }
            //    }
            //}
            makeColumnsReadOnly(false);
        }

        private void sewadarHeader1_SewadarLookupDailogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString + " AND EXISTS( SELECT 1 from sewa_team_wise_sewadars st WHERE st.sewadar_grno = vs.sewadar_grno AND st.satsang_centre_id = vs.satsang_centre_id )";
        }

        private void sewaLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["finish_dt"]);
            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["start_dt"]);
        }

        private void sewaTeamsLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.sewaLookup1.IdText))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("2=2", "ss.sewa_id = " + this.sewaLookup1.IdText);
            }
        }

        private void grdTeamWiseDailyAttendance_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            bool enable = false;
            if (this.CurrentUIMode == UIModes.Insert)
            {
                enable = enableRowsForEdit;
            }
            else
            {
                enable = this.grdList.AsBln(GridColumns.enable.ToString()).Value;
            }
            if (this.grdTeamWiseDailyAttendance.GetVisibleRowsCount() > 0
                && enable)
            {
                if (this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_a.ToString()
                    || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_e.ToString()
                    || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_l.ToString()
                    || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.attendance_p.ToString()
                    )
                {
                    if (this.grdTeamWiseDailyAttendance.AsBln(e.ColumnIndex, e.RowIndex).Value)
                    {
                        this.grdTeamWiseDailyAttendance.SetCellValue(e.ColumnIndex, e.RowIndex, false);
                    }
                    else
                    {
                        this.grdTeamWiseDailyAttendance.SetCellValue(e.ColumnIndex, e.RowIndex, true);
                    }


                    if (this.grdTeamWiseDailyAttendance.AsBln(e.ColumnIndex, e.RowIndex).Value)
                    {
                        updateAttendance(e.RowIndex, this.grdTeamWiseDailyAttendance.Columns[e.ColumnIndex].Name);
                    }
                }
            }
        }

    }
}
