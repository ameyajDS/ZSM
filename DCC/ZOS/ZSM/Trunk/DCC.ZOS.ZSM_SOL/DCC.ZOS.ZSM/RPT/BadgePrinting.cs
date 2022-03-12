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
using DCC.UMB.CDF.Report;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class BadgePrinting : ZSMBaseParametersScreen
    {
        private int startSq = 0;
        private int endSq = 0;
        private DataTable dT = null;
        private InformationType SelectedInformationType;

        private enum GridColumns
        {
            sewadar_grno,
            appointment_dt,
            grd_satsang_centre_id,
            department,
            full_nm,
            sewadar_id,
            full_department_nm,
            expiry_dt,
            printing_dtm,
            sewadar_status_nm,
            weekly_sewa_location_id,
            department_id,
            photo_dt,
            remarks
        }

        private enum InformationType
        {
            Sewadar,
            Number,
            Range
        }

        private string reportPath = default(string);

        public BadgePrinting()
        {
            InitializeComponent();
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
        }
        private int intBdgLstPrntDys = default(int);
        public override string ScreenId { get { return Screens.ACT_BADGE_PRINTING; } }

        public override DCCGrid ListViewGrid
        {
            get { return null; }
        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
            if (DbManager.IsNotNull(this.dbFacade))
            {
                DataSet dSet = this.dbFacade.ObjDBManager.ExecuteSQL("select system_info_value from system_information_values where system_info_cd = 'SttsActv' ; select system_info_value from system_information_values where system_info_cd = 'RtrAgeGnts' ; select system_info_value from system_information_values where system_info_cd = 'RtrAgeLds' ; select system_info_value from system_information_values where system_info_cd = 'BdgExpYr' ; select system_info_value from system_information_values where system_info_cd = 'BdgLstPrntDys'");
                DataTable dT = dSet.Tables[0];
                foreach (DataRow item in dT.Rows)
                {
                    //this.statusListBox1.SetSelected(ZSMUtility.GetIndexOfItem(this.statusListBox1, DbManager.GetString(item[0])), false);
                }
                dT = dSet.Tables[1];
                this.intGents.DisplayText = dT.Rows[0][0].ToString();
                dT = dSet.Tables[2];
                this.intLadies.DisplayText = dT.Rows[0][0].ToString();
                dT = dSet.Tables[3];
                this.intBadgeExpiryYear.DisplayText = dT.Rows[0][0].ToString();
                dT = dSet.Tables[4];
                intBdgLstPrntDys = int.Parse(DbManager.GetString(dT.Rows[0][0]));
            }
            this.txtDefaultRemarks.DisplayText = "Original";
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            ClearControls();
        }

        public override string ReportPath
        {
            get
            {
                return this.reportPath;
            }
        }

        public override string ReportServerURL
        {
            get
            {
                return null;
            }
        }

        public override object GetReportParameterValues(string parameterName)
        {
            switch (parameterName)
            {
                case "p_from_badge_id":
                case "p_from":
                    return startSq;
                case "p_till_badge_id":
                case "p_till":
                    return endSq;
                case "p_badge_template_id":
                    return this.badgeTemplateCombo1.SelectedValue;
                case "p_satsang_centre_id":
                    return ZSMUtility.GetSatsangCentreId();
            }
            return null;
        }
        private bool SafeToInvokeReport()
        {
            if (!this.ValidateAllControlsofContainer(this))
                return false;
            if (!this.chkBack.Checked && !this.chkFront.Checked)
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, "Either Front or Back ", MessageTypes.Error);
                return false;
            }
            return true;
        }
        internal string execStr = string.Empty;
        public bool InvokeReport()
        {
            try
            {
                this.dbFacade.BeginTrans();
                if (SelectedInformationType == InformationType.Range)
                {
                    startSq = int.Parse(txtFromValue.Text);
                    endSq = int.Parse(txtToValue.Text);
                }
                else
                {
                    DataSet dSet = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT IDENT_CURRENT('sewadars_badges') + 1");
                    startSq = (int)DbManager.GetDecimal(dSet.Tables[0].Rows[0][0]);
                    int count = 0;
                    this.dbFacade.AddDbTasks(this.SaveGridsAsTask(ref count));
                    endSq = startSq + (count - 1);
                    this.dbFacade.ExecuteDbTasks();
                    this.dbFacade.CommitTrans();
                }
                
                string s = Assembly.GetExecutingAssembly().Location;
                FileInfo fi = new FileInfo(s);
                if (SSRS_Enabled)
                {
                    this.reportPath = @fi.Directory.FullName + "\\RPT\\dummy.rdlc";
                }
                else
                {
                    this.reportPath = @fi.Directory.FullName + "\\RPT\\dummy.rpt";
                }

                if (this.chkFront.Checked)
                {
                    execStr += "EXEC " + dT.Rows[0]["procedure_nm_front"].ToString() + " "
                             + startSq + ", " + endSq + ", "
                             + ZSMUtility.GetSatsangCentreId() + ", " + this.badgeTemplateCombo1.SelectedValueAsStr + " ; ";
                }
                if (this.chkBack.Visible && this.chkBack.Checked)
                {
                    execStr += "EXEC " + dT.Rows[0]["procedure_nm_back"].ToString() + " "
                             + startSq + ", " + endSq + ", "
                             + ZSMUtility.GetSatsangCentreId() + ", " + this.badgeTemplateCombo1.SelectedValueAsStr + " ; ";
                }
                if (!string.IsNullOrEmpty(execStr))
                {
                    this.dbFacade.ObjDBManager.ExecuteSQL(execStr);
                }
                if (this.chkFront.Checked)
                {
                    string resultFile = dT.Rows[0]["report_file_nm_front"].ToString();
                    resultFile = resultFile.Substring(0, resultFile.IndexOf("."));
                    this.reportPath = this.reportPath.Replace("dummy", resultFile);
                    //  this.reportPath = this.reportPath.Replace("dummy.rpt", dT.Rows[0]["report_file_nm_front"].ToString());
                    if (GlobalAppVariables.AppContext.IsWebDBEnabled)
                    {
                        GlobalAppVariables.ObjMDIMain.FireWebReportPrint();
                    }
                    else
                    {
                        GlobalAppVariables.ObjMDIMain.FirePrint();
                    }
                }
                if (this.chkBack.Visible && this.chkBack.Checked)
                {
                    Form activeChild = null;
                    if (this.chkFront.Checked)
                    {
                        activeChild = GlobalAppVariables.ObjMDIMain.ActiveChild;
                        this.Activate();
                        if (SSRS_Enabled)
                        {
                            this.reportPath = @fi.Directory.FullName + "\\RPT\\dummy.rdlc";
                        }
                        else
                        {
                            this.reportPath = @fi.Directory.FullName + "\\RPT\\dummy.rpt";
                        }
                    }
                    string resultFile = dT.Rows[0]["report_file_nm_back"].ToString();
                    resultFile = resultFile.Substring(0, resultFile.IndexOf("."));
                    this.reportPath = this.reportPath.Replace("dummy", resultFile);
                    //this.reportPath = this.reportPath.Replace("dummy.rpt", dT.Rows[0]["report_file_nm_back"].ToString());
                    if (GlobalAppVariables.AppContext.IsWebDBEnabled)
                    {
                        GlobalAppVariables.ObjMDIMain.FireWebReportPrint();
                    }
                    else
                    {
                        GlobalAppVariables.ObjMDIMain.FirePrint();
                    }

                    if (activeChild != null)
                    {
                        activeChild.Activate();
                    }
                }
                LogPrintOperation();
            }
            catch
            {
                throw;
            }
            return true;
        }

        private void LogPrintOperation()
        {
            string operation = this.badgeTemplateCombo1.SelectedValueAsStr + "|" + startSq + "|" + endSq;
            ZSMUtility.LogAction(this, this.dbFacade, AudiLogActions.Print, operation, null, null, DateTime.Now, ZSMUtility.GetSatsangCentreId(), null);
        }
        public override DataTable GetReportDataTable(string tableName)
        {
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(execStr).Tables[0];
            return dT;
        }
        public override bool IsReadyToSave()
        {
            return base.IsReadyToSave() && SafeToInvokeReport();
        }

        public override void Save()
        {
            InvokeReport();
        }

        private List<string> SaveGridsAsTask(ref int count)
        {
            List<string> allTasks = new List<string>();
            try
            {
                count = this.grdSewadars.GetRowsForState(RowStates.New).Count;
                foreach (DCCDataRowView row in this.grdSewadars.GetRowsForState(RowStates.New))
                {
                    int id = 0;
                    allTasks.Add(this.dbFacade.InsertSewadarsBadgeAsTask(ref id, ZSMUtility.GetSatsangCentreId(), row.AsStr(GridColumns.sewadar_grno.ToString()),
                                                                         this.badgeTemplateCombo1.SelectedValueAsStr, row.AsShort(GridColumns.department_id.ToString()),
                                                                         row.AsInt(GridColumns.weekly_sewa_location_id.ToString()), this.chkFront.BlnString,
                                                                         this.chkBack.BlnString, new DateTime(int.Parse(row.AsStr(GridColumns.expiry_dt.ToString())), 12, 31),
                                                                         row.AsStr(GridColumns.remarks.ToString())));
                }
            }
            catch
            {
                throw;
            }
            return allTasks;
        }

        private void sewadarListLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            DataTable dT = this.dbFacade.QueryGenericSewadarListsSewadarForBadgePrinting(this.sewadarListLookup1.IdTextAsInteger, ZSMUtility.GetSatsangCentreId(), this.txtDefaultRemarks.DisplayText, this.badgeTemplateCombo1.SelectedValueAsStr,
                        this.intBadgeExpiryYear.DisplayText, this.intGents.DisplayTextAsInteger, this.intLadies.DisplayTextAsInteger).Tables[0];
            this.grdSewadars.RetrieveRecords(dT, false, RowStates.New);
            foreach (DCCDataRowView item in this.grdSewadars.GetRowsForState(RowStates.New))
            {
                this.makeRowBoldMarronIfPrintedRecently(item.RowIndex);
                this.makeRowBoldBrownIfBadgeExpiryIncorrect(item.RowIndex);
            }
        }

        private void grdTeamWiseDailyAttendance_LookupResultSet(object sender, LookupResultEventArgs e)
        {

            if (this.grdSewadars.CurrentColumnName == GridColumns.full_nm.ToString())
            {
                LookupResult res = new LookupResult();
                res.ValueMember = e.LookupResult.SelectedRecords[0]["sewadar_grno"];
                res.DisplayMember = e.LookupResult.SelectedRecords[0]["sewadar_grno"];
                this.grdSewadars.SetCellValue(GridColumns.sewadar_grno.ToString(), res);
            }
            else if (this.grdSewadars.CurrentColumnName == GridColumns.sewadar_grno.ToString())
            {
                LookupResult res = new LookupResult();
                res.ValueMember = e.LookupResult.SelectedRecords[0]["sewadar_grno"];
                res.DisplayMember = e.LookupResult.SelectedRecords[0][GridColumns.full_nm.ToString()];
                this.grdSewadars.SetCellValue(GridColumns.full_nm.ToString(), res);
            }
            if (this.grdSewadars.CurrentColumnName == GridColumns.full_nm.ToString()
            || this.grdSewadars.CurrentColumnName == GridColumns.sewadar_grno.ToString())
            {
                DataTable dT = this.dbFacade.QuerySewadarForBadgePrinting(e.LookupResult.SelectedRecords[0]["sewadar_grno"].ToString(), ZSMUtility.GetSatsangCentreId(), this.badgeTemplateCombo1.SelectedValueAsStr,
                    this.intBadgeExpiryYear.DisplayText, this.intGents.DisplayTextAsInteger, this.intLadies.DisplayTextAsInteger).Tables[0];
                this.grdSewadars.SetCellValue(GridColumns.photo_dt.ToString(), dT.Rows[0][GridColumns.photo_dt.ToString()]);
                this.grdSewadars.SetCellValue(GridColumns.department.ToString(), dT.Rows[0][GridColumns.full_department_nm.ToString()]);
                this.grdSewadars.SetCellValue(GridColumns.expiry_dt.ToString(), dT.Rows[0][GridColumns.expiry_dt.ToString()]);
                this.grdSewadars.SetCellValue(GridColumns.printing_dtm.ToString(), dT.Rows[0][GridColumns.printing_dtm.ToString()]);
                this.grdSewadars.SetCellValue(GridColumns.sewadar_status_nm.ToString(), dT.Rows[0][GridColumns.sewadar_status_nm.ToString()]);
                this.grdSewadars.SetCellValue(GridColumns.department_id.ToString(), dT.Rows[0][GridColumns.department_id.ToString()]);
                this.grdSewadars.SetCellValue(GridColumns.weekly_sewa_location_id.ToString(), dT.Rows[0][GridColumns.weekly_sewa_location_id.ToString()]);
                this.grdSewadars.SetCellValue(GridColumns.remarks.ToString(), this.txtDefaultRemarks.DisplayText);
            }
        }

        private void grdSewadars_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (this.grdSewadars.CurrentColumnName == GridColumns.full_nm.ToString()
                || this.grdSewadars.CurrentColumnName == GridColumns.sewadar_grno.ToString())
            {
                if (!e.LookupSqlString.Contains("badge_templates_sewadar_status"))
                {
                    e.LookupSqlString = e.LookupSqlString.Replace("WHERE", string.Format("JOIN badge_templates_sewadar_status bt " +
                                    "ON COALESCE(vs.global_sewadar_status_cd, vs.sewadar_status_cd) = bt.sewadar_status_cd " +
                                    " AND bt.badge_template_id = '{0}' " +
                                    " AND (   ( bt.sewadar_status_cd IN ('Trn', 'Open', 'Temp') ) " +
                                    "      OR ( bt.sewadar_status_cd  NOT IN ('Trn', 'Open') AND sp.sewadar_id IS NOT NULL ) " +
                                    "     ) " +
                                    " JOIN badge_templates btemp ON btemp.badge_template_id = bt.badge_template_id " +
                                    " WHERE  (btemp.are_outstation_sewadars_allowed = 'Yes' OR ( btemp.are_outstation_sewadars_allowed = 'No'    AND sr.is_outstation_sewadar = 'No')  ) AND ", this.badgeTemplateCombo1.SelectedValueAsStr));
                }
                e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", string.Format("(vs.satsang_centre_id = {0})", ZSMUtility.GetSatsangCentreId()));
            }
        }

        private void makeRowBoldMarronIfPrintedRecently(int rowIdx)
        {
            //[[When the date as shown Last Printed is within specified number of days 
            //as per System Information Code BdgLstPrntDys, the system shows the Last Printed date in Bold and Maroon colour. 
            DateTime? printDate = this.grdSewadars.AsDTM(GridColumns.printing_dtm.ToString(), rowIdx);
            if (printDate.HasValue)
            {
                if (printDate.Value.AddDays(intBdgLstPrntDys) >= DateTime.Now)
                {
                    Font f = new Font(this.grdSewadars.Font, FontStyle.Bold);
                    this.grdSewadars[GridColumns.printing_dtm.ToString(), rowIdx].Style.Font = f;
                    this.grdSewadars[GridColumns.printing_dtm.ToString(), rowIdx].Style.ForeColor = Color.Red;
                    
                }
            }
            //]]
        }

        private void makeRowBoldBrownIfBadgeExpiryIncorrect(int rowIdx)
        {
            //[[When the date as shown Last Printed is within specified number of days 
            //as per System Information Code BdgLstPrntDys, the system shows the Last Printed date in Bold and Maroon colour. 
            int? expiryYear = this.grdSewadars.AsInt(GridColumns.expiry_dt.ToString(), rowIdx);
            string grNo = this.grdSewadars.AsStr(GridColumns.sewadar_grno.ToString(), rowIdx);
            if (expiryYear.HasValue)
            {
                if (expiryYear.Value < DateTime.Now.Year)
                {
                    Font f = new Font(this.grdSewadars.Font, FontStyle.Bold);
                    this.grdSewadars[GridColumns.expiry_dt.ToString(), rowIdx].Style.Font = f;
                    this.grdSewadars[GridColumns.expiry_dt.ToString(), rowIdx].Style.BackColor = Color.SandyBrown;
                    this.grdSewadars[GridColumns.printing_dtm.ToString(), rowIdx].ToolTipText = "EXPIRY DATE IS INVALID!";
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "Expiry date is invalid for " + grNo, MessageTypes.Error);
                }
                else
                {
                    Font f = new Font(this.grdSewadars.Font, FontStyle.Regular);
                    this.grdSewadars[GridColumns.expiry_dt.ToString(), rowIdx].Style.Font = f;
                    this.grdSewadars[GridColumns.expiry_dt.ToString(), rowIdx].Style.BackColor = Color.White;
                    this.grdSewadars[GridColumns.printing_dtm.ToString(), rowIdx].ToolTipText = "";
                }
            }
            //]]
        }

        private void grdSewadars_RowValidating(object sender, DataGridViewCellCancelEventArgs e)
        {
            makeRowBoldMarronIfPrintedRecently(e.RowIndex);
            makeRowBoldBrownIfBadgeExpiryIncorrect(e.RowIndex);
        }

        private void badgeTemplateCombo1_SelectedValueChanged(object sender, EventArgs e)
        {
            this.chkBack.Visible = true;
            this.grdSewadars.RemoveAllRecords();
            if (this.badgeTemplateCombo1.SelectedValue != null)
            {
                dT = this.dbFacade.ObjDBManager.ExecuteSQL("select * from badge_templates where badge_template_id = '" + this.badgeTemplateCombo1.SelectedValueAsStr + "'").Tables[0];
                if (string.IsNullOrEmpty(dT.Rows[0]["procedure_nm_back"].ToString()))
                {
                    this.chkBack.Visible = false;
                }
                SelectedInformationType = (InformationType)Enum.Parse(typeof(InformationType), dT.Rows[0]["information_type"].ToString());
                if (SelectedInformationType == InformationType.Range)
                {
                    sewadarListLookup1.Visible = false;
                    InnerSplitPanel.Panel1Collapsed = true;
                    InnerSplitPanel.Panel2Collapsed = false;
                }
                else
                {
                    sewadarListLookup1.Visible = true;
                    InnerSplitPanel.Panel1Collapsed = false;
                    InnerSplitPanel.Panel2Collapsed = true;
                }
            }
        }


    }
}
