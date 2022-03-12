using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.UMB.CDBLookups
{
    public class DistrictorCitiesLookup : BaseCDBMasterLookup
    {

        private int stateCode = 0;

      
        public int StateCode 
        {
            get { return stateCode; }
            set { stateCode = value; }
        }

        public DistrictorCitiesLookup()
            : base()
        {
            this.InitializeComponent();
        }

        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (this.stateCode != 0)
            {
                e.LookupSqlString += " AND s.state_id = " + this.stateCode;
            }
            

            switch (this.EntityStatus)
            {
                case Status.Active:
                    e.LookupSqlString += " AND (2=2) AND getdate() between d.effective_from and d.effective_till";

                    break;
                case Status.Inactive:
                    e.LookupSqlString += " AND (2=2) AND getdate() not between d.effective_from and d.effective_till ";
                    break;
                case Status.Both:
                    break;
            }

            e.LookupSqlString += " ORDER BY d.district_nm";

        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DistrictorCitiesLookup));
            this.SuspendLayout();
            // 
            // DistrictorCitiesLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "DistrictorCitiesLookup";
            this.Title = "District / City";
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
