using System;
using System.Collections.Generic;
using System.Data;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.ZOS.ZSM;
using DCC.UMB.CDF.MGMT.Global;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.Utils;
using System.Collections;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace DCC.ZOS.ZSM.ENT
{
    partial class ScanningControlDates : ZSMAbstractScreen
    {
        private ZSMStoredProcParamCreator _spParamCreator;
        private DataTable ScanningJobTypes = null;


        public ScanningControlDates()
        {
            InitializeComponent();
            this.chkIsClosed.Enabled = false;
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_SCANNING_CONTROL_DATES;
            }
        }
        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            scanning_job_id,
            scanning_job_nm,
            controlling_dt,
            last_transfer_dtm,
            total_processed_cnt,
            is_closed,
            txn_ts,
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
            var dataset = dbFacade.QueryAllScanningJobTypes();
            ScanningJobTypes = dataset.Tables[0];
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
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
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

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = this.lkpJobName.IdText + "|" + this.dtControlingDate.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewScanningJobsControllingDateSQLSelectQuery query = new ViewScanningJobsControllingDateSQLSelectQuery();
            query.scanning_job_id.Equal(lkpJobName.IdTextAsInteger);
            query.controlling_dt.Equal(this.dtControlingDate.DisplayTextAsDateTime);
            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            return this.dbFacade.ExecuteSelectQuery(query);
        }


        public override void CreateData()
        {
            this.dbFacade.InsertScanningJobsControllingDate(this.lkpJobName.IdTextAsShort,
                                                         this.dtControlingDate.DisplayTextAsDateTime,
                                                         this.dtLastTransferDtm.DisplayTextAsDateTime,
                                                         this.intTotalProcessedCount.DisplayTextAsShort,
                                                         this.chkIsClosed.BlnString);
            this.ObjectIdForLogOperation = this.lkpJobName.IdText + "|" + this.dtControlingDate.DisplayText;
        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteScanningJobsControllingDate(this.lkpJobName.IdTextAsShort, this.dtControlingDate.DisplayTextAsDateTime, txn_ts);
            return true;
        }

        public override void ExecuteScreenAction(string actionId)
        {
            try
            {
                switch (actionId)
                {
                    case "Close":
                        this.dbFacade.BeginTrans();

                        this.dbFacade.CloseScanningJobDate(this.lkpJobName.IdTextAsShort,
                                                           this.dtControlingDate.DisplayTextAsDateTime);
                        ZSMUtility.LogAction(this, this.dbFacade, actionId + "|" + this.lkpJobName.IdTextAsInteger, null, null,
                            this.dtControlingDate.DisplayTextAsDateTime, null, null);
                        this.dbFacade.CommitTrans();
                        this.chkIsClosed.Checked = true;
                        UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                        break;
                    case "Open":
                        this.dbFacade.BeginTrans();
                        this.dbFacade.OpenScanningJobDate(this.lkpJobName.IdTextAsShort,
                                                           this.dtControlingDate.DisplayTextAsDateTime);
                        ZSMUtility.LogAction(this, this.dbFacade, actionId + "|" + this.lkpJobName.IdTextAsInteger, null, null,
                        this.dtControlingDate.DisplayTextAsDateTime, null, null);
                        this.dbFacade.CommitTrans();
                        UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                        this.chkIsClosed.Checked = false;
                        break;
                    case "Process":
                        this.dbFacade.BeginTrans();
                        List<SqlParameter> param = new List<SqlParameter>();
                        var procedureName = GetProcedureNameParam(param);
                        this.dbFacade.ObjDBManager.ExecuteStoredProc(procedureName, param, 600);
                        ZSMUtility.LogAction(this, this.dbFacade, actionId + "|" + this.lkpJobName.IdTextAsInteger, null, null,
                            this.dtControlingDate.DisplayTextAsDateTime, null, null);
                        this.dbFacade.CommitTrans();
                        UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
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

        private string GetProcedureNameParam(List<SqlParameter> param)
        {
            string procedureName = "";
            foreach (DataRow row in ScanningJobTypes.Rows)
            {
                if (row["scanning_job_type_cd"].ToString() == txtScanningJobTypeCd.ValueText)
                {
                    var datewisejob = row["is_date_wise"].ToString();
                    procedureName = row["procedure_nm"].ToString();
                    param.AddRange(PopulateSP_Params(this.lkpJobName.IdTextAsShort, this.dtControlingDate.DisplayTextAsDateTime, datewisejob, 
                        txtScanningJobTypeCd.ValueText == "AnnualSewa"));
                    break;
                }
            }
            return procedureName;
        }

        protected override bool IsAValidScreenAction(string actionId)
        {
            switch (actionId)
            {
                case "Close":
                    if (chkIsClosed.Checked != false)
                        return false;
                    break;
                case "Open":
                    if ((chkIsClosed.Checked == false && dtLastTransferDtm.DisplayTextAsDateTime == null))
                        return false;
                    break;
                default:
                    break;
            }

            return base.IsAValidScreenAction(actionId);
        }

        private void lkpJobName_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(1=2)", "sj.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        #region ActionParamCreation
        private List<SqlParameter> PopulateSP_Params(Int16? p_scanning_job_id,
                                                                            DateTime? p_controlling_dt, string datewise_job, bool addIsConcluded = false)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_scanning_job_id", p_scanning_job_id, ZSMStoredProcParamCreator.SMALLINT, ZSMStoredProcParamCreator.IN, p);
            if (datewise_job.ToLower().Equals("yes"))
            {
                _spParamCreator.CreateSqlParameter("p_controlling_dt", p_controlling_dt, ZSMStoredProcParamCreator.SMALLDATETIME, ZSMStoredProcParamCreator.IN, p);
            }
            if(addIsConcluded)
                _spParamCreator.CreateSqlParameter("p_isConcluded", 1, ZSMStoredProcParamCreator.SMALLINT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }
        #endregion

    }
}