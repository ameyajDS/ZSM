using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.UMB.CDBLookups
{
    public class InitiationPlacesLookup : BaseCDBMasterLookup
    {

        public InitiationPlacesLookup()
            : base()
        {
            this.InitializeComponent();
        }

        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            switch (this.EntityStatus)
            {
                case Status.Active:
                    e.LookupSqlString += " AND getdate() between effective_from and effective_till ";

                    break;
                case Status.Inactive:
                    e.LookupSqlString += " AND getdate() not between effective_from and effective_till ";
                    break;
                case Status.Both:
                    break;
            }
            e.LookupSqlString += " ORDER BY place_nm";
        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(InitiationPlacesLookup));
            this.SuspendLayout();
            // 
            // InitiationPlacesLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "InitiationPlacesLookup";
            this.Title = "Initiation Place";
            this.ResumeLayout(false);
            this.PerformLayout();

        }


    }
}
