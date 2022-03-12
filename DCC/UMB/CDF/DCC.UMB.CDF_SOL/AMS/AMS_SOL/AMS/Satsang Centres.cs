using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;
using System.Collections;
using DCC.DBFacade;
using DCC.UMB.CDF.DB;

namespace AES
{
    enum SatsangCentresColNames
    {
        satsang_centre_id = 1,
        Satsang_centre_nm,
        Centre_Type,
        Zone,
        Effective_from,
        effective_till,
        txn_ts
    }
    public partial class SatsangCentres : AbstractScreen
    {
        private AMS_APPDbFacade dbFacade;

        public SatsangCentres()
        {
            InitializeComponent();
            DataTable centreTypes = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT * FROM centre_types").Tables[0];
            this.grdSatsangCentres.SetComboBoxColumnDataSource(SatsangCentresColNames.Centre_Type.ToString(), centreTypes, "centre_type", "centre_type");

            DataTable zones = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT * FROM zones").Tables[0];
            this.grdSatsangCentres.SetComboBoxColumnDataSource(SatsangCentresColNames.Zone.ToString(), zones, "zone_id", "zone_nm");

        }

        private void Satsang_Centres_Load(object sender, EventArgs e)
        {

        }
        protected override void InitializeDbFacade()
        {
            this.dbFacade = new AMS_APPDbFacade(this.ApplicationId);
        }
        public override bool IsReadyToSave()
        {
            return true;
        }
        public override void Save()
        {
            try
            {
                this.dbFacade.BeginTrans();
                List<DCCDataRowView> deletedRows = this.grdSatsangCentres.GetRowsForState(DCC.UMB.CDF.UIControls.Grid.RowStates.Deleted);
                foreach (DCCDataRowView rv in deletedRows)
                {
                    this.dbFacade.DelSatsangCentre(DbManager.GetInteger(rv[SatsangCentresColNames.satsang_centre_id.ToString()]));
                }

                List<DCCDataRowView> updatedRows = this.grdSatsangCentres.GetRowsForState(DCC.UMB.CDF.UIControls.Grid.RowStates.Updated);
                foreach (DCCDataRowView rv in updatedRows)
                {
                    int centreId = DbManager.GetInteger(rv[SatsangCentresColNames.satsang_centre_id.ToString()]);
                    byte zoneId = DbManager.GetByte(rv[SatsangCentresColNames.Zone.ToString()]);
                    string centreType = DbManager.GetString(rv[SatsangCentresColNames.Centre_Type.ToString()]);
                    string centreName = DbManager.GetString(rv[SatsangCentresColNames.Satsang_centre_nm.ToString()]);
                    DateTime effectiveFrom = DbManager.GetDateTime(rv[SatsangCentresColNames.Effective_from.ToString()]);
                    DateTime effectiveTill = DbManager.GetDateTime(rv[SatsangCentresColNames.effective_till.ToString()]);
                    long txnts = DbManager.GetLong(rv[SatsangCentresColNames.txn_ts.ToString()]);

                    this.dbFacade.UpdSatsangCentre(centreId, zoneId, centreType, centreName, effectiveFrom, effectiveTill, txnts);
                }

                List<DCCDataRowView> insertedRows = this.grdSatsangCentres.GetRowsForState(DCC.UMB.CDF.UIControls.Grid.RowStates.New);
                foreach (DCCDataRowView rv in insertedRows)
                {
                    int centreId = 0;
                    byte zoneId = DbManager.GetByte(rv[SatsangCentresColNames.Zone.ToString()]);
                    string centreType = DbManager.GetString(rv[SatsangCentresColNames.Centre_Type.ToString()]);
                    string centreName = DbManager.GetString(rv[SatsangCentresColNames.Satsang_centre_nm.ToString()]);
                    DateTime effectiveFrom = DbManager.GetDateTime(rv[SatsangCentresColNames.Effective_from.ToString()]);
                    DateTime effectiveTill = DbManager.GetDateTime(rv[SatsangCentresColNames.effective_till.ToString()]);

                    this.dbFacade.InsSatsangCentre(zoneId, centreType, centreName, effectiveFrom, effectiveTill, ref centreId);
                }
                this.dbFacade.CommitTrans();
                this.ReloadGridFromDatabase();
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                throw ex;
            }
        }
        
        public override string ScreenId
        {
            get
            {
                return "ENT_02";
            }
        }
        public override void ShowScreen(DCC.UMB.CDF.Configuration.UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ReloadGridFromDatabase();
        }
        private void ReloadGridFromDatabase()
        {
            bool showCurrent = this.btnShowCurrent.Text == "Show All";
            DataTable satsangCentresTable = this.dbFacade.QrySatsangCentres(showCurrent ? "Yes" : "No").Tables[0];
            this.grdSatsangCentres.RetrieveRecords(satsangCentresTable, false, DCC.UMB.CDF.UIControls.Grid.RowStates.Old);
        }

        private void btnShowCurrent_Click(object sender, EventArgs e)
        {
            if (this.btnShowCurrent.Text == "Show Current")
            {
                this.btnShowCurrent.Text = "Show All";
            }
            else
            {
                this.btnShowCurrent.Text = "Show Current";
            }
            ReloadGridFromDatabase();
        }

        
    }

}