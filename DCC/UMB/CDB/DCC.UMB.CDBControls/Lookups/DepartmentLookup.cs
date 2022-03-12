using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDBControls.Lookups;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.UMB.CDBLookups
{

    public class DepartmentLookup : BaseCDBMasterLookup
    {
        private Status showInactiveDepartments;
        
        public DepartmentLookup()
            : base()
        {
            this.InitializeComponent();
            this.LookupDialogShowing += new EventHandler<LookupEventArgs>(DepartmentLookup_LookupDialogShowing);
        }

        void DepartmentLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            
        }
        public Status ShowInactiveDepartments
        {
            get { return showInactiveDepartments; }
            set { showInactiveDepartments = value; }
        }

        

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DepartmentLookup));
            this.SuspendLayout();
            // 
            // DepartmentLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "DepartmentLookup";
            this.Title = "Departments";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
    }
}
