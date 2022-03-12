using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.SSM.CDB2.Utils;


namespace DCC.UMB.CDB2.ENT
{
    public partial class Staff : AbstractScreen
    {
        private CDB_AppDbFacade dbFacade;
        private DataTable dtStaffDetails;
        private short shtWorkingUnitId;
        internal WorkingUnit CurrentWorkingUnit;

        public Staff()
        {
            InitializeComponent();
        }

        protected override void InitializeDbFacade()
        {
            if (dbFacade == null)
                this.dbFacade = new CDB_AppDbFacade(this.ApplicationId);
            // Initialize DBFacade for Specify Application ID
        }
        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_STAFF;
            }
        }
        private enum grdStaffColNames
        {
            personId = 0,
            name,
            gender,
            age,
            desig,
            swdType,
            status,
            StatusDate
        }

        private void btnStaff_Click(object sender, EventArgs e)
        {
            if (btnStaff.Text == "All Level Staff")
            {
                ReloadGridFromDatabase(true);
                btnStaff.Text = "Current Level Staff";
            }
            else
            {
                ReloadGridFromDatabase(false);
                btnStaff.Text = "All Level Staff";
            }
        }
        
        private void ReloadGridFromDatabase(bool showAll)
        {
            
            dtStaffDetails = this.dbFacade.QryStaff(shtWorkingUnitId).Tables[0];           

            if (showAll)
            {
                 AddRecords(CurrentWorkingUnit);
            }
            this.grdStaff.RetrieveRecords(dtStaffDetails, false, RowStates.Old);
        }

        private void AddRecords(WorkingUnit objWorkingUnit)
        {

            foreach (WorkingUnit node in objWorkingUnit.Nodes)
            {
                AddtoMainTable(node);
                AddChildRecords(node);
            }

        }

        private void AddChildRecords(TreeNode node)
        {      
             
             foreach (TreeNode subNode in node.Nodes)
             {
                 AddtoMainTable(subNode);
                 if (subNode.Nodes.Count > 0)
                 {
                     foreach (TreeNode childsubNode in subNode.Nodes)
                     {
                         AddtoMainTable(childsubNode);
                         AddChildRecords(childsubNode);
                     }
                 }
             }

             
  
  
        }
        private void AddtoMainTable(TreeNode node)
        {

            WorkingUnit wv = (WorkingUnit)node;
            DataTable dt = new DataTable();
            dt = this.dbFacade.QryStaff(wv.WorkingUnitId).Tables[0];

            foreach (DataRow row in dt.Rows)
            {
                DataRow rv = dtStaffDetails.NewRow();
                rv.ItemArray = row.ItemArray;
                dtStaffDetails.Rows.Add(rv);
            }
        }
 
       

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            if (short.TryParse(screenParameters, out shtWorkingUnitId))
            {
                this.ReloadGridFromDatabase(false);
            }
        }
    }
}
