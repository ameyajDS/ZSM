using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public class JobNameControllingDateLookup : BaseMasterLookup
    {

        public JobNameControllingDateLookup()
            : base()
        {
            //base.CalledScreenApplicationId = GlobalAppVariables.AppContext.ApplicationId;
            //base.ApplicationIdForDbConnection = GlobalAppVariables.AppContext.ApplicationId;
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(JobNameControllingDateLookup));
            this.SuspendLayout();
            // 
            // JobNameControllingDateLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.CalledScreenApplicationId = "";
            this.DisplayTextBindingKey = "JobName";
            this.IdTextBindingKey = "JobId";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximumSize = new System.Drawing.Size(1462, 58);
            this.MinimumSize = new System.Drawing.Size(11, 28);
            this.Name = "JobNameControllingDateLookup";
            this.Padding = new System.Windows.Forms.Padding(0, 22, 16, 0);
            this.Title = "Job Name";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        public override string ApplicationIdForDbConnection
        {
            get
            {
                return GlobalAppVariables.AppContext.ApplicationId;
            }
            set
            {

            }
        }
    }
}
