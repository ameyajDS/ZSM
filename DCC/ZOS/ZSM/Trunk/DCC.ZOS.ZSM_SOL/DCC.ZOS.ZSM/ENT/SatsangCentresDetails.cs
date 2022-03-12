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

namespace DCC.ZOS.ZSM.ENT
{
    partial class SatsangCentresDetails : ZSMAbstractScreen
    {
        private CDB_APPDbFacade dbCDBFacade = new CDB_APPDbFacade("CDB_APP");
        private Dictionary<String, String> SelCentreTypeRestrictionType = new Dictionary<String, String>();

        public SatsangCentresDetails()
        {
            InitializeComponent();
            DataTable dt = null;
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            dt = objDbManager.ExecuteSQL("SELECT satsang_centre_type FROM CDB..satsang_centre_types").Tables[0];

            this.cmbSatsangCentreType.SetDataSource(dt, "satsang_centre_type", "satsang_centre_type", true);
            SelCentreTypeRestrictionType.Add("Area", "MAIN CENTRE");
            SelCentreTypeRestrictionType.Add("Centre", "Area");
            SelCentreTypeRestrictionType.Add("Sub Centre", "Centre");
            SelCentreTypeRestrictionType.Add("Point", "Centre");

        }

        public override string ScreenId
        {
            get
            {
                return Screens.ENT_SATSANG_CENTERS_DETAILS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            satsang_centre_id,
            post_office_or_city_id,
            post_office_or_city_nm,
            reporting_centre_cd,
            pin_or_zip_code,
            remarks,
            address_line_1,
            address_line_2,
            district_nm,
            district_or_city_id,
            StateName,
            StateId,
            CoutryName,
            CoutryId,
            telephones,
            email_addresses,
            fax_lines,
            effective_from,
            effective_till,
            satsang_centre_cd,
            satsang_centre_nm,
            satsang_centre_type,
            is_main_centre,
            centre_cd,
            reports_to_centre_id,
            reporting_centre_nm,
            txn_ts
        }

        private enum GrdListSecretary
        {
            S_FunctionaryName,
            centre_functionary_id_Secretary,
            S_IsCurrent,
            S_Telephone,
            S_Emails,
            S_EffectiveFrom,
            S_EffectiveTill
        }
        private enum GrdListAreaSecretary
        {
            AS_FunctionaryName,
            AS_IsCurrent,
            AS_Telephone,
            AS_Emails,
            AS_EffectiveFrom,
            centre_functionary_id,
            AS_EffectiveTill
        }
        #endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.dccSignature.SetImage(null);
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            this.txtCode.Focus();
            this.txtId.ReadOnly = false;
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
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

        public override void LoadBrowseView(int rowIndex)
        {
            this.txtId.ReadOnly = true;
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1, this.grdAreaSecretaries, this.grdSecretaries);
            DataTable dT = this.dbFacade.QuerySatsangCentreFunctionarie(this.txtId.DisplayTextAsInteger, "Area Secretary").Tables[0];
            this.grdAreaSecretaries.RetrieveRecords(dT, false, RowStates.Old);

            dT = this.dbFacade.QuerySatsangCentreFunctionarie(this.txtId.DisplayTextAsInteger, "Secretary").Tables[0];
            this.grdSecretaries.RetrieveRecords(dT, false, RowStates.Old);

            //Load Image
            DataTable dt = null;
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            dt = objDbManager.ExecuteSQL("Select Secretary_signature from satsang_centres_details where satsang_centre_id = " + this.txtId.DisplayTextAsInteger).Tables[0];

            byte[] array = dt.Rows[0]["Secretary_signature"] as byte[];

            dccSignature.SetImage(array);
            this.ObjectIdForLogOperation = this.txtId.DisplayText;
        }




        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSatsangCentresSQLSelectQuery query = new ViewSatsangCentresSQLSelectQuery();

            //This line avoids the if condition and specifies that country_id is a primary/indexed key.
            query.satsang_centre_id.IsExcluisive = true;
            query.satsang_centre_nm.Contains(this.txtSatsangCentreName.DisplayText);
            query.satsang_centre_type.Equal(this.cmbSatsangCentreType.SelectedValue);
            query.satsang_centre_id.Equal(this.txtId.DisplayText);
            query.address_line_1.Contains(this.addressBox.txtAddress1.DisplayText);
            query.CoutryId.Equal(this.addressBox.CountryLookup.IdText);
            query.StateId.Equal(this.addressBox.StateLookup.IdText);
            query.district_or_city_id.Equal(this.addressBox.DistrictorCitiesLookup.IdText);
            query.pin_or_zip_code.Contains(this.addressBox.txtPin.DisplayText);
            query.is_main_centre.Equal(this.cbxMainCentre.BlnString);
            query.centre_alphabet.Equal(this.txtCentreAlphabet.DisplayText);
            query.centre_cd.Equal(this.txtCode3.DisplayText);
            query.centre_nm.Contains(this.txtCentre_nm.DisplayText);


            query.fax_lines.Contains(this.txtFaxLine.DisplayText);
            query.reports_to_centre_id.Equal(this.zsmSatsangCentresLookup1.IdText);
            query.telephones.Contains(this.txtTelephone.DisplayText);

            query.effective_from.LessThanEqualTo(this.dtmEffectiveRange.FromDate);
            query.effective_till.GreaterThanEqualTo(this.dtmEffectiveRange.FromDate);

            return dbFacade.ExecuteSelectQuery(query);
        }

        private List<string> SaveGridsAsTask(int? sId)
        {
            List<string> allTasks = new List<string>();
            try
            {

                if (this.grdAreaSecretaries.Rows.Count > 0)
                {
                    Hashtable overiddingParamValues = new Hashtable();
                    overiddingParamValues.Add("satsang_centre_id", sId);
                    overiddingParamValues.Add("centre_functionary", "Area Secretary");
                    allTasks = this.grdAreaSecretaries.GetAllDBTasks(this.dbFacade, "DeleteSatsangCentreFunctionarieAsTask", "UpdateSatsangCentreFunctionarieAsTask", "InsertSatsangCentreFunctionarieAsTask", overiddingParamValues);

                }
                if (this.grdSecretaries.Rows.Count > 0)
                {
                    Hashtable overiddingParamValues = new Hashtable();
                    overiddingParamValues.Add("satsang_centre_id", sId);
                    overiddingParamValues.Add("centre_functionary", "Secretary");
                    allTasks.AddRange(this.grdSecretaries.GetAllDBTasks(this.dbFacade, "DeleteSatsangCentreFunctionarieAsTask", "UpdateSatsangCentreFunctionarieAsTask", "InsertSatsangCentreFunctionarieAsTask", overiddingParamValues));

                }
                return allTasks;
            }
            catch
            {
                throw;
            }
        }

        public override void CreateData()
        {

            int generatedId = default(int);


            //Satsang centre details
            this.dbCDBFacade.InsertSatsangCentre(ref generatedId,
                                                 this.txtCode.DisplayText,
                                                 this.txtSatsangCentreName.DisplayText,
                                                 this.cmbSatsangCentreType.SelectedValueAsStr,
                                                 this.addressBox.AddressLine1,
                                                 this.addressBox.AddressLine2,
                                                 this.addressBox.DistrictorCitiesLookup.IdTextAsInteger,
                                                 this.addressBox.txtPin.DisplayText,
                                                 null,
                                                 this.txtTelephone.DisplayText,
                                                 this.txtEmail.DisplayText,
                                                 this.txtFaxLine.DisplayText,
                                                 this.dtmEffectiveRange.FromDate,
                                                 this.dtmEffectiveRange.ToDate);
            this.dbFacade.InsertSatsangCentresDetail(generatedId,
                                                    this.cbxMainCentre.BlnString,
                                                    this.txtCentre_nm.DisplayText,
                                                    this.txtCentreAlphabet.DisplayText,
                                                    this.txtCode3.DisplayText,
                                                    this.zsmSatsangCentresLookup1.IdTextAsInteger,
                                                    this.txtRemarks.DisplayText,
                                                    this.coloursLookup1.IdTextAsShort,
                                                    this.dccSignature.ImageInByteArray
                                                    );
            //Area Secretaries Details
            this.dbFacade.AddDbTasks(SaveGridsAsTask(this.txtId.DisplayTextAsInteger));
            this.dbFacade.ExecuteDbTasks();
            this.ObjectIdForLogOperation = generatedId.ToString();
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            this.dbFacade.UpdateSatsangCentresDetail(this.txtId.DisplayTextAsInteger,
                                                    this.cbxMainCentre.BlnString,
                                                    this.txtCentre_nm.DisplayText,
                                                    this.txtCentreAlphabet.DisplayText,
                                                    this.txtCode3.DisplayText,
                                                    this.zsmSatsangCentresLookup1.IdTextAsInteger,
                                                    this.txtRemarks.DisplayText,
                                                    this.coloursLookup1.IdTextAsShort,
                                                    this.dccSignature.ImageInByteArray
                                                    );
            this.dbCDBFacade.UpdateSatsangCentre(this.txtId.DisplayTextAsInteger,
                this.txtCode.DisplayText,
                this.txtSatsangCentreName.DisplayText,
                this.cmbSatsangCentreType.SelectedValueAsStr,
                this.addressBox.txtAddress1.DisplayText,
                this.addressBox.txtAddress2.DisplayText,
                this.addressBox.DistrictorCitiesLookup.IdTextAsInteger,
                this.addressBox.txtPin.DisplayText,
                this.txtTelephone.DisplayText,
                this.txtEmail.DisplayText,
                this.txtFaxLine.DisplayText,
                txn_ts,
                this.dtmEffectiveRange.FromDate,
                this.dtmEffectiveRange.ToDate);

            //Area Secretaries Details
            this.dbFacade.AddDbTasks(SaveGridsAsTask(this.txtId.DisplayTextAsInteger));
            this.dbFacade.ExecuteDbTasks();
            this.dbCDBFacade.ExecuteDbTasks();
        }

        public override bool DeleteData()
        {
            //byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            //this.dbFacade.DeleteCountrie((short)this.intCountryID.DisplayTextAsInteger.Value,                                           
            //                                    txn_ts                                                
            //                                   );
            return true;
        }

        private void grdAreaSecretaries_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {

            this.grdAreaSecretaries.SetCellValue(GrdListAreaSecretary.AS_EffectiveFrom.ToString(),
                e.RowIndex, DateTime.Today.Date);
            this.grdAreaSecretaries.SetCellValue(GrdListAreaSecretary.AS_EffectiveTill.ToString(),
                e.RowIndex, DateTime.MaxValue.Date);
        }

        private void grdSecretaries_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {

            this.grdSecretaries.SetCellValue(GrdListSecretary.S_EffectiveFrom.ToString(),
                e.RowIndex, DateTime.Today.Date);
            this.grdSecretaries.SetCellValue(GrdListSecretary.S_EffectiveTill.ToString(),
                e.RowIndex, DateTime.MaxValue.Date);
        }

        private void addressBox_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            //if (addressBox.txtPin.DisplayText > 0)
            //{

            //}
        }

        private void cbxMainCentre_CheckedChanged(object sender, EventArgs e)
        {
            if (this.cbxMainCentre.Checked)
            {
                txtCentreAlphabet.Mandatory = true;
                txtCode3.Mandatory = true;
                txtCentre_nm.Mandatory = true;
                this.coloursLookup1.Mandatory = true;
            }

            else
            {
                txtCentreAlphabet.Mandatory = false;
                txtCode3.Mandatory = false;
                txtCentre_nm.Mandatory = false;
                this.coloursLookup1.Mandatory = false;
            }

        }

        private void zsmSatsangCentresLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            string satCentreType = ResolveRestrictedSatsangCentreType(cmbSatsangCentreType.SelectedValue as string);
            string sMainCentreCriteria = string.Empty;
            if (satCentreType.Equals("MAIN CENTRE"))
            {
                sMainCentreCriteria = " AND is_main_centre = 'Yes' ";
                satCentreType = "Centre";
            }

            e.LookupSqlString = e.LookupSqlString.Replace("2=2", " satsang_centre_type = '" + satCentreType + "'" + sMainCentreCriteria);    
        }

        private string ResolveRestrictedSatsangCentreType(string satsangCentreType)
        {
            String val = String.Empty;
            SelCentreTypeRestrictionType.TryGetValue(satsangCentreType, out val);
            return val;
        }

    }
}