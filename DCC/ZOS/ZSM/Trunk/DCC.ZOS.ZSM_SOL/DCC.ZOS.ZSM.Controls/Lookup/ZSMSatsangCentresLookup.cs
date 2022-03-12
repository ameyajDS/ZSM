using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public class ZSMSatsangCentresLookup : BaseMasterLookup
    {

        public bool ShowNonMainCentres
        {
            get;
            set;
        }

        public ZSMSatsangCentresLookup()
            : base()
        {
            this.InitializeComponent();
            this.ShowNonMainCentres = true;
        }
        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (!this.ShowNonMainCentres)
            {
                e.LookupSqlString += " AND is_main_centre = 'Yes' ";
            }
        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ZSMSatsangCentresLookup));
            this.SuspendLayout();
            // 
            // ZSMSatsangCentresLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "ZSMSatsangCentresLookup";
            this.Title = "Satsang Centre";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        [Browsable(false)]
        [ReadOnly(true)]
        public override string LookupColumns
        {
            get
            {
                return base.LookupColumns;
            }
            set
            {
                base.LookupColumns = value;
            }
        }
    }
}
