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

    public partial class SewadarsDetails : ZSMAbstractScreen
    {
        DataTable remarksDT = null;
        private enum GrdListColumns
        {
            sewadar_grno,
            satsang_centre_id
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
        public SewadarsDetails()
        {
            InitializeComponent();
            this.sewadarStatusCombo1.isGlobal = false;
            this.addressBox1.txtAddress1.Mandatory = false;
        }

        public override string ScreenId { get { return Screens.ACT_SEWADARS_DETAILS; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        public override void ClearControls()
        {
            ClearAllControlsOfContainer(this, true, this.zsmSatsangCentresLookup1);
            this.pictureBox1.Image = null;
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
            remarksDT = ZSMUtility.GetRemarkTypes(this.dbFacade);
            this.grdRemarks.SetComboBoxColumnDataSource("remarks_type", remarksDT, "remarks_type", "remarks_type");
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
            this.txtGRNo.ReadOnly = !isQueryMode;
            this.txtSewadarStatus.ReadOnly = !isQueryMode;
            this.dtmSewadarStatus.ReadOnly = !isQueryMode;
            this.zsmSatsangCentresLookup1.ReadOnly = !isQueryMode;
            this.dtAppDate.ReadOnly = !isQueryMode;
            this.sewadarStatusCombo1.ReadOnly = !isQueryMode;
            this.dtCurrentStatus.ReadOnly = !isQueryMode;
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert || uiMode == UIModes.New)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    this.setHeaderInNewMode(int.Parse(screenParameters));
                    this.intSewadarId.ReadOnly = true;
                    this.txtName.ReadOnly = true;
                    populateDefaultValues();
                    this.addressBox1.Focus();
                }
                else
                {
                    populateDefaultValues();
                }
            }
            else if (uiMode == UIModes.Query || uiMode == UIModes.Update)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    this.intSewadarId.DisplayText = screenParameters;
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
            bool retVal = true;
            if (this.grdList.CurrentRowIndex >= 0)
            {
                int? currSatsangCentre = this.grdList.AsInt(GrdListColumns.satsang_centre_id.ToString());
                switch (actionId)
                {
                    case "Sewadar Information":
                    case "Sewadar References":
                        if (currSatsangCentre.HasValue && currSatsangCentre.Value != ZSMUtility.GetSatsangCentreId())
                            retVal = false;
                        break;

                    case "Sewadar Particulars":
                        if ((currSatsangCentre == null) ||
                            (currSatsangCentre.HasValue && (currSatsangCentre.Value != ZSMUtility.GetSatsangCentreId()))
                           )
                            retVal = false;
                        break;
                }
            }
            return retVal && base.IsAValidScreenAction(actionId);
        }

        public override void ExecuteScreenAction(string actionId)
        {
            int? currSatsangCentreId = null;
            string currSewadarGrno = null;
            if (string.Compare(actionId, "Sewadar Information") == 0
                || string.Compare(actionId, "Sewadar Particulars") == 0
                || string.Compare(actionId, "Sewadar References") == 0)
            {
                currSatsangCentreId = this.grdList.AsInt(GrdListColumns.satsang_centre_id.ToString());
                currSewadarGrno = this.grdList.AsStr(GrdListColumns.sewadar_grno.ToString());
            }
            switch (actionId)
            {
                case "Sewadar":
                    UIManager.OpenForm(typeof(Sewadars), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    break;
                    
                case "Sewadar Information":
                    if (DbManager.IsNotNull(currSatsangCentreId) && !string.IsNullOrEmpty(currSewadarGrno))
                    {
                        UIManager.OpenForm(typeof(SewadarsInformation), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, currSewadarGrno + "|" + currSatsangCentreId, this, this);
                    }
                    else
                    {
                        UIManager.OpenForm(typeof(SewadarsInformation), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    }
                    break;

                case "Sewadar References":
                    if (DbManager.IsNotNull(currSatsangCentreId) && !string.IsNullOrEmpty(currSewadarGrno))
                    {
                        UIManager.OpenForm(typeof(SewadarReferences), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, currSewadarGrno + "|" + currSatsangCentreId, this, this);
                    }
                    break;

                case "Sewadar Particulars":
                    if (DbManager.IsNotNull(currSatsangCentreId) && !string.IsNullOrEmpty(currSewadarGrno))
                    {
                        UIManager.OpenForm(typeof(SewadarsParticulars), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, currSatsangCentreId + "," + currSewadarGrno + ",Sewadar", this, this);
                    }
                    break;
                case "History":
                    UIManager.OpenForm(typeof(History), UIModes.Reference, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    break;
            }
        }

        private void LoadGrids()
        {
            dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarsRemarkAsTask(this.intSewadarId.IdTextAsInteger));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarsQualificationAsTask(this.intSewadarId.IdTextAsInteger));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarsSkillAsTask(this.intSewadarId.IdTextAsInteger));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarsAddresseAsTask(this.intSewadarId.IdTextAsInteger, "Residence"));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarsOtherDisabilitiesAsTask(this.intSewadarId.IdTextAsInteger));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT = dSet.Tables[0];
            this.grdRemarks.RetrieveRecords(dT, false, RowStates.Old);
            dT = dSet.Tables[1];
            this.grdQualifications.RetrieveRecords(dT, false, RowStates.Old);
            dT = dSet.Tables[2];
            this.grdSkills.RetrieveRecords(dT, false, RowStates.Old);
            dT = dSet.Tables[3];
            if (dT.Rows.Count > 0)
            {
                this.LoadDataToContainer(dT, this.addressBox1);
            }
            dT = dSet.Tables[4];
            this.grdMedicalDisab.RetrieveRecords(dT, false, RowStates.Old);
        }

        public override bool IsReadyToSave()
        {
            int count = 0;
            List<DCCDataRowView> allRows = new List<DCCDataRowView>();
            allRows.AddRange(this.grdRemarks.GetRowsForState(RowStates.New));
            allRows.AddRange(this.grdRemarks.GetRowsForState(RowStates.Old));
            allRows.AddRange(this.grdRemarks.GetRowsForState(RowStates.Updated));
            foreach (DCCDataRowView item in allRows)
            {
                if (string.Compare(this.grdRemarks.AsStr("remarks_type", item.RowIndex), "Reference", true) == 0)
                {
                    count++;
                }
            }
            if(count > 1)
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, "Only one Reference type Remark ", MessageTypes.Error);
                return false;
            }
            if (!string.IsNullOrEmpty(this.addressBox1.txtAddress1.DisplayText) && string.IsNullOrEmpty(this.addressBox1.postOfficeOrCityLookup.IdText))
            {
                UIManager.ShowMessage(MsgCodes.ValueReqd, "Post Office in address ", MessageTypes.Error);
                return false;
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
            if(dT1.Rows.Count == 1 && string.IsNullOrEmpty(this.addressBox1.CountryLookup.IdText))
                this.addressBox1.setCountry(dT1.Rows[0]["country_id"].ToString(), dT1.Rows[0]["country_nm"].ToString());
            if (dT2.Rows.Count == 1 && string.IsNullOrEmpty(this.addressBox1.StateLookup.IdText))
                this.addressBox1.setState(dT2.Rows[0]["state_id"].ToString(), dT2.Rows[0]["state_nm"].ToString());
            if (dT3.Rows.Count == 1 && string.IsNullOrEmpty(this.addressBox1.DistrictorCitiesLookup.IdText))
                this.addressBox1.setDistrict(dT3.Rows[0]["district_or_city_id"].ToString(), dT3.Rows[0]["district_nm"].ToString());
        }

        public override void LoadBrowseView(int rowIndex)
        {
            MakeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1, this.grdRemarks);
            LoadGrids();
            ZSMUtility.LoadOnlySewadarImageFromDBToPictureBox(this.intSewadarId.IdTextAsInteger, ref this.pictureBox1);
            populateDefaultValues();
            this.ObjectIdForLogOperation = this.intSewadarId.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarsDetailSQLSelectQuery query = new ViewSewadarsDetailSQLSelectQuery();

            //This line avoids the if condition and specifies that sewadar_id is a primary/indexed key.
            query.sewadar_id.IsExcluisive = true;

            query.sewadar_id.Equal(this.intSewadarId.DisplayText);
            query.full_nm.Contains(this.txtName.DisplayText);
            query.gender.Equal(this.zsmGenderCombo1.SelectedValue);
            query.global_sewadar_status_nm.Equal(this.txtSewadarStatus.DisplayText);
            query.global_sewadar_status_dt.Between(this.dtmSewadarStatus);
            query.address_line_1.Contains(this.addressBox1.txtAddress1.DisplayText);
            query.address_line_2.Contains(this.addressBox1.txtAddress2.DisplayText);
            query.country_id.Equal(this.addressBox1.CountryLookup.IdText);
            query.state_id.Equal(this.addressBox1.StateLookup.IdText);
            query.district_or_city_id.Equal(this.addressBox1.DistrictorCitiesLookup.IdText);
            query.post_office_or_city_id.Equal(this.addressBox1.postOfficeOrCityLookup.IdText);
            query.pin_or_zip_code.Contains(this.addressBox1.txtPin.DisplayText);

            query.telephone_mobile.Contains(this.txtMobilePh.DisplayText);
            query.telephone_office.Contains(this.txtOffPh.DisplayText);
            query.telephone_residence.Contains(this.txtResidencePh.DisplayText);
            query.occupation.Equal(this.cmbOccupation.SelectedValue);
            query.weekly_satsang_centre_id.Equal(this.lkpWeeklySatsangCentre.IdText);

            query.is_diabetic.Equal(this.cmbDiabetic.SelectedValue);
            query.has_epillepsy.Equal(this.cmbEpillepsy.SelectedValue);
            query.has_hypertension.Equal(this.cmbHypertension.SelectedValue);
            query.has_skin_problem.Equal(this.cmbSkinProblem.SelectedValue);

            query.sewadar_grno.Equal(this.txtGRNo.DisplayText);
            query.sewadar_status_cd.Equal(this.sewadarStatusCombo1.SelectedValue);
            query.sewadar_status_dtm.Between(this.dtCurrentStatus);
            query.satsang_centre_id.Equal(this.zsmSatsangCentresLookup1.IdText);
            query.appointment_dt.Between(this.dtAppDate);
            query.other_address_proof_nm.Contains(this.otherAddressProofLookup1.DisplayText);
            query.attends_weekly_satsang.Equal(this.cmbAttendsWeeklySatsang.SelectedValue);
            query.address_proof.Equal(ZSMUtility.EscapeSingleQuote(this.cmbAddressProof.SelectedValue));

            return dbFacade.ExecuteSelectQuery(query);
        }



        void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            ((System.Timers.Timer)sender).Stop();
            UIManager.ShowMessage(MsgCodes.ProcessMsg, "Sewadar Details Saved. Launched Sewadar Information Screen for Sewadar Id: " + this.intSewadarId.DisplayText  +" ...", MessageTypes.Plain);
        }

        public override void Save()
        {
            base.Save();
            //[[After completing of saving of screen open Sewadars Details
            if ((this.CurrentUIMode == UIModes.Insert || this.CurrentUIMode == UIModes.New) 
                && !this.sewadarInformationRecorded)
            {
                if (!string.IsNullOrEmpty(this.intSewadarId.DisplayText))
                {
                    this.sewadarInformationRecorded = true;
                    UIManager.OpenForm(typeof(SewadarsInformation), UIModes.New,
                        GlobalAppVariables.AppContext.ApplicationId,
                        this.intSewadarId.DisplayText, this, this.grdSkills
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
                overiddingParamValues.Add("sewadar_id", sewadarId);
                allTasks = this.grdQualifications.GetAllDBTasks(this.dbFacade, "DeleteSewadarsQualificationAsTask", "UpdateSewadarsQualificationAsTask", "InsertSewadarsQualificationAsTask", overiddingParamValues, "qualification_sq", "UpdateSewadarsQualificationSqAsTask", "MakeSewadarsQualificationSqPositiveAsTask");
                allTasks.AddRange(this.grdSkills.GetAllDBTasks(this.dbFacade, "DeleteSewadarsSkillAsTask", "UpdateSewadarsSkillAsTask", "InsertSewadarsSkillAsTask", overiddingParamValues, "skill_sq", null, null));
                allTasks.AddRange(this.grdMedicalDisab.GetAllDBTasks(this.dbFacade, "DeleteSewadarsOtherDisabilitiesAsTask", "UpdateSewadarsOtherDisabilitiesAsTask", "InsertSewadarsOtherDisabilitiesAsTask", overiddingParamValues, "medical_disability_sq", null, null));
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
                        GetRemarkSq(row.AsStr(GridRemarksColNames.remarks_type.ToString()),(short?)(0 - row.DisplayOrder)),
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
                        GetRemarkSq(row.AsStr(GridRemarksColNames.remarks_type.ToString()),(short?)(0 - row.DisplayOrder)),
                        row.AsStr(GridRemarksColNames.old_remarks_type.ToString()), row.AsShort(GridRemarksColNames.old_remarks_sq.ToString()),
                        row.AsStr(GridRemarksColNames.remark.ToString()) ));
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

        public override void CreateData()
        {
                this.dbFacade.InsertSewadarsDetail(this.intSewadarId.IdTextAsInteger,
                                                this.cmbAddressProof.SelectedValueAsStr, this.otherAddressProofLookup1.IdTextAsShort,
                                                this.txtMobilePh.DisplayText, this.txtResidencePh.DisplayText,
                                                this.txtOffPh.DisplayText, this.cmbOccupation.SelectedValueAsStr,
                                                this.cmbAttendsWeeklySatsang.SelectedValueAsStr, this.lkpWeeklySatsangCentre.IdTextAsInteger,
                                                this.cmbHypertension.SelectedValueAsStr, this.cmbDiabetic.SelectedValueAsStr,
                                                this.cmbSkinProblem.SelectedValueAsStr, this.cmbEpillepsy.SelectedValueAsStr);
                this.ObjectIdForLogOperation = this.intSewadarId.IdText;
                //[[All the grid updates in database is done in one shot.
                this.dbFacade.AddDbTasks(SaveGridsAsTask(this.intSewadarId.IdTextAsInteger));
                this.dbFacade.AddDbTask(this.dbFacade.InsUpdateSewadarsAddresseForSewadarDetailAsTask(this.intSewadarId.IdTextAsInteger,
                                        this.addressBox1.txtAddress1.DisplayText, this.addressBox1.txtAddress2.DisplayText,
                                        this.addressBox1.postOfficeOrCityLookup.IdTextAsInteger, this.addressBox1.txtPin.DisplayText));
                this.dbFacade.ExecuteDbTasks();
                //]] 
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.UpdateSewadarsDetail(this.intSewadarId.IdTextAsInteger,
                                            this.cmbAddressProof.SelectedValueAsStr, this.otherAddressProofLookup1.IdTextAsShort,
                                            this.txtMobilePh.DisplayText, this.txtResidencePh.DisplayText,
                                            this.txtOffPh.DisplayText, this.cmbOccupation.SelectedValueAsStr,
                                            this.cmbAttendsWeeklySatsang.SelectedValueAsStr, this.lkpWeeklySatsangCentre.IdTextAsInteger,
                                            this.cmbHypertension.SelectedValueAsStr, this.cmbDiabetic.SelectedValueAsStr,
                                            this.cmbSkinProblem.SelectedValueAsStr, this.cmbEpillepsy.SelectedValueAsStr,
                                            txn_ts);
            this.dbFacade.AddDbTasks(SaveGridsAsTask(this.intSewadarId.IdTextAsInteger));
            this.dbFacade.AddDbTask(this.dbFacade.InsUpdateSewadarsAddresseForSewadarDetailAsTask(this.intSewadarId.IdTextAsInteger,
                        this.addressBox1.txtAddress1.DisplayText, this.addressBox1.txtAddress2.DisplayText,
                        this.addressBox1.postOfficeOrCityLookup.IdTextAsInteger, this.addressBox1.txtPin.DisplayText));
            this.dbFacade.ExecuteDbTasks();
            //]] 
        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteSewadarsDetail(this.intSewadarId.IdTextAsInteger, txn_ts);
            return true;
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

        private void setHeaderInNewMode(int? sewadarId)
        {
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select * from ViewSewadarHeader where sewadar_id = " + sewadarId).Tables[0];
            this.LoadDataToContainer(dT, this.tlpTop);
        }

        private void sewadarLookup1_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                this.setHeaderInNewMode(this.txtName.IdTextAsInteger);
            }
        }

        private void intSewadarId_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.intSewadarId.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.txtName, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.txtName.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.sewadarLookup1_LookupResultSet(null, e);
                }
            }
        }

        private void grdRemarks_ComboBoxSelectionModified(object sender, ComboBoxSelectionModifiedEventArgs e)
        {
            if (e.ValueText == null)
            {
                return;
            }
            if (e.ColumnIndex == this.grdRemarks.Columns["remarks_type"].Index)
            {
                this.grdRemarks.SetCellValue("remarks_type_sq", e.RowIndex, this.getRemarkTypeSq(e.ValueText.ToString()));
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

        private void lkpWeeklySatsangCentre_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "satsang_centre_type IN ('CENTRE', 'SUB CENTRE', 'POINT')");
        }



    }
}
