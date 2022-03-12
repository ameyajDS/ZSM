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
using System.Collections;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ATT
{
    partial class SewadarWiseSewaSummaries : ZSMAbstractScreen2
    {

        private int?  satsangCentreId = ZSMUtility.GetSatsangCentreId();
        private string satsangCentreName = ZSMUtility.GetSatsangCentreName();

        private UIModes prevMode = UIModes.None;

        public SewadarWiseSewaSummaries()
        {
            InitializeComponent();
            this.sewadarHeader1.SttsCode = "SttsSwSmry";
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ATT_SEWADAR_WISE_SEWA_SUMMARIES;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
           
            	old_sewa_id,
	            old_satsang_centre_id,
	            old_sewadar_grno,
                txn_ts
        }

        #endregion     

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        public override void ClearControls()
        {

            if (this.CurrentUIMode == UIModes.Insert && prevMode != UIModes.Browse)
            {
                if (string.IsNullOrEmpty(this.lookupSewa.DisplayText))
                {
                    if (DbManager.IsNotNull(this.dbFacade))
                    {
                        DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT s.sewa_id, s.sewa_nm, s.start_dt, s.finish_dt FROM sewas s JOIN CDB..satsang_centres sc ON sc.satsang_centre_id = s.satsang_centre_id WHERE s.is_default_sewa = 'Yes' AND s.attendance_marking = 'Summary' AND s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId()).Tables[0];
                        if (dT.Rows.Count > 0)
                        {
                            this.lookupSewa.SetControlValues(dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_id"].ToString());
                            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["finish_dt"]);
                            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["start_dt"]);
                        }
                    }
                }
                //To display default value in Sewa lookup in Insert mode
                this.ClearAllControlsOfContainer(this.tableLayoutPanel1, true, this.lookupSewa, this.dtFinish, this.dtStart);
            }
            else
            {
                base.ClearControls();
            }

            //To display the Satsang centre into Satsang Centre  textbox
            this.sewadarHeader1.txtSatsangCentre.DisplayText = satsangCentreName;
        
        }
       
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            this.sewadarHeader1.makeReadOnlyFieldQueriable(this.CurrentUIMode == UIModes.Query);
            if (uiMode == UIModes.Insert)
            {
                ClearControls();                

            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
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
            prevMode = this.CurrentUIMode;
            this.sewadarHeader1.makeReadOnlyFieldQueriable(this.CurrentUIMode == UIModes.Query);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.sewadarHeader1.txtSatsangCentre.DisplayText = satsangCentreName;
            this.ParametersForLogOperation = this.GetHashTable();
            
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarWiseSewaSummarieSQLSelectQuery query = new ViewSewadarWiseSewaSummarieSQLSelectQuery();

            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());

            query.sewadar_grno.Contains(this.sewadarHeader1.TxtGRNo.DisplayText);
            query.full_nm.Contains(this.sewadarHeader1.TxtName.DisplayText);            
            query.sewadar_id.Equal(this.sewadarHeader1.intSewadarId.IdTextAsInteger);

            query.sewa_id.Equal(this.lookupSewa.IdTextAsInteger);
            query.present_cnt.Between(this.intPresentCnt);
            query.exempt_cnt.Between(this.intExemptCnt);
            query.leave_cnt.Between(this.intLeaveCnt);
            query.absent_cnt.Between(this.intAbsentCnt);            
            query.is_system_recorded.Equal(this.chkSystemRecorded.BlnString);

            query.age.Between(this.sewadarHeader1.intAge);
            query.sewadar_status_dtm.Between(this.sewadarHeader1.dtmSewadarStatus);
            query.department_dt.Between(this.sewadarHeader1.dtDepJoiningDate);

            return dbFacade.ExecuteSelectQuery(query);            
        }

        private Hashtable GetHashTable()
        {
            Hashtable tbl = new Hashtable();
            tbl.Add("p_sewa_id", this.lookupSewa.IdTextAsInteger);
            tbl.Add("p_sewadar_grno", this.sewadarHeader1.txtGRNo.DisplayText);
            tbl.Add("p_satsang_centre_id", ZSMUtility.GetSatsangCentreId());
            return tbl;
        }

        public override void CreateData()
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.InsUpdSewadarsTxntsAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.txtGRNo.DisplayText, this.lookupSewa.IdTextAsInteger, this.ScreenId, null));
            
            this.dbFacade.AddDbTask(this.dbFacade.InsertSewadarWiseSewaSummarieAsTask(this.lookupSewa.IdTextAsInteger,
                                                satsangCentreId,
                                                this.sewadarHeader1.TxtGRNo.DisplayText,
                                                (decimal?)this.intPresentCnt.DisplayTextAsDecimal,
                                                (decimal?)this.intExemptCnt.DisplayTextAsDecimal,
                                                (decimal?)this.intLeaveCnt.DisplayTextAsDecimal,
                                                (decimal?)this.intAbsentCnt.DisplayTextAsDecimal,
                                                this.chkSystemRecorded.BlnString
                                                ));
            this.dbFacade.ExecuteDbTasks();
            this.ParametersForLogOperation = this.GetHashTable();
            
            
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            int? intOldSewaId = this.grdList.AsInt(grdListColNames.old_sewa_id.ToString());
            int? intOldSatsangCentreId = this.grdList.AsInt(grdListColNames.old_satsang_centre_id.ToString());
            string strOldSewadarGrno = this.grdList.AsStr(grdListColNames.old_sewadar_grno.ToString());

            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.InsUpdSewadarsTxntsAsTask(intOldSatsangCentreId, strOldSewadarGrno, intOldSewaId, this.ScreenId, txn_ts));
            this.dbFacade.AddDbTask(this.dbFacade.UpdateSewadarWiseSewaSummarieAsTask(this.lookupSewa.IdTextAsInteger,
                                                satsangCentreId,
                                                this.sewadarHeader1.TxtGRNo.DisplayText,
                                                this.intPresentCnt.DisplayTextAsDecimal,
                                                this.intExemptCnt.DisplayTextAsDecimal,
                                                this.intLeaveCnt.DisplayTextAsDecimal,
                                                this.intAbsentCnt.DisplayTextAsDecimal,
                                                this.chkSystemRecorded.BlnString,
                                                intOldSewaId,
                                                intOldSatsangCentreId,
                                                strOldSewadarGrno
                                                ));
            this.dbFacade.ExecuteDbTasks();

        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            int? intOldSewaId = this.grdList.AsInt(grdListColNames.old_sewa_id.ToString());
            int? intOldSatsangCentreId = this.grdList.AsInt(grdListColNames.old_satsang_centre_id.ToString());
            string strOldSewadarGrno = this.grdList.AsStr(grdListColNames.old_sewadar_grno.ToString());
            
            this.dbFacade.DeleteSewadarWiseSewaSummarie(intOldSewaId, intOldSatsangCentreId, strOldSewadarGrno);          

            int rowCount = ZSMUtility.GetRecordCount(dbFacade, "sewadar_wise_sewa_summaries", strOldSewadarGrno, intOldSewaId, intOldSatsangCentreId);
            if (rowCount == 0)
            {               
                this.dbFacade.DelSewadarstxnts(intOldSatsangCentreId, strOldSewadarGrno, intOldSewaId, this.ScreenId, txn_ts);
            }
            return true;
        }


        private void lookupSewa_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (this.CurrentUIMode == UIModes.Insert)
            {
                if (!string.IsNullOrEmpty(satsangCentreId.ToString()))
                {
                    e.LookupSqlString += " AND s.satsang_centre_id = " + satsangCentreId + " AND s.referred_sewa_id IS NULL AND s.attendance_marking = 'Summary' ";
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(satsangCentreId.ToString()))
                {
                    e.LookupSqlString += " AND s.satsang_centre_id = " + satsangCentreId + " AND s.referred_sewa_id IS NULL ";
                }
            }
        }

        private void lookupSewa_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["finish_dt"]);
            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["start_dt"]); 
        }

        public override bool IsReadyToSave()
        {
            if (!IsSaveDeleteAllowed("Save"))
            {
                return false;
            }
            if (!base.IsReadyToSave())
            {
                return false;
            }
            prevMode = this.CurrentUIMode;
            return true;
        }

        public override bool IsReadyToDelete()
        {
            if (!IsSaveDeleteAllowed("Delete"))
            {
                return false;
            }
            return base.IsReadyToDelete();
        }

        private bool IsSaveDeleteAllowed(string saveOrDelete)
        {
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT * FROM sewas WHERE locked_dtm IS NOT NULL AND sewa_id = " + this.lookupSewa.IdText).Tables[0];
            if (dT.Rows.Count != 0)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, saveOrDelete + "|sewa is locked", MessageTypes.Error);
                return false;
            }
            if (this.CurrentUIMode == UIModes.Browse && !this.grdList.AsBln("is_editable").Value)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, saveOrDelete + "|sewa's attendance marking is not summary", MessageTypes.Error);
                return false;
            }
            if (this.dbFacade.ObjDBManager.ExecuteSQL("select 1 FROM ViewSewadarHeader vs JOIN system_information_values siv ON vs.sewadar_status_cd = siv.system_info_value AND siv.system_info_cd = 'SttsActv' AND vs.sewadar_id = " + this.sewadarHeader1.SewadarId).Tables[0].Rows.Count == 0)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, saveOrDelete + "|person with given status not allowed", MessageTypes.Error);
                return false;
            }
            return true;
        }
    }
}
