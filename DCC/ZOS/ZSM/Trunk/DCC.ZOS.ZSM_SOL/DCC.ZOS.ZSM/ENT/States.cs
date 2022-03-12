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
using DCC.UMB;
using DCC.UMB.CDBLookups;

namespace DCC.ZOS.ZSM.ENT
{
    public partial class States : CDBAbstractScreen
    {
        public States()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_STATES;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            state_id = 0,
            state_cd,
            state_nm,
            country_id,
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
                this.intStateID.ReadOnly = true;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intStateID.ReadOnly = false;
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
            this.ObjectIdForLogOperation = this.intStateID.DisplayText;
            this.intStateID.ReadOnly = true;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewStateSQLSelectQuery query = new ViewStateSQLSelectQuery();

            //This line avoids the if condition and specifies that place_id is a primary/indexed key.
            query.state_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intSurgeryId 
            //field as the between clause bounds. 
            query.state_id.Equal(this.intStateID.DisplayText);
            //]]

            query.state_cd.Contains(this.txtStateCode.DisplayText);
            query.state_nm.Contains(this.txtStateName.DisplayText);
            query.country_id.Equal(this.lookupCountries.IdTextAsInteger);
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
            int generatedId = default(int);
            this.dbFacade.InsertState(ref generatedId,
                                                this.txtStateCode.DisplayText,
                                                this.txtStateName.DisplayText,
                                                this.lookupCountries.IdTextAsShort,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdateState((short)this.intStateID.DisplayTextAsInteger.Value,
                                                this.txtStateCode.DisplayText,
                                                this.txtStateName.DisplayText,
                                                this.lookupCountries.IdTextAsShort,
                                                txn_ts,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate
                                                );

        }
        public override void DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteState((short)this.intStateID.DisplayTextAsInteger.Value, txn_ts);
        }

        private void lookupCountries_Load(object sender, EventArgs e)
        {

        }
        
    
    }
}