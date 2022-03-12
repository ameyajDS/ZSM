using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class SewaShitsLookup : BaseMasterLookup
    {
        public SewaShitsLookup()
            : base()
        {
            this.InitializeComponent();
        }
   

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SewaShitsLookup));
            this.SuspendLayout();
            // 
            // SewaShitsLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "SewaShitsLookup";
            this.Title = "Sewa Shift";
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
