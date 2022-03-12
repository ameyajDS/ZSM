using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class OtherAddressProofLookup : BaseMasterLookup
    {
        public OtherAddressProofLookup()
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(OtherAddressProofLookup));
            this.SuspendLayout();
            // 
            // OtherAddressProofLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "other_address_proof_nm";
            this.IdText = "";
            this.IdTextBindingKey = "other_address_proof_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.LookupTitle = "Other Address Proof";
            this.Name = "OtherAddressProofLookup";
            this.Title = "Other Address Proof";
            this.ValueText = "";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString += " ORDER BY address_proof_nm";

        }
    }
}
