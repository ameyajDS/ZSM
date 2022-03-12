using System;
using System.Collections;
using System.Data;
using DCC.DBFacade;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.MGMT.Global;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace DCC.ZOS.ZSM.SETUP
{
    public partial class SystemInformationCodes : ZSMAbstractScreen
    {
        private DataTable dtSystemInfoValues;


        public SystemInformationCodes()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here

                return Screens.SETUP_SYSTEM_INFORMATION_CODES;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            system_info_cd,            
            system_info_nm,
            remarks
        }

        #endregion

        #region Nested type: grdSystemInfoValuesColNames

        private enum grdSystemInfoValuesColNames
        {
					
            system_info_value,
            value_int		,	
            value_varchar	,	
            value_dt		,	
            value_dtm			
        }

        #endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);

            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.ShowListView(this.scBrowseOrList, false);
                //your custom after clearing the screen controls go here
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.ShowListView(this.scBrowseOrList, false);
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.List)
            {
                this.ShowListView(this.scBrowseOrList, true);
            }
            else if (uiMode == UIModes.Browse)
            {
                this.ShowListView(this.scBrowseOrList, false);
            }
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSystemInformationCodesSQLSelectQuery query = new ViewSystemInformationCodesSQLSelectQuery();

            query.system_info_cd.IsExcluisive = true;
            query.system_info_cd.Contains(this.txtCode.DisplayText);
            query.system_info_nm.Contains(this.txtName.DisplayText);
            query.remarks.Contains(this.txtRemarks.DisplayText);

            return dbFacade.ExecuteSelectQuery(query);
        }

        public override void LoadBrowseView(int rowIndex)
        {
            // All the Details, Retrive from Database are Display in all the fields through GridList.
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scBrowseOrList.Panel1);
            this.ObjectIdForLogOperation = this.txtCode.DisplayText;
            string strSysInfCode = this.grdList.AsStr(grdListColNames.system_info_cd.ToString());
            this.LoadSysInfValuesGrid(strSysInfCode);
        }

        private void LoadSysInfValuesGrid(string strSysInfCode)
        {
            DataSet dset;
            dset = this.dbFacade.QuerySystemInformationValues(strSysInfCode);
            this.grdSystemInfoValues.RetrieveRecords(dset.Tables[0], false, RowStates.Old);
        }

        public void ClearDetailView()
        {
            ClearAllControlsOfContainer(this, true);
            txtCode.Focus();

        }
        public override void ExecuteScreenAction(string actionId)
        {
            base.ExecuteScreenAction(actionId);
            switch (actionId)
            {
                case "Delete All Reports":
                    try
                    {
                        this.dbFacade.BeginTrans();
                        List<SqlParameter> parameters = new List<SqlParameter>();
                        this.dbFacade.ObjDBManager.ExecuteStoredProc("DeleteAllGenericReportsData", parameters, 600);
                        ZSMUtility.LogAction(this, this.dbFacade, actionId, null, null, null, null, null);
                        this.dbFacade.CommitTrans();
                        UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
                    }
                    catch (Exception)
                    {
                        this.dbFacade.RollbackTrans();
                        throw;
                    }
                    break;
            }
        }
        public override void UpdateData()
        {
            try
            {
                //[[If user changes the info_cd in textbox then update it SystemInformationCodes table
                string strOldInfoCode = this.grdList.AsStr(grdListColNames.system_info_cd.ToString(), grdList.CurrentRowIndex);
                dbFacade.AddDbTask(this.dbFacade.UpdateSystemInformationCodesAsTask(this.txtCode.DisplayText, strOldInfoCode, this.txtName.DisplayText,this.txtRemarks.DisplayText));
                //]]


                //[[Below code is for those rows of grdSystemInfoValuesColNames which are old but needs to be updated as Info_Code as has been changed 
                List<DCCDataRowView> oldRows = grdSystemInfoValues.GetRowsForState(RowStates.Old);

                foreach (DCCDataRowView rv in oldRows)
                {
                    string info_value = rv.AsStr(grdSystemInfoValuesColNames.system_info_value.ToString());
                    int? value_int = rv.AsInt(grdSystemInfoValuesColNames.value_int.ToString());
                    string value_varchar = rv.AsStr(grdSystemInfoValuesColNames.value_varchar.ToString());
                    DateTime? value_dt = rv.AsDTM(grdSystemInfoValuesColNames.value_dt.ToString());
                    DateTime? value_dtm = rv.AsDTM(grdSystemInfoValuesColNames.value_dtm.ToString());

                    dbFacade.AddDbTask(this.dbFacade.UpdateSystemInformationValuesAsTask(this.txtCode.DisplayText, value_int, value_varchar, value_dt, value_dtm, strOldInfoCode, info_value));

                }
                //]]

                //Below line is for those rows of grdSystemInfoValuesColNames which got Updated, Inserted or Deleted
                this.dbFacade.AddDbTasks(SaveSysInfValuesGridAsTask(strOldInfoCode));

                this.ObjectIdForLogOperation = strOldInfoCode;

                //[[All the grid updates in database is done in one shot.
                this.dbFacade.ExecuteDbTasks();
                //]]               

            }
            catch (Exception ex)
            {
                throw;
            }
        }


        public override void CreateData()
        {
            this.dbFacade.InsertSystemInformationCodes(this.txtCode.DisplayText,
                                                this.txtName.DisplayText,
                                                this.txtRemarks.DisplayText
                                                );
            this.ObjectIdForLogOperation = this.txtCode.ToString();
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.AddDbTasks(SaveSysInfValuesGridAsTask(this.txtCode.ToString()));
            this.dbFacade.ExecuteDbTasks();
            //]] 

        }
       
        public override bool DeleteData()
        {
            string oldInfoCode = this.grdList.AsStr(grdListColNames.system_info_cd.ToString());
            this.dbFacade.DeleteSystemInformationCodes(oldInfoCode);

            return true;
        }

        private List<string> SaveSysInfValuesGridAsTask(string stroldInfoCode)
        {
            List<string> allTasks = new List<string>();
            try
            {

                if (this.grdSystemInfoValues.Rows.Count > 0)
                {
                    Hashtable overiddingParamValues = new Hashtable();               

                    overiddingParamValues.Add("system_info_cd", this.txtCode.DisplayText);
                    overiddingParamValues.Add("old_system_info_cd", stroldInfoCode);


                    allTasks = this.grdSystemInfoValues.GetAllDBTasks(this.dbFacade, "DeleteSystemInformationValuesAsTask", "UpdateSystemInformationValuesAsTask", "InsertSystemInformationValuesAsTask", overiddingParamValues, string.Empty, string.Empty, string.Empty);

                }

                return allTasks;
            }
            catch
            {
                throw;
            }

        }

        
    }
}