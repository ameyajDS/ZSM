using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.UMB.CDBLookups
{
    public class StatesLookup : BaseCDBMasterLookup
    {
        private int countryCode;
        public int CountryCode
        {
            get { return countryCode; }
            set { countryCode = value; }
        }


        public StatesLookup()
            : base()
        {
            this.InitializeComponent();
        }

        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            
            if (countryCode != 0 )
            {
                e.LookupSqlString += " AND c.country_id = " + this.countryCode;
            }
                      
            switch (this.EntityStatus)
            {
                case Status.Active:
                    e.LookupSqlString += " AND (2=2) AND getdate() between s.effective_from and s.effective_till ";

                    break;
                case Status.Inactive:
                    e.LookupSqlString += " AND (2=2) AND getdate() not between s.effective_from and s.effective_till ";
                    break;
                case Status.Both:
                    break;
            }
            e.LookupSqlString += " ORDER BY s.state_nm";

        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(StatesLookup));
            this.SuspendLayout();
            // 
            // StatesLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.CalledScreenApplicationId = "CDB_APP";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "StatesLookup";
            this.Title = "State";
            this.Load += new System.EventHandler(this.StatesLookup_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private void StatesLookup_Load(object sender, EventArgs e)
        {

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
