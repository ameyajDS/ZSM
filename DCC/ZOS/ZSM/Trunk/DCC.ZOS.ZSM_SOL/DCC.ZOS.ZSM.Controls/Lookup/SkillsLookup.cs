using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public class SkillsLookup : BaseMasterLookup
    {

        public SkillsLookup()
            : base()
        {
            this.InitializeComponent();
        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SkillsLookup));
            this.SuspendLayout();
            // 
            // SkillsLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "skill_nm";
            this.IdTextBindingKey = "skill_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "SkillsLookup";
            this.Title = "Specialisation";
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
