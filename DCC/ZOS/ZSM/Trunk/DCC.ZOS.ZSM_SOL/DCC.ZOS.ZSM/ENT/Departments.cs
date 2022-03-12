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
using System.Collections;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB;
using DCC.UMB.CDF.UIControls;
using DCC.UMB.CDBLookups;
using DCC.UMB.CDF.Lookup.Modal;
using System.Windows.Forms;
namespace DCC.ZOS.ZSM.ENT
{
    public partial class Departments : ZSMAbstractScreen, ISummaryDetailEditor
    {

        public Departments()
        {
            InitializeComponent();
            this.summaryDetailNavigator1.SummaryDetailEditor = this;
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_DEPARTMENTS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            department_id = 0,
            department_cd,
            department_nm,
            colour_id,
            has_sub_departments,
            remarks,
            txn_ts
        }

        public enum grdSummaryColNames
        {
            objGrdSubSatsangCentres,
            sub_department_cd,
            sub_remarks,
            sub_department_id,
            sub_department_nm,
        }

        private enum grdSatsangCentresColNames
        {
            grdDept_effective_from,
            grdDept_effective_till

        }

        private enum grdSubSatsangCentresColNames
        {
            sub_satsang_centre_id,
            sub_effective_from,
            sub_effective_till

        }
        #endregion   

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        public override void ClearControls()
        {
            base.ClearControls();            
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.intID.ReadOnly = true;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intID.ReadOnly = false;
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
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1, this.tlpSubDept);
            this.ObjectIdForLogOperation = this.intID.DisplayText;
            
            //Based upon Has Department checkbox value enable or disable sub department detail view
            MakeDetailViewEnableDisable();  
            LoadAllGrids(this.intID.DisplayTextAsShort.Value);
            this.intID.ReadOnly = true;
        }

        public void LoadAllGrids(short? deptId)
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QueryDepartmentsSatsangCentreAsTask(deptId));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySubDepartmentAsTask(deptId));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable table = dSet.Tables[0];
            this.grdSatsangCentres.RetrieveRecords(table, false, RowStates.Old);

            table = dSet.Tables[1];
            this.grdSummary.RetrieveRecords(table, false, RowStates.Old);
            
            //Pending
            //table = this.dbFacade.QuerySubDepartmentsSatsangCentre(reportId).Tables[0];
            //this.grdSubSatsangCentres.RetrieveRecords(table, false, RowStates.Old);

        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewDepartmentSQLSelectQuery query = new ViewDepartmentSQLSelectQuery();

            //This line avoids the if condition and specifies that place_id is a primary/indexed key.
            query.department_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intDisttID 
            //field as the between clause bounds. 
            query.department_id.Equal(this.intID.DisplayText);
            //]]

            query.department_cd.Contains(this.txtCode.DisplayText);
            query.department_nm.Contains(this.txtName.DisplayText);

            query.colour_id.Equal(this.cmbColour.SelectedValueAsInteger);

            query.has_sub_departments.Equal(this.chkHasSubDepts.BlnString);
            query.remarks.Contains(this.txtRemarks.DisplayText);

            return dbFacade.ExecuteSelectQuery(query);
        }


        public override void CreateData()
        {
            try
            {
                short deptId = 0;
                this.dbFacade.InsertDepartment(ref deptId, this.txtCode.DisplayText,
                    this.txtName.DisplayText, this.cmbColour.SelectedValueAsShort,
                    this.chkHasSubDepts.BlnString,
                    this.txtRemarks.DisplayText);
                this.ObjectIdForLogOperation = deptId.ToString();

                //[[All the grid updates in database is done in one shot.
                this.dbFacade.AddDbTasks(SaveAllGridAsTask(deptId));
                this.dbFacade.ExecuteDbTasks();
                //]] 
             
            }
            catch
            {
                throw;
            }
        }

        public override void UpdateData()
        {
            try
            {
                //All the grid updates in database is done in one shot.
                this.dbFacade.AddDbTasks(SaveAllGridAsTask(this.intID.DisplayTextAsShort));

                //Update Deptt 
                byte[] txnTs = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
                this.dbFacade.AddDbTask(this.dbFacade.UpdateDepartmentAsTask(this.intID.DisplayTextAsShort.Value, this.txtCode.DisplayText,
                    this.txtName.DisplayText, this.cmbColour.SelectedValueAsShort.Value,
                    this.chkHasSubDepts.BlnString,
                    this.txtRemarks.DisplayText, txnTs));
               
                this.dbFacade.ExecuteDbTasks();                
                
            }
            catch
            {
                throw;
            }
        }

        public override bool DeleteData()
        {
            try
            {
                byte[] txnTs = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
                this.dbFacade.DeleteDepartment(this.intID.DisplayTextAsShort, txnTs);
            }
            catch
            {
                throw;
            }
            return true;
        }
        private void SaveSubSatsangCentres(short subDepId, DataTable dT)
        {
            if(DbManager.IsNotNull(dT))
            {
                this.dbFacade.AddDbTask(this.dbFacade.DeleteSubDepartmentsSatsangCentreAsTask(subDepId));
                foreach (DataRow row in dT.Rows)
                {
                   
                    this.dbFacade.AddDbTask(this.dbFacade.InsertSubDepartmentsSatsangCentreAsTask(subDepId, 
                        ((LookupResult)row[grdSubSatsangCentresColNames.sub_satsang_centre_id.ToString()]).ValueMemberAsInt,
                        DbManager.GetNullableDateTime(row[grdSubSatsangCentresColNames.sub_effective_from.ToString()]), 
                        DbManager.GetNullableDateTime(row[grdSubSatsangCentresColNames.sub_effective_till.ToString()])));

                }
            }
        }

        private List<string> SaveAllGridAsTask(short? deptId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                //TODO - Load Data from Detail to Smmary if user has entered something in detail view
                if (scSummaryDetail.Panel2Collapsed)
                    LoadDetailToSummary();

                foreach (DCCDataRowView row in this.grdSummary.GetRowsForState(RowStates.Deleted))
                {
                    //this.dbFacade.AddDbTask(this.dbFacade.DeleteSubDepartmentsSatsangCentreAsTask(row.AsShort(grdSummaryColNames.sub_department_id.ToString()), null));
                    this.dbFacade.AddDbTask(this.dbFacade.DeleteSubDepartmentAsTask(row.AsShort(grdSummaryColNames.sub_department_id.ToString())));
                }
                foreach (DCCDataRowView row in this.grdSummary.GetRowsForState(RowStates.Updated))
                {
                    this.dbFacade.AddDbTask(this.dbFacade.UpdateSubDepartmentAsTask(row.AsShort(grdSummaryColNames.sub_department_id.ToString()),
                        deptId,
                        row.AsStr(grdSummaryColNames.sub_department_cd.ToString()),
                        row.AsStr(grdSummaryColNames.sub_department_nm.ToString()),
                        row.AsStr(grdSummaryColNames.sub_remarks.ToString())));
                    DataTable dT = (DataTable)row.AsObject(grdSummaryColNames.objGrdSubSatsangCentres.ToString());
                    SaveSubSatsangCentres(row.AsShort(grdSummaryColNames.sub_department_id.ToString()).Value, dT);
                }
                foreach (DCCDataRowView row in this.grdSummary.GetRowsForState(RowStates.New))
                {
                    short subDepId = 0;
                    this.dbFacade.InsertSubDepartment(ref subDepId,
                        deptId,
                        row.AsStr(grdSummaryColNames.sub_department_cd.ToString()),
                        row.AsStr(grdSummaryColNames.sub_department_nm.ToString()),
                        row.AsStr(grdSummaryColNames.sub_remarks.ToString()));
                    DataTable dT = (DataTable)row.AsObject(grdSummaryColNames.objGrdSubSatsangCentres.ToString());
                    SaveSubSatsangCentres(subDepId, dT);
                }
                //Save Satsang Centres for Deptts
                if (this.grdSatsangCentres.Rows.Count > 0)
                {
                    Hashtable overiddingParamValues = new Hashtable();
                    overiddingParamValues.Add("department_id", deptId);

                    //Get Headers table's grid tasks
                    allTasks.AddRange(this.grdSatsangCentres.GetAllDBTasks(this.dbFacade, "DeleteDepartmentsSatsangCentreAsTask", "UpdateDepartmentsSatsangCentreAsTask", "InsertDepartmentsSatsangCentreAsTask", overiddingParamValues, string.Empty, string.Empty, string.Empty));                                  
                   
                }

                return allTasks;
            }
            catch
            {
                throw;
            }
           
        }

        #region ISummaryDetailEditor Members

        public DCCGrid Grid
        {
            get { return this.grdSummary; }
        }

        public bool IsDetailViewValid()
        {
            bool isDetailViewValid = ValidateAllControlsofContainer(this.tlpDetails);
            return isDetailViewValid;
        }

        public void LoadSumaryToDetail()
        {
            try
            {
                int rowIndex = this.grdSummary.CurrentRowIndex;
                if (this.grdSummary.Rows.Count <= 0 || rowIndex < 0)
                {
                    return;
                }
                object objParameterName
                    = this.grdSummary.GetCellValue("sub_department_nm", rowIndex);
                if (objParameterName == null) { return; }
                LoadDataFromGridToContainer(this.grdSummary, rowIndex, this.tlpDetails, this.grdSubSatsangCentres);

                //To load Satsang centre grid for Sub Departments
                if (!DbManager.IsNotNull(this.grdSummary.GetCellValue(grdSummaryColNames.objGrdSubSatsangCentres.ToString(), rowIndex)))
                {
                    DataTable dTable = this.dbFacade.QuerySubDepartmentsSatsangCentre(this.intSubID.DisplayTextAsShort.Value).Tables[0];
                    this.grdSubSatsangCentres.RetrieveRecords(dTable, false, RowStates.Old);
                }
                else
                {
                    this.grdSubSatsangCentres.RetrieveRecords((DataTable)this.grdSummary.GetCellValue(grdSummaryColNames.objGrdSubSatsangCentres.ToString(), rowIndex),
                        false, RowStates.New);
                }
            
            }
            catch (Exception ex)
            {
                throw;
            }
        }

      
        public void LoadDetailToSummary()
        {
            try
            {
                int rowIndex = this.grdSummary.CurrentRowIndex;
                if (rowIndex < 0) { return; }
                ////To load Satsang centre grid data for Sub Departments
                //DataTable dataModel = null;
                //dataModel = this.grdSubSatsangCentres.ExportGridModelData(false);
                //this.grdSummary.SetCellValue(grdSummaryColNames.objGrdSubSatsangCentres.ToString(), this.grdSummary.CurrentRowIndex, dataModel);
                this.grdSummary.SetCellValue(grdSummaryColNames.objGrdSubSatsangCentres.ToString(), rowIndex, this.grdSubSatsangCentres.ExportGridModelData(false));
                LoadDataFromContainerToGrid(this.grdSummary, this.grdSummary.CurrentRowIndex, this.tlpDetails);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public void ToggleView(bool showDetails)
        {
            if (showDetails)
            {
                this.scSummaryDetail.Panel1Collapsed = false;
                this.scSummaryDetail.Panel2Collapsed = true;
            }
            else
            {
                this.scSummaryDetail.Panel1Collapsed = true; 
                this.scSummaryDetail.Panel2Collapsed = false;
            }
        }

        public void EnableDetailView(bool enable)
        {

            if (this.CurrentUIMode == UIModes.Insert)
            {
                this.tlpDetails.Enabled = false;
                this.scSummaryDetail.Panel2.Enabled = false; 
            }
         
        }       

        public void ClearDetailView()
        {
            ClearAllControlsOfContainer(this.tlpDetails, false);
        }

        #endregion

        private void chkHasSubDepts_CheckedChanged(object sender, EventArgs e)
        {
            MakeDetailViewEnableDisable();  
        }

        private void MakeDetailViewEnableDisable()
        {
            if (chkHasSubDepts.Checked)
            {
                tlpDetails.Enabled = true;
                this.scSummaryDetail.Panel2.Enabled = true;
            }
            else
            {
                tlpDetails.Enabled = false;
                ClearAllControlsOfContainer(tlpSubDept, false);
                this.scSummaryDetail.Panel2.Enabled = false;
            }
 
        }

        private void grdSatsangCentres_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {
            this.grdSatsangCentres.SetCellValue(grdSatsangCentresColNames.grdDept_effective_from.ToString(),
              e.RowIndex, DateTime.Today.Date);
            this.grdSatsangCentres.SetCellValue(grdSatsangCentresColNames.grdDept_effective_till.ToString(),
                e.RowIndex, DateTime.MaxValue.Date);
        }

        private void grdSubSatsangCentres_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {
            this.grdSubSatsangCentres.SetCellValue(grdSubSatsangCentresColNames.sub_effective_from.ToString(),
              e.RowIndex, DateTime.Today.Date);
            this.grdSubSatsangCentres.SetCellValue(grdSubSatsangCentresColNames.sub_effective_till.ToString(),
                e.RowIndex, DateTime.MaxValue.Date);
        }

               
    }
}