using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public class PostOfficeOrCityLookup : BaseMasterLookup
    {

        private int stateCode = 0;

      
        public int StateCode 
        {
            get { return stateCode; }
            set { stateCode = value; }
        }

        public PostOfficeOrCityLookup()
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

        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (this.stateCode != 0)
            {
                e.LookupSqlString += " AND d.district_id = " + this.stateCode;
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

            e.LookupSqlString += " ORDER BY s.post_office_or_city_nm";

        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PostOfficeOrCityLookup));
            this.SuspendLayout();
            // 
            // PostOfficeOrCityLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.DisplayTextBindingKey = "post_office_or_city_nm";
            this.IdTextBindingKey = "post_office_or_city_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "PostOfficeOrCityLookup";
            this.Title = "Post Office / City";
            this.ResumeLayout(false);
            this.PerformLayout();

        }


    }
}
