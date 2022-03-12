using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;

namespace DCC.UMB.CDBLookups
{
    public class PartiesLookup : BaseCDBMasterLookup
    {

        public PartiesLookup()
            : base()
        {
            this.InitializeComponent();
        }

        

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PartiesLookup));
            this.SuspendLayout();
            // 
            // PartiesLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "PartiesLookup";
            this.Title = "Parties";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
