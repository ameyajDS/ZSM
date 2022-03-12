using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public class SubJobNameLookup : BaseMasterLookup
    {

        public SubJobNameLookup()
            : base()
        {
            this.InitializeComponent();
        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SubJobNameLookup));
            this.SuspendLayout();
            // 
            // SubJobNameLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "SubJobName";
            this.IdTextBindingKey = "SubJobId";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "SubJobNameLookup";
            this.Title = "Sub Job Name";
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
