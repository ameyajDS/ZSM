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
    partial class WeeklySewaLocations : ZSMAbstractScreen
    {
        public WeeklySewaLocations()
        {
            InitializeComponent();
            DataTable dt = null;
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            dt = objDbManager.ExecuteSQL("SELECT satsang_centre_type FROM CDB..satsang_centre_types").Tables[0];

            this.cmbSatsangCentreType.SetDataSource(dt, "satsang_centre_type", "satsang_centre_type", true);                     
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ENT_WEEKLY_SEWA_LOCATIONS;
            }
        }
         #region Nested type: grdListColNames

        private enum grdListColNames
        {
            satsang_centre_id,
            txn_ts,
            effective_till,
            effective_from,
            remarks,
            weekly_sewa_location_nm,
            weekly_sewa_location_id,
        }
#endregion
        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        private void makeEditableOnlyInQueryMode(bool isQuery)
        {
            this.txtWeeklySewaLocationId.ReadOnly = !isQuery;
        }

        public override void ClearControls()
        {
            base.ClearControls();            
            DataTable dt = null;
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();

            dt = objDbManager.ExecuteSQL(string.Format("SELECT satsang_centre_id, satsang_centre_cd,satsang_centre_nm,satsang_centre_type FROM cdb..satsang_centres WHERE satsang_centre_id = {0}", ZSMUtility.GetSatsangCentreId())).Tables[0];

            this.LoadDataToContainer(dt, tlpTop);
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);

            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(false);
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(true);
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(false);
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
            makeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.tlpTopMost,this.tlpTop);
            this.ObjectIdForLogOperation = this.txtWeeklySewaLocationId.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewWeeklySewaLocationSQLSelectQuery query = new ViewWeeklySewaLocationSQLSelectQuery();

            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.weekly_sewa_location_id.Equal(this.txtWeeklySewaLocationId.DisplayTextAsInteger);
            query.weekly_sewa_location_nm.Equal(this.txtWeeklySewaLocation.DisplayText);
            query.effective_from.LessThanEqualTo(this.dtmEffectiveRange.FromDate);
            query.effective_till.GreaterThanEqualTo(this.dtmEffectiveRange.FromDate);

            return this.dbFacade.ExecuteSelectQuery(query);   
        }

       
        public override void CreateData()
        {
            int int_weekly_sewa_location_id = 0;
            this.dbFacade.InsertWeeklySewaLocation(ref int_weekly_sewa_location_id, 
                                                   this.txtWeeklySewaLocation.DisplayText, 
                                                   ZSMUtility.GetSatsangCentreId(),
                                                   txtRemarks.DisplayText,
                                                   dtmEffectiveRange.FromDate,
                                                   dtmEffectiveRange.ToDate
                                                 );
            this.ObjectIdForLogOperation = int_weekly_sewa_location_id.ToString();
           
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            this.dbFacade.UpdateWeeklySewaLocation(this.txtWeeklySewaLocationId.DisplayTextAsInteger,
                                                    this.txtWeeklySewaLocation.DisplayText,
                                                    ZSMUtility.GetSatsangCentreId(),
                                                    txtRemarks.DisplayText,
                                                    dtmEffectiveRange.FromDate,
                                                    dtmEffectiveRange.ToDate,
                                                    txn_ts
                                                    );        
        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteWeeklySewaLocation(this.txtWeeklySewaLocationId.DisplayTextAsInteger, txn_ts);
            return true;
        }
    }
}