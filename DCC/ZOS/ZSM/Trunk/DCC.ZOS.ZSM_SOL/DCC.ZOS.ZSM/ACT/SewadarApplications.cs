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
using System.Timers;
using DCC.UMB.CDF.UIControls.Grid.Column;
using DCC.UMB.CDF.Lookup.Modal;

namespace DCC.ZOS.ZSM.ACT
{

    public partial class SewadarApplications : ZSMAbstractScreen
    {
        DataTable remarksDT = null;
        private enum GrdListColumns
        {

            application_centre_id,
            application_status
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

        bool sewadarInformationRecorded = false;
        public SewadarApplications()
        {
            InitializeComponent();
            this.ref1SewadarIDLookup3.SttsCode = "SttsRefUse";
            this.ref2SewadarIDLookup3.SttsCode = "SttsRefUse";
            this.appSewadarIDLookup2.SttsCode = "SttsRefUse";
            this.ssSewadarIDLookup1.SttsCode = "SttsRefUse";
            //this.sewadarStatusCombo1.isGlobal = false;
            //this.addressBox.txtAddress1.Mandatory = false;
            this.ref2GrNoLookup1.SttsCode = "SttsRefUse";
            this.ref1GrNoLookup1.SttsCode = "SttsRefUse";
            this.ssSewadarIDLookup1.SttsCode = "SttsApprv";
            this.ref1SewadarIDLookup3.SttsCode = "SttsRefUse";
            this.ref2SewadarIDLookup3.SttsCode = "SttsRefUse";
            this.sponSewadarIDLookup3.SttsCode = "SttsApprv";
            this.ssSewadarIDLookup1.SttsCode = "SttsApprv";
            this.appSewadarIDLookup2.SttsCode = "SttsApprv";
            this.departmentChooser1.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
            this.ref1ZsmSatsangCentresLookup.ShowNonMainCentres = true;
            this.ref2ZsmSatsangCentresLookup.ShowNonMainCentres = true;
            this.areaSecZsmSatsangCentresLookup.ShowNonMainCentres = true;
            this.secZsmSatsangCentresLookup.ShowNonMainCentres = true;
        }

        public override string ScreenId { get { return Screens.ACT_SEWADARS_APPLICATIONS; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        public override void ClearControls()
        {
            ClearAllControlsOfContainer(this, true, this.lkpSatsangCentre);
            this.ssGrNoLookup1.ReadOnly = false;
            this.appGrNoLookup2.ReadOnly = false;
            AbstractScreen objCallingScreen = this.CallingScreen;
            if (DbManager.IsNotNull(objCallingScreen) && objCallingScreen.GetType() == typeof(Sewadars))
            {
                sewadarInformationRecorded = false;
            }
            else
            {
                sewadarInformationRecorded = true;
            }
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
            this.cmbAddressProof.SetDataSource(ZSMUtility.GetAddressProof(this.dbFacade), "address_proof", "address_proof");
            this.cmbOccupation.SetDataSource(ZSMUtility.GetOccupations(this.dbFacade), "occupation", "occupation");
        }

        private object getRemarkTypeSq(string remarkType)
        {
            foreach (DataRow item in this.remarksDT.Rows)
            {
                if (string.Compare(item["remarks_type"].ToString(), remarkType, true) == 0)
                {
                    return item["remarks_type_sq"];
                }
            }
            return null;
        }

        private void MakeEditableOnlyInQueryMode(bool isQueryMode)
        {
            this.lkpSatsangCentre.ReadOnly = !isQueryMode;
            this.intApplicationId.Lookup = isQueryMode;
            this.intApplicationId.ReadOnly = !isQueryMode;
        }

        private void FillDefaultValuesInInsertMode()
        {
            this.dtmApplicationStatus.DisplayTextAsDateTime = DateTime.Now;
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert || uiMode == UIModes.New)
            {
                ClearControls();
                FillDefaultValuesInInsertMode();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    this.setHeaderInNewMode(int.Parse(screenParameters));
                    populateDefaultValues();
                }
                else
                {
                    populateDefaultValues();
                    this.lkpSatsangCentre.IdText = ZSMUtility.GetSatsangCentreId().ToString();
                    ZSMUtility.setDisplayValueText(this.lkpSatsangCentre, ZSMUtility.GetSatsangCentreName());
                    this.applicationStatusCombo1.SelectedIndex = 1;

                }
            }
            else if (uiMode == UIModes.Query || uiMode == UIModes.Update)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    this.lkpSewadarId.DisplayText = screenParameters;
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

        protected override bool IsAValidScreenAction(string actionId)
        {
            bool retVal = false;
            if (this.grdList.CurrentRowIndex >= 0)
            {
                string currStatus = this.grdList.AsStr(GrdListColumns.application_status.ToString());
                switch (actionId)
                {
                    case "Verify":
                        retVal = (currStatus != "Processed");
                        break;
                    case "Process":
                        retVal = (currStatus == "Verified");
                        break;
                    case "Rejected":
                        retVal = (currStatus != "Processed");
                        break;
                    case "Mark Pending":
                        retVal = (currStatus != "Processed");
                        break;
                    case "Clear Error":
                        retVal = (currStatus == "Error");
                        break;
                }
            }
            return retVal && base.IsAValidScreenAction(actionId);
        }

        public override void ExecuteScreenAction(string actionId)
        {
            if (this.grdList.CurrentRowIndex >= 0)
            {
                string currStatus = this.grdList.AsStr(GrdListColumns.application_status.ToString());
                byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
                try
                {
                    switch (actionId)
                    {
                        case "Verify":
                            if (currStatus != "Processed")
                            {
                                this.dbFacade.BeginTrans();
                                this.dbFacade.SewadarApplicationVerify(Int32.Parse(this.intApplicationId.DisplayText));
                                this.dbFacade.CommitTrans();
                                UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                            }
                            break;
                        case "Process":
                            if (currStatus == "Verified")
                            {
                                this.dbFacade.BeginTrans();
                                this.dbFacade.SewadarApplicationProcess(Int32.Parse(this.intApplicationId.DisplayText));
                                this.dbFacade.CommitTrans();
                                UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                            }
                            break;
                        case "Rejected":
                            if (currStatus != "Processed")
                            {
                                if (string.IsNullOrEmpty(this.txtReason.DisplayText))
                                {
                                    UIManager.ShowMessage(MsgCodes.ValueReqd, "Reason not specified.", MessageTypes.Error);
                                }
                                else
                                {
                                    this.dbFacade.BeginTrans();
                                    this.dbFacade.SewadarApplicationReject(Int32.Parse(this.intApplicationId.DisplayText), this.txtReason.DisplayText);
                                    this.dbFacade.CommitTrans();
                                    UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                                }
                            }
                            break;
                        case "Mark Pending":
                            if (currStatus != "Processed")
                            {
                                if (string.IsNullOrEmpty(this.txtReason.DisplayText))
                                {
                                    UIManager.ShowMessage(MsgCodes.ValueReqd, "Reason not specified.", MessageTypes.Error);
                                }
                                else
                                {
                                    this.dbFacade.BeginTrans();
                                    this.dbFacade.SewadarApplicationMarkPending(Int32.Parse(this.intApplicationId.DisplayText), this.txtReason.DisplayText);
                                    this.dbFacade.CommitTrans();
                                    UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                                }

                            }
                            break;
                        case "Clear Error":
                            if (currStatus == "Error")
                            {
                                this.dbFacade.BeginTrans();
                                this.dbFacade.SewadarApplicationClearError(Int32.Parse(this.intApplicationId.DisplayText));
                                this.dbFacade.CommitTrans();
                                UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                            }
                            break;
                        default:
                            break;
                    }
                }
                catch (Exception e)
                {
                    this.dbFacade.RollbackTrans();
                    throw e;
                }
            }
        }

        private void LoadGrids()
        {
            dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarApplicationOtherDisabilitieAsTask(Int32.Parse(this.intApplicationId.DisplayText)));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarApplicationQualificationAsTask(Int32.Parse(this.intApplicationId.DisplayText)));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarApplicationSkillAsTask(Int32.Parse(this.intApplicationId.DisplayText)));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT = dSet.Tables[0];
            this.grdMedicalDisab.RetrieveRecords(dT, false, RowStates.Old);
            dT = dSet.Tables[1];
            this.grdQualifications.RetrieveRecords(dT, false, RowStates.Old);
            dT = dSet.Tables[2];
            this.grdSkills.RetrieveRecords(dT, false, RowStates.Old);
        }

        public override bool IsReadyToSave()
        {

            if (this.CurrentUIMode == UIModes.Insert)
            {
                /*
            CONSTRAINT	SewadarApplications_CK_InitiationDetails
                CHECK	(	(	initiation_dt	IS NOT NULL	AND initiation_place_id	IS NOT NULL	AND initiation_by	IS NOT NULL	)
                        OR	(	initiation_dt	IS NULL		AND initiation_place_id	IS NULL		AND initiation_by	IS NULL		)
                        ),
                        */
                /*

    CONSTRAINT	SewadarApplications_CK_PhotoID_PhotoDate
        CHECK	(	(	initiation_dt	IS NOT NULL	AND initiation_place_id	IS NOT NULL	AND initiation_by	IS NOT NULL	)
                OR	(	initiation_dt	IS NULL		AND initiation_place_id	IS NULL		AND initiation_by	IS NULL		)
                ),
                */
                /*
    CONSTRAINT	SewadarApplications_CK_AddressProof_OtherAddressProof
        CHECK	(	(	address_proof	IS NOT NULL	AND	other_address_proof_id	IS NULL		)
                OR	(	address_proof	IS NULL		AND	other_address_proof_id	IS NOT NULL	)
                ),
                */
                /*
    CONSTRAINT	SewadarApplications_CK_Reference1_SewadarID_GRNo_ReferenceName_Department
        CHECK	(	(	reference_1_sewadar_id	IS	NOT	NULL	)
                OR	(	reference_1_sewadar_id	IS		NULL	AND	reference_1_grno	IS	NOT	NULL	AND	reference_1_nm	IS	NOT	NULL	AND	reference_1_department	IS	NOT	NULL	)
                ),
                        */
                if ((!string.IsNullOrEmpty(this.ref1SewadarIDLookup3.IdText) && !string.IsNullOrEmpty(this.relationsLookup1.IdText))
                    || (string.IsNullOrEmpty(this.ref1SewadarIDLookup3.IdText) && !string.IsNullOrEmpty(this.relationsLookup1.IdText) &&
                    !string.IsNullOrEmpty(this.txtRefName.DisplayText) && !string.IsNullOrEmpty(this.ref1GrNoLookup1.DisplayText) && !string.IsNullOrEmpty(this.txtRef1Department.DisplayText)))
                {
                }
                else
                {
                    UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Reference 1 Sewadar should be identified|his/her Name, Centre and Department", MessageTypes.Error);
                    return false;
                }
                /*
    CONSTRAINT	SewadarApplications_CK_Reference2_SewadarID_GRNo_ReferenceName_Department
    CHECK	(	(	reference_2_sewadar_id	IS	NOT	NULL	)
        OR	(	reference_2_sewadar_id	IS		NULL	AND	reference_2_grno	IS	NOT	NULL	AND	reference_2_nm	IS	NOT	NULL	AND	reference_2_department	IS	NOT	NULL	)
        ),
                        */
                if ((!string.IsNullOrEmpty(this.ref2SewadarIDLookup3.IdText) && !string.IsNullOrEmpty(this.relationsLookup2.IdText))
    || (string.IsNullOrEmpty(this.ref2SewadarIDLookup3.IdText) && !string.IsNullOrEmpty(this.relationsLookup2.IdText) && !string.IsNullOrEmpty(this.txtRef2Name.DisplayText) && !string.IsNullOrEmpty(this.ref2GrNoLookup1.DisplayText) && !string.IsNullOrEmpty(this.txtRef2Department.DisplayText)))
                {
                }
                else
                {
                    UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Reference 2 Sewadar should be identified|his/her Name, Centre and Department", MessageTypes.Error);
                    return false;
                }


                if (this.chkOutStationSewadar.Checked)
                {
                    if ((!string.IsNullOrEmpty(this.areaSecRegisteredSewadarIDLookup2.IdText))
        || (string.IsNullOrEmpty(this.areaSecRegisteredSewadarIDLookup2.IdText) && !string.IsNullOrEmpty(this.areaSecZsmSatsangCentresLookup.IdText) && !string.IsNullOrEmpty(this.areaSecGrNoLookup2.DisplayText) && !string.IsNullOrEmpty(this.areaSecName.DisplayText)))
                    {
                    }
                    else
                    {
                        UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Area Secretary should be identified|his/her Name, Satsang centre and GR No.", MessageTypes.Error);
                        return false;
                    }


                    if ((!string.IsNullOrEmpty(this.secRegisteredSewadarIDLookup1.IdText))
        || (string.IsNullOrEmpty(this.secRegisteredSewadarIDLookup1.IdText) && !string.IsNullOrEmpty(this.secZsmSatsangCentresLookup.IdText) && !string.IsNullOrEmpty(this.secGRNoLookup1.DisplayText) && !string.IsNullOrEmpty(this.secName.DisplayText)))
                    {
                    }
                    else
                    {
                        UIManager.ShowMessage(MsgCodes.OneOfTwoValuesOnly, "Secretary should be identified|his/her Name, Satsang centre and GR No.", MessageTypes.Error);
                        return false;
                    }
                }
            }
            if (this.CurrentUIMode == UIModes.Browse)
            {
                if (applicationStatusCombo1.DisplayText == "Processed")
                {
                    UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Update of record|application status is processed", MessageTypes.Error);
                    return false;
                }
            }
            return base.IsReadyToSave();
        }


        public void populateDefaultValues()
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask("SELECT c.country_cd, c.country_id, c.country_nm FROM satsang_centres_details scd JOIN system_information_values siv ON  scd.centre_alphabet + 'DflCntry' = siv.system_info_cd JOIN CDB..countries c ON c.country_id = siv.value_int WHERE scd.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
            this.dbFacade.AddDbTask("SELECT c.state_cd, c.state_id, c.state_nm FROM satsang_centres_details scd JOIN system_information_values siv ON  scd.centre_alphabet + 'DflState' = siv.system_info_cd JOIN CDB..states c ON c.state_id = siv.value_int WHERE scd.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
            this.dbFacade.AddDbTask("SELECT c.district_cd, c.district_nm, c.district_or_city_id FROM satsang_centres_details scd JOIN system_information_values siv ON  scd.centre_alphabet + 'DflDstrct' = siv.system_info_cd JOIN CDB..districts_or_cities c ON c.district_or_city_id = siv.value_int WHERE scd.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT1 = dSet.Tables[0];
            DataTable dT2 = dSet.Tables[1];
            DataTable dT3 = dSet.Tables[2];
            if (dT1.Rows.Count == 1 && string.IsNullOrEmpty(this.addressBox.CountryLookup.IdText))
                this.addressBox.setCountry(dT1.Rows[0]["country_id"].ToString(), dT1.Rows[0]["country_nm"].ToString());
            if (dT2.Rows.Count == 1 && string.IsNullOrEmpty(this.addressBox.StateLookup.IdText))
                this.addressBox.setState(dT2.Rows[0]["state_id"].ToString(), dT2.Rows[0]["state_nm"].ToString());
            if (dT3.Rows.Count == 1 && string.IsNullOrEmpty(this.addressBox.DistrictorCitiesLookup.IdText))
                this.addressBox.setDistrict(dT3.Rows[0]["district_or_city_id"].ToString(), dT3.Rows[0]["district_nm"].ToString());
        }

        public override void LoadBrowseView(int rowIndex)
        {
            MakeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.tabControl1, this.grdMedicalDisab, this.grdQualifications, this.grdSkills);
            LoadGrids();
            //ZSMUtility.LoadOnlySewadarImageFromDBToPictureBox(this.lkpSewadarId.IdTextAsInteger, ref this.pictureBox1);
            populateDefaultValues();
            this.ObjectIdForLogOperation = this.intApplicationId.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarApplicationSQLSelectQuery query = new ViewSewadarApplicationSQLSelectQuery();

            //This line avoids the if condition and specifies that sewadar_id is a primary/indexed key.
            query.application_id.IsExcluisive = true;
            query.application_id.Equal(this.intApplicationId.DisplayText);
            query.registered_sewadar_id.Equal(this.lkpSewadarId.DisplayText);
            query.first_nm.Contains(this.txtFirstName.DisplayText);
            query.last_nm.Contains(this.txtSurName.DisplayText);
            query.gender.Equal(this.cmbGender.SelectedValue);
            query.address_line_1.Contains(this.addressBox.txtAddress1.DisplayText);
            query.address_line_2.Contains(this.addressBox.txtAddress2.DisplayText);
            query.country_id.Equal(this.addressBox.CountryLookup.IdText);
            query.state_id.Equal(this.addressBox.StateLookup.IdText);
            query.district_or_city_id.Equal(this.addressBox.DistrictorCitiesLookup.IdText);
            query.post_office_or_city_id.Equal(this.addressBox.postOfficeOrCityLookup.IdText);
            query.pin_or_zip_code.Contains(this.addressBox.txtPin.DisplayText);

            query.telephone_mobile.Contains(this.txtMobilePh.DisplayText);
            query.telephone_office.Contains(this.txtOffPh.DisplayText);
            query.telephone_residence.Contains(this.txtResidencePh.DisplayText);
            query.occupation.Equal(this.cmbOccupation.SelectedValue);
            query.weekly_satsang_centre_id.Equal(this.lkpWeeklySatsangCentre.IdText);

            query.is_diabetic.Equal(this.cmbDiabetic.SelectedValue);
            query.has_epillepsy.Equal(this.cmbEpillepsy.SelectedValue);
            query.has_hypertension.Equal(this.cmbHypertension.SelectedValue);
            query.has_skin_problem.Equal(this.cmbSkinProblem.SelectedValue);

            query.registered_sewadar_grno.Equal(this.txtGRNo.DisplayText);
            query.appointment_dt.Between(this.dtAppDate);
            query.other_address_proof_nm.Contains(this.otherAddressProofLookup1.DisplayText);
            query.attends_weekly_satsang.Equal(this.cmbAttendsWeeklySatsang.SelectedValue);
            query.address_proof.Equal(ZSMUtility.EscapeSingleQuote(this.cmbAddressProof.SelectedValue));
            return dbFacade.ExecuteSelectQuery(query);
        }


        void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            ((System.Timers.Timer)sender).Stop();
            UIManager.ShowMessage(MsgCodes.ProcessMsg, "Sewadar Details Saved. Launched Sewadar Information Screen for Sewadar Id: " + this.lkpSewadarId.DisplayText + " ...", MessageTypes.Plain);
        }

        public override void Save()
        {
            base.Save();
            //[[After completing of saving of screen open Sewadars Details
            if ((this.CurrentUIMode == UIModes.Insert || this.CurrentUIMode == UIModes.New)
                && !this.sewadarInformationRecorded)
            {
                if (!string.IsNullOrEmpty(this.intApplicationId.DisplayText))
                {
                    this.sewadarInformationRecorded = true;
                    UIManager.OpenForm(typeof(SewadarsInformation), UIModes.New,
                        GlobalAppVariables.AppContext.ApplicationId,
                        this.intApplicationId.DisplayText, this, this.grdSkills
                        );
                    System.Timers.Timer timer = new System.Timers.Timer(500);//start a timer to print a delayed message to user, the exception below will break CDF save sequence
                    timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
                    timer.Start();
                    //[[Throw excepiton to override the default behavior of CDF, which essentially is to reopen
                    //the screen in insert mode
                    throw new Exception("");//Exception with no message would prevent it to be displayed to user.
                    //]]
                }
            }
            //]]
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
                overiddingParamValues.Add("sewadar_application_id", sewadarId);
                //allTasks = this.grdQualifications.GetAllDBTasks(this.dbFacade, "DeleteSewadarApplicationQualificationAsTask", "UpdateSewadarApplicationQualificationAsTask", "InsertSewadarApplicationQualificationAsTask", overiddingParamValues, "qualification_sq", "UpdateSewadarApplicationQualificationSqAsTask", "MakeSewadarApplicationQualificationSqPositiveAsTask");
                allTasks = this.grdQualifications.GetAllDBTasks(this.dbFacade, "DeleteSewadarApplicationQualificationAsTask", "UpdateSewadarApplicationQualificationAsTask", "InsertSewadarApplicationQualificationAsTask", overiddingParamValues, "qualification_sq", null, null);
                allTasks.AddRange(this.grdSkills.GetAllDBTasks(this.dbFacade, "DeleteSewadarApplicationSkillAsTask", "UpdateSewadarApplicationSkillAsTask", "InsertSewadarApplicationSkillAsTask", overiddingParamValues, "skill_sq", null, null));
                allTasks.AddRange(this.grdMedicalDisab.GetAllDBTasks(this.dbFacade, "DeleteSewadarApplicationOtherDisabilitieAsTask", "UpdateSewadarApplicationOtherDisabilitieAsTask", "InsertSewadarApplicationOtherDisabilitieAsTask", overiddingParamValues, "medical_disability_sq", null, null));

                return allTasks;
            }
            catch
            {
                throw;
            }
        }

        public override void CreateData()
        {
            int appId = 0;
            this.dbFacade.InsertSewadarApplication(ref appId,
                                            this.lkpSatsangCentre.IdTextAsInteger,
                                            this.dtAppDate.DisplayTextAsDateTime,
                                            this.applicationStatusCombo1.SelectedValueAsStr,
                                            this.dtmApplicationStatus.DisplayTextAsDateTime,
                                            this.txtFirstName.DisplayText,
                                            this.txtMiddleName.DisplayText,
                                            this.txtSurName.DisplayText,
                                            this.cmbGender.SelectedValueAsStr,
                                            this.dtmBirthDate.DisplayTextAsDateTime,
                                            this.chkMarried.BlnString,
                                            this.dtInitiation.DisplayTextAsDateTime,
                                            this.lkpInitiationPlaces.IdTextAsShort,
                                            this.cboPatron.SelectedValueAsByte,
                                            this.addressBox.txtAddress1.DisplayText,
                                            this.addressBox.txtAddress2.DisplayText,
                                            this.addressBox.postOfficeOrCityLookup.IdTextAsInteger,
                                            this.addressBox.txtPin.DisplayText,
                                            this.cmbAddressProof.SelectedValueAsStr,
                                            this.otherAddressProofLookup1.IdTextAsShort,
                                            this.txtMobilePh.DisplayText, this.txtResidencePh.DisplayText,
                                            this.txtOffPh.DisplayText, this.cmbOccupation.SelectedValueAsStr,
                                            this.cmbAttendsWeeklySatsang.SelectedValueAsStr, this.lkpWeeklySatsangCentre.IdTextAsInteger,
                                            this.cmbHypertension.SelectedValueAsStr,
                                            this.cmbDiabetic.SelectedValueAsStr,
                                            this.cmbSkinProblem.SelectedValueAsStr, this.cmbEpillepsy.SelectedValueAsStr,
                                            this.intPhotoId.DisplayText,
                                            this.dtPhotoDate.DisplayTextAsDateTime,
                                            this.dtAppDate.DisplayTextAsDateTime,
                                            this.chkOutStationSewadar.BlnString,
                                            this.departmentChooser1.SelectedDepartment,
                                            this.departmentChooser1.SelectedSubDepartment,
                                            this.txtOldGRNo.DisplayText,

                                            this.ref1SewadarIDLookup3.IdTextAsInteger,
                                            DbManager.IsNotNull(this.ref1SewadarIDLookup3.IdTextAsInteger) ? this.ref1GrNoLookup1.DisplayText : null,
                                            this.relationsLookup1.IdTextAsShort,
                                            DbManager.IsNotNull(this.ref1SewadarIDLookup3.IdTextAsInteger) ? this.txtRefName.DisplayText : null,
                                            this.ref1ZsmSatsangCentresLookup.IdTextAsInteger,
                                            DbManager.IsNotNull(this.ref1SewadarIDLookup3.IdTextAsInteger) ? this.txtRef1Department.DisplayText : null,

                                            this.ref2SewadarIDLookup3.IdTextAsInteger,
                                            DbManager.IsNotNull(this.ref2SewadarIDLookup3.IdTextAsInteger) ? this.ref2GrNoLookup1.DisplayText : null,
                                            this.relationsLookup2.IdTextAsShort,
                                            DbManager.IsNotNull(this.ref2SewadarIDLookup3.IdTextAsInteger) ? this.txtRef2Name.DisplayText : null,
                                            this.ref2ZsmSatsangCentresLookup.IdTextAsInteger,
                                            DbManager.IsNotNull(this.ref2SewadarIDLookup3.IdTextAsInteger) ? this.txtRef2Department.DisplayText : null,

                                            this.appSewadarIDLookup2.IdTextAsInteger,
                                            this.appMainSatsangCentresLookup2.IdTextAsInteger,
                                            this.appGrNoLookup2.DisplayText,
                                            DbManager.IsNotNull(this.appSewadarIDLookup2.IdTextAsInteger) ? this.appSecurityName.DisplayText : null,


                                            this.ssSewadarIDLookup1.IdTextAsInteger,
                                            this.ssMainSatsangCentresLookup1.IdTextAsInteger,
                                            this.ssGrNoLookup1.DisplayText,
                                            DbManager.IsNotNull(this.ssSewadarIDLookup1.IdTextAsInteger) ? this.ssSewadarName.DisplayText : null,

                                            this.areaSecRegisteredSewadarIDLookup2.IdTextAsShort,
                                            this.areaSecZsmSatsangCentresLookup.IdTextAsInteger,
                                            String.IsNullOrEmpty(this.areaSecGrNoLookup2.DisplayText) ? null : this.areaSecGrNoLookup2.DisplayText,
                                            String.IsNullOrEmpty(this.areaSecName.DisplayText) ? areaSecRegisteredSewadarIDLookup2.DisplayText : this.areaSecName.DisplayText,

                                            this.secRegisteredSewadarIDLookup1.IdTextAsShort,
                                            this.secZsmSatsangCentresLookup.IdTextAsInteger,
                                            String.IsNullOrEmpty(this.secGRNoLookup1.DisplayText) ? null : this.secGRNoLookup1.DisplayText,
                                            String.IsNullOrEmpty(this.secName.DisplayText) ? secRegisteredSewadarIDLookup1.DisplayText : this.secName.DisplayText,

                                            this.sponSewadarIDLookup3.IdTextAsInteger,
                                            this.sponMainSatsangCentresLookup3.IdTextAsInteger,
                                            this.sponGRNoLookup3.DisplayText,
                                            DbManager.IsNotNull(this.sponSewadarIDLookup3.IdTextAsInteger) ? this.txtSponsorerName.DisplayText : null,
                                            DbManager.IsNotNull(this.sponSewadarIDLookup3.IdTextAsInteger) ? this.txtSponDepartment.DisplayText : null,

                                            this.txtRemarks.DisplayText,
                                            this.txtReason.DisplayText,
                                            null,
                                            null);
            this.ObjectIdForLogOperation = appId.ToString();
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.AddDbTasks(SaveGridsAsTask(appId));
            this.dbFacade.ExecuteDbTasks();
            DialogResult result = MessageBox.Show(this, "Generated application id is : " + appId.ToString(),
                          "Information",
                          MessageBoxButtons.OK, MessageBoxIcon.Exclamation,
                          MessageBoxDefaultButton.Button1);

            //]] 

        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdateSewadarApplication(Int32.Parse(this.intApplicationId.DisplayText),
                                  this.lkpSatsangCentre.IdTextAsInteger,
                                  this.dtAppDate.DisplayTextAsDateTime,
                                  this.applicationStatusCombo1.SelectedValueAsStr,
                                  this.dtmApplicationStatus.DisplayTextAsDateTime,
                                  this.txtFirstName.DisplayText,
                                  this.txtMiddleName.DisplayText,
                                  this.txtSurName.DisplayText,
                                  this.cmbGender.SelectedValueAsStr,
                                  this.dtmBirthDate.DisplayTextAsDateTime,
                                  this.chkMarried.BlnString,
                                  this.dtInitiation.DisplayTextAsDateTime,
                                  this.lkpInitiationPlaces.IdTextAsShort,
                                  this.cboPatron.SelectedValueAsByte,
                                  this.addressBox.txtAddress1.DisplayText,
                                  this.addressBox.txtAddress2.DisplayText,
                                  this.addressBox.postOfficeOrCityLookup.IdTextAsInteger,
                                  this.addressBox.txtPin.DisplayText,
                                  this.cmbAddressProof.SelectedValueAsStr,
                                  this.otherAddressProofLookup1.IdTextAsShort,
                                  this.txtMobilePh.DisplayText, this.txtResidencePh.DisplayText,
                                  this.txtOffPh.DisplayText, this.cmbOccupation.SelectedValueAsStr,
                                  this.cmbAttendsWeeklySatsang.SelectedValueAsStr, this.lkpWeeklySatsangCentre.IdTextAsInteger,
                                  this.cmbHypertension.SelectedValueAsStr,
                                  this.cmbDiabetic.SelectedValueAsStr,
                                  this.cmbSkinProblem.SelectedValueAsStr, this.cmbEpillepsy.SelectedValueAsStr,
                                  this.intPhotoId.DisplayText,
                                  this.dtPhotoDate.DisplayTextAsDateTime,
                                  this.dtAppointment.DisplayTextAsDateTime,
                                  this.chkOutStationSewadar.BlnString,
                                  this.departmentChooser1.SelectedDepartment,
                                  this.departmentChooser1.SelectedSubDepartment,
                                  this.txtOldGRNo.DisplayText,

                                  this.ref1SewadarIDLookup3.IdTextAsInteger,
                                  DbManager.IsNotNull(this.ref1SewadarIDLookup3.IdTextAsInteger) ? this.ref1GrNoLookup1.DisplayText : null,
                                  this.relationsLookup1.IdTextAsShort,
                                  DbManager.IsNotNull(this.ref1SewadarIDLookup3.IdTextAsInteger) ? this.txtRefName.DisplayText : null,
                                  this.ref1ZsmSatsangCentresLookup.IdTextAsInteger,
                                  DbManager.IsNotNull(this.ref1SewadarIDLookup3.IdTextAsInteger) ? this.txtRef1Department.DisplayText : null,

                                  this.ref2SewadarIDLookup3.IdTextAsInteger,
                                  DbManager.IsNotNull(this.ref2SewadarIDLookup3.IdTextAsInteger) ? this.ref2GrNoLookup1.DisplayText : null,
                                  this.relationsLookup2.IdTextAsShort,
                                  DbManager.IsNotNull(this.ref2SewadarIDLookup3.IdTextAsInteger) ? this.txtRef2Name.DisplayText : null,
                                  this.ref2ZsmSatsangCentresLookup.IdTextAsInteger,
                                  DbManager.IsNotNull(this.ref2SewadarIDLookup3.IdTextAsInteger) ? this.txtRef2Department.DisplayText : null,

                                  this.appSewadarIDLookup2.IdTextAsInteger,
                                  this.appMainSatsangCentresLookup2.IdTextAsInteger,
                                  this.appGrNoLookup2.DisplayText,
                                  DbManager.IsNotNull(this.appSewadarIDLookup2.IdTextAsInteger) ? this.appSecurityName.DisplayText : null,

                                  this.ssSewadarIDLookup1.IdTextAsInteger,
                                  this.ssMainSatsangCentresLookup1.IdTextAsInteger,
                                  this.ssGrNoLookup1.DisplayText,
                                  DbManager.IsNotNull(this.ssSewadarIDLookup1.IdTextAsInteger) ? this.ssSewadarName.DisplayText : null,

                                  this.areaSecRegisteredSewadarIDLookup2.IdTextAsShort,
                                  this.areaSecZsmSatsangCentresLookup.IdTextAsInteger,
                                  String.IsNullOrEmpty(this.areaSecGrNoLookup2.DisplayText) ? null : this.areaSecGrNoLookup2.DisplayText,
                                  String.IsNullOrEmpty(this.areaSecName.DisplayText) ? areaSecRegisteredSewadarIDLookup2.DisplayText : this.areaSecName.DisplayText,

                                  this.secRegisteredSewadarIDLookup1.IdTextAsShort,
                                  this.secZsmSatsangCentresLookup.IdTextAsInteger,
                                  String.IsNullOrEmpty(this.secGRNoLookup1.DisplayText) ? null : this.secGRNoLookup1.DisplayText,
                                  String.IsNullOrEmpty(this.secName.DisplayText) ? secRegisteredSewadarIDLookup1.DisplayText : this.secName.DisplayText,

                                  this.sponSewadarIDLookup3.IdTextAsInteger,
                                  this.sponMainSatsangCentresLookup3.IdTextAsInteger,
                                  this.sponGRNoLookup3.DisplayText,
                                  DbManager.IsNotNull(this.sponSewadarIDLookup3.IdTextAsInteger) ? this.txtSponsorerName.DisplayText : null,
                                  DbManager.IsNotNull(this.sponSewadarIDLookup3.IdTextAsInteger) ? this.txtSponDepartment.DisplayText : null,

                                  this.txtRemarks.DisplayText,
                                  this.txtReason.DisplayText,
                                  null,
                                  null,
                                  txn_ts);
            this.ObjectIdForLogOperation = this.intApplicationId.DisplayText;
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.AddDbTasks(SaveGridsAsTask(Int32.Parse(this.intApplicationId.DisplayText)));
            this.dbFacade.ExecuteDbTasks();
            //]] 

        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteSewadarApplication(Int32.Parse(this.intApplicationId.DisplayText), txn_ts);
            return true;
        }

        private void setHeaderInNewMode(int? sewadarId)
        {
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select * from ViewSewadarHeader where sewadar_id = " + sewadarId).Tables[0];
            this.LoadDataToContainer(dT, this.tlpTop);
        }

        private void sewadarLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                //this.setHeaderInNewMode(this.txtName.IdTextAsInteger);
            }
        }

        private void lkpSewadarId_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.lkpSewadarId.DisplayText))
                {
                    //ZSMUtility.setDisplayValueText(this.txtName, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    //this.txtName.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.sewadarLookup1_LookupResultSet(null, e);
                }
            }
        }


        private void CloseWhenCalledFromSewadar()
        {
            AbstractScreen objCallingScreen = this.CallingScreen;
            if (DbManager.IsNotNull(objCallingScreen) && objCallingScreen.GetType() == typeof(Sewadars))
            {
                GlobalAppVariables.ObjMDIMain.CloseCurrentScreen();
                //[[ default value is LookupReturnModes.None;
                LookupResult result = new LookupResult();
                //]]
                objCallingScreen.SetLookupResult(result, ((Sewadars)objCallingScreen).GetRemarksGrid());
            }

        }

        public override void SetLookupResult(DCC.UMB.CDF.Lookup.Modal.LookupResult result, System.Windows.Forms.Control targetControl)
        {
            base.SetLookupResult(result, targetControl);
            if (targetControl == this.grdSkills)//which means that the called screen has returned back
            {
                //[[If the called screen has return by none mode, i.e. user chose to not to record
                //values in the part, and closed the screen
                if (this.CurrentUIMode == UIModes.Insert || this.CurrentUIMode == UIModes.New)
                {
                    CloseWhenCalledFromSewadar();
                }
            }
        }

        private void lkpWeeklySatsangCentre_LookupDialogShowing_1(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "satsang_centre_type IN ('CENTRE', 'SUB CENTRE', 'POINT')");
        }

        private void grdQualifications_LookupDialogShowing(object sender, LookupEventArgs e)
        {

            if (this.grdQualifications.CurrentColumnName == "qlfctn_subject_id")
            {
                string qualificationName =
                    grdQualifications.AsStr("qualification_id", grdQualifications.CurrentRowIndex);
                e.LookupSqlString = e.LookupSqlString.Replace("%qualification_nm%", qualificationName);
            }
        }

        private void tlpSec_Paint(object sender, PaintEventArgs e)
        {

        }

        private void secZsmSatsangCentresLookup_Load(object sender, EventArgs e)
        {

        }

        private void dccLabel4_Click(object sender, EventArgs e)
        {

        }

        private void dccTableLayoutPanel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dtmBirthDate_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (DbManager.IsNotNull(this.dtmBirthDate.DisplayTextAsDateTime))
            {
                if (this.dtmBirthDate.DisplayTextAsDateTime.Value.Year <= 1753)
                {
                    UIManager.ShowMessage(MsgCodes.GreaterOrEqualValueReqd, "Birth Date|" + "1753|");
                    e.Cancel = true;
                }
                else if (this.dtmBirthDate.DisplayTextAsDateTime.Value >= DateTime.Now)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, this.dtmBirthDate.DisplayText + "| DOB ");
                    e.Cancel = true;
                }
                else
                {
                    this.intAge.DisplayText = (DateTime.Now.Year - this.dtmBirthDate.DisplayTextAsDateTime.Value.Year).ToString();
                }
            }

        }

        private void dtInitiation_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (this.dtInitiation.DisplayTextAsDateTime.HasValue)
                {
                    if (this.dtInitiation.DisplayTextAsDateTime.Value > DateTime.Now)
                    {
                        UIManager.ShowMessage(MsgCodes.InvalidValue, this.dtInitiation.DisplayText + "| Initiation Date ");
                        e.Cancel = true;
                    }
                    else if (this.dtInitiation.DisplayTextAsDateTime.Value.Year <= dtmBirthDate.DisplayTextAsDateTime.Value.Year)
                    {
                        UIManager.ShowMessage(MsgCodes.GreaterValueReqd, "Initiation Date|" + "Birth Date|");
                        e.Cancel = true;
                    }
                }
            }
        }

        private void dtInitiation_Validated(object sender, EventArgs e)
        {
            var dateTime = dtInitiation.DisplayTextAsDateTime;
            if (dateTime.HasValue)
            {
                var correctedDate = new DateTime(dateTime.Value.Year, dateTime.Value.Month, dateTime.Value.Day, 0, 0, 0);
                dtInitiation.DisplayTextAsDateTime = correctedDate;
            }
        }

        private void dtmBirthDate_Validated(object sender, EventArgs e)
        {
            var dateTime = dtmBirthDate.DisplayTextAsDateTime;
            if (dateTime.HasValue)
            {
                var correctedDate = new DateTime(dateTime.Value.Year, dateTime.Value.Month, dateTime.Value.Day, 0, 0, 0);
                dtmBirthDate.DisplayTextAsDateTime = correctedDate;
            }
        }

        private void sponMainSatsangCentresLookup3_Load(object sender, EventArgs e)
        {

        }

        private void ref1SewadarIDLookup3_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ref1ZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ref2SewadarIDLookup3_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ref2ZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void sponSewadarIDLookup3_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.sponMainSatsangCentresLookup3.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void appSewadarIDLookup2_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.appMainSatsangCentresLookup2.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void ssSewadarIDLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.ssMainSatsangCentresLookup1.IdTextAsInteger.GetValueOrDefault(0));
        }

        private void secRegisteredSewadarIDLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", string.Format("f.centre_functionary = 'Secretary' AND f.satsang_centre_id = {0}  AND ('{1}' BETWEEN f.effective_from AND f.effective_till)", this.secZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0), this.dtAppDate.DisplayText));
        }

        private void areaSecRegisteredSewadarIDLookup2_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", string.Format("f.centre_functionary = 'Area Secretary' AND f.satsang_centre_id = {0}  AND ('{1}' BETWEEN f.effective_from AND f.effective_till)", this.areaSecZsmSatsangCentresLookup.IdTextAsInteger.GetValueOrDefault(0), this.dtAppDate.DisplayText));
        }

        private void secZsmSatsangCentresLookup_LookupResultSet(object sender, LookupResultEventArgs e)
        {

        }

        private void appSewadarIDLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.appSewadarIDLookup2.IdText))
            {
                this.appGrNoLookup2.ReadOnly = true;
                this.appGrNoLookup2.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]);
                this.appSecurityName.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]);
            }
            else
            {
                this.appGrNoLookup2.ReadOnly = false;
            }
        }

        private void ssSewadarIDLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.ssSewadarIDLookup1.IdText))
            {
                this.ssGrNoLookup1.ReadOnly = true;
                this.ssGrNoLookup1.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]);
                this.ssSewadarName.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]);
            }
            else
            {
                this.ssGrNoLookup1.ReadOnly = false;
            }
        }

        private void chkOutStationSewadar_CheckedChanged(object sender, EventArgs e)
        {

            this.secRegisteredSewadarIDLookup1.ReadOnly = false;
            this.secZsmSatsangCentresLookup.ReadOnly = false;
            this.secGRNoLookup1.ReadOnly = false;
            this.secName.ReadOnly = false;
            this.areaSecRegisteredSewadarIDLookup2.ReadOnly = false;
            this.areaSecZsmSatsangCentresLookup.ReadOnly = false;
            this.areaSecGrNoLookup2.ReadOnly = false;
            this.areaSecName.ReadOnly = false;
            this.sponMainSatsangCentresLookup3.Mandatory = false;
            this.sponGRNoLookup3.Mandatory = false;

            this.sponSewadarIDLookup3.ReadOnly = false;
            this.sponMainSatsangCentresLookup3.ReadOnly = false;
            this.sponGRNoLookup3.ReadOnly = false;
            this.txtSponsorerName.ReadOnly = false;
            this.txtSponDepartment.ReadOnly = false;
            this.areaSecGrNoLookup2.Mandatory = false;
            this.areaSecZsmSatsangCentresLookup.Mandatory = false;
            this.secGRNoLookup1.Mandatory = false;
            this.secZsmSatsangCentresLookup.Mandatory = false;

            this.lblSec.ForeColor = SystemColors.HotTrack;
            this.lblAreaSec.ForeColor = SystemColors.HotTrack;
            this.lblSpons.ForeColor = SystemColors.HotTrack;

            if (this.CurrentUIMode == UIModes.Insert
                || this.CurrentUIMode == UIModes.New)
            {
                if (this.chkOutStationSewadar.Checked)
                {
                    //area_secretary_centre_id	IS	NOT	NULL	AND	area_secretary_grno	IS	NOT	NULL
                    //	secretary_centre_id	IS	NOT	NULL	AND	secretary_grno	IS	NOT	NULL
                    //	sponsorer_id	IS		NULL	AND	sponsorer_centre_id	IS		NULL	AND	sponsorer_grno	IS		NULL	AND	sponsorer_nm	IS		NULL	AND	sponsorer_department	IS		NULL
                    this.areaSecZsmSatsangCentresLookup.Mandatory = true;
                    this.secZsmSatsangCentresLookup.Mandatory = true;

                    this.sponSewadarIDLookup3.ClearControlValues();
                    this.sponSewadarIDLookup3.ReadOnly = true;
                    this.sponMainSatsangCentresLookup3.ClearControlValues();
                    this.sponMainSatsangCentresLookup3.ReadOnly = true;
                    this.sponGRNoLookup3.ClearControlValues();
                    this.sponGRNoLookup3.ReadOnly = true;
                    this.txtSponsorerName.ClearControlValues();
                    this.txtSponsorerName.ReadOnly = true;
                    this.txtSponDepartment.ClearControlValues();
                    this.txtSponDepartment.ReadOnly = true;

                    this.lblSpons.ForeColor = Color.Red;
                }
                else
                {
                    //sponsorer_centre_id	IS	NOT	NULL	AND	sponsorer_grno	IS	NOT	NULL
                    //secretary_id	IS		NULL	AND	secretary_centre_id	IS		NULL	AND	secretary_grno	IS		NULL	AND	secretary_nm	IS		NULL
                    //area_secretary_id	IS		NULL	AND	area_secretary_centre_id	IS		NULL	AND	area_secretary_grno	IS		NULL	AND	area_secretary_nm	IS		NULL
                    this.sponMainSatsangCentresLookup3.Mandatory = true;
                    this.sponGRNoLookup3.Mandatory = true;

                    this.areaSecRegisteredSewadarIDLookup2.ClearControlValues();
                    this.areaSecZsmSatsangCentresLookup.ClearControlValues();
                    this.areaSecGrNoLookup2.ClearControlValues();
                    this.areaSecName.ClearControlValues();

                    this.areaSecRegisteredSewadarIDLookup2.ReadOnly = true;
                    this.areaSecZsmSatsangCentresLookup.ReadOnly = true;
                    this.areaSecGrNoLookup2.ReadOnly = true;
                    this.areaSecName.ReadOnly = true;
                    this.lblSec.ForeColor = Constants.DEFAULT_READONLY_FORE_COLOR;

                    this.secRegisteredSewadarIDLookup1.ClearControlValues();
                    this.secZsmSatsangCentresLookup.ClearControlValues();
                    this.secGRNoLookup1.ClearControlValues();
                    this.secName.ClearControlValues();

                    this.secRegisteredSewadarIDLookup1.ReadOnly = true;
                    this.secZsmSatsangCentresLookup.ReadOnly = true;
                    this.secGRNoLookup1.ReadOnly = true;
                    this.secName.ReadOnly = true;
                    this.lblSec.ForeColor = Color.Red;
                    this.lblAreaSec.ForeColor = Color.Red;
                }
            }
        }

        private void sponSewadarIDLookup3_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.sponSewadarIDLookup3.IdText))
            {
                this.sponGRNoLookup3.ReadOnly = true;
                this.sponGRNoLookup3.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]);
                this.txtSponsorerName.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]);
                this.txtSponDepartment.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_department_nm"]);
            }
            else
            {
                this.sponGRNoLookup3.ReadOnly = false;
            }
        }

        private void ref1SewadarIDLookup3_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.ref1SewadarIDLookup3.IdText))
            {
                this.ref1GrNoLookup1.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]);
                this.txtRefName.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]);
                this.txtRef1Department.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_department_nm"]);
            }
        }

        private void ref2SewadarIDLookup3_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.ref2SewadarIDLookup3.IdText))
            {
                this.ref2GrNoLookup1.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]);
                this.txtRef2Name.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]);
                this.txtRef2Department.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_department_nm"]);
            }
        }

        private void areaSecRegisteredSewadarIDLookup2_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.areaSecRegisteredSewadarIDLookup2.IdText))
            {
                this.areaSecRegisteredSewadarIDLookup2.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["centre_functionary_id"]);
                this.areaSecRegisteredSewadarIDLookup2.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["functionary_nm"]);
            }
        }

        private void secRegisteredSewadarIDLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.secRegisteredSewadarIDLookup1.IdText))
            {
                this.secRegisteredSewadarIDLookup1.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["centre_functionary_id"]);
                this.secRegisteredSewadarIDLookup1.DisplayText = DbManager.GetString(e.LookupResult.SelectedRecords[0]["functionary_nm"]);
            }
        }

        private void areaSecZsmSatsangCentresLookup_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.dtAppointment.DisplayText))
            {
                DataSet dSet = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select centre_functionary_id, functionary_nm from satsang_centre_functionaries f where f.satsang_centre_id = {0} AND f.centre_functionary = 'Area Secretary' AND ('{1}' BETWEEN f.effective_from AND f.effective_till) ; select centre_functionary_id, functionary_nm from satsang_centre_functionaries f where f.satsang_centre_id = {0} AND f.centre_functionary = 'Secretary' AND ('{1}' BETWEEN f.effective_from AND f.effective_till)", this.areaSecZsmSatsangCentresLookup.IdText, this.dtAppointment.DisplayText));
                DataTable dT = dSet.Tables[0];
                if (dT.Rows.Count == 1)
                {
                    this.areaSecRegisteredSewadarIDLookup2.IdText = dT.Rows[0]["centre_functionary_id"].ToString();
                    ZSMUtility.setDisplayValueText(areaSecRegisteredSewadarIDLookup2, dT.Rows[0]["functionary_nm"].ToString());
                }
                this.secZsmSatsangCentresLookup.IdText = this.areaSecZsmSatsangCentresLookup.IdText;
                ZSMUtility.setDisplayValueText(this.secZsmSatsangCentresLookup, this.areaSecZsmSatsangCentresLookup.DisplayText);
                dT = dSet.Tables[1];
                if (dT.Rows.Count == 1)
                {
                    this.secRegisteredSewadarIDLookup1.IdText = dT.Rows[0]["centre_functionary_id"].ToString();
                    ZSMUtility.setDisplayValueText(secRegisteredSewadarIDLookup1, dT.Rows[0]["functionary_nm"].ToString());
                }
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, " Appointment Date ", MessageTypes.Warning);
            }
        }
    }
}
