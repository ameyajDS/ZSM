using DCC.UMB.CDF.DB;
using DCC.ZOS.ZSM.Controls.Utils;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using LumenWorks.Framework.IO.Csv;
using System.IO;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.MGMT.Controller;
using System.Globalization;
using System.Threading;
using DCC.ZOS.ZSM.RPT;
using DCC.UMB.CDF.Utils;
using System.Threading.Tasks;


namespace DCC.ZOS.ZSM.ACT
{
    public partial class ImportScannedBadgesForJob : ZSMAbstractScreen
    {

        private bool bIsDateWise = true;
        private Boolean bHasSubJobs = false;
        private string _procedure_nm = "";
        private string _scanning_job_type_cd = "";
        public short scanning_job_id = 0;
        private string _satsangCenterCode = "";
        private bool isAnnualSewaJob = false;

        public ImportScannedBadgesForJob()
        {
            InitializeComponent();
            lkpJobName.Focus();
            this.txtSatsangCentreName.Enabled = false;
            this.txtSatsangCentreName.DisplayText = ZSMUtility.GetSatsangCentreName();
            this.dtControlingDate.Enabled = false;
            this.lkpSubJobName.Enabled = false;
            this.txtExcelLoc.Enabled = false;
            this.btn_import.Enabled = false;
            this.btn_OK.Enabled = false;
            this.btn_Reset.Enabled = false;
            table_count.Text = "Total count = 0";
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            DataTable dt = objDbManager.ExecuteSQL("Select centre_cd from satsang_centres_details where centre_nm = '" + ZSMUtility.GetSatsangCentreName() + "'").Tables[0];

            _satsangCenterCode = dt.Rows[0]["centre_cd"] as string;
            var ciUS = new CultureInfo("en-US");
            var ciUK = new CultureInfo("en-GB");
            var formats = new[] { "dd-MM-yyyy HH:mm:ss", "dd-MMM-yyyy HH:mm:ss", "dd MMM yyyy HH:mm:ss",
                        "dd/MM/yyyy HH:mm:ss", "d/M/yyyy HH:mm:ss", "MM/dd/yyyy HH:mm:ss",
                        "MMM/dd/yyyy HH:mm:ss", "MMM dd yyyy HH:mm:ss" }
                .Union(ciUK.DateTimeFormat.GetAllDateTimePatterns())
                .Union(ciUS.DateTimeFormat.GetAllDateTimePatterns()).ToArray();
            cboDateFormat.DataSource = formats;
        }

        private void dccTableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_IMPORT_SCANNED_BADGES;
            }
        }


        public override void ClearControls()
        {

            this.txtSatsangCentreName.DisplayText = ZSMUtility.GetSatsangCentreName();
            bIsDateWise = true;

        }

        private void lkpJobName_LookupDialogShowing(object sender, UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            ClearControls();
            //e.LookupSqlString = e.LookupSqlString.Replace("2=2", "sj.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void lkpJobName_LookupResultSet(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs e)
        {
            this.dtJobStartFinish.FromDate = DbManager.GetDateTime(e.LookupResult.SelectedRecords[0]["effective_from"]);
            this.dtJobStartFinish.ToDate = DbManager.GetDateTime(e.LookupResult.SelectedRecords[0]["effective_till"]);

            bIsDateWise = DbManager.GetBool(e.LookupResult.SelectedRecords[0]["is_date_wise"]);
            _procedure_nm = DbManager.GetString(e.LookupResult.SelectedRecords[0]["procedure_nm"]);
            _scanning_job_type_cd = DbManager.GetString(e.LookupResult.SelectedRecords[0]["scanning_job_type_cd"]);
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

            scanning_job_id = DbManager.GetShort(e.LookupResult.SelectedRecords[0]["scanning_job_id"]);

            if (DbManager.GetInteger(dTsubJobCount.Rows[0]["sub_job_count"]) == 1)
            {
                sqlQuery = string.Format("SELECT scanning_sub_job_id, scanning_sub_job_nm FROM scanning_sub_jobs " +
                        "WHERE	scanning_job_id = '{0}' ", DbManager.GetShort(e.LookupResult.SelectedRecords[0]["scanning_job_id"]));
                DataTable dTsubJobs = this.dbFacade.ObjDBManager.ExecuteSQL(sqlQuery).Tables[0];
                this.lkpSubJobName.SetControlValues(DbManager.GetString(dTsubJobs.Rows[0]["scanning_sub_job_nm"]),
                    DbManager.GetString(dTsubJobs.Rows[0]["scanning_sub_job_nm"]),
                    DbManager.GetString(dTsubJobs.Rows[0]["scanning_sub_job_id"]));
            }
            if (_scanning_job_type_cd == "AnnualSewa")
            {
                btnProcess.Visible = true;
                isAnnualSewaJob = true;
            }
        }


        private void btnExcelLoc_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialogForSignature = new OpenFileDialog();
            if (!String.IsNullOrEmpty(AppStateVariables.ExcelPhotoPath))
            {
                openFileDialogForSignature.FileName = AppStateVariables.ExcelPhotoPath;
            }
            openFileDialogForSignature.Filter = "CSV files (*.csv)|*.csv";
            openFileDialogForSignature.FilterIndex = 2;
            openFileDialogForSignature.RestoreDirectory = true;

            if (openFileDialogForSignature.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    this.txtExcelLoc.DisplayText = openFileDialogForSignature.FileName;
                    // AppStateVariables.ExcelPhotoPath = txtExcelLoc.DisplayText;
                    this.btn_import.Enabled = true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }
        }

        public DataTable readOldCSVFormat(string filePath)
        {

            var dt = new DataTable();
            if (System.IO.File.Exists(filePath))
            {
                // open the file "data.csv" which is a CSV file with headers
                using (CsvReader csv = new CsvReader(new StreamReader(filePath), false))
                {
                    // missing fields will not throw an exception,
                    // but will instead be treated as if there was a null value
                    csv.MissingFieldAction = MissingFieldAction.ReplaceByNull;

                    // to replace by "" instead, then use the following action:
                    int fieldCount = csv.FieldCount;
                    dt.Columns.Add("GrNo", typeof(string));
                    dt.Columns.Add("ScannedDTM", typeof(DateTime));
                    string dateTimeFormat = "";
                    if (chkSpecifyFormat.Checked)
                        dateTimeFormat = cboDateFormat.SelectedItem == null ? cboDateFormat.Text : cboDateFormat.SelectedItem.ToString();
                    var currentDateTimeFormat = String.Format("{0} {1}", CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern, CultureInfo.CurrentCulture.DateTimeFormat.LongTimePattern);
                    try
                    {
                        while (csv.ReadNextRecord())
                        {
                            DataRow dataRow = dt.NewRow();
                            dataRow[0] = csv[0];
                            var scannedDateTime = csv[4].ToString();
                            if (chkSpecifyFormat.Checked)
                            {
                                dataRow[1] = DateTime.ParseExact(scannedDateTime, dateTimeFormat, null);
                            }
                            else
                            {
                                DateTime scannedDate = new DateTime();
                                if (!String.IsNullOrEmpty(scannedDateTime))
                                {
                                    scannedDate = DateTime.ParseExact(scannedDateTime, currentDateTimeFormat, CultureInfo.CurrentCulture);
                                }
                                dataRow[1] = scannedDate;
                            }
                            dt.Rows.Add(dataRow);
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                        return dt;
                    }
                }
                return dt;
            }
            return null;
        }

        public DataTable readCSV(string filePath)
        {

            var dt = new DataTable();
            if (System.IO.File.Exists(filePath))
            {
                // open the file "data.csv" which is a CSV file with headers
                using (CsvReader csv = new CsvReader(new StreamReader(filePath), false))
                {
                    // missing fields will not throw an exception,
                    // but will instead be treated as if there was a null value
                    csv.MissingFieldAction = MissingFieldAction.ReplaceByNull;

                    // to replace by "" instead, then use the following action:
                    int fieldCount = csv.FieldCount;
                    dt.Columns.Add("GrNo", typeof(string));
                    dt.Columns.Add("InScannedDTM", typeof(DateTime));
                    dt.Columns.Add("OutScannedDTM", typeof(DateTime));
                    dt.Columns.Add("AttendanceDt", typeof(DateTime));
                    string dateTimeFormat = "";
                    if (chkSpecifyFormat.Checked)
                        dateTimeFormat = cboDateFormat.SelectedItem == null ? cboDateFormat.Text : cboDateFormat.SelectedItem.ToString();
                    var currentDateTimeFormat = String.Format("{0} {1}", CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern, CultureInfo.CurrentCulture.DateTimeFormat.LongTimePattern);
                    try
                    {
                        while (csv.ReadNextRecord())
                        {
                            DataRow dataRow = dt.NewRow();
                            dataRow[0] = csv[0];
                            string inScannedDateTime = "";
                            string outScannedDateTime = "";
                            string attendanceDate = "";
                            if (chkImportFormat.Checked)
                            {
                                inScannedDateTime = csv[4].ToString();
                            }
                            else
                            {
                                inScannedDateTime = csv[1].ToString();
                                outScannedDateTime = csv[2].ToString();
                                attendanceDate = csv[3].ToString();
                            }
                            if (chkSpecifyFormat.Checked)
                            {
                                dataRow[1] = DateTime.ParseExact(inScannedDateTime, dateTimeFormat, null);
                                dataRow[2] = DateTime.ParseExact(outScannedDateTime, dateTimeFormat, null);
                                dataRow[3] = DateTime.ParseExact(attendanceDate, dateTimeFormat, null);
                            }
                            else
                            {
                                DateTime inScannedDate = new DateTime();
                                //var matchingCulture = CultureInfo.GetCultures(CultureTypes.AllCultures).
                                //    FirstOrDefault(ci => DateTime.TryParse(inScannedDateTime, ci, DateTimeStyles.None, out inScannedDate));
                                if (!String.IsNullOrEmpty(inScannedDateTime))
                                {
                                    inScannedDate = DateTime.ParseExact(inScannedDateTime, currentDateTimeFormat, CultureInfo.CurrentCulture);
                                }
                                dataRow[1] = inScannedDate;

                                DateTime outScannedDate = new DateTime();
                                if (!String.IsNullOrEmpty(outScannedDateTime))
                                {
                                    outScannedDate = DateTime.ParseExact(outScannedDateTime, currentDateTimeFormat, CultureInfo.CurrentCulture);
                                }
                                dataRow[2] = outScannedDate;

                                DateTime attnDate = new DateTime();
                                if (!String.IsNullOrEmpty(attendanceDate))
                                {
                                    attnDate = DateTime.ParseExact(attendanceDate, CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern, CultureInfo.CurrentCulture);
                                }
                                dataRow[3] = attnDate;
                            }
                            dt.Rows.Add(dataRow);
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                        return dt;
                    }
                }
                return dt;
            }
            return null;
        }

        private void btn_import_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable myTable;
                DataTable errorData;
                InitTables(out myTable, out errorData);

                var dt = new DataTable();
                if (chkImportFormat.Checked)
                {
                    dt = readOldCSVFormat(txtExcelLoc.DisplayText);
                }
                else
                {
                    dt = readCSV(txtExcelLoc.DisplayText);
                }
                if (dt.Rows.Count > 0)
                {
                    ImportCSVToTable(myTable, errorData, dt);
                    PostImportData(myTable, errorData);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void PostImportData(DataTable myTable, DataTable errorData)
        {
            this.grdScannedBadges.EditMode = DataGridViewEditMode.EditProgrammatically;
            this.grdScannedBadges.DataSource = myTable;
            this.grdScannedBadges.Columns[0].Width = 150;
            this.grdScannedBadges.Columns[1].Width = 250;
            this.grdScannedBadges.Columns[1].DefaultCellStyle.Format = "yyyy-MMM-dd HH:mm:ss";
            this.btn_OK.Enabled = true;
            this.btn_Reset.Enabled = true;
            table_count.Text = "Total count = " + (myTable.Rows.Count).ToString();
            if (errorData.Rows.Count > 0)
            {
                StringBuilder errorMsg = new StringBuilder("Following records have scanned date time less than controlling date or future date or attendance date is not matching:\n");

                foreach (DataRow row in errorData.Rows)
                {
                    string rowerror = "";
                    rowerror = row[0].ToString();
                    rowerror += " " + row[1].ToString();
                    rowerror += " " + row[2].ToString();
                    errorMsg.AppendLine(rowerror);
                }
                ImportPhotoErrorWindow window = new ImportPhotoErrorWindow(errorMsg.ToString());
                window.ShowDialog();
            }
        }

        private void InitTables(out DataTable myTable, out DataTable errorData)
        {
            this.grdScannedBadges.Columns.Clear();
            myTable = new DataTable();
            DataColumn grNoCol = new DataColumn("grNo", typeof(String));
            DataColumn scannedDate = new DataColumn("ScannedDate", typeof(DateTime));

            errorData = new DataTable();
            errorData.Columns.Add(grNoCol);
            errorData.Columns.Add(scannedDate);
            errorData.Columns.Add(new DataColumn("AttedanceDt", typeof(DateTime)));
            DataColumn sewadarIdCol = new DataColumn("SewadarID", typeof(String));
            DataColumn scannedDateTimeCol = new DataColumn("ScannedDateTime", typeof(DateTime));
            myTable.Columns.Add(sewadarIdCol);
            myTable.Columns.Add(scannedDateTimeCol);
        }

        private void ImportCSVToTable(DataTable myTable, DataTable errorData, DataTable dt, string filename = "")
        {
            Boolean firstError = true;
            foreach (DataRow dr in dt.Rows)
            {
                if (dr[0] != null && dr[0] != "" && dr[1] != null && dr[1] != "")
                {
                    DateTime inScannedDateTime;
                    DateTime outScannedDateTime;
                    DateTime attendanceDate;
                    if (chkImportFormat.Checked)
                    {
                        inScannedDateTime = (DateTime)dr[1];
                        outScannedDateTime = new DateTime();
                        attendanceDate = dtControlingDate.DisplayTextAsDateTime.Value.Date;
                    }
                    else
                    {
                        inScannedDateTime = (DateTime)dr[1];
                        outScannedDateTime = (DateTime)dr[2];
                        attendanceDate = (DateTime)dr[3];

                    }
                    if (inScannedDateTime.Equals(new DateTime()))
                    {
                        inScannedDateTime = outScannedDateTime;
                    }
                    if (!chkImportFormat.Checked && (inScannedDateTime.Date < dtControlingDate.DisplayTextAsDateTime.Value
                        || inScannedDateTime.Date > dtControlingDate.DisplayTextAsDateTime.Value.AddDays(1)
                        || dtControlingDate.DisplayTextAsDateTime.Value.Date != attendanceDate.Date))
                    {
                        if (firstError)
                        {
                            DataRow filerow = errorData.NewRow();
                            filerow[0] = "Errors for file: " + filename;
                            errorData.Rows.Add(filerow);
                            firstError = false;
                        }
                        DataRow row = errorData.NewRow();
                        row[0] = dr[0];
                        row[1] = dr[1];
                        row[2] = dr[3];
                        errorData.Rows.Add(row);
                        continue;
                    }
                    DataRow dataRow = myTable.NewRow();
                    dataRow[0] = dr[0];
                    dataRow[1] = inScannedDateTime;
                    myTable.Rows.Add(dataRow);
                }
                else
                {
                    MessageBox.Show("The Data Contains Blank/Empty Cells.This Entry will be skipped.");
                }
            }
        }

        private void btn_Reset_Click(object sender, EventArgs e)
        {
            this.grdScannedBadges.Columns.Clear();
            table_count.Text = "Total count = 0";
            txtExcelLoc.DisplayText = "";
            txtFolderLocation.DisplayText = "";
            btn_import.Enabled = false;
            this.btn_OK.Enabled = false;
            btnImportFolder.Enabled = false;
        }

        private void btn_OK_Click(object sender, EventArgs e)
        {
            int satsang_center_id_val = (int)ZSMUtility.GetSatsangCentreId();
            DataTable dt_new = new DataTable();
            //            scanning_sub_job_id	controlling_dt	satsang_centre_id	sewadar_grno	scanned_dtm

            dt_new.Columns.Add("scanning_sub_job_id", typeof(int));
            dt_new.Columns.Add("controlling_dt", typeof(DateTime));
            dt_new.Columns.Add("satsang_centre_id", typeof(int));
            dt_new.Columns.Add(this.grdScannedBadges.Columns[0].Name, typeof(string));
            dt_new.Columns.Add(this.grdScannedBadges.Columns[1].Name, typeof(DateTime));


            string sewadar_gr_no_val = "";

            DateTime controlling_dt_val = DateTime.Now; // case sensitive.m = minutes / M = months
            if (_scanning_job_type_cd == "AnnualSewa")
                controlling_dt_val = dtControlingDate.DisplayTextAsDateTime.Value;
            string SatsangCentreName_val = ZSMUtility.GetSatsangCentreName();

            foreach (DataGridViewRow row in this.grdScannedBadges.Rows)
            {
                //check for null values in entry row
                if (row.Cells[0].Value != null && row.Cells[0].Value != "")
                {
                    sewadar_gr_no_val = row.Cells[0].Value.ToString();

                    //check to ascertain whether the satsang center name is same as the scanned id center
                    if (_satsangCenterCode.ToUpper() == sewadar_gr_no_val.Substring(0, 3).ToUpper())
                    {
                        DataRow dRow = dt_new.NewRow();

                        dRow[0] = lkpSubJobName.IdText;
                        var controllingDate = string.Format("{0:yyyy-MM-dd}", controlling_dt_val);
                        dRow[1] = DateTime.Parse(controllingDate);
                        dRow[2] = satsang_center_id_val;
                        dRow[3] = sewadar_gr_no_val.Substring(3, sewadar_gr_no_val.Length - 3);
                        var scannedDate = string.Format("{0:yyyy-MM-dd HH:mm:ss}", row.Cells[1].Value);
                        dRow[4] = DateTime.Parse(scannedDate);
                        dt_new.Rows.Add(dRow);
                    }
                    else
                    {
                        MessageBox.Show("The sewadar grno. " + sewadar_gr_no_val + " does not belong to the center. This entry will be skipped.");
                    }
                }
            }
            try
            {
                var errorData = dbFacade.ImportBulkSewadarScannedRecords(dt_new);
                if (!string.IsNullOrEmpty(txtExcelLoc.DisplayText))
                {
                    dbFacade.InsertScannedBadgeFileAuditLog((int)scanning_job_id, txtExcelLoc.DisplayText,
                        dtControlingDate.DisplayTextAsDateTime, ZSMUtility.GetUserName(), null, null);
                }
                if (!string.IsNullOrEmpty(txtFolderLocation.DisplayText))
                {
                    string[] files = Directory.GetFiles(txtFolderLocation.DisplayText, "*.csv");
                    foreach (string file in files)
                    {
                        dbFacade.InsertScannedBadgeFileAuditLog((int)scanning_job_id, file,
                        dtControlingDate.DisplayTextAsDateTime, ZSMUtility.GetUserName(), null, null);
                    }
                }
                if (errorData.Tables.Count > 0 && errorData.Tables[0].Rows.Count > 0)
                {
                    StringBuilder errorMsg = new StringBuilder("Following records are not processed:\n");

                    foreach (DataRow row in errorData.Tables[0].Rows)
                    {
                        string rowerror = "";
                        rowerror = row["sewadar_grno"].ToString();
                        rowerror += " " + row["remarks"].ToString();
                        errorMsg.AppendLine(rowerror);
                    }
                    btn_Reset_Click(null, null);
                    ImportPhotoErrorWindow window = new ImportPhotoErrorWindow(errorMsg.ToString());
                    window.ShowDialog();
                    return;
                }
                else
                {
                    MessageBox.Show("Imported the records successfully!");
                    btn_Reset_Click(null, null);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void btnProcess_Click(object sender, EventArgs e)
        {
            if (_procedure_nm == "ProcessScannedAnnualAttendance")
            {
                try
                {
                    dbFacade.ProcessScannedAnnualAttendance(lkpJobName.IdTextAsShort, dtControlingDate.DisplayTextAsDateTime, 0);
                    dbFacade.UpdateScannedBadgeFileAuditLog((int)scanning_job_id, dtControlingDate.DisplayTextAsDateTime,
                        DateTime.Now, ZSMUtility.GetUserName());
                    MessageBox.Show("Processed data successfully");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void chkSpecifyFormat_CheckedChanged(object sender, EventArgs e)
        {
            cboDateFormat.Visible = chkSpecifyFormat.Checked;
        }

        private void btnViewLogs_Click(object sender, EventArgs e)
        {
            var dataset = dbFacade.GetScannedBadgeFileAuditLog((int)scanning_job_id);
            StringBuilder logData = new StringBuilder("");

            ShowLogs window = new ShowLogs();
            window.SetDataSource(dataset.Tables[0]);

            window.ShowDialog();

            return;
        }

        private void btnFolderLocation_Click(object sender, EventArgs e)
        {
            using (var fbd = new FolderBrowserDialog())
            {
                DialogResult result = fbd.ShowDialog();

                if (result == DialogResult.OK && !string.IsNullOrWhiteSpace(fbd.SelectedPath))
                {
                    txtFolderLocation.DisplayText = fbd.SelectedPath;
                    this.btnImportFolder.Enabled = true;
                }
            }
        }

        private void btnImportFolder_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable myTable;
                DataTable errorData;
                InitTables(out myTable, out errorData);

                string[] files = Directory.GetFiles(txtFolderLocation.DisplayText, "*.csv");

                foreach (string file in files)
                {
                    var dt = new DataTable();
                    if (chkImportFormat.Checked)
                    {
                        dt = readOldCSVFormat(file);
                    }
                    else
                    {
                        dt = readCSV(file);
                    }
                    if (dt.Rows.Count > 0)
                    {
                        ImportCSVToTable(myTable, errorData, dt, file);
                    }
                }


                DataView view = new DataView(myTable);
                DataTable distinctValues = view.ToTable(true, "SewadarID", "ScannedDateTime");

                if (distinctValues.Rows.Count > 0)
                    PostImportData(distinctValues, errorData);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void chkImportFormat_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
