using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Drawing;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
namespace DCC.ZOS.ZSM.PHT
{
    /// <summary>
    /// EventArgs for the webcam control
    /// </summary>
    public class WebcamEventArgs : System.EventArgs
        {
        private System.Drawing.Image m_Image;
        private ulong m_FrameNumber = 0;

        public WebcamEventArgs()
        {
        }

        /// <summary>
        ///  WebCamImage
        ///  This is the image returned by the web camera capture
        /// </summary>
        public System.Drawing.Image WebCamImage
            {
            get
            { return m_Image; }

            set
            { m_Image = value; }
            }

        /// <summary>
        /// FrameNumber
        /// Holds the sequence number of the frame capture
        /// </summary>
        public ulong FrameNumber
            {
            get
            { return m_FrameNumber; }

            set
            { m_FrameNumber = value; }
            }
        }
    public static class WebCam
    {
        //private static int timeIntervalBetweenFrameCaptures = 100;
        public static int widthCaptureImage = 320;
        public static int heightCaptureImage = 240;
        public static bool bStopped = true;
        public static int captureImageHandle;
        private static System.Windows.Forms.Timer timerForVideo;
        public static WebcamEventArgs webCamInstance = new WebcamEventArgs();
        public delegate void WebCamEventHandler(object source, WebcamEventArgs e);

        public static event WebCamEventHandler ImageCaptured;// Fired when a new image is captured

        static WebCam()
        {
            timerForVideo = new Timer();
            timerForVideo.Tick += new EventHandler(timerForVideo_Tick);                       
        }

        #region API Declarations

        [DllImport("user32", EntryPoint = "SendMessage")]
        public static extern int SendMessage(int hWnd, uint Msg, int wParam, int lParam);

        [DllImport("avicap32.dll", EntryPoint = "capCreateCaptureWindowA")]
        public static extern int capCreateCaptureWindowA(string lpszWindowName, int dwStyle, int X, int Y, int nWidth, int nHeight, int hwndParent, int nID);

        [DllImport("user32", EntryPoint = "OpenClipboard")]
        public static extern int OpenClipboard(int hWnd);

        [DllImport("user32", EntryPoint = "EmptyClipboard")]
        public static extern int EmptyClipboard();

        [DllImport("user32", EntryPoint = "CloseClipboard")]
        public static extern int CloseClipboard();

        #endregion

        #region API Constants

        public const int WM_USER = 1024;

        public const int WM_CAP_CONNECT = 1034;
        public const int WM_CAP_DISCONNECT = 1035;
        public const int WM_CAP_GET_FRAME = 1084;
        public const int WM_CAP_COPY = 1054;

        public const int WM_CAP_START = WM_USER;

        public const int WM_CAP_DLG_VIDEOFORMAT = WM_CAP_START + 41;
        public const int WM_CAP_DLG_VIDEOSOURCE = WM_CAP_START + 42;
        public const int WM_CAP_DLG_VIDEODISPLAY = WM_CAP_START + 43;
        public const int WM_CAP_GET_VIDEOFORMAT = WM_CAP_START + 44;
        public const int WM_CAP_SET_VIDEOFORMAT = WM_CAP_START + 45;
        public const int WM_CAP_DLG_VIDEOCOMPRESSION = WM_CAP_START + 46;
        public const int WM_CAP_SET_PREVIEW = WM_CAP_START + 50;

        #endregion

        #region NOTES

        /*
		 * If you want to allow the user to change the display size and 
		 * color format of the video capture, call:
		 * SendMessage (captureImageHandle, WM_CAP_DLG_VIDEOFORMAT, 0, 0);
		 * You will need to requery the capture device to get the new settings
		*/

        #endregion

   

        #region StartCapturingVideo and StopVideoCapturing Capture Functions

        /// <summary>
        /// Starts the video capture
        /// </summary>
        /// <param name="FrameNumber">the frame number to start at. 
        /// Set to 0 to let the control allocate the frame number</param>
        public static void StartCapturingVideo(object sender)
        {
            try
            {
                //timeIntervalBetweenFrameCaptures = (int)numCaptureTime.Value; // change the capture time frame

                // for safety, call stop, just in case we are already running
                StopVideoCapturing();

                // setup a capture window
                captureImageHandle = capCreateCaptureWindowA("WebCap", 0, 0, 0, widthCaptureImage, heightCaptureImage, (sender as Form).Handle.ToInt32(), 0);

                // connect to the capture device
                Application.DoEvents();
                SendMessage(captureImageHandle, WM_CAP_CONNECT, 0, 0);
                SendMessage(captureImageHandle, WM_CAP_SET_PREVIEW, 0, 0);

                // set the timer information
                //timerForVideo.Interval = timeIntervalBetweenFrameCaptures;
                bStopped = false;
                timerForVideo.Start();
            }

            catch (Exception excep)
            {
                MessageBox.Show("An error ocurred while starting the video capture. Check that your webcamera is connected properly and turned on.\r\n\n" + excep.Message);
                StopVideoCapturing();
            }
        }

        public static void StopVideoCapturing()
        {
            try
            {
                // stop the timer
                bStopped = true;
                timerForVideo.Stop();

                // disconnect from the video source
                Application.DoEvents();
                SendMessage(captureImageHandle, WM_CAP_DISCONNECT, 0, 0);
            }

            catch (Exception excep)
            {
                WebCam.ShowMessage(excep.Message);  
            }

        }

        #endregion
        public static void ShowMessage(string message)
        {
            DialogResult msgResult;
            msgResult = MessageBox.Show(message, "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        #region Video Capture Code

        /// <summary>
        /// Capture the next frame from the video feed
        /// </summary>
        private static  void timerForVideo_Tick(object sender, System.EventArgs e)
        {
            try
            {
                Image tempImg = null;
                IDataObject tempObj = null;

                // pause the timer
                timerForVideo.Stop();

                // get the next frame;
                SendMessage(WebCam.captureImageHandle, WebCam.WM_CAP_GET_FRAME, 0, 0);

                // copy the frame to the clipboard
                SendMessage(WebCam.captureImageHandle, WebCam.WM_CAP_COPY, 0, 0);

                // paste the frame into the event args image
                if (ImageCaptured != null)
                {
                    // get from the clipboard
                    tempObj = Clipboard.GetDataObject();
                    tempImg = (System.Drawing.Bitmap)tempObj.GetData(System.Windows.Forms.DataFormats.Bitmap);

                    /*
                    * For some reason, the API is not resizing the video
                    * feed to the width and height provided when the video
                    * feed was started, so we must resize the image here
                    */
                    webCamInstance.WebCamImage = tempImg.GetThumbnailImage(WebCam.widthCaptureImage, WebCam.heightCaptureImage, null, System.IntPtr.Zero);

                    // raise the event

                    ImageCaptured(null, webCamInstance);
                }

                // restart the timer
                Application.DoEvents();
                if (!WebCam.bStopped)
                    timerForVideo.Start();
            }
            catch (Exception excep)
            {
                WebCam.ShowMessage("Video Device Required");                                               
            }
        }
        #endregion
    }
}