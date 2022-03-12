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

    public partial class Assets : AbstractScreen, ISummaryDetailEditor
    {
        private AMS_APPDbFacade dbFacade;

        public Assets()
        {
            InitializeComponent();
            
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
            DataTable centreTypes = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT * FROM centre_types").Tables[0];
            this.cmbCentreType.DataSource = centreTypes;
            this.cmbCentreType.DisplayMember = "centre_type";
            this.cmbCentreType.ValueMember = "centre_type";

            DataTable zones = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT * FROM zones").Tables[0];
            this.cmbZone.DataSource = zones;
            this.cmbZone.DisplayMember = "zone_nm";
            this.cmbZone.ValueMember = "zone_id";

            DataTable assetTypes = this.dbFacade.ObjDBManager.ExecuteSQL("select asset_type_id, asset_type_cd, asset_type_nm from asset_types").Tables[0];
            this.cmbAssetType.DataSource = assetTypes;
            this.cmbAssetType.DisplayMember = "asset_type_nm";
            this.cmbAssetType.ValueMember = "asset_type_id";


        }

       
        public override string ScreenId
        {
            get
            {
                return "ENT_03";
            }
        }
        protected override void InitializeDbFacade()
        {
            this.dbFacade = new AMS_APPDbFacade(this.ApplicationId);
        }

        public override DCCGrid ListViewGrid
        {
            get
            {
                return this.grdList;
            }
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            string centreType = null;
            if (this.cmbCentreType.SelectedValue != null)
            {
                centreType = (string)this.cmbCentreType.SelectedValue;
            }
            return this.dbFacade.QrySatsangCentresHoldingAssetsAsReader(this.txtIdNumber.IdTextAsInteger(),
                                      this.txtSatsangCentre.IdTextAsByte(), this.cmbZone.SelectedValueAsByte(),
                                      centreType, this.txtItemName.IdTextAsInteger(),
                                      this.cmbAssetType.SelectedValueAsByte());

        }

        public override void LoadBrowseView(int rowIndex)
        {
            this.cmbCentreType.SelectedValue = this.grdList.GetCellValue(ListGridCols.centre_type.ToString(), rowIndex);
            this.cmbZone.SelectedValue = this.grdList.GetCellValue(ListGridCols.zone_id.ToString(), rowIndex);
            string satsangCentreId = this.grdList.GetCellValueAsString(ListGridCols.satsang_centre_id.ToString(), rowIndex);
            string satsangCentreName = this.grdList.GetCellValueAsString(ListGridCols.satsang_centre_nm.ToString(), rowIndex);
            this.txtSatsangCentre.SetControlValues(satsangCentreName, satsangCentreName, satsangCentreId);
            //[[Now based upon the current SatsangCentre, load the items in the summary view.
            DataSet dset = this.dbFacade.QryAssets(byte.Parse(satsangCentreId));
            DataTable assetsForSatsangCentre = dset.Tables[0];
            this.grdSummary.RetrieveRecords(assetsForSatsangCentre,false,RowStates.Old);
            this.grdSummary.SetCurrentRow(0);
            //]]
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                //add a row in the summary grid 
                //This will automatically load the summary view data 
                //to detail view as we have the event handler for the row selection changed.
                scSummaryDetails.Panel2Collapsed = true;
                scSummaryDetails.Panel1Collapsed = false;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
            }
            else if(uiMode == UIModes.List)
            {
                this.listBrowseSplitContainer.Panel1Collapsed = true;
                this.listBrowseSplitContainer.Panel2Collapsed = false;

            }
            else if(uiMode == UIModes.Browse)
            {
                this.listBrowseSplitContainer.Panel1Collapsed = false;
                this.listBrowseSplitContainer.Panel2Collapsed = true;
            }
        }

        

        public override bool IsReadyToSave()
        {
            return true;
            //TODO to be implemented
        }


        private bool IsItemAndModelCombinationUnique()
        {
            List<KeyValuePair<string, object>> filterCriteria = new List<KeyValuePair<string, object>>();
            filterCriteria.Add(new KeyValuePair<string, object>(SummaryGridCols.item_id.ToString(), (long)this.txtItemName.IdTextAsInteger()));
            filterCriteria.Add(new KeyValuePair<string, object>(SummaryGridCols.make_model.ToString(), this.txtItemModel.DisplayText));
            List<RowStates> rowStatesToExclude = new List<RowStates>();
            rowStatesToExclude.Add(RowStates.Deleted);
            List<string> rowIdentifiersToExclude = new List<string>();
            rowIdentifiersToExclude.Add(this.grdSummary.CurrentRowIdentifier);
            List<DCCDataRowView> existingRows = grdSummary.FindRecords(filterCriteria, rowStatesToExclude, rowIdentifiersToExclude, true, true);
            if (existingRows.Count > 0)
            {
                UIManager.ShowMessage(MsgCodes.ValueRepeated, "Item and model combination", MessageTypes.Warning);
                return false;
            }
            return true;
        }

        public override void ClearControls()
        {
            try
            {
                this.ClearDetailView();
                this.grdSummary.RemoveAllRecords();
            }
            catch (Exception e)
            {
                System.Console.WriteLine(e);
            }
        }


        public override void Save()
        {
            if (CurrentUIMode == UIModes.Insert)
            {
                try
                {
                    this.dbFacade.BeginTrans();

                    ///[[Check if the summary-detail view is valid. THis will be done by PrepareForSave of SummaryDetailNavigator
                    if (!this.summaryDetailNavigator1.PrepareForSave())
                    {
                        return;
                    }
                    ///]]
                    List<DCCDataRowView> newRecordsView = this.grdSummary.GetRowsForState(RowStates.New);
                    byte? satsangCentreId = this.txtSatsangCentre.IdTextAsByte();
                    foreach (DCCDataRowView rowView in newRecordsView)
                    {
                        //grdSummary.GetCellValueAsInteger(SummaryGridCols.item_id.ToString(),rowView)
                        int? itemId = rowView.AsInt(SummaryGridCols.item_id.ToString());
                        string makeModel = rowView.AsStr(SummaryGridCols.make_model.ToString());
                        string strDetails = rowView.AsStr(SummaryGridCols.details.ToString());
                        string chalsisNo = rowView.AsStr(SummaryGridCols.chasis_no.ToString());
                        string entineNo = rowView.AsStr(SummaryGridCols.engine_no.ToString());
                        int? qty = (int)rowView.AsFlt(SummaryGridCols.quantity.ToString());
                        DateTime? acquisitiondate = rowView.AsDTM(SummaryGridCols.acquisition_dt.ToString());
                        int? presetValue = (int?)rowView.AsDbl(SummaryGridCols.present_value.ToString());
                        DateTime? valuationdate = rowView.AsDTM(SummaryGridCols.valuation_dt.ToString());
                        int? aclquisitionCost = (int?)rowView.AsDbl((SummaryGridCols.acquisition_cost.ToString()));
                        string strRemarks = rowView.AsStr(SummaryGridCols.remarks.ToString());
                        int assetid = 0;

                        this.dbFacade.InsAssets(satsangCentreId, itemId, makeModel, chalsisNo, strDetails, entineNo, qty,
                                                  acquisitiondate, aclquisitionCost, presetValue, valuationdate, strRemarks,
                                                  ref assetid);
                    }
                    this.dbFacade.CommitTrans();
                }
                catch (Exception e)
                {
                    this.dbFacade.RollbackTrans();
                    throw;
                }
                ///[[Now show the screen in insert mode again
                this.ShowScreen(UIModes.Insert, null);
                ///]]
            }
        }











        #region Implementation of ISummaryDetailEditor interface
        public DCCGrid Grid
        {
            get { return this.grdSummary; }
        }

        public bool IsDetailViewValid()
        {
            return this.cmbAssetType.IsValid() &&
                   this.txtQuantity.IsValid() &&
                   this.txtItemName.IsValid() &&
                   this.txtItemModel.IsValid() &&
                   this.IsItemAndModelCombinationUnique();
        }

        public void LoadSumaryToDetail()
        {
            object selectedValue =
                grdSummary.GetCellValue(SummaryGridCols.asset_type_id.ToString(), grdSummary.CurrentRowIndex);
            if (selectedValue != null)
            {
                this.cmbAssetType.SelectedValue = selectedValue;
            }
            //this.txtItemName.IdText =  grdSummary.GetCellValueAsString(SummaryGridCols.asset_id.ToString(), grdSummary.CurrentRowIndex);
            this.txtItemModel.DisplayText = grdSummary.GetCellValueAsString(SummaryGridCols.make_model.ToString(), grdSummary.CurrentRowIndex);
            this.txtQuantity.DisplayText = grdSummary.GetCellValueAsString(SummaryGridCols.quantity.ToString(), grdSummary.CurrentRowIndex);
            this.txtChasisNo.DisplayText = grdSummary.GetCellValueAsString(SummaryGridCols.chasis_no.ToString(), grdSummary.CurrentRowIndex);
            this.txtEngineNo.DisplayText = grdSummary.GetCellValueAsString(SummaryGridCols.engine_no.ToString(), grdSummary.CurrentRowIndex);
            string itemDisplayText = grdSummary.GetCellValueAsString(SummaryGridCols.item_nm.ToString(), grdSummary.CurrentRowIndex);
            int? itemIdText =
                grdSummary.GetCellValueAsInteger(SummaryGridCols.item_id.ToString(), grdSummary.CurrentRowIndex);
            this.txtItemName.SetControlValues(itemDisplayText, itemDisplayText, itemIdText.ToString());

            this.txtAquisitionCost.DisplayText = grdSummary.GetCellValueAsString(SummaryGridCols.acquisition_cost.ToString(), grdSummary.CurrentRowIndex);

            this.txtPresentValue.DisplayText = grdSummary.GetCellValueAsString(SummaryGridCols.present_value.ToString(), grdSummary.CurrentRowIndex);
            this.txtAquisitionDate.DisplayTextAsDateTime = grdSummary.GetCellValueAsDateTime(SummaryGridCols.acquisition_dt.ToString(), grdSummary.CurrentRowIndex);
            this.txtValuationDate.DisplayTextAsDateTime = grdSummary.GetCellValueAsDateTime(SummaryGridCols.valuation_dt.ToString(), grdSummary.CurrentRowIndex);
            this.txtRemarks.DisplayText = grdSummary.GetCellValueAsString(SummaryGridCols.remarks.ToString(), grdSummary.CurrentRowIndex);
            this.txtItemDetails.DisplayText =
                grdSummary.GetCellValueAsString(SummaryGridCols.details.ToString(), grdSummary.CurrentRowIndex);
            int? idNumber =
                grdSummary.GetCellValueAsInteger(SummaryGridCols.asset_id.ToString(), grdSummary.CurrentRowIndex);
            this.txtIdNumber.DisplayText = idNumber.ToString();
                
        }

        public void LoadDetailToSummary()
        {
            grdSummary.SetCellValue(SummaryGridCols.asset_type_id.ToString(), grdSummary.CurrentRowIndex, this.cmbAssetType.SelectedValue);
            grdSummary.SetCellValue(SummaryGridCols.asset_type_nm.ToString(), grdSummary.CurrentRowIndex, this.cmbAssetType.Text);
            grdSummary.SetCellValue(SummaryGridCols.asset_id.ToString(), grdSummary.CurrentRowIndex, this.txtItemName.IdTextAsInteger());
            grdSummary.SetCellValue(SummaryGridCols.make_model.ToString(), grdSummary.CurrentRowIndex, this.txtItemModel.DisplayText);
            grdSummary.SetCellValue(SummaryGridCols.quantity.ToString(), grdSummary.CurrentRowIndex, this.txtQuantity.DisplayTextAsDouble);
            grdSummary.SetCellValue(SummaryGridCols.chasis_no.ToString(), grdSummary.CurrentRowIndex, this.txtChasisNo.DisplayText);
            grdSummary.SetCellValue(SummaryGridCols.engine_no.ToString(), grdSummary.CurrentRowIndex, this.txtEngineNo.DisplayText);
            grdSummary.SetCellValue(SummaryGridCols.item_nm.ToString(), grdSummary.CurrentRowIndex, this.txtItemName.DisplayText);
            grdSummary.SetCellValue(SummaryGridCols.item_id.ToString(), grdSummary.CurrentRowIndex, this.txtItemName.IdTextAsInteger());
            grdSummary.SetCellValue(SummaryGridCols.acquisition_cost.ToString(), grdSummary.CurrentRowIndex,
                                    this.txtAquisitionCost.DisplayTextAsDouble);
            grdSummary.SetCellValue(SummaryGridCols.present_value.ToString(), grdSummary.CurrentRowIndex,
                                    this.txtPresentValue.DisplayTextAsDouble);
            grdSummary.SetCellValue(SummaryGridCols.acquisition_dt.ToString(), grdSummary.CurrentRowIndex,
                                    this.txtAquisitionDate.DisplayTextAsDateTime);
            grdSummary.SetCellValue(SummaryGridCols.valuation_dt.ToString(), grdSummary.CurrentRowIndex,
                                    this.txtValuationDate.DisplayTextAsDateTime);
            grdSummary.SetCellValue(SummaryGridCols.remarks.ToString(), grdSummary.CurrentRowIndex,
                                    this.txtRemarks.DisplayText);
            grdSummary.SetCellValue(SummaryGridCols.details.ToString(), grdSummary.CurrentRowIndex,
                                    this.txtItemDetails.DisplayText);



        }

        public void ToggleView(bool showDetails)
        {
            if (showDetails)
            {
                scSummaryDetails.Panel2Collapsed = true;
                scSummaryDetails.Panel1Collapsed = false;
            }
            else
            {
                scSummaryDetails.Panel2Collapsed = false;
                scSummaryDetails.Panel1Collapsed = true;
            }
        }

        public void EnableDetailView(bool enable)
        {

        }
        public void ClearDetailView()
        {

        }
        public bool IsDetailViewEmpty()
        {
            return false;
        }
        #endregion //end of Implementation of ISummaryDetailEditor interface

        private void grdSummary_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Assets_Load(object sender, EventArgs e)
        {
            InitializeDropDowns();
            this.summaryDetailNavigator1.SummaryDetailEditor = this;
        }

        


    }
}