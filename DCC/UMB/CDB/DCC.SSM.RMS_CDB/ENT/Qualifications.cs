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
using DCC.UMB.CDF.MGMT.Global;
using DCC.SSM.CDB2.Utils;

namespace DCC.UMB.CDB2.ENT
{
    public partial class Qualifications : AbstractScreen
    {
        private CDB_AppDbFacade dbFacade;
        private DataTable dtQualification;
        private short Qualification_id;
        private byte[] TxnStatus;

        public Qualifications()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_QUALIFICATIONS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            qualificationid = 0,
            qualification_type,
            qualification_cd,
            qualification_nm,
            qualification_remarks,
            effective_from,
            effective_till,
            txn_ts
        }

        #endregion

        #region Nested type: grdSubjectsColNames

        private enum grdSubjectsColNames
        {
            SubjectID,
            Subject_nm,
            effectiveFrom,
            effectiveTill,
            OldEffectiveFrom,
            OldEffectiveTill
        }

        #endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        private void LoadDropDownValues()
        {
            cmbType.SetDataSource ( GetQualificationType(), "qualification_type", "qualification_type"); // Filling DataSource of Combo Box
        }

        private DataTable GetQualificationType()
        {
            if (dtQualification == null) // Check here if DataTable is Null or Not.
            {
                dtQualification = dbFacade.ObjDBManager.ExecuteSQL("Select * from qualification_types").Tables[0];
            }
            return dtQualification;
        }

        private void Qualifications_Load(object sender, EventArgs e)
        {
            grdSubjects.AddUniqueColumnConstraint(false, false, grdSubjectsColNames.Subject_nm.ToString());
            grdList.AddUniqueColumnConstraint(false, false, grdListColNames.qualification_cd.ToString());
            grdList.AddUniqueColumnConstraint(false, false, grdListColNames.qualification_nm.ToString());
            LoadDropDownValues();
            // Function Used For Load All the DropDowns Of Screen
        }

        protected override void InitializeDbFacade()
        {
            if (dbFacade == null)
                dbFacade = new CDB_AppDbFacade("CDB_APP");
            // Initialize DBFacade for Specify Application ID
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);

            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                splitContainer1.Panel2Collapsed = true;
                splitContainer1.Panel1Collapsed = false;
                //your custom after clearing the screen controls go here
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                splitContainer1.Panel1Collapsed = false;
                splitContainer1.Panel2Collapsed = true;
            }
            else if (uiMode == UIModes.Retrieve)
            {
            }
            else if (uiMode == UIModes.List)
            {
                splitContainer1.Panel1Collapsed = true;
                splitContainer1.Panel2Collapsed = false;
            }
            else if (uiMode == UIModes.Browse)
            {
                splitContainer1.Panel1Collapsed = false;
                splitContainer1.Panel2Collapsed = true;
            }
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewqualificationsSQLSelectQuery objViewqualificationsSQLSelectQuery =
                new ViewqualificationsSQLSelectQuery();

            objViewqualificationsSQLSelectQuery.qualification_cd.Equal(txtCode.DisplayText.Trim());
            objViewqualificationsSQLSelectQuery.qualification_type.Equal(cmbType.SelectedValueAsStr);
            objViewqualificationsSQLSelectQuery.qualification_nm.StartsWith(txtDescription.DisplayText.Trim());
            objViewqualificationsSQLSelectQuery.remarks.Contains(txtRemarks.DisplayText.Trim());
            if (txtEffectiveFrom.EditingControlFormattedValue != null)
            {
                objViewqualificationsSQLSelectQuery.effective_from.Equal(txtEffectiveFrom.DisplayText);
            }
            if (txtEffectiveTill.EditingControlFormattedValue != null)
            {
                objViewqualificationsSQLSelectQuery.effective_till.Equal(txtEffectiveTill.DisplayText);
            }

            objViewqualificationsSQLSelectQuery.AddOrderByClause(objViewqualificationsSQLSelectQuery.qualification_nm,
                                                                 OrderByTypes.ASC);
            return dbFacade.ExecuteSelectQuery(objViewqualificationsSQLSelectQuery);
            // Retrival of Data from View
        }

        public override void LoadBrowseView(int rowIndex)
        {
            // All the Details, Retrive from Database are Display in all the fields through GridList.

            Qualification_id = (short) grdList.AsShort(grdListColNames.qualificationid.ToString(), rowIndex);
            txtCode.DisplayText = grdList.AsStr(grdListColNames.qualification_cd.ToString(), rowIndex);
            cmbType.SelectedValue = grdList.GetCellValue(grdListColNames.qualification_type.ToString(), rowIndex);
            txtDescription.DisplayText = grdList.AsStr(grdListColNames.qualification_nm.ToString(), rowIndex);
            txtRemarks.DisplayText = grdList.AsStr(grdListColNames.qualification_remarks.ToString(), rowIndex);
            txtEffectiveFrom.DisplayTextAsDateTime =
                (DateTime) grdList.AsDTM(grdListColNames.effective_from.ToString(), rowIndex);
            txtEffectiveTill.DisplayTextAsDateTime =
                (DateTime) grdList.AsDTM(grdListColNames.effective_till.ToString(), rowIndex);
            TxnStatus = grdList.AsTxnTs(grdListColNames.txn_ts.ToString(), rowIndex);

            // This DataTable is Used For filling the grdSubjects DataGrid 
            DataTable SubjectsDetails = dbFacade.Qryqualifications_qlfctn_subjects(Qualification_id).Tables[0];
            grdSubjects.RetrieveRecords(SubjectsDetails, false, RowStates.Old);

            txtCode.Focus();
        }

        public override void ClearControls()
        {
            try
            {
                ClearDetailView();
                grdSubjects.RemoveAllRecords();
                grdList.RemoveAllRecords();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            // Clear the screen controls here
        }

        public void ClearDetailView()
        {
            //LoadDropDownValues();
            ClearAllControlsOfContainer(this, true);
            txtCode.Focus();
           
        }

        public override bool IsReadyToSave()
        {
            bool toReturn = base.IsReadyToSave();
            if (!toReturn)
            {
                return false;
            }
          
            if (!CDBUtility.CompareTwoDCCDateTimeField(txtEffectiveFrom, txtEffectiveTill, ScreenId, CurrentUIMode))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public override void Save()
        {
            try
            {
                dbFacade.ClearDbTasks(); // Clear All the DbTasks before Begining of Transaction    
                dbFacade.BeginTrans(); // Transaction Begin


                DateTime? Qual_EffectiveFrom = txtEffectiveFrom.DisplayTextAsDateTime;
                DateTime? Qual_EffectiveTill = txtEffectiveTill.DisplayTextAsDateTime;

                if (CurrentUIMode == UIModes.Insert)
                {
                    this.dbFacade.Insqualifications(cmbType.SelectedValueAsStr, txtCode.DisplayText.Trim(),
                                                         txtDescription.DisplayText.Trim(),
                                                         txtRemarks.DisplayText.Trim(), Qual_EffectiveFrom,
                                                         Qual_EffectiveTill, ref Qualification_id);

                    string InsertAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId),  "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                                    GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Insert_Operation, ScreenId, Qualification_id.ToString(), null);
                    this.dbFacade.AddDbTask(InsertAuditOperation);
                
                }
                else
                {
                    //Task for Auding when any row is Updated by User
                    string UpdateAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId),  "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                                    GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Modify_Operation, ScreenId, Qualification_id.ToString(), null);
                    this.dbFacade.AddDbTask(UpdateAuditOperation);

                   string updQualification = this.dbFacade.UpdqualificationsAsTask(Qualification_id, cmbType.SelectedValueAsStr,
                                                         txtCode.DisplayText.Trim(), txtDescription.DisplayText.Trim(),
                                                         txtRemarks.DisplayText.Trim(), Qual_EffectiveFrom,
                                                         Qual_EffectiveTill, TxnStatus);
                   this.dbFacade.AddDbTask(updQualification);
                }

                List<string> lstDbTasksForSubjectGrid = GetDbTaskForSubjectsGrid(Qualification_id);
                dbFacade.AddDbTasks(lstDbTasksForSubjectGrid);

                dbFacade.ExecuteDbTasks(); // All DbTasks Executed
                dbFacade.CommitTrans(); // Commited All Transaction
                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
                ClearDetails(CurrentUIMode);
                    // Fuction Use For Clear All the Controls After Sucessfully Save Data in Insert Mode
            }
            catch
            {
                dbFacade.RollbackTrans(); // RollBack of Transaction if Any Exception Found
                throw;
            }
            finally
            {
                dbFacade.ClearDbTasks(); // Finally Clear All the DbTasks
            }
        }

        private void ClearDetails(UIModes CurrentUIMode)
        {
            if (CurrentUIMode == UIModes.Insert)
                ClearControls();
        }

        private List<string> GetDbTaskForSubjectsGrid(short qualificationid)
        {
            List<string> dbTasks = new List<string>();
            List<DCCDataRowView> deletedRows = grdSubjects.GetRowsForState(RowStates.Deleted);
            foreach (DCCDataRowView rv in deletedRows)
            {
               short? Subject_id = short.Parse(rv.AsLookupResult(grdSubjectsColNames.Subject_nm.ToString()).ValueMember.ToString());
               
                //Task for Auding when any row is deleted by User
               string DeleteAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId), "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                                GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Delete_Operation, ScreenId, Subject_id.ToString(), null);
               this.dbFacade.AddDbTask(DeleteAuditOperation);

               string delTask = dbFacade.Delqualifications_qlfctn_subjectsAsTask(qualificationid, Subject_id);
               dbTasks.Add(delTask);
            }
            List<DCCDataRowView> updateRows = grdSubjects.GetRowsForState(RowStates.Updated);
            foreach (DCCDataRowView rv in updateRows)
            {
                short? OldSubject_id = short.Parse(rv.AsStr(grdSubjectsColNames.SubjectID.ToString()));
                short? Subject_id =
                    short.Parse(rv.AsLookupResult(grdSubjectsColNames.Subject_nm.ToString()).ValueMember.ToString());
                DateTime? effectiveFrom = DateTime.Parse(rv.AsDTM(grdSubjectsColNames.effectiveFrom.ToString()).ToString());
                DateTime? effectiveTill = DateTime.Parse(rv.AsDTM(grdSubjectsColNames.effectiveTill.ToString()).ToString());


                //Task for Audting when any row is Updated by User
                string UpdateAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId),  "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                                GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Modify_Operation, ScreenId, Subject_id.ToString(), null);
                this.dbFacade.AddDbTask(UpdateAuditOperation);


                string updateTask =
                    dbFacade.Updqualifications_qlfctn_subjectsAsTask(qualificationid, OldSubject_id, Subject_id,
                                                                     effectiveFrom, effectiveTill);
                dbTasks.Add(updateTask);
            }

            List<DCCDataRowView> insertedRows = grdSubjects.GetRowsForState(RowStates.New);
            foreach (DCCDataRowView rv in insertedRows)
            {
                
                short? Subject_id = short.Parse(rv.AsLookupResult(grdSubjectsColNames.Subject_nm.ToString()).ValueMember.ToString());
                DateTime? effectiveFrom = (DateTime)rv.AsDTM(grdSubjectsColNames.effectiveFrom.ToString());
                DateTime? effectiveTill = (DateTime)rv.AsDTM(grdSubjectsColNames.effectiveTill.ToString());

                string InsertAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId), "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                               GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Insert_Operation, ScreenId, Subject_id.ToString(), null);
                this.dbFacade.AddDbTask(InsertAuditOperation);

                string insTask = dbFacade.Insqualifications_qlfctn_subjectsAsTask(qualificationid, Subject_id, effectiveFrom,effectiveTill);
                dbTasks.Add(insTask);
            }
            return dbTasks;
        }

        private void grdSubjects_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            //This Event Use for Set the value of Selected Lookup Dialog in Grid's Cell
            DateTime Effective_From = DateTime.Parse(e.LookupResult.SelectedRecords[0]["effective_from"].ToString());
            DateTime Effective_till = DateTime.Parse(e.LookupResult.SelectedRecords[0]["effective_till"].ToString());

            grdSubjects.SetCellValue(grdSubjectsColNames.effectiveFrom.ToString(), grdSubjects.CurrentRowIndex,
                                     Effective_From);
            grdSubjects.SetCellValue(grdSubjectsColNames.effectiveTill.ToString(), grdSubjects.CurrentRowIndex,
                                     Effective_till);
        }


        public override void DeleteRecord()
        {           
            try
            {
                this.dbFacade.BeginTrans();
                this.dbFacade.ClearDbTasks();
                //Task for Auding when any row is deleted by User
                string DeleteAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId),  "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                                 GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Delete_Operation, ScreenId, Qualification_id.ToString(), null);
                this.dbFacade.AddDbTask(DeleteAuditOperation);

                string DelTask = this.dbFacade.DelqualificationsAsTask(Qualification_id);
                this.dbFacade.AddDbTask(DelTask);

                this.dbFacade.ExecuteDbTasks();
                this.dbFacade.CommitTrans();
                UIManager.ShowMessage(MsgCodes.RecordDeleted, string.Empty, MessageTypes.Plain);
            }
            catch
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
            finally
            {
                this.dbFacade.ClearDbTasks();
            }
        }
       


        private void grdSubjects_ValidateRow(object sender, ValidateRowEventArgs e)
        {

            DateTime? OldEffectiveFrom = grdSubjects.AsDTM(grdSubjectsColNames.OldEffectiveFrom.ToString(), e.RowIndex);
            DateTime? OldEffectiveTill = grdSubjects.AsDTM(grdSubjectsColNames.OldEffectiveTill.ToString(), e.RowIndex);
            DateTime? EffectiveFrom = grdSubjects.AsDTM(grdSubjectsColNames.effectiveFrom.ToString(), e.RowIndex);
            DateTime? EffectiveTill = grdSubjects.AsDTM(grdSubjectsColNames.effectiveTill.ToString(), e.RowIndex);

            if (EffectiveFrom < OldEffectiveFrom)
            {
                UIManager.ShowMessage("Effective From Should be More than equal to " + OldEffectiveFrom.Value.ToLongDateString()+ "", string.Empty, MessageTypes.Error);
                e.IsValid = false;
            }

            if (EffectiveTill > OldEffectiveTill)
            {
                UIManager.ShowMessage("Effective Till Should be Less than equal to " + OldEffectiveTill.Value.ToLongDateString() + "", string.Empty, MessageTypes.Error);
                e.IsValid = false;
            }
        }

    }
}