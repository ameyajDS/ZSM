using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{

    public class SewaTeamsLookup : BaseMasterLookup
    {
        public SewaTeamsLookup()
            : base()
        {
            this.InitializeComponent();
        }
   

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SewaTeamsLookup));
            this.SuspendLayout();
            // 
            // SewaTeamsLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "sewa_team_nm";
            this.IdTextBindingKey = "sewa_team_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "SewaTeamsLookup";
            this.Title = "Sewa Team";
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
