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
    public partial class DistrictOrCities: CDBAbstractScreen
    {        
        public DistrictOrCities()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_DISTRICT_OR_CITIES;
            }
        }
      
        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            district_or_city_id = 0,
            district_cd,
            district_nm,
            state_id,
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
                this.intDisttID.ReadOnly = true;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intDisttID.ReadOnly = false;
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
            this.ObjectIdForLogOperation = this.intDisttID.DisplayText;
            this.intDisttID.ReadOnly = true;
        }



        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewDistrictsOrCitieSQLSelectQuery query = new ViewDistrictsOrCitieSQLSelectQuery();

            //This line avoids the if condition and specifies that place_id is a primary/indexed key.
            query.district_or_city_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intDisttID 
            //field as the between clause bounds. 
            query.district_or_city_id.Equal(this.intDisttID.DisplayText);
            //]]

            query.district_cd.Contains(this.txtCode.DisplayText);
            query.district_nm.Contains(this.txtName.DisplayText);

            query.state_id.Equal(this.lookupStates.IdTextAsInteger );
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

            this.dbFacade.InsertDistrictsOrCitie(ref generatedId,
                                                this.txtCode.DisplayText,
                                                this.txtName.DisplayText,
                                                this.lookupStates.IdTextAsInteger,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdateDistrictsOrCitie((short)this.intDisttID.DisplayTextAsInteger.Value,
                                                this.txtCode.DisplayText,
                                                this.txtName.DisplayText,
                                                this.lookupStates.IdTextAsInteger,
                                                txn_ts,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate
                                                );

        }
        public override void DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteDistrictsOrCitie((short)this.intDisttID.DisplayTextAsInteger.Value, txn_ts);
        }

        private void lookupStates_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (!string.IsNullOrEmpty(lookupCountries.IdText.ToString()))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("2=2", "s.country_id = " + this.lookupCountries.IdTextAsInteger);                
                
            }
        }

        private void lookupCountries_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            this.lookupStates.ClearControlValues();
        }

        

      

    }
}