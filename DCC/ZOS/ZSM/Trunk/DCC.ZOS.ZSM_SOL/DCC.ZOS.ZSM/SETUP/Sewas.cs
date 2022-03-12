using System;
using System.Collections;
using System.Data;
using DCC.DBFacade;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.MGMT.Global;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Data.SqlClient;
using DCC.ZOS.ZSM.MSC;


namespace DCC.ZOS.ZSM.SETUP
{
    public partial class Sewas : ZSMAbstractScreen
    {
        private int? satsangCentreId = ZSMUtility.GetSatsangCentreId();
        private string satsangCentreName = ZSMUtility.GetSatsangCentreName();
        private ZSMStoredProcParamCreator _spParamCreator;


        public Sewas()
        {
            InitializeComponent();

        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here

                return Screens.SETUP_SEWAS;
            }
        }

        #region Nested type: grdStsngCentreColNames

        private enum grdStsngCentreColNames
        {
            grdSatsangCentres_sewa_id,
            grdSatsangCentres_satsang_centre_id,
            old_satsang_centre_id
        }

        #endregion

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            sewa_id,
            satsang_centre_id,
            sewa_cd,
            sewa_nm,
            start_dt,
            finish_dt,
            is_satsang_programme,
            is_scanner_used,
            is_leave_allowed,
            is_exemption_allowed,
            is_default_sewa,
            sewa_frequency,
            attendance_unit,
            attendance_marking,
            min_sewa_duration,
            max_sewa_duration,
            gents_born_after,
            ladies_born_after,
            referred_sewa_id,
            attendance_ts,
            summary_ts,
            deleted_ts,
            locked_dtm,
            txn_ts
        }

        #endregion

        #region Nested type: grdShiftColNames

        private enum grdShiftColNames
        {
            sewa_shift,
            old_sewa_shift,
            sewa_shift_sq,
            credit_cnt,
            unit_cnt
        }

        #endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
            this.cmbAttendanceUnit.SetDataSource(this.dbFacade.ObjDBManager.ExecuteSQL("select attendance_unit from attendance_units WHERE (GETDATE() BETWEEN effective_from AND effective_till)").Tables[0]
                , "attendance_unit", "attendance_unit");
            this.cmbSewaFrequency.SetDataSource(this.dbFacade.ObjDBManager.ExecuteSQL("select sewa_frequency from sewa_frequencies WHERE (GETDATE() BETWEEN effective_from AND effective_till)").Tables[0]
                , "sewa_frequency", "sewa_frequency");
            var sewaShiftTable = this.dbFacade.ObjDBManager.ExecuteSQL("select sewa_shift from sewa_shifts where GETDATE() between effective_from AND effective_till").Tables[0];
            this.grdShiftCombination.SetComboBoxColumnDataSource("recorded_sewa_shift", sewaShiftTable, "sewa_shift", "sewa_shift");
            this.grdShiftCombination.SetComboBoxColumnDataSource("recording_sewa_shift", sewaShiftTable, "sewa_shift", "sewa_shift");
            _spParamCreator = ZSMStoredProcParamCreator.GetInstance(dbFacade);
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);

            if (uiMode == UIModes.Insert)
            {
                this.intID.ReadOnly = true;
                ClearControls();
                this.ShowListView(this.scBrowseOrList, false);
                //your custom after clearing the screen controls go here
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intID.ReadOnly = false;
                this.txtSatsangCentre.ReadOnly = true;
                this.ShowListView(this.scBrowseOrList, false);
            }
            else if (uiMode == UIModes.Retrieve)
            {
                this.txtSatsangCentre.ReadOnly = true;
                ClearControls();
            }
            else if (uiMode == UIModes.List)
            {
                this.ShowListView(this.scBrowseOrList, true);
            }
            else if (uiMode == UIModes.Browse)
            {
                this.ShowListView(this.scBrowseOrList, false);
            }
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewasSQLSelectQuery query = new ViewSewasSQLSelectQuery();

            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.sewa_id.Equal(this.intID.DisplayText);
            query.sewa_nm.Contains(this.txtName.DisplayText);
            query.sewa_cd.Contains(this.txtCode.DisplayText);
            query.start_dt.LessThanEqualTo(this.dtmEffectiveRange.FromDate);
            query.finish_dt.GreaterThanEqualTo(this.dtmEffectiveRange.ToDate);

            query.is_satsang_programme.Equal(this.chkSatsangProgramme.BlnString);
            query.is_scanner_used.Equal(this.chkScannerUsed.BlnString);
            query.is_leave_allowed.Equal(this.chkLeaveAllowed.BlnString);
            query.is_exemption_allowed.Equal(this.chkExemptionAllowed.BlnString);
            query.is_default_sewa.Equal(this.chkIsDefaultSewa.BlnString);

            query.sewa_frequency.Contains(this.cmbSewaFrequency.SelectedValueAsStr);
            query.attendance_unit.Contains(this.cmbAttendanceUnit.SelectedValueAsStr);
            query.attendance_marking.Contains(this.cmbAttendanceMarking.SelectedValueAsStr);

            query.min_sewa_duration.Equal(this.intMinSewaDuration.DisplayTextAsInteger);
            query.max_sewa_duration.Equal(this.intMaxSewaDuration.DisplayTextAsInteger);

            query.gents_born_after.GreaterThanEqualTo(this.dtGentsBornAfter.DisplayTextAsDateTime);
            query.ladies_born_after.GreaterThanEqualTo(this.dtladiesBornAfter.DisplayTextAsDateTime);

            query.referred_sewa_id.Equal(this.lookupReferredSewa.IdTextAsInteger);

            //query.attendance_ts.Between(this.dtAttendance);
            //query.summary_ts.Between(this.dtSummary);
            //query.deleted_ts.Between(this.dtDeleted);
            //query.locked_dtm.Between(this.dtLocked);

            query.AddOrderByClause(query.sewa_id, OrderByTypes.DESC);
            return dbFacade.ExecuteSelectQuery(query);

        }

        public override bool IsReadyToSave()
        {
            if (this.CurrentUIMode == UIModes.Insert)
            {
                //A record is automatically inserted for the Satsang Centre for whose the Sewa is being created.
                if (this.grdSatsangCentres.Rows.Count == 0)
                {
                    DataTable dT = new DataTable();
                    dT.Columns.Add("satsang_centre_id", typeof(int));
                    dT.Columns.Add("satsang_centre_nm");
                    dT.Columns.Add("old_satsang_centre_id");
                    dT.Rows.Add(ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName(), null);
                    this.grdSatsangCentres.RetrieveRecords(dT, false, RowStates.New);
                }

                if (string.Compare(this.cmbAttendanceMarking.SelectedValueAsStr, "Arbitrary", true) == 0
    || string.Compare(this.cmbAttendanceMarking.SelectedValueAsStr, "Team-wise", true) == 0)
                {
                    DataTable dT = new DataTable();
                    dT.Columns.Add("start_dt");
                    dT.Columns.Add("finish_dt");
                    dT.Columns.Add("old_start_dt");
                    dT.Columns.Add("old_finish_dt");
                    dT.Rows.Add(this.dtmEffectiveRange.FromDate, this.dtmEffectiveRange.ToDate, null, null);
                    this.grdPeriods.RetrieveRecords(dT, false, RowStates.New);
                }
            }
            //]]
            bool retVal = true;
            //[[These two can be provided for only such Sewas 
            //(a) whose Finish Date is in future and (b) Referred Sewa is NOT specified.
            if (!string.IsNullOrEmpty(this.txtTraineeSeq.DisplayText) || !string.IsNullOrEmpty(this.txtOpenSewadarSeq.DisplayText))
            {
                if (!string.IsNullOrEmpty(this.lookupReferredSewa.IdText) || this.dtmEffectiveRange.ToDate <= ZSMUtility.GetDate())
                {
                    UIManager.ShowMessage(MsgCodes.ValueNotReqdSpecs, "Open Sewadar Seq. or Trainee Seq.|a string value|either Finish Date is not in future or Referred Sewa is specified", MessageTypes.Error);
                    retVal = false;
                }
            }
            return retVal && base.IsReadyToSave();
            //]]
        }
        protected override bool IsAValidScreenAction(string actionId)
        {
            if (this.dtDeleted.DisplayTextAsDateTime != null)
                return false;
            switch (actionId)
            {
                //enabled only when (a) either of the two or both prefixes are specified, and (b) Sewa Finish Date is in past.
                case "Deactivate Sewadars":
                    if ((!string.IsNullOrEmpty(this.txtOpenSewadarSeq.DisplayText) || !string.IsNullOrEmpty(this.txtTraineeSeq.DisplayText))
                        && this.dtmEffectiveRange.ToDate < ZSMUtility.GetDate())
                        return true;
                    else
                        return false;


                case "Accept All Teams":
                    if (string.Compare("Team-wise", this.cmbAttendanceMarking.DisplayText, true) != 0)
                    {
                        return false;
                    };
                    break;

                case "Lock Sewa":
                    if (this.dtLocked.DisplayTextAsDateTime != null)
                    {
                        return false;
                    }
                    break;

                case "Unlock Sewa":
                    if (this.dtLocked.DisplayTextAsDateTime == null)
                    {
                        return false;
                    }
                    break;

                case "Summarise Sewa":
                    if (string.Compare("Summary", this.cmbAttendanceMarking.DisplayText, true) == 0)
                    {
                        return false;
                    };
                    break;

                case "Archive Sewa":
                    if (string.Compare("Summary", this.cmbAttendanceMarking.DisplayText, true) == 0
                        || string.Compare("Computed", this.cmbAttendanceMarking.DisplayText, true) == 0
                       )
                    {
                        return false;
                    };
                    break;

                case "Make Sewa Teams":
                case "Make Area-wise Sewa Teams":
                case "Make NI Sewa Teams":
                    if (!this.cmbAttendanceMarking.DisplayText.Equals("Team-wise")
                        || this.dtLocked.DisplayTextAsDateTime != null)
                    {
                        return false;
                    }
                    break;
            }
            return base.IsAValidScreenAction(actionId);
        }



        public override void ExecuteScreenAction(string actionId)
        {
            DialogResult result = MessageBox.Show(this, "Do you want to " + actionId + "?",
                          "Information",
                          MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation,
                          MessageBoxDefaultButton.Button1);
            if (result == DialogResult.No)
            {
                return;
            }
            try
            {
                this.dbFacade.BeginTrans();
                switch (actionId)
                {
                    case "Deactivate Sewadars":
                        List<SqlParameter> param = DeactivateOpenAndTraineesForSewa_Params(this.intID.DisplayTextAsInteger);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("DeactivateOpenAndTraineesForSewa", param, 600);
                        break;
                    case "Accept All Teams":
                        byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
                        param = AcceptAllSewaTeams_Params(this.intID.DisplayTextAsInteger, txn_ts);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("AcceptAllSewaTeams", param, 600);
                        break;
                    case "Lock Sewa":
                        this.dbFacade.LockSewa(this.intID.DisplayTextAsInteger);
                        break;
                    case "Unlock Sewa":
                        this.dbFacade.UnLockSewa(this.intID.DisplayTextAsInteger);
                        break;
                    case "Summarise Sewa":
                        param = SummariseSewa_Params(this.intID.DisplayTextAsInteger);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("SummariseSewa", param, 600);
                        break;
                    case "Archive Sewa":
                        param = ArchiveSewa_Params(this.intID.DisplayTextAsInteger);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("ArchiveSewa", param, 600);
                        break;

                    case "Make Sewa Teams":
                        param = MakeSewaTeams_Params(ZSMUtility.GetSatsangCentreId(), this.intID.DisplayTextAsInteger, null);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("MakeSewaTeams", param, 600);
                        break;

                    case "Make Area-wise Sewa Teams":
                        param = MakeAreaWiseSewaTeams_Params(ZSMUtility.GetSatsangCentreId(), this.intID.DisplayTextAsInteger, null);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("MakeAreaWiseSewaTeams", param, 600);
                        break;

                    case "Make NI Sewa Teams":
                        param = MakeNISewaTeams_Params(ZSMUtility.GetSatsangCentreId(), this.intID.DisplayTextAsInteger);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("MakeNISewaTeams", param, 600);
                        break;

                    case "Make Combined Sewa Teams":
                        UIManager.OpenForm(typeof(CreateTeamUsingSewadarListAndSewa), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, ZSMUtility.GetSatsangCentreId() + "|" + this.intID.IdText, this, this);
                        break;
                }
                ZSMUtility.LogAction(this, this.dbFacade, actionId, null, this.intID.DisplayTextAsInteger, null, null, null);
                this.dbFacade.CommitTrans();
                UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
            }
            catch (Exception)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
        }

        public override void LoadBrowseView(int rowIndex)
        {
            // All the Details, Retrive from Database are Display in all the fields through GridList.
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scBrowseOrList.Panel1);
            this.ObjectIdForLogOperation = this.intID.DisplayText;
            int? intSewaId = this.grdList.AsInt(grdListColNames.sewa_id.ToString());
            this.LoadAllGrids(intSewaId);
            changePeriodsGridProperty();
            this.intID.ReadOnly = true;
        }

        private void LoadAllGrids(int? intSewaId)
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewasSewaShiftAsTask(intSewaId));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewasSewaShiftCombinationsAsTask(intSewaId));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewasSatsangCentreAsTask(intSewaId));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewasPeriodAsTask(intSewaId));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable table = dSet.Tables[0];
            this.grdShift.RetrieveRecords(table, false, RowStates.Old);

            table = dSet.Tables[1];
            this.grdShiftCombination.RetrieveRecords(table, false, RowStates.Old);

            table = dSet.Tables[2];
            this.grdSatsangCentres.RetrieveRecords(table, false, RowStates.Old);

            table = dSet.Tables[3];
            this.grdPeriods.RetrieveRecords(table, false, RowStates.Old);
        }

        public void ClearDetailView()
        {
            ClearAllControlsOfContainer(this, true);
            txtCode.Focus();

        }

        public override void UpdateData()
        {
            this.dbFacade.ClearDbTasks();

            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());

            dbFacade.AddDbTask(this.dbFacade.UpdateSewaAsTask((int?)this.intID.DisplayTextAsInteger.Value,
                                                satsangCentreId,
                                                this.txtCode.DisplayText,
                                                this.txtName.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate,
                                                this.chkSatsangProgramme.BlnString,
                                                this.chkScannerUsed.BlnString,
                                                this.chkLeaveAllowed.BlnString,
                                                this.chkExemptionAllowed.BlnString,
                                                this.chkIsDefaultSewa.BlnString,
                                                this.cmbSewaFrequency.SelectedValueAsStr,
                                                this.cmbAttendanceUnit.SelectedValueAsStr,
                                                this.cmbAttendanceMarking.SelectedValueAsStr,
                                                (short?)this.intMinSewaDuration.DisplayTextAsInteger,
                                                (short?)this.intMaxSewaDuration.DisplayTextAsInteger,
                                                this.dtGentsBornAfter.DisplayTextAsDateTime,
                                                this.dtladiesBornAfter.DisplayTextAsDateTime,
                                                this.lookupReferredSewa.IdTextAsInteger,
                                                this.txtTraineeSeq.DisplayText,
                                                this.txtOpenSewadarSeq.DisplayText,
                                                txn_ts
                                                ));
            dbFacade.AddDbTasks(SaveAllGridAsTask((int?)this.intID.DisplayTextAsInteger));
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.ExecuteDbTasks();
            //]]                

        }


        public override void CreateData()
        {
            int intSewaId = default(int);
            this.dbFacade.InsertSewa(ref intSewaId,
                                        satsangCentreId,
                                        this.txtCode.DisplayText,
                                        this.txtName.DisplayText,
                                        this.dtmEffectiveRange.FromDate,
                                        this.dtmEffectiveRange.ToDate,
                                        this.chkSatsangProgramme.BlnString,
                                        this.chkScannerUsed.BlnString,
                                        this.chkLeaveAllowed.BlnString,
                                        this.chkExemptionAllowed.BlnString,
                                        this.chkIsDefaultSewa.BlnString,
                                        this.cmbSewaFrequency.SelectedValueAsStr,
                                        this.cmbAttendanceUnit.SelectedValueAsStr,
                                        this.cmbAttendanceMarking.SelectedValueAsStr,
                                        (short?)this.intMinSewaDuration.DisplayTextAsInteger,
                                        (short?)this.intMaxSewaDuration.DisplayTextAsInteger,
                                        this.dtGentsBornAfter.DisplayTextAsDateTime,
                                        this.dtladiesBornAfter.DisplayTextAsDateTime,
                                        this.lookupReferredSewa.IdTextAsInteger,
                                        this.txtTraineeSeq.DisplayText,
                                        this.txtOpenSewadarSeq.DisplayText
                                                );
            this.ObjectIdForLogOperation = intSewaId.ToString();
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.AddDbTasks(SaveAllGridAsTask(intSewaId));
            this.dbFacade.ExecuteDbTasks();
            //]] 

        }

        public override bool DeleteData()
        {
            int? intSewaId = this.grdList.AsInt(grdListColNames.sewa_id.ToString());
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());

            this.dbFacade.DeleteSewa(intSewaId, ZSMUtility.GetSatsangCentreId(), txn_ts);
            return true;
        }

        private List<string> SaveAllGridAsTask(int? intSewaId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("sewa_id", intSewaId);

                allTasks.Add(this.dbFacade.DeleteSewasSewaShiftCombinationsAsTask(intSewaId));
                if (this.grdShift.Rows.Count > 0)
                {
                    allTasks.AddRange(this.grdShift.GetAllDBTasks(this.dbFacade, "DeleteSewasSewaShiftAsTask", "UpdateSewasSewaShiftAsTask", "InsertSewasSewaShiftAsTask", overiddingParamValues, grdShiftColNames.sewa_shift_sq.ToString(), "UpdateSewasSewaShiftSqAsTask", "MakeSewasSewaShiftSqPositiveAsTask"));
                }
                if (this.grdShiftCombination.Rows.Count > 0)
                {                    
                    foreach (DataGridViewRow row in grdShiftCombination.Rows)
                    {
                        if (row.Cells[0].Value == null || row.Cells[1].Value == null)
                            continue;
                        allTasks.Add(this.dbFacade.InsertSewasSewaShiftCombinationAsTask(intSewaId, row.Cells[0].Value.ToString(), row.Cells[1].Value.ToString()));
                    }
                }
                if (this.grdSatsangCentres.Rows.Count > 0)
                {
                    allTasks.AddRange(this.grdSatsangCentres.GetAllDBTasks(this.dbFacade, "DeleteSewasSatsangCentreAsTask", "UpdateSewasSatsangCentreAsTask", "InsertSewasSatsangCentreAsTask", overiddingParamValues));
                }
                allTasks.AddRange(this.grdPeriods.GetAllDBTasks(this.dbFacade, "DeleteSewasPeriodAsTask", "UpdateSewasPeriodAsTask", "InsertSewasPeriodAsTask", overiddingParamValues));
                return allTasks;
            }
            catch
            {
                throw;
            }

        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.txtSatsangCentre.DisplayText = satsangCentreName;
        }

        private void cmbAttendanceMarking_SelectedValueChanged(object sender, EventArgs e)
        {
            makeShiftGridReadOnly();
            changePeriodsGridProperty();
        }

        private void changePeriodsGridProperty()
        {
            if (this.CurrentUIMode == UIModes.Insert)
            {
                this.grdPeriods.RemoveAllRecords();
            }
        }

        private void cmbAttendanceUnit_SelectedValueChanged(object sender, EventArgs e)
        {
            makeShiftGridReadOnly();
        }

        private void makeShiftGridReadOnly()
        {
            bool makeReadOnly = true;
            if (DbManager.IsNotNull(this.cmbAttendanceMarking.SelectedValue) && DbManager.IsNotNull(this.cmbAttendanceUnit.SelectedValue))
            {
                if (string.Compare(this.cmbAttendanceMarking.SelectedValueAsStr, "Arbitrary", true) == 0
                    && string.Compare(this.cmbAttendanceUnit.SelectedValueAsStr, "Shift", true) == 0)
                {
                    makeReadOnly = false;
                }
            }
            if (makeReadOnly)
            {
                ZSMUtility.MakeGridReadOnly(this.grdShift);
                ZSMUtility.MakeGridReadOnly(this.grdShiftCombination);
            }
            else
            {
                ZSMUtility.MakeGridNotReadOnly(this.grdShift);
                ZSMUtility.MakeGridNotReadOnly(this.grdShiftCombination);
            }
        }

        private void grdPeriods_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {
            //DateTime dtStart = this.dtmEffectiveRange.FromDate.GetValueOrDefault(DateTime.Today.Date);
            //this.grdPeriods.SetCellValue("grd_start_dt", e.RowIndex, dtStart);
            //DateTime dtEnd = this.dtmEffectiveRange.ToDate.GetValueOrDefault(DateTime.Parse("June 6, 2079"));
            //this.grdPeriods.SetCellValue("grd_finish_dt", e.RowIndex, dtEnd);
        }

        #region ActionParamCreation

        private List<SqlParameter> DeactivateOpenAndTraineesForSewa_Params(Int32? p_sewa_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> AcceptAllSewaTeams_Params(Int32? sewa_id,
                                                                Byte[] txn_ts)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("sewa_id", sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("txn_ts", txn_ts, ZSMStoredProcParamCreator.TIMESTAMP, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> SummariseSewa_Params(Int32? p_sewa_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> ArchiveSewa_Params(Int32? p_sewa_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> MakeSewaTeams_Params(Int32? p_satsang_centre_id,
                                                            Int32? p_sewa_id,
                                                            Int32? p_sewadar_list_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_satsang_centre_id", p_satsang_centre_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> MakeAreaWiseSewaTeams_Params(Int32? p_satsang_centre_id,
                                                            Int32? p_sewa_id,
                                                            Int32? p_sewadar_list_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_satsang_centre_id", p_satsang_centre_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> MakeNISewaTeams_Params(Int32? p_satsang_centre_id,
                                                                Int32? p_sewa_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_satsang_centre_id", p_satsang_centre_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }
        #endregion

        private void grdPeriods_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

    }
}
