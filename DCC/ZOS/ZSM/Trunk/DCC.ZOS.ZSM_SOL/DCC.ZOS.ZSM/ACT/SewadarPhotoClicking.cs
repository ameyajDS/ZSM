using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Global;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.ZOS.ZSM.Properties;
using DCC.ZOS.ZSM.SETUP;
using EOSDigital.API;
using EOSDigital.SDK;
using ImageProcessor;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class SewadarPhotoClicking : ZSMAbstractScreen
    {
        private CanonAPI _APIHandler;
        private Camera _mainCamera;
        private IList<Camera> CameraObjList;
        private bool _camInitiated;
        private object InitLock = new object();

        private readonly int ROTATE = 0;
        private readonly int PHOTO_QUALITY = 100;
        private string _photoSaveFolderPath;

        public SewadarPhotoClicking()
        {
            try
            {
                InitializeComponent();
                grNoLookup.SttsCode = "SttsPhtClck";
                _APIHandler = new CanonAPI();
                _APIHandler.CameraAdded += APIHandler_CameraAdded;
                dbFacade = new ZSM_MUMDbFacade(GlobalAppVariables.AppContext.ApplicationId);

                ErrorHandler.SevereErrorHappened += ErrorHandler_SevereErrorHappened;
                ErrorHandler.NonSevereErrorHappened += ErrorHandler_NonSevereErrorHappened;
                ROTATE = int.Parse(ConfigurationSettings.AppSettings["Rotate"]);
                PHOTO_QUALITY = int.Parse(ConfigurationSettings.AppSettings["PhotoQuality"]);
                Properties.Settings.Default.TempPath = ConfigurationSettings.AppSettings["TempPath"];
                Properties.Settings.Default.SewadarPhotoPath = ConfigurationSettings.AppSettings["SewadarPhotoPath"];
                Properties.Settings.Default.SaveToFile = "No";
                Properties.Settings.Default.AspectRatio = ConfigurationSettings.AppSettings["AspectRatio"];
                bool success = CreatePhotoDirectory(Properties.Settings.Default.SewadarPhotoPath, true);
                if (success)
                {
                    success = CreatePhotoDirectory(Properties.Settings.Default.TempPath);
                    if (!success)
                    {
                        throw new Exception();
                    }
                }
                else
                {
                    throw new Exception();
                }
                RefreshCamera();
            }
            catch (DllNotFoundException)
            {
                ReportError("Canon DLLs not found!");
            }
            catch (Exception ex)
            {
                ReportError(ex.Message);
                if (_APIHandler != null)
                    _APIHandler.Dispose();
            }
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_SEWADAR_PHOTO_CLICKING;
            }
        }

        public override void ClearControls()
        {
            base.ClearControls();
            picOld.EmbeddedPictureBox.Image = null;
            picNew.EmbeddedPictureBox.Image = null;
        }

        public override void ShowScreen(DCC.UMB.CDF.Configuration.UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);

            if (uiMode == UIModes.Insert || uiMode == UIModes.Query)
            {
                ClearControls();
            }
        }

        //override disp

        private void ReportError(string message)
        {
            MessageBox.Show(message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private bool CreatePhotoDirectory(string baseDirectory, bool createSubfolders = false)
        {
            bool exists = System.IO.Directory.Exists(baseDirectory);
            try
            {
                if (!exists)
                {
                    System.IO.Directory.CreateDirectory(baseDirectory);
                }
                if (createSubfolders)
                {
                    //DirectoryInfo directory = new DirectoryInfo(baseDirectory);
                    //DirectorySecurity security = directory.GetAccessControl();
                    //security.AddAccessRule(new FileSystemAccessRule(,FileSystemRights.Modify, AccessControlType.Allow));

                    //directory.SetAccessControl(security);

                    var satsangCenterName = ZSMUtility.GetSatsangCentreName();
                    var todayDate = DateTime.Now;
                    var folderName = string.Format("{0}_{1}_Photos", satsangCenterName, todayDate.Year);
                    var dateFolder = todayDate.ToString("dd MMM yyyy");
                    _photoSaveFolderPath = baseDirectory + folderName + "\\" + dateFolder;
                    System.IO.Directory.CreateDirectory(_photoSaveFolderPath);
                }
            }
            catch (Exception ex)
            {
                ReportError(string.Format("Error while creating folder {0} cannot proceed!\n {1}", _photoSaveFolderPath, ex.Message));
                return false;
            }
            return true;
        }


        #region API_EventHandlers
        private void APIHandler_CameraAdded(CanonAPI sender)
        {
            try
            {
                Invoke((Action)delegate { RefreshCamera(); });
            }
            catch (Exception ex)
            {
                ReportError(ex.Message);
            }
        }



        private void ErrorHandler_NonSevereErrorHappened(object sender, ErrorCode ex)
        {
            ReportError("SDK Error code: " + ex + ")");
        }

        private void ErrorHandler_SevereErrorHappened(object sender, Exception ex)
        {
            ReportError(ex.Message);
        }

        private void MainCamera_StateChanged(Camera sender, StateEventID eventID, int parameter)
        {
            try
            {
                if (eventID == StateEventID.Shutdown && _mainCamera != null)
                {
                    Invoke((Action)delegate
                    {
                        _mainCamera.StateChanged -= MainCamera_StateChanged;
                        _mainCamera.DownloadReady -= MainCamera_DownloadReady;
                        _mainCamera.ProgressChanged -= MainCamera_ProgressChanged;
                        _mainCamera.CameraHasShutdown -= MainCamera_CameraHasShutdown;
                        _mainCamera.CloseSession();
                    });
                }
            }
            catch (Exception ex) { ReportError(ex.Message); }
        }

        private void MainCamera_DownloadReady(Camera sender, DownloadInfo Info)
        {
            try
            {
                string dir = null;
                Invoke((Action)delegate
                {
                    dir = Properties.Settings.Default.TempPath;
                });
                sender.DownloadFile(Info, dir);
                var targetFileName = "Processed_" + Info.FileName;
                ProcessImage(Info.FileName, targetFileName);
                byte[] photoBytes = File.ReadAllBytes(Properties.Settings.Default.TempPath + targetFileName);
                picNew.ImageInByteArray = photoBytes;
            }
            catch (Exception ex)
            {
                ReportError(ex.Message);
            }
        }

        private void MainCamera_ProgressChanged(object sender, int progress)
        {
            try { Invoke((Action)delegate { Console.WriteLine(progress); }); }
            catch (Exception ex) { ReportError(ex.Message); }
        }

        #endregion

        #region UIEventHandlers
        private void txtSourcePath_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            RefreshCamera();
        }

        private void btnInitCamera_Click(object sender, EventArgs e)
        {
            OpenSession();
            btnInitCamera.Enabled = false;
            btnCloseCamera.Enabled = true;
        }

        private void btnCloseCamera_Click(object sender, EventArgs e)
        {
            if (_mainCamera != null)
            {
                _mainCamera.CloseSession();
                btnInitCamera.Enabled = true;
                btnCloseCamera.Enabled = false;
            }
        }

        private void btnTakePhoto_Click(object sender, EventArgs e)
        {
            try
            {
                if (_mainCamera != null)
                    _mainCamera.TakePhotoShutterAsync();
            }
            catch (Exception ex) { ReportError(ex.Message); }
        }

        private void btnSaveImage_Click(object sender, EventArgs e)
        {
            try
            {
                this.dbFacade.InsertSewadarsPhoto(int.Parse(this.txtSewadarID.DisplayText), picNew.ImageInByteArray, DateTime.Now.AddMinutes(-5));

                MemoryStream ms = new MemoryStream(picNew.ImageInByteArray);
                Image image = Image.FromStream(ms);
                image.Save(string.Format("{0}\\{1}.jpg", _photoSaveFolderPath, grNoLookup.DisplayText), ImageFormat.Jpeg);
                ZSMUtility.LogAction(this, this.dbFacade, "Change Photo", int.Parse(this.txtSewadarID.DisplayText), null, null, ZSMUtility.GetSatsangCentreId(), grNoLookup.DisplayText);
                ClearTemp();
                MessageBox.Show("Photo saved successfully!");
                ClearControls();
            }
            catch (Exception ex)
            {
                ReportError(ex.Message);
            }
        }

        private void ClearTemp()
        {
            DirectoryInfo di = new DirectoryInfo(Properties.Settings.Default.TempPath);

            foreach (FileInfo file in di.GetFiles())
            {
                file.Delete();
            }
        }

        private void btnCancelImage_Click(object sender, EventArgs e)
        {
            picNew.EmbeddedPictureBox.Image = null;
            ClearTemp();

        }

        private void SewadarPhoto_FormClosing(object sender, FormClosingEventArgs e)
        {
            _APIHandler.CameraAdded -= APIHandler_CameraAdded;
            ErrorHandler.SevereErrorHappened -= ErrorHandler_SevereErrorHappened;
            ErrorHandler.NonSevereErrorHappened -= ErrorHandler_NonSevereErrorHappened;

            //_mainCamera.Dispose();
            CameraObjList.Clear();
            btnCloseCamera_Click(this, null);
            if (_APIHandler != null)
                _APIHandler.Dispose();
        }
        #endregion

        #region UtilityMethods
        private void RefreshCamera()
        {
            lstCameras.Items.Clear();
            CameraObjList = _APIHandler.GetCameraList();
            foreach (Camera cam in CameraObjList)
            {
                lstCameras.Items.Add(cam.DeviceName);
            }
        }

        private void OpenSession()
        {
            if (lstCameras.SelectedIndex >= 0)
            {
                _mainCamera = CameraObjList[lstCameras.SelectedIndex];
                _mainCamera.OpenSession();
                _mainCamera.SetSetting(PropertyID.SaveTo, (int)SaveTo.Host);
                _mainCamera.SetCapacity(4096, int.MaxValue);
                _mainCamera.StateChanged += MainCamera_StateChanged;
                _mainCamera.DownloadReady += MainCamera_DownloadReady;
                _mainCamera.ProgressChanged += MainCamera_ProgressChanged;
                _mainCamera.CameraHasShutdown += MainCamera_CameraHasShutdown;
            }
        }

        void MainCamera_CameraHasShutdown(Camera sender)
        {
            MessageBox.Show(sender.DeviceName + " has shutdown!");
            Invoke((Action)delegate
            {
                lstCameras.Items.Remove(sender.DeviceName);
                CameraObjList.Remove(sender);
            });
        }

        private void ProcessImage(string sourceFileName, string targetFileName)
        {
            byte[] photoBytes = File.ReadAllBytes(Properties.Settings.Default.TempPath + sourceFileName);

            ImageFormat format = ImageFormat.Jpeg;
            var values = Properties.Settings.Default.AspectRatio.Split(':');

            System.Drawing.Size size = new System.Drawing.Size(int.Parse(values[0]), int.Parse(values[1]));
            using (MemoryStream inStream = new MemoryStream(photoBytes))
            {
                using (ImageFactory imageFactory = new ImageFactory())
                {
                    // Load, resize, set the format and quality and save an image.
                    imageFactory.Load(inStream)
                                       .Quality(PHOTO_QUALITY)
                                       .Rotate(ROTATE)
                                       .Resize(size)
                                       .Save(Properties.Settings.Default.TempPath + targetFileName);

                }
            }
        }

        void grNoLookup_LookupResultSet(object sender, UMB.CDF.UIControls.TextControls.LookupResultEventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(this.grNoLookup.DisplayText))
                {
                    this.Cursor = Cursors.WaitCursor;
                    var dataset1 = dbFacade.GetGRNoBySewadarIdSatsangCentre(grNoLookup.DisplayText, ZSMUtility.GetSatsangCentreId());
                    var table = dataset1.Tables[0];
                    int sewadarId = (int)table.Rows[0][0];
                    var dataset = dbFacade.QuerySewadarPrintDetails(sewadarId, grNoLookup.DisplayText);
                    var sewadarDetailsTable = dataset.Tables[0];
                    if (sewadarDetailsTable.Rows.Count > 0)
                    {
                        var firstName = (string)sewadarDetailsTable.Rows[0]["first_nm"];
                        var middleName = (string)sewadarDetailsTable.Rows[0]["middle_nm"];
                        var lastName = (string)sewadarDetailsTable.Rows[0]["last_nm"];
                        txtSewadarName.DisplayText = string.Format("{0} {1} {2}", firstName, middleName[0], lastName);
                        txtSewadarID.DisplayText = sewadarDetailsTable.Rows[0]["sewadar_id"].ToString();
                        txtDepartment.DisplayText = CheckAndGetValue(sewadarDetailsTable, "department_nm");
                        txtSubDepartment.DisplayText = CheckAndGetValue(sewadarDetailsTable, "sub_department_nm");
                        txtQualification.DisplayText = CheckAndGetValue(sewadarDetailsTable, "qualification");
                        var biometricData = sewadarDetailsTable.Rows[0]["BiometricData"];
                        if (biometricData.GetType() != typeof(System.DBNull))
                        {
                            txtBiometricRecord.DisplayText = (string)biometricData;
                        }
                        txtStatus.DisplayText = (string)sewadarDetailsTable.Rows[0]["current_sewadar_status_nm"];
                        txtAge.DisplayText = ((int)sewadarDetailsTable.Rows[0]["age"]).ToString();
                        txtAppointmentDate.DisplayText = CheckAndGetValue(sewadarDetailsTable, "appointmentDate");
                        addressBox.txtAddress1.DisplayText = CheckAndGetValue(sewadarDetailsTable, "address_line_1");
                        addressBox.txtAddress2.DisplayText = CheckAndGetValue(sewadarDetailsTable, "address_line_2");
                        addressBox.CountryLookup.DisplayText = CheckAndGetValue(sewadarDetailsTable, "country_nm");
                        addressBox.StateLookup.DisplayText = CheckAndGetValue(sewadarDetailsTable, "state_nm");
                        addressBox.DistrictorCitiesLookup.DisplayText = CheckAndGetValue(sewadarDetailsTable, "district_nm");
                        addressBox.postOfficeOrCityLookup.DisplayText = CheckAndGetValue(sewadarDetailsTable, "post_office_or_city_nm");
                        addressBox.txtPin.DisplayText = CheckAndGetValue(sewadarDetailsTable, "pin_or_zip_code");
                        txtMobile.DisplayText = CheckAndGetValue(sewadarDetailsTable, "telephone_mobile");
                        txtOfficeTel.DisplayText = CheckAndGetValue(sewadarDetailsTable, "telephone_mobile");
                        txtInitDetail.DisplayText = CheckAndGetValue(sewadarDetailsTable, "initiation_details");
                        txtMarried.DisplayText = CheckAndGetValue(sewadarDetailsTable, "is_married");
                        txtOccupation.DisplayText = CheckAndGetValue(sewadarDetailsTable, "occupation");
                        var photoDate = sewadarDetailsTable.Rows[0]["photo_dt"];
                        if (photoDate.GetType() != typeof(System.DBNull))
                        {
                            lblOldDate.Text = ((DateTime)photoDate).ToString("dd MMM yyyy");
                        }
                        var photo = sewadarDetailsTable.Rows[0]["sewadar_photo"];
                        if (photo.GetType() != typeof(System.DBNull))
                        {
                            byte[] array = (byte[])photo;
                            this.picOld.ImageInByteArray = array;
                        }
                    }
                    this.Cursor = Cursors.Arrow;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        #endregion

        private string CheckAndGetValue(DataTable table, string columnName)
        {
            var value = table.Rows[0][columnName];
            if (value.GetType() != typeof(System.DBNull))
            {
                return value.ToString();
            }
            return "";
        }

        private void btnPhotoSettings_Click(object sender, EventArgs e)
        {
            PhotoSettings photoSettingsDialog = new PhotoSettings();

            photoSettingsDialog.ShowDialog();


        }

        private void grNoLookup_LookupDialogShowing(object sender, UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }



    }
}
