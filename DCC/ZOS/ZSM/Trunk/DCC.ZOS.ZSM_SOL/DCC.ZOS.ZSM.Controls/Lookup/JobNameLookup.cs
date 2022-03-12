using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public class JobNameLookup : BaseMasterLookup
    {

        public JobNameLookup()
            : base()
        {
            this.InitializeComponent();
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
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(JobNameLookup));
            this.SuspendLayout();
            // 
            // JobNameLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "JobName";
            this.IdText = "";
            this.IdTextBindingKey = "JobId";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.LookupTitle = "Job Name";
            this.Name = "JobNameLookup";
            this.Size = new System.Drawing.Size(140, 44);
            this.Title = "Job Name";
            this.ValueText = "";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
