using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class AttributesLookup : BaseMasterLookup
    {
        public AttributesLookup()
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AttributesLookup));
            this.SuspendLayout();
            // 
            // AttributesLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "attribute_nm";
            this.IdTextBindingKey = "attribute_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "AttributesLookup";
            this.Title = "Attributes";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
