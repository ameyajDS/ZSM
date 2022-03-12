using System;
using System.Collections.Generic;
using System.Data;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.UIControls;
using System.IO;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.DB;
using System.Reflection;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.MGMT.View;
using System.Data.SqlClient;
using DCC.UMB.CDF.Utils;

namespace DCC.ZOS.ZSM.RPT
{

    public partial class GenericReports : ZSMBaseParametersScreen
    {
        enum GenericReportColumns
        {
            report_nm,
            report_group,
            report_type,
            is_total_line,
            sewadar_list_nm,
            is_satsang_centre,
            is_satsang_centre_multi_select,
            is_sewa,
            is_default_sewa,
            is_start_dt,
            is_finish_dt,
            is_remarks_type,
            remarks_type_prm,
            default_period_source,
            is_department,
            is_department_multi_select,
            is_sub_department,
            is_status,
            is_status_multi_select,
            status_system_info_cd,
            is_global_status,
            is_weekly_sewa_location,
            is_country,
            default_country_id,
            is_state,
            is_district,
            is_po_or_city,
            is_gender,
            is_outstation_sewadar,
            default_outstation_sewadar,
            is_cnt_1,
            cnt_1_label,
            cnt_1_min_value,
            cnt_1_max_value,
            cnt_1_default_value,
            is_cnt_2,
            cnt_2_label,
            cnt_2_min_value,
            cnt_2_max_value,
            cnt_2_default_value,
            is_team,
            is_credit_specification,
            is_default_credit_specification,
            is_gnc_dt1,
            gnc_dt1_label,
            is_gnc_dt1_default_current_date,
            is_gnc_dt1_show_difference,
            is_gnc_dt2,
            gnc_dt2_label,
            is_gnc_dt2_default_current_date,
            is_gnc_dt2_show_difference,
            is_skill,
            is_qualification_type,
            is_gnc_boolean,
            gnc_boolean_label,
            default_gnc_boolean,
            is_attribute,
            attribute_system_info_cd,
            is_sewadar_list,
            is_area,
            is_eject_page,
            report_main_ordering,
            is_main_ascending_ordering,
            report_ordering,
            is_ascending_order,
            procedure_nm,
            sewa_id_prm,
            sewa_nm_prm,
            start_dt_prm,
            finish_dt_prm,
            department_id_prm,
            department_nm_prm,
            sub_department_id_prm,
            sub_department_nm_prm,
            status_prm,
            weekly_sewa_location_id_prm,
            weekly_sewa_location_nm_prm,
            country_id_prm,
            state_id_prm,
            district_id_prm,
            po_or_city_id_prm,
            gender_prm,
            outstation_sewadar_prm,
            cnt_1_prm,
            cnt_2_prm,
            team_id_prm,
            team_nm_prm,
            credit_specification_id_prm,
            credit_specification_nm_prm,
            gnc_dt1_prm,
            gnc_dt2_prm,
            skill_id_prm,
            skill_nm_prm,
            qualification_type_prm,
            gnc_boolean_prm,
            satsang_centre_id_prm,
            satsang_centre_nm_prm,
            attribute_id_prm,
            attribute_nm_prm,
            sewadar_list_id_prm,
            details_report_file_nm,
            summary_report_file_nm,
            detail_report_footnote,
            summary_report_footnote,
            is_sewa_shift,
            sewa_shift_prm,
            is_sewadar_list_ticked,
            is_badge_template,
            badge_template_id_prm,
            badge_template_nm_prm,
            is_sewadar_type,
            sewadar_type_nm_prm,
            area_id_prm,
            area_nm_prm
        }

        private int menuIdx = 0;
        private string reportPath = default(string);
        private string realReportPath = default(string);
        private int? sessionId = null;
        private DataRow cmbResult = null;
        private bool fromsessionId = false;

        public GenericReports()
        {
            InitializeComponent();
            string s = Assembly.GetExecutingAssembly().Location;
            FileInfo fi = new FileInfo(s);

            if (SSRS_Enabled)
            {
                this.realReportPath = @fi.Directory.FullName + "\\RPT\\GenericReportPortrait.rdlc";
            }
            else
            {
                this.realReportPath = @fi.Directory.FullName + "\\RPT\\GenericReportPortrait.rpt";
            }

            fillDefaultValues();
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.txtReportName.Focus();
            this.menuIdx = int.Parse(screenParameters);
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select report_nm from generic_reports where report_group = " + this.menuIdx + "ORDER BY report_nm").Tables[0];
            this.txtReportName.SetDataSource(dT, "report_nm", "report_nm");
            this.cmbRemarksType.SetDataSource(ZSMUtility.GetRemarkTypes(this.dbFacade), "remarks_type", "remarks_type");
            dT = this.dbFacade.ObjDBManager.ExecuteSQL("select remarks from sewadar_types ORDER BY remarks").Tables[0];
            this.cmbSewadarType.SetDataSource(dT, "remarks", "remarks");
            sessionId = null;
        }

        public void fillDefaultValues()
        {
            sessionId = null;
            this.txtSatsangCentreNm.DisplayText = ZSMUtility.GetSatsangCentreName();
            this.departmentChooser1.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
            this.splitSatsangCentre.Panel2Collapsed = false;
            this.splitSatsangCentre.Panel1Collapsed = true;
        }

        public override void ClearControls()
        {
            base.ClearControls();
            fillDefaultValues();
        }

        public override string ReportPath
        {
            get
            {
                return reportPath;
            }
        }

        public override object GetReportFormulaValues(string FormulaName)
        {
            switch (FormulaName)
            {
                case "ReportMainGrouping":
                    if (cmbResult != null)
                    {
                        return this.cmbResult[GenericReportColumns.report_main_ordering.ToString()].ToString();
                    }
                    else
                    {
                        return "IF ISNULL ({sewadars_registrations.sub_department_id}) THEN {departments.department_nm} ELSE {departments.department_nm} + ' (' + {sub_departments.sub_department_nm} + ')'";
                    }
                    break;

                case "RptGroupBy":
                    if (cmbResult != null)
                    {
                        return this.cmbResult[GenericReportColumns.report_ordering.ToString()].ToString();
                    }
                    else
                    {
                        return "IF TRIM({sewadars.middle_nm}) = '' THEN TRIM ({sewadars.first_nm}) + ' ' + TRIM ({sewadars.last_nm}) ELSE TRIM ({sewadars.first_nm}) + ' ' + LEFT (TRIM ({sewadars.middle_nm}), 1) + '. ' + TRIM ({sewadars.last_nm})";
                    }
                    break;
            }
            return null;
        }

        public override object GetReportParameterValues(string parameterName)
        {
            switch (parameterName)
            {
                case "SatsangCentreNm":
                case "p_satsang_centre_nm":
                    return ZSMUtility.GetSatsangCentreName();
                case "SatsangCentreId":
                case "p_satsang_centre_id":
                    return ZSMUtility.GetSatsangCentreId();
                case "EjectParam":
                    return this.chkEject.BlnString;
                case "FootNote":
                    return this.txtReportFooter.DisplayText != null ? this.txtReportFooter.DisplayText : "FootNote";
                case "SessionId":
                    return this.sessionId.GetValueOrDefault(0);
                case "ReportGroupID":
                    return this.menuIdx;
                case "ReportId":
                    return "ZSM-GR-" + menuIdx + "-01";
                case "TotalLineReqd":
                    //return this.cmbResult[GenericReportColumns.is_total_line.ToString()].ToString();
                    return "Line No";
                case "p_department_ids":
                    return this.departmentListBox1.GetItemsAsXML(false);

                case "p_sub_department_ids":
                    return this.subDepartmentListBox1.GetItemsAsXML(false);

                case "p_is_outstation":
                    return makePercentIfNull(this.outstationSewadarCombo1.SelectedValueAsStr);

                case "p_gender":
                    return makePercentIfNull(this.genderCombo1.SelectedValueAsStr);

                case "p_area_id":
                    return string.IsNullOrEmpty(this.lookupArea.IdText) ? null : this.lookupArea.IdText;

                case "p_area_nm":
                    return this.lookupArea.DisplayText;

                case "p_sewadar_list_id":
                    return string.IsNullOrEmpty(this.sewadarListLookup1.IdText) ? null : this.sewadarListLookup1.IdText;

                case "p_sewa_id":
                    return string.IsNullOrEmpty(this.sewaLookup1.IdText) ? null : this.sewaLookup1.IdText;

                case "p_sewa_nm":
                    return this.sewaLookup1.DisplayText;

            }
            return null;
        }

        public override void Save()
        {
            btnReport_Click(null, null);
        }

        private void addParameterEntry(Dictionary<int, KeyValuePair<string, string>> s, DataRow result, string col, string val)
        {
            if (DbManager.GetByte(result[col]) != 0)
            {
                s.Add(DbManager.GetByte(result[col]), new KeyValuePair<string, string>(col, val));
            }
        }

        private void addMultipleSelectParamterForQueryToExec(DataRow result, Dictionary<int, KeyValuePair<string, string>> s)
        {
            addParameterEntry(s, result, GenericReportColumns.status_prm.ToString(),
                this.statusListBox1.GetItemsAsXML(false));
            if (string.Compare(result[GenericReportColumns.is_satsang_centre_multi_select.ToString()].ToString(), "Yes", true) == 0)
            {
                this.splitSatsangCentre.Panel1Collapsed = false;
                this.splitSatsangCentre.Panel2Collapsed = true;
                addParameterEntry(s, result, GenericReportColumns.satsang_centre_id_prm.ToString(),
                    this.satsangCentresListBox1.GetItemsAsXML(false));
            }
            else
            {
                this.splitSatsangCentre.Panel2Collapsed = false;
                this.splitSatsangCentre.Panel1Collapsed = true;
                addParameterEntry(s, result, GenericReportColumns.satsang_centre_id_prm.ToString(),
                    ZSMUtility.GetSatsangCentreId().ToString());
                addParameterEntry(s, result, GenericReportColumns.satsang_centre_nm_prm.ToString(),
                    ZSMUtility.GetSatsangCentreName());
            }
        }

        private string makePercentIfNull(string str)
        {
            return (string.IsNullOrEmpty(str) ? "%" : str);
        }

        private void addParamterForQueryToExec(DataRow result, Dictionary<int, KeyValuePair<string, string>> s)
        {
            addParameterEntry(s, result, GenericReportColumns.sewa_id_prm.ToString(), this.sewaLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.sewa_nm_prm.ToString(), this.sewaLookup1.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.start_dt_prm.ToString(), this.dateRangePair1.TxtFromDate.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.finish_dt_prm.ToString(), this.dateRangePair1.TxtToDate.DisplayText);
            if (string.Compare(DbManager.GetString(result[GenericReportColumns.is_department_multi_select.ToString()]), "Yes", true) != 0)
            {
                addParameterEntry(s, result, GenericReportColumns.department_id_prm.ToString(), this.departmentChooser1.SelectedDepartment.ToString());
                addParameterEntry(s, result, GenericReportColumns.department_nm_prm.ToString(), this.departmentChooser1.SelectedDepartmentName);
                addParameterEntry(s, result, GenericReportColumns.sub_department_id_prm.ToString(), this.departmentChooser1.SelectedSubDepartment.ToString());
                addParameterEntry(s, result, GenericReportColumns.sub_department_nm_prm.ToString(), this.departmentChooser1.SelectedSubDepartmentName);
            }
            else
            {
                addParameterEntry(s, result, GenericReportColumns.sub_department_id_prm.ToString(),
                    this.subDepartmentListBox1.GetItemsAsXML(false));
                addParameterEntry(s, result, GenericReportColumns.department_id_prm.ToString(),
                    this.departmentListBox1.GetItemsAsXML(false));
            }
            addParameterEntry(s, result, GenericReportColumns.weekly_sewa_location_id_prm.ToString(), this.weeklySewaLocationLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.weekly_sewa_location_nm_prm.ToString(), this.weeklySewaLocationLookup1.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.country_id_prm.ToString(), this.countriesListBox1.GetItemsAsXML(false));
            addParameterEntry(s, result, GenericReportColumns.state_id_prm.ToString(), this.statesListBox1.GetItemsAsXML(false));
            addParameterEntry(s, result, GenericReportColumns.district_id_prm.ToString(), this.districtOrCitiesListBox1.GetItemsAsXML(false));
            addParameterEntry(s, result, GenericReportColumns.po_or_city_id_prm.ToString(), this.postOfficeOrCityListBox1.GetItemsAsXML(false));
            addParameterEntry(s, result, GenericReportColumns.gender_prm.ToString(), makePercentIfNull(this.genderCombo1.SelectedValueAsStr));
            addParameterEntry(s, result, GenericReportColumns.outstation_sewadar_prm.ToString(), makePercentIfNull(this.outstationSewadarCombo1.SelectedValueAsStr));
            addParameterEntry(s, result, GenericReportColumns.cnt_1_prm.ToString(), this.intCount1.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.cnt_2_prm.ToString(), this.intCount2.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.team_id_prm.ToString(), this.sewaTeamsLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.team_nm_prm.ToString(), this.sewaTeamsLookup1.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.credit_specification_id_prm.ToString(), this.creditSpecificationsLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.credit_specification_nm_prm.ToString(), this.creditSpecificationsLookup1.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.gnc_dt1_prm.ToString(), this.dtGnc1.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.gnc_dt2_prm.ToString(), this.dtGnc2.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.skill_id_prm.ToString(), this.skillsLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.skill_nm_prm.ToString(), this.skillsLookup1.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.qualification_type_prm.ToString(), this.qualificationTypesLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.gnc_boolean_prm.ToString(), this.chkGncBoolean.BlnString);
            addParameterEntry(s, result, GenericReportColumns.attribute_id_prm.ToString(), this.attributesLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.attribute_nm_prm.ToString(), this.attributesLookup1.DisplayText);
            addParameterEntry(s, result, GenericReportColumns.sewadar_list_id_prm.ToString(), this.sewadarListLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.sewa_shift_prm.ToString(), this.sewaShitsLookup1.IdText);
            addParameterEntry(s, result, GenericReportColumns.badge_template_id_prm.ToString(), this.badgeTemplateCombo1.SelectedValueAsStr);
            addParameterEntry(s, result, GenericReportColumns.badge_template_nm_prm.ToString(), DbManager.IsNotNull(this.badgeTemplateCombo1.SelectedValue) ? this.badgeTemplateCombo1.DisplayText : string.Empty);
            addParameterEntry(s, result, GenericReportColumns.remarks_type_prm.ToString(), DbManager.IsNotNull(this.cmbRemarksType.SelectedValue) ? this.cmbRemarksType.DisplayText : string.Empty);
            addParameterEntry(s, result, GenericReportColumns.sewadar_type_nm_prm.ToString(), DbManager.IsNotNull(this.cmbSewadarType.SelectedValue) ? this.cmbSewadarType.DisplayText : string.Empty);
            addParameterEntry(s, result, GenericReportColumns.area_id_prm.ToString(), this.lookupArea.IdText);
            addParameterEntry(s, result, GenericReportColumns.area_nm_prm.ToString(), this.lookupArea.DisplayText);
            addMultipleSelectParamterForQueryToExec(result, s);
        }


        private string cookUpQueryToExec(ref string logString)
        {
            return cookUpQueryToExec(cmbResult, ref logString);
        }

        private string cookUpQueryToExec(DataRow result, ref string logString)
        {
            Dictionary<int, KeyValuePair<string, string>> s = new Dictionary<int, KeyValuePair<string, string>>();
            addParamterForQueryToExec(result, s);
            List<KeyValuePair<int, KeyValuePair<string, string>>> myList = new List<KeyValuePair<int, KeyValuePair<string, string>>>(s);
            myList.Sort(
                delegate(KeyValuePair<int, KeyValuePair<string, string>> firstPair,
                KeyValuePair<int, KeyValuePair<string, string>> nextPair)
                {
                    return firstPair.Key.CompareTo(nextPair.Key);
                }
            );
            string query = "EXEC " + result[GenericReportColumns.procedure_nm.ToString()].ToString() + " ";
            foreach (KeyValuePair<int, KeyValuePair<string, string>> item in myList)
            {
                query += string.IsNullOrEmpty(item.Value.Value) ? (" null ,") : ("'" + item.Value.Value + "'" + ",");
            }
            if (string.Compare(result[GenericReportColumns.report_type.ToString()].ToString(), "B", true) == 0)
            {
                query += ("'" + this.chkSummarised.BlnString + "'" + ",");
            }
            query = query.TrimEnd(',');

            logString = result[GenericReportColumns.procedure_nm.ToString()].ToString() + "|";
            foreach (KeyValuePair<int, KeyValuePair<string, string>> item in myList)
            {
                if (!item.Value.Key.Contains("nm_prm"))
                {
                    logString += string.IsNullOrEmpty(item.Value.Value) ? ("null|") : (item.Value.Value + "|");
                }
            }
            if (string.Compare(result[GenericReportColumns.report_type.ToString()].ToString(), "B", true) == 0)
            {
                logString += ("Summ=" + this.chkSummarised.BlnString + "|");
            }
            logString = logString.TrimEnd('|');

            return query;
        }

        private void setLabel(DCCTextField t, object o)
        {
            if (DbManager.IsNotNull(o))
            {
                t.Title = o.ToString();
            }
        }

        private void setLabel(DCCCheckBox t, object o)
        {
            if (DbManager.IsNotNull(o))
            {
                t.Text = o.ToString();
            }
        }


        private void btnReport_Click(object sender, EventArgs e)
        {
            this.sessionId = null;
            Guid tranGuid = CursorManager.BeginTransaction("Preparing report, please wait...");
            try
            {
                this.reportPath = this.realReportPath;
                string resultFile = null;
                if (cmbResult != null)
                {
                    if (this.chkSummarised.Checked)
                    {
                        resultFile = this.cmbResult[GenericReportColumns.summary_report_file_nm.ToString()].ToString();
                    }
                    else
                    {
                        resultFile = this.cmbResult[GenericReportColumns.details_report_file_nm.ToString()].ToString();
                    }

                    resultFile = resultFile.Substring(0, resultFile.IndexOf("."));
                    this.reportPath = this.reportPath.Replace("GenericReportPortrait", resultFile);
                }
                else
                {
                    fromsessionId = true;
                    //string summaryReport = "SELECT COUNT(*) AS cnt FROM generic_report_summaries WHERE session_id = " + this.intSessionId.DisplayText;

                    //DataTable summaryDT = this.dbFacade.ObjDBManager.ExecuteSQL(summaryReport).Tables[0];
                    //if (DbManager.GetNullableInteger(summaryDT.Rows[0][0]) > 0)
                    //{
                    //    this.reportPath = this.reportPath.Replace("GenericReportPortrait", "GenericSummaryPortrait");
                    //}
                    //string listReport = "SELECT COUNT(*) AS cnt FROM generic_list_report_headers WHERE session_id = " + this.intSessionId.DisplayText;
                    //DataTable listDT = this.dbFacade.ObjDBManager.ExecuteSQL(listReport).Tables[0];
                    //if (DbManager.GetNullableInteger(listDT.Rows[0][0]) > 0)
                    //{
                    //    this.reportPath = this.reportPath.Replace("GenericReportPortrait", "GenericListReportPortrait");
                    //}
                    String query = "select is_summary from generic_report_headers where session_id = \'" + this.intSessionId.DisplayText + "\'";
                    DataTable summaryDT = this.dbFacade.ObjDBManager.ExecuteSQL(query).Tables[0];
                    String isSummaryReport="";
                    foreach (DataRow row in summaryDT.Rows)
                        isSummaryReport=row.Field<String>(0);
                    if (isSummaryReport.Equals("Yes"))
                        query = "select summary_report_file_nm from generic_reports where report_nm=(select report_nm from generic_report_headers where session_id =\'" + this.intSessionId.DisplayText + "\');";
                    else
                        query = "select details_report_file_nm from generic_reports where report_nm=(select report_nm from generic_report_headers where session_id =\'" + this.intSessionId.DisplayText + "\');";
                    String reportName = "";
                    summaryDT = this.dbFacade.ObjDBManager.ExecuteSQL(query).Tables[0];
                    foreach (DataRow row in summaryDT.Rows)
                        reportName = row.Field<String>(0);
                    this.reportPath = this.reportPath.Replace("GenericReportPortrait.rpt", reportName);
                        
                }
                //]]
                if (!string.IsNullOrEmpty(this.intSessionId.DisplayText))
                {
                    this.sessionId = this.intSessionId.DisplayTextAsInteger;
                    if (GlobalAppVariables.AppContext.IsWebDBEnabled)
                    {
                        GlobalAppVariables.ObjMDIMain.FireWebReportPrint();
                    }
                    else
                    {
                        GlobalAppVariables.ObjMDIMain.FirePrint();
                    }
                    return;
                }
                else if (this.ValidateAllControlsofContainer(this.tlpBase))
                {
                    string logString = default(string);
                    string qry = cookUpQueryToExec(ref logString);
                    qry = "DECLARE @p_session_id INTEGER ; " + qry + ", @p_session_id OUTPUT SELECT @p_session_id ";
                    try
                    {
                        DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(qry, 600).Tables[0];
                        if (dT.Rows.Count > 0)
                        {
                            sessionId = DbManager.GetNullableInteger(dT.Rows[0][0]);
                            if (sessionId.HasValue)
                            {
                                if (!string.IsNullOrEmpty(this.txtSewadarListNm.DisplayText) && this.chkSewadarList.Checked)
                                {
                                    int genId = 0;
                                    this.dbFacade.CreateSewadarList(sessionId, ZSMUtility.GetSatsangCentreId(), this.txtSewadarListNm.DisplayText, this.txtReportName.DisplayText, ref genId);
                                }

                            }
                        }
                        UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, logString);
                    }
                    catch (Exception ex)
                    {
                        UIManager.ShowMessage(MsgCodes.Internal, ex.Message.Replace("|", "/") + "| while executing qry: " + qry, MessageTypes.Error);
                        throw;
                    }
                }
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
            if (!DbManager.IsNotNull(this.sessionId))
            {
                UIManager.ShowMessage(MsgCodes.Internal, "No session_id for report | while generating report", MessageTypes.Error);
            }
            else
            {
                if (GlobalAppVariables.AppContext.IsWebDBEnabled)
                {
                    GlobalAppVariables.ObjMDIMain.FireWebReportPrint();
                }
                else
                {
                    GlobalAppVariables.ObjMDIMain.FirePrint();
                }

                if (!this.chkRegerenrateRpt.Checked)
                {
                    //this.dbFacade.DeleteGenericReportData(sessionId);
                }
                if (!fromsessionId && !this.chkRegerenrateRpt.Checked)
                {
                    String sqlQuery;
                    if (this.chkSummarised.Checked)
                        sqlQuery = "UPDATE dbo.generic_report_headers SET report_nm=\'" + this.txtReportName.SelectedValue + "\',is_summary=\'Yes\' where session_id=\'" + sessionId + "\';";
                    else
                        sqlQuery = "UPDATE dbo.generic_report_headers SET report_nm=\'" + this.txtReportName.SelectedValue + "\',is_summary=\'No\' where session_id=\'" + sessionId + "\';";
                  

                    this.dbFacade.ObjDBManager.ExecuteSQL(sqlQuery);
                }
            }
        }

        public override DataTable GetReportDataTable(string tableName)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("SessionId", sessionId));
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteStoredProc("GenericReportPortrait", parameters).Tables[0];
            return dT;
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            this.ClearAllControlsOfContainer(this.tlpBase, true);
        }

        private void statesListBox1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            string inStmt = ZSMUtility.GetInStatementUsingItems(this.countriesListBox1, false);
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "c.country_id " + inStmt);
        }

        private void districtOrCitiesListBox1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "s.state_id " + ZSMUtility.GetInStatementUsingItems(this.statesListBox1, false));
        }

        private void postOfficeOrCityListBox1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "d.district_or_city_id  " + ZSMUtility.GetInStatementUsingItems(this.districtOrCitiesListBox1, false));
        }

        private void txtReportName_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "report_group = " + this.menuIdx);
        }

        private void subDepartmentListBox1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("1=2", " dsc.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() +
                " And sd.department_id " + ZSMUtility.GetInStatementUsingItems(this.departmentListBox1, false));
        }

        private void chkSewadarList_CheckStateChanged(object sender, EventArgs e)
        {
            this.txtSewadarListNm.Mandatory = (this.chkSewadarList.Checked);
        }

        private void intCount1_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            DataRow result = this.cmbResult;
            if (DbManager.IsNotNull(result))
            {
                int? rangeMin = DbManager.GetNullableInteger(result[GenericReportColumns.cnt_1_min_value.ToString()]);
                int? rangeMax = DbManager.GetNullableInteger(result[GenericReportColumns.cnt_1_max_value.ToString()]);
                if (DbManager.IsNotNull(rangeMax))
                {
                    if (this.intCount1.DisplayTextAsInteger > rangeMax)
                    {
                        e.Cancel = true;
                        UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, DbManager.GetString(result[GenericReportColumns.cnt_1_label.ToString()]) + "|" + rangeMax);
                    }
                    if (this.intCount1.DisplayTextAsInteger < rangeMin)
                    {
                        e.Cancel = true;
                        UIManager.ShowMessage(MsgCodes.GreaterOrEqualValueReqd, DbManager.GetString(result[GenericReportColumns.cnt_1_label.ToString()]) + "|" + rangeMin);
                    }
                }
            }
        }

        private void intCount2_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            DataRow result = this.cmbResult;
            if (DbManager.IsNotNull(result))
            {
                int? rangeMin = DbManager.GetNullableInteger(result[GenericReportColumns.cnt_2_min_value.ToString()]);
                int? rangeMax = DbManager.GetNullableInteger(result[GenericReportColumns.cnt_2_max_value.ToString()]);
                if (DbManager.IsNotNull(rangeMax))
                {
                    if (this.intCount2.DisplayTextAsInteger > rangeMax)
                    {
                        e.Cancel = true;
                        UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, DbManager.GetString(result[GenericReportColumns.cnt_2_label.ToString()]) + "|" + rangeMax);
                    }
                    if (this.intCount2.DisplayTextAsInteger < rangeMin)
                    {
                        e.Cancel = true;
                        UIManager.ShowMessage(MsgCodes.GreaterOrEqualValueReqd, DbManager.GetString(result[GenericReportColumns.cnt_2_label.ToString()]) + "|" + rangeMin);
                    }
                }
            }
        }

        private void attributesLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "gas.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void txtReportName_SelectedValueChanged(object sender, EventArgs e)
        {
            if (DbManager.IsNotNull(this.txtReportName.SelectedValue))
            {
                cmbResult = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT * FROM generic_reports WHERE report_nm = '" + this.txtReportName.SelectedValue + "'").Tables[0].Rows[0];
                intSessionId.DisplayText = default(string);
                DataRow result = cmbResult;
                if (DbManager.IsNotNull(result))
                {
                    //Set labels
                    setLabel(this.dtGnc1, result[GenericReportColumns.gnc_dt1_label.ToString()]);
                    setLabel(this.dtGnc2, result[GenericReportColumns.gnc_dt2_label.ToString()]);
                    setLabel(this.intCount1, result[GenericReportColumns.cnt_1_label.ToString()]);
                    setLabel(this.intCount2, result[GenericReportColumns.cnt_2_label.ToString()]);
                    setLabel(this.chkGncBoolean, result[GenericReportColumns.gnc_boolean_label.ToString()]);
                    this.intCount1.DisplayText = result[GenericReportColumns.cnt_1_default_value.ToString()].ToString();
                    this.intCount2.DisplayText = result[GenericReportColumns.cnt_2_default_value.ToString()].ToString();
                    this.dtGnc1.DisplayTextAsDateTime = (string.Compare(result[GenericReportColumns.is_gnc_dt1_default_current_date.ToString()].ToString(), "Yes", false) == 0) ? (DateTime?)DateTime.Now : null;
                    this.dtGnc2.DisplayTextAsDateTime = (string.Compare(result[GenericReportColumns.is_gnc_dt2_default_current_date.ToString()].ToString(), "Yes", false) == 0) ? (DateTime?)DateTime.Now : null;
                    this.chkGncBoolean.Checked = string.Compare(result[GenericReportColumns.default_gnc_boolean.ToString()].ToString(), "Yes", false) == 0;
                    this.chkSewadarList.Checked = string.Compare(result[GenericReportColumns.is_sewadar_list_ticked.ToString()].ToString(), "Yes", false) == 0;
                    this.outstationSewadarCombo1.SelectedValue = result[GenericReportColumns.default_outstation_sewadar.ToString()].ToString();
                    //Set other properties
                    ZSMUtility.changeControlProperties(this.sewaLookup1, result[GenericReportColumns.is_sewa.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.dateRangePair1, result[GenericReportColumns.is_start_dt.ToString()].ToString(), result[GenericReportColumns.is_finish_dt.ToString()].ToString());
                    this.departmentChooser1.lkpDepartment.Mandatory = false;
                    this.departmentListBox1.Mandatory = false;
                    this.subDepartmentListBox1.Mandatory = false;
                    if (string.Compare(DbManager.GetString(result[GenericReportColumns.is_department_multi_select.ToString()]), "Yes", true) != 0)
                    {
                        ZSMUtility.changeControlProperties(this.departmentChooser1.lkpDepartment, result[GenericReportColumns.is_department.ToString()].ToString());
                        ZSMUtility.changeControlProperties(this.departmentChooser1.lkpSubDepartment, result[GenericReportColumns.is_sub_department.ToString()].ToString());
                        this.splitContainer1.Panel1Collapsed = false;
                        this.splitContainer1.Panel2Collapsed = true;
                    }
                    else
                    {
                        ZSMUtility.changeControlProperties(this.departmentListBox1, result[GenericReportColumns.is_department.ToString()].ToString());
                        ZSMUtility.changeControlProperties(this.subDepartmentListBox1, result[GenericReportColumns.is_sub_department.ToString()].ToString());
                        this.splitContainer1.Panel1Collapsed = true;
                        this.splitContainer1.Panel2Collapsed = false;
                    }
                    if (string.Compare(result[GenericReportColumns.is_satsang_centre_multi_select.ToString()].ToString(), "Yes", true) == 0)
                    {
                        this.splitSatsangCentre.Panel1Collapsed = false;
                        this.splitSatsangCentre.Panel2Collapsed = true;
                    }
                    else
                    {
                        this.splitSatsangCentre.Panel1Collapsed = true;
                        this.splitSatsangCentre.Panel2Collapsed = false;
                    }
                    this.chkSummarised.Checked = false;
                    switch (result[GenericReportColumns.report_type.ToString()].ToString())
                    {
                        case "B":
                            this.chkSummarised.Enabled = true;
                            break;
                        case "S":
                            this.chkSummarised.Checked = true;
                            this.chkSummarised.Enabled = false;
                            break;
                        case "D":
                            this.chkSummarised.Checked = false;
                            this.chkSummarised.Enabled = false;
                            break;
                    }
                    switch (result[GenericReportColumns.is_sewadar_type.ToString()].ToString())
                    {
                        case "R":
                            this.cmbSewadarType.SelectedValue = "Regular";
                            break;
                        default:
                            this.cmbSewadarType.ClearControlValues();
                            break;
                    }
                    this.statusListBox1.IsGlobal = string.Compare(result[GenericReportColumns.is_global_status.ToString()].ToString(), "Y", true) == 0;
                    ZSMUtility.changeControlProperties(this.statusListBox1, result[GenericReportColumns.is_status.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.weeklySewaLocationLookup1, result[GenericReportColumns.is_weekly_sewa_location.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.countriesListBox1, result[GenericReportColumns.is_country.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.statesListBox1, result[GenericReportColumns.is_state.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.districtOrCitiesListBox1, result[GenericReportColumns.is_district.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.postOfficeOrCityListBox1, result[GenericReportColumns.is_po_or_city.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.genderCombo1, result[GenericReportColumns.is_gender.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.outstationSewadarCombo1, result[GenericReportColumns.is_outstation_sewadar.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.intCount1, result[GenericReportColumns.is_cnt_1.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.intCount2, result[GenericReportColumns.is_cnt_2.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.sewaTeamsLookup1, result[GenericReportColumns.is_team.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.creditSpecificationsLookup1, result[GenericReportColumns.is_credit_specification.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.dtGnc2, result[GenericReportColumns.is_gnc_dt2.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.dtGnc1, result[GenericReportColumns.is_gnc_dt1.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.skillsLookup1, result[GenericReportColumns.is_skill.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.qualificationTypesLookup1, result[GenericReportColumns.is_qualification_type.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.chkGncBoolean, result[GenericReportColumns.is_gnc_boolean.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.badgeTemplateCombo1, result[GenericReportColumns.is_badge_template.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.cmbRemarksType, result[GenericReportColumns.is_remarks_type.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.cmbSewadarType, result[GenericReportColumns.is_sewadar_type.ToString()].ToString());
                    if (string.Compare(result[GenericReportColumns.is_satsang_centre_multi_select.ToString()].ToString(), "Yes", true) == 0)
                    {
                        ZSMUtility.changeControlProperties(this.satsangCentresListBox1, result[GenericReportColumns.is_satsang_centre.ToString()].ToString());
                    }
                    ZSMUtility.changeControlProperties(this.attributesLookup1, result[GenericReportColumns.is_attribute.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.chkGncBoolean, result[GenericReportColumns.is_gnc_boolean.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.chkEject, result[GenericReportColumns.is_eject_page.ToString()].ToString());
                    //ZSMUtility.changeControlProperties(this.txtSewadarListNm, result[GenericReportColumns.is_sewadar_list.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.sewadarListLookup1, result[GenericReportColumns.is_sewadar_list.ToString()].ToString());
                    ZSMUtility.changeControlProperties(this.sewaShitsLookup1, result[GenericReportColumns.is_sewa_shift.ToString()].ToString());
                    int? id = DbManager.GetNullableInteger(result[GenericReportColumns.default_country_id.ToString()]);
                    if (id.HasValue)
                    {
                        this.countriesListBox1.SetSelected(ZSMUtility.GetIndexOfItem(this.countriesListBox1, id.Value.ToString()), true);
                    }
                    DataSet dS = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select credit_specification_id, credit_specification_nm from credit_specifications where satsang_centre_id = {0} AND is_finally_used = 'Yes'; select start_dt, finish_dt from sewas where satsang_centre_id = {0} AND is_default_sewa = 'Yes'", ZSMUtility.GetSatsangCentreId()));
                    DataTable dT = dS.Tables[0];
                    if (dT.Rows.Count > 0)
                    {
                        this.creditSpecificationsLookup1.IdText = dT.Rows[0]["credit_specification_id"].ToString();
                        ZSMUtility.setDisplayValueText(this.creditSpecificationsLookup1, dT.Rows[0]["credit_specification_nm"].ToString());
                    }
                    switch (result[GenericReportColumns.report_type.ToString()].ToString())
                    {
                        case "S":
                            dT = dS.Tables[1];
                            if (dT.Rows.Count > 0)
                            {
                                this.dateRangePair1.FromDate = DbManager.GetNullableDateTime(dT.Rows[0]["start_dt"]);
                                this.dateRangePair1.ToDate = DbManager.GetNullableDateTime(dT.Rows[0]["finish_dt"]);
                            }
                            break;
                        case "C":
                            this.dateRangePair1.FromDate = DateTime.Now;
                            this.dateRangePair1.ToDate = DateTime.Now;
                            break;
                    }
                    ZSMUtility.changeControlProperties(this.lookupArea, result[GenericReportColumns.is_area.ToString()].ToString());
                }
                intSessionId.ReadOnly = true;
                chkRegerenrateRpt.Checked = true;

            }
            else
            {
                cmbResult = null;
                intSessionId.ReadOnly = false;
                chkRegerenrateRpt.Checked = false;

                List<Control> lstAllControls = new List<Control>();
                UtilityManager.GetAllControlsInContainer((AbstractScreen)this, lstAllControls, txtSatsangCentreNm);
                foreach (Control ctrl in lstAllControls)
                {
                    if (ctrl is DCCCheckBox)
                        ZSMUtility.changeControlProperties((DCCCheckBox)ctrl, "O");
                    else if (ctrl is DCCComboBox)
                        ZSMUtility.changeControlProperties((DCCComboBox)ctrl, "O");
                    else if (ctrl is DCCListBox)
                        ZSMUtility.changeControlProperties((DCCListBox)ctrl, "O");
                    else if (ctrl is DCCLongIntegerField)
                        ZSMUtility.changeControlProperties((DCCLongIntegerField)ctrl, "O");
                    else if (ctrl is DCCTextField)
                        ZSMUtility.changeControlProperties((DCCTextField)ctrl, "O");
                }
                subDepartmentListBox1.ReadOnly = true;
            }
        }

        private void sewaShitsLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (DbManager.IsNotNull(this.sewaLookup1.IdTextAsInteger))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "(sss.sewa_id = '" + this.sewaLookup1.IdText + "')");
            }
        }

        public override bool IsReadyToSave()
        {
            DataRow result = cmbResult;
            if (result != null)
            {
                bool hasLessThanTwoItem = false;
                hasLessThanTwoItem = (this.statusListBox1.GetItems(false).Count <= 1);
                if (string.Compare(result[GenericReportColumns.is_status_multi_select.ToString()].ToString(), "No", true) == 0 && !hasLessThanTwoItem)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, "multiple values specified | status");
                }
                hasLessThanTwoItem = (this.satsangCentresListBox1.GetItems(false).Count <= 1);
                if (string.Compare(result[GenericReportColumns.is_satsang_centre_multi_select.ToString()].ToString(), "No", true) == 0 && !hasLessThanTwoItem)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, "multiple values specified | satsang centre");
                }
            }
            return base.IsReadyToSave();
        }

        private void sewaLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void departmentListBox1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(1=1)", "dsc.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void lookupArea_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", " satsang_centre_type = 'Area'");
        }

        private void GenericReports_ChildClosing(object sender, ChildClosingEventArgs e)
        {
            //if (chkRegerenrateRpt.Checked)
            String query = "select COUNT(*) from generic_report_headers where is_summary IS NULL AND session_id=\'" + this.sessionId + "\';";
            DataTable summaryDT = this.dbFacade.ObjDBManager.ExecuteSQL(query).Tables[0];
            int i = 0;
            foreach (DataRow row in summaryDT.Rows)
                i = row.Field<int>(0);
            if (i != 0 || this.chkRegerenrateRpt.Checked)
                this.dbFacade.DeleteGenericReportData(sessionId);
        }

        private void creditSpecificationsLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", " satsang_centre_id = \'" + Convert.ToString(ZSMUtility.GetSatsangCentreId()) + "\'");
        }
        
        private void sewaTeamsLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "ss.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
            if (DbManager.IsNotNull(this.sewaLookup1.IdTextAsInteger))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("?"," ss.sewa_id = '" + this.sewaLookup1.IdText + "'");
            }            
        }
        
    }
}
