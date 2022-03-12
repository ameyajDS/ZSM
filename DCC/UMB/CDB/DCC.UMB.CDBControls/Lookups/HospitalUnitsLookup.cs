using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.UMB.CDBLookups
{
    public class HospitalUnitsLookup : BaseCDBMasterLookup
    {


        public HospitalUnitsLookup()
            : base()
        {
            this.InitializeComponent();
        }

        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            
            switch (this.EntityStatus)
            {
                case Status.Active:
                    e.LookupSqlString  += " AND getdate() between effective_from and effective_till ";

                    break;
                case Status.Inactive:
                    e.LookupSqlString += " AND getdate() not between effective_from and effective_till ";
                    break;
                case Status.Both:
                    break;
            }

            e.LookupSqlString += " ORDER BY hospital_unit_nm";
        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(HospitalUnitsLookup));
            this.SuspendLayout();
            // 
            // HospitalUnitsLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "HospitalUnitsLookup";
            this.Title = "HospitalUnits";
            this.ResumeLayout(false);
            this.PerformLayout();

        }


    }
}
