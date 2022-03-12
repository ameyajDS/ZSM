using System;
using System.Collections;
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


namespace DCC.ZOS.ZSM.ENT
{
    partial class Qualifications : CDBAbstractScreen
    {

        public Qualifications()
        {
            InitializeComponent();
            this.grdSubjects.DeleteRowMenuEnabled = false;
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
            qualification_id = 0,
            qualification_type,
            qualification_cd,
            qualification_nm,
            remarks,
            effective_from,
            effective_till,
            txn_ts
                        
        }

        private enum grdSubjectColNames
        {
            qlfctn_subject_id = 0,
            effective_from_subject,
            effective_till_subject
            
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
                this.intQualID.ReadOnly = true;

            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intQualID.ReadOnly = false;
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
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = this.intQualID.DisplayText;
            this.LoadSubjectGrid(this.intQualID.DisplayTextAsShort);
            this.intQualID.ReadOnly = true;
        }
       
        private void LoadSubjectGrid(short? shtQualId)
        {
            DataSet dset;
            dset = this.dbFacade.QueryQualificationsQlfctnSubject(shtQualId);
            this.grdSubjects.RetrieveRecords(dset.Tables[0], false, RowStates.Old);
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewQualificationSQLSelectQuery query = new ViewQualificationSQLSelectQuery();

            //This line avoids the if condition and specifies that qualification_id is a primary/indexed key.
            query.qualification_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intSurgeryId 
            //field as the between clause bounds. 
            query.qualification_id.Equal(this.intQualID.DisplayText);
            //]]

            query.qualification_nm.Contains(this.txtQualName.DisplayText);
            query.qualification_type.Contains(this.lookupQualificationTypes.IdText);
            query.qualification_cd.Contains(this.txtCode.DisplayText);
            query.remarks.Contains(this.txtRemarks.DisplayText);

            //[[This pair will specify that get me all those records which are effective as on a date,
            //specified by the date range pair (notice that at run time in query mode the pair hides one 
            //field and allows only one field to be entered)
            query.effective_from.LessThanEqualTo(this.dtmEffectiveRange.FromDate);
            query.effective_till.GreaterThanEqualTo(this.dtmEffectiveRange.FromDate);
            //]]
            return dbFacade.ExecuteSelectQuery(query);
        }


        public override void CreateData()
        {
            short generatedId = default(short);
            this.dbFacade.InsertQualification(ref generatedId,
                                                this.lookupQualificationTypes.IdText,
                                                this.txtCode.DisplayText,
                                                this.txtQualName.DisplayText,
                                                this.txtRemarks.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.AddDbTasks(SaveSubjectsGridAsTask((short?)generatedId));
            this.dbFacade.ExecuteDbTasks();
            //]] 
        }

        public override void UpdateData()
        {
            dbFacade.AddDbTasks(SaveSubjectsGridAsTask((short?)this.intQualID.DisplayTextAsInteger));
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            dbFacade.AddDbTask(this.dbFacade.UpdateQualificationAsTask((short)this.intQualID.DisplayTextAsInteger.Value,
                                                this.lookupQualificationTypes.IdText,
                                                this.txtCode.DisplayText,
                                                this.txtQualName.DisplayText,
                                                this.txtRemarks.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate,
                                                txn_ts
                                                ));
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.ExecuteDbTasks();
            //]]                           

        }

        public override void DeleteData()
        {
           byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteQualification((short)this.intQualID.DisplayTextAsInteger.Value,txn_ts);
        }

        private List<string> SaveSubjectsGridAsTask(short? medicalQualId)
        {
            List<string> allTasks = new List<string>();
            try
            {

                if (this.grdSubjects.Rows.Count > 0)
                {
                    Hashtable overiddingParamValues = new Hashtable();
                    overiddingParamValues.Add("qualification_id", medicalQualId);
                    overiddingParamValues.Add("old_qualification_id", medicalQualId);
                    allTasks = this.grdSubjects.GetAllDBTasks(this.dbFacade, "DeleteQualificationsQlfctnSubjectAsTask", "UpdateQualificationsQlfctnSubjectAsTask", "InsertQualificationsQlfctnSubjectAsTask", overiddingParamValues, string.Empty, string.Empty, string.Empty);
                        
                }

                return allTasks;
            }
            catch
            {
                throw;
            }
           
        }



        private void grdSubjects_ValidateRow(object sender, ValidateRowEventArgs e)
        {
            DateTime? effectiveFrom = grdSubjects.AsDTM(grdSubjectColNames.effective_from_subject.ToString(), e.RowIndex);
            DateTime? effectiveTill = grdSubjects.AsDTM(grdSubjectColNames.effective_till_subject.ToString(), e.RowIndex);
            if (effectiveFrom.HasValue && effectiveTill.HasValue && effectiveTill.Value < effectiveFrom.Value)
            {
                e.IsValid = false;
                UIManager.ShowMessage(MsgCodes.GreaterValueReqd, "Effective Till in Subjects grid|Effective From", MessageTypes.Error);
            }
            
            
        }

        private void grdSubjects_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {
            this.grdSubjects.SetCellValue(grdSubjectColNames.effective_from_subject.ToString(),
                e.RowIndex, DateTime.Today.Date);
            this.grdSubjects.SetCellValue(grdSubjectColNames.effective_till_subject.ToString(),
                e.RowIndex, DateTime.MaxValue.Date);
        }
       

       
        

    
    }
}