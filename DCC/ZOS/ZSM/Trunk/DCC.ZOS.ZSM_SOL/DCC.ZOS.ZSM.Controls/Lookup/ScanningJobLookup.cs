using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class ScanningJobLookup : BaseMasterLookup
    {
        public ScanningJobLookup()
            : base()
        {
            this.InitializeComponent();
        }
   

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ScanningJobLookup));
            this.SuspendLayout();
            // 
            // ScanningJobLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "scanning_job_nm";
            this.IdTextBindingKey = "scanning_job_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "ScanningJobLookup";
            this.Title = "Scanning Jobs";
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
