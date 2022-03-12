using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;
using DCC.DBFacade;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.MGMT.Global;
using System.IO;
using DCC.ZOS.ZSM.RPT;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
using LumenWorks.Framework.IO.Csv;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class RegisterSewadarsInBulk : ZSMAbstractScreen
    {
        private Dictionary<string, bool> ImageFiles = new Dictionary<string, bool>();

        private enum TableColumns
        {
            photo_id,
            first_nm,
            sewadar_id
        }

        private IDictionary<string, Tuple<string, int>> _excelTableColMap = new Dictionary<string, Tuple<string, int>>();

        public RegisterSewadarsInBulk()
        {
            InitializeComponent();
            this.lblSatsangCentre.Text = ZSMUtility.GetSatsangCentreName();
            this.txtPhotosLocation.DisplayText = AppStateVariables.SelectedPhotoPath;
            this.txtExcelLoc.DisplayText = AppStateVariables.ExcelPhotoPath;
            this.ssGrNoLookup.SttsCode = "SttsApprv";
            this.ssSewadarIDLookup.SttsCode = "SttsApprv";
            this.ssSewadarLookup.SttsCode = "SttsApprv";

            _excelTableColMap.Add("s.no.", new Tuple<string, int>("", 0));
            _excelTableColMap.Add("name", new Tuple<string, int>("name", 100));
            _excelTableColMap.Add("gender", new Tuple<string, int>("gender", 1));
            _excelTableColMap.Add("is_local_sewadar", new Tuple<string, int>("is_local_sewadar", 1));
            _excelTableColMap.Add("photo_id", new Tuple<string, int>("photo_id", 20));
            _excelTableColMap.Add("department_nm", new Tuple<string, int>("department", 30));
            _excelTableColMap.Add("sub department", new Tuple<string, int>("sub_department", 30));
            _excelTableColMap.Add("telephone_no", new Tuple<string, int>("mobile", 50));
            _excelTableColMap.Add("date of birth", new Tuple<string, int>("date_of_birth", 0));
            _excelTableColMap.Add("occupation", new Tuple<string, int>("occupation", 30));
            _excelTableColMap.Add("to_be_migrated", new Tuple<string, int>("to_be_registered", 1));
            _excelTableColMap.Add("appointment date", new Tuple<string, int>("appointment_year", 4));
            _excelTableColMap.Add("old_grno", new Tuple<string, int>("old_grno", 10));
            _excelTableColMap.Add("married", new Tuple<string, int>("is_married", 1));
            _excelTableColMap.Add("initiated", new Tuple<string, int>("is_initiated", 1));
            _excelTableColMap.Add("initiated on", new Tuple<string, int>("initiated_on", 0));
            _excelTableColMap.Add("by", new Tuple<string, int>("initiated_by", 50));
            _excelTableColMap.Add("place", new Tuple<string, int>("initiation_place", 35));
            _excelTableColMap.Add("residence address", new Tuple<string, int>("address_line_1", 50));
            _excelTableColMap.Add("residence address2", new Tuple<string, int>("address_line_2", 50));
            _excelTableColMap.Add("country", new Tuple<string, int>("country_nm", 50));
            _excelTableColMap.Add("state", new Tuple<string, int>("state_nm", 50));
            _excelTableColMap.Add("district / city", new Tuple<string, int>("district_nm", 50));
            _excelTableColMap.Add("post office / city", new Tuple<string, int>("post_office_nm", 30));
            _excelTableColMap.Add("pincode", new Tuple<string, int>("pin_or_zip_code", 6));
            _excelTableColMap.Add("residence telephone(s)", new Tuple<string, int>("telephone_residence", 50));
            _excelTableColMap.Add("office telephone(s)", new Tuple<string, int>("telephone_office", 50));
            _excelTableColMap.Add("skills", new Tuple<string, int>("skill", 20));
            _excelTableColMap.Add("qualifications", new Tuple<string, int>("qualification", 35));
            _excelTableColMap.Add("qualificationsubject", new Tuple<string, int>("qualification_subject", 20));
            _excelTableColMap.Add("attends weekly satsang", new Tuple<string, int>("attends_weekly_satsang", 1));
            _excelTableColMap.Add("weekly satsang centre", new Tuple<string, int>("weekly_satsang_centre", 40));
            _excelTableColMap.Add("address proof", new Tuple<string, int>("address_proof", 15));
            _excelTableColMap.Add("other address proof", new Tuple<string, int>("other_address_proof", 60));
            _excelTableColMap.Add("hypertension", new Tuple<string, int>("has_hypertension", 1));
            _excelTableColMap.Add("diabetic", new Tuple<string, int>("is_diabetic", 1));
            _excelTableColMap.Add("skin problem", new Tuple<string, int>("has_skin_problem", 1));
            _excelTableColMap.Add("epilepsy", new Tuple<string, int>("has_epillepsy", 1));
            _excelTableColMap.Add("medical disabilities", new Tuple<string, int>("medical_disability", 60));
            _excelTableColMap.Add("ref 1 satsang centre", new Tuple<string, int>("reference_1_centre", 40));
            _excelTableColMap.Add("ref 1 gr no", new Tuple<string, int>("reference_1_grno", 6));
            _excelTableColMap.Add("ref 1 name", new Tuple<string, int>("reference_1_nm", 40));
            _excelTableColMap.Add("ref 1 relationship", new Tuple<string, int>("reference_1_relation", 20));
            _excelTableColMap.Add("ref 1 department", new Tuple<string, int>("reference_1_department", 30));
            _excelTableColMap.Add("ref 2 satsang centre", new Tuple<string, int>("reference_2_centre", 40));
            _excelTableColMap.Add("ref 2 gr no", new Tuple<string, int>("reference_2_grno", 6));
            _excelTableColMap.Add("ref 2 name", new Tuple<string, int>("reference_2_nm", 40));
            _excelTableColMap.Add("ref 2 relationship", new Tuple<string, int>("reference_2_relation", 20));
            _excelTableColMap.Add("ref 2 department", new Tuple<string, int>("reference_2_department", 30));
            _excelTableColMap.Add("sponsorer centre", new Tuple<string, int>("sponsorer_centre", 40));
            _excelTableColMap.Add("sponsorer gr no", new Tuple<string, int>("sponsorer_grno", 6));
            _excelTableColMap.Add("security centre", new Tuple<string, int>("security_centre", 40));
            _excelTableColMap.Add("security gr no", new Tuple<string, int>("security_grno", 6));
            _excelTableColMap.Add("area secretary", new Tuple<string, int>("area_secretary_centre", 40));
            _excelTableColMap.Add("centre secretary", new Tuple<string, int>("secretary_centre", 40));
            _excelTableColMap.Add("is_name_overridden", new Tuple<string, int>("", 0));
            _excelTableColMap.Add("dept_remarks", new Tuple<string, int>("", 0));
            _excelTableColMap.Add("other remarks", new Tuple<string, int>("", 0));
            
            
            _excelTableColMap.Add("sewadar status", new Tuple<string, int>("", 0));
            _excelTableColMap.Add("ss satsang centre", new Tuple<string, int>("", 0));
            _excelTableColMap.Add("ss gr no", new Tuple<string, int>("", 0));
            _excelTableColMap.Add("status date", new Tuple<string, int>("", 0));
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_REGISTER_SEWADARS_IN_BULK;
            }
        }

        public override void ClearControls()
        {
            this.ImageFiles.Clear();
        }

        public override void ShowScreen(DCC.UMB.CDF.Configuration.UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ClearControls();
            if (string.IsNullOrEmpty(this.ssZsmSatsangCentresLookup.DisplayText))
                this.ssZsmSatsangCentresLookup.SetControlValues(ZSMUtility.GetSatsangCentreName(), ZSMUtility.GetSatsangCentreName(),
                    ZSMUtility.GetSatsangCentreId().ToString());
        }

        private void btnPhotoLocation_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog folderBrowserDialog1 = new FolderBrowserDialog();
            if (!String.IsNullOrEmpty(AppStateVariables.SelectedPhotoPath))
            {
                folderBrowserDialog1.SelectedPath = AppStateVariables.SelectedPhotoPath;
            }
            DialogResult result = folderBrowserDialog1.ShowDialog(this);
            // Set the help text description for the FolderBrowserDialog.
            folderBrowserDialog1.Description =
                "Select the directory that you want to use as the default.";

            // Do not allow the user to create new files via the FolderBrowserDialog.
            folderBrowserDialog1.ShowNewFolderButton = false;

            // Default to the My Documents folder.
            folderBrowserDialog1.RootFolder = Environment.SpecialFolder.MyDocuments;
            if (result == DialogResult.OK)
            {
                this.txtPhotosLocation.DisplayText = folderBrowserDialog1.SelectedPath;
                AppStateVariables.SelectedPhotoPath = folderBrowserDialog1.SelectedPath;
            }
        }
        public override bool IsReadyToSave()
        {
            return base.IsReadyToSave() && PerformValidationChecks();
        }

        private bool PerformValidationChecks()
        {
            string ErrorMsg = string.Empty;
            try
            {
                this.ImageFiles.Clear();
                DataTable sewadarRegisterations = new DataTable();

                string errorMsg = ReadCsv(ref sewadarRegisterations);
                if (!string.IsNullOrEmpty(errorMsg))
                {
                    ImportPhotoErrorWindow window = new ImportPhotoErrorWindow(errorMsg);
                    window.ShowDialog();
                    return false;
                }
                this.dbFacade.ReportDiscrepanciesBulkRegister(sewadarRegisterations, ZSMUtility.GetSatsangCentreName(), ZSMUtility.GetSatsangCentreId(), ref ErrorMsg);
                DataTable dT = this.dbFacade.QueryPhotoIdsBulkRegister().Tables[0];
                List<DropDownItem> lstDropDownItems = this.imageExtensionsListBox1.GetItems(true);
                if (lstDropDownItems.Count != 1)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "A value for image type ", MessageTypes.Error);
                    return false;
                }
                foreach (DropDownItem item in lstDropDownItems)
                {
                    if (item.ValueMember != null)
                    {
                        string[] strFiles = Directory.GetFiles(txtPhotosLocation.DisplayText, item.ValueMember.ToString());
                        foreach (string str in strFiles)
                        {
                            this.ImageFiles.Add(str.ToLower(), false);
                        }
                    }
                }
                //[[Iterate over dT and find out files names for each remark
                foreach (DataRow row in dT.Rows)
                {
                    //[[The file name matches with remarks in table sewadar_remarks (so that remarks_type is Reference and remarks_sq is 1). 
                    {
                        string imageLoc = this.txtPhotosLocation.DisplayText + "\\" + DbManager.GetString(row[TableColumns.photo_id.ToString()]) + "-" + DbManager.GetString(row[TableColumns.first_nm.ToString()]) + lstDropDownItems.ElementAt(0).ValueMember.ToString().TrimStart('*');
                        if (!this.ImageFiles.ContainsKey(imageLoc.ToLower()))
                        {
                            //Photo ID in the Excel Sheet does not have the Photo in the Photos Folder.
                            ErrorMsg += "\nPhoto is absent for " + DbManager.GetString(row[TableColumns.first_nm.ToString()]) + " with photo id " + DbManager.GetString(row[TableColumns.photo_id.ToString()]);
                        }
                        else
                        {
                            this.ImageFiles[imageLoc.ToLower()] = true;
                            string ext = imageLoc.Substring(imageLoc.LastIndexOf('.') + 1);
                            //[[The file size of the photos (determined by the extension) is greater than zero. 
                            FileInfo f = new FileInfo(imageLoc);
                            if (f.Length == 0)
                            {
                                ErrorMsg += "\nImage " + imageLoc + " has zero size";
                            }
                            if (f.LastWriteTime.Date != this.dtPhotoDate.DisplayTextAsDateTime)
                            {
                                ErrorMsg += "\nImage " + imageLoc + " has different creation date (" + f.LastWriteTime.Date.ToString("dd MMM yyyy") + ") from " + this.dtPhotoDate.DisplayText;
                            }
                            //]]
                        }
                    }
                    //]]
                }
                //]]
                //[[Now find unmapped enteries
                foreach (var item in this.ImageFiles)
                {
                    if (!item.Value)
                    {
                        //[[Photo in the Photos folder does not have the Photo ID in the Excel Sheet.
                        ErrorMsg += "\nPhoto ID are absent for the image " + item.Key;
                        //]]
                    }
                }
                //]]
                if (!string.IsNullOrEmpty(ErrorMsg))
                {
                    ImportPhotoErrorWindow window = new ImportPhotoErrorWindow(ErrorMsg);
                    window.ShowDialog();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return (string.IsNullOrEmpty(ErrorMsg));
        }

        private string ReadCsv(ref DataTable sewadarRegisterations)
        {
            StringBuilder errorMessage = new StringBuilder();
            // open the file "data.csv" which is a CSV file with headers
            using (CsvReader csv = new CsvReader(new StreamReader(this.txtExcelLoc.DisplayText), true))
            {
                // missing fields will not throw an exception,
                // but will instead be treated as if there was a null value
                csv.MissingFieldAction = MissingFieldAction.ReplaceByNull;
                // to replace by "" instead, then use the following action:
                //csv.MissingFieldAction = MissingFieldAction.ReplaceByEmpty;
                int fieldCount = csv.FieldCount;
                string[] headers = csv.GetFieldHeaders();

                sewadarRegisterations.Columns.Add(new DataColumn("name", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("gender", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("is_local_sewadar", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("photo_id", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("department", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("sub_department", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("mobile", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("date_of_birth", typeof(DateTime)));
                sewadarRegisterations.Columns.Add(new DataColumn("occupation", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("to_be_registered", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("appointment_year", typeof(Int16)));
                sewadarRegisterations.Columns.Add(new DataColumn("old_grno", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("is_married", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("is_initiated", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("initiated_on", typeof(DateTime)));
                sewadarRegisterations.Columns.Add(new DataColumn("initiated_by", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("initiation_place", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("address_line_1", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("address_line_2", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("country_nm", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("state_nm", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("district_nm", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("post_office_nm", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("pin_or_zip_code", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("telephone_residence", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("telephone_office", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("skill", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("qualification", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("qualification_subject", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("attends_weekly_satsang", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("weekly_satsang_centre", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("address_proof", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("other_address_proof", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("has_hypertension", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("is_diabetic", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("has_skin_problem", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("has_epillepsy", typeof(char)));
                sewadarRegisterations.Columns.Add(new DataColumn("medical_disability", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_1_centre", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_1_grno", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_1_nm", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_1_relation", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_1_department", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_2_centre", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_2_grno", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_2_nm", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_2_relation", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("reference_2_department", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("sponsorer_centre", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("sponsorer_grno", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("security_centre", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("security_grno", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("area_secretary_centre", typeof(String)));
                sewadarRegisterations.Columns.Add(new DataColumn("secretary_centre", typeof(String)));


                string expectedColumns = "Expected column names: ";
                var excelColumns = _excelTableColMap.Keys;
                foreach (string column in excelColumns)
                {
                    expectedColumns += column + ", ";
                }
                string invalidColumnNames = "";
                headers = headers.Select(x => x.ToLower()).ToArray();
                foreach (var header in headers)
                {
                    if (excelColumns.Where(x => x.ToLower().Equals(header)).Count() == 0)
                    {
                        invalidColumnNames += header + ", ";
                    }
                }
                if (!String.IsNullOrEmpty(invalidColumnNames))
                {
                    invalidColumnNames += "\n" + expectedColumns;
                    return invalidColumnNames;
                }

                while (csv.ReadNextRecord())
                {
                    DataRow dataRow = sewadarRegisterations.NewRow();
                    for (int i = 0; i < fieldCount; i++)
                    {
                        var tuple = _excelTableColMap[headers[i]];
                        var systemHeader = tuple.Item1;
                        var length = tuple.Item2;
                        if (_excelTableColMap.Keys.Contains(headers[i])
                            && !string.IsNullOrEmpty(tuple.Item1))
                        {
                            if (headers[i] == "date of birth")
                            {
                                DateTime dob = new DateTime();
                                bool success = DateTime.TryParse(csv[i], out dob);
                                if (success)
                                    dataRow[systemHeader] = dob;
                                else
                                    errorMessage.AppendLine("Invalid date of birth for photo ID " + dataRow["photo_id"]);
                            }
                            else if (headers[i] == "appointment date")
                            {
                                if (!string.IsNullOrEmpty(csv[i].Trim()))
                                {
                                    DateTime aoy = new DateTime();
                                    bool success = DateTime.TryParse(csv[i], out aoy);
                                    if (success)
                                        dataRow[systemHeader] = aoy.Year;
                                    else
                                        errorMessage.AppendLine("Invalid appointment date for photo ID " + dataRow["photo_id"]);
                                }
                                //else
                                //{
                                //    SetData(csv, dataRow, i, systemHeader);
                                //}
                            }
                            else if (headers[i] == "initiated on")
                            {
                                if (csv[i] != null && !string.IsNullOrEmpty(csv[i].ToString()))
                                {
                                    DateTime initiaitedon = new DateTime();
                                    bool success = DateTime.TryParse(csv[i], out initiaitedon);
                                    if (success)
                                        dataRow[systemHeader] = initiaitedon;
                                    else
                                        errorMessage.AppendLine("Invalid initaited on for photo ID " + dataRow["photo_id"]);
                                }
                                //else
                                //{
                                //    SetData(csv, dataRow, i, systemHeader);
                                //}
                            }
                            else if (headers[i] == "residence address")
                            {
                                if (csv[i].Trim().Length > length)
                                {
                                    var values = csv[i].Split(',');
                                    string addressline1 = "";
                                    string addressline2 = "";
                                    bool movetoadd2 = false;
                                    foreach (string str in values)
                                    {
                                        if (addressline1.Length + str.Length + 2 < 50 && !movetoadd2)
                                        {
                                            addressline1 += str;
                                            addressline1 += ", ";
                                        }
                                        else
                                        {
                                            movetoadd2 = true;
                                            addressline2 += str;
                                            addressline2 += ", ";
                                        }
                                    }
                                    if (addressline2.Length > length)
                                    {
                                        errorMessage.AppendLine("Following address is going outside the range \n" + addressline1 + "\n" + addressline2 + " FOR photoID " + dataRow["photo_id"]);
                                    }
                                    dataRow[systemHeader] = addressline1.Trim().TrimEnd(',');
                                    dataRow[_excelTableColMap["residence address2"].Item1] = addressline2.Trim().TrimEnd(',');
                                }
                                else
                                {
                                    SetData(csv, dataRow, i, systemHeader);
                                }
                            }
                            else
                            {
                                if (csv[i].Trim().Length > length)
                                {
                                    errorMessage.AppendLine("Column:" + systemHeader + " value: " + csv[i] + " is out of range! For photo ID " + dataRow["photo_id"]);
                                }
                                else if (dataRow.Table.Columns[systemHeader].DataType == typeof(char) && csv[i].Trim().Length != length)
                                {
                                    errorMessage.AppendLine("Column:" + systemHeader + " value: " + csv[i] + " is not valid  for photo ID" + dataRow["photo_id"]);
                                }
                                else
                                {
                                    SetData(csv, dataRow, i, systemHeader);
                                }
                            }
                        }
                    }
                    sewadarRegisterations.Rows.Add(dataRow);
                }
            }

            return errorMessage.ToString();
        }

        private static void SetData(CsvReader csv, DataRow dataRow, int i, string systemHeader)
        {
            if (string.IsNullOrEmpty(csv[i].Trim()))
            {
                dataRow[systemHeader] = null;
            }
            else
            {
                dataRow[systemHeader] = csv[i].Trim();
            }
        }

        private void RegisterAndSavePhotos()
        {

            try
            {
                this.ImageFiles.Clear();
                List<DropDownItem> lstDropDownItems = this.imageExtensionsListBox1.GetItems(true);

                this.dbFacade.BeginTrans();
                this.dbFacade.BulkSewadarsRegister(ZSMUtility.GetSatsangCentreName(), ZSMUtility.GetSatsangCentreId(), this.ssSewadarLookup.IdTextAsInteger,
                        this.dtPhotoDate.DisplayTextAsDateTime);

                DataTable dT = this.dbFacade.QueryPhotoIdsBulkRegister().Tables[0];

                foreach (DropDownItem item in lstDropDownItems)
                {
                    if (item.ValueMember != null)
                    {
                        string[] strFiles = Directory.GetFiles(txtPhotosLocation.DisplayText, item.ValueMember.ToString());
                        foreach (string str in strFiles)
                        {
                            this.ImageFiles.Add(str.ToLower(), false);
                        }
                    }
                }

                this.dbFacade.ClearDbTasks();
                //[[Iterate over dT and find out files names for each remark
                foreach (DataRow row in dT.Rows)
                {
                    string imageLoc = this.txtPhotosLocation.DisplayText + "\\" + DbManager.GetString(row[TableColumns.photo_id.ToString()]) + "-" + DbManager.GetString(row[TableColumns.first_nm.ToString()]) + lstDropDownItems.ElementAt(0).ValueMember.ToString().TrimStart('*');
                    string ext = imageLoc.Substring(imageLoc.LastIndexOf('.') + 1);
                    this.dbFacade.AddDbTask(this.dbFacade.InsertSewadarsPhotoAsTask(
                        DbManager.GetInteger(row[TableColumns.sewadar_id.ToString()]),
                        ZSMUtility.GetByteArrayForImage(imageLoc, ext),
                        this.dtPhotoDate.DisplayTextAsDateTime));
                }
                //]]
                UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, this.ImageFiles.Count.ToString());
                this.dbFacade.ExecuteDbTasks();
                this.dbFacade.CommitTrans();
            }
            catch (Exception)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
        }

        public override void Save()
        {
            DialogResult result = MessageBox.Show(this, "System is beginning to create Sewadars in bulk. This will change your database irreversibly. Proceed with caution.",
                      "Warning",
                      MessageBoxButtons.YesNo, MessageBoxIcon.Warning,
                      MessageBoxDefaultButton.Button1);
            if (result == DialogResult.Yes)
            {
                RegisterAndSavePhotos();
                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
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
                    AppStateVariables.ExcelPhotoPath = txtExcelLoc.DisplayText;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }
        }

        private void ssGrNoLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssGrNoLookup_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.ssGrNoLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssSewadarLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.ssSewadarLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.ssSewadarLookup_LookupResultSet(null, e);
                }
            }
        }

        private void ssSewadarIDLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssSewadarIDLookup_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.ssSewadarIDLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssSewadarLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.ssSewadarLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.ssSewadarLookup_LookupResultSet(null, e);
                }
            }
        }

        private void ssSewadarLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssSewadarLookup_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.ssSewadarLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssGrNoLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]));
                    this.ssGrNoLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.ssSewadarIDLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_id"]));
                    this.ssSewadarIDLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT sewadar_status_nm, responsibility, sewa_years=DATEDIFF(YEAR, appointment_dt, GETDATE()) FROM ViewSewadarHeader WHERE sewadar_id = " + this.ssSewadarIDLookup.IdText).Tables[0];
                    this.ssResponsibilityCombo.DisplayText = dT.Rows[0]["responsibility"].ToString();
                    this.ssStatus.DisplayText = dT.Rows[0]["sewadar_status_nm"].ToString();
                    this.ssintYearsInSewa.DisplayText = dT.Rows[0]["sewa_years"].ToString();
                }
            }
        }

    }
}
