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
using DCC.ZOS.ZSM.MSC;
using System.Data.SqlClient;

namespace DCC.ZOS.ZSM.ACT
{

    public partial class OpenTraineeSewadarsInformation : ZSMAbstractScreen
    {
        private int? satsangCentreId = null;
        DataTable remarksDT = null;
        private ZSMStoredProcParamCreator _spParamCreator;

        public OpenTraineeSewadarsInformation()
        {
            InitializeComponent();
            this.ref2GrNoLookup1.SttsCode = "SttsRefUse";
            this.ref1GrNoLookup1.SttsCode = "SttsRefUse";
            this.ssGrNoLookup3.SttsCode = "SttsApprv";
            this.ssSewadarIDLookup2.SttsCode = "SttsApprv";
            this.ssSewadarLookup2.SttsCode = "SttsApprv";
            this.appGrNoLookup2.SttsCode = "SttsApprv";
            this.appSewadarIDLookup1.SttsCode = "SttsApprv";
            this.appSewadarLookup1.SttsCode = "SttsApprv";
            this.sponGrNoLookup1.SttsCode = "SttsApprv";
            this.sponSewadarIDLookup1.SttsCode = "SttsApprv";
            this.sponSewadarLookup1.SttsCode = "SttsApprv";

            this.sewadarStatusCombo1.isGlobal = false;
            this.departmentChooser1.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
            this.areaSecZsmSatsangCentresLookup.ShowNonMainCentres = true;
            this.secZsmSatsangCentresLookup2.ShowNonMainCentres = true;
            this.sewaLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookup1_LookupDialogShowing);
            this.sewaLookup1.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.sewaLookup1_LookupResultSet);
            if (GetSewadarType() == SewadarTypes.GUIDE_SWD)
            {
                departmentChooser1.DepartmentCode = "GD";
                ShowGuideControls(true);
            }
            else
            {
                ShowGuideControls(false);
            }

            if (GetSewadarType() == SewadarTypes.TRAINEE_SWD)
            {
                this.cmbOccupation.Mandatory = false;
                this.cmbOccupation.Visible = false;
                this.tlpReference1.Visible = false;
            }
            this.statesLookup1.CountryCode = 1;
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
            this.cmbOccupation.SetDataSource(ZSMUtility.GetOccupations(this.dbFacade), "occupation", "occupation");
            remarksDT = ZSMUtility.GetRemarkTypes(this.dbFacade);
            this.grdRemarks.SetComboBoxColumnDataSource("remarks_type", remarksDT, "remarks_type", "remarks_type");
            _spParamCreator = ZSMStoredProcParamCreator.GetInstance(dbFacade);
        }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.pictureBox1.Image = null;
            satsangCentreId = null;
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
            if (this.CurrentUIMode != UIModes.Query)
            {
                this.chkOutStationSewadar.CheckState = CheckState.Unchecked;
            }
        }

        private void ShowGuideControls(bool isVisible)
        {
            this.sewaLookup1.Mandatory = !isVisible;
            this.sewaLookup1.Visible = !isVisible;
            lblReference1.Visible = isVisible;
            lblReference2.Visible = isVisible;
            ref1ZsmSatsangCentresLookup.Visible = isVisible;
            ref2ZsmSatsangCentresLookup.Visible = isVisible;
            ref1GrNoLookup1.Visible = isVisible;
            ref2GrNoLookup1.Visible = isVisible;
            txtRefName.Visible = isVisible;
            txtRef2Name.Visible = isVisible;
            relationsLookup1.Visible = isVisible;
            relationsLookup2.Visible = isVisible;
            txtRef1Department.Visible = isVisible;
            txtRef2Department.Visible = isVisible;
        }

        private void MakeEditableOnlyInQueryMode(bool isQueryMode)
        {
            this.zsmGenderCombo1.ReadOnly = !isQueryMode;
            this.txtGRNo.ReadOnly = !isQueryMode;
        }

        private void MakeReadOnlyInBrowseMode(bool readOnly)
        {
            this.dtDepJoiningDate.ReadOnly = readOnly;
            this.departmentChooser1.ReadOnly = readOnly;
        }
        private void setBindingKeys(BaseMasterLookup lkp, int? idText, string displayText)
        {
            lkp.IdText = idText.ToString();
            lkp.DisplayText = displayText;
            lkp.ValueText = displayText;
        }

        private void FillDefaultValuesInInsertMode()
        {
            //[[The default value for date fields (Dept. Joining), Appointment and Status) is current date. 
            this.dtDepJoiningDate.DisplayTextAsDateTime = DateTime.Now;
            this.dtAppDate.DisplayTextAsDateTime = DateTime.Now;
            this.dtmCurrentStatusDate.DisplayTextAsDateTime = DateTime.Now;
            //]]
            //Default values for other fields are Outstation Sewadar (not ticked), Status (as per system information code SttsDefault), 
            //Satsang Centre for 2 references (Weekly Satsang Centre), Satsang Centre for Sponsorer, Security Approver and Sewa Samiti 
            //(as per the parameter passed to Application), Satsang Centre for 2 secretaries (Weekly Satsang Centre). 
            string statusValue = default(string);
            if (GetSewadarType() == SewadarTypes.OPEN_SWD)
                statusValue = this.dbFacade.ObjDBManager.ExecuteSQL("select system_info_value from system_information_codes sic JOIN system_information_values siv ON siv.system_info_cd = sic.system_info_cd WHERE sic.system_info_cd = 'SttsOpn'").Tables[0].Rows[0][0].ToString();
            else if (GetSewadarType() == SewadarTypes.GUIDE_SWD)
            {
                statusValue = this.dbFacade.ObjDBManager.ExecuteSQL("select system_info_value from system_information_codes sic JOIN system_information_values siv ON siv.system_info_cd = sic.system_info_cd WHERE sic.system_info_cd = 'SttsDefault'").Tables[0].Rows[0][0].ToString();
            }
            else
                statusValue = this.dbFacade.ObjDBManager.ExecuteSQL("select system_info_value from system_information_codes sic JOIN system_information_values siv ON siv.system_info_cd = sic.system_info_cd WHERE sic.system_info_cd = 'SttsTrn'").Tables[0].Rows[0][0].ToString();
            this.sewadarStatusCombo1.SelectedValue = statusValue;
            setBindingKeys(this.approvSatsangCentresLookup2, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            setBindingKeys(this.ssZsmSatsangCentresLookup3, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            setBindingKeys(this.sponZsmSatsangCentresLookup, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            //]]
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert || uiMode == UIModes.New)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                MakeReadOnlyInBrowseMode(false);
                FillDefaultValuesInInsertMode();
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    this.setHeaderInNewMode(int.Parse(screenParameters));
                    this.departmentChooser1.Focus();
                    this.intSewadarId.ReadOnly = true;
                    this.txtName.ReadOnly = true;
                }
            }
            else if (uiMode == UIModes.Query || uiMode == UIModes.Update)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                MakeReadOnlyInBrowseMode(false);
                this.chkOutStationSewadar.CheckState = CheckState.Indeterminate;
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    string[] args = screenParameters.Split('|');
                    this.txtGRNo.DisplayText = args[0];
                    this.satsangCentreId = int.Parse(args[1]);
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

        public override void ExecuteScreenAction(string actionId)
        {
            switch (actionId)
            {
                case "Cancel":
                    DialogResult result = MessageBox.Show(this, "Current Sewadar Information is about to be cancelled; no further changes will not be possible. Proceed?",
                                          "Warning",
                                          MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation,
                                          MessageBoxDefaultButton.Button1);
                    if (result == DialogResult.Yes)
                    {
                        try
                        {
                            this.dbFacade.ClearDbTasks();
                            this.dbFacade.BeginTrans();
                            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
                            List<SqlParameter> param = CancelOpenOrTraineeSewadar_Params(getRegistrationSatsangCentreId(), this.txtGRNo.DisplayText, txn_ts);
                            this.dbFacade.ObjDBManager.ExecuteStoredProc("CancelOpenOrTraineeSewadar", param, 600);
                            ZSMUtility.LogAction(this, this.dbFacade, actionId, this.intSewadarId.IdTextAsInteger, null, null, getRegistrationSatsangCentreId(), this.txtGRNo.DisplayText);
                            this.dbFacade.CommitTrans();
                            GlobalAppVariables.ObjMDIMain.FireQueryMode();
                            UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                        }
                        catch (Exception ex)
                        {
                            this.dbFacade.RollbackTrans();
                            throw;
                        }
                    }
                    break;
            }
        }

        private enum GridRemarksColNames
        {
            remarks_type,
            remarks_sq,
            old_remarks_sq,
            old_remarks_type,
            remarks_type_sq,
            remark
        }


        private short? GetRemarkSq(string remarkType, short? sq)
        {
            if (string.Compare(remarkType, "Reference", true) == 0)
            {
                return 1;
            }
            return sq;
        }

        private List<string> SaveGridsAsTask(int? sewadarId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                Hashtable overiddingParamValues = new Hashtable();
                overiddingParamValues.Add("sewadar_id", sewadarId);
                List<DCCDataRowView> lstDeletedRows = this.grdRemarks.GetRowsForState(RowStates.Deleted);
                foreach (DCCDataRowView row in lstDeletedRows)
                {
                    allTasks.Add(this.dbFacade.DeleteSewadarsRemarkAsTask(sewadarId,
                        row.AsStr(GridRemarksColNames.remarks_type.ToString()), row.AsShort(GridRemarksColNames.old_remarks_sq.ToString())));
                }

                List<DCCDataRowView> lstUpdatedRows = this.grdRemarks.GetRowsForState(RowStates.Updated);
                List<DCCDataRowView> lstOldRows = this.grdRemarks.GetRowsForState(RowStates.Old);
                bool hasNegativeSeq = false;
                //[[ If sequence for old/update row has changed, set it to a negative value in order to avoid 
                //voilation of unique constraint
                foreach (DCCDataRowView row in lstOldRows)
                {
                    short? seq = row.AsShort(GridRemarksColNames.remarks_sq.ToString());
                    if (seq != row.DisplayOrder)
                    {
                        allTasks.Add(this.dbFacade.UpdateSewadarsRemarkSqAsTask(sewadarId,
                        GetRemarkSq(row.AsStr(GridRemarksColNames.remarks_type.ToString()), (short?)(0 - row.DisplayOrder)),
                        row.AsStr(GridRemarksColNames.remarks_type.ToString()), row.AsShort(GridRemarksColNames.old_remarks_sq.ToString())));
                        hasNegativeSeq = true;
                    }
                }
                foreach (DCCDataRowView row in lstUpdatedRows)
                {

                    short? seq = row.AsShort(GridRemarksColNames.remarks_sq.ToString());
                    if (seq != row.DisplayOrder)
                    {
                        allTasks.Add(this.dbFacade.UpdateSewadarsRemarkAsTask(sewadarId, row.AsStr(GridRemarksColNames.remarks_type.ToString()),
                        GetRemarkSq(row.AsStr(GridRemarksColNames.remarks_type.ToString()), (short?)(0 - row.DisplayOrder)),
                        row.AsStr(GridRemarksColNames.old_remarks_type.ToString()), row.AsShort(GridRemarksColNames.old_remarks_sq.ToString()),
                        row.AsStr(GridRemarksColNames.remark.ToString())));
                        hasNegativeSeq = true;
                    }
                    else
                    {
                        allTasks.Add(this.dbFacade.UpdateSewadarsRemarkAsTask(sewadarId, row.AsStr(GridRemarksColNames.remarks_type.ToString()),
                            GetRemarkSq(row.AsStr(GridRemarksColNames.remarks_type.ToString()), seq),
                            row.AsStr(GridRemarksColNames.old_remarks_type.ToString()), row.AsShort(GridRemarksColNames.old_remarks_sq.ToString()),
                            row.AsStr(GridRemarksColNames.remark.ToString())));
                    }
                }
                //]]
                //[[If any sequence is set to negative, change all the negative seq to positive in one shot
                if (hasNegativeSeq)
                    allTasks.Add(this.dbFacade.MakeSewadarsRemarkSqPositiveAsTask(sewadarId));
                //]]

                List<DCCDataRowView> lstInsertedRows = this.grdRemarks.GetRowsForState(RowStates.New);
                foreach (DCCDataRowView row in lstInsertedRows)
                {
                    allTasks.Add(this.dbFacade.InsertSewadarsRemarkAsTask(sewadarId, row.AsStr(GridRemarksColNames.remarks_type.ToString()),
                        GetRemarkSq(row.AsStr(GridRemarksColNames.remarks_type.ToString()), (short?)row.DisplayOrder),
                        row.AsStr(GridRemarksColNames.remark.ToString())));
                }

                return allTasks;
            }
            catch
            {
                throw;
            }
        }


        private void LoadGrids()
        {
            dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarsRemarkAsTask(this.intSewadarId.IdTextAsInteger));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT = dSet.Tables[0];
            this.grdRemarks.RetrieveRecords(dT, false, RowStates.Old);
        }

        public override void LoadBrowseView(int rowIndex)
        {
            MakeReadOnlyInBrowseMode(true);
            MakeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            ZSMUtility.LoadOnlySewadarImageFromDBToPictureBox(this.intSewadarId.IdTextAsInteger, ref this.pictureBox1);
            if (!DbManager.IsNotNull(this.ssZsmSatsangCentresLookup3.IdTextAsInteger))
            {
                setBindingKeys(this.ssZsmSatsangCentresLookup3, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            }
            this.departmentChooser1.ReadOnly = (this.dtFinish.DisplayTextAsDateTime <= DateTime.Now);
            this.dtAppDate.ReadOnly = (this.dtFinish.DisplayTextAsDateTime <= DateTime.Now);
            this.dtDepJoiningDate.ReadOnly = (this.dtFinish.DisplayTextAsDateTime <= DateTime.Now);
            LoadGrids();
            this.ObjectIdForLogOperation = ZSMUtility.GetSatsangCentreId().ToString() + "|" + this.txtGRNo.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarsRegistrationSQLSelectQuery query = new ViewSewadarsRegistrationSQLSelectQuery();

            query.sewadar_id.Equal(this.intSewadarId.DisplayText);
            query.full_nm.Contains(this.txtName.DisplayText);
            query.gender.Equal(this.zsmGenderCombo1.SelectedValue);
            query.global_sewadar_status_nm.Equal(this.txtSewadarStatus.DisplayText);
            query.global_sewadar_status_dt.Between(this.dtmSewadarStatus);
            //query.sewadar_status_cd.Equal(this.sewadarStatusCombo1.SelectedValue);
            //query.sewadar_status_dtm.Between(this.dtmCurrentStatusDate);
            query.global_sewadar_status_dt.Between(this.dtmSewadarStatus);
            query.sewadar_grno.Equal(this.txtGRNo.DisplayText);
            query.sewadar_status_cd.Equal(this.sewadarStatusCombo1.SelectedValue);
            query.satsang_centre_id.Equal(this.getRegistrationSatsangCentreId());
            query.appointment_dt.Between(this.dtAppDate);
            query.department_id.Equal(this.departmentChooser1.SelectedDepartment);
            query.sub_department_id.Equal(this.departmentChooser1.SelectedSubDepartment);
            query.department_nm.Contains(this.departmentChooser1.SelectedDepartmentName);
            query.sub_department_nm.Contains(this.departmentChooser1.SelectedSubDepartmentName);
            query.department_dt.Between(this.dtDepJoiningDate);
            query.is_outstation_sewadar.Equal(this.chkOutStationSewadar.BlnString);
            query.sewa_id.Equal(this.sewaLookup1.IdText);
            query.sewa_nm.Contains(this.sewaLookup1.DisplayText);
            query.district_or_city_id.Equal(this.districtorCitiesLookup1.IdText);
            query.district_nm.Equal(this.districtorCitiesLookup1.DisplayText);
            query.sewadar_type.Equal(GetSewadarType());
            query.AddOrderByClause(query.sewadar_id, OrderByTypes.ASC);
            query.AddOrderByClause(query.sewadar_grno, OrderByTypes.ASC);
            return dbFacade.ExecuteSelectQuery(query);
        }

        public override bool IsReadyToSave()
        {
            /*CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_DepartmentDt
                CHECK	(	appointment_dt	<=	department_dt	),
            CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_SewadarStatusDt
                CHECK	(	appointment_dt	<=	sewadar_status_dtm	),
            CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_ResponsibilityDt
                CHECK	(	appointment_dt	<=	responsibility_dtm	)*/
            if (this.dtAppDate.DisplayTextAsDateTime > this.dtDepJoiningDate.DisplayTextAsDateTime)
            {
                UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, "Appointment date|Department joining date", MessageTypes.Error);
                return false;
            }
            if (this.dtAppDate.DisplayTextAsDateTime > this.dtmCurrentStatusDate.DisplayTextAsDateTime)
            {
                UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, "Appointment date|status  date", MessageTypes.Error);
                return false;
            }
            {
                if (!string.IsNullOrEmpty(this.sponGrNoLookup1.IdText)
                    && (!string.IsNullOrEmpty(this.areaSecCentreFunctionariesLookup1.IdText)
                        && !string.IsNullOrEmpty(this.secCentreFunctionariesLookup1.IdText)))
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "area secretary GR No. and secretary GR No. or sponsor GR No.", MessageTypes.Error);
                    return false;
                }
            }
            return base.IsReadyToSave();
        }

        public virtual string GetSewadarType()
        {
            return null;
        }

        public override void CreateData()
        {
            string grNo = default(string);
            List<string> tasks = new List<string>();
            if (this.GetSewadarType() == SewadarTypes.OPEN_SWD)
            {
                tasks.Add(this.dbFacade.UpdateOrInsertIfNotExistSewadarDetailAsTask(this.intSewadarId.IdTextAsInteger, this.cmbOccupation.SelectedValueAsStr));
                tasks.AddRange(SaveGridsAsTask(this.intSewadarId.IdTextAsInteger));
            }
            this.dbFacade.AddDbTasks(tasks);
            this.dbFacade.ExecuteDbTasks();
            this.dbFacade.ClearDbTasks();
            DataTable dT = null;
            if (this.GetSewadarType() == SewadarTypes.TRAINEE_SWD)
                dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("DECLARE @a sewadar_grno ; EXEC GetTraineeSewadarRegistrationNumber '{0}', '{1}', @a OUTPUT ;select @a ",
                             ZSMUtility.GetSatsangCentreId(), this.sewaLookup1.IdTextAsInteger)).Tables[0];
            else if (this.GetSewadarType() == SewadarTypes.GUIDE_SWD)
                dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("DECLARE @a sewadar_grno ; EXEC GetGuideRegistrationNumber '{0}', '{1}', @a OUTPUT ;select @a ",
                             ZSMUtility.GetSatsangCentreId(), this.zsmGenderCombo1.SelectedValueAsStr)).Tables[0];
            else
                dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("DECLARE @a sewadar_grno ; EXEC GetOpenSewadarRegistrationNumber '{0}', '{1}', @a OUTPUT ;select @a ",
                     ZSMUtility.GetSatsangCentreId(), this.sewaLookup1.IdTextAsInteger)).Tables[0];
            if (dT.Rows.Count != 0)
            {
                grNo = dT.Rows[0][0].ToString();
                this.dbFacade.InsertSewadarsRegistration(this.getRegistrationSatsangCentreId(),
                                                grNo, this.intSewadarId.IdTextAsInteger,
                                                this.dtAppDate.DisplayTextAsDateTime, this.chkOutStationSewadar.BlnString,
                                                this.departmentChooser1.SelectedDepartment, this.departmentChooser1.SelectedSubDepartment,
                                                this.dtDepJoiningDate.DisplayTextAsDateTime, this.sewadarStatusCombo1.SelectedValueAsStr,
                                                this.dtmCurrentStatusDate.DisplayTextAsDateTime, null, null,
                                               this.ref1GrNoLookup1.IdTextAsInteger,
                                                this.relationsLookup1.IdTextAsShort,
                                                this.txtRefName.DisplayText,
                                                this.ref1ZsmSatsangCentresLookup.IdTextAsInteger,
                                                this.txtRef1Department.DisplayText,
                                                this.ref2GrNoLookup1.IdTextAsInteger,
                                                this.relationsLookup2.IdTextAsShort,
                                                this.txtRef2Name.DisplayText,
                                                this.ref2ZsmSatsangCentresLookup.IdTextAsInteger,
                                                this.txtRef2Department.DisplayText,
                                                this.sponSewadarIDLookup1.IdTextAsInteger, this.areaSecCentreFunctionariesLookup1.IdTextAsShort,
                                                this.secCentreFunctionariesLookup1.IdTextAsShort, this.appSewadarIDLookup1.IdTextAsInteger,
                                                this.ssSewadarIDLookup2.IdTextAsInteger, null, null, GetSewadarType(), this.sewaLookup1.IdTextAsShort, this.districtorCitiesLookup1.IdTextAsInteger);

                this.InfoMessageToShow = "The Generated GR. No. is : " + grNo;
                this.ObjectIdForLogOperation = ZSMUtility.GetSatsangCentreId().ToString() + "|" + grNo;
            }
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            List<string> tasks = new List<string>();
            if (this.GetSewadarType() == SewadarTypes.OPEN_SWD)
            {
                tasks.Add(this.dbFacade.UpdateOrInsertIfNotExistSewadarDetailAsTask(this.intSewadarId.IdTextAsInteger, this.cmbOccupation.SelectedValueAsStr));
                tasks.AddRange(SaveGridsAsTask(this.intSewadarId.IdTextAsInteger));
            }
            tasks.Add(this.dbFacade.UpdateSewadarsRegistrationAsTask(this.getRegistrationSatsangCentreId(),
                                            this.txtGRNo.DisplayText, this.intSewadarId.IdTextAsInteger,
                                                this.dtAppDate.DisplayTextAsDateTime, this.chkOutStationSewadar.BlnString,
                                                this.departmentChooser1.SelectedDepartment, this.departmentChooser1.SelectedSubDepartment,
                                                this.dtDepJoiningDate.DisplayTextAsDateTime, this.sewadarStatusCombo1.SelectedValueAsStr,
                                                this.dtmCurrentStatusDate.DisplayTextAsDateTime, null,null,
                                                this.ref1GrNoLookup1.IdTextAsInteger,
                                                this.relationsLookup1.IdTextAsShort,
                                                DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.txtRefName.DisplayText,
                                                DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.ref1ZsmSatsangCentresLookup.IdTextAsInteger,
                                                DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.txtRef1Department.DisplayText,
                                                this.ref2GrNoLookup1.IdTextAsInteger,
                                                this.relationsLookup2.IdTextAsShort,
                                                DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.txtRef2Name.DisplayText,
                                                DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.ref2ZsmSatsangCentresLookup.IdTextAsInteger,
                                                DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.txtRef2Department.DisplayText,
                                                this.sponSewadarIDLookup1.IdTextAsInteger, this.areaSecCentreFunctionariesLookup1.IdTextAsShort,
                                                this.secCentreFunctionariesLookup1.IdTextAsShort, this.appSewadarIDLookup1.IdTextAsInteger,
                                                this.ssSewadarIDLookup2.IdTextAsInteger, null, null, GetSewadarType(), this.sewaLookup1.IdTextAsShort, this.districtorCitiesLookup1.IdTextAsInteger, txn_ts));

            this.dbFacade.AddDbTasks(tasks);
            this.dbFacade.ExecuteDbTasks();
            this.dbFacade.ClearDbTasks();
        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteSewadarsRegistration(this.intSewadarId.IdTextAsInteger, this.txtGRNo.DisplayText, txn_ts);
            return true;
        }

        private void setHeaderInNewMode(int? sewadarId)
        {
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select * from ViewSewadarHeader where sewadar_id = " + sewadarId).Tables[0];
            this.LoadDataToContainer(dT, this.tlpTop, this.txtGRNo, this.txtSatsangCentre,
                    this.dtmCurrentStatusDate, this.sewadarStatusCombo1, this.dtDepJoiningDate, this.departmentChooser1, this.chkOutStationSewadar
                    , this.dtStart, this.dtFinish, this.sewaLookup1);
        }

        private void sewadarLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                setHeaderInNewMode(this.txtName.IdTextAsInteger);
            }
        }

        private void intSewadarId_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.intSewadarId.DisplayText))
                {
                    this.txtName.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]);
                    this.txtName.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.sewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private int? getRegistrationSatsangCentreId()
        {
            if (this.satsangCentreId.HasValue)
            {
                return this.satsangCentreId;
            }
            else
            {
                return ZSMUtility.GetSatsangCentreId();
            }
        }

        private void grNoLookup2_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.approvSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssGrNoLookup3_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup3.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sponGrNoLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.sponZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sewadarIDLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.approvSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssSewadarIDLookup2_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup3.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssSewadarLookup2_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup3.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sewadarLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.approvSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sponSewadarLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.sponZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sponSewadarIDLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.sponZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sewadarStatusCombo1_SelectedValueChanged(object sender, EventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                this.dtmCurrentStatusDate.DisplayTextAsDateTime = (DbManager.IsNotNull(this.sewadarStatusCombo1.SelectedValue)) ? (DateTime?)DateTime.Now : null;
            }
        }


        private void chkOutStationSewadar_CheckedChanged(object sender, EventArgs e)
        {
            //Sponsorer is required for Local Sewadars, and Area Secretary and Secretary are required for Outstation Sewadars. 
            this.tlpApprover.Visible = false;
            this.tlpAreaSec.Visible = false;
            this.tlpSewaSamiti.Visible = false;
            this.tlpSponsor.Visible = false;
            this.tlpSec.Visible = false;
            this.ClearAllControlsOfContainer(this.tlpApprover, true, this.approvSatsangCentresLookup2);
            this.ClearAllControlsOfContainer(this.tlpAreaSec, true);
            this.ClearAllControlsOfContainer(this.tlpSewaSamiti, true, this.ssZsmSatsangCentresLookup3);
            this.ClearAllControlsOfContainer(this.tlpSponsor, true, this.sponZsmSatsangCentresLookup);
            this.ClearAllControlsOfContainer(this.tlpSec, true);
            if (this.chkOutStationSewadar.Checked)
            {
                this.tlpAreaSec.Visible = true;
                this.tlpSewaSamiti.Visible = true;
                this.tlpSec.Visible = true;
            }
            else
            {
                this.tlpApprover.Visible = true;
                this.tlpSewaSamiti.Visible = true;
                this.tlpSponsor.Visible = true;
            }
        }

        private void secCentreFunctionariesLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "f.centre_functionary = 'Secretary' AND f.satsang_centre_id = " + this.secZsmSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void areaSecCentreFunctionariesLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "f.centre_functionary = 'Area Secretary' AND f.satsang_centre_id = " + this.areaSecZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
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
                    this.sponResponsibilityCombo1.DisplayText = dT.Rows[0]["responsibility"].ToString();
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

        private void appGrNoLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.appGrNoLookup2.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.appSewadarLookup1, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.appSewadarLookup1.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.appSewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private void appSewadarIDLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.appSewadarIDLookup1.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.appSewadarLookup1, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.appSewadarLookup1.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.appSewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private void appSewadarLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.appSewadarLookup1.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.appGrNoLookup2, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]));
                    this.appGrNoLookup2.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.appSewadarIDLookup1, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_id"]));
                    this.appSewadarIDLookup1.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT sewadar_status_nm, responsibility, sewa_years=DATEDIFF(YEAR, appointment_dt, GETDATE()) FROM ViewSewadarHeader WHERE sewadar_id = " + this.appSewadarIDLookup1.IdText).Tables[0];
                    this.approvResponsibilityCombo1.DisplayText = dT.Rows[0]["responsibility"].ToString();
                    this.approvStatus.DisplayText = dT.Rows[0]["sewadar_status_nm"].ToString();
                    this.approvintYearsInSewa.DisplayText = dT.Rows[0]["sewa_years"].ToString();
                }
            }
        }

        private void ssSewadarIDLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.ssSewadarIDLookup2.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssSewadarLookup2, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.ssSewadarLookup2.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.ssSewadarLookup2_LookupResultSet(null, e);
                }
            }
        }

        private void ssSewadarLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.ssSewadarLookup2.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssGrNoLookup3, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]));
                    this.ssGrNoLookup3.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.ssSewadarIDLookup2, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_id"]));
                    this.ssSewadarIDLookup2.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT sewadar_status_nm, responsibility, sewa_years=DATEDIFF(YEAR, appointment_dt, GETDATE()) FROM ViewSewadarHeader WHERE sewadar_id = " + this.ssSewadarIDLookup2.IdText).Tables[0];
                    this.ssResponsibilityCombo.DisplayText = dT.Rows[0]["responsibility"].ToString();
                    this.ssStatus.DisplayText = dT.Rows[0]["sewadar_status_nm"].ToString();
                    this.ssintYearsInSewa.DisplayText = dT.Rows[0]["sewa_years"].ToString();
                }
            }

        }

        private void ssGrNoLookup3_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.ssGrNoLookup3.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssSewadarLookup2, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.ssSewadarLookup2.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.ssSewadarLookup2_LookupResultSet(null, e);
                }
            }
        }

        private void dtDepJoiningDate_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (DbManager.IsNotNull(this.dtDepJoiningDate.DisplayTextAsDateTime) && DbManager.IsNotNull(this.dtFinish.DisplayTextAsDateTime))
            {
                if (this.dtDepJoiningDate.DisplayTextAsDateTime.Value > this.dtFinish.DisplayTextAsDateTime)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, this.dtDepJoiningDate.DisplayText + "| Dep. Joining Date ");
                    e.Cancel = true;
                }
            }
        }

        private void dtmCurrentStatusDate_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (DbManager.IsNotNull(this.dtmCurrentStatusDate.DisplayTextAsDateTime))
            {
                if (this.dtmCurrentStatusDate.DisplayTextAsDateTime.Value >= DateTime.Now)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, this.dtmCurrentStatusDate.DisplayText + "| Status Date ");
                    e.Cancel = true;
                }
            }
        }

        private void dtAppDate_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (DbManager.IsNotNull(this.dtAppDate.DisplayTextAsDateTime)
                 && DbManager.IsNotNull(this.dtFinish.DisplayTextAsDateTime))
            {
                if (this.dtAppDate.DisplayTextAsDateTime.Value > this.dtFinish.DisplayTextAsDateTime)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, this.dtAppDate.DisplayText + "| Appointment Date ");
                    e.Cancel = true;
                }
            }
        }

        private void areaSecZsmSatsangCentresLookup_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.dtAppDate.DisplayText))
            {
                DataSet dSet = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select centre_functionary_id, functionary_nm from satsang_centre_functionaries f where f.satsang_centre_id = {0} AND f.centre_functionary = 'Area Secretary' AND ('{1}' BETWEEN f.effective_from AND f.effective_till) ; select centre_functionary_id, functionary_nm from satsang_centre_functionaries f where f.satsang_centre_id = {0} AND f.centre_functionary = 'Secretary' AND ('{1}' BETWEEN f.effective_from AND f.effective_till)", this.areaSecZsmSatsangCentresLookup.IdText, this.dtAppDate.DisplayText));
                DataTable dT = dSet.Tables[0];
                if (dT.Rows.Count == 1)
                {
                    this.areaSecCentreFunctionariesLookup1.IdText = dT.Rows[0]["centre_functionary_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.areaSecCentreFunctionariesLookup1, dT.Rows[0]["functionary_nm"].ToString());
                }
                this.secZsmSatsangCentresLookup2.IdText = this.areaSecZsmSatsangCentresLookup.IdText;
                ZSMUtility.setDisplayValueText(this.secZsmSatsangCentresLookup2, this.areaSecZsmSatsangCentresLookup.DisplayText);
                dT = dSet.Tables[1];
                if (dT.Rows.Count == 1)
                {
                    this.secCentreFunctionariesLookup1.IdText = dT.Rows[0]["centre_functionary_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.secCentreFunctionariesLookup1, dT.Rows[0]["functionary_nm"].ToString());
                }
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, " Appointment Date ", MessageTypes.Warning);
            }

        }

        private void txtName_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            //Information must exist in Sewadars screen (either with no Current GR NO and Current Satsang Centre, or Current GR No is not 
            //an active one, or Current GR No is for Trainee or Open Sewadar for any previous sewa) and and Sewadars Details screen.
            if (GetSewadarType() == SewadarTypes.TRAINEE_SWD)
                e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "JOIN sewadars_details sd ON vs.sewadar_id = sd.sewadar_id LEFT OUTER JOIN sewadars_registrations sr ON vs.sewadar_id = sr.sewadar_id AND vs.sewadar_grno = sr.sewadar_grno LEFT OUTER JOIN system_information_values siv ON siv.system_info_value = sr.sewadar_status_cd AND siv.system_info_cd = 'SttsActv' WHERE ((sr.sewadar_status_cd IS NULL OR (sr.sewadar_status_cd != 'Trn' AND sr.sewadar_status_cd != 'Open')) AND siv.system_info_cd IS NULL)  AND ");
            else
                e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "LEFT OUTER JOIN sewadars_registrations sr ON vs.sewadar_id = sr.sewadar_id AND vs.sewadar_grno = sr.sewadar_grno LEFT OUTER JOIN system_information_values siv ON siv.system_info_value = sr.sewadar_status_cd AND siv.system_info_cd = 'SttsActv' WHERE ((sr.sewadar_status_cd IS NULL OR (sr.sewadar_status_cd != 'Trn' AND sr.sewadar_status_cd != 'Open')) AND siv.system_info_cd IS NULL)  AND ");
            //Information must exist in Sewadars Information screen either with no Current GR NO and Current Satsang Centre, 
            //or Current GR No is not an active one, or Current GR No is for Open Sewadar for any previous sewa.
        }

        private void intSewadarId_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            //Information must exist in Sewadars screen (either with no Current GR NO and Current Satsang Centre, or Current GR No is not 
            //an active one, or Current GR No is for Trainee or Open Sewadar for any previous sewa) and and Sewadars Details screen.
            if (GetSewadarType() == SewadarTypes.TRAINEE_SWD)
                e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "JOIN sewadars_details sd ON vs.sewadar_id = sd.sewadar_id LEFT OUTER JOIN sewadars_registrations sr ON vs.sewadar_id = sr.sewadar_id AND vs.sewadar_grno = sr.sewadar_grno LEFT OUTER JOIN system_information_values siv ON siv.system_info_value = sr.sewadar_status_cd AND siv.system_info_cd = 'SttsActv' WHERE ((sr.sewadar_status_cd IS NULL OR (sr.sewadar_status_cd != 'Trn' AND sr.sewadar_status_cd != 'Open')) AND siv.system_info_cd IS NULL)  AND ");
            else
                e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "LEFT OUTER JOIN sewadars_registrations sr ON vs.sewadar_id = sr.sewadar_id AND vs.sewadar_grno = sr.sewadar_grno LEFT OUTER JOIN system_information_values siv ON siv.system_info_value = sr.sewadar_status_cd AND siv.system_info_cd = 'SttsActv' WHERE ((sr.sewadar_status_cd IS NULL OR (sr.sewadar_status_cd != 'Trn' AND sr.sewadar_status_cd != 'Open')) AND siv.system_info_cd IS NULL)  AND ");            //Information must exist in Sewadars Information screen either with no Current GR NO and Current Satsang Centre, 
            //or Current GR No is not an active one, or Current GR No is for Open Sewadar for any previous sewa.
        }

        private void sewaLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (GetSewadarType() == SewadarTypes.OPEN_SWD)
                e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND s.locked_dtm IS NULL AND s.finish_dt > GETDATE() AND s.open_sewadar_current_seq_id IS NOT NULL");
            else
                e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND s.locked_dtm IS NULL AND s.finish_dt > GETDATE() AND s.trainee_current_seq_id IS NOT NULL");
        }

        private void sewaLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.sewaLookup1.IdText.ToString()))
            {
                this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["finish_dt"]);
                this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["start_dt"]);
                if (this.CurrentUIMode == UIModes.Insert)
                {
                    if (this.dtStart.DisplayTextAsDateTime > DateTime.Now)
                    {
                        this.dtAppDate.DisplayTextAsDateTime = this.dtStart.DisplayTextAsDateTime;
                        this.dtDepJoiningDate.DisplayTextAsDateTime = this.dtStart.DisplayTextAsDateTime;
                    }
                    else if (this.dtFinish.DisplayTextAsDateTime < DateTime.Now)
                    {
                        this.dtAppDate.DisplayTextAsDateTime = this.dtFinish.DisplayTextAsDateTime;
                        this.dtDepJoiningDate.DisplayTextAsDateTime = this.dtFinish.DisplayTextAsDateTime;
                    }
                    else
                    {
                        this.dtAppDate.DisplayTextAsDateTime = DateTime.Now;
                        this.dtDepJoiningDate.DisplayTextAsDateTime = DateTime.Now;
                    }

                }
            }
        }

        private void statesLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.districtorCitiesLookup1.StateCode = this.statesLookup1.IdTextAsInteger.GetValueOrDefault(0);
        }

        #region ActionParamCreation
        private List<SqlParameter> CancelOpenOrTraineeSewadar_Params(Int32? satsang_centre_id,
                                                                        String sewadar_grno,
                                                                        Byte[] txn_ts)
        {
            List<SqlParameter> p = new List<SqlParameter>();
            _spParamCreator.CreateSqlParameter("satsang_centre_id", satsang_centre_id, ZSMStoredProcParamCreator.INT, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("sewadar_grno", sewadar_grno, ZSMStoredProcParamCreator.CHAR, ZSMStoredProcParamCreator.IN, p);
            _spParamCreator.CreateSqlParameter("txn_ts", txn_ts, ZSMStoredProcParamCreator.TIMESTAMP, ZSMStoredProcParamCreator.IN, p);
            return p;
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

        #endregion

        private void tlpBase_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
