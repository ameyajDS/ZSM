using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
using System.IO;
using DCC.UMB.CDF.Lookup.Modal;

namespace DCC.ZOS.ZSM.ATT
{
    public partial class BadgeScan : ZSMAbstractScreen
    {
        private System.Threading.Timer clearHiddenTextTimer = null;
        private Boolean bHasSubJobs = false;
        private Boolean bDeletingAllowed = false;
        private bool bIsDateWise = true;
        private string check_in_sewadar_list = null;
        private string attendanceCountProcedureNm;

        public BadgeScan()
        {
            InitializeComponent();
            lkpJobName.Focus();
            this.txtSatsangCentreName.DisplayText = ZSMUtility.GetSatsangCentreName();
        }

        public override string ScreenId { get { return Screens.ACT_BADGE_SCANNING; } }

        public override DCCGrid ListViewGrid
        {
            get { return null; }
        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.txtSatsangCentreName.DisplayText = ZSMUtility.GetSatsangCentreName();
            this.btnStartStopScan.Enabled = false;
            this.chkRemoveScan.Enabled = false;
            this.txtSewadarAttendanceCount.Visible = false;
            this.txtTotalSewadarCount.Visible = false;
            attendanceCountProcedureNm = string.Empty;
            bIsDateWise = true;
            bDeletingAllowed = false;
        }

        public override void ShowScreen(DCC.UMB.CDF.Configuration.UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
        }


        private void btnStartStopScan_Click(object sender, EventArgs e)
        {

            if (btnStartStopScan.Text == "Start Scan")
            {
                if (lkpJobName.Mandatory == true && lkpJobName.DisplayText.Length == 0)
                {
                    UIManager.ShowMessage(MsgCodes.DetailsExpected, "Job Name", MessageTypes.Error);
                    return;
                }
                if (lkpSubJobName.Mandatory == true && lkpSubJobName.DisplayText.Length == 0)
                {
                    UIManager.ShowMessage(MsgCodes.DetailsExpected, "Sub Job Name", MessageTypes.Error);
                    return;
                }
                lkpJobName.ReadOnly = true;
                lkpSubJobName.ReadOnly = true;
                chkRemoveScan.Enabled = false;
                btnStartStopScan.Text = "Stop Scan";
                TimerCallback tcb = clearHıddenScannedGrNo;
                txtHiddenScannedGrNo.Focus();
                clearHiddenTextTimer = new System.Threading.Timer(tcb, null, 5000, 4000);
                this.chkRemoveScan.Enabled = false;
                String logObjId = "StartScan|" + lkpJobName.IdText + "|";
                if (lkpSubJobName.Enabled == true)
                {
                    logObjId += lkpSubJobName.IdText + "|";
                }
                logObjId += dtControlingDate.DisplayText;

                UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Action, logObjId);
            }
            else if (btnStartStopScan.Text == "Stop Scan")
            {
                if (clearHiddenTextTimer != null)
                {
                    btnStartStopScan.Text = "Start Scan";
                    clearHiddenTextTimer.Dispose();
                    clearHiddenTextTimer = null;
                    ClearAllControlsOfContainer(tlpScannedSewadarDetails, true, tlpBase);
                    this.ImgSewadarPhoto.SetImage(null);
                    lkpJobName.ReadOnly = false;
                    lkpSubJobName.ReadOnly = false;
                    if (bDeletingAllowed)
                        chkRemoveScan.Enabled = true;
                    UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, ".", MessageTypes.Plain);
                    this.txtSewadarAttendanceCount.Visible = false;
                    this.txtTotalSewadarCount.Visible = false;

                    String logObjId = "StopScan|" + lkpJobName.IdText + "|";
                    if (lkpSubJobName.Enabled == true)
                    {
                        logObjId += lkpSubJobName.IdText + "|";
                    }
                    logObjId += dtControlingDate.DisplayText;

                    UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Action, logObjId);
                }
            }
        }



        private delegate bool FocusDelegate();
        private delegate void ClearDelegate();

        public void clearHıddenScannedGrNo(Object stateInfo)
        {
            if (this.txtHiddenScannedGrNo.InvokeRequired)
            {
                this.txtHiddenScannedGrNo.Invoke(new FocusDelegate(this.txtHiddenScannedGrNo.Focus));
                this.txtHiddenScannedGrNo.Invoke(new ClearDelegate(this.txtHiddenScannedGrNo.Clear));
            }
            else
            {
                txtHiddenScannedGrNo.Focus();
                txtHiddenScannedGrNo.Clear();
            }
        }

        private void lkpJobName_Validate(object sender, EventArgs e)
        {
            this.txtSatsangCentreName.DisplayText = ZSMUtility.GetSatsangCentreName();
        }

        private void txtHiddenScannedGrNo_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtHiddenScannedGrNo.Text.Length == 9)
                {
                    String strSatsangCentreCode = txtHiddenScannedGrNo.Text.Substring(0, 3);
                    txtGRNo.DisplayText = txtHiddenScannedGrNo.Text.Substring(3, 6);
                    bool canScan = false;
                    if (!string.IsNullOrEmpty(check_in_sewadar_list) && check_in_sewadar_list.ToLower() == "yes")
                    {
                        int genericSewadarListId = GetGenericSewadarList();

                        if (genericSewadarListId > 0 &&
                            CheckForValidSewadar(txtGRNo.DisplayText, strSatsangCentreCode, genericSewadarListId))
                        {
                            canScan = true;
                        }
                        else
                            canScan = false;
                    }
                    else
                    {
                        canScan = true;
                    }
                    if (canScan)
                    {
                        Boolean bScanSuccessful = false;
                        if (chkRemoveScan.Checked == false)
                        {
                            this.dbFacade.BeginTrans();
                            bScanSuccessful = addScannedBadgeRecord();
                            this.dbFacade.CommitTrans();
                        }
                        else
                        {
                            string strDelSuccess = "No";
                            this.dbFacade.BeginTrans();
                            dbFacade.DeleteScannedBadge(this.lkpSubJobName.IdTextAsShort,
                                                        this.dtControlingDate.DisplayTextAsDateTime,
                                                        this.txtSatsangCentreId.DisplayTextAsInteger,
                                                        this.txtGRNo.DisplayText, ref strDelSuccess);
                            this.dbFacade.CommitTrans();
                            if (strDelSuccess.ToLower().Equals("yes"))
                            {
                                bScanSuccessful = true;
                            }
                            else
                            {
                                UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, "Error! No Record found to remove for this sub job", MessageTypes.Error);
                            }
                        }
                        if (bScanSuccessful)
                        {
                            LoadScannedSewadarInformation(txtGRNo.DisplayText, (int)this.txtSatsangCentreId.DisplayTextAsInteger);
                        }
                        else
                        {
                            ClearAllControlsOfContainer(tlpScannedSewadarDetails, true, tlpBase);
                            this.ImgSewadarPhoto.SetImage(null);
                        }
                    }
                    else
                    {
                        UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, "Cannot Record this sub job for this Sewadar", MessageTypes.Plain);
                        ClearAllControlsOfContainer(tlpScannedSewadarDetails, true, tlpBase);
                        this.ImgSewadarPhoto.SetImage(null);
                    }
                }
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                UIManager.ShowMessage(MsgCodes.InvalidMessage, ex.Message, MessageTypes.Warning);
                ClearAllControlsOfContainer(tlpScannedSewadarDetails, true, tlpBase);
                this.ImgSewadarPhoto.SetImage(null);
            }
        }

        private Boolean addScannedBadgeRecord()
        {
            String validating_action = "";
            String Label1 = "";
            Double count1 = 0;
            String Label2 = "";
            Int32 count2 = 0;
            String message = "";
            Boolean bSuccess = false;
            try
            {
                this.dbFacade.InsertUpdateScannedBadge(this.lkpSubJobName.IdTextAsShort,
                                                            this.dtControlingDate.DisplayTextAsDateTime,
                                                            this.txtSatsangCentreId.DisplayTextAsInteger,
                                                            this.txtGRNo.DisplayText,
                                                            attendanceCountProcedureNm,
                                                            ref validating_action,
                                                            ref Label1,
                                                            ref count1,
                                                            ref Label2,
                                                            ref count2,
                                                            ref message);


                bSuccess = takeValidationAction(validating_action);
                if (!string.IsNullOrEmpty(message))
                {
                    MessageBox.Show(message, string.Empty, MessageBoxButtons.OK);
                }
                if (!string.IsNullOrEmpty(Label1))
                {
                    this.txtSewadarAttendanceCount.Visible = true;
                    this.txtSewadarAttendanceCount.Title = Label1;
                    this.txtSewadarAttendanceCount.DisplayText = count1.ToString();
                }
                if (!string.IsNullOrEmpty(Label2))
                {
                    this.txtTotalSewadarCount.Visible = true;
                    this.txtTotalSewadarCount.Title = Label2;
                    this.txtTotalSewadarCount.DisplayText = count2.ToString();
                }
            }
            catch (Exception e)
            { }
            return bSuccess;
        }

        private static Boolean takeValidationAction(String validating_action)
        {
            switch (validating_action)
            {
                case "Error":
                    UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, "Error! Cannot record this sub job for sewadar", MessageTypes.Error);
                    return false;

                case "Move":
                    UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, "Deleted previous sub job and recorded new sub job successfully", MessageTypes.Plain);
                    break;
                case "Add":
                    UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, "Badge scanned and recorded successfully", MessageTypes.Plain);
                    break;
                case "No Action":
                    UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, "Already recorded", MessageTypes.Plain);
                    break;
                default:
                    break;
            }
            return true;
        }

        private int GetGenericSewadarList()
        {
            String sqlQuery = string.Format("SELECT sj.sewadar_list_id " +
                              "FROM	scanning_sub_jobs	ssj	JOIN	scanning_jobs	sj " +
                              "    ON	(ssj.scanning_job_id	=	sj.scanning_job_id)    " +
                              "WHERE	scanning_sub_job_id		=	" + lkpSubJobName.IdText);
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(sqlQuery).Tables[0];
            if (dT.Rows.Count > 0)
                return DbManager.GetInteger(dT.Rows[0]["sewadar_list_id"]);
            else
                return -1;
        }

        private Boolean CheckForValidSewadar(string sewadar_gr_no, string strSatsangCentreCode, int iGenericSewadarListId)
        {
            string sqlQuery = string.Format("select 1 from sewadars s " +
                                            "join satsang_centres_details cd on cd.satsang_centre_id = s.current_satsang_centre_id " +
                                            " and s.current_sewadar_grno = '{0}' and cd.centre_cd = '{1}'", sewadar_gr_no, strSatsangCentreCode);
            DataTable SewadarInSatsangCentreDT = this.dbFacade.ObjDBManager.ExecuteSQL(sqlQuery).Tables[0];

            if (SewadarInSatsangCentreDT.Rows.Count > 0)
            {
                sqlQuery = string.Format("SELECT COUNT(sewadar_grno) as sewadar_count " +
                            " FROM generic_sewadar_lists_sewadars gs  join satsang_centres_details cd on cd.satsang_centre_id = gs.satsang_centre_id " +
                            "WHERE	gs.sewadar_grno = '{0}' AND  cd.centre_cd = '{1}' AND gs.sewadar_list_id = {2}", sewadar_gr_no, strSatsangCentreCode, iGenericSewadarListId.ToString());
                DataTable genericSewadarListDT = this.dbFacade.ObjDBManager.ExecuteSQL(sqlQuery).Tables[0];

                if (DbManager.GetInteger(genericSewadarListDT.Rows[0]["sewadar_count"]) > 0)
                {
                    return true;
                }
            }
            return false;
        }

        private void LoadScannedSewadarInformation(String strSewadarGrno, int satsangCentreId)
        {
            //TODO: PHOTO NOT LOADING
            DataSet dsSewadarInfo = dbFacade.GetScannedSewadarInformation(strSewadarGrno, satsangCentreId);

            foreach (DataRow dtr in dsSewadarInfo.Tables[0].Rows)
            {
                txtFirstName.DisplayText = dtr["first_nm"].ToString();
                txtLastName.DisplayText = dtr["last_nm"].ToString();
                txtGender.DisplayText = dtr["gender"].ToString();
                txtSewadarStatus.DisplayText = dtr["current_sewadar_status_nm"].ToString();
                txtDepartment.DisplayText = dtr["current_department_nm"].ToString();
                txtSubDepartment.DisplayText = dtr["current_sub_department_nm"].ToString();
                txtAge.DisplayText = dtr["age"].ToString();
                if (!(dtr["sewadar_photo"] is DBNull))
                {
                    byte[] array = (byte[])dtr["sewadar_photo"];
                    this.ImgSewadarPhoto.SetImage(array);
                }
                else
                {
                    this.ImgSewadarPhoto.ClearControlValues();
                }
            }
        }

        private void lkpSubJobName_LookupDialogShowing(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "ss.scanning_job_id = " + lkpJobName.IdTextAsInteger.GetValueOrDefault(0));

        }

        private void lkpJobName_LookupResultSet(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs e)
        {
            this.dtJobStartFinish.FromDate = DbManager.GetDateTime(e.LookupResult.SelectedRecords[0]["effective_from"]);
            this.dtJobStartFinish.ToDate = DbManager.GetDateTime(e.LookupResult.SelectedRecords[0]["effective_till"]);
            bDeletingAllowed = DbManager.GetBool(e.LookupResult.SelectedRecords[0]["is_deleting_allowed"]);
            this.chkRemoveScan.Enabled = bDeletingAllowed;
            this.txtSatsangCentreId.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["satsang_centre_id"]);
            check_in_sewadar_list = DbManager.GetString(e.LookupResult.SelectedRecords[0]["check_in_sewadar_list"]);

            bIsDateWise = DbManager.GetBool(e.LookupResult.SelectedRecords[0]["is_date_wise"]);
            if (bIsDateWise)
            {
                this.dtControlingDate.DisplayTextAsDateTime = DbManager.GetDateTime(e.LookupResult.SelectedRecords[0]["controlling_dt"]);
                dtControlingDate.Visible = true;
            }
            else
            {
                this.dtControlingDate.DisplayTextAsDateTime = DateTime.Today;
            }

            this.bHasSubJobs = DbManager.GetBool(e.LookupResult.SelectedRecords[0]["has_sub_jobs"]);
            if (bHasSubJobs)
            {
                lkpSubJobName.Mandatory = true;
                lkpSubJobName.Enabled = true;
            }
            else
            {
                lkpSubJobName.Mandatory = false;
                lkpSubJobName.Enabled = false;
            }
            string sqlQuery = string.Format("SELECT COUNT(*) as sub_job_count FROM scanning_sub_jobs " +
                            "WHERE	scanning_job_id = '{0}' ", DbManager.GetShort(e.LookupResult.SelectedRecords[0]["scanning_job_id"]));
            DataTable dTsubJobCount = this.dbFacade.ObjDBManager.ExecuteSQL(sqlQuery).Tables[0];

            if (DbManager.GetInteger(dTsubJobCount.Rows[0]["sub_job_count"]) == 1)
            {
                sqlQuery = string.Format("SELECT scanning_sub_job_id, scanning_sub_job_nm FROM scanning_sub_jobs " +
                        "WHERE	scanning_job_id = '{0}' ", DbManager.GetShort(e.LookupResult.SelectedRecords[0]["scanning_job_id"]));
                DataTable dTsubJobs = this.dbFacade.ObjDBManager.ExecuteSQL(sqlQuery).Tables[0];
                this.lkpSubJobName.SetControlValues(DbManager.GetString(dTsubJobs.Rows[0]["scanning_sub_job_nm"]),
                    DbManager.GetString(dTsubJobs.Rows[0]["scanning_sub_job_nm"]),
                    DbManager.GetString(dTsubJobs.Rows[0]["scanning_sub_job_id"]));
            }
            attendanceCountProcedureNm = DbManager.GetString(e.LookupResult.SelectedRecords[0]["cnt_procedure_nm"]);
            this.btnStartStopScan.Enabled = true;

        }

        private void lkpJobName_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (lkpJobName.DisplayText.Length == 0)
            {
                dtJobStartFinish.ClearControlValues();
                chkRemoveScan.Enabled = false;
            }
        }

        private void tlpTop_Paint(object sender, PaintEventArgs e)
        {

        }

        protected override void OnFormClosing(FormClosingEventArgs e)
        {
            if (clearHiddenTextTimer != null)
            {
                clearHiddenTextTimer = null;
            }
            base.OnFormClosing(e);
        }

        private void lkpJobName_LookupDialogShowing(object sender, UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            ClearControls();
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "sj.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void tlpScannedSewadarDetails_Paint(object sender, PaintEventArgs e)
        {

        }

    }
}
