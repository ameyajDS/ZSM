using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.Utils;
using DCC.ZOS.ZSM.Controls.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class Speakers : ZSMAbstractScreen
    {
        public Speakers()
        {
            InitializeComponent();
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
            populateDefaultValues();
        }

        private enum GridApprovalColumns
        {
            request_for_speaker_type,
            is_approval,
            approval_dt,
            request_dt,
            reference_no,
            reference_dt,
            audition_remarks,
            review_remarks,
            review_sewadar_id,
            review_non_sewadar_nm,
            remarks,
            txn_ts_aud
        }

        private enum GridTrainingColumns
        {
            training_for_speaker_type,
            training_dt,
            is_attended,
            request_dt,
            reference_no,
            reference_dt,
            remarks,
            txn_ts_training
        }

        private enum SpeakerTypeEnum
        {
            [Description("Satsang Karta")]
            Satsang_Karta,
            [Description("Satsang Reader")]
            Satsang_Reader,
            [Description("Pathi")]
            Pathi,
            [Description("Bal Satsang Karta")]
            Bal_Satsang_Karta,
            [Description("Bal Pathi")]
            Bal_Pathi
        }

        public override string ScreenId { get { return Screens.ACT_SPEAKERS; } }

        public override DCCGrid ListViewGrid
        {
            get
            {
                return this.grdList;
            }
        }

        #region PublicMethods
        public void populateDefaultValues()
        {
            DataTable dt = null;
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            dt = objDbManager.ExecuteSQL("SELECT satsang_centre_type FROM CDB..satsang_centre_types").Tables[0];
            this.cmbSatsangCentreType.SetDataSource(dt, "satsang_centre_type", "satsang_centre_type", true);
            DataTable SpeakerTypeDT = new DataTable();
            SpeakerTypeDT.Columns.Add(new DataColumn("request_for_speaker_type", typeof(string)));
            foreach (SpeakerTypeEnum speakerType in Enum.GetValues(typeof(SpeakerTypeEnum)))
            {
                DataRow row = SpeakerTypeDT.NewRow();
                row[0] = GetDescription(speakerType);
                SpeakerTypeDT.Rows.Add(row);
            }
            this.grdApproval.SetComboBoxColumnDataSource("request_for_speaker_type", SpeakerTypeDT, "request_for_speaker_type", "request_for_speaker_type");
        }

        #endregion

        #region OverrideMethods
        public override bool IsReadyToSave()
        {
            return base.IsReadyToSave();
        }

        public override void LoadBrowseView(int rowIndex)
        {
            base.LoadBrowseView(rowIndex);
            dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QuerySpeakersApprovalsRenewalsAsTask(this.intSewadarId.IdTextAsInteger));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySpeakersTrainingsAsTask(this.intSewadarId.IdTextAsInteger));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT = dSet.Tables[0];
            this.grdApproval.RetrieveRecords(dT, false, RowStates.Old);
            dT = dSet.Tables[1];
            this.grdTraining.RetrieveRecords(dT, false, RowStates.Old);
            ZSMUtility.LoadOnlySewadarImageFromDBToPictureBox(this.intSewadarId.IdTextAsInteger, ref this.ImgSewadarPhoto);
            this.ObjectIdForLogOperation = this.intSewadarId.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            SpeakersSQLSelectQuery query = new SpeakersSQLSelectQuery();
            //This line avoids the if condition and specifies that sewadar_id is a primary/indexed key.
            query.speaker_id.IsExcluisive = true;
            query.speaker_id.Equal(int.Parse(this.intSewadarId.DisplayText));
            query.speaker_status.Contains(this.speakerStatusCombo1.SelectedText);
            query.speaker_type.Contains(this.speakerTypeCombo1.SelectedText);
            query.satsang_centre_id.Equal(this.zsmSatsangCentresLookup1.IdTextAsInteger);

            return dbFacade.ExecuteSelectQuery(query);
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
                }
                else
                {
                    populateDefaultValues();
                }
            }
            else if (uiMode == UIModes.Query || uiMode == UIModes.Update)
            {
                ClearControls();
                //showStatus(true);
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

        public override void ClearControls()
        {
            base.ClearControls();
            this.ImgSewadarPhoto.Image = null;
        }

        public override void Save()
        {
            base.Save();
        }

        public override void CreateData()
        {
            this.dbFacade.InsertSpeakers(this.intSewadarId.IdTextAsInteger, speakerTypeCombo1.SelectedValueAsStr, zsmSatsangCentresLookup1.IdTextAsInteger, 
                speakerStatusCombo1.SelectedValueAsStr, dtmSewadarStatus.DisplayTextAsDateTime);

            this.ObjectIdForLogOperation = this.intSewadarId.IdText;
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTasks(SaveSpeakersApprovalsRenewalsGridsAsTask(intSewadarId.IdTextAsInteger));
            this.dbFacade.AddDbTasks(SaveSpeakersTrainingsGridsAsTask(intSewadarId.IdTextAsInteger));
            this.dbFacade.ExecuteDbTasks();
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.UpdateSpeakersAsTask(this.intSewadarId.IdTextAsInteger, 
                speakerTypeCombo1.SelectedValueAsStr, zsmSatsangCentresLookup1.IdTextAsInteger,
                speakerStatusCombo1.SelectedValueAsStr, dtmSewadarStatus.DisplayTextAsDateTime, txn_ts));
            this.dbFacade.AddDbTasks(SaveSpeakersApprovalsRenewalsGridsAsTask(intSewadarId.IdTextAsInteger));
            this.dbFacade.AddDbTasks(SaveSpeakersTrainingsGridsAsTask(intSewadarId.IdTextAsInteger));
            this.dbFacade.ExecuteDbTasks();
        }

        public override bool DeleteData()
        {
            return base.DeleteData();
        }
        #endregion OverrideMethods

        #region PrivateMethods
        private void MakeEditableOnlyInQueryMode(bool isQueryMode)
        {
            this.SpeakerId.ReadOnly = !isQueryMode;
            this.txtSewadarStatus.ReadOnly = !isQueryMode;
            this.dtmSewadarStatus.ReadOnly = !isQueryMode;
            this.zsmSatsangCentresLookup1.ReadOnly = !isQueryMode;

            this.intSewadarId.ReadOnly = !isQueryMode;

        }

        private List<string> SaveSpeakersApprovalsRenewalsGridsAsTask(int? sewadarId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                List<DCCDataRowView> lstDeletedRows = this.grdApproval.GetRowsForState(RowStates.Deleted);
                foreach (DCCDataRowView row in lstDeletedRows)
                {
                    allTasks.Add(this.dbFacade.DeleteSpeakersApprovalsRenewalsAsTask(sewadarId, row.AsStr(GridApprovalColumns.request_for_speaker_type.ToString()),
                        row.AsBln(GridApprovalColumns.is_approval.ToString()), row.AsDTM(GridApprovalColumns.approval_dt.ToString()), row.AsDTM(GridApprovalColumns.reference_dt.ToString()),
                        row.AsStr(GridApprovalColumns.reference_no.ToString()), row.AsDTM(GridApprovalColumns.reference_dt.ToString()), row.AsStr(GridApprovalColumns.audition_remarks.ToString()),
                        row.AsStr(GridApprovalColumns.review_remarks.ToString()), row.AsInt(GridApprovalColumns.review_sewadar_id.ToString()), row.AsStr(GridApprovalColumns.review_non_sewadar_nm.ToString()),
                        row.AsStr(GridApprovalColumns.remarks.ToString()), row.AsByteArr(GridApprovalColumns.txn_ts_aud.ToString())));
                }

                List<DCCDataRowView> lstUpdatedRows = this.grdApproval.GetRowsForState(RowStates.Updated);                
                foreach (DCCDataRowView row in lstUpdatedRows)
                {                    
                    allTasks.Add(this.dbFacade.UpdateSpeakersApprovalsRenewalsAsTask(sewadarId, row.AsStr(GridApprovalColumns.request_for_speaker_type.ToString()),
                        row.AsBln(GridApprovalColumns.is_approval.ToString()), row.AsDTM(GridApprovalColumns.approval_dt.ToString()), row.AsDTM(GridApprovalColumns.reference_dt.ToString()),
                        row.AsStr(GridApprovalColumns.reference_no.ToString()), row.AsDTM(GridApprovalColumns.reference_dt.ToString()), row.AsStr(GridApprovalColumns.audition_remarks.ToString()),
                        row.AsStr(GridApprovalColumns.review_remarks.ToString()), row.AsInt(GridApprovalColumns.review_sewadar_id.ToString()), row.AsStr(GridApprovalColumns.review_non_sewadar_nm.ToString()),
                        row.AsStr(GridApprovalColumns.remarks.ToString()), row.AsByteArr(GridApprovalColumns.txn_ts_aud.ToString())));
                }

                List<DCCDataRowView> lstInsertedRows = this.grdApproval.GetRowsForState(RowStates.New);
                foreach (DCCDataRowView row in lstInsertedRows)
                {
                    allTasks.Add(this.dbFacade.InsertSpeakersApprovalsRenewalsAsTask(sewadarId, row.AsStr(GridApprovalColumns.request_for_speaker_type.ToString()),
                        row.AsBln(GridApprovalColumns.is_approval.ToString()), row.AsDTM(GridApprovalColumns.approval_dt.ToString()), row.AsDTM(GridApprovalColumns.reference_dt.ToString()),
                        row.AsStr(GridApprovalColumns.reference_no.ToString()), row.AsDTM(GridApprovalColumns.reference_dt.ToString()), row.AsStr(GridApprovalColumns.audition_remarks.ToString()),
                        row.AsStr(GridApprovalColumns.review_remarks.ToString()), row.AsInt(GridApprovalColumns.review_sewadar_id.ToString()), row.AsStr(GridApprovalColumns.review_non_sewadar_nm.ToString()),
                        row.AsStr(GridApprovalColumns.remarks.ToString())));
                }

                return allTasks;
            }
            catch
            {
                throw;
            }
        }

        private List<string> SaveSpeakersTrainingsGridsAsTask(int? sewadarId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                List<DCCDataRowView> lstDeletedRows = this.grdTraining.GetRowsForState(RowStates.Deleted);
                foreach (DCCDataRowView row in lstDeletedRows)
                {
                    allTasks.Add(this.dbFacade.DeleteSpeakersTrainingsAsTask(sewadarId, row.AsStr(GridTrainingColumns.training_for_speaker_type.ToString()),
                        row.AsDTM(GridTrainingColumns.training_dt.ToString()), row.AsBln(GridTrainingColumns.is_attended.ToString()), row.AsDTM(GridTrainingColumns.request_dt.ToString()),
                        row.AsStr(GridTrainingColumns.reference_no.ToString()), row.AsDTM(GridTrainingColumns.reference_dt.ToString()), row.AsStr(GridTrainingColumns.remarks.ToString()),
                        row.AsByteArr(GridTrainingColumns.txn_ts_training.ToString())));
                }

                List<DCCDataRowView> lstUpdatedRows = this.grdApproval.GetRowsForState(RowStates.Updated);
                foreach (DCCDataRowView row in lstUpdatedRows)
                {
                    allTasks.Add(this.dbFacade.UpdateSpeakersTrainingsAsTask(sewadarId, row.AsStr(GridTrainingColumns.training_for_speaker_type.ToString()),
                        row.AsDTM(GridTrainingColumns.training_dt.ToString()), row.AsBln(GridTrainingColumns.is_attended.ToString()), row.AsDTM(GridTrainingColumns.request_dt.ToString()),
                        row.AsStr(GridTrainingColumns.reference_no.ToString()), row.AsDTM(GridTrainingColumns.reference_dt.ToString()), row.AsStr(GridTrainingColumns.remarks.ToString()),
                        row.AsByteArr(GridTrainingColumns.txn_ts_training.ToString())));
                }

                List<DCCDataRowView> lstInsertedRows = this.grdApproval.GetRowsForState(RowStates.New);
                foreach (DCCDataRowView row in lstInsertedRows)
                {
                    allTasks.Add(this.dbFacade.InsertSpeakersTrainingsAsTask(sewadarId, row.AsStr(GridTrainingColumns.training_for_speaker_type.ToString()),
                        row.AsDTM(GridTrainingColumns.training_dt.ToString()), row.AsBln(GridTrainingColumns.is_attended.ToString()), row.AsDTM(GridTrainingColumns.request_dt.ToString()),
                        row.AsStr(GridTrainingColumns.reference_no.ToString()), row.AsDTM(GridTrainingColumns.reference_dt.ToString()), row.AsStr(GridTrainingColumns.remarks.ToString())));
                }

                return allTasks;
            }
            catch
            {
                throw;
            }
        }

        private void intSewadarId_LookupResultSet(object sender, UMB.CDF.UIControls.TextControls.LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.intSewadarId.DisplayText))
                {
                    ZSMUtility.setDisplayValueText(this.txtName, DbManager.GetString(e.LookupResult.SelectedRecords[0]["full_nm"]));
                    this.txtName.IdText = e.LookupResult.SelectedRecords[0]["sewadar_id"].ToString();
                    this.txtName_LookupResultSet(null, e);
                }
            }
        }

        private void setHeaderInNewMode(int? sewadarId)
        {
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select * from ViewSewadarHeader where sewadar_id = " + sewadarId).Tables[0];
            if (dT.Rows.Count > 0)
            {
                intSewadarId.DisplayText = dT.Rows[0]["sewadar_id"].ToString();
                txtName.DisplayText = dT.Rows[0]["full_nm"].ToString();
                zsmGenderCombo1.SelectedValue = dT.Rows[0]["gender"].ToString();
                txtAge.DisplayText = dT.Rows[0]["age"].ToString();
                txtSewadarStatus.DisplayText = dT.Rows[0]["sewadar_status_nm"].ToString();
                var dtm = DbManager.GetNullableDateTime(dT.Rows[0]["sewadar_status_dtm"]);
                dtmSewadarStatus.DisplayTextAsDateTime = dtm;
                ZSMUtility.LoadOnlySewadarImageFromDBToPictureBox(this.intSewadarId.IdTextAsInteger, ref this.ImgSewadarPhoto);
            }
        }

        private void txtName_LookupResultSet(object sender, UMB.CDF.UIControls.TextControls.LookupResultEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                this.setHeaderInNewMode(this.txtName.IdTextAsInteger);
            }
        }

        private string GetDescription(Enum value)
        {
            FieldInfo field = value.GetType().GetField(value.ToString());

            DescriptionAttribute attribute
                    = Attribute.GetCustomAttribute(field, typeof(DescriptionAttribute))
                        as DescriptionAttribute;

            return attribute == null ? value.ToString() : attribute.Description;
        }
        #endregion

        private void grdTraining_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
