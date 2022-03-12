using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.UMB.CDBLookups
{
    public enum Status
    {
        Active,
        Inactive,
        Both
    }
    public class BaseMasterLookup : DCCTextField
    {
        private Status entityStatus;

        public BaseMasterLookup()
            : base()
        {
            this.InitializeComponent();
            this.LookupDialogShowing += new EventHandler<LookupEventArgs>(BaseMasterLookup_LookupDialogShowing);
        }

        void BaseMasterLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            OnLookupDialogShowing(sender, e);
        }

        public virtual void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            
        }


        [Category("DCC.UMB.CDBLookups")]
        [Description("Derived from effective from effective till date")]
        public Status EntityStatus
        {
            get { return entityStatus; }
            set { entityStatus = value; }
        }



        private void InitializeComponent()
        {
            this.SuspendLayout();
            // 
            // BaseLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.EditingControlFormattedValue = null;
            this.EditingControlValueChanged = true;
            this.Lookup = true;
            this.LookupColumns = "";
            this.Name = "BaseLookup";
            this.ResumeLayout(false);

        }
    }
}
