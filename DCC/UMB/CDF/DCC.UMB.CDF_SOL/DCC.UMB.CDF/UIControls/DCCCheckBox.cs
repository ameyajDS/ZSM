using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.UIAutomation;
using DCC.UMB.CDF.Configuration;

namespace DCC.UMB.CDF.UIControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCCheckBox.bmp")]
    public partial class DCCCheckBox : System.Windows.Forms.CheckBox, IUIAutomationCodeProvider, IDCCDataBinder
    {
        public DCCCheckBox()
        {
            InitializeComponent();
            this.BackColor = System.Drawing.Color.Transparent;
            this.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.Font = new Font("Verdana", this.Font.Size);
        }
        public new bool Checked
        {
            get
            {
                switch (this.CheckState)
                {
                    case CheckState.Checked:
                        return true;
                    case CheckState.Indeterminate:
                        return false;
                    case CheckState.Unchecked:
                        return false;
                    default:
                        return false;
                }
            }
            set
            {
                base.Checked = value;
            }
        }
        
        public string BlnString
        {
            get
            {
                switch (this.CheckState)
                {
                    case CheckState.Checked:
                        return "Yes";
                    case CheckState.Indeterminate:
                        return null;
                    case CheckState.Unchecked:
                        return "No";
                    default:
                        return "No";
                }
            }
        }
        /// <summary>
        /// Gets or sets the name of the column or public property of the data source 
        /// which is bound to the DisplayText property of this field.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Gets or sets the name of the column or public property of the data source which is bound to the DisplayText property of this field.")]
        public string BindingKey
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the column or public property of the data source 
        /// which is bound to the IDText property of this field.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Gets or sets the name of the column or public property of the data source which is bound to the IDText property of this field.")]
        [Browsable(false)]
        [ReadOnly(true)]
        public string IdTextBindingKey
        {
            get
            {
                return this.BindingKey;
            }
            set
            {
                throw new Exception("Invalid call, use BindingKey instead");
            }
        }

        /// <summary>
        /// Gets or sets the name of the column or public property of the data source 
        /// which is bound to the DisplayText property of this field.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Gets or sets the name of the column or public property of the data source which is bound to the DisplayText property of this field.")]
        [Browsable(false)]
        [ReadOnly(true)]
        public string DisplayTextBindingKey
        {
            get
            {
                return this.BindingKey;
            }
            set
            {
                throw new Exception("Invalid call, use BindingKey instead");
            }
        }

        /// <summary>
        /// Returns "Yes" or "No" or Null based upon the state of the checkbox. The null is returned only if the checkbox ThreeState is enabled and user has selected intermediate value.
        /// </summary>
        /// <returns></returns>
        //public string GetCheckedAsBoolString()
        //{
        //    if (this.ThreeState)
        //    {
        //        if (this.CheckState == CheckState.Indeterminate)
        //        {
        //            return null;
        //        }
        //        else
        //        {
        //            return this.CheckState == CheckState.Checked ? "Yes" : "No";
        //        }
        //    }
        //    else
        //    {
        //        return this.Checked ? "Yes" : "No";
        //    }
        //}
        #region IUIAutomationCodeProvider Members
        
        public string GetAutomationCode()
        {
            string template = "public TAFCheckBox uiAutomationId{get{return this.GetCheckBox(\"uiAutomationId\");}}";
            return template.Replace("uiAutomationId", this.Name);
        }

        #endregion

        
    }
}
