using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
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
using DCC.UMB.CDF.Lookup.Modal;
using System.Windows.Forms;


namespace DCC.ZOS.ZSM.SETUP
{
    public partial class ScanningJobsValidations : ZSMAbstractScreen
    {
        private int? satsangCentreId = ZSMUtility.GetSatsangCentreId();
        private string satsangCentreName = ZSMUtility.GetSatsangCentreName();

        public ScanningJobsValidations()
        {
            InitializeComponent();
            this.grdValidations.InsertRowsMenuItemsEnabled = false;
            this.grdValidations.DeleteRowMenuEnabled = false;
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here

                return Screens.SETUP_SCANNING_JOBS_VALIDATIONS;
            }
        }

        #region Nested type: grdValidationColNames

        private enum grdValidationColNames
        {
            recorded_sub_job_nm,
            recording_sub_job_nm,
            validating_action
        }

        #endregion

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            scanning_job_id,
            txn_ts
        }

        #endregion

        #region Nested type: grdValidCombinationColNames

        private enum grdValidCombinationColNames
        {
            scanning_job_valid_sq,
            valid_combination_sub_job_ids,
            old_valid_combination_sub_job_ids
        }

        #endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);

            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.ShowListView(this.scBrowseOrList, false);

                //your custom after clearing the screen controls go here
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
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
            ViewScanningJobSQLSelectQuery query = new ViewScanningJobSQLSelectQuery();

            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.scanning_job_id.Equal(this.lookupScanningJob.IdTextAsInteger);

            query.scanning_job_type_cd.Contains(this.cmbScanningJobTypes.SelectedValueAsStr);
            query.sewa_id.Equal(this.lookupSewa.IdTextAsInteger);

            query.sewadar_list_id.Equal(this.lookupSewadarList.IdTextAsInteger);

            //query.AddOrderByClause(query.sewa_id, OrderByTypes.DESC);
            return dbFacade.ExecuteSelectQuery(query);

        }

        public override void LoadBrowseView(int rowIndex)
        {
            // All the Details, Retrive from Database are Display in all the fields through GridList.
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scBrowseOrList.Panel1, this.txtSatsangCentre);
            this.ObjectIdForLogOperation = this.lookupScanningJob.IdText;

            LoadAllGrids();

        }

        private void LoadAllGrids()
        {
            int? intScanningJobId = this.grdList.AsInt(grdListColNames.scanning_job_id.ToString());

            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QueryScanningSubJobsValidationAsTask((short?)intScanningJobId));
            this.dbFacade.AddDbTask(this.dbFacade.QueryScanningSubJobsValidCombinationAsTask((short?)intScanningJobId));

            DataSet dset = this.dbFacade.ExecuteDbTasks();
            this.grdValidations.RetrieveRecords(dset.Tables[0], false, RowStates.Old);

            this.grdValidCombinations.RetrieveRecords(dset.Tables[1], false, RowStates.Old);

        }

        public void ClearDetailView()
        {
            ClearAllControlsOfContainer(this, true);
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.UpdateScanningJobTxnTsAsTask(this.lookupScanningJob.IdTextAsShort, txn_ts));
            this.dbFacade.AddDbTasks(SaveAllGridAsTask());
            this.dbFacade.ExecuteDbTasks();

        }

        public override void CreateData()
        {
            this.ObjectIdForLogOperation = this.lookupScanningJob.IdText;
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTasks(SaveAllGridAsTask());
            this.dbFacade.ExecuteDbTasks();

        }

        public override bool DeleteData()
        {
            List<string> allTasks = new List<string>();
            if (grdValidations.Rows.Count > 0)
            {
                foreach (DataGridViewRow row in grdValidations.Rows)
                {
                    var recordedId = (Int16?)row.Cells[3].Value;
                    var recordingId = (Int16?)row.Cells[4].Value;
                    allTasks.Add(dbFacade.DeleteScanningSubJobsValidationAsTask(recordedId, recordingId));
                }
                dbFacade.AddDbTasks(allTasks);
                this.dbFacade.ExecuteDbTasks();
                MessageBox.Show("Deleted Scanning sub-job validations successfully.");
            }
            return true;
        }

        public override bool IsReadyToSave()
        {
            bool retVal = true;
            foreach (DCCDataRowView item in this.grdValidations.GetAllNonDeletedRows())
            {
                LookupResult a = item.AsLookupResult(grdValidationColNames.validating_action.ToString());
                if (string.IsNullOrEmpty(a.ValueMember.ToString()))
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "Validating action in Validations Grid", MessageTypes.Error);
                    retVal = false;
                    break;
                }
            }
            return retVal && base.IsReadyToSave();
        }

        private List<string> SaveAllGridAsTask()
        {
            List<string> allTasks = new List<string>();
            try
            {
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("scanning_job_id", this.lookupScanningJob.IdTextAsShort);

                if (this.grdValidations.Rows.Count > 0)
                {
                    allTasks = this.grdValidations.GetAllDBTasks(this.dbFacade, "DeleteScanningSubJobsValidationAsTask", "UpdateScanningSubJobsValidationAsTask", "InsertScanningSubJobsValidationAsTask", overiddingParamValues);
                }

                if (this.grdValidCombinations.Rows.Count > 0)
                {
                    allTasks.AddRange(this.grdValidCombinations.GetAllDBTasks(this.dbFacade, "DeleteScanningSubJobsValidCombinationAsTask", "UpdateScanningSubJobsValidCombinationAsTask", "InsertScanningSubJobsValidCombinationAsTask", overiddingParamValues, grdValidCombinationColNames.scanning_job_valid_sq.ToString(), "UpdateSubJobsValidCombinationSqAsTask", "MakeSubJobsValidCombinationSqPositiveAsTask"));
                }

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

        private void lookupScanningJob_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            short? intScanningJobId = this.lookupScanningJob.IdTextAsShort;

            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QueryScanningJobForInsertModeAsTask(intScanningJobId));
            this.dbFacade.AddDbTask(this.dbFacade.PopulateDefaultScanningSubJobsValidationAsTask(intScanningJobId));
            this.dbFacade.AddDbTask(this.dbFacade.QueryScanningSubJobsValidCombinationAsTask(intScanningJobId));

            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            LoadDataToContainer(dSet.Tables[0], this.tableLayoutPanel1, this.txtSatsangCentre);

            this.grdValidations.RetrieveRecords(dSet.Tables[1], false, RowStates.New);

            if (this.CurrentUIMode == UIModes.Insert)
            {
                this.grdValidCombinations.RetrieveRecords(dSet.Tables[2], false, RowStates.Old);
            }

        }

        private void lookupScanningJob_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (!string.IsNullOrEmpty(satsangCentreId.ToString()))
            {
                e.LookupSqlString += " AND satsang_centre_id = " + satsangCentreId;
            }
        }


    }
}
