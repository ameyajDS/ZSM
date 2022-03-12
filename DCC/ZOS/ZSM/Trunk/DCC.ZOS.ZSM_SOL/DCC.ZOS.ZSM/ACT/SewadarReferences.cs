using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.ZOS.ZSM.Controls.Utils;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class SewadarReferences : ZSMAbstractScreen
    {
        public SewadarReferences()
        {
            InitializeComponent();
            this.ref2GrNoLookup1.SttsCode = "SttsRefUse";
            this.ref1GrNoLookup1.SttsCode = "SttsRefUse";
            this.ref1ZsmSatsangCentresLookup.ShowNonMainCentres = true;
            this.ref2ZsmSatsangCentresLookup.ShowNonMainCentres = true;
        }

        public override bool IsReadyToSave()
        {
            /*CONSTRAINT	SewadarsRegistrations_CK_Reference1Information
             CHECK	(	(	reference_1_sewadar_id	IS NOT NULL	AND	reference_1_relationship	IS NOT NULL	AND	reference_1_nm	IS NULL		AND	reference_1_centre_id	IS NULL		AND	reference_1_department	IS NULL		)
                     OR	(	reference_1_sewadar_id	IS NULL		AND	reference_1_relationship	IS NOT NULL	AND	reference_1_nm	IS NOT NULL	AND	reference_1_centre_id	IS NOT NULL	AND	reference_1_department	IS NOT NULL	)
                     OR	(	reference_1_sewadar_id	IS NULL		AND	reference_1_relationship	IS NULL		AND	reference_1_nm	IS NULL		AND	reference_1_centre_id	IS NULL		AND	reference_1_department	IS NULL		)
                     ),*/
            if ((!string.IsNullOrEmpty(this.ref1GrNoLookup1.IdText) && !string.IsNullOrEmpty(this.relationsLookup1.IdText))
            || (string.IsNullOrEmpty(this.ref1GrNoLookup1.IdText) && !string.IsNullOrEmpty(this.relationsLookup1.IdText) && !string.IsNullOrEmpty(this.txtRefName.DisplayText) && !string.IsNullOrEmpty(this.ref1ZsmSatsangCentresLookup.IdText) && !string.IsNullOrEmpty(this.txtRef1Department.DisplayText))
            || (string.IsNullOrEmpty(this.ref1GrNoLookup1.IdText) && string.IsNullOrEmpty(this.relationsLookup1.IdText) && string.IsNullOrEmpty(this.txtRefName.DisplayText) && string.IsNullOrEmpty(this.ref1ZsmSatsangCentresLookup.IdText) && string.IsNullOrEmpty(this.txtRef1Department.DisplayText)))
            {
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Reference 1 Sewadar should be identified|his/her Name, Centre and Department", MessageTypes.Error);
                return false;
            }
            /*CONSTRAINT	SewadarsRegistrations_CK_Reference2Information
                CHECK	(	(	reference_2_sewadar_id	IS NOT NULL	AND	reference_2_relationship	IS NOT NULL	AND	reference_2_nm	IS NULL		AND	reference_2_centre_id	IS NULL		AND	reference_2_department	IS NULL		)
                        OR	(	reference_2_sewadar_id	IS NULL		AND	reference_2_relationship	IS NOT NULL	AND	reference_2_nm	IS NOT NULL	AND	reference_2_centre_id	IS NOT NULL	AND	reference_2_department	IS NOT NULL	)
                        OR	(	reference_2_sewadar_id	IS NULL		AND	reference_2_relationship	IS NULL		AND	reference_2_nm	IS NULL		AND	reference_2_centre_id	IS NULL		AND	reference_2_department	IS NULL		)
                        ),*/
            if ((!string.IsNullOrEmpty(this.ref2GrNoLookup1.IdText) && !string.IsNullOrEmpty(this.relationsLookup2.IdText))
                || (string.IsNullOrEmpty(this.ref2GrNoLookup1.IdText) && !string.IsNullOrEmpty(this.relationsLookup2.IdText) && !string.IsNullOrEmpty(this.txtRef2Name.DisplayText) && !string.IsNullOrEmpty(this.ref2ZsmSatsangCentresLookup.IdText) && !string.IsNullOrEmpty(this.txtRef2Department.DisplayText))
                || (string.IsNullOrEmpty(this.ref2GrNoLookup1.IdText) && string.IsNullOrEmpty(this.relationsLookup2.IdText) && string.IsNullOrEmpty(this.txtRef2Name.DisplayText) && string.IsNullOrEmpty(this.ref2ZsmSatsangCentresLookup.IdText) && string.IsNullOrEmpty(this.txtRef2Department.DisplayText)))
            {
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Reference 2 Sewadar should be identified|his/her Name, Centre and Department", MessageTypes.Error);
                return false;
            }
            return true;
        }
        

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }

        public override string ScreenId { get { return Screens.ACT_SEWADARS_REFERENCES; } }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);            
            if (uiMode == UIModes.Query || uiMode == UIModes.Update)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    string[] args = screenParameters.Split('|');
                    this.txtGRNo.DisplayText = args[0];                    
                    GlobalAppVariables.ObjMDIMain.FireRetrieveMode();
                }
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
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

        public override void ClearControls()
        {
            base.ClearControls();
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
        }

        public override void LoadBrowseView(int rowIndex)
        {            
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = ZSMUtility.GetSatsangCentreId().ToString() + "|" + this.txtGRNo.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarsRegistrationSQLSelectQuery query = new ViewSewadarsRegistrationSQLSelectQuery();
            int result;
            if (System.Int32.TryParse(this.intSewadarId.DisplayText, out result))
                query.sewadar_id.Equal(this.intSewadarId.DisplayText);
            query.full_nm.Contains(this.txtName.DisplayText);
            query.gender.Equal(this.zsmGenderCombo1.SelectedValue);
            query.sewadar_type.Equal("R");
            query.sewadar_grno.Equal(this.txtGRNo.DisplayText);
            query.AddOrderByClause(query.sewadar_id, OrderByTypes.ASC);
            query.AddOrderByClause(query.sewadar_grno, OrderByTypes.ASC);
            return dbFacade.ExecuteSelectQuery(query);
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdateSewadarReferences(ZSMUtility.GetSatsangCentreId(),
                                            this.txtGRNo.DisplayText,this.ref1GrNoLookup1.IdTextAsInteger,
                                            this.relationsLookup1.IdTextAsShort,
                                            DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.txtRefName.DisplayText,
                                            DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.ref1ZsmSatsangCentresLookup.IdTextAsInteger,
                                            DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.txtRef1Department.DisplayText,
                                            this.ref2GrNoLookup1.IdTextAsInteger,
                                            this.relationsLookup2.IdTextAsShort,
                                            DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.txtRef2Name.DisplayText,
                                            DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.ref2ZsmSatsangCentresLookup.IdTextAsInteger,
                                            DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.txtRef2Department.DisplayText, txn_ts);
        }

        #region PrivateMethods
        private void MakeEditableOnlyInQueryMode(bool isQueryMode)
        {            
            this.txtGRNo.ReadOnly = !isQueryMode;
        }

        private void ref1GrNoLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (this.ref1ZsmSatsangCentresLookup.IdTextAsInteger.HasValue)
                e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ref1ZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ref2GrNoLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (this.ref1ZsmSatsangCentresLookup.IdTextAsInteger.HasValue)
                e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ref2ZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ref1GrNoLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.txtRef1Department.DisplayText = e.LookupResult.SelectedRecords[0]["full_department_nm"].ToString();
            this.txtRefName.DisplayText = e.LookupResult.SelectedRecords[0]["full_nm"].ToString();
            if (this.ref1ZsmSatsangCentresLookup.LookupResult == null)
                this.ref1ZsmSatsangCentresLookup.SetControlValues(
                    e.LookupResult.SelectedRecords[0]["centre_nm"].ToString(),
                    e.LookupResult.SelectedRecords[0]["centre_nm"].ToString(),
                    e.LookupResult.SelectedRecords[0]["satsang_centre_id"].ToString());
        }

        private void ref2GrNoLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.txtRef2Department.DisplayText = e.LookupResult.SelectedRecords[0]["full_department_nm"].ToString();
            this.txtRef2Name.DisplayText = e.LookupResult.SelectedRecords[0]["full_nm"].ToString();
            if (this.ref2ZsmSatsangCentresLookup.LookupResult == null)
                this.ref2ZsmSatsangCentresLookup.SetControlValues(
                    e.LookupResult.SelectedRecords[0]["centre_nm"].ToString(),
                    e.LookupResult.SelectedRecords[0]["centre_nm"].ToString(),
                    e.LookupResult.SelectedRecords[0]["satsang_centre_id"].ToString());
        }

        private void intSewadarId_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.intSewadarId.DisplayText))
                {
                    this.txtName.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]);
                    this.txtName.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                }
            }
        }
        #endregion

        private void tableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void SewadarReferences_Load(object sender, EventArgs e)
        {

        }

    }
}
