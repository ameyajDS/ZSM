using System;
using System.Collections.Generic;
using System.Data;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.ZOS.ZSM;
using DCC.UMB.CDF.MGMT.Global;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.Utils;
using System.Collections;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ENT
{
    partial class CreditSpecifications : ZSMAbstractScreen
    {
        private int? satsangCentreId = ZSMUtility.GetSatsangCentreId();
        private string satsangCentreName = ZSMUtility.GetSatsangCentreName();

        public CreditSpecifications()
        {
            InitializeComponent();
            this.lblGridCreditSpecificationsOfAGroup.ForeColor = DCC.UMB.CDF.Configuration.Constants.DEFAULT_READONLY_FORE_COLOR;
        }

        public override string ScreenId
        {
            get
            {
                return Screens.SETUP_CREDIT_SPECIFICATIONS;
            }
        }
         #region Nested type: grdListColNames

        private enum grdListColNames
        {
            txn_ts
        }
#endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.txtSatsangCentre.DisplayText = satsangCentreName;
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            this.intID.ReadOnly = true;

            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.dtCreditSpecificationDate.DisplayTextAsDateTime = DateTime.Now;
                this.dtSpecificationTs.DisplayTextAsDateTime = DateTime.Now;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intID.ReadOnly = false;
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.List)
            {
                this.ShowListView(this.scListOrBrowse, true);
            }
            else if (uiMode == UIModes.Browse)
            {
                this.ShowListView(this.scListOrBrowse, false);
            }
        }

        public override bool DoesActionCauseReloadOfCurrentRecordInBrowseMode(string p)
        {
            return false;
        }

        public override void ExecuteScreenAction(string actionId)
        {
            switch (actionId)
            {
                case "Copy":
                    short? newCreditSpecificationId = null;
                    CopyCreditSpecifications objScreen = new CopyCreditSpecifications();
                    newCreditSpecificationId = objScreen.ShowDialog(this.dbFacade.ObjDBManager, this.intID.DisplayTextAsShort,
                        this.txtCreditSpecificationName.DisplayText, GlobalAppVariables.ObjMDIMain);
                    if (newCreditSpecificationId != null)
                    {                        
                        GlobalAppVariables.ObjMDIMain.FireQueryMode();
                        this.intID.DisplayText = Convert.ToString(newCreditSpecificationId);
                        GlobalAppVariables.ObjMDIMain.FireRetrieveMode();
                        this.intMinCreditCnt.Focus();
                    }
                    break;
            }
        }

        public override void LoadBrowseView(int rowIndex)
        {
            // All the Details, Retrive from Database are Display in all the fields through GridList.
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1,this.txtSatsangCentre);
            this.txtSatsangCentre.DisplayText = satsangCentreName;
            this.ObjectIdForLogOperation = this.intID.DisplayText;

            DataSet dset;
            dset = this.dbFacade.QueryCreditSpecificationsSewa(this.intID.DisplayTextAsShort);
            this.grdCreditSpecSewas.RetrieveRecords(dset.Tables[0], false, RowStates.Old);
            dset = this.dbFacade.QueryCreditSpecificationsOfAGroup(this.txtCreditGroupNm.DisplayText, this.intID.DisplayTextAsShort);
            this.grdCreditSpecificationsOfAGroup.RetrieveRecords(dset.Tables[0], false, RowStates.Old);

        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewCreditSpecificationsSQLSelectQuery query = new ViewCreditSpecificationsSQLSelectQuery();

            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.credit_specification_id.Equal(this.intID.DisplayText);
            query.credit_specification_nm.Contains(this.txtCreditSpecificationName.DisplayText);

            query.credit_specification_dt.Between(this.dtCreditSpecificationDate);

            //Below 2 fields are not required as query fields
            //query.specification_ts.Between(this.dtSpecificationTs);
            //query.computation_ts.Between(this.dtComputationTs);                       


            query.is_uniform_specification.Equal(this.chkIsUniformSpecification.BlnString);
            query.is_outstation_sewadar.Equal(this.cmbOutstationSewadar.SelectedValue);
            query.is_exemption_considered.Equal(this.chkIsExemptionConsidered.BlnString);
            query.is_finally_used.Equal(this.chkis_finally_used.BlnString);

            query.credit_cnt.Equal(this.intCreditCnt.DisplayTextAsInteger);            
            query.unit_cnt.Equal(this.intUnitCnt.DisplayTextAsInteger);
            query.min_credit_cnt.Equal(this.intMinCreditCnt.DisplayTextAsInteger);

            return dbFacade.ExecuteSelectQuery(query);
			
		
        }

       
        public override void CreateData()
        {
            short generatedId = default(short);
            this.dbFacade.InsertCreditSpecification(ref generatedId,
                                                this.txtCreditSpecificationName.DisplayText, this.dtCreditSpecificationDate.DisplayTextAsDateTime,
                                                satsangCentreId, this.txtCreditGroupNm.DisplayText,
                                                this.chkIsUniformSpecification.BlnString, this.cmbOutstationSewadar.SelectedValueAsStr,
                                                this.intCreditCnt.DisplayTextAsShort, this.intUnitCnt.DisplayTextAsShort,
                                                this.chkIsExemptionConsidered.BlnString, this.lkpPresenceSewa.IdTextAsInteger,
                                                this.intMinCreditCnt.DisplayTextAsShort, this.dtSpecificationTs.DisplayTextAsDateTime,
                                                this.dtComputationTs.DisplayTextAsDateTime, this.dtLastAppointment.DisplayTextAsDateTime,this.chkis_finally_used.BlnString);

            this.ObjectIdForLogOperation = generatedId.ToString();

            //[[All the grid updates in database is done in one shot.
            this.dbFacade.AddDbTasks(SaveAllGridAsTask(generatedId));
            this.dbFacade.ExecuteDbTasks();
            //]] 
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());

            this.dbFacade.ClearDbTasks();
            
            dbFacade.AddDbTasks(SaveAllGridAsTask(this.intID.DisplayTextAsShort));

            this.dbFacade.AddDbTask(this.dbFacade.UpdateCreditSpecificationAsTask(this.intID.DisplayTextAsShort, this.txtCreditSpecificationName.DisplayText, this.dtCreditSpecificationDate.DisplayTextAsDateTime,
                                                satsangCentreId, this.txtCreditGroupNm.DisplayText,
                                                this.chkIsUniformSpecification.BlnString, this.cmbOutstationSewadar.SelectedValueAsStr,
                                                this.intCreditCnt.DisplayTextAsShort, this.intUnitCnt.DisplayTextAsShort,
                                                this.chkIsExemptionConsidered.BlnString, this.lkpPresenceSewa.IdTextAsInteger, this.intMinCreditCnt.DisplayTextAsShort, 
                                                this.chkis_finally_used.BlnString, this.dtLastAppointment.DisplayTextAsDateTime, txn_ts));
                        

            //[[All the grid updates in database is done in one shot.
            this.dbFacade.ExecuteDbTasks();
            //]]                



        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.DeleteCreditSpecificationAsTask(this.intID.DisplayTextAsShort,txn_ts));
            this.dbFacade.ExecuteDbTasks();
            return true;
        }

        private List<string> SaveAllGridAsTask(short? shtCredSpecId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("credit_specification_id", shtCredSpecId);

                if (this.grdCreditSpecSewas.Rows.Count > 0)
                {
                    allTasks = this.grdCreditSpecSewas.GetAllDBTasks(this.dbFacade, "DeleteCreditSpecificationsSewaAsTask", "UpdateCreditSpecificationsSewaAsTask", "InsertCreditSpecificationsSewaAsTask", overiddingParamValues);
                }

                return allTasks;
            }
            catch
            {
                throw;
            }

        }


        private void grdSubJob_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void lkpPresenceSewa_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        
              
    }
}