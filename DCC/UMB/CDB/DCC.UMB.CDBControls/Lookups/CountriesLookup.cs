using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.UMB.CDBLookups
{
    public class CountriesLookup : BaseCDBMasterLookup
    {

        public CountriesLookup()
            : base()
        {
            this.InitializeComponent();
        }

        public override void OnLookupDialogShowing(object sender, LookupEventArgs e)
        {
            switch (this.EntityStatus)
            {
                case Status.Active:
                    e.LookupSqlString += " AND (2=2) AND getdate() between effective_from and effective_till ";

                    break;
                case Status.Inactive:
                    e.LookupSqlString += " AND (2=2) AND getdate() not between effective_from and effective_till ";
                    break;
                case Status.Both:
                    break;
            }
            e.LookupSqlString += " ORDER BY country_nm";

        }
        
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CountriesLookup));
            this.SuspendLayout();
            // 
            // CountriesLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "CountriesLookup";
            this.Size = new System.Drawing.Size(159, 44);
            this.Title = "Country";
            this.Load += new System.EventHandler(this.CountriesLookup_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private void CountriesLookup_Load(object sender, EventArgs e)
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
