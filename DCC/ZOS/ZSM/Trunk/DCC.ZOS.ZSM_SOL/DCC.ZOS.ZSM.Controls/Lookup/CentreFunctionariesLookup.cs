using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class CentreFunctionariesLookup : BaseMasterLookup
    {
        public CentreFunctionariesLookup()
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CentreFunctionariesLookup));
            this.SuspendLayout();
            // 
            // CentreFunctionariesLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "functionary_nm";
            this.IdTextBindingKey = "centre_functionary_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "CentreFunctionariesLookup";
            this.Title = "Name";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
