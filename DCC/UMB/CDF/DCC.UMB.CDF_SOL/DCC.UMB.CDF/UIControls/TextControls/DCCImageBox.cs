using System.Drawing;
using System;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.Utils;
using System.IO;
using System.ComponentModel;
using System.Drawing.Imaging;
using DCC.UMB.CDF.MGMT.Controller;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DataGridViewImageColumn.bmp")]
    public partial class DCCImageBox : UserControl, IDCCControl
    {     
        private bool isEnable = true;
        private bool isMandatory = false;
        private bool readOnly = false;

        public event EventHandler<EventArgs> ImageChanged;
        public DCCImageBox()
        {
            InitializeComponent();
            ///[[This is required to avoid flickering
            SetStyle(ControlStyles.AllPaintingInWmPaint |
              ControlStyles.OptimizedDoubleBuffer |
              ControlStyles.UserPaint, true);
            //]]            
        }
        public PictureBox EmbeddedPictureBox
        {
            get { return this.pbxSignature; }
        }
        #region Properties Implementations        
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It gives the Image content as Byte array.")]
        public virtual byte[] ImageInByteArray
        {
            get 
            {
                if (this.pbxSignature.Image != null)
                {
                    //Save image from PictureBox into MemoryStream object.
                    MemoryStream ms = new MemoryStream();
                    this.pbxSignature.Image.Save(ms, ImageFormat.Png);

                    //Read from MemoryStream into Byte array.
                    Byte[] byteImageData = new Byte[ms.Length];
                    ms.Position = 0;
                    ms.Read(byteImageData, 0, Convert.ToInt32(ms.Length));
                    return byteImageData;
                }
                else
                    return null;
            }
            set 
            {
                if (value != null)
                {
                    MemoryStream ms = new MemoryStream(value);
                    this.pbxSignature.Image = Image.FromStream(ms);
                }
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It indicates the text of the DCCSignature's Label.")]
        public virtual string Title
        {
            get { return this.lblTitle.Text; }
            set
            {                
                this.lblTitle.Text = value;
                //AdjustPaddingAndColors();
            }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It indicates whether the field is mandatory or not.")]
        public virtual bool Mandatory
        {
            get { return isMandatory; }
            set
            {
                isMandatory = value;
                //AdjustPaddingAndColors();
            }
        }
        public bool ReadOnly
        {
            get { return readOnly; }
            set { readOnly = value; }
        }

       
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Indicates whether the control is enabled.")]
        public new bool Enabled
        {
            get { return isEnable; }
            set
            {
                isEnable = value;
                this.pbxSignature.Enabled = value;
            }
        }
       
        #endregion

        public string UserFriendlyName
        {
            get
            {
                return string.IsNullOrEmpty(this.Title) ? this.Name : this.Title;
            }
        }
                
        public virtual void ClearControlValues()
        {
            this.pbxSignature.Image = null;
        }

        private void pbxSignature_DoubleClick(object sender, EventArgs e)
        {
            //[[If this field is read only, then just return
            if (this.ReadOnly)
            {
                return;
            }
            //]]
            OpenFileDialog openFileDialogForSignature = new OpenFileDialog();

            openFileDialogForSignature.Filter = "Image files (*.bmp)|*.bmp|(*.jpg)|*.jpg|(*.gif)|*.gif|All files (*.*)|*.*";
            openFileDialogForSignature.FilterIndex = 2;
            openFileDialogForSignature.RestoreDirectory = true;

            if (openFileDialogForSignature.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    this.pbxSignature.Image = Image.FromFile(openFileDialogForSignature.FileName);
                    this.RaiseImageChangedEvent();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }
        }
        private void RaiseImageChangedEvent()
        {
            EventHandler<EventArgs> handler = ImageChanged;
            if (handler != null)
            {
                handler(this, new EventArgs());
            }
        }

        private void pbxDelete_Click(object sender, EventArgs e)
        {
            this.pbxSignature.Image = null;
            RaiseImageChangedEvent();
        }

       
        
        public Boolean SetImage(byte[] img)
        {
            if (img != null)
            {
                using (MemoryStream ms = new MemoryStream(img, 0, img.Length))
                {
                    // ms.Write(img, 0, img.Length);
                    pbxSignature.Image = Image.FromStream(ms, true);
                }
                return true;
            }
            else
            {
                pbxSignature.Image = null;
                return false;
            }
        }

        public bool IsValid()
        {
            return IsValid(true);
        }
        public bool IsValid(bool showInvalidMessageToUser)
        {
            if (!this.Mandatory) return true;
            if (this.pbxSignature.Image == null)
            {
                if (showInvalidMessageToUser)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd,
                                  "\"" + DisplayableTitle + "\"",
                                  MessageTypes.Warning);
                }
                return false;
            }
            return true;
        }
        private string DisplayableTitle
        {
            get
            {
                return string.IsNullOrEmpty(this.Title) ? this.Name : this.Title;
            }
        }
    }


}
