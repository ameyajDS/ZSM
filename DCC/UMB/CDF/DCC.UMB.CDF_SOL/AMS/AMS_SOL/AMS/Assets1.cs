using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.UIControls;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.DB;

namespace AES
{

    public partial class Assets1 : AbstractScreen
    {
        public Assets1()
        {
            InitializeComponent();
            InitializeDropDowns();
            //this.grdSummary.RowSelectionModified += new EventHandler<EventArgs>(grdSummary_RowSelectionModified);
        }

       
        enum SummaryGridCols
        {
            asset_type_id = 0,
            asset_type_nm,
            asset_id,
            make_model,
            quantity,
            chasis_no,
            engine_no,
            details,
            item_nm,
            item_id,
            acquisition_cost,
            present_value,
            acquisition_dt,
            valuation_dt,
            remarks,
            txn_ts
        }
        enum ListGridCols
        {
            zone_id = 0,
            centre_type,
            satsang_centre_id,
            satsang_centre_nm
        }

        private void InitializeDropDowns()
        {
           


        }

       
        public override string ScreenId
        {
            get
            {
                return "ENT_03";
            }
        }

        public override DCCGrid ListViewGrid
        {
            get
            {
                return null;
            }
        }

        

        public override void LoadBrowseView(int rowIndex)
        {
            
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            
        }

        public DbManager DBManagerForRetrival
        {
            get
            {
                return null;
            }
        }

        public override bool IsReadyToSave()
        {
            return true;
            //TODO to be implemented
        }


        private bool IsItemAndModelCombinationUnique()
        {
           
            return true;
        }

       


        public override void Save()
        {
            
        }











    

       


    }
}