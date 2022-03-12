using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class WeeklySewaLocationLookup : BaseMasterLookup
    {
        public WeeklySewaLocationLookup()
            : base()
        {
            this.InitializeComponent();
        }
   

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(WeeklySewaLocationLookup));
            this.SuspendLayout();
            // 
            // WeeklySewaLocationLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "WeeklySewaLocationLookup";
            this.Title = "Weekly Location";
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
