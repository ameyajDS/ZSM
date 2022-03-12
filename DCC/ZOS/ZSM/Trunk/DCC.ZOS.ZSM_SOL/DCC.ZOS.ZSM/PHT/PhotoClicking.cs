using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.Lookup.Modal;
using System.Collections;
using System.Runtime.InteropServices;
using System.Drawing.Imaging;
using DCC.UMB.CDF.UIControls;
using System.Threading;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.PHT
{

    public partial class PhotoClicking : ZSMAbstractScreen
    {
        public PhotoClicking()
        {
            InitializeComponent();
            WebCam.ImageCaptured += new WebCam.WebCamEventHandler(WebCamCapture_ImageCaptured);
            ClearControls();
            this.sewadarHeader1.SttsCode = "SttsPhtClck";
        }

        public override string ScreenId
        {
            get
            {
                return Screens.PHOTO_EXISTING_SEWADARS_PHOTO_CLICKING;
            }
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            ClearControls();
            if (this.CurrentUIMode == UIModes.Query)
                GlobalAppVariables.ObjMDIMain.FireInsertMode();
        }
        private void IdCardPhotos_Load(object sender, EventArgs e)
        {
            ClearControls();
        }

        private string GetPhotoName()
        {
            return this.sewadarHeader1.SewadarId.ToString();
        }

        private string GetPhotoPath()
        {
            string photoFolder = ConfigurationSettings.AppSettings["PHOTO_FOLDER_PATH"];
            if (string.IsNullOrEmpty(photoFolder))
            {
                photoFolder = ".";
            }
            string ext = ConfigurationSettings.AppSettings["FILE_EXTENSION"];
            if (string.IsNullOrEmpty(ext))
                ext = ".jpeg";    
            string photoPath = string.Concat(photoFolder, "//", GetPhotoName() , ext).Trim();
            return photoPath;
        }

        public override void Save()
        {
            if (string.IsNullOrEmpty(GetPhotoName()))
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, "sewadar", MessageTypes.Error);
                return;
            }
            try
            {
                string photoFolder = ConfigurationSettings.AppSettings["PHOTO_FOLDER_PATH"];
                if (string.IsNullOrEmpty(photoFolder))
                {
                    photoFolder = ".";
                }
                if (!Directory.Exists(photoFolder))
                {
                    Directory.CreateDirectory(photoFolder);
                }
                string photoPath = GetPhotoPath();
                if (!string.IsNullOrEmpty(photoPath) && File.Exists(photoPath))
                {
                    if (picPhotoCaptureBox.Image != null)
                    {
                        DialogResult result = MessageBox.Show(this, MsgCodes.UpdatePhoto, "Confirm Overwrite",
                                MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
                        if (result != DialogResult.Yes)
                        {
                            return;
                        }
                    }
                }
                picPhotoCaptureBox.Image.Save(photoPath, System.Drawing.Imaging.ImageFormat.Jpeg);
                UIManager.ShowMessage(MsgCodes.PhotoSave, photoPath, MessageTypes.Plain);
            }
            catch (Exception e)
            {
                UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, e.ToString(), MessageTypes.Error);
                ResetControls();
                return;
            }
            ClearControls();
            this.sewadarHeader1.txtGRNo.Focus();            
        }


        public override void ClearControls()
        {
            try
            {
                this.picExisting.Image = null;
                this.picOld.Image = null;
                ResetControls();
                this.sewadarHeader1.ClearControls();
                this.btnSave.Enabled = false;
                this.sewadarHeader1.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
                this.sewadarHeader1.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        private void ResetControls()
        {
            picPhotoCaptureBox.Image = null;
            Clipboard.Clear();
            btnClick.Text = "Click";
        }        

        private void btnClick_Click(object sender, EventArgs e)
        {
            if (btnClick.Text == "Click")
            {
                WebCam.StopVideoCapturing();
                btnClick.Text = "Cancel";
                btnSave.Enabled = true;
                if (!string.IsNullOrEmpty(GetPhotoName()))
                    this.btnSave.Focus();
                else
                    this.sewadarHeader1.txtGRNo.Focus();
            }
            else
            {
                //UIManager.ShowMessage(MsgCodes.PhotoCancel, string.Empty, MessageTypes.Error);
                WebCam.StartCapturingVideo(this);
                btnClick.Text = "Click";
                btnSave.Enabled = false;
            }
        }

        public override bool IsReadyToSave()
        {
            if (string.Compare(this.btnClick.Text, "Cancel", true) != 0)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Save|photo is not clicked", MessageTypes.Error);
                return false;
            }
            return base.IsReadyToSave();
        }

        private void IdCardPhotos_FormClosing(object sender, FormClosingEventArgs e)
        {
            WebCam.StopVideoCapturing();            
        }

        private void WebCamCapture_ImageCaptured(object source, WebcamEventArgs e)
        {
            try
            {
                Image rawImage = e.WebCamImage; // set the picturebox picture
                Image croppedImage = cropImage(rawImage, new Rectangle(40, 0, 180, 240));
                picPhotoCaptureBox.Image = croppedImage;
                //picPhotoCaptureBox.Image.
                //picPhotoCaptureBox.Image.RotateFlip(RotateFlipType.Rotate90FlipX);
            }
            catch (Exception err)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Image capture|" + err.Message, MessageTypes.Error);                
            }
        }

        private static Image cropImage(Image img, Rectangle cropArea)
        {
            Bitmap bmpImage = new Bitmap(img);
            Bitmap bmpCrop = bmpImage.Clone(cropArea,
                                            bmpImage.PixelFormat);
            return (Image)(bmpCrop);
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        }

        private void txtName_KeyPress_1(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || char.IsLetter(e.KeyChar) || e.KeyChar == '\b')
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }

        private void sewadarHeader1_SewadarSelectionChanged(object sender, Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs e)
        {
            if (WebCam.bStopped)
            {
                UIManager.ShowMessage(MsgCodes.PhotoPrepare, string.Empty, MessageTypes.Error);
                WebCam.StartCapturingVideo(this); // start the video capture. let the control handle the frame Number                                            
            }
            string photoPath = GetPhotoPath();
            this.picExisting.Image = null;
            if (!string.IsNullOrEmpty(photoPath) && File.Exists(photoPath))
            {
                this.picExisting.ImageLocation = photoPath;
            }
            DataTable dtPersonPhoto = null;
            if (!ImageCache.ContainsSewadarImage(this.sewadarHeader1.SewadarId))
            {
                dtPersonPhoto = this.dbFacade.QuerySewadarsPhoto(this.sewadarHeader1.SewadarId).Tables[0];
                if (dtPersonPhoto.Rows.Count > 0)
                    ImageCache.SetSewadarImage(this.sewadarHeader1.SewadarId, dtPersonPhoto);
            }
            else
            {
                dtPersonPhoto = ImageCache.GetSewadarImage(this.sewadarHeader1.SewadarId);
            }
            if (dtPersonPhoto.Rows.Count > 0)
            {
                byte[] img = (byte[])dtPersonPhoto.Rows[0]["sewadar_photo"];
                using (MemoryStream ms = new MemoryStream(img, 0, img.Length))
                {
                    // ms.Write(img, 0, img.Length);
                    this.picOld.Image = Image.FromStream(ms, true);
                }
            }
            else
            {
                this.picOld.Image = null;
            }
        }        
    }
}
