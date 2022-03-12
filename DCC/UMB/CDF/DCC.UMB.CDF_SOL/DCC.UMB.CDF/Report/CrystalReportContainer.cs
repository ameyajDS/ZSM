using System;
using System.Collections;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using DCC.UMB.CDF.MGMT.Global;
using System.IO;
using System.Diagnostics;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using CrystalDecisions.Shared;

namespace DCC.UMB.CDF.Report {

    internal class CrystalReportContainer : AbstractReportContainer
    {
        

        private CrystalDecisions.Windows.Forms.CrystalReportViewer reportViewer;
        public CrystalReportContainer()
        {
            InitializeComponent();
        }
        protected override void InitializeDbFacade()
        {
            //do nothing, as no db connection is required in this screen.
        }

        internal void LoadReportPdfFromWeb(string reportServerURL, string reportFilePath)
        {
            //DCC.UMB.CDF.DbManagerWebService.DBManagerWS objDbManagerWS = new DCC.UMB.CDF.DbManagerWebService.DBManagerWS();
            WebDbManager webDbManager = (WebDbManager)GlobalAppVariables.AppContext.AppDbManager;
            FileInfo fileInfo = new FileInfo(reportFilePath);
            bool isReportFileAlreadyExistingOnServer = webDbManager.IsReportFileExisting(fileInfo.Name);
            if (!isReportFileAlreadyExistingOnServer)
            {
                UIManager.ShowMessage(MsgCodes.NoFile, @"<cdfws webserver>\Reports\" + GlobalAppVariables.AppContext.PackageId + "\\" + fileInfo.Name, MessageTypes.Error);
                return;
            }
            ReportDocument doc = new ReportDocument();
            doc.Load(reportFilePath);
            DataTable paramTable = new DataTable("paramsTable");
            paramTable.Columns.Add("name");
            paramTable.Columns.Add("value");
            paramTable.AcceptChanges();
            foreach (ParameterField field in doc.ParameterFields)
            {
                object paramValue = base.GetParameterValue(field.Name.Replace("@", string.Empty));
                doc.SetParameterValue(field.Name, paramValue);
                DataRow row = paramTable.NewRow();
                row["name"] = field.Name;
                row["value"] = paramValue.ToString();
                paramTable.Rows.Add(row);
            }

            paramTable.AcceptChanges();
            try
            {
                byte[] pdfData = webDbManager.GetReportOutput(fileInfo.Name, paramTable);
                FileInfo reportFileInfo = new FileInfo(reportFilePath);
                DirectoryInfo dirInfo = reportFileInfo.Directory;
                string generatedPDFFilePath = GetGeneratedPDFFilePath(dirInfo.FullName, reportFileInfo.Name);
                
                System.IO.File.WriteAllBytes(generatedPDFFilePath, pdfData);
                Process.Start(generatedPDFFilePath);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                //throw;
            }
         
        }

        private string GetGeneratedPDFFilePath(string targetDirectoryAbsolutePath, string reportName)
        {
            int i = 1;
            bool isValidReportPath = false;
            string generatedReportFilePath = targetDirectoryAbsolutePath + "\\" + reportName + "_" + i + ".pdf";
            while (!isValidReportPath)
            {
                if (File.Exists(generatedReportFilePath))
                {
                    isValidReportPath = false;
                    i++;
                    generatedReportFilePath = targetDirectoryAbsolutePath + "\\" + reportName + "_" + i + ".pdf";
                }
                else
                {
                    isValidReportPath = true;
                }
            }
            return generatedReportFilePath;            
           
        }
        internal override void LoadReport(string reportServerURL, string reportFilePath)
        {
            ReportDocument doc = new ReportDocument();
            doc.Load(reportFilePath);
            IEnumerator en = doc.DataDefinition.FormulaFields.GetEnumerator();
            while (en.MoveNext())
            {
                FormulaFieldDefinition formulaFieldDef = (FormulaFieldDefinition)en.Current;
                string paramValue = base.GetFormulaValue(formulaFieldDef.Name.Replace("@", string.Empty)) as string; 
                if (paramValue != null)
                    formulaFieldDef.Text = paramValue;
            }
            foreach (ParameterField field in doc.ParameterFields)
            {
                object paramValue = base.GetParameterValue(field.Name.Replace("@", string.Empty));
                doc.SetParameterValue(field.Name, paramValue);               
            }
            
            ConnectionInfo connectionInformation = new ConnectionInfo();
            connectionInformation.ServerName = GlobalAppVariables.AppContext.ServerName;
            connectionInformation.DatabaseName = GlobalAppVariables.AppContext.DatabaseName;
            connectionInformation.UserID = GlobalAppVariables.AppContext.UserRoleId;
            connectionInformation.Password = GlobalAppVariables.AppContext.UserRoleIdentity;
            

            //Loop through all tables in the report and apply the 
            //connection information for each table. 
            foreach (Table table in doc.Database.Tables)
            {
                
                TableLogOnInfo crTableLogOnInfo = table.LogOnInfo;
                Console.WriteLine(table.Name);
                crTableLogOnInfo.ConnectionInfo = connectionInformation;
                table.ApplyLogOnInfo(crTableLogOnInfo);
            }
            this.reportViewer.ReportSource = doc;
            //doc.ExportToDisk(ExportFormatType.PortableDocFormat, "c:\\aneeraj\\aatemp\\temp.pdf");
        }

        


        private void InitializeComponent()
        {
            this.reportViewer = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.SuspendLayout();
            // 
            // reportViewer
            // 
            this.reportViewer.ActiveViewIndex = -1;
            this.reportViewer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.reportViewer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.reportViewer.Location = new System.Drawing.Point(0, 0);
            this.reportViewer.Name = "reportViewer";
            this.reportViewer.SelectionFormula = "";
            this.reportViewer.Size = new System.Drawing.Size(292, 292);
            this.reportViewer.TabIndex = 0;
            this.reportViewer.ViewTimeSelectionFormula = "";
            // 
            // CrystalReportContainer
            // 
            this.ClientSize = new System.Drawing.Size(292, 292);
            this.Controls.Add(this.reportViewer);
            this.Name = "CrystalReportContainer";
            this.ResumeLayout(false);
        }
        public override bool EnableReportExport
        {
            get
            {
                return this.reportViewer.ShowExportButton;
            }
            set
            {
                this.reportViewer.ShowExportButton = value;
            }
        }
    }
}
