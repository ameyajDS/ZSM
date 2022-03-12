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

namespace DCC.ZOS.ZSM.ENT
{
    public partial class MedicalDisabilities : ZSMAbstractScreen
    {

        public MedicalDisabilities()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_MEDICAL_DISABILITIES;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            skill_id = 0,
            skill_nm,
            txn_ts,
            effective_from,
            effective_till           
        }

        #endregion     

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        public override void ClearControls()
        {
            base.ClearControls();            
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.intMedicalDisbID.ReadOnly = true;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intMedicalDisbID.ReadOnly = false;
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

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = this.intMedicalDisbID.DisplayText;
            this.intMedicalDisbID.ReadOnly = true;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewMedicalDisabilitieSQLSelectQuery query = new ViewMedicalDisabilitieSQLSelectQuery();

            //This line avoids the if condition and specifies that place_id is a primary/indexed key.
            query.medical_disability_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intSurgeryId 
            //field as the between clause bounds. 
            query.medical_disability_id.Equal(this.intMedicalDisbID.DisplayText);
            //]]

            query.medical_disability_nm.Contains(this.txtMedicalDisbName.DisplayText);

            //[[This pair will specify that get me all those records which are effective as on a date,
            //specified by the date range pair (notice that at run time in query mode the pair hides one 
            //field and allows only one field to be entered)
            query.effective_from.LessThanEqualTo(this.dtmEffectiveRange.FromDate);
            query.effective_till.GreaterThanEqualTo(this.dtmEffectiveRange.FromDate);
            //]]
            return dbFacade.ExecuteSelectQuery(query);
        }


        public override void CreateData()
        {
            Int16 generatedId = default(Int16);
            this.dbFacade.InsertMedicalDisabilitie(ref generatedId,
                                                this.txtMedicalDisbName.DisplayText, 
                                                this.txtCode.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdateMedicalDisabilitie((short)this.intMedicalDisbID.DisplayTextAsInteger.Value,                                                
                                                this.txtMedicalDisbName.DisplayText,
                                                this.txtCode.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate,
                                                txn_ts
                                                );

        }
        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteMedicalDisabilitie((Int16?)this.intMedicalDisbID.DisplayTextAsShort.Value, txn_ts);
            return true;
        }
        
    
    }
}