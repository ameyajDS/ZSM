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

namespace DCC.ZOS.ZSM.RPT
{
    public partial class ImportNewSewadarsPhotos : ZSMAbstractScreen
    {
        private Dictionary<string, bool> ImageFiles = new Dictionary<string, bool>();

        private enum TableColumns
        {
            remarks,
            sewadar_id,
            sewadar_status_cd,
            full_nm,
            appointment_dt,
            remarks_sq,
            valid_cd
        }

        public ImportNewSewadarsPhotos()
        {
            InitializeComponent();
            this.txtSatsangCentreNm.DisplayText = ZSMUtility.GetSatsangCentreName();
            this.txtPhotosLocation.DisplayText = AppStateVariables.SelectedPhotoPath;
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_IMPORT_NEW_SEWADARS_PHOTOS;
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
        }

        private void btnPhotoLocation_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog folderBrowserDialog1 = new FolderBrowserDialog();
            if (!String.IsNullOrEmpty(txtPhotosLocation.DisplayText))
            {
                folderBrowserDialog1.SelectedPath = txtPhotosLocation.DisplayText;
            }
            else if (!String.IsNullOrEmpty(AppStateVariables.SelectedPhotoPath))
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
            folderBrowserDialog1.RootFolder = Environment.SpecialFolder.Personal;
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
                if (!Directory.Exists(this.txtPhotosLocation.DisplayText))
                {
                    UIManager.ShowMessage(MsgCodes.CancelProcess, "Specified photo location is not valid, ", MessageTypes.Error);
                    return false;
                }
                this.ImageFiles.Clear();
                this.dbFacade.BeginTrans();
                this.dbFacade.ClearDbTasks();
                DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select sr.remarks, vs.appointment_dt , sr.sewadar_id, vs.full_nm ,vs.sewadar_status_cd, valid_cd = siv.system_info_value from sewadars_remarks sr JOIN ViewSewadarHeader vs ON vs.sewadar_id = sr.sewadar_id LEFT OUTER JOIN system_information_values siv ON  siv.system_info_cd = 'SttsPhtClck' AND vs.sewadar_status_cd = siv.system_info_value where sr.remarks_type = 'Reference' AND vs.satsang_centre_id = '{0}'", ZSMUtility.GetSatsangCentreId())).Tables[0];
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

                DialogResult result = MessageBox.Show(this, "System is begining to import " + this.ImageFiles.Count + " photos.",
                                      "Information",
                                      MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation,
                                      MessageBoxDefaultButton.Button1);
                if (result == DialogResult.No)
                {
                    return false;
                }
                //[[Iterate over dT and find out files names for each remark
                DataTable sewadarIdTable = new DataTable();
                sewadarIdTable.Columns.Add("sewadara_id");
                foreach (DataRow row in dT.Rows)
                {
                    var remark = DbManager.GetString(row[TableColumns.remarks.ToString()]);
                    var sewadarid = DbManager.GetInteger(row[TableColumns.sewadar_id.ToString()]);
                    string imageLoc = this.txtPhotosLocation.DisplayText + "\\" + remark + lstDropDownItems.ElementAt(0).ValueMember.ToString().TrimStart('*');
                    if (this.ImageFiles.ContainsKey(imageLoc.ToLower()))
                    {
                        DataRow swRow = sewadarIdTable.NewRow();
                        swRow[0] = sewadarid;
                        sewadarIdTable.Rows.Add(swRow);
                        this.ImageFiles[imageLoc.ToLower()] = true;

                        string ext = imageLoc.Substring(imageLoc.LastIndexOf('.') + 1);
                        if (string.IsNullOrEmpty(ErrorMsg))
                        {
                            this.dbFacade.AddDbTask(this.dbFacade.InsertSewadarsPhotoAsTask(
                                DbManager.GetInteger(row[TableColumns.sewadar_id.ToString()]),
                                ZSMUtility.GetByteArrayForImage(imageLoc, ext),
                                this.dtPhotoDate.DisplayTextAsDateTime));
                        }
                        //The status of Sewadar is Temporary. If any sewadar(s) is (are) found with any other Status, 
                        //the same should be reported, and the import is aborted. 
                        if (!string.IsNullOrEmpty(DbManager.GetString(row[TableColumns.sewadar_status_cd.ToString()])) && string.IsNullOrEmpty(DbManager.GetString(row[TableColumns.valid_cd.ToString()])))
                        {
                            ErrorMsg += "\n " + DbManager.GetString(row[TableColumns.sewadar_status_cd.ToString()]) + " status sewadar " + DbManager.GetString(row[TableColumns.full_nm.ToString()]) + " included";
                        }
                        //[[The file size of the photos (determined by the extension) is greater than zero. 
                        FileInfo f = new FileInfo(imageLoc);
                        if (f.Length == 0)
                        {
                            ErrorMsg += "\n Image " + imageLoc + " has zero size";
                        }
                        if (f.LastWriteTime.Date != this.dtPhotoDate.DisplayTextAsDateTime)
                        {
                            ErrorMsg += "\n Image " + imageLoc + " has different creation date (" + f.LastWriteTime.Date.ToString() + ") from " + this.dtPhotoDate.DisplayText;
                        }
                        //]]
                        //[[The appointment date of sewadars is earlier than or same as photo date. 
                        if (DbManager.GetDateTime(row[TableColumns.appointment_dt.ToString()]) > this.dtPhotoDate.DisplayTextAsDateTime)
                        {
                            ErrorMsg += "\n Appointment date" + DbManager.GetDateTime(row[TableColumns.appointment_dt.ToString()])
                            + "of sewadar " + DbManager.GetString(row[TableColumns.full_nm.ToString()]) + "is earlier than or same as photo date";
                        }
                    }
                }
                //]]
                //[[Now find unmapped enteries
                foreach (var item in this.ImageFiles)
                {
                    if (!item.Value)
                    {
                        //[[The photo for the sewadar does not exist.
                        ErrorMsg += "\n Remarks are absent for the image " + item.Key;
                        //]]
                    }
                }
                //]]
                if (string.IsNullOrEmpty(ErrorMsg))
                {
                    this.dbFacade.DeleteSewadarsRemarksReference(ZSMUtility.GetSatsangCentreId(), sewadarIdTable);
                    UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, this.ImageFiles.Count.ToString());
                    this.dbFacade.ExecuteDbTasks();

                }
                this.dbFacade.CommitTrans();
                if (!string.IsNullOrEmpty(ErrorMsg))
                {
                    ImportPhotoErrorWindow window = new ImportPhotoErrorWindow(ErrorMsg);
                    window.ShowDialog();
                }
            }
            catch (Exception)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
            return (string.IsNullOrEmpty(ErrorMsg));
        }

        public override void Save()
        {
            //all work is done in readyToSave
            UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
        }

    }
}
