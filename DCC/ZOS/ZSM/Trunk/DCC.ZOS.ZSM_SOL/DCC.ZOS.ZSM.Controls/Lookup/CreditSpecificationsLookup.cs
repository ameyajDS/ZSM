using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class CreditSpecificationsLookup : BaseMasterLookup
    {
        public CreditSpecificationsLookup()
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CreditSpecificationsLookup));
            this.SuspendLayout();
            // 
            // CreditSpecificationsLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "credit_specification_nm";
            this.IdTextBindingKey = "credit_specification_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "CreditSpecificationsLookup";
            this.Title = "Credit Specifications";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
