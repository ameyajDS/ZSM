using System;
using System.Drawing;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCLongIntegerField.bmp")]
    public partial class DCCLongIntegerField : DCCTextField
    {
        private long maxValue = long.MaxValue;
        private long minValue = long.MinValue;
        public DCCLongIntegerField()
        {
            InitializeComponent();
            this.Lookup = false;
            this.DisplayText = "";
            this.txtField.TextAlign = HorizontalAlignment.Right;
            this.txtField.KeyPress += new KeyPressEventHandler(txtField_KeyPress);
            this.Width = 70;
        }
        
        protected override bool CheckForValidRange()
        {
            bool result = true;
            if (this.DisplayTextAsLong.HasValue)
            {
                result = !(this.DisplayTextAsLong < this.MinValue ||
                                  this.DisplayTextAsLong > this.MaxValue);
                if (!result)
                {
                    UIManager.ShowMessage(MsgCodes.OutOfRange,
                                          string.Format("{0}|{1}|{2}",
                                                        string.IsNullOrEmpty(this.Title)
                                                            ? this.Name
                                                            :
                                                        this.Title, this.MinValue.ToString(),
                                                        this.MaxValue.ToString()),
                                          MessageTypes.Warning);
                }
            }
            return result;
        }
        void txtField_KeyPress(object sender, KeyPressEventArgs e)
        {
            //enable to using Keyboard Ctrl+C and Keyboard Ctrl+V
            if (e.KeyChar == (char)3 ||
                e.KeyChar == (char)22 || 
                e.KeyChar == (char)24 || 
                e.KeyChar == (char)26)
            {
                e.Handled = false;
                return;
            }
            if (Char.IsNumber(e.KeyChar) || 
                (int)e.KeyChar == (int)Keys.Back || 
                (int)e.KeyChar == (int)Keys.Delete || 
                (int)e.KeyChar == (int)Keys.Home || 
                (int)e.KeyChar == (int)Keys.End)
            {
                if ((int)e.KeyChar == 46) //for avoiding the decimal key
                {
                    e.Handled = true;
                    return;
                }
                if (e.KeyChar == (char)48)
                {
                    long? num = GetLongValue((TextBox)sender);
                    if (num == null || num == 0)
                    {
                        ((TextBox)sender).Text = "0";
                        ((TextBox)sender).SelectionStart = ((TextBox)sender).Text.Length;
                        e.Handled = true;
                        return;
                    }
                }
                e.Handled = false;                
            }
            else
            {
                // for '-' key, negative numbers.
                if (e.KeyChar == (char)45)
                {
                    long? num = GetLongValue((TextBox)sender);
                    if (num == null || num == 0)
                    {
                        e.Handled = false;
                        return;
                    }
                    num = num * -1;
                    ((TextBox)sender).Text = num.ToString();
                    ((TextBox)sender).SelectionStart = ((TextBox)sender).Text.Length;
                    e.Handled = true;
                    return;
                }
                
                e.Handled = true;
            }
        }

        private static long? GetLongValue(TextBox sender)
        {
            string str = sender.Text;
            long result = 0;
            long? num = null;
            bool parseResult = long.TryParse(str, out result);
            if (!parseResult)
            {
                num = null;
            }
            else
            {
                num = result;
            }
            return num;
        }

        /// <summary>
        /// Returns the display text as a nulable long value.
        /// </summary>
        public long? DisplayTextAsLong
        {
            get
            {
                long result = 0;
                long? returnValue = null;
                bool parseResult = long.TryParse(this.DisplayText, out result);
                if (!parseResult)
                {
                    returnValue = null;
                }
                else
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }
        public int? DisplayTextAsInteger
        {
            get
            {
                int result = 0;
                int? returnValue = null;
                bool parseResult = int.TryParse(this.DisplayText, out result);
                if (!parseResult)
                {
                    returnValue = null;
                }
                else
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }
        public short? DisplayTextAsShort
        {
            get
            {
                short result = 0;
                short? returnValue = null;
                bool parseResult = short.TryParse(this.DisplayText, out result);
                if (!parseResult)
                {
                    returnValue = null;
                }
                else
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }
        public byte? DisplayTextAsByte
        {
            get
            {
                byte result = 0;
                byte? returnValue = null;
                bool parseResult = byte.TryParse(this.DisplayText, out result);
                if (!parseResult)
                {
                    returnValue = null;
                }
                else
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }
        public long MaxValue
        {
            get { return maxValue; }
            set { maxValue = value; }
        }

        public long MinValue
        {
            get { return minValue; }
            set { minValue = value; }
        }
    }
}
