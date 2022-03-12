using System;
using System.Collections.Generic;
using System.Data;
using DCC.DBFacade;

using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.MGMT.Global;
using DCC.SSM.CDB2.Utils;
using System.Windows.Forms;

namespace DCC.UMB.CDB2.ENT
{
    public partial class AMSCityClean : AbstractScreen
    {
        private CDB_AppDbFacade dbFacade;


        #region Nested type: ListCityDetails

        private enum ListCityDetails
        {
            SelectCity,
            City,
            State,
            StateID,
            totalCount
        }

        #endregion

        #region Nested type: ListVisitorDetails

        private enum ListVisitorDetails
        {
            selectvisitor,
            visitorID,
            VisitorName,
            age,
            gender,
            address,
            vstCity,
            vstState,
            vstStateID
        }

        #endregion
        public AMSCityClean()
        {
            InitializeComponent();
        }
        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_AMS_CITY_CLEAN;
            }
        }
        protected override void InitializeDbFacade()
        {
            if (dbFacade == null)
                dbFacade = new CDB_AppDbFacade("CDB_APP");
            // Initialize DBFacade for Specify Application ID
        }

        public class ListDetails
        {
            private string name;
            public string Name
            {
                get
                {
                    return name;
                }
            }
            private string cd;
            public string CD
            {
                get
                {
                    return cd;
                }
            }

            public ListDetails(string name, string cd)
            {
                this.name = name;
                this.cd = cd;
            }
            public override string ToString()
            {
                return name + "," + cd;
            }
        }


        public static List<ListDetails> CitySelection()
        {
            List<ListDetails> lstEntity = new List<ListDetails>();
            lstEntity.Add(new ListDetails("All", "ALL"));
            return lstEntity;
        }

        private void AMSCityClean_Load(object sender, EventArgs e)
        {
            this.txtCDBCountryName.SetControlValues("INDIA", "INDIA", "1");
            this.cmbSelectCity.SetDataSource(CitySelection(), "Name", "CD");
        }

        private void txtCDBStateName_LookupDialogShowing(object sender, CDF.UIControls.TextControls.LookupEventArgs e)
        {

            e.LookupSqlString = e.LookupSqlString.Replace("AND  ?", "And country_id = '" + txtCDBCountryName.IdText + "' AND ?");
        }

        private void txtCDBDisttName_LookupDialogShowing(object sender, CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("AND   ?", "AND l1.level_1_address_component_nm LIKE '" + txtCDBStateName.ValueText + "' AND ?");
        }

        private void txtCDBCityName_LookupDialogShowing(object sender, CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("AND    ?", "AND l2.level_2_address_component_nm  LIKE '" + txtCDBDisttName.ValueText + "' AND ?");
        }

        private void btnSearchAMSCity_Click(object sender, EventArgs e)
        {          
            GetAMSCityRecords();
         
        }

        private void GetAMSCityRecords()
        {
            if (GetAMSCityDetails()!=null)
            {
                txtCDBCityName.ClearControlValues();
                grdCityDetails.RetrieveRecords(GetAMSCityDetails(), false, RowStates.Old);                
            }
            else
            {
                grdCityDetails.RemoveAllRecords();
              
            }
        }


        private void btnUpdateCityDetails_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCDBCityName.IdText))
            {
                UIManager.ShowMessage(MsgCodes.MandatoryFieldsEmpty, "CDB City Name", MessageTypes.Error, ScreenId, CurrentUIMode);
                txtCDBCityName.Focus();
            }
            else
            {
                if (grdCityDetails.RowCount  > 0)
                {
                    this.dbFacade.BeginTrans();
                    int? countRows = 0;
                    try
                    {
                        List<DCCDataRowView> UpdGrdVisitorDetailsCount = grdCityDetails.GetRowsForState(RowStates.Updated);
                        foreach (DCCDataRowView rv in UpdGrdVisitorDetailsCount)
                        {
                            string selectedValue = rv.AsStr(ListCityDetails.SelectCity.ToString());
                            if (selectedValue == "True")
                            {
                                countRows += rv.AsInt(ListCityDetails.totalCount.ToString());
                            }
                        }
                        if (countRows > 0)
                        {
                            DialogResult result = MessageBox.Show(this, "Do you really want to save the " + countRows + "  Records?", "Confirm Update",
                                  MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
                            if (result == DialogResult.Yes)
                            {
                                List<DCCDataRowView> UpdGrdCityDetails = grdCityDetails.GetRowsForState(RowStates.Updated);
                                foreach (DCCDataRowView rv in UpdGrdCityDetails)
                                {
                                    string selectedValue = rv.AsStr(ListCityDetails.SelectCity.ToString());
                                    string existing_city_name = rv.AsStr(ListCityDetails.City.ToString());
                                    string new_selected_city = txtCDBCityName.DisplayText;
                                    int? selected_state_ID = rv.AsInt(ListCityDetails.StateID.ToString());
                                    int? cdb_city_id = txtCDBCityName.IdTextAsInteger;
                                    int user_no = int.Parse(GlobalAppVariables.AppContext.UserNumber.ToString());
                                    if (selectedValue == "True")
                                    {
                                        countRows += rv.AsInt(ListCityDetails.totalCount.ToString());
                                        this.dbFacade.ObjDBManager.ExecuteSQL("Exec hostels..UpdateAMSCities '" + existing_city_name + "','" + new_selected_city + "'," + selected_state_ID + "," + cdb_city_id + ",'" + user_no + "'");
                                    }
                                }
                                this.dbFacade.CommitTrans();
                                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
                                GetAMSCityRecords();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        UIManager.ShowMessage(ex.Message, string.Empty, MessageTypes.Error);
                        this.dbFacade.RollbackTrans();
                        throw;
                    }

                }
                else
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "City Detail Grid", MessageTypes.Error, ScreenId, CurrentUIMode);
                    grdCityDetails.Focus();
                }
            }
        }

        private void btnUpdateVisitorDetails_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCDBCityName.IdText))
            {
                UIManager.ShowMessage(MsgCodes.MandatoryFieldsEmpty, "CDB City Name", MessageTypes.Error, ScreenId, CurrentUIMode);
                txtCDBCityName.Focus();
            }
            else
            {
                if (grdVisitorDetails.RowCount > 0)
                {
                    this.dbFacade.BeginTrans();
                    int? countVisitors = 0;
                    try
                    {        
                        List<DCCDataRowView> UpdGrdVisitorDetailsCount = grdVisitorDetails.GetRowsForState(RowStates.Updated);
                        foreach (DCCDataRowView rv in UpdGrdVisitorDetailsCount)
                        {
                            string selectedValue = rv.AsStr(ListVisitorDetails.selectvisitor.ToString());
                            if (selectedValue == "True")
                            {
                                countVisitors += 1;
                            }
                        }
                        if (countVisitors > 0)
                        {
                            DialogResult result = MessageBox.Show(this, "Do you really want to save the " + countVisitors + "  Records?", "Confirm Update",
                                      MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
                            if (result == DialogResult.Yes)
                            {
                                List<DCCDataRowView> UpdGrdVisitorDetails = grdVisitorDetails.GetRowsForState(RowStates.Updated);
                                foreach (DCCDataRowView rv in UpdGrdVisitorDetails)
                                {
                                    string selectedValue = rv.AsStr(ListVisitorDetails.selectvisitor.ToString());
                                    string new_selected_city = txtCDBCityName.DisplayText;
                                    int? cdb_city_id = txtCDBCityName.IdTextAsInteger;
                                    int? vst_id = rv.AsInt(ListVisitorDetails.visitorID.ToString());
                                    int user_no = int.Parse(GlobalAppVariables.AppContext.UserNumber.ToString());
                                    if (selectedValue == "True")
                                    {
                                        this.dbFacade.ObjDBManager.ExecuteSQL("Exec hostels..UpdateVisitorCity '" + new_selected_city + "','" + cdb_city_id + "'," + vst_id + ",'" + user_no + "'");
                                    }
                                }
                                this.dbFacade.CommitTrans();
                                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
                                grdVisitorDetails.RemoveAllRecords();
                                GetAMSCityRecords();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        UIManager.ShowMessage(ex.Message, string.Empty, MessageTypes.Error);
                        this.dbFacade.RollbackTrans();
                        throw;
                    }

                }
                else
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "Visitor Detail Grid", MessageTypes.Error, ScreenId, CurrentUIMode);
                    grdCityDetails.Focus();
                }
            }
        }
        private DataTable GetAMSCityDetails()
        {
            DataTable dtGetCities = null;
            if (!string.IsNullOrEmpty(txtCityName.DisplayText))
            {
                dtGetCities =
                    dbFacade.ObjDBManager.ExecuteSQL(
                    "SELECT t_v.Vst_City,S.STA_Name ,t_v.Sta_ID, COUNT(*) visitor FROM Hostels..T_Visitor t_v JOIN hostels..T_State s ON s.STA_ID = t_v.Sta_ID where Vst_City LIKE '" + txtCityName.DisplayText + "%" + "' " +
                    "AND t_v.cdb_city_id	IS NULL GROUP BY t_v.Vst_City, S.STA_Name, t_v.Sta_ID ORDER BY s.STA_Name").Tables[0];
            }
            else
            {
                UIManager.ShowMessage(MsgCodes.MandatoryFieldsEmpty, "AMS City Name", MessageTypes.Error, ScreenId, CurrentUIMode);
                txtCityName.Focus();
            }
            return dtGetCities;
        }

        private DataTable GetAMSVisitorDetails(object city, object stateID)
        {
            DataTable dtGetVisitorDetails = null;
            dtGetVisitorDetails =
                    dbFacade.ObjDBManager.ExecuteSQL(
                    "SELECT v.Vst_ID,v.Vst_Initial + ' '+v.Vst_FName+' '+v.Vst_MName+' '+v.Vst_LName Vst_Name,v.Vst_Age,v.Vst_Sex,v.Vst_Address1 + ' '+v.Vst_Address2+ ' '+v.Vst_Address3 Address, " +
                    "v.Vst_City, ts.STA_ID , ts.STA_Name FROM Hostels..T_Visitor v LEFT OUTER JOIN Hostels..T_State ts ON v.Sta_ID = ts.STA_ID where v.cdb_city_id IS NULL AND Vst_City LIKE '" + city + "' AND ts.Sta_ID = '" + stateID + "' ORDER BY Vst_Name").Tables[0];
            return dtGetVisitorDetails;
        }

        private void btnShowVisitorDetails_Click(object sender, EventArgs e)
        {
           
            GetVisitorDetails();

        }

        private void GetVisitorDetails()
        {
            object city, stateID = string.Empty;
            city = grdCityDetails.GetCellValue(ListCityDetails.City.ToString(), grdCityDetails.CurrentRowIndex);
            stateID = grdCityDetails.GetCellValue(ListCityDetails.StateID.ToString(), grdCityDetails.CurrentRowIndex);
            if (GetAMSVisitorDetails(city, stateID) != null)
            {
                grdVisitorDetails.RetrieveRecords(GetAMSVisitorDetails(city, stateID), false, RowStates.Old);
                this.grdVisitorDetails.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            }
            else
            {
                grdVisitorDetails.RemoveAllRecords();
                this.grdVisitorDetails.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            }
        }

        private void cmbSelectCity_SelectedValueChanged(object sender, EventArgs e)
        {
            if (grdCityDetails.RowCount > 0)
            {
                List<DCCDataRowView> oldrows = grdCityDetails.GetRowsForState(RowStates.Old);
                foreach (DCCDataRowView rv in oldrows)
                {
                    if (cmbSelectCity.SelectedValue.ToString() == "ALL")
                    {
                        grdCityDetails.SetCellValue(ListCityDetails.SelectCity.ToString(), rv.RowIndex, 1);
                    }                
                }              
            }
            else
            {
                cmbSelectCity.SelectedValue = "...";
            }
        }
    }
}
