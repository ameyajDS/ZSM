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
using DCC.UMB.CDBLookups;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ENT
{
    public partial class PostOfficesOrCities : ZSMAbstractScreen
    {
        public PostOfficesOrCities()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_POSTOFFICESORCITIES;
            }
        }
        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            occupation_id = 0,
            occupation_cd,
            occupation_nm,
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
                this.intID.ReadOnly = true;
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

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = this.intID.DisplayText;
            this.intID.ReadOnly = true;
        }


        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewPostOfficesOrCitieSQLSelectQuery query = new ViewPostOfficesOrCitieSQLSelectQuery();

            //This line avoids the if condition and specifies that post_office_or_city_id is a primary/indexed key.
            query.post_office_or_city_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intID 
            //field as the between clause bounds. 
            query.post_office_or_city_id.Equal(this.intID.DisplayText);
            //]]

            query.country_nm.Contains(this.lookupCountries.DisplayText);
            query.country_id.Equal(this.lookupCountries.IdText);
            query.district_or_city_id.Equal(this.lookupDistrictorCities.IdText);
            query.state_id.Equal(this.lookupStates.IdText);

            query.post_office_or_city_nm.Contains(this.txtName.DisplayText);
            query.post_office_or_city_cd.Contains(this.txtCode.DisplayText);
            query.std_code.Contains(this.txtSTDCode.DisplayText);

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
            this.dbFacade.InsertPostOfficesOrCitie(ref generatedId,
                                                this.lookupDistrictorCities.IdTextAsInteger,
                                                this.txtCode.DisplayText,
                                                this.txtName.DisplayText,  
                                                this.txtSTDCode.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdatePostOfficesOrCitie((short)this.intID.DisplayTextAsInteger.Value,                                                
                                                this.lookupDistrictorCities.IdTextAsInteger,
                                                this.txtCode.DisplayText,
                                                this.txtName.DisplayText,
                                                this.txtSTDCode.DisplayText,                                                
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate,
                                                txn_ts);
                                               
        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeletePostOfficesOrCitie(this.intID.DisplayTextAsShort.Value, txn_ts);
            return true;
        }       

        private void lookupCountries_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.lookupStates.ClearControlValues();
            this.lookupDistrictorCities.ClearControlValues();
            this.lookupStates.CountryCode = this.lookupCountries.IdTextAsInteger.Value;
        }

        private void lookupStates_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.lookupDistrictorCities.StateCode = this.lookupStates.IdTextAsInteger.Value;
            this.lookupDistrictorCities.ClearControlValues();
        }

      
        
    
    }
}