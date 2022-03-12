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

namespace DCC.ZOS.ZSM.ACT
{
    public partial class SewadarsInSewadarLists : ZSMAbstractScreen
    {
        private bool readonlyStatusAlreadyUpdated = false;
        private enum GridColumns
        {
            sewadar_grno,
            full_nm,
            sewadar_id
        }

        private enum GrdListSewadarsColNames
        {
            sewadar_status_nm,
            satsang_centre_id,
            sewadar_grno
        }
        public SewadarsInSewadarLists()
        {
            InitializeComponent();
            this.sewadarHeader1.txtSatsangCentre.Lookup = true;
            this.sewadarHeader1.txtSatsangCentre.ReadOnly = false;
            this.sewadarHeader1.txtSatsangCentre.Mandatory = true;
            this.sewadarHeader1.txtSatsangCentre.IdTextBindingKey = "satsang_centre_id";
            this.sewadarHeader1.txtGRNo.Mandatory = false;
            this.sewadarHeader1.txtName.Mandatory = false;
            this.sewadarHeader1.intSewadarId.Mandatory = false;
            this.sewadarHeader1.SttsCode = "SttsCode";
            this.grdListSewadars.InsertRowsMenuItemsEnabled = false;
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
        }

        public override void ClearControls()
        {

            if (this.CurrentUIMode == UIModes.Insert || this.CurrentUIMode == UIModes.New)
            {
                this.ClearAllControlsOfContainer(this.tlpSewadar, true, this.sewadarHeader1.txtSatsangCentre);
                this.ClearAllControlsOfContainer(this.tlpListSewadarGrid, false, lblPrevGrNo);
                //[[Clear the sewadar list controls if no List is selected
                if (string.IsNullOrEmpty(this.txtListName.DisplayText) || (this.txtListName.IdTextAsInteger == null))
                {
                    ClearSewadarListControls();
                }
                //]]
                else
                {
                    //[[Clear the List in Insert mode if editing is not allowed for selected list
                    if (!this.chkIsEditingAllowed.Checked)
                    {
                        ClearSewadarListControls();
                    }
                    //]]
                    else
                    {
                        UpdateReadOnlyBasedOnCheckBoxes();
                    }
                }
                if (this.sewadarHeader1.txtSatsangCentre.ReadOnly == true)
                {
                    this.sewadarHeader1.txtSatsangCentre.ClearControlValues();
                    this.sewadarHeader1.txtSatsangCentre.IdText = ZSMUtility.GetSatsangCentreId().ToString();
                    ZSMUtility.setDisplayValueText(this.sewadarHeader1.txtSatsangCentre, ZSMUtility.GetSatsangCentreName());
                }
            }
            else
            {
                base.ClearControls();
                lblPrevGrNo.Text = "";
            }
            if (CurrentUIMode == UIModes.Query)
            {
                this.lkpListSatsangCentre.IdText = ZSMUtility.GetSatsangCentreId().ToString();
                ZSMUtility.setDisplayValueText(this.lkpListSatsangCentre, ZSMUtility.GetSatsangCentreName());
            }
        }

        private void ClearSewadarListControls()
        {
            this.ClearAllControlsOfContainer(this.tlpTop, false);
            this.lkpListSatsangCentre.IdText = ZSMUtility.GetSatsangCentreId().ToString();
            ZSMUtility.setDisplayValueText(this.lkpListSatsangCentre, ZSMUtility.GetSatsangCentreName());
        }

        public override string ScreenId { get { return Screens.ACT_SEWADARS_IN_SEWADAR_LIST; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        private void makeEditableOnlyInQueryMode(bool isQuery)
        {
            this.sewadarHeader1.makeReadOnlyFieldQueriable(isQuery);            
        }

        private void makeReadOnlyInBrowseMode(bool isBrowse)
        {
            this.lkpListSatsangCentre.ReadOnly = isBrowse;
            this.txtListName.ReadOnly = isBrowse;
            //[[ReadOnly status of these fields might have already got updated using UpdateReadOnlyBasedOnCheckBoxes()
            if (!readonlyStatusAlreadyUpdated)
            {
                this.sewadarHeader1.txtSatsangCentre.ReadOnly = isBrowse;
                this.sewadarHeader1.txtGRNo.ReadOnly = isBrowse;
                this.sewadarHeader1.txtName.ReadOnly = isBrowse;
                this.sewadarHeader1.intSewadarId.ReadOnly = isBrowse;
            }
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            readonlyStatusAlreadyUpdated = false;
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(false);
                makeReadOnlyInBrowseMode(false);
                this.sewadarHeader1.txtSewadarStatus.Font = this.sewadarHeader1.txtSubDepartment.Font;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(true);
                makeReadOnlyInBrowseMode(false);
                this.sewadarHeader1.txtSewadarStatus.Font = this.sewadarHeader1.txtSubDepartment.Font;
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
            makeEditableOnlyInQueryMode(false);
            makeReadOnlyInBrowseMode(true);            
            this.sewadarHeader1.SatsangCentreId = this.grdList.AsInt("swd_satsang_centre_id");
            this.sewadarHeader1.SetNameAndFireEvent(this.grdList.AsInt("swd_sewadar_id"),
                this.grdList.AsInt("swd_satsang_centre_id"), this.grdList.AsStr("swd_sewadar_gr_no"));
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.tlpTop);
            this.ObjectIdForLogOperation = this.intID.DisplayText + "|" + this.sewadarHeader1.SatsangCentreId + "|" + this.sewadarHeader1.txtGRNo.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarsInSewadarListSQLSelectQuery query = new ViewSewadarsInSewadarListSQLSelectQuery();
            query.application_satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.list_centre_nm.StartsWith(this.lkpListSatsangCentre.DisplayText);
            query.sewadar_grno.Equal(this.sewadarHeader1.txtGRNo.DisplayText);
            query.swd_sewadar_id.Equal(this.sewadarHeader1.intSewadarId.DisplayText);
            query.swd_centre_nm.StartsWith(this.sewadarHeader1.txtSatsangCentre.DisplayText);
            query.generated_dtm.Between(this.dtGenerated);
            query.report_nm.Contains(this.txtReportName.DisplayText);
            query.sewadar_list_nm.Contains(this.txtListName.DisplayText);
            query.sewadar_list_id.Equal(this.intID.DisplayText);
            query.swd_centre_nm.Contains(this.sewadarHeader1.txtSatsangCentre.DisplayText);
            query.swd_sewadar_id.Equal(this.sewadarHeader1.intSewadarId.IdTextAsInteger);
            query.sewadar_grno.Equal(this.sewadarHeader1.txtGRNo.IdText);
            query.full_nm.Contains(this.sewadarHeader1.txtName.DisplayText);
            query.sewadar_status_dtm.Equal(this.sewadarHeader1.dtmSewadarStatus.DisplayTextAsDateTime);
            query.sewadar_status_nm.Contains(this.sewadarHeader1.txtSewadarStatus.DisplayText);
            query.gender.Contains(this.sewadarHeader1.cmbGender.SelectedValue);
            query.department_nm.Contains(this.sewadarHeader1.txtDepartmentName.DisplayText);
            query.sub_department_nm.Contains(this.sewadarHeader1.txtSubDepartment.DisplayText);

            query.age.Between(this.sewadarHeader1.intAge);
            query.sewadar_status_dtm.Between(this.sewadarHeader1.dtmSewadarStatus);
            query.department_dt.Between(this.sewadarHeader1.dtDepJoiningDate);

            return dbFacade.ExecuteSelectQuery(query);

        }


        public override void CreateData()
        {
            foreach (DCCDataRowView row in this.grdListSewadars.GetRowsForState(RowStates.New))
            {
                try
                {
                    this.dbFacade.InsertGenericSewadarListsSewadar(this.intID.DisplayTextAsInteger,
                                row.AsInt(GrdListSewadarsColNames.satsang_centre_id.ToString()),
                                row.AsStr(GrdListSewadarsColNames.sewadar_grno.ToString()));
                }
                catch (Exception ex)
                {
                    this.grdListSewadars.SetFocus(grdListSewadars.Columns[GrdListSewadarsColNames.sewadar_grno.ToString()].Index,
                        row.RowIndex);
                    throw;
                }
            }
            this.ObjectIdForLogOperation = this.intID.DisplayText;
            if (this.grdListSewadars.RowCount == 1)
            {
                lblPrevGrNo.Text = "Last saved Gr.No : " + this.grdListSewadars.AsStr(GrdListSewadarsColNames.sewadar_grno.ToString(), this.grdListSewadars.Rows.Count - 1); ;
            }
            else
            {
                lblPrevGrNo.Text = "Added " + this.grdListSewadars.RowCount + " Sewadars to Sewadar List";
            }
        }

        public override void UpdateData()
        {
            //byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            int? oldSatsangCentreId = this.grdList.AsInt("swd_satsang_centre_id");
            string oldGRNo = this.grdList.AsStr("swd_sewadar_gr_no");
            this.dbFacade.UpdateGenericSewadarListsSewadar(this.intID.DisplayTextAsInteger,
                this.sewadarHeader1.txtSatsangCentre.IdTextAsInteger, 
                this.sewadarHeader1.txtGRNo.DisplayText, oldSatsangCentreId, oldGRNo);
        }

        public override bool DeleteData()
        {
            int? oldSatsangCentreId = this.grdList.AsInt("swd_satsang_centre_id");
            string oldGRNo = this.grdList.AsStr("swd_sewadar_gr_no");
            this.dbFacade.DeleteGenericSewadarListsSewadar(this.intID.DisplayTextAsInteger, oldSatsangCentreId, oldGRNo);
            return true;
        }

        private void txtListName_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            int listCentreId = 0;
            string conditionString = string.Empty;
            if (!string.IsNullOrEmpty(this.lkpListSatsangCentre.DisplayText) && 
                this.lkpListSatsangCentre.IdTextAsInteger != null)
            {
                listCentreId = this.lkpListSatsangCentre.IdTextAsInteger.Value;
                conditionString = "(l.satsang_centre_id = " + listCentreId + ") AND ";
            }
            if ((CurrentUIMode == UIModes.Insert) || (CurrentUIMode == UIModes.New))
            {
                conditionString += "(l.is_editing_allowed = 'Yes') AND "; //In insert mode, do not show lists that are not editable
            }
            this.lkpListSatsangCentre.IdTextAsInteger.GetValueOrDefault(0);
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "(" + conditionString + "((" + listCentreId + " = " + 
                ZSMUtility.GetSatsangCentreId() + ") OR (l.is_other_satsang_centre = 'Yes')))");
        }

        private void txtListName_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (DbManager.IsNotNull(e.LookupResult))
            {
                this.LoadDataToContainer(e.LookupResult, this.tlpTop);
                if (CurrentUIMode == UIModes.Insert)
                {
                    this.ClearAllControlsOfContainer(tlpSewadar, false);
                    UpdateReadOnlyBasedOnCheckBoxes();
                    this.sewadarHeader1.txtSatsangCentre.IdText = ZSMUtility.GetSatsangCentreId().ToString();
                    ZSMUtility.setDisplayValueText(this.sewadarHeader1.txtSatsangCentre, ZSMUtility.GetSatsangCentreName());
                }
            }
        }

        private void UpdateReadOnlyBasedOnCheckBoxes()
        {
            if (!this.chkIsEditingAllowed.Checked)
            {
                this.sewadarHeader1.txtSatsangCentre.ReadOnly = true;
                this.sewadarHeader1.txtGRNo.ReadOnly = true;
                this.sewadarHeader1.txtName.ReadOnly = true;
                this.sewadarHeader1.intSewadarId.ReadOnly = true;
            }
            else
            {
                this.sewadarHeader1.txtGRNo.ReadOnly = false;
                this.sewadarHeader1.txtName.ReadOnly = false;
                this.sewadarHeader1.intSewadarId.ReadOnly = false;
                this.sewadarHeader1.txtGRNo.Focus();
                if (!this.chkotherCentreSewadarsAllowed.Checked)
                {
                    this.sewadarHeader1.txtSatsangCentre.ReadOnly = true;
                }
                else
                {
                    if (!this.chkIsManagedByOtherCentre.Checked)
                    {
                        this.sewadarHeader1.txtSatsangCentre.ReadOnly = false;
                    }
                    else
                    {
                        this.sewadarHeader1.txtSatsangCentre.ReadOnly = true;
                    }
                }
            }
            readonlyStatusAlreadyUpdated = true;
        }

        private void sewadarHeader1_SewadarSelectionChanged(object sender, Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs e)
        {
            //DataTable dT = ZSMUtility.GetActiveSwdStatus(this.dbFacade);
            //foreach (DataRow item in dT.Rows)
            //{
            bool notActive = false;
            if (this.dbFacade.IsAnActiveStatus(this.sewadarHeader1.txtSewadarStatus.DisplayText) == "Yes")
            {
                this.sewadarHeader1.txtSewadarStatus.Font = this.sewadarHeader1.txtSubDepartment.Font;
            }
            else
            {
                Font f = new Font(this.sewadarHeader1.txtSewadarStatus.Font, FontStyle.Bold);
                this.sewadarHeader1.txtSewadarStatus.Font = f;
                notActive = true;
            }
            //}
            if (CurrentUIMode == UIModes.Insert || CurrentUIMode == UIModes.New)
            {
                this.grdListSewadars.InsertRowBottom();
                int rowIndex = this.grdListSewadars.Rows.Count - 1;
                LoadDataFromContainerToGrid(this.grdListSewadars, rowIndex, this.tlpSewadar, this.sewadarHeader1.dtDepJoiningDate);
                this.ClearAllControlsOfContainer(tlpSewadar, false, this.sewadarHeader1.txtSatsangCentre);
                if (notActive)
                {
                    Font f = new Font(this.grdListSewadars.Font, FontStyle.Bold);
                    this.grdListSewadars[GrdListSewadarsColNames.sewadar_status_nm.ToString(), rowIndex].Style.BackColor = Color.Red;
                    this.grdListSewadars[GrdListSewadarsColNames.sewadar_status_nm.ToString(), rowIndex].Style.ForeColor = Color.White;
                    this.grdListSewadars[GrdListSewadarsColNames.sewadar_status_nm.ToString(), rowIndex].Style.Font = f;
                }
                this.sewadarHeader1.txtGRNo.Focus();
            }

        }

        private void lkpListSatsangCentre_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (CurrentUIMode == UIModes.Insert)
            {
                this.ClearAllControlsOfContainer(tlpTop, false, this.lkpListSatsangCentre);
                this.ClearAllControlsOfContainer(tlpSewadar, false);
                UpdateReadOnlyBasedOnCheckBoxes();
                this.sewadarHeader1.txtSatsangCentre.IdText = ZSMUtility.GetSatsangCentreId().ToString();
                ZSMUtility.setDisplayValueText(this.sewadarHeader1.txtSatsangCentre, ZSMUtility.GetSatsangCentreName());
            }
        }

        public override bool IsReadyToDelete()
        {
            if (!this.chkIsEditingAllowed.Checked)
            {
                UIManager.ShowMessage(MsgCodes.DeleteNotAllowed, "Sewadar from Sewadar List|as editing is not allowed in this List", MessageTypes.Warning);
                return false;
            }
            return true;
        }

        public override bool IsReadyToSave()
        {
            if (!base.IsReadyToSave()) return false;
            if (!this.chkIsEditingAllowed.Checked)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Adding Sewadar to Sewadar List|as editing is not allowed in this List", MessageTypes.Warning);
                return false;
            }
            if (this.grdListSewadars.RowCount < 1)
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, "Atleast 1 Sewadar for Sewadar List", MessageTypes.Warning);
                return false;
            }
            return true;
        }

        private void lkpListSatsangCentre_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("satsang_centre_id = 0", "satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void grdListSewadars_RowDeleting(object sender, RowDeletingEventArgs e)
        {
            for (int i=(e.RowIndex);i<(this.grdListSewadars.RowCount - 1);i++)
            {
                this.grdListSewadars[GrdListSewadarsColNames.sewadar_status_nm.ToString(), i].Style =
                    this.grdListSewadars[GrdListSewadarsColNames.sewadar_status_nm.ToString(), i + 1].Style;
            }
        }

    }
}
