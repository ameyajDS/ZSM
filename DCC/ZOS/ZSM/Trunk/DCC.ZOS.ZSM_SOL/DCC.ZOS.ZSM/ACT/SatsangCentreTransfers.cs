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

namespace DCC.ZOS.ZSM.ACT
{
    partial class SatsangCentreTransfers : ZSMAbstractScreen
    {
        public SatsangCentreTransfers()
        {
            InitializeComponent();
            this.sponGrNoLookup1.SttsCode = "SttsApprv";
            this.sponSewadarIDLookup1.SttsCode = "SttsApprv";
            this.sponSewadarLookup1.SttsCode = "SttsApprv";
            this.sewadarHeader1.SttsCode = "SttsCode";
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_SATSANG_CENTRE_TRANSFERS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
          
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
                this.dtEffectiveDate.DisplayTextAsDateTime = DateTime.Now;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
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

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSatsangCentreTransfersSQLSelectQuery query = new ViewSatsangCentreTransfersSQLSelectQuery();

            query.satsang_centre_id.Equal(this.zsmSatsangCentresLookup2.IdTextAsInteger);
            query.old_satsang_centre_id.Equal(this.zsmSatsangCentresLookup1.IdTextAsInteger);
            query.old_sewadar_grno.Equal(this.sewadarHeader1.txtGRNo.DisplayText);
            query.sewadar_grno.Equal(this.txtGRNo.DisplayText);
            query.is_outstation_sewadar.Equal(this.chkOutstation.Checked);
            query.sub_department_id.Equal(this.departmentChooserNew.SelectedSubDepartment);
            query.department_id.Equal(this.departmentChooserNew.SelectedDepartment);
            query.effective_dt.Between(this.dtEffectiveDate);

            return this.dbFacade.ExecuteSelectQuery(query);            
        }

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.tlpTopMost, this.tlpMiddle);
            this.sewadarHeader1.SetGRNoAndFireEvent(this.grdList.AsStr("old_sewadar_grno"), this.grdList.AsInt("old_satsang_centre_id"));
        }

        public override bool IsReadyToSave()
        {
            //[[Transfer date cannot be in future. 
            if (this.dtEffectiveDate.DisplayTextAsDateTime > DateTime.Now)
            {
                UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, "Effective Date | Today's date", MessageTypes.Error);
                return false;
            }
            //]]
            //[[Transfer date can not be earlier than the previous transfer date / appointment date. 
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("DECLARE @var1 DATETIME,@var2 DATETIME select @var1 = MAX(effective_dt) from sewadars_transfers select @var2 = appointment_dt from sewadars_registrations WHERE sewadar_grno = '{2}' AND satsang_centre_id = '{1}' SELECT @var1 = (CASE WHEN (@var1 > @var2) THEN @var1 ELSE @var2 END) SELECT (CASE WHEN @var1 > '{0}' THEN 'No' ELSE 'Yes' END)", this.dtEffectiveDate.DisplayText, ZSMUtility.GetSatsangCentreId(), this.txtGRNo.DisplayText)).Tables[0];
            if (dT.Rows.Count > 0)
            {
                if(!DbManager.GetBool(dT.Rows[0][0]))
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, "operation | transfers. As sewadar needs to be effective in one team on the date of transfer.", MessageTypes.Error); ;
                    return false;
                }
            }
            //]]
            //[[Only one transfer per day is allowed. 
            dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select 1 from sewadars_transfers WHERE sewadar_grno = '{2}' AND satsang_centre_id = '{1}' AND effective_dt = '{0}'", this.dtEffectiveDate.DisplayText, ZSMUtility.GetSatsangCentreId(), this.txtGRNo.DisplayText)).Tables[0];
            if (dT.Rows.Count > 0)
            {
                UIManager.ShowMessage(MsgCodes.InvalidValue, "operation | transfers. Only one transfer per day is allowed.", MessageTypes.Error);
                return false;
            }
            //]]
            return base.IsReadyToSave();
        }


        public override void CreateData()
        {
            string grNo = default(string);
            //TODO:: Execute using Objmanagaer as its a function
            this.dbFacade.TransferSewadarToSatsangCentre(this.zsmSatsangCentresLookup1.IdTextAsInteger,
                                this.sewadarHeader1.txtGRNo.DisplayText, this.zsmSatsangCentresLookup2.IdTextAsInteger, this.dtEffectiveDate.DisplayTextAsDateTime,
                                this.departmentChooserNew.SelectedDepartment, this.departmentChooserNew.SelectedSubDepartment,
                                this.chkOutstation.BlnString, this.txtRemarks.DisplayText, ref grNo);
            this.InfoMessageToShow = "The Generated GR. No. is : " + grNo;
            this.ObjectIdForLogOperation = ZSMUtility.GetSatsangCentreId().ToString() + "|" + this.sewadarHeader1.txtGRNo.DisplayText;
        }

        private void zsmSatsangCentresLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (DbManager.IsNotNull(this.zsmSatsangCentresLookup2.IdTextAsInteger))
            {
                this.departmentChooserNew.SatsangCentreId = this.zsmSatsangCentresLookup2.IdTextAsInteger;
                this.sponZsmSatsangCentresLookup.IdText = this.zsmSatsangCentresLookup2.IdText;
                ZSMUtility.setDisplayValueText(this.sponZsmSatsangCentresLookup, this.zsmSatsangCentresLookup2.DisplayText);
            }
        }

        private void zsmSatsangCentresLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (DbManager.IsNotNull(this.zsmSatsangCentresLookup1.IdTextAsInteger))
            {
                this.sewadarHeader1.SatsangCentreId = this.zsmSatsangCentresLookup1.IdTextAsInteger;
            }
        }

        private void chkOutstation_CheckStateChanged(object sender, EventArgs e)
        {
            //Sponsorer is required for Local Sewadars, and Area Secretary and Secretary are required for Outstation Sewadars. 
            this.sponSewadarLookup1.Mandatory = false;
            this.areaSecCentreFunctionariesLookup1.Mandatory = false;
            this.secCentreFunctionariesLookup1.Mandatory = false;
            if (this.chkOutstation.Checked)
            {
                this.areaSecCentreFunctionariesLookup1.Mandatory = true;
                this.secCentreFunctionariesLookup1.Mandatory = true;
            }
            else
            {
                this.sponSewadarLookup1.Mandatory = true;
            }

        }

        private void secCentreFunctionariesLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "f.satsang_centre_id = " + this.secZsmSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void areaSecCentreFunctionariesLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "f.satsang_centre_id = " + this.areaSecZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }


        private void sponGrNoLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.sponZsmSatsangCentresLookup.IdTextAsInteger);
        }

        private void sponSewadarLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.sponZsmSatsangCentresLookup.IdTextAsInteger);
        }

        private void sponSewadarIDLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.sponZsmSatsangCentresLookup.IdTextAsInteger);
        }

        private void sponSewadarIDLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.sponSewadarIDLookup1.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.sponSewadarLookup1, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.sponSewadarLookup1.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.sponSewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private void sponSewadarLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.sponSewadarLookup1.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.sponGrNoLookup1, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]));
                    this.sponGrNoLookup1.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.sponSewadarIDLookup1, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_id"]));
                    this.sponSewadarIDLookup1.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT sewadar_status_nm, responsibility, sewa_years=DATEDIFF(YEAR, appointment_dt, GETDATE()) FROM ViewSewadarHeader WHERE sewadar_id = " + this.sponSewadarLookup1.IdText).Tables[0];
                    this.sponResponsibilityCombo1.SelectedValue = dT.Rows[0]["responsibility"];
                    this.txtStatus.DisplayText = dT.Rows[0]["sewadar_status_nm"].ToString();
                    this.intYearsInSewa.DisplayText = dT.Rows[0]["sewa_years"].ToString();
                }
            }
        }

        private void sponGrNoLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.sponGrNoLookup1.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.sponSewadarLookup1, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.sponSewadarLookup1.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.sponSewadarLookup1_LookupResultSet(null, e);
                }
            }
        }


    }
}
