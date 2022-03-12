using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public class RelationsLookup : BaseMasterLookup
    {

        public RelationsLookup()
            : base()
        {
            this.InitializeComponent();
        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RelationsLookup));
            this.SuspendLayout();
            // 
            // RelationsLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "relation_nm";
            this.IdTextBindingKey = "relation_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "RelationsLookup";
            this.Title = "Relationship";
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
