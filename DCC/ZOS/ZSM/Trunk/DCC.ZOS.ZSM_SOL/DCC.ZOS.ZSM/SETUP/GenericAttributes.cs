using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using DCC.DBFacade;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.MGMT.Global;
using System.Collections.Generic;


namespace DCC.ZOS.ZSM.SETUP
{
    public partial class GenericAttributes : ZSMAbstractScreen
    {
        public GenericAttributes()
        {
            InitializeComponent();            
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here

                return Screens.SETUP_GENERIC_ATTRIBUTES;
            }
        }
               
        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            attribute_id,
            txn_ts
        }

        private enum grdAttributeValueColNames
        {
            attribute_value_sq,
            attribute_value
        }

        private enum grdAttributeStatusColNames
        {
            sewadar_status_cd
        }

        private enum grdSatsangCentresColNames
        {
            effective_from,
            effective_till
        }

        #endregion


        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();

        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.ShowListView(this.scBrowseOrList, false);
                this.DisableControls(false);
                //your custom after clearing the screen controls go here
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.ShowListView(this.scBrowseOrList, false);
                this.DisableControls(false);
            }
            else if (uiMode == UIModes.Retrieve)
            {                
                ClearControls();
            }
            else if (uiMode == UIModes.List)
            {
                this.ShowListView(this.scBrowseOrList, true);
            }
            else if (uiMode == UIModes.Browse)
            {
                this.ShowListView(this.scBrowseOrList, false);
            }
        }

        private void DisableControls(bool disable)
        {
            this.txtAttGroup.ReadOnly = disable;
            this.cmbAttributeType.ReadOnly = disable;
            this.intAttributeLength.ReadOnly = disable;
            this.intAttributeScale.ReadOnly = disable;
            this.chkIsTemporal.Enabled = !disable;
            this.chkIsMandatory.Enabled = !disable;
            this.chkIsStatusApplicable.Enabled = !disable;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewGenericAttributeSQLSelectQuery query = new ViewGenericAttributeSQLSelectQuery();

            query.attribute_id.IsExcluisive = true;
            query.attribute_id.Equal(this.intID.DisplayText);
            query.attribute_nm.Contains(this.txtName.DisplayText);
            query.attribute_group.Contains(this.txtAttGroup.DisplayText);
            query.attribute_sq.Equal(this.intAttributeSq.DisplayTextAsInteger);
            query.attribute_type.Contains(this.cmbAttributeType.SelectedValue);
            query.attribute_length.Equal(this.intAttributeLength.DisplayTextAsInteger);
            query.attribute_scale.Equal(this.intAttributeScale.DisplayTextAsInteger);
            query.is_temporal.Equal(this.chkIsTemporal.BlnString);
            query.is_mandatory.Equal(this.chkIsMandatory.BlnString);
            query.is_status_applicable.Equal(this.chkIsStatusApplicable.BlnString);

            return dbFacade.ExecuteSelectQuery(query);
                        
        }

        public override void LoadBrowseView(int rowIndex)
        {
            // All the Details, Retrive from Database are Display in all the fields through GridList.
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scBrowseOrList.Panel1);
            
            this.ObjectIdForLogOperation = this.intID.DisplayText;

            LoadAllGrids();
            if (this.dbFacade.IsGenericAttributeInUse(this.intID.DisplayTextAsShort) == "Yes")
            {
                this.DisableControls(true);
            }
            else
            {
                this.DisableControls(false);
            }           
            
        }

        private void LoadAllGrids()
        {
            short? intAttributeId = this.grdList.AsShort(grdListColNames.attribute_id.ToString());

            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QueryGenericAttributesListValueAsTask(intAttributeId));
            this.dbFacade.AddDbTask(this.dbFacade.QueryGenericAttributesStatusAsTask(intAttributeId));
            this.dbFacade.AddDbTask(this.dbFacade.QueryGenericAttributesSatsangCentreAsTask(intAttributeId));
            
            DataSet dset = this.dbFacade.ExecuteDbTasks();
            this.grdAttributeValue.RetrieveRecords(dset.Tables[0], false, RowStates.Old);
            this.grdAttributeStatus.RetrieveRecords(dset.Tables[1], false, RowStates.Old);
            this.grdSatsangCentre.RetrieveRecords(dset.Tables[2], false, RowStates.Old);
 
        }

        public void ClearDetailView()
        {
            ClearAllControlsOfContainer(this, true);
        }

        public override bool IsReadyToSave()
        {
            if (base.IsReadyToSave() == false) return false;
            if ((this.cmbAttributeType.SelectedText != "List") && 
                ((this.grdAttributeValue.RowCount - this.grdAttributeValue.GetRowsForState(RowStates.None).Count) > 0))
            {
                this.grdAttributeValue.SetFocus(grdAttributeValue.Columns[grdAttributeValueColNames.attribute_value.ToString()].Index, 0);
                UIManager.ShowMessage(MsgCodes.ValueReqdSpecs, "Entries in Attributes List Values Grid|Attribute Type|List", MessageTypes.Warning);
                return false;
            }
            if ((this.cmbAttributeType.SelectedText == "List") &&
                ((this.grdAttributeValue.RowCount - this.grdAttributeValue.GetRowsForState(RowStates.None).Count) < 1))
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, "For an attribute of type 'List', atleast one entry in 'Attributes List Values Grid'", MessageTypes.Warning);
                return false;
            }
            if ((this.chkIsStatusApplicable.BlnString != "Yes") &&
                ((this.grdAttributeStatus.RowCount - this.grdAttributeStatus.GetRowsForState(RowStates.None).Count) > 0))
            {
                this.grdAttributeStatus.SetFocus(grdAttributeStatus.Columns[grdAttributeStatusColNames.sewadar_status_cd.ToString()].Index, 0);
                UIManager.ShowMessage(MsgCodes.ValueReqdSpecs, "Entries in 'Attributes Status Grid'|'Is Status Applicable'|set", MessageTypes.Warning);
                return false;
            }
            if ((this.chkIsStatusApplicable.BlnString == "Yes") &&
                ((this.grdAttributeStatus.RowCount - this.grdAttributeStatus.GetRowsForState(RowStates.None).Count) < 1))
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, "For an attribute with 'Is Status Applicable' set, atleast one entry in 'Attributes Status Grid'", MessageTypes.Warning);
                return false;
            }
            return true;
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.UpdateGenericAttributeAsTask(this.intID.DisplayTextAsShort, this.txtName.DisplayText, this.txtAttGroup.DisplayText,
                                                                                this.intAttributeSq.DisplayTextAsShort, this.cmbAttributeType.SelectedText,
                                                                                this.intAttributeLength.DisplayTextAsByte, this.intAttributeScale.DisplayTextAsByte,
                                                                                this.chkIsTemporal.BlnString, this.chkIsMandatory.BlnString, this.chkIsStatusApplicable.BlnString,
                                                                                this.txtRemarks.DisplayText, txn_ts));

            this.dbFacade.AddDbTasks(SaveAllGridAsTask(this.intID.DisplayTextAsShort));
            this.dbFacade.ExecuteDbTasks();
            
        }
        
        public override void CreateData()
        {
            short generatedId = default(short);
            this.dbFacade.InsertGenericAttribute(ref generatedId,
                                                this.txtName.DisplayText, this.txtAttGroup.DisplayText,
                                                this.intAttributeSq.DisplayTextAsShort, this.cmbAttributeType.SelectedText,
                                                this.intAttributeLength.DisplayTextAsByte, this.intAttributeScale.DisplayTextAsByte,
                                                this.chkIsTemporal.BlnString, this.chkIsMandatory.BlnString, this.chkIsStatusApplicable.BlnString,
                                                this.txtRemarks.DisplayText);

            this.ObjectIdForLogOperation = generatedId.ToString();           
            
            //[[Save all grids
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTasks(SaveAllGridAsTask(generatedId));
            this.dbFacade.ExecuteDbTasks();
            //]]
            
        }


        private List<string> SaveAllGridAsTask(short? shtAttributeID)
        {
            List<string> allTasks = new List<string>();
            try
            {
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("attribute_id", shtAttributeID);

                if (this.grdAttributeStatus.Rows.Count > 0)
                {
                    allTasks = this.grdAttributeStatus.GetAllDBTasks(this.dbFacade, "DeleteGenericAttributesStatusAsTask", "UpdateGenericAttributesStatusAsTask", "InsertGenericAttributesStatusAsTask", overiddingParamValues);
                }

                if (this.grdAttributeValue.Rows.Count > 0)
                {
                    allTasks.AddRange(this.grdAttributeValue.GetAllDBTasks(this.dbFacade, "DeleteGenericAttributesListValueAsTask", "UpdateGenericAttributesListValueAsTask", "InsertGenericAttributesListValueAsTask", overiddingParamValues, grdAttributeValueColNames.attribute_value_sq.ToString(), "UpdateGenericAttributesListValuesSqAsTask", "MakeGenericAttributesListValuesSqPositiveAsTask"));
                }

                if (this.grdSatsangCentre.Rows.Count > 0)
                {
                    allTasks.AddRange(this.grdSatsangCentre.GetAllDBTasks(this.dbFacade, "DeleteGenericAttributesSatsangCentreAsTask", "UpdateGenericAttributesSatsangCentreAsTask", "InsertGenericAttributesSatsangCentreAsTask", overiddingParamValues));
                }
               return allTasks;
            }
            catch
            {
                throw;
            }

        }

        public override void ClearControls()
        {
            base.ClearControls();
            
        }

        private void grdSatsangCentre_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {
            this.grdSatsangCentre.SetCellValue(grdSatsangCentresColNames.effective_from.ToString(),
             e.RowIndex, DateTime.Today.Date);
            this.grdSatsangCentre.SetCellValue(grdSatsangCentresColNames.effective_till.ToString(),
                e.RowIndex, DateTime.MaxValue.Date);
        }

    }
}
