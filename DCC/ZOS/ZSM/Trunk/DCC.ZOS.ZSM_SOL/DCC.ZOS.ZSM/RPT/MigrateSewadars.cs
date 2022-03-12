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
    public partial class MigrateSewadars : ZSMAbstractScreen
    {
        private Dictionary<string, bool> ImageFiles = new Dictionary<string, bool>();
        
        private enum TableColumns
        {
            centre_grno,
            photo_id,
            sewadar_id,
            first_name
        }

        public MigrateSewadars()
        {
            InitializeComponent();
            this.txtSatsangCentreNm.DisplayText = ZSMUtility.GetSatsangCentreName();
            this.txtPhotosLocation.DisplayText = AppStateVariables.SelectedPhotoPath;
            this.txtExcelLoc.DisplayText = AppStateVariables.ExcelPhotoPath;
        }

        public override string ScreenId
        {
            get
            {
                return Screens.MSC_MIGRATE_SEWADARS;
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
                this.dbFacade.FillMgrTmpSewadars(this.txtExcelLoc.DisplayText);
                this.dbFacade.ReportDiscrepancies(ZSMUtility.GetSatsangCentreName(), ZSMUtility.GetSatsangCentreId(), ref ErrorMsg);
                DataTable dT = this.dbFacade.QueryPhotoIdsToMigrate(ZSMUtility.GetSatsangCentreId().Value, "N").Tables[0];
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
                        string imageLoc = this.txtPhotosLocation.DisplayText + "\\" + DbManager.GetString(row[TableColumns.photo_id.ToString()]) + "-" + DbManager.GetString(row[TableColumns.first_name.ToString()]) + lstDropDownItems.ElementAt(0).ValueMember.ToString().TrimStart('*');
                        if (!this.ImageFiles.ContainsKey(imageLoc.ToLower()))
                        {
                            //Photo ID in the Excel Sheet does not have the Photo in the Photos Folder.
                            ErrorMsg += "\nPhoto is absent for GRNo " + DbManager.GetString(row[TableColumns.centre_grno.ToString()]);
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
                                ErrorMsg += "\nImage " + imageLoc + " has different creation date (" + f.LastWriteTime.Date.ToString() + ") from " + this.dtPhotoDate.DisplayText;
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
                        ErrorMsg += "\n Photo ID are absent for the image " + item.Key;
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

        private void MigrateAndSavePhotos()
        {
            
            try
            {
                this.ImageFiles.Clear();
                List<DropDownItem> lstDropDownItems = this.imageExtensionsListBox1.GetItems(true);

                this.dbFacade.BeginTrans();
                this.dbFacade.ClearDbTasks();
                this.dbFacade.AddDbTask(this.dbFacade.MigrateSewadarsAsTask(ZSMUtility.GetSatsangCentreName(), ZSMUtility.GetSatsangCentreId(),
                        this.dtPhotoDate.DisplayTextAsDateTime));
                this.dbFacade.ExecuteDbTasks();
                this.dbFacade.ClearDbTasks();

                DataTable dT = this.dbFacade.QueryPhotoIdsToMigrate(ZSMUtility.GetSatsangCentreId().Value, "Y").Tables[0];
                
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
                    string imageLoc = this.txtPhotosLocation.DisplayText + "\\" + DbManager.GetString(row[TableColumns.photo_id.ToString()]) + "-" + DbManager.GetString(row[TableColumns.first_name.ToString()]) + lstDropDownItems.ElementAt(0).ValueMember.ToString().TrimStart('*');
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
            DialogResult result = MessageBox.Show(this, "System is beginning to migrate. This will change your database irreversibly. Proceed with caution.",
                      "Warning",
                      MessageBoxButtons.YesNo, MessageBoxIcon.Warning,
                      MessageBoxDefaultButton.Button1);
            if (result == DialogResult.Yes)
            {
                MigrateAndSavePhotos();
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
            openFileDialogForSignature.Filter = "Excel files (*.xlsx)|*.xlsx|(*.xls)|*.xls|All files (*.*)|*.*";
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

    }
}
