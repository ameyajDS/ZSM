using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.UMB.CDBLookups
{
    public class SatsangCentresLookup : BaseCDBMasterLookup
    {

        private int districtOrCityCode = 0;

      
        public int DistrictOrCityCode 
        {
            get { return districtOrCityCode; }
            set { districtOrCityCode = value; }
        }

        public SatsangCentresLookup()
            : base()
        {
            this.InitializeComponent();
        }

        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
			e.LookupSqlString += " AND s.satsang_centre_type <> 'AREA'";

            if (this.districtOrCityCode !=
                0)
            {
                e.LookupSqlString += " AND s.district_or_city_id = " + this.districtOrCityCode;
            }
            

            switch (this.EntityStatus)
            {
                case Status.Active:
                    e.LookupSqlString += " AND getdate() between s.effective_from and s.effective_till";

                    break;
                case Status.Inactive:
                    e.LookupSqlString += " AND getdate() not between s.effective_from and s.effective_till ";
                    break;
                case Status.Both:
                    break;
            }
            e.LookupSqlString += " ORDER BY s.satsang_centre_nm";
        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SatsangCentresLookup));
            this.SuspendLayout();
            // 
            // SatsangCentresLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.IdText = "";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.LookupTitle = "Satsang Centre";
            this.Name = "SatsangCentresLookup";
            this.Title = "Satsang Centre";
            this.ValueText = "";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
