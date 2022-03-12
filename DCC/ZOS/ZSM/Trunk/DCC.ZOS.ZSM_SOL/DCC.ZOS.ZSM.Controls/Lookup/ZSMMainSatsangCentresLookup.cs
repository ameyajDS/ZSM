using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public class ZSMMainSatsangCentresLookup : BaseMasterLookup
    {

        public bool ShowOnlyMainCentres
        {
            get;
            set;
        }

        public ZSMMainSatsangCentresLookup()
            : base()
        {
            this.InitializeComponent();
        }
        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (this.ShowOnlyMainCentres)
            {
                e.LookupSqlString += " AND scd.is_main_centre = 'Yes' ";
            }
        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ZSMMainSatsangCentresLookup));
            this.SuspendLayout();
            // 
            // ZSMMainSatsangCentresLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "ZSMMainSatsangCentresLookup";
            this.Title = "Satsang Centre.";
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
