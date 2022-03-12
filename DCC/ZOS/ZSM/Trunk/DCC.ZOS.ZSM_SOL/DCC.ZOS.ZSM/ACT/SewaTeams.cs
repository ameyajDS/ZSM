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
using DCC.UMB.CDF.Lookup.Modal;
using DCC.ZOS.ZSM.Controls.Configuration;
using DCC.ZOS.ZSM.MSC;
using System.Data.SqlClient;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class SewaTeams : ZSMAbstractScreen
    {
        private enum GridColumns
        {
            sewadar_grno,
            appointment_dt,
            grd_satsang_centre_id,
            grd_only_satsang_centre_id,
            serial_id,
            department,
            sub_department_nm,
            full_nm,
            age,
            transfer_in_dt
        }

        private enum LookupColumns
        {
            sewadar_grno, 
            satsang_centre_id, 
            centre_nm,
            age, 
            appointment_dt,
            department_nm,
            sub_department_nm,
            full_nm
        }

        private enum GrdListColumns
        {
            start_dt,
            finish_dt,
            acceptance_ts
        }

        private ZSMStoredProcParamCreator _spParamCreator;

        public SewaTeams()
        {
            InitializeComponent();
            //ZSMUtility.MakeGridReadOnly(this.grdTeamWiseDailyAttendance);
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
            _spParamCreator = ZSMStoredProcParamCreator.GetInstance(dbFacade);
        }

        public override string ScreenId { get { return Screens.SETUP_SEWA_TEAMS; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        private void makeEditableOnlyInQueryMode(bool isQuery)
        {
            this.intID.ReadOnly = !isQuery;
        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
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

        private void LoadGrid()
        {
            DataTable dT = this.dbFacade.QuerySewaTeamWiseSewadar(this.intID.DisplayTextAsInteger).Tables[0];
            this.grdTeamWiseDailyAttendance.RetrieveRecords(dT, false, RowStates.Old);
        }

        protected override bool IsAValidScreenAction(string actionId)
        {
            switch (actionId)
            {
                case "Accept Team":
                    if (this.dtAcceptance.DisplayTextAsDateTime != null)
                    {
                        return false;
                    }
                    break;
            }
            return base.IsAValidScreenAction(actionId);
        }

        public override void ExecuteScreenAction(string actionId)
        {
            switch (actionId)
            {
                case "Accept Team":
                    byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
                    try
                    {
                        this.dbFacade.BeginTrans();

                        List<SqlParameter> param = AcceptSewaTeam_Params(this.intID.DisplayTextAsInteger, txn_ts);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("AcceptSewaTeam", param, 600);
                        ZSMUtility.LogAction(this, this.dbFacade, actionId+ "|"+ this.intID.DisplayText, null, this.sewaLookup1.IdTextAsInteger, null, null, null);
                        this.dbFacade.CommitTrans();
                        UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                    }
                    catch (Exception)
                    {
                        this.dbFacade.RollbackTrans();
                        throw;
                    }
                    break;
                case "Merge Teams":
                    UIManager.OpenForm(typeof(MergeSewaTeamsForASewa), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, this.intID.DisplayText + "|" + this.sewaLookup1.IdText, this, this);
                    break;
            }
        }

        public override void LoadBrowseView(int rowIndex)
        {
            makeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1, this.grdTeamWiseDailyAttendance, this.txtSatsangCentre);
            //[[ If acceptance is done, row cannot be deleted from the grid
            if (DbManager.IsNotNull(this.grdList.AsDTM(GrdListColumns.acceptance_ts.ToString(), rowIndex)))
            {
                this.grdTeamWiseDailyAttendance.DeleteRowMenuEnabled = false;
            }
            else
            {
                this.grdTeamWiseDailyAttendance.DeleteRowMenuEnabled = true;
            }
            //]]
            LoadGrid();
            this.ObjectIdForLogOperation = this.intID.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewaTeamSQLSelectQuery query = new ViewSewaTeamSQLSelectQuery();
            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.sewa_id.Equal(this.sewaLookup1.IdText);
            query.sewa_nm.Contains(this.sewaLookup1.DisplayText);
            query.sewa_team_id.Equal(this.intID.DisplayText);
            query.sewa_team_nm.Contains(this.txtTeamName.DisplayText);
            query.team_description.Contains(this.txtDescription.DisplayText);
            query.AddOrderByClause(query.sewa_team_id, OrderByTypes.DESC);
            query.AddOrderByClause(query.sewa_id, OrderByTypes.DESC);
            return dbFacade.ExecuteSelectQuery(query);
        }


        private List<string> SaveGridsAsTask()
        {
            List<string> allTasks = new List<string>();
            try
            {
                //[[ If acceptance is not done, sort by alphabetic order
                if (!DbManager.IsNotNull(this.grdList.AsDTM(GrdListColumns.acceptance_ts.ToString(), this.grdList.CurrentRowIndex)))
                {
                    allTasks.Add(this.dbFacade.DeleteAllSewaTeamWiseSewadarAsTask(this.intID.DisplayTextAsInteger));
                    DataTable dT = this.grdTeamWiseDailyAttendance.ExportGridModelData(false);
                    dT.Columns.Remove(ZSMConstants.ROW_STATE_COLUMN_NAME);
                    dT.Columns[GridColumns.grd_only_satsang_centre_id.ToString()].ColumnName = "satsang_centre_id";
                    dT.Columns[GridColumns.department.ToString()].ColumnName = "department_nm";
                    //[[ Removing sewadar_grno as its data is stored as LookupResult. Copying the content (String) to temporary column 
                    //   copy_of_sewadar_grno and renaming it back to sewadar_grno. The new sewadar_grno now contains String instead of LookupResult.
                    //   This will make RetrieveRecords to grdTeamWiseDailyAttendance behave correctly as it will store the string values
                    //   (instead of values of type LookupResult) in display and value menber properties of sewadar_grno lookup.
                    //   Similar thing for centre_nm column.
                    dT.Columns.Add("copy_of_sewadar_grno");
                    dT.Columns.Add("centre_nm");
                    foreach (DataRow sourcerow in dT.Rows)
                    {
                        sourcerow["copy_of_sewadar_grno"] = ((LookupResult)sourcerow[GridColumns.sewadar_grno.ToString()]).ValueMember;
                        sourcerow["centre_nm"] = ((LookupResult)sourcerow[GridColumns.grd_satsang_centre_id.ToString()]).DisplayMember;
                    }
                    dT.Columns.Remove("sewadar_grno");
                    dT.Columns["copy_of_sewadar_grno"].ColumnName = "sewadar_grno";
                    //]]
                    ZSMUtility.SortDataTable(dT, GridColumns.full_nm.ToString());
                    short id = 1;
                    foreach (DataRow sourcerow in dT.Rows)
                    {
                        sourcerow["serial_id"] = id;
                        id += 1;
                    }
                    this.grdTeamWiseDailyAttendance.RemoveAllRecords();
                    this.grdTeamWiseDailyAttendance.RetrieveRecords(dT, false, RowStates.New);
                }
                else
                {
                    int? id = this.dbFacade.FnGetMaxSerialId(this.intID.DisplayTextAsInteger);
                    foreach (DCCDataRowView row in this.grdTeamWiseDailyAttendance.GetRowsForState(RowStates.New))
                    {
                        this.grdTeamWiseDailyAttendance.SetCellValue("serial_id", row.RowIdentifier, id);
                        id += 1;
                    }
                }
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("sewa_team_id", this.intID.DisplayTextAsInteger);
                allTasks.AddRange(this.grdTeamWiseDailyAttendance.GetAllDBTasks(this.dbFacade, "DeleteSewaTeamWiseSewadarAsTask", "UpdateSewaTeamWiseSewadarAsTask", "InsertSewaTeamWiseSewadarAsTask", overiddingParamValues));
                return allTasks;
            }
            catch
            {
                throw;
            }
        }

        private bool HasGridChanged()
        {
            //[[ As only rows can be adde/deleted
            if (this.grdTeamWiseDailyAttendance.GetRowsForState(RowStates.New).Count == 0 &&
                this.grdTeamWiseDailyAttendance.GetRowsForState(RowStates.Deleted).Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
            //]]
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.AddDbTask(this.dbFacade.UpdateSewaTeamAsTask(this.intID.DisplayTextAsInteger, this.txtTeamName.DisplayText, this.txtDescription.DisplayText, txn_ts));
            if (HasGridChanged())
            {
                this.dbFacade.AddDbTasks(this.SaveGridsAsTask());
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.NoChanges, "", MessageTypes.Plain);
            }
            this.dbFacade.ExecuteDbTasks();
        }

        private void grdTeamWiseDailyAttendance_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {
            LookupResult res = new LookupResult();
            res.ValueMember = ZSMUtility.GetSatsangCentreId();
            res.DisplayMember = ZSMUtility.GetSatsangCentreName();
            this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.grd_satsang_centre_id.ToString(), e.RowIndex, res);
            this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.grd_only_satsang_centre_id.ToString(), e.RowIndex, ZSMUtility.GetSatsangCentreId());
        }

        private void grdTeamWiseDailyAttendance_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (DbManager.IsNotNull(this.sewaLookup1.IdTextAsInteger))
            {
                if (DbManager.IsNotNull(this.grdTeamWiseDailyAttendance.AsLookupResult(GridColumns.grd_satsang_centre_id.ToString())))
                {
                    object id = this.grdTeamWiseDailyAttendance.AsLookupResult(GridColumns.grd_satsang_centre_id.ToString()).ValueMember;
                    if ((this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.sewadar_grno.ToString())
                        || (this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.full_nm.ToString()))
                    {
                        if (DbManager.IsNotNull(id))
                        {
                            e.LookupSqlString = e.LookupSqlString.Replace("2=2", string.Format("sr.appointment_dt < (SELECT finish_dt FROM sewas WHERE sewa_id = '{0}') AND  vs.satsang_centre_id = '{1}'", this.sewaLookup1.IdTextAsInteger, id.ToString()));
                        }
                    }
                }
            }
        }

        private void grdTeamWiseDailyAttendance_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.sewadar_grno.ToString())
            {
                grdTeamWiseDailyAttendance.SetCellValue(GridColumns.full_nm.ToString(), e.LookupResult.SelectedRecords[0][LookupColumns.full_nm.ToString()]);
            }
            else if (this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.full_nm.ToString())
            {
                grdTeamWiseDailyAttendance.SetCellValue(GridColumns.sewadar_grno.ToString(), e.LookupResult.SelectedRecords[0][LookupColumns.sewadar_grno.ToString()]);
            }
            else if (this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.grd_satsang_centre_id.ToString())
            {
                this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.grd_only_satsang_centre_id.ToString(),
                    this.grdTeamWiseDailyAttendance.CurrentRowIndex, e.LookupResult.ValueMember);
            }
            //[[If joining(appointment) date > sewa start date, transfer_in_dt is set as appt date
            if (this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.sewadar_grno.ToString()
                || this.grdTeamWiseDailyAttendance.CurrentColumnName == GridColumns.full_nm.ToString())
            {
                grdTeamWiseDailyAttendance.SetCellValue(GridColumns.age.ToString(), e.LookupResult.SelectedRecords[0][LookupColumns.age.ToString()]);
                grdTeamWiseDailyAttendance.SetCellValue(GridColumns.department.ToString(), e.LookupResult.SelectedRecords[0][LookupColumns.department_nm.ToString()]);
                grdTeamWiseDailyAttendance.SetCellValue(GridColumns.sub_department_nm.ToString(), e.LookupResult.SelectedRecords[0][LookupColumns.sub_department_nm.ToString()]);
                DateTime? startDate = this.grdList.AsDTM(GrdListColumns.start_dt.ToString());
                if (DbManager.IsNotNull(startDate))
                {
                    if (startDate.Value < DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0][LookupColumns.appointment_dt.ToString()]).Value)
                    {
                        this.grdTeamWiseDailyAttendance.SetCellValue(GridColumns.transfer_in_dt.ToString(), DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0][LookupColumns.appointment_dt.ToString()]).Value);
                    }
                }
            }
            //]]
        }

        private void grdTeamWiseDailyAttendance_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            if (this.CurrentUIMode == UIModes.Browse)
            {
                if (this.grdList.CurrentRowIndex < 0)
                    return;
                if (DbManager.IsNotNull(this.grdList.AsDTM(GrdListColumns.acceptance_ts.ToString(), this.grdList.CurrentRowIndex)))
                {
                    if (this.grdTeamWiseDailyAttendance.GetRowState(this.grdTeamWiseDailyAttendance.CurrentRowIndex) == RowStates.None
                        || this.grdTeamWiseDailyAttendance.GetRowState(this.grdTeamWiseDailyAttendance.CurrentRowIndex) == RowStates.New)
                    {
                        if ((this.grdTeamWiseDailyAttendance.GetVisibleRowsCount() - this.grdTeamWiseDailyAttendance.GetRowsForState(RowStates.None).Count) > this.grdTeamWiseDailyAttendance.CurrentRowIndex)
                        {
                            e.Cancel = true;
                            this.sewaLookup1.Focus();
                            this.grdTeamWiseDailyAttendance.DeleteRow();
                            UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "row-addition|rows can only be added end of the grid", MessageTypes.Error);
                        }
                    }
                }
            }
        }

        public override bool DeleteData()
        {
            if (!DbManager.IsNotNull(this.grdList.AsDTM(GrdListColumns.acceptance_ts.ToString(), this.grdList.CurrentRowIndex)))
            {
                byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
                this.dbFacade.ClearDbTasks();
                this.dbFacade.AddDbTask(this.dbFacade.DeleteAllSewaTeamWiseSewadarAsTask(this.intID.DisplayTextAsInteger));
                this.dbFacade.AddDbTask(this.dbFacade.DeleteSewaTeamAsTask(this.intID.DisplayTextAsInteger, txn_ts));
                this.dbFacade.ExecuteDbTasks();
            }
            else
            {
                throw new DCCException(new Exception(""), MsgCodes.DeleteNotAllowed, "Record | as the team has been accepted.");
            }
            return true;
        }

        private void sewaLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }
        #region ActionParamCreation
        private List<SqlParameter> AcceptSewaTeam_Params(Int32? sewa_team_id, Byte[] txn_ts)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("sewa_team_id", sewa_team_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("txn_ts", txn_ts, ZSMStoredProcParamCreator.TIMESTAMP, ZSMStoredProcParamCreator.IN, p);
            return p;
        }
        #endregion
    }
}
