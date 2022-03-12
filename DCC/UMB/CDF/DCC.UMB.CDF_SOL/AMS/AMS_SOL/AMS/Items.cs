using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Log;

namespace AES
{
    enum ItemColNames
    {
        ItemID = 0,
        ItemName,
        Asset_Type_Code,
        Asset_Type,
        Effective_From,
        Effective_Till,
        txn_ts
    }
    public partial class Items : AbstractScreen, ILink
    {
        private AMS_APPDbFacade dbFacade;

        public Items()
        {
            InitializeComponent();
        }

        #region ILink Members

        LookupResult ILink.GetLookupResult()
        {
            return null;
            //throw new Exception("The method or operation is not implemented.");
        }

        void ILink.SetLookupResult(LookupResult result, Control targetControl)
        {
            //throw new Exception("The method or operation is not implemented.");
        }
        #endregion
        public override string ScreenId
        {
            get
            {
                return "ENT_01";
            }
        }
        protected override void InitializeDbFacade()
        {
            this.dbFacade = new AMS_APPDbFacade(this.ApplicationId);
        }

        private void Items_Load(object sender, EventArgs e)
        {
            DataTable assetTypes = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT * FROM FnGetAssetTypes()").Tables[0];
            this.grdItems.SetComboBoxColumnDataSource(ItemColNames.Asset_Type_Code.ToString(), assetTypes, "asset_type_id", "asset_type_cd");
        }
        public override bool IsReadyToSave()
        {
            return true;
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ReloadGridFromDatabase();
        }
        public override void Save()
        {
            try
            {
                this.dbFacade.BeginTrans();
                List<DCCDataRowView> deletedRows = this.grdItems.GetRowsForState(RowStates.Deleted);
                foreach (DCCDataRowView rv in deletedRows)
                {
                    this.dbFacade.DelItem(rv.AsInt(ItemColNames.ItemID.ToString()));
                }
                List<DCCDataRowView> updatedRows = this.grdItems.GetRowsForState(RowStates.Updated);
                foreach (DCCDataRowView rv in updatedRows)
                {
                    int? itemId = DbManager.GetInteger(rv[ItemColNames.ItemID.ToString()]);
                    string itemNm = DbManager.GetString(rv[ItemColNames.ItemName.ToString()]);
                    byte assetTypeId = DbManager.GetByte(rv[ItemColNames.Asset_Type_Code.ToString()]);
                    DateTime effectiveFrom = DbManager.GetDateTime(rv[ItemColNames.Effective_From.ToString()]);
                    DateTime effectiveTill = DbManager.GetDateTime(rv[ItemColNames.Effective_Till.ToString()]);
                    long txnts = DbManager.GetLong(rv[ItemColNames.txn_ts.ToString()]);
                    this.dbFacade.UpdItem(itemId, itemNm, assetTypeId, effectiveFrom, effectiveTill, txnts);
                }

                List<DCCDataRowView> insertedRows = this.grdItems.GetRowsForState(RowStates.New);
                foreach (DCCDataRowView rv in insertedRows)
                {
                    int itemId = 0;
                    string itemNm = DbManager.GetString(rv[ItemColNames.ItemName.ToString()]);
                    byte assetTypeId = (byte)DbManager.GetByte(rv[ItemColNames.Asset_Type_Code.ToString()]);
                    DateTime effectiveFrom = DbManager.GetDateTime(rv[ItemColNames.Effective_From.ToString()]);
                    DateTime effectiveTill = DbManager.GetDateTime(rv[ItemColNames.Effective_Till.ToString()]);
                    long txnts = DbManager.GetInteger(rv[ItemColNames.txn_ts.ToString()]);
                    this.dbFacade.InsItem(itemNm, assetTypeId, effectiveFrom, effectiveTill, ref itemId);
                }
                this.dbFacade.CommitTrans();
                this.ReloadGridFromDatabase();
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
        }

        private void ReloadGridFromDatabase()
        {
            //DataTable itemsTable = AMS_APPDbFacade.ObjDBManager.ExecuteSQL("Select * from  FnGetItems()").Tables[0];
            bool showCurrent = this.btnShowCurrent.Text == "Show All";
            DataTable itemsTable = this.dbFacade.QryItem(showCurrent ? "Yes" : "No").Tables[0];
            this.grdItems.RetrieveRecords(itemsTable, false, RowStates.Old);
        }

        private void btnShowCurrent_Click(object sender, EventArgs e)
        {
            //if (this.btnShowCurrent.Text == "Show Current")
            //{
            //    this.btnShowCurrent.Text = "Show All";
            //}
            //else
            //{
            //    this.btnShowCurrent.Text = "Show Current";
            //}
            //ReloadGridFromDatabase();
        }

        private void grdItems_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {
            this.grdItems.SetCellValue(ItemColNames.Effective_From.ToString(), e.RowIndex, DateTime.Now);
            this.grdItems.SetCellValue(ItemColNames.Effective_Till.ToString(), e.RowIndex, DateTime.MaxValue);
        }

        private void grdItems_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void grdItems_CellLeave(object sender, DataGridViewCellEventArgs e)
        {
            
            if(((DCCGrid)sender).CurrentColumnName == "Asset_Type_Code"){
                Logger.Debug("Cell Leave called");
                //this.grdItems.GetCellValue();
                //((DCCGrid)sender).CurrentRowIndex
            }
        }
    }
}