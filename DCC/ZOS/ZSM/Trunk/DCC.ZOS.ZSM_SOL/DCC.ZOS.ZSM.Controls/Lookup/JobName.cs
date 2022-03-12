using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public partial class JobNameLookup : BaseMasterLookup
    {
        public JobNameLookup()
        {
            this.InitializeComponent();
        }

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(JobNameLookup));
            this.SuspendLayout();
            // 
            // AttributesLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "";
            this.IdTextBindingKey = "";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "JobNameLookup";
            this.Title = "";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
