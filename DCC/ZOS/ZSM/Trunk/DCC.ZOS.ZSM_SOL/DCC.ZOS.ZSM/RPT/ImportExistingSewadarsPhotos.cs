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
using System.Drawing.Imaging;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class ImportExistingSewadarsPhotos : ZSMAbstractScreen
    {
        private Dictionary<string, bool> ImageFiles = new Dictionary<string, bool>();
        private bool hasId = true;

        private enum TableColumns
        {
            remarks, 
            system_info_value,
            sewadar_id, 
            sewadar_status_cd, 
            full_nm,
            appointment_dt,
            remarks_sq
        }

        public ImportExistingSewadarsPhotos()
        {
            InitializeComponent();
            this.txtSatsangCentreNm.DisplayText = ZSMUtility.GetSatsangCentreName();
            hasId = false;
            this.txtPhotosLocation.DisplayText = AppStateVariables.SelectedPhotoPath;
        }

        public override void ClearControls()
        {
            this.ImageFiles.Clear();
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_IMPORT_EXISTING_SEWADARS_PHOTOS;
            }
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
                if (!Directory.Exists(this.txtPhotosLocation.DisplayText))
                {
                    UIManager.ShowMessage(MsgCodes.CancelProcess, "Specified photo location is not valid, ", MessageTypes.Error);
                    return false;
                }
                this.ImageFiles.Clear();
                this.dbFacade.BeginTrans();
                this.dbFacade.ClearDbTasks();
                
                List<DropDownItem> lstDropDownItems = this.imageExtensionsListBox1.GetItems(true);
                foreach (DropDownItem item in lstDropDownItems)
                {
                    if (item.ValueMember != null)
                    {
                        string[] strFiles = Directory.GetFiles(this.txtPhotosLocation.DisplayText, item.ValueMember.ToString());
                        foreach (string str in strFiles)
                        {
                            this.ImageFiles.Add(str, false);
                            FileInfo f = new FileInfo(str);
                            string grNo = f.Name.Substring(0, f.Name.IndexOf('.'));
                            string ext = f.Name.Substring(f.Name.IndexOf('.')+1);
                            DataTable dT;
                            if(!hasId)
                                dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select vs.sewadar_id, vs.sewadar_status_cd, sv.system_info_value from  ViewSewadarHeader vs LEFT OUTER JOIN system_information_values sv ON sv.system_info_cd = 'SttsPhtClck' AND sv.system_info_value = vs.sewadar_status_cd WHERE vs.sewadar_grno = '{0}' AND vs.satsang_centre_id = '{1}' ", grNo,ZSMUtility.GetSatsangCentreId())).Tables[0];
                            else
                                dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select vs.sewadar_id, vs.sewadar_status_cd, sv.system_info_value from  ViewSewadarHeader vs LEFT OUTER JOIN system_information_values sv ON sv.system_info_cd = 'SttsPhtClck' AND sv.system_info_value = vs.sewadar_status_cd WHERE vs.sewadar_id = '{0}' AND vs.satsang_centre_id = '{1}' ", grNo, ZSMUtility.GetSatsangCentreId())).Tables[0];
                            if (dT.Rows.Count > 0)
                            {
                                if(string.IsNullOrEmpty(DbManager.GetString(dT.Rows[0][TableColumns.system_info_value.ToString()])))
                                {
                                    ErrorMsg += "\n Status of sewadar id :" + DbManager.GetInteger(dT.Rows[0][TableColumns.sewadar_id.ToString()]) + "is not of permitted type ";
                                }
                                //[[The file size of the photos (determined by the extension) is greater than zero. 
                                if (f.Length == 0)
                                {
                                    ErrorMsg += "\n Image " + str + " has zero size";
                                }
                                if (f.LastWriteTime.Date != this.dtPhotoDate.DisplayTextAsDateTime)
                                {
                                    ErrorMsg += "\n Image " + str + " has different creation date (" + f.LastWriteTime.Date.ToString() + ") from " + this.dtPhotoDate.DisplayText;
                                }
                                //]]
                                else
                                {
                                    this.dbFacade.AddDbTask(this.dbFacade.InsertSewadarsPhotoAsTask(
                                        DbManager.GetInteger(dT.Rows[0][TableColumns.sewadar_id.ToString()]),
                                        ZSMUtility.GetByteArrayForImage(str, ext),
                                        this.dtPhotoDate.DisplayTextAsDateTime));
                                }
                            }
                            else
                            {
                                ErrorMsg += "\n Unable to find any sewadar with" + 
                                    (hasId ? "Sewadar ID " : " GRNo. ") + grNo + " for specified photo " + str;
                            }
                        }
                    }
                }

                DialogResult result = MessageBox.Show(this, "System is begining to import "+ this.ImageFiles.Count + " photos.",
                                      "Information",
                                      MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation,
                                      MessageBoxDefaultButton.Button1);
                if (result == DialogResult.No)
                {
                    return false;
                }
                if (string.IsNullOrEmpty(ErrorMsg))
                {
                    this.dbFacade.ExecuteDbTasks();
                    UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, this.ImageFiles.Count.ToString());
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
        private void btnOK_Click(object sender, EventArgs e)
        {
            try
            {
                this.dbFacade.BeginTrans();
                this.dbFacade.CommitTrans();
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
            finally
            {
                this.Dispose();
            }
        }

        private void chkHasId_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkHasId.Checked)
            {
                hasId = true;
            }
            else
            {
                hasId = false;
            }
        }
    }
}
