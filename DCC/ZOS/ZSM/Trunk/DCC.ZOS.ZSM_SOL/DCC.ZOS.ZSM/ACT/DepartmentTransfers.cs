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
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.Utils;
using System.Collections;
using DCC.ZOS.ZSM.Controls.Misc;

namespace DCC.ZOS.ZSM.ACT
{
    partial class DepartmentTransfers : ZSMAbstractScreen2
    {
        private CDB_APPDbFacade dbCDBFacade = new CDB_APPDbFacade(GlobalAppVariables.AppContext.ApplicationId);
        List<string> sewaTeamTfTask = new List<string>();
        bool bCallSewaTeamTransfers = true;
        DateTime? systemDateTime;


        public DepartmentTransfers()
        {
            InitializeComponent();
            this.sewadarIDLookup.SttsCode = "SttsScrTrf";
            this.txtGRNo.SttsCode = "SttsScrTrf";
            this.txtSewadarName.SttsCode = "SttsScrTrf";
            this.departmentChooserOld.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
            this.departmentChooserNew.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
            DataTable dt = null;
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            dt = objDbManager.ExecuteSQL("SELECT satsang_centre_type FROM CDB..satsang_centre_types").Tables[0];

            this.cmbSatsangCentreType.SetDataSource(dt, "satsang_centre_type", "satsang_centre_type", true);
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_DEPARTMENT_TRANSFERS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
          
        }
             
        #endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        public void SetDepartments(DepartmentChooser oldDep, DepartmentChooser newDep)
        {
            oldDep.SelectedDepartment = this.departmentChooserOld.SelectedDepartment;
            oldDep.SelectedDepartmentName =this.departmentChooserOld.SelectedDepartmentName;
            oldDep.SelectedSubDepartment =this.departmentChooserOld.SelectedSubDepartment;
            oldDep.SelectedSubDepartmentName = this.departmentChooserOld.SelectedSubDepartmentName;
            newDep.SelectedDepartment = this.departmentChooserNew.SelectedDepartment;
            newDep.SelectedDepartmentName = this.departmentChooserNew.SelectedDepartmentName;
            newDep.SelectedSubDepartment = this.departmentChooserNew.SelectedSubDepartment;
            newDep.SelectedSubDepartmentName = this.departmentChooserNew.SelectedSubDepartmentName;
        }

        public void AddDbTasks(string task)
        {
            sewaTeamTfTask.Add(task); 
        }

        public override void ClearControls()
        {
            base.ClearControls();
            bCallSewaTeamTransfers = true;
            sewaTeamTfTask.Clear();
            DataTable dt = null;
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();

            dt = objDbManager.ExecuteSQL(string.Format("SELECT satsang_centre_id, satsang_centre_cd AS centre_cd,centre_nm = '{1}',satsang_centre_type FROM cdb..satsang_centres WHERE satsang_centre_id = {0}", ZSMUtility.GetSatsangCentreId(), ZSMUtility.GetSatsangCentreName())).Tables[0];

            this.LoadDataToContainer(dt, tlpTop);

        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            systemDateTime = dbFacade.GetSystemDate();
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.dtEffectiveDate.DisplayTextAsDateTime = systemDateTime;
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
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

        private void makeEditableOnlyInQueryMode(bool isQuerMode)
        {
            this.dtDepartment.ReadOnly = !isQuerMode;
            this.departmentChooserOld.ReadOnly = !isQuerMode;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarsTransfersSQLSelectQuery query = new ViewSewadarsTransfersSQLSelectQuery();

            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.effective_dt.Between(this.dtEffectiveDate);
            query.sewadar_id.Equal(this.sewadarIDLookup.DisplayText);
            query.sewadar_grno.Equal(this.txtGRNo.DisplayText);
            query.full_nm.Contains(this.txtSewadarName.DisplayText);

            query.department_dt.Between(this.dtDepartment);
            query.department_nm.Contains(this.departmentChooserNew.lkpDepartment.DisplayText);
            query.sub_department_nm.Contains(this.departmentChooserNew.lkpSubDepartment.DisplayText);
            query.old_department_nm.Contains(this.departmentChooserOld.lkpDepartment.DisplayText);
            query.old_sub_department_nm.Contains(this.departmentChooserOld.lkpSubDepartment.DisplayText);

            query.department_id.Equal(this.departmentChooserNew.SelectedDepartment);
            query.sub_department_id.Equal(this.departmentChooserNew.SelectedSubDepartment);
            query.old_department_id.Equal(this.departmentChooserOld.SelectedDepartment);
            query.old_sub_department_id.Equal(this.departmentChooserOld.SelectedSubDepartment);

            query.AddOrderByClause(query.sewadar_id, OrderByTypes.ASC);
            query.AddOrderByClause(query.sewadar_grno, OrderByTypes.ASC);
            return this.dbFacade.ExecuteSelectQuery(query);            
        }

        public override void LoadBrowseView(int rowIndex)
        {
            makeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.tlpTopMost, this.tlpTop);
            this.ParametersForLogOperation = GetHashTable();
        }

        public override bool IsReadyToSave()
        {
            if(this.CurrentUIMode == UIModes.Browse)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Department Transfer|it is not allowed", MessageTypes.Error);
                return false;
            }

            if (bCallSewaTeamTransfers)
            {
                //[[Transfer date cannot be in future.
                if (this.dtEffectiveDate.DisplayTextAsDateTime > systemDateTime)
                {
                    UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, "Effective Date | Today's date", MessageTypes.Error);
                    return false;
                }
                //]]

                DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select 1 sewadar_id from sewadars WHERE sewadar_id = '{0}' AND current_satsang_centre_id = '{1}' AND "+
                    " gender LIKE (select genders_allowed from departments_satsang_centres where department_id = '{2}' AND satsang_centre_id = '{3}')+'%'" +
                    "", this.txtSewadarName.IdText, ZSMUtility.GetSatsangCentreId(), this.departmentChooserNew.SelectedDepartment, ZSMUtility.GetSatsangCentreId())).Tables[0];
                if (dT.Rows.Count == 0)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, "department Transfers| Sewadar Gender is not allowed for sewa in the department.", MessageTypes.Error);
                    return false;
                }
                string isTeamTf = "N";
                this.dbFacade.ValidateDepartmentTransfer(ZSMUtility.GetSatsangCentreId(), this.txtGRNo.DisplayText, this.dtEffectiveDate.DisplayTextAsDateTime, ref isTeamTf);
                bCallSewaTeamTransfers = false;
                if (isTeamTf.Contains("Y"))
                {
                    UIManager.OpenForm(typeof(SewadarTeamTransfers), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, this.txtSewadarName.IdText + "|" + this.txtSewadarName.DisplayText + "|" + this.dtEffectiveDate.DisplayText, this, this);
                }
            }
            return base.IsReadyToSave();
        }
        public override void SetLookupResult(LookupResult result, System.Windows.Forms.Control targetControl)
        {
            if (targetControl == this)
            {
                if (sewaTeamTfTask.Count != 0)
                {
                    this.dbFacade.AddDbTasks(sewaTeamTfTask);
                }
                else
                {
                    this.sewaTeamTfTask.Clear();
                    this.bCallSewaTeamTransfers = false;
                }
            }
            base.SetLookupResult(result, targetControl);
        }


        private Hashtable GetHashTable()
        {
            Hashtable tbl = new Hashtable();
            tbl.Add("p_transaction_dt", this.dtEffectiveDate.DisplayText);
            tbl.Add("p_satsang_centre_id", ZSMUtility.GetSatsangCentreId());
            tbl.Add("p_sewadar_grno", this.txtGRNo.DisplayText);
            return tbl;
        }
        public override void CreateData()
        {
            try
            {
                this.dbFacade.BeginTrans();
                this.dbFacade.InsertSewadarsTransfer(ZSMUtility.GetSatsangCentreId(),
                                                     this.txtGRNo.DisplayText,
                                                     this.dtEffectiveDate.DisplayTextAsDateTime,
                                                     departmentChooserOld.SelectedDepartment,
                                                     departmentChooserOld.SelectedSubDepartment,
                                                     departmentChooserNew.SelectedDepartment,
                                                     departmentChooserNew.SelectedSubDepartment,
                                                     this.txtRemarks.DisplayText
                                                     );
                this.dbFacade.ExecuteDbTasks();//DONOT REMOVE
                this.ParametersForLogOperation = GetHashTable();
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                bCallSewaTeamTransfers = true;
                sewaTeamTfTask.Clear();
                throw ex;
            }
        }

        private void txtSewadarName_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                ZSMUtility.setDisplayValueText(this.txtGRNo, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_grno"]));
                this.txtGRNo.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                ZSMUtility.setDisplayValueText(this.sewadarIDLookup, DbManager.GetString(e.LookupResult.SelectedRecords[0]["sewadar_id"]));
                this.sewadarIDLookup.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                DataTable dt = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select department_dt, department_nm, department_id, sub_department_id, sub_department_nm, gender, sewadar_status_nm, sewadar_status_dtm from ViewSewadarHeader WHERE sewadar_grno = '{0}' AND satsang_centre_id = '{1}'", e.LookupResult.SelectedRecords[0]["sewadar_grno"], ZSMUtility.GetSatsangCentreId())).Tables[0];
                departmentChooserOld.SelectedDepartment = DbManager.GetNullableShort(dt.Rows[0]["department_id"]);
                departmentChooserOld.SelectedDepartmentName = dt.Rows[0]["department_nm"].ToString();
                departmentChooserOld.SelectedSubDepartment = DbManager.GetNullableShort(dt.Rows[0]["sub_department_id"]);
                departmentChooserOld.SelectedSubDepartmentName = dt.Rows[0]["sub_department_nm"].ToString();
                dtDepartment.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dt.Rows[0]["department_dt"]);
                this.LoadDataToContainer(dt, this.tlpSewadar, this.sewadarIDLookup, this.txtSewadarName, this.txtGRNo);
            }
        }

        private void txtGRNo_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void txtGRNo_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.txtGRNo.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.txtSewadarName, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.txtSewadarName.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.txtSewadarName_LookupResultSet(null, e);
                }
            }

        }

        private void sewadarIDLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void sewadarIDLookup_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.sewadarIDLookup.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.txtSewadarName, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.txtSewadarName.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.txtSewadarName_LookupResultSet(null, e);
                }
            }
        }

        private void txtSewadarName_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void DepartmentTransfers_Load(object sender, EventArgs e)
        {

        }


    }
}
