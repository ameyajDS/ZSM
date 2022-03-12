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
using DCC.ZOS.ZSM.Controls.Configuration;
using DCC.ZOS.ZSM.RPT;

namespace DCC.ZOS.ZSM.ACT
{

    public partial class SewadarsInformation : ZSMAbstractScreen
    {
        private int? satsangCentreId = null;
        public SewadarsInformation()
        {
            InitializeComponent();
            this.ref2GrNoLookup1.SttsCode = "SttsRefUse";
            this.ref1GrNoLookup1.SttsCode = "SttsRefUse";
            this.ssGrNoLookup.SttsCode = "SttsApprv";
            this.ssSewadarIDLookup.SttsCode = "SttsApprv";
            this.ssSewadarLookup.SttsCode = "SttsApprv";
            this.approvGrNoLookup.SttsCode = "SttsApprv";
            this.approvSewadarIDLookup.SttsCode = "SttsApprv";
            this.approvSewadarNameLookup.SttsCode = "SttsApprv";
            this.sponGrNoLookup.SttsCode = "SttsApprv";
            this.sponSewadarIDLookup.SttsCode = "SttsApprv";
            this.sponSewadarLookup.SttsCode = "SttsApprv";
            this.sewadarStatusCombo1.isGlobal = false;
            this.sewadarStatusCombo1.StatusSystemInfoCode = SewadarStatusSysInfoCode.RegularSewadar;
            this.departmentChooser1.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
            this.ref1ZsmSatsangCentresLookup.ShowNonMainCentres = true;
            this.ref2ZsmSatsangCentresLookup.ShowNonMainCentres = true;
            this.areaSecZsmSatsangCentresLookup.ShowNonMainCentres = true;
            this.secZsmSatsangCentresLookup.ShowNonMainCentres = true;
        }

        public override string ScreenId { get { return Screens.ACT_SEWADARS_INFORMATION; } }

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

        private void MakeEditableOnlyInQueryMode(bool isQueryMode)
        {
            this.zsmGenderCombo1.ReadOnly = !isQueryMode;
            this.txtGRNo.ReadOnly = !isQueryMode;
        }

        private void MakeEditableOnlyInInsertMode(bool isInsertMode)
        {
            ref1GrNoLookup1.ReadOnly = !isInsertMode;
            txtRefName.ReadOnly = !isInsertMode;
            ref1ZsmSatsangCentresLookup.ReadOnly = !isInsertMode;
            txtRef1Department.ReadOnly = !isInsertMode;
            relationsLookup1.ReadOnly = !isInsertMode;

            ref2GrNoLookup1.ReadOnly = !isInsertMode;
            txtRef2Name.ReadOnly = !isInsertMode;
            ref2ZsmSatsangCentresLookup.ReadOnly = !isInsertMode;
            txtRef2Department.ReadOnly = !isInsertMode;
            relationsLookup2.ReadOnly = !isInsertMode;
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

        private void fillApprovers()
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask("SELECT c.sewadar_id, c.full_nm, c.sewadar_grno FROM satsang_centres_details scd JOIN system_information_values siv ON  scd.centre_alphabet + 'DflSSApr' = siv.system_info_cd JOIN ViewSewadarHeader c ON c.sewadar_id = siv.value_int WHERE scd.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
            this.dbFacade.AddDbTask("SELECT c.sewadar_id, c.full_nm, c.sewadar_grno FROM satsang_centres_details scd JOIN system_information_values siv ON  scd.centre_alphabet + 'DflSecApr' = siv.system_info_cd JOIN ViewSewadarHeader c ON c.sewadar_id = siv.value_int WHERE scd.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT1 = dSet.Tables[0];
            DataTable dT2 = dSet.Tables[1];
            if (dT1.Rows.Count == 1 && string.IsNullOrEmpty(this.ssSewadarLookup.IdText))
            {
                setBindingKeys(this.ssSewadarLookup, DbManager.GetNullableInteger(dT1.Rows[0]["sewadar_id"]), dT1.Rows[0]["full_nm"].ToString());
                ZSMUtility.setDisplayValueText(this.ssGrNoLookup, DbManager.GetString(dT1.Rows[0]["sewadar_grno"]));
                this.ssGrNoLookup.IdText = dT1.Rows[0]["sewadar_id"].ToString();
                ZSMUtility.setDisplayValueText(this.ssSewadarIDLookup, DbManager.GetString(dT1.Rows[0]["sewadar_id"]));
                this.ssSewadarIDLookup.IdText = dT1.Rows[0]["sewadar_id"].ToString();
            }
            if (dT2.Rows.Count == 1 && string.IsNullOrEmpty(this.approvSewadarNameLookup.IdText))
            {
                setBindingKeys(this.approvSewadarNameLookup, DbManager.GetNullableInteger(dT2.Rows[0]["sewadar_id"]), dT2.Rows[0]["full_nm"].ToString());
                ZSMUtility.setDisplayValueText(this.approvGrNoLookup, DbManager.GetString(dT2.Rows[0]["sewadar_grno"]));
                this.approvGrNoLookup.IdText = dT2.Rows[0]["sewadar_id"].ToString();
                ZSMUtility.setDisplayValueText(this.approvSewadarIDLookup, DbManager.GetString(dT2.Rows[0]["sewadar_id"]));
                this.approvSewadarIDLookup.IdText = dT2.Rows[0]["sewadar_id"].ToString();
            }
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
            string statusValue = this.dbFacade.ObjDBManager.ExecuteSQL("select system_info_value from system_information_codes sic JOIN system_information_values siv ON siv.system_info_cd = sic.system_info_cd WHERE sic.system_info_cd = 'SttsDefault'").Tables[0].Rows[0][0].ToString();
            this.sewadarStatusCombo1.SelectedValue = statusValue;
            setBindingKeys(this.approvSatsangCentresLookup, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            setBindingKeys(this.ssZsmSatsangCentresLookup, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            setBindingKeys(this.sponZsmSatsangCentresLookup, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            //]]
            fillApprovers();
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert || uiMode == UIModes.New)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                MakeEditableOnlyInInsertMode(true);
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
                MakeEditableOnlyInInsertMode(false);
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
                case "Sewadar":
                    UIManager.OpenForm(typeof(Sewadars), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    break;
                case "Sewadar Details":
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select 1 from ViewSewadarsDetail where sewadar_id = " + this.intSewadarId.DisplayText).Tables[0];
                    if (dT.Rows.Count > 0)
                    {
                        UIManager.OpenForm(typeof(SewadarsDetails), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    }
                    else
                    {
                        UIManager.OpenForm(typeof(SewadarsDetails), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    }

                    break;
                case "Sewa Summary":
                    UIManager.OpenForm(typeof(SewaSummary), UIModes.Reference, GlobalAppVariables.AppContext.ApplicationId, getRegistrationSatsangCentreId() + "|" + this.txtGRNo.DisplayText, this, this);
                    break;
                case "Sewadar Particulars":
                    UIManager.OpenForm(typeof(SewadarsParticulars), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, getRegistrationSatsangCentreId() + "," + this.txtGRNo.DisplayText + ",Sewadar", this, this);
                    break;
                case "Print Details":
                    string param = this.intSewadarId.DisplayText + "," + txtGRNo.ValueText;
                    UIManager.OpenForm(typeof(PrintSewadarDetails), UIModes.Query, GlobalAppVariables.AppContext.ApplicationId, param, this, this);
                    break;
                case "Sewadar History":
                    UIManager.OpenForm(typeof(SewadarHistory), UIModes.Reference, GlobalAppVariables.AppContext.ApplicationId, getRegistrationSatsangCentreId() + "|" + this.txtGRNo.DisplayText, this, this);
                    break;
            }
        }

        public override void LoadBrowseView(int rowIndex)
        {
            MakeReadOnlyInBrowseMode(true);
            MakeEditableOnlyInQueryMode(false);
            MakeEditableOnlyInInsertMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            ZSMUtility.LoadOnlySewadarImageFromDBToPictureBox(this.intSewadarId.IdTextAsInteger, ref this.pictureBox1);
            if (!DbManager.IsNotNull(this.ssZsmSatsangCentresLookup.IdTextAsInteger))
            {
                setBindingKeys(this.ssZsmSatsangCentresLookup, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            }
            if (!DbManager.IsNotNull(this.approvSatsangCentresLookup.IdTextAsInteger))
            {
                setBindingKeys(this.approvSatsangCentresLookup, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            }
            if (!DbManager.IsNotNull(this.sponZsmSatsangCentresLookup.IdTextAsInteger))
            {
                setBindingKeys(this.sponZsmSatsangCentresLookup, ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName());
            }
            fillApprovers();
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
            query.global_sewadar_status_nm.Equal(this.txtSewadarStatus.DisplayText);
            query.global_sewadar_status_dt.Between(this.dtmSewadarStatus);
            query.sewadar_status_cd.Equal(this.sewadarStatusCombo1.SelectedValue);
            query.sewadar_status_dtm.Between(this.dtmCurrentStatusDate);
            query.global_sewadar_status_dt.Between(this.dtmSewadarStatus);
            query.sewadar_grno.Equal(this.txtGRNo.DisplayText);
            query.sewadar_status_cd.Equal(this.sewadarStatusCombo1.SelectedValue);
            query.satsang_centre_id.Equal(this.getRegistrationSatsangCentreId());
            query.appointment_dt.Between(this.dtAppDate);
            query.responsibility.Equal(this.responsibilityCombo1.SelectedValue);
            query.responsibility_dtm.Between(this.dtmResposibility);
            query.department_id.Equal(this.departmentChooser1.SelectedDepartment);
            query.sub_department_id.Equal(this.departmentChooser1.SelectedSubDepartment);
            query.department_nm.Contains(this.departmentChooser1.SelectedDepartmentName);
            query.sub_department_nm.Contains(this.departmentChooser1.SelectedSubDepartmentName);
            query.department_dt.Between(this.dtDepJoiningDate);
            query.is_outstation_sewadar.Equal(this.chkOutStationSewadar.BlnString);
            query.sewadar_type.Equal("R");

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
            if (this.dtAppDate.DisplayTextAsDateTime > this.dtmResposibility.DisplayTextAsDateTime)
            {
                UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, "Appointment date|responsibility  date", MessageTypes.Error);
                return false;
            }

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
            if (this.CurrentUIMode == UIModes.Insert
                || this.CurrentUIMode == UIModes.New)
            {
                /*CONSTRAINT	SewadarsRegistrations_CK_SponsorerID_IsOutstationSewadar
                    CHECK	(	(	is_outstation_sewadar	=	'No'	AND	sponsorer_id	IS NOT NULL	)
                            OR	(	is_outstation_sewadar	=	'Yes'	AND	sponsorer_id	IS NULL		)
                            ),*/
                if ((!this.chkOutStationSewadar.Checked && !string.IsNullOrEmpty(this.sponGrNoLookup.IdText))
                    || (this.chkOutStationSewadar.Checked && string.IsNullOrEmpty(this.sponGrNoLookup.IdText)))
                {
                }
                else
                {
                    UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Outstation sewadar|sponsor GR No.", MessageTypes.Error);
                    return false;
                }

                /*CONSTRAINT	SewadarsRegistrations_CK_AreaSecretaryID_IsOutstationSewadar
                    CHECK	(	(	is_outstation_sewadar	=	'Yes'									)
                            OR	(	is_outstation_sewadar	=	'No'	AND	area_secretary_id	IS NULL	)
                            ),*/
                if ((this.chkOutStationSewadar.Checked)
                    || (!this.chkOutStationSewadar.Checked && string.IsNullOrEmpty(this.areaSecCentreFunctionariesLookup.IdText)))
                {
                }
                else
                {
                    UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Outstation sewadar|area secretary GR No.", MessageTypes.Error);
                    return false;
                }

                /*CONSTRAINT	SewadarsRegistrations_CK_SecretaryID_IsOutstationSewadar
                    CHECK	(	(	is_outstation_sewadar	=	'Yes'								)
                            OR	(	is_outstation_sewadar	=	'No'	AND	secretary_id	IS NULL	)
                            ),*/
                if ((this.chkOutStationSewadar.Checked)
                    || (!this.chkOutStationSewadar.Checked && string.IsNullOrEmpty(this.secCentreFunctionariesLookup.IdText)))
                {
                }
                else
                {
                    UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Outstation sewadar|secretary GR No.", MessageTypes.Error);
                    return false;
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(this.sponGrNoLookup.IdText)
                    || (!string.IsNullOrEmpty(this.areaSecCentreFunctionariesLookup.IdText)
                        && !string.IsNullOrEmpty(this.secCentreFunctionariesLookup.IdText)))
                {
                }
                else
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "area secretary GR No. and secretary GR No. or sponsor GR No.", MessageTypes.Error);
                    return false;
                }
            }

            /*CONSTRAINT	SewadarsRegistrations_CK_WeeklySewaLocationID_WeeklyDeparmentID
                CHECK	(	(	weekly_sewa_location_id	IS NOT NULL	AND	weekly_department_id	IS NOT NULL	)
                        OR	(	weekly_sewa_location_id	IS NULL		AND	weekly_department_id	IS NULL		)
                        )*/
            if ((!string.IsNullOrEmpty(this.weeklySewaLocationLookup.IdText) && !string.IsNullOrEmpty(this.weeklyZmsDepartmentsLookup.IdText))
                || (string.IsNullOrEmpty(this.weeklySewaLocationLookup.IdText) && string.IsNullOrEmpty(this.weeklyZmsDepartmentsLookup.IdText)))
            {
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.BothValuesAreRequired, "Weekly sewa location|Weekly department", MessageTypes.Error);
                return false;
            }
            return base.IsReadyToSave();
        }

        public override void CreateData()
        {
            string grNo = default(string);
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("DECLARE @a sewadar_grno ; EXEC GetSewadarRegistrationNumber '{0}', '{1}', '{2}', @a OUTPUT ;select @a ",
                            ZSMUtility.GetSatsangCentreId(), this.zsmGenderCombo1.SelectedValueAsStr, this.chkOutStationSewadar.BlnString)).Tables[0];
            if (dT.Rows.Count != 0)
            {
                grNo = dT.Rows[0][0].ToString();
                this.dbFacade.InsertSewadarsRegistration(this.getRegistrationSatsangCentreId(),
                                                grNo, this.intSewadarId.IdTextAsInteger,
                                                this.dtAppDate.DisplayTextAsDateTime, this.chkOutStationSewadar.BlnString,
                                                this.departmentChooser1.SelectedDepartment, this.departmentChooser1.SelectedSubDepartment,
                                                this.dtDepJoiningDate.DisplayTextAsDateTime, this.sewadarStatusCombo1.SelectedValueAsStr,
                                                this.dtmCurrentStatusDate.DisplayTextAsDateTime, this.responsibilityCombo1.SelectedValueAsStr,
                                                this.dtmResposibility.DisplayTextAsDateTime, this.ref1GrNoLookup1.IdTextAsInteger,
                                                this.relationsLookup1.IdTextAsShort,
                                                DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.txtRefName.DisplayText,
                                                DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.ref1ZsmSatsangCentresLookup.IdTextAsInteger,
                                                DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.txtRef1Department.DisplayText,
                                                this.ref2GrNoLookup1.IdTextAsInteger,
                                                this.relationsLookup2.IdTextAsShort,
                                                DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.txtRef2Name.DisplayText,
                                                DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.ref2ZsmSatsangCentresLookup.IdTextAsInteger,
                                                DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.txtRef2Department.DisplayText,
                                                this.sponSewadarIDLookup.IdTextAsInteger, this.areaSecCentreFunctionariesLookup.IdTextAsShort,
                                                this.secCentreFunctionariesLookup.IdTextAsShort, this.approvSewadarIDLookup.IdTextAsInteger,
                                                this.ssSewadarIDLookup.IdTextAsInteger, this.weeklySewaLocationLookup.IdTextAsInteger,
                                                this.weeklyZmsDepartmentsLookup.IdTextAsShort, "R", null, null);

                this.InfoMessageToShow = "The Generated GR. No. is : " + grNo;
                this.ObjectIdForLogOperation = ZSMUtility.GetSatsangCentreId().ToString() + "|" + grNo;
            }
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdateSewadarsRegistration(this.getRegistrationSatsangCentreId(),
                                            this.txtGRNo.DisplayText, this.intSewadarId.IdTextAsInteger,
                                            this.dtAppDate.DisplayTextAsDateTime, this.chkOutStationSewadar.BlnString,
                                            this.departmentChooser1.SelectedDepartment, this.departmentChooser1.SelectedSubDepartment,
                                            this.dtDepJoiningDate.DisplayTextAsDateTime, this.sewadarStatusCombo1.SelectedValueAsStr,
                                            this.dtmCurrentStatusDate.DisplayTextAsDateTime, this.responsibilityCombo1.SelectedValueAsStr,
                                            this.dtmResposibility.DisplayTextAsDateTime, this.ref1GrNoLookup1.IdTextAsInteger,
                                            this.relationsLookup1.IdTextAsShort,
                                            DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.txtRefName.DisplayText,
                                            DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.ref1ZsmSatsangCentresLookup.IdTextAsInteger,
                                            DbManager.IsNotNull(this.ref1GrNoLookup1.IdTextAsInteger) ? null : this.txtRef1Department.DisplayText,
                                            this.ref2GrNoLookup1.IdTextAsInteger,
                                            this.relationsLookup2.IdTextAsShort,
                                            DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.txtRef2Name.DisplayText,
                                            DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.ref2ZsmSatsangCentresLookup.IdTextAsInteger,
                                            DbManager.IsNotNull(this.ref2GrNoLookup1.IdTextAsInteger) ? null : this.txtRef2Department.DisplayText,
                                            this.sponSewadarIDLookup.IdTextAsInteger, this.areaSecCentreFunctionariesLookup.IdTextAsShort,
                                            this.secCentreFunctionariesLookup.IdTextAsShort, this.approvSewadarIDLookup.IdTextAsInteger,
                                            this.ssSewadarIDLookup.IdTextAsInteger, this.weeklySewaLocationLookup.IdTextAsInteger,
                                            this.weeklyZmsDepartmentsLookup.IdTextAsShort, "R", null, null, txn_ts);
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
                    this.dtmCurrentStatusDate, this.sewadarStatusCombo1, this.dtDepJoiningDate, this.departmentChooser1, this.chkOutStationSewadar);
            //Satsang Centre for 2 references (Weekly Satsang Centre), Satsang Centre for Sponsorer, Security Approver and Sewa Samiti 
            //(as per the parameter passed to Application), Satsang Centre for 2 secretaries (Weekly Satsang Centre). 
            //Sponsorer is required for Local Sewadars, and Area Secretary and Secretary are required for Outstation Sewadars. 
            string weekNm = DbManager.GetString(dT.Rows[0]["weekly_satsang_centre_nm"]);
            int? weekID = DbManager.GetNullableInteger(dT.Rows[0]["weekly_satsang_centre_id"]);
            this.sponSewadarLookup.Mandatory = true;
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
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.approvSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssGrNoLookup3_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sponGrNoLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.sponZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sewadarIDLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.approvSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssSewadarIDLookup2_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssSewadarLookup2_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sewadarLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.approvSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
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

        private void weeklySewaLocationLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "wsl.satsang_centre_id = " + getRegistrationSatsangCentreId());
        }


        private void chkOutStationSewadar_CheckedChanged(object sender, EventArgs e)
        {
            //Sponsorer is required for Local Sewadars, and Area Secretary and Secretary are required for Outstation Sewadars. 
            this.sponSewadarLookup.Mandatory = false;
            this.areaSecCentreFunctionariesLookup.Mandatory = false;
            this.secCentreFunctionariesLookup.Mandatory = false;
            if (this.CurrentUIMode == UIModes.Insert
                || this.CurrentUIMode == UIModes.New)
            {
                if (this.chkOutStationSewadar.Checked)
                {
                    this.areaSecCentreFunctionariesLookup.Mandatory = true;
                    this.secCentreFunctionariesLookup.Mandatory = true;
                }
                else
                {
                    this.sponSewadarLookup.Mandatory = true;
                }
            }
        }

        private void responsibilityCombo1_SelectedValueChanged(object sender, EventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                this.dtmResposibility.DisplayTextAsDateTime = (DbManager.IsNotNull(this.responsibilityCombo1.SelectedValue)) ? (DateTime?)DateTime.Now : null;
            }

            /*CONSTRAINT	SewadarsRegistrations_CK_Responsibility_ResponsibilityDt
                CHECK	(	(	responsibility	IS NOT NULL	AND	responsibility_dtm	IS NOT NULL	)
                        OR	(	responsibility	IS NULL		AND	responsibility_dtm	IS NULL		)
                        ),*/
            if (this.responsibilityCombo1.SelectedValue != null)
                this.dtmResposibility.Mandatory = true;
            else
                this.dtmResposibility.Mandatory = false;
        }

        private void weeklyZmsDepartmentsLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "dsc.satsang_centre_id = " + this.getRegistrationSatsangCentreId());
        }

        private void secCentreFunctionariesLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "f.centre_functionary = 'Secretary' AND f.satsang_centre_id = " + this.secZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void areaSecCentreFunctionariesLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "f.centre_functionary = 'Area Secretary' AND f.satsang_centre_id = " + this.areaSecZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sponSewadarIDLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.sponSewadarIDLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.sponSewadarLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.sponSewadarLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.sponSewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private void sponSewadarLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.sponSewadarLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.sponGrNoLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]));
                    this.sponGrNoLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.sponSewadarIDLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_id"]));
                    this.sponSewadarIDLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT sewadar_status_nm, responsibility, sewa_years=DATEDIFF(YEAR, appointment_dt, GETDATE()) FROM ViewSewadarHeader WHERE sewadar_id = " + this.sponSewadarLookup.IdText).Tables[0];
                    this.sponResponsibilityCombo.DisplayText = dT.Rows[0]["responsibility"].ToString();
                    this.sponStatus.DisplayText = dT.Rows[0]["sewadar_status_nm"].ToString();
                    this.sponIntYearsInSewa.DisplayText = dT.Rows[0]["sewa_years"].ToString();
                }
            }
        }

        private void sponGrNoLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.sponGrNoLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.sponSewadarLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.sponSewadarLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.sponSewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private void appGrNoLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.approvGrNoLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.approvSewadarNameLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.approvSewadarNameLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.appSewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private void appSewadarIDLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.approvSewadarIDLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.approvSewadarNameLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.approvSewadarNameLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.appSewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private void appSewadarLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.approvSewadarNameLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.approvGrNoLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]));
                    this.approvGrNoLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.approvSewadarIDLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_id"]));
                    this.approvSewadarIDLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT sewadar_status_nm, responsibility, sewa_years=DATEDIFF(YEAR, appointment_dt, GETDATE()) FROM ViewSewadarHeader WHERE sewadar_id = " + this.approvSewadarIDLookup.IdText).Tables[0];
                    this.approvResponsibilityCombo.DisplayText = dT.Rows[0]["responsibility"].ToString();
                    this.approvStatus.DisplayText = dT.Rows[0]["sewadar_status_nm"].ToString();
                    this.approvIntYearsInSewa.DisplayText = dT.Rows[0]["sewa_years"].ToString();
                }
            }
        }

        private void ssSewadarIDLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.ssSewadarIDLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssSewadarLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.ssSewadarLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.ssSewadarLookup2_LookupResultSet(null, e);
                }
            }
        }

        private void ssSewadarLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.ssSewadarLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssGrNoLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]));
                    this.ssGrNoLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.ssSewadarIDLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_id"]));
                    this.ssSewadarIDLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT sewadar_status_nm, responsibility, sewa_years=DATEDIFF(YEAR, appointment_dt, GETDATE()) FROM ViewSewadarHeader WHERE sewadar_id = " + this.ssSewadarIDLookup.IdText).Tables[0];
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
                if (!string.IsNullOrEmpty(this.ssGrNoLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.ssSewadarLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.ssSewadarLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.ssSewadarLookup2_LookupResultSet(null, e);
                }
            }
        }

        private void departmentChooser1_Load(object sender, EventArgs e)
        {

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

        private void dtDepJoiningDate_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (DbManager.IsNotNull(this.dtDepJoiningDate.DisplayTextAsDateTime))
            {
                if (this.dtDepJoiningDate.DisplayTextAsDateTime.Value >= DateTime.Now)
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
            if (DbManager.IsNotNull(this.dtAppDate.DisplayTextAsDateTime))
            {
                if (this.dtAppDate.DisplayTextAsDateTime.Value >= DateTime.Now)
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
                    this.areaSecCentreFunctionariesLookup.IdText = dT.Rows[0]["centre_functionary_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.areaSecCentreFunctionariesLookup, dT.Rows[0]["functionary_nm"].ToString());
                }
                this.secZsmSatsangCentresLookup.IdText = this.areaSecZsmSatsangCentresLookup.IdText;
                ZSMUtility.setDisplayValueText(this.secZsmSatsangCentresLookup, this.areaSecZsmSatsangCentresLookup.DisplayText);
                dT = dSet.Tables[1];
                if (dT.Rows.Count == 1)
                {
                    this.secCentreFunctionariesLookup.IdText = dT.Rows[0]["centre_functionary_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.secCentreFunctionariesLookup, dT.Rows[0]["functionary_nm"].ToString());
                }
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, " Appointment Date ", MessageTypes.Warning);
            }

        }

        private void txtName_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            //e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
            if (this.CurrentUIMode == UIModes.Insert)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "JOIN sewadars_details sd ON vs.sewadar_id = sd.sewadar_id WHERE vs.global_sewadar_status_cd IS NULL AND ");
            }
            else
            {
                e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "JOIN sewadars_details sd ON vs.sewadar_id = sd.sewadar_id WHERE");
            }
        }

        private void intSewadarId_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            //e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
            if (this.CurrentUIMode == UIModes.Insert)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "JOIN sewadars_details sd ON vs.sewadar_id = sd.sewadar_id WHERE vs.global_sewadar_status_cd IS NULL AND ");
            }
            else
            {
                e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "JOIN sewadars_details sd ON vs.sewadar_id = sd.sewadar_id WHERE");
            }
        }



    }
}
