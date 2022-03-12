using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class ZMSDepartmentsLookup : BaseMasterLookup
    {
        public ZMSDepartmentsLookup()
            : base()
        {
            this.InitializeComponent();
        }
   

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ZMSDepartmentsLookup));
            this.SuspendLayout();
            // 
            // ZMSDepartmentsLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximumSize = new System.Drawing.Size(1462, 58);
            this.MinimumSize = new System.Drawing.Size(11, 28);
            this.Name = "ZMSDepartmentsLookup";
            this.Padding = new System.Windows.Forms.Padding(0, 22, 16, 0);
            this.Title = "Department";
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
