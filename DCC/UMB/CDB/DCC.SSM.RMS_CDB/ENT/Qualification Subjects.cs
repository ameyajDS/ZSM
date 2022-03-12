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

namespace DCC.UMB.CDB2.ENT
{
    public partial class QualificationSubjects : AbstractScreen
    {
        private CDB_AppDbFacade dbFacade;
        private DataTable dtSubjectDetails;

        public QualificationSubjects()
        {
            InitializeComponent();
        }

        #region Nested type: grdSubjectColNames

        private enum grdSubjectColNames
        {
            qlfctn_subject_id = 0,
            qlfctn_subject_cd,
            qlfctn_subject_nm,
            description,
            effective_from,
            effective_till,
            TxnStatus
        }

        #endregion

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_QUALIFICATION_SUBJECT;
            } 
        }

        protected override void InitializeDbFacade()
        {
            if (dbFacade == null)
                dbFacade = new CDB_AppDbFacade("CDB_APP");
            // Initialize DBFacade for Specify Application ID
        }

        private void Subjects_Load(object sender, EventArgs e)
        {
            grdSubjects.AddUniqueColumnConstraint(false, false, grdSubjectColNames.qlfctn_subject_cd.ToString().Trim());
            grdSubjects.AddUniqueColumnConstraint(false, false, grdSubjectColNames.qlfctn_subject_nm.ToString().Trim());
           
        }

        private DataTable dtSubject()
        {
            dtSubjectDetails = dbFacade.ObjDBManager.ExecuteSQL("Select * from qlfctn_subjects").Tables[0];
            return dtSubjectDetails;
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
     //Replace No to Yes by rajiv
            ReloadGridFromDatabase("Yes");           
        }

        private void btnAll_Click(object sender, EventArgs e)
        {
            if (btnAll.Text == "Show Current")
            {
                btnAll.Text = "Show All";
                ReloadGridFromDatabase("Yes");
            }
            else
            {
                btnAll.Text = "Show Current";
                ReloadGridFromDatabase("No");
            }
        }

        private void ReloadGridFromDatabase(string showCurrent)
        {
            // Reload the Grid From DataBase
            DataTable subjectDetail = dbFacade.QryQlfctn_Subjects(showCurrent).Tables[0];
            grdSubjects.RetrieveRecords(subjectDetail, false, RowStates.Old);
            
        }

        public override bool IsReadyToSave()
        {
            return true;
        }

        public override void Save()
        {
            try
            {
                dbFacade.ClearDbTasks(); // Clear All the DbTasks before Begining of Transaction    
                dbFacade.BeginTrans(); // Transaction Begin

                List<DCCDataRowView> deleteRows = grdSubjects.GetRowsForState(RowStates.Deleted);
                foreach (DCCDataRowView rv in deleteRows)
                {
                    short? SubjectID = (short)rv.AsInt(grdSubjectColNames.qlfctn_subject_id.ToString());
                    
                    //Task for Auding when any row is deleted by User
                    string DeleteAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId),  "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                                     GlobalAppVariables.AppContext.UserRoleId, "D", ScreenId, SubjectID.ToString(), null);
                    this.dbFacade.AddDbTask(DeleteAuditOperation);

                    string DelQualSubject = this.dbFacade.DelQlfctn_SubjectsAsTask(SubjectID);
                    this.dbFacade.AddDbTask(DelQualSubject);
                
                }
                List<DCCDataRowView> updateRows = grdSubjects.GetRowsForState(RowStates.Updated);
                foreach (DCCDataRowView rv in updateRows)
                {
                    short? qlfctn_subject_id = (short)rv.AsInt(grdSubjectColNames.qlfctn_subject_id.ToString());
                    string qlfctn_subject_cd = rv.AsStr(grdSubjectColNames.qlfctn_subject_cd.ToString()).Trim();
                    string qlfctn_subject_nm = rv.AsStr(grdSubjectColNames.qlfctn_subject_nm.ToString()).Trim();
                    string description       = rv.AsStr(grdSubjectColNames.description.ToString());
                    DateTime? effectiveFrom = (DateTime)rv.AsDTM(grdSubjectColNames.effective_from.ToString());
                    DateTime? effectiveTill = (DateTime)rv.AsDTM(grdSubjectColNames.effective_till.ToString());
                    
                   
                    //Task for Auding when any row is Updated by User
                    string UpdateAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId),  "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                                    GlobalAppVariables.AppContext.UserRoleId, "U", ScreenId, qlfctn_subject_id.ToString(), null);
                    this.dbFacade.AddDbTask(UpdateAuditOperation);
                  
                    string UpdateQualSubject = this.dbFacade.Updqlfctn_subjectsAsTask(qlfctn_subject_id, qlfctn_subject_cd, qlfctn_subject_nm, description,
                                                          effectiveFrom, effectiveTill);

                    this.dbFacade.AddDbTask(UpdateQualSubject);
                }

                List<DCCDataRowView> insertedRows = grdSubjects.GetRowsForState(RowStates.New);
                foreach (DCCDataRowView rv in insertedRows)
                {
                    short qlfctn_subject_id = 0;
                    string qlfctn_subject_cd = rv.AsStr(grdSubjectColNames.qlfctn_subject_cd.ToString()).Trim();
                    string qlfctn_subject_nm = rv.AsStr(grdSubjectColNames.qlfctn_subject_nm.ToString()).Trim();
                    string description = rv.AsStr(grdSubjectColNames.description.ToString());
                    DateTime? effectiveFrom = (DateTime)rv.AsDTM(grdSubjectColNames.effective_from.ToString());
                    DateTime? effectiveTill = (DateTime)rv.AsDTM(grdSubjectColNames.effective_till.ToString());

                    this.dbFacade.Insqlfctn_subjects(ref qlfctn_subject_id, qlfctn_subject_cd, qlfctn_subject_nm, description,
                                                          effectiveFrom, effectiveTill);

                    string InsertAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId),  "CDB_APP", GlobalAppVariables.AppContext.UserNumber,
                                                               GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Insert_Operation, ScreenId, qlfctn_subject_id.ToString(), null);
                    this.dbFacade.AddDbTask(InsertAuditOperation);
                }
                dbFacade.ExecuteDbTasks(); // All DbTasks Executed
                dbFacade.CommitTrans(); // Commited All Transaction
                //Replace No to Yes by rajiv
                ReloadGridFromDatabase("Yes");
                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
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
        private void grdSubjects_ValidateRow(object sender, ValidateRowEventArgs e)
        {
            DateTime? effectiveFrom = grdSubjects.AsDTM(grdSubjectColNames.effective_from.ToString(), e.RowIndex);
            DateTime? effectiveTill = grdSubjects.AsDTM(grdSubjectColNames.effective_till.ToString(), e.RowIndex);
            if (effectiveFrom.HasValue && effectiveTill.HasValue && effectiveTill.Value < effectiveFrom.Value)
            {
                e.IsValid = false;
                UIManager.ShowMessage(MsgCodes.GreaterValueReqd, "Effective Till|Effective From", MessageTypes.Error);
            }
        }       
  }
}