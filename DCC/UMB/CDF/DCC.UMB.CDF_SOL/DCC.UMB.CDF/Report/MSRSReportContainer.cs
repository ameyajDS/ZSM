using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
using DCC.UMB.CDF.UIControls.Windows;
using Microsoft.Reporting.WinForms;
using Microsoft.ReportingServices.ReportProcessing;
using System.Security.Principal;
using System.Net;
using DCC.UMB.CDF.MGMT.Global;
using System.Configuration;

namespace DCC.UMB.CDF.Report
{
    internal class MSRSReportContainer : AbstractReportContainer
    {
        private ReportViewer reportViewer;
        public MSRSReportContainer()
        {
            this.InitializeComponent();
            reportViewer.Visible = false;            
        }

        
        protected override void InitializeDbFacade()
        {
            //do nothing, as no db connection is required in this screen.
        }

        private void InitializeComponent()
        {
            this.reportViewer = new Microsoft.Reporting.WinForms.ReportViewer();
            this.SuspendLayout();
            // 
            // reportViewer
            // 
            this.reportViewer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.reportViewer.Location = new System.Drawing.Point(0, 0);
            this.reportViewer.Name = "reportViewer";
            this.reportViewer.Size = new System.Drawing.Size(292, 292);
            this.reportViewer.TabIndex = 0;
            // 
            // MSRSReportContainer
            // 
            this.ClientSize = new System.Drawing.Size(292, 292);
            this.Controls.Add(this.reportViewer);
            this.Name = "MSRSReportContainer";
            this.Load += new System.EventHandler(this.ReportContainer_Load);
            this.ResumeLayout(false);

        }

        private void ReportContainer_Load(object sender, EventArgs e)
        {
            this.reportViewer.RefreshReport();
        }
        internal override void LoadReport(string reportServerURL, string reportFilePath)
        {
            if (string.IsNullOrEmpty(reportServerURL) && !string.IsNullOrEmpty(reportFilePath))
                LoadLocalReport(reportServerURL, reportFilePath);
            else
                LoadServerReport(reportServerURL, reportFilePath);
        }
        internal void LoadServerReport(string reportServerURL, string reportFilePath)
        {
            reportViewer.ProcessingMode = ProcessingMode.Remote;
            ServerReport serverReport = reportViewer.ServerReport;


            reportViewer.ShowCredentialPrompts = false;

            //reportViewer.ServerReport.ReportServerCredentials = new System.r ReportCredentials("Reportfolder Name", "Password of the folder", "");
            
            // Get a reference to the default credentials
            //System.Net.ICredentials credentials = System.Net.CredentialCache.DefaultCredentials;

            // Get a reference to the report server credentials
            ReportServerCredentials rsCredentials = serverReport.ReportServerCredentials;

            // Set the credentials for the server report
            if (GlobalAppVariables.AppContext.IsWebDBEnabled)
            {
                rsCredentials.NetworkCredentials = new NetworkCredential("gnrc_rpt_usr", "nJ1bgA2LIKMEJLlFKZPg", "deravpn.net");
            }
            else
            {
                string reportServerUserId = ConfigurationManager.AppSettings["GNRC_RPT_USR_ID"];
                string reportServerUserPassword = ConfigurationManager.AppSettings["GNRC_RPT_USR_PASSWORD"];
                string reportServerUserDomain = ConfigurationManager.AppSettings["GNRC_RPT_USR_DOMAIN"];
                if (!string.IsNullOrEmpty(reportServerUserId) && !string.IsNullOrEmpty(reportServerUserPassword) && !string.IsNullOrEmpty(reportServerUserDomain))
                {
                    rsCredentials.NetworkCredentials = new NetworkCredential(reportServerUserId, reportServerUserPassword, reportServerUserDomain);
                }
            }

            

            
            

            // Set the report server URL and report path
            serverReport.ReportServerUrl = new Uri(reportServerURL);
            serverReport.ReportPath = reportFilePath;
            
            ReportParameterInfoCollection rptparams = reportViewer.ServerReport.GetParameters();
            List<ReportParameter> lstParameters = new List<ReportParameter>();
            foreach (ReportParameterInfo parm in rptparams)
            {
                IList<string> defaultValues = parm.Values;//capture the default values as specified in rld file.

                object values = this.GetParameterValue(parm.Name);
                string[] paramValues = null;
                if (values != null && !string.IsNullOrEmpty(values.ToString()))
                {
                    if (values.GetType() == typeof(string[]))
                    {
                        paramValues = (string[])values;
                    }
                    else
                    {
                        paramValues = new string[] { values.ToString() };
                    }
                }
                //[[if the parameter screen retuens some parameter values, set those into the parameter
                //else if the paramter screen returns null, i.e. parameter screen specifically states that use null as values of a report parameter
                //and this MUST override the default values. 
                if (paramValues != null)
                {
                    lstParameters.Add(new ReportParameter(parm.Name, paramValues, false));
                }
                else
                {
                    ReportParameter objParam = new ReportParameter(parm.Name);
                    objParam.Visible = false;
                    objParam.Values.Add(null);
                    lstParameters.Add(objParam);
                }
                //]]
            }
            string printableParams = GetPrintableReportParameters(lstParameters);
            Log.Logger.Debug(printableParams);
            
            reportViewer.ServerReport.SetParameters(lstParameters.ToArray());
            reportViewer.SetDisplayMode(DisplayMode.PrintLayout);            
           // reportViewer.ZoomMode = ZoomMode.Percent;
            reportViewer.ZoomPercent = 100;            
            reportViewer.Visible = true;            
            //]]
        }
        internal  void LoadLocalReport(string reportServerURL, string reportFilePath)
        {
            reportViewer.Reset();

            reportViewer.ProcessingMode = Microsoft.Reporting.WinForms.ProcessingMode.Local;
            this.reportViewer.LocalReport.ReportPath = reportFilePath;
            
            reportViewer.ShowCredentialPrompts = false;

            foreach (string datasourceName in reportViewer.LocalReport.GetDataSourceNames())
            {
                reportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource(datasourceName, this.GetReportDataTable(datasourceName)));
            }

            ReportParameterInfoCollection rptparams = reportViewer.LocalReport.GetParameters();
            List<ReportParameter> lstParameters = new List<ReportParameter>();
            foreach (ReportParameterInfo parm in rptparams)
            {
                IList<string> defaultValues = parm.Values;//capture the default values as specified in rld file.

                object values = this.GetParameterValue(parm.Name);
                string[] paramValues = null;
                if (values != null && !string.IsNullOrEmpty(values.ToString()))
                {
                    if (values.GetType() == typeof(string[]))
                    {
                        paramValues = (string[])values;
                    }
                    else
                    {
                        paramValues = new string[] { values.ToString() };
                    }
                }
                //[[if the parameter screen retuens some parameter values, set those into the parameter
                //else if the paramter screen returns null, i.e. parameter screen specifically states that use null as values of a report parameter
                //and this MUST override the default values. 
                if (paramValues != null)
                {
                    lstParameters.Add(new ReportParameter(parm.Name, paramValues, false));
                }
                else
                {
                    ReportParameter objParam = new ReportParameter(parm.Name);
                    objParam.Visible = false;
                    objParam.Values.Add(null);
                    lstParameters.Add(objParam);
                }
                //]]
            }
            string printableParams = GetPrintableReportParameters(lstParameters);
            Log.Logger.Debug(printableParams);

            reportViewer.LocalReport.SetParameters(lstParameters);
            reportViewer.SetDisplayMode(DisplayMode.PrintLayout);
            reportViewer.ZoomMode = this.GetZoomModeValue();
            reportViewer.ZoomPercent = 100;
            reportViewer.Visible = true;
            this.reportViewer.RefreshReport();
            //]]
        }
        private string GetPrintableReportParameters(List<ReportParameter> lstParameters)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("About to render report with these parameters:");
            foreach (ReportParameter param in lstParameters)
            {
                StringBuilder sbValues = new StringBuilder();
                foreach (string item in param.Values)
                {
                    sbValues.Append(item + ", ");
                }
                string vals = sbValues.ToString();
                if(vals.EndsWith(", "))
                {
                    vals = vals.Substring(0,vals.Length-2);
                }
                sb.AppendLine(param.Name + " : " + vals);
                
                
            }
            return sb.ToString();
        }
        public override bool EnableReportExport
        {
            get
            {
                return this.reportViewer.ShowExportButton;
            }
            set
            {
                this.reportViewer.ShowExportButton = true;
            }
        }      
    }
    [Serializable]
    public sealed class CDFReportServerCredentials :
        IReportServerCredentials
    {
        public WindowsIdentity ImpersonationUser
        {
            get
            {
                // Use the default Windows user.  Credentials will be
                // provided by the NetworkCredentials property.
                return null;
            }
        }

        public ICredentials NetworkCredentials
        {
            get
            {
                // Read the user information from the Web.config file.  
                // By reading the information on demand instead of 
                // storing it, the credentials will not be stored in 
                // session, reducing the vulnerable surface area to the
                // Web.config file, which can be secured with an ACL.

                // User name
                //string userName =
                //    ConfigurationManager.AppSettings
                //        ["MyReportViewerUser"];

                //if (string.IsNullOrEmpty(userName))
                //    throw new Exception(
                //        "Missing user name from web.config file");

                //// Password
                //string password =
                //    ConfigurationManager.AppSettings
                //        ["MyReportViewerPassword"];

                //if (string.IsNullOrEmpty(password))
                //    throw new Exception(
                //        "Missing password from web.config file");

                //// Domain
                //string domain =
                //    ConfigurationManager.AppSettings
                //        ["MyReportViewerDomain"];

                //if (string.IsNullOrEmpty(domain))
                //    throw new Exception(
                //        "Missing domain from web.config file");

                //return new NetworkCredential(userName, password, domain);
                return new NetworkCredential("gnrc_rpt_usr", "nJ1bgA2LIKMEJLlFKZPg", "deravpn.net");
            }
        }

        public bool GetFormsCredentials(out Cookie authCookie,
                    out string userName, out string password,
                    out string authority)
        {
            authCookie = null;
            userName = null;
            password = null;
            authority = null;

            // Not using form credentials
            return false;
        }
    }

}
