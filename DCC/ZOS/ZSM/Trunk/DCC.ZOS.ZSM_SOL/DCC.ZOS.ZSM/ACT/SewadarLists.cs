using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DCC.UMB.CDF;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.View.Menu;
using System.Configuration;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls;
using System.IO;
using DCC.DBFacade;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Drawing2D;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.DB;
using System.Reflection;
using System.Collections;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.Log;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.SSM.ZMS.Controls.Misc;
using System.Data.SqlClient;
using DCC.ZOS.ZSM.MSC;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class SewadarLists : ZSMAbstractScreen
    {
        AttributeRecorder recorder = null;
        private bool actionGotExecuted;
        private ZSMStoredProcParamCreator _spParamCreator;

        private enum GridColumns
        {
            sewadar_grno,
            full_nm,
            sewadar_id
        }

        public SewadarLists()
        {
            InitializeComponent();
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
            _spParamCreator = ZSMStoredProcParamCreator.GetInstance(dbFacade);
            this.cmbListUse.SetDataSource(ZSMUtility.GetSewadarListUse(this.dbFacade), "sewadar_list_use", "sewadar_list_use");
        }

        private void RemoveAllRecorders()
        {
            List<Control> lstControlsToRemove = new List<Control>();
            foreach (Control control in tlpRecorders.Controls)
            {
                if (control.GetType() == typeof(AttributeRecorder))
                {
                    lstControlsToRemove.Add(control);
                }
            }
            foreach (Control c in lstControlsToRemove)
            {
                this.tlpRecorders.Controls.Remove(c);
            }
            tlpRecorders.RowCount = 0;
            foreach (RowStyle s in this.tlpRecorders.RowStyles)
            {
                s.Height = 23;
                s.SizeType = SizeType.Absolute;
            }
        }

        private void CreateAndLoadRecorderControls(bool readOnlyRecorder)
        {
            this.tlpRecorders.Visible = false;
            this.tlpRecordersBase.Visible = false;
            try
            {
                //[[First remove all the recorders from the tlpRecorders panel
                RemoveAllRecorders();
                //]]
                recorder = AttributeRecorder.CreateRecorder(this.attributesLookup2.IdTextAsShort.Value, ZSMUtility.GetSatsangCentreId().Value,
                           string.Empty, null);
                this.tlpRecorders.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 23F));
                this.tlpRecorders.Controls.Add(recorder, 0, this.tlpRecorders.RowCount - 1);
                recorder.Dock = System.Windows.Forms.DockStyle.Fill;
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                this.tlpRecorders.Visible = true;
                this.tlpRecordersBase.Visible = true;
            }
        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.intCount.ClearControlValues();
            this.zsmSatsangCentresLookup1.IdText = ZSMUtility.GetSatsangCentreId().ToString();
            ZSMUtility.setDisplayValueText(this.zsmSatsangCentresLookup1, ZSMUtility.GetSatsangCentreName());
            this.zsmSatsangCentresLookup2.IdText = ZSMUtility.GetSatsangCentreId().ToString();
            ZSMUtility.setDisplayValueText(this.zsmSatsangCentresLookup2, ZSMUtility.GetSatsangCentreName());
        }

        protected override bool IsAValidScreenAction(string actionId)
        {
            bool retVal = true;
            if (this.cmbListUse.SelectedValue == null)
            {
                retVal = false;
            }
            return retVal&&base.IsAValidScreenAction(actionId);
        }

        public override bool DoesActionCauseReloadOfCurrentRecordInBrowseMode(string p)
        {
            return false;
        }

        public override void ExecuteScreenAction(string actionId)
        {
            actionGotExecuted = true;
            base.ExecuteScreenAction(actionId);
            if (!this.ValidateAllControlsofContainer(tlpBase))
            {
                actionGotExecuted = false;
                return;
            }
            if (this.sewadarListLookup1.IdTextAsInteger == this.intID.DisplayTextAsInteger)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Action | Lists on which action is to performed are same.", MessageTypes.Warning);
                actionGotExecuted = false;
                return;
            }

            DialogResult result = MessageBox.Show(this, "Do you want to proceed with action : " + actionId + ".",
                      "Information",
                      MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation,
                      MessageBoxDefaultButton.Button1);
            if (result == DialogResult.No)
            {
                actionGotExecuted = false;
                return;
            }
            string msg = default(string);
            try
            {
                int sewaTeamId = 0;
                this.dbFacade.BeginTrans();
                switch (actionId)
                {
                    case "Union":
                        if (!string.IsNullOrEmpty(this.sewadarListLookup1.IdText))
                        {
                            List<SqlParameter> param = UnionGenericSewadarListsSewadar_Params(this.intID.DisplayTextAsInteger, this.sewadarListLookup1.IdTextAsInteger, !chkPreserveSecondList.Checked);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("UnionGenericSewadarListsSewadar", param, 600);
                            msg = "Union done.";
                            if (!chkPreserveSecondList.Checked)
                            {
                                msg += " Deleted list :  " + this.sewadarListLookup1.DisplayText;
                            }
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;
                    case "Intersect":
                        if (!string.IsNullOrEmpty(this.sewadarListLookup1.IdText))
                        {
                            List<SqlParameter> param = IntersectGenericSewadarListsSewadar_Params(this.intID.DisplayTextAsInteger, this.sewadarListLookup1.IdTextAsInteger, !chkPreserveSecondList.Checked);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("IntersectGenericSewadarListsSewadar", param, 600);
                            msg = "Intersection done.";
                            if (!chkPreserveSecondList.Checked)
                            {
                                msg += " Deleted list :  " + this.sewadarListLookup1.DisplayText;
                            }
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;
                    case "Minus":
                        if (!string.IsNullOrEmpty(this.sewadarListLookup1.IdText))
                        {
                            List<SqlParameter> param = MinusGenericSewadarListsSewadar_Params(this.intID.DisplayTextAsInteger, this.sewadarListLookup1.IdTextAsInteger, !chkPreserveSecondList.Checked);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("MinusGenericSewadarListsSewadar", param, 600);
                            msg = "Minus done.";
                            if (!chkPreserveSecondList.Checked)
                            {
                                msg += " Deleted list :  " + this.sewadarListLookup1.DisplayText;
                            }
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;
                    case "Make Sewa Team":
                        if (!string.IsNullOrEmpty(this.sewaLookup1.IdText))
                        {
                            List<SqlParameter> param = MakeSewaTeamUsingSewadarList_Params(this.intID.DisplayTextAsInteger, this.sewaLookup1.IdTextAsInteger, ref sewaTeamId);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("MakeSewaTeamUsingSewadarList", param, 600);
                            msg = "Created Sewa Team with ID:  " + sewaTeamId;
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;

                    case "Make Sewa Teams":
                        if (!string.IsNullOrEmpty(this.sewaLookup1.IdText))
                        {
                            List<SqlParameter> param = MakeSewaTeams_Params(ZSMUtility.GetSatsangCentreId(), this.sewaLookup1.IdTextAsInteger, this.intID.DisplayTextAsInteger);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("MakeSewaTeams", param, 600);
                            msg = "Created Sewa Teams";
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;

                    case "Make Area-wise Sewa Teams":
                        if (!string.IsNullOrEmpty(this.sewaLookup1.IdText))
                        {
                            List<SqlParameter> param = MakeAreaWiseSewaTeams_Params(ZSMUtility.GetSatsangCentreId(), this.sewaLookup1.IdTextAsInteger, this.intID.DisplayTextAsInteger);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("MakeAreaWiseSewaTeams", param, 600);
                            msg = "Created Area-wise Sewa Teams";
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;

                    case "Make Combined Sewa Teams":
                        if (!string.IsNullOrEmpty(this.sewaLookup1.IdText))
                        {
                            List<SqlParameter> param = MakeSewaTeams_Params(ZSMUtility.GetSatsangCentreId(), this.sewaLookup1.IdTextAsInteger, this.intID.DisplayTextAsInteger);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("MakeCombinedSewaTeams", param, 600);
                            msg = "Created Sewa Teams";
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;

                    case "Grant Exemption":
                        if (!string.IsNullOrEmpty(this.sewaLookup2.IdText) && !string.IsNullOrEmpty(this.sewaExemptionsLookup1.IdText))
                        {
                            List<SqlParameter> param = GrantExemptionForSewa_Params(this.intID.DisplayTextAsInteger, this.sewaLookup2.IdTextAsInteger,
                                this.sewaExemptionsLookup1.IdTextAsShort);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("GrantExemptionForSewa", param, 600);
                            msg = "Granted Exemption for Sewa Team.";
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;
                    case "Assign Attribute":
                        if (!string.IsNullOrEmpty(this.attributesLookup2.IdText) && DbManager.IsNotNull(recorder))
                        {                            
                            AssigneAttribute();
                            if (actionGotExecuted)
                            {
                                msg = "Assign Attribute done. Deleting list :  " + this.txtListName.DisplayText;
                            }
                        }
                        else
                        {
                            actionGotExecuted = false;
                        }
                        break;
                    case "Remove Attribute":
                        {
                            if (!string.IsNullOrEmpty(this.attributesLookup1.IdText))
                            {
                                msg = "Remove Attribute done. Deleting list :  " + this.txtListName.DisplayText;
                                List<SqlParameter> param = RemoveAttributeUsingSewadarList_Params(this.intID.DisplayTextAsInteger, this.attributesLookup1.IdTextAsShort);
                                this.dbFacade.ObjDBManager.ExecuteStoredProc("RemoveAttributeUsingSewadarList", param, 600);
                            }
                            else
                            {
                                actionGotExecuted = false;
                            }
                        }
                        break;
                    case "Split":
                        {
                            if (!string.IsNullOrEmpty(this.intNoOfLists.DisplayText))
                            {
                                msg = "Spliting done. The new lists are  :  " +  this.txtListName.DisplayText + "(0:"+ this.intNoOfLists.DisplayText + ")";
                                List<SqlParameter> param = SplitSewadarList_Params(this.intID.DisplayTextAsInteger, this.intNoOfLists.DisplayTextAsInteger);
                                this.dbFacade.ObjDBManager.ExecuteStoredProc("SplitSewadarList", param, 600);
                            }
                            else
                            {
                                actionGotExecuted = false;
                            }
                        }
                        break;
                }


                if (actionGotExecuted)
                {
                    ZSMUtility.LogAction(this, this.dbFacade,
                        actionId + "|SL" + this.intID.DisplayTextAsInteger + "|SL" + this.sewadarListLookup1.IdTextAsInteger + "|Ex" + this.sewaExemptionsLookup1.IdTextAsShort + "|At" + this.attributesLookup2.IdText + "|At" + this.attributesLookup1.IdText, null,
                        sewaTeamId == 0 ? null : (int?)sewaTeamId, null, null, null);
                    this.dbFacade.CommitTrans();
                    UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                }
                else
                {
                    this.dbFacade.RollbackTrans();
                }
            }
            catch (Exception)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
            if (actionGotExecuted)
            {
                MessageBox.Show(this, msg,
                              "Information",
                              MessageBoxButtons.OK, MessageBoxIcon.Information,
                              MessageBoxDefaultButton.Button1);
                GlobalAppVariables.ObjMDIMain.FireQueryMode();
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Action|fields needed for action are not specified", MessageTypes.Warning);
            }

        }

        private void AssigneAttribute()
        {
            string booleanValue = null;
            DateTime? dateValue = null;
            int? intValue = null;
            decimal? decimalValue = null;
            string listValue = null;
            string stringValue = null;

            switch (this.recorder.GetAttributeType())
            {
                case "Boolean":
                    if (string.IsNullOrEmpty(this.recorder.GetBooleanValueCheckBox().BlnString))
                    {
                        this.actionGotExecuted = false;
                        return;
                    }
                    if (!this.recorder.GetBooleanValueCheckBox().Checked)
                    {
                        this.actionGotExecuted = false;
                        return;
                    }
                    booleanValue = this.recorder.GetBooleanValueCheckBox().BlnString;
                    break;
                case "Date":
                case "Timestamp":
                    if (this.recorder.GetDateTimeValue() == null)
                    {
                        this.actionGotExecuted = false;
                        return;
                    }
                    dateValue = this.recorder.GetDateTimeValue();
                    break;
                case "String":
                    if (string.IsNullOrEmpty(this.recorder.GetStringValue()))
                    {
                        this.actionGotExecuted = false;
                        return;
                    }
                    stringValue = this.recorder.GetStringValue();
                    break;
                case "Integer":
                    if (this.recorder.GetIntegerValue() == null)
                    {
                        this.actionGotExecuted = false;
                        return;
                    }
                    intValue = this.recorder.GetIntegerValue();
                    break;
                case "Number":
                    if (this.recorder.GetDecimalValue() == null)
                    {
                        this.actionGotExecuted = false;
                        return;
                    }
                    decimalValue = this.recorder.GetDecimalValue();
                    break;
                case "List":
                    if (string.IsNullOrEmpty(this.recorder.GetListValue()))
                    {
                        this.actionGotExecuted = false;
                        return;
                    }
                    listValue = this.recorder.GetListValue();
                    break;
                default:
                    throw new Exception("Invalid attribute type..How did you come here");
            }
            if (!this.recorder.IsReadyToSave())
            {
                this.actionGotExecuted = false;
                return;
            }

            List<SqlParameter> param = AssignAttributeUsingSewadarList_Params(this.intID.DisplayTextAsInteger, this.attributesLookup2.IdTextAsShort,
                booleanValue, dateValue, intValue, decimalValue, listValue, stringValue,
                this.recorder.GetRemarks(), this.recorder.GetEffectiveFrom(), this.recorder.GetEffectiveTill());

            this.dbFacade.ObjDBManager.ExecuteStoredProc("AssignAttributeUsingSewadarList", param, 600);
            return;
        }


        public override string ScreenId { get { return Screens.ACT_SEWADARS_LISTS; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        private void makeEditableOnlyInQueryMode(bool isQuery)
        {
            //this.zsmSatsangCentresLookup1.ReadOnly = !isQuery;
        }

        private void HideInInsertMode(bool hide)
        {
            this.sewadarListLookup1.Visible = !hide;
            this.lblAction.Visible = !hide;
            this.dccLabel1.Visible = !hide;
            this.zsmSatsangCentresLookup2.Visible = !hide;
            this.dccLabel2.Visible = !hide;
            this.dccLabel3.Visible = !hide;
            this.dccLabel4.Visible = !hide;
            this.dccLabel5.Visible = !hide;
            this.sewaLookup1.Visible = !hide;
            this.sewaLookup2.Visible = !hide;
            this.attributesLookup2.Visible = !hide;
            this.attributesLookup1.Visible = !hide;
            this.tlpRecorders.Visible = !hide;
            this.tlpRecordersBase.Visible = !hide;
            this.sewaExemptionsLookup1.Visible = !hide;
            this.chkPreserveSecondList.Visible = !hide;
            if (hide)
            {
                RemoveAllRecorders();
                recorder = null;
            }
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                HideInInsertMode(uiMode == UIModes.Insert);
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                HideInInsertMode(true);
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                HideInInsertMode(uiMode == UIModes.Insert);
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
            HideInInsertMode(false);
            if (recorder == null) this.tlpRecordersBase.Visible = false;
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            if (chkotherSatsangCentreSewadars.Checked == true)
            {
                this.chkIsOtherSatsangCentre.Enabled = true;
            }
            else
            {
                this.chkIsOtherSatsangCentre.Enabled = false;
            }
            this.ObjectIdForLogOperation = this.intID.DisplayText;
        }


        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteGenericSewadarList(this.intID.DisplayTextAsInteger, ZSMUtility.GetSatsangCentreId(), txn_ts);
            return true;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewGenericSewadarListSQLSelectQuery query = new ViewGenericSewadarListSQLSelectQuery();

            query.centre_nm.StartsWith(this.zsmSatsangCentresLookup1.DisplayText);
            query.generated_dtm.Between(this.dtGenerated);
            query.report_nm.Contains(this.txtReportName.DisplayText);
            query.sewadar_list_nm.Contains(this.txtListName.DisplayText);
            query.sewadar_list_id.Equal(this.intID.DisplayText);
            query.sewadar_list_use.Equal(this.cmbListUse.SelectedValue);
            query.sewadar_list_other_use.Contains(this.txtOtherUse.DisplayText);
            query.is_editing_allowed.Equal(this.chkIsEditingAllowed.BlnString);
            query.is_other_satsang_centre.Equal(this.chkIsOtherSatsangCentre.BlnString);
            query.other_satsang_centre_sewadars.Equal(this.chkotherSatsangCentreSewadars.BlnString);

            return dbFacade.ExecuteSelectQuery(query);
        }

        public override void CreateData()
        {
            int generatedId = 0;
            this.dbFacade.InsertGenericSewadarList(ref generatedId, this.zsmSatsangCentresLookup1.IdTextAsInteger, this.txtListName.DisplayText, 
                    this.cmbListUse.SelectedValueAsStr, this.txtOtherUse.DisplayText, this.chkotherSatsangCentreSewadars.BlnString,
                    this.chkIsOtherSatsangCentre.BlnString, this.chkIsEditingAllowed.BlnString, this.txtRemarks.DisplayText,
                    this.dtGenerated.DisplayTextAsDateTime, this.txtReportName.DisplayText, this.chkIsForExport.BlnString, 
                    this.programSatsangCentreLkp.IdTextAsInteger, this.intSessionId.DisplayTextAsInteger);
            this.ObjectIdForLogOperation = generatedId.ToString() ;
            if (this.cmbListUse.SelectedValueAsStr=="Sewa Team")
                this.OnSaveMessge = "Information successfully saved with sewa time Id: " + this.ObjectIdForLogOperation;
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.AddDbTask(this.dbFacade.UpdateGenericSewadarListAsTask(this.intID.DisplayTextAsInteger, 
                    this.zsmSatsangCentresLookup1.IdTextAsInteger, this.txtListName.DisplayText, 
                    this.cmbListUse.SelectedValueAsStr, this.txtOtherUse.DisplayText, this.chkotherSatsangCentreSewadars.BlnString,
                    this.chkIsOtherSatsangCentre.BlnString, this.chkIsEditingAllowed.BlnString, this.txtRemarks.DisplayText,
                    this.dtGenerated.DisplayTextAsDateTime, this.txtReportName.DisplayText,
                    this.chkIsForExport.BlnString, this.programSatsangCentreLkp.IdTextAsInteger, this.intSessionId.DisplayTextAsInteger, txn_ts));
            this.dbFacade.ExecuteDbTasks();
        }

        private void cmbListUse_SelectedValueChanged(object sender, EventArgs e)
        {
            this.txtOtherUse.Mandatory = false;
            if (DbManager.IsNotNull(this.cmbListUse.SelectedValue))
            {
                if (string.Compare(this.cmbListUse.SelectedValueAsStr, "Miscellaneous", true) == 0)
                {
                    this.txtOtherUse.Mandatory = true;
                }
            }
        }

        private void sewadarListLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", string.Format("(satsang_centre_id = '{0}')", this.zsmSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0)));
        }

        private void sewaLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", string.Format("(s.satsang_centre_id = '{0}')", this.zsmSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0)));
        }

        private void sewaLookup2_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", string.Format("(s.satsang_centre_id = '{0}')", this.zsmSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0)));
        }

        private void btnCount_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.intID.DisplayText))
            {
                DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT COUNT(*) FROM generic_sewadar_lists_sewadars WHERE sewadar_list_id = " + this.intID.DisplayText).Tables[0];
                this.intCount.DisplayText = dT.Rows[0][0].ToString();
            }
        }

        private void attributesLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (DbManager.IsNotNull(this.attributesLookup2.IdTextAsShort))
            {
                this.CreateAndLoadRecorderControls(false);
            }
        }

        private void chkotherSatsangCentreSewadars_CheckedChanged(object sender, EventArgs e)
        {
            if (chkotherSatsangCentreSewadars.Checked == true)
            {
                this.chkIsOtherSatsangCentre.Enabled = true;
            }
            else
            {
                this.chkIsOtherSatsangCentre.Checked = false;
                this.chkIsOtherSatsangCentre.Enabled = false;
            }
        }

        #region ActionParamCreation
        private List<SqlParameter> UnionGenericSewadarListsSewadar_Params(Int32? sewadar_list_id,
                                                                                Int32? other_sewadar_list_id,
                                                                                Boolean? is_delete_list)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("sewadar_list_id", sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("other_sewadar_list_id", other_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("is_delete_list", is_delete_list, ZSMStoredProcParamCreator.BIT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> IntersectGenericSewadarListsSewadar_Params(Int32? sewadar_list_id,
                                                                                    Int32? other_sewadar_list_id,
                                                                                Boolean? is_delete_list)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("sewadar_list_id", sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("other_sewadar_list_id", other_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("is_delete_list", is_delete_list, ZSMStoredProcParamCreator.BIT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> MinusGenericSewadarListsSewadar_Params(Int32? sewadar_list_id,
                                                                                Int32? other_sewadar_list_id,
                                                                                Boolean? is_delete_list)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("sewadar_list_id", sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("other_sewadar_list_id", other_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("is_delete_list", is_delete_list, ZSMStoredProcParamCreator.BIT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> MakeSewaTeamUsingSewadarList_Params(Int32? p_sewadar_list_id, Int32? p_sewa_id,
                                                                            ref Int32 p_sewa_team_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_team_id", p_sewa_team_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.OUT, p);
            return p;
        }

        private List<SqlParameter> MakeSewaTeams_Params(Int32? p_satsang_centre_id,
                                                            Int32? p_sewa_id,
                                                            Int32? p_sewadar_list_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_satsang_centre_id", p_satsang_centre_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> MakeAreaWiseSewaTeams_Params(Int32? p_satsang_centre_id,
                                                            Int32? p_sewa_id,
                                                            Int32? p_sewadar_list_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_satsang_centre_id", p_satsang_centre_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> GrantExemptionForSewa_Params(Int32? p_sewadar_list_id,
                                                                    Int32? p_sewa_id,
                                                                    Int16? p_sewa_exemption_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_id", p_sewa_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewa_exemption_id", p_sewa_exemption_id, ZSMStoredProcParamCreator.SMALLINT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> AssignAttributeUsingSewadarList_Params(Int32? p_sewadar_list_id,
                                                                                Int16? p_attribute_id,
                                                                                String p_boolean_value,
                                                                                DateTime? p_date_value,
                                                                                Int32? p_int_value,
                                                                                Decimal? p_number_value,
                                                                                String p_list_value,
                                                                                String p_string_value,
                                                                                String p_remarks,
                                                                                DateTime? p_effective_from,
                                                                                DateTime? p_effective_till)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_attribute_id", p_attribute_id, ZSMStoredProcParamCreator.SMALLINT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_boolean_value", p_boolean_value, ZSMStoredProcParamCreator.VARCHAR, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_date_value", p_date_value, ZSMStoredProcParamCreator.SMALLDATETIME, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_int_value", p_int_value, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_number_value", p_number_value, ZSMStoredProcParamCreator.DECIMAL, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_list_value", p_list_value, ZSMStoredProcParamCreator.VARCHAR, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_string_value", p_string_value, ZSMStoredProcParamCreator.VARCHAR, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_remarks", p_remarks, ZSMStoredProcParamCreator.VARCHAR, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_effective_from", p_effective_from, ZSMStoredProcParamCreator.DATETIME, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_effective_till", p_effective_till, ZSMStoredProcParamCreator.DATETIME, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> RemoveAttributeUsingSewadarList_Params(Int32? p_sewadar_list_id,
                                                                                Int16? p_attribute_id)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_attribute_id", p_attribute_id, ZSMStoredProcParamCreator.SMALLINT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }

        private List<SqlParameter> SplitSewadarList_Params(Int32? p_sewadar_list_id,
                                                                Int32? p_sewadars_cnt)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("p_sewadar_list_id", p_sewadar_list_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("p_sewadars_cnt", p_sewadars_cnt, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            return p;
        }
        #endregion

    }
}
