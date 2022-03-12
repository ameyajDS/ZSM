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
    public partial class Occupations : CDBAbstractScreen
    {
        public Occupations()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_OCCUPATIONS;
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
            this.intOccupationID.ReadOnly = true;
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intOccupationID.ReadOnly = false;
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
            this.ObjectIdForLogOperation = this.intOccupationID.DisplayText;
        }


        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewOccupationSQLSelectQuery query = new ViewOccupationSQLSelectQuery();

            //This line avoids the if condition and specifies that occupation_id is a primary/indexed key.
            query.occupation_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intOccupationID 
            //field as the between clause bounds. 
            query.occupation_id.Between(this.intOccupationID);
            //]]

            query.occupation_nm.Contains(this.txtOccupationName.DisplayText);
            query.occupation_cd.Contains(this.txtOccupationCode.DisplayText);
          
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
            this.dbFacade.InsertOccupation(ref generatedId,
                                                this.txtOccupationCode.DisplayText,
                                                this.txtOccupationName.DisplayText,                                               
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdateOccupation((short)this.intOccupationID.DisplayTextAsInteger.Value,
                                                this.txtOccupationCode.DisplayText,
                                                this.txtOccupationName.DisplayText, 
                                                txn_ts,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
                                               
        }
        public override void DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteOccupation((short)this.intOccupationID.DisplayTextAsInteger.Value,                                               
                                                txn_ts);
        }

  
    
    }
}