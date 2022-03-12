using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCDoubleFloatField.bmp")]
    public partial class DCCDoubleFloatField : DCCTextField
    {
        private double maxValue = double.MaxValue;
        private double minValue = double.MinValue;
        public DCCDoubleFloatField()
        {
            InitializeComponent();            
            this.DisplayText = "";            
            this.Lookup = false;
            this.txtField.TextAlign = HorizontalAlignment.Right;
            this.txtField.KeyPress += new KeyPressEventHandler(txtField_KeyPress);
            this.Width = 70;
        }

        protected override bool CheckForValidRange()
        {
            bool result = true;
            if (this.DisplayTextAsDouble.HasValue)
            {
                result = !(this.DisplayTextAsDouble < this.MinValue ||
                                  this.DisplayTextAsDouble > this.MaxValue);
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
            if (e.KeyChar == (char)3 || e.KeyChar == (char)22 || e.KeyChar == (char)24 || e.KeyChar == (char)26)
            {
                e.Handled = false;
                return;
            }
            if (Char.IsDigit(e.KeyChar) ||
                (int)e.KeyChar == (int)Keys.Back ||
                (int)e.KeyChar == (int)Keys.Delete ||
                (int)e.KeyChar == (int)Keys.Home ||
                (int)e.KeyChar == (int)Keys.End ||
                (Keys)e.KeyChar == Keys.Decimal)
            {
                if ((int)e.KeyChar == 46)
                {
                    if (this.txtField.Text.Contains("."))
                    {
                        e.Handled = true;
                        return;
                    }
                }
                if ((int)e.KeyChar == 'n')
                {
                    
                        e.Handled = true;
                        return;
                    
                }
                e.Handled = false;
                return;
            }
            else if (e.KeyChar == (char)45)
            {
                // for '-' key, negative numbers.

                {
                    double? num = GetdoubleValue((TextBox)sender);
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
            }
            else
                e.Handled = true;
            
        }
        private static double? GetdoubleValue(TextBox sender)
        {
            string str = sender.Text;
            double result = 0;
            double? num = null;
            bool parseResult = double.TryParse(str, out result);
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
        // Dheeraj 24-feb-2007
        private void DCCDoubleFloatField_Validating(object sender, CancelEventArgs e)
        {

        }
        public double? DisplayTextAsDouble
        {
            get
            {
                double result = 0;
                double? returnValue = null;
                bool parseResult = double.TryParse(this.DisplayText, out result);
                if(!parseResult)
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
        public decimal? DisplayTextAsDecimal
        {
            get
            {
                decimal result = 0;
                decimal? returnValue = null;
                bool parseResult = decimal.TryParse(this.DisplayText, out result);
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
        public float? DisplayTextAsFloat
        {
            get
            {
                float result = 0;
                float? returnValue = null;
                bool parseResult = float.TryParse(this.DisplayText, out result);
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

        public double MaxValue
        {
            get { return maxValue; }
            set { maxValue = value; }
        }

        public double MinValue
        {
            get { return minValue; }
            set { minValue = value; }
        }
    }
}
