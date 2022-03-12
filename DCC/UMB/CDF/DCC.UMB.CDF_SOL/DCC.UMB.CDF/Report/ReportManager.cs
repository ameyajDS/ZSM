using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.UIControls.Windows;
using Microsoft.Reporting.WinForms;

namespace DCC.UMB.CDF.Report
{
    public class ReportManager 
    {
        public void SetReportData(string reportFilePath, DataSet reportData)
        {
            
        }
        private ReportViewer RptViewer = new ReportViewer();
        private ReportViewer reportViewer = new ReportViewer();
        public ReportViewer LoadReport()
        {
            ReportViewer reportViewer1 = new ReportViewer();
            //reset the report viewer properties
            reportViewer1.Reset();
            //set the report viewer to process a local report
            reportViewer1.ProcessingMode = ProcessingMode.Local;
            //set the local report path (note: the properties of the project post-build event
            // include this command in order to use this embedded report from the bin directory:
            // copy "$(ProjectDir)\Report1.rdlc" "$(TargetDir)"

            reportViewer1.LocalReport.ReportPath = "Report1.rdlc";

            //add a datasource to the report viewer
            // note: this must be a data table
            reportViewer1.LocalReport.DataSources.Add(GetMyData());

            //this will refresh the report in the viewer with the above settings
            reportViewer1.RefreshReport();
            return reportViewer1;
        }
        private ReportDataSource GetMyData()
        {
            DataSet ds = new DataSet();
            //return the ReportDataSource
            // The string value must be the same name as the report's datasource (go to Report -> DataSources to see this name)
            // The table is from the the DataSet.
            
            return new ReportDataSource("LocalReportSample_mySampleWebService_ReportSummaryMsg", ds.Tables[0]);
            
        }
        private void btnReport_Click(object sender, EventArgs e)
        {
            RptViewer.ProcessingMode = Microsoft.Reporting.WinForms.ProcessingMode.Local;
            RptViewer.LocalReport.ReportPath = @"C:\MY WORK\Reporting Service\Rporting Service\sales.rdl";
            RptViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("sales", GetSalesData()));
            SetReportParameter("");
            RptViewer.Visible = true;
            RptViewer.RefreshReport();
        }

        private DataTable GetSalesData()
        {
            SqlCommand cmd = new SqlCommand("GetSales", new SqlConnection("Data Source=ABC;Initial Catalog=MYDatabase;Integrated Security=SSPI;Persist Security Info=False;"));
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 1000;
            cmd.Parameters.AddWithValue("@pCenterId", "9B95363B-F82D-4E55-AD89-2AD928AC981F");
            cmd.Parameters.AddWithValue("@pEmployeeId", DBNull.Value);
            cmd.Parameters.AddWithValue("@pclientId", DBNull.Value);
            cmd.Parameters.AddWithValue("@pStartDate ", "06/04/2007");
            cmd.Parameters.AddWithValue("@pEndDate ", "06/09/2007");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }


        private void SetReportParameter(string ReportTitle)
        {
            Microsoft.Reporting.WinForms.ReportParameterInfoCollection ParInfo;
            Microsoft.Reporting.WinForms.ReportParameter[] RepParameter;
            ParInfo = RptViewer.LocalReport.GetParameters();
            RepParameter = new Microsoft.Reporting.WinForms.ReportParameter[ParInfo.Count];
            for (int j = 0; j < ParInfo.Count; j++)
            {
                switch (ParInfo[j].Name.ToLower())
                {
                    case "centername":
                        RepParameter[j] = new Microsoft.Reporting.WinForms.ReportParameter("CenterName", "Bensalem", false);
                        break;
                    case "centernum":
                        RepParameter[j] = new Microsoft.Reporting.WinForms.ReportParameter("CenterNum", "12345", false);
                        break;
                    case "pcenterid":
                        RepParameter[j] = new Microsoft.Reporting.WinForms.ReportParameter("pCenterID", "9B95363B-F82D-4E55-AD89-2AD928AC981F", false);

                        break;

                    case "pemployeeid":

                        RepParameter[j] = new Microsoft.Reporting.WinForms.ReportParameter("pEmployeeid", DBNull.Value.ToString());

                        break;

                    case "pclientid":

                        RepParameter[j] = new Microsoft.Reporting.WinForms.ReportParameter("pClientId", DBNull.Value.ToString());

                        break;

                    case "pstartdate":

                        RepParameter[j] = new Microsoft.Reporting.WinForms.ReportParameter("pStartDate", "06/04/2007");

                        break;

                    case "penddate":

                        RepParameter[j] = new Microsoft.Reporting.WinForms.ReportParameter("pEndDate", "06/09/2007");

                        break;

                }

            }

            RptViewer.LocalReport.SetParameters(RepParameter);

        }

        public void ExportToExcel()
        {
            string mimetype;

            string encoding;

            string ext;

            string[] streamids = new string[5];

            Microsoft.Reporting.WinForms.Warning[] warnings = new Microsoft.Reporting.WinForms.Warning[5];

            try
            {

                byte[] bytes = RptViewer.LocalReport.Render("Excel", "<DeviceInfo> <SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>", out mimetype, out encoding, out ext, out streamids, out warnings);

                using (FileStream fs = new FileStream(@"c:\Monthly Sales.xls", FileMode.Create))
                {

                    fs.Write(bytes, 0, bytes.Length);

                    fs.Close();

                }
            }
            catch (Exception ex)
            {
            }
        }

        private void InitializeComponent()
        {
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer = new Microsoft.Reporting.WinForms.ReportViewer();
            this.SuspendLayout();
            // 
            // reportViewer
            // 
            this.reportViewer.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "SysAdminDataSet_GetPackages";
            reportDataSource1.Value = null;
            this.reportViewer.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer.LocalReport.ReportEmbeddedResource = "WindowsFormsApplication2.Report1.rdlc";
            this.reportViewer.Location = new System.Drawing.Point(0, 0);
            this.reportViewer.Name = "reportViewer";
            this.reportViewer.Size = new System.Drawing.Size(292, 292);
            this.reportViewer.TabIndex = 3;
            // 
            // ReportManager
            // 
            this.ClientSize = new System.Drawing.Size(292, 292);
            this.Controls.Add(this.reportViewer);
            this.Name = "ReportManager";
            this.ResumeLayout(false);

        }
    }
}
