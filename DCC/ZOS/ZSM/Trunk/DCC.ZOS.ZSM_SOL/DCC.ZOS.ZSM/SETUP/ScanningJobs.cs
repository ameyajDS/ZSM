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


namespace DCC.ZOS.ZSM.SETUP
{
    public partial class ScanningJobs : ZSMAbstractScreen
    {
        private int? satsangCentreId = ZSMUtility.GetSatsangCentreId();
        private string satsangCentreName = ZSMUtility.GetSatsangCentreName();
        private ZSMStoredProcParamCreator _spParamCreator;

        public ScanningJobs()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here

                return Screens.SETUP_SCANNING_JOBS;
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
            scanning_job_id,
            txn_ts
        }

        #endregion

        #region Nested type: grdSubJobColNames

        private enum grdSubJobColNames
        {
            scanning_sub_job_id,
            scanning_job_id,
            scanning_sub_job_nm,
            scanning_sub_job_sq
        }


        private enum ScanningJobTypeColNames
        {
            procedure_nm,
            status_system_info_cd,
            cnt_procedure_nm,
            effective_from,
            effective_till,
            Remarks
        }

        #endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
            _spParamCreator = ZSMStoredProcParamCreator.GetInstance(dbFacade);
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.intID.ReadOnly = true;
            this.chkIsClosed.Enabled = false;
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.ShowListView(this.scBrowseOrList, false);
                this.intTotalProcessedCnt.ReadOnly = true;
                this.dtLastTransferDtm.ReadOnly = true;
                this.chkIsConcluded.Enabled = false;
                this.chkIsClosed.Enabled = false;
                this.ShowListView(this.scBrowseOrList, false);

                //your custom after clearing the screen controls go here
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.txtSatsangCentre.ReadOnly = true;
                this.intID.ReadOnly = false;
                this.intTotalProcessedCnt.ReadOnly = false;
                this.dtLastTransferDtm.ReadOnly = false;
                this.chkIsConcluded.Enabled = true;
                this.chkIsClosed.Enabled = true;
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
            else if (uiMode == UIModes.Update)
            {
                this.txtName.Lookup = false;
            }
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewScanningJobSQLSelectQuery query = new ViewScanningJobSQLSelectQuery();

            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.scanning_job_id.Equal(this.intID.DisplayText);
            query.scanning_job_nm.Contains(this.txtName.DisplayText);
            query.scanning_job_type_cd.Contains(this.cmbScanningJobTypes.SelectedValueAsStr);
            query.sewa_id.Equal(this.lookupSewa.IdTextAsInteger);
            query.status_system_info_cd.Contains(this.lookupStatusSystemInfoCd.IdText);
            query.sewadar_list_id.Equal(this.lookupSewadarList.IdTextAsInteger);

        //  query.effective_from.LessThanEqualTo(this.dtmMainEffectiveRange.FromDate);
        //  query.effective_till.GreaterThanEqualTo(this.dtmMainEffectiveRange.ToDate);
            query.remarks.Contains(this.txtRemarks.DisplayText);

        //  query.last_transfer_dtm.Between(this.dtLastTransferDtm);
        //  query.total_processed_cnt.Equal(this.intTotalProcessedCnt.DisplayTextAsInteger);                                    

            query.is_closed.Equal(this.chkIsClosed.BlnString);
            query.is_concluded.Equal(this.chkIsConcluded.BlnString);
            query.is_deleting_allowed.Equal(this.chkIsDeletingAllowed.BlnString);
           
            query.AddOrderByClause(query.sewa_id, OrderByTypes.DESC);
            return dbFacade.ExecuteSelectQuery(query);
                        
        }

        public override void LoadBrowseView(int rowIndex)
        {
            this.chkIsClosed.Enabled = false;
            // All the Details, Retrive from Database are Display in all the fields through GridList.
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scBrowseOrList.Panel1,this.groupBox1,this.txtSatsangCentre);
            this.ObjectIdForLogOperation = this.intID.DisplayText;

            LoadScanningJobTypeData();
                       
            int ? intScanningJobId = this.grdList.AsInt(grdListColNames.scanning_job_id.ToString());
            this.LoadScanningSubJobGrid(intScanningJobId);

        }

        public override void ExecuteScreenAction(string actionId)
        {
            try
            {
                switch (actionId)
                {
                    case "Close":
                        this.dbFacade.BeginTrans();
                        this.dbFacade.CloseScanningJob(short.Parse(this.intID.ValueText));
                        ZSMUtility.LogAction(this, this.dbFacade, actionId + "|" + this.intID.IdTextAsInteger, null, null,
                            DateTime.Today, null, null);
                        this.dbFacade.CommitTrans();
                        UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                        this.chkIsClosed.Checked = true;
                        break;

                    case "Open":
                        this.dbFacade.BeginTrans();
                        this.dbFacade.OpenScanningJob(short.Parse(this.intID.ValueText));
                        ZSMUtility.LogAction(this, this.dbFacade, actionId + "|" + this.intID.IdTextAsInteger, null, null,
                            DateTime.Today, null, null);
                        this.dbFacade.CommitTrans();
                        UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                        this.chkIsClosed.Checked = false;
                        break;

                    case "Process":
                        this.dbFacade.BeginTrans();
                        List<SqlParameter> param = ReduceSewadarList_Params(short.Parse(this.intID.ValueText));
                        this.dbFacade.ObjDBManager.ExecuteStoredProc(txtProcedureName.DisplayText, param, 600);
                        ZSMUtility.LogAction(this, this.dbFacade, actionId + "|" + this.intID.IdTextAsInteger, null, null,
                            DateTime.Today, null, null);
                        this.dbFacade.CommitTrans();
                        UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
 //                     this.chkIsDeletingAllowed.Checked = true;
                        break;
                    default:
                        break;
                }
            }
            catch (Exception e)
            {
                this.dbFacade.RollbackTrans();
                throw e;
            }
        }

        protected override bool IsAValidScreenAction(string actionId)
        {
            if (!chkDateWise.Checked)
            {
                switch (actionId)
                {
                    case "Close":
                        if (chkIsClosed.Checked != false)
                            return false;
                        break;

                    case "Open":
                        if (chkIsConcluded.Checked == true)
                            return false;
                        break;

                    default:
                        break;
                }
                return true;
            }
            return false;
        }

        private void LoadScanningSubJobGrid(int? intScanningJobId)
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QueryScanningSubJobAsTask((short?)intScanningJobId));
            this.dbFacade.AddDbTask(this.dbFacade.QueryScanningJobsPeriodAsTask((short?)intScanningJobId));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable table = dSet.Tables[0];
            this.grdSubJob.RetrieveRecords(table, false, RowStates.Old);
            table = dSet.Tables[1];
            this.grdPeriods.RetrieveRecords(table, false, RowStates.Old);
        }

        public void ClearDetailView()
        {
            ClearAllControlsOfContainer(this, true);


        }

        public override void UpdateData()
        {
            this.dbFacade.ClearDbTasks();
            dbFacade.AddDbTasks(SaveAllGridAsTask(this.intID.DisplayTextAsShort));

            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());

            dbFacade.AddDbTask(this.dbFacade.UpdateScanningJobAsTask((short?)this.intID.DisplayTextAsShort.Value,
                                                satsangCentreId,                                                
                                                this.txtName.DisplayText,
                                                this.cmbScanningJobTypes.SelectedValueAsStr,
                                                this.txtRemarks.DisplayText,
                                                this.dtmMainEffectiveRange.FromDate,
                                                this.dtmMainEffectiveRange.ToDate,
                                                this.lookupSewadarList.IdTextAsInteger,
                                                this.lookupSewa.IdTextAsInteger,
                                                this.chkIsDeletingAllowed.BlnString,
                                                this.lookupStatusSystemInfoCd.IdText,
                                                this.dtLastTransferDtm.DisplayTextAsDateTime,
                                                this.intTotalProcessedCnt.DisplayTextAsShort,
                                                this.chkIsClosed.BlnString,
                                                this.chkIsConcluded.BlnString,                                             
                                                txn_ts
                                                ));
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.ExecuteDbTasks();
            //]]                

        }


        public override void CreateData()
        {
            short shtScanningJobId = default(short);
            this.dbFacade.InsertScanningJob(ref shtScanningJobId,                    
                                                satsangCentreId,
                                                this.txtName.DisplayText,
                                                this.cmbScanningJobTypes.SelectedValueAsStr,
                                                this.txtRemarks.DisplayText,
                                                this.dtmMainEffectiveRange.FromDate,
                                                this.dtmMainEffectiveRange.ToDate,
                                                this.lookupSewadarList.IdTextAsInteger,
                                                this.lookupSewa.IdTextAsInteger,
                                                this.chkIsDeletingAllowed.BlnString,
                                                this.lookupStatusSystemInfoCd.IdText,
                                                this.dtLastTransferDtm.DisplayTextAsDateTime,
                                                this.intTotalProcessedCnt.DisplayTextAsShort,
                                                this.chkIsClosed.BlnString,
                                                this.chkIsConcluded.BlnString
                                                
                                                );
            this.ObjectIdForLogOperation = shtScanningJobId.ToString();
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.AddDbTasks(SaveAllGridAsTask(shtScanningJobId));
            this.dbFacade.ExecuteDbTasks();
            //]] 

        }

        public override bool DeleteData()
        {
            short? intScanningJobId = this.grdList.AsShort(grdListColNames.scanning_job_id.ToString());
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());

            this.dbFacade.DeleteScanningJob(intScanningJobId, txn_ts);
            return true;
        }

        private List<string> SaveAllGridAsTask(short? shtScanningJobId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("scanning_job_id", shtScanningJobId);

                if (this.grdSubJob.Rows.Count > 0)
                {
                    allTasks = this.grdSubJob.GetAllDBTasks(this.dbFacade, "DeleteScanningSubJobAsTask", "UpdateScanningSubJobAsTask", "InsertScanningSubJobAsTask", overiddingParamValues, grdSubJobColNames.scanning_sub_job_sq.ToString(), "UpdateScanningSubJobSqAsTask", "MakeScanningSubJobSqPositiveAsTask");
                }
                allTasks.AddRange(this.grdPeriods.GetAllDBTasks(this.dbFacade, "DeleteScanningJobsPeriodAsTask", "UpdateScanningJobsPeriodAsTask", "InsertScanningJobsPeriodAsTask", overiddingParamValues));
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

        private void ScanningJobTypesCombo_SelectedValueChanged(object sender, EventArgs e)
        {
            LoadScanningJobTypeData();
        }

        private void LoadScanningJobTypeData()
        {
            DataTable dt;
            dt = this.dbFacade.QueryScanningJobTypes(this.cmbScanningJobTypes.SelectedValueAsStr).Tables[0];
            LoadDataToContainer(dt, groupBox1); 
        }

        private void cmbScanningJobTypes_SelectedValueChanged(object sender, EventArgs e)
        {
            if (CurrentUIMode == UIModes.Insert || CurrentUIMode == UIModes.Browse)
            {
                if (!String.IsNullOrEmpty(cmbScanningJobTypes.SelectedText) && !cmbScanningJobTypes.SelectedText.Equals("......."))
                {
                    DataSet ds = dbFacade.QueryScanningJobTypes(cmbScanningJobTypes.SelectedText);
                    DataRow row = ds.Tables[0].Rows[0];
                    txtProcedureName.DisplayText = row["procedure_nm"] as String;
                    txtStatusSysInfoCode.DisplayText = row["status_system_info_cd"] as String;
                    txtCountProcedureName.DisplayText = row["cnt_procedure_nm"] as String;
                    dtmEffectiveRange.FromDate = row["effective_from"] as DateTime?;
                    dtmEffectiveRange.ToDate = row["effective_till"] as DateTime?;
                    String boolHas_sub_jobs = row["has_sub_jobs"] as String;
                    if (boolHas_sub_jobs.Equals("Yes"))
                        chkSubJobs.Checked = true;
                    else
                        chkSubJobs.Checked = false;
                    String boolIsDateWise = row["is_date_wise"] as String;
                    if (boolHas_sub_jobs.Equals("Yes"))
                        chkDateWise.Checked = true;
                    else
                        chkDateWise.Checked = false;

                    txtRemarks.DisplayText = row["Remarks"] as String;
                }
                else
                {
                    txtProcedureName.DisplayText = "";
                    txtStatusSysInfoCode.DisplayText = "";
                    txtCountProcedureName.DisplayText = "";
                    dtmEffectiveRange.FromDate = null;
                    dtmEffectiveRange.ToDate = null;
                    txtRemarks.DisplayText = "";
                }
            }
        }

        #region ActionParamCreation
        private List<SqlParameter> ReduceSewadarList_Params(Int16? p_scanning_job_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_scanning_job_id", p_scanning_job_id, ZSMStoredProcParamCreator.SMALLINT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        #endregion
    }

}
