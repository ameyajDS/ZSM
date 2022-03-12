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
    partial class Countries : CDBAbstractScreen
    {

        public Countries()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_COUNTRIES;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            country_id = 0,
            country_cd,
            country_nm,
            isd_code,
            gmt_diff,
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
                this.txtGMTDiff.DisplayText = "0.00";
                this.intCountryID.ReadOnly = true;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intCountryID.ReadOnly = false;
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
            this.ObjectIdForLogOperation = this.intCountryID.DisplayText;
            this.intCountryID.ReadOnly = true;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewCountrieSQLSelectQuery query = new ViewCountrieSQLSelectQuery();

            //This line avoids the if condition and specifies that country_id is a primary/indexed key.
            query.country_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intSurgeryId 
            //field as the between clause bounds. 
            query.country_id.Equal(this.intCountryID.DisplayText);
            //]]

            query.country_nm.Contains(this.txtName.DisplayText);
            query.country_cd.Contains(this.txtCountryCode.DisplayText);
            query.isd_code.Contains(this.txtISDCode.DisplayText);
            
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
            short generatedId = default(short);
            this.dbFacade.InsertCountrie(ref generatedId,
                                                this.txtCountryCode.DisplayText,
                                                this.txtName.DisplayText,
                                                this.txtISDCode.DisplayText,
                                                this.txtGMTDiff.DisplayTextAsDecimal,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            this.dbFacade.UpdateCountrie((short)this.intCountryID.DisplayTextAsInteger.Value,
                                                 this.txtCountryCode.DisplayText,
                                                this.txtName.DisplayText,
                                                this.txtISDCode.DisplayText,
                                                this.txtGMTDiff.DisplayTextAsDecimal,
                                                txn_ts,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate
                                               );

        }

        public override void DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteCountrie((short)this.intCountryID.DisplayTextAsInteger.Value,                                           
                                                txn_ts                                                
                                               );
        }

       

    
    }
}