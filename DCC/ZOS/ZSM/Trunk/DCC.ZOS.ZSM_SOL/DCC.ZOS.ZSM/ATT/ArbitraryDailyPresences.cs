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
    partial class ArbitraryDailyPresences : ZSMAbstractScreen2
    {

        private int? satsangCentreId = ZSMUtility.GetSatsangCentreId();
        private string satsangCentreName = ZSMUtility.GetSatsangCentreName();

        public ArbitraryDailyPresences()
        {
            InitializeComponent();
            this.sewadarHeader1.SttsCode = "SttsAttnd";
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ATT_ARBITRARY_DAILY_PRESENCES;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {          
            sewa_id,					
            satsang_centre_id,
            sewadar_grno	,				
            presence_dt		,			
            is_scanned		,				
            old_sewa_id		,			
            old_satsang_centre_id,
            old_sewadar_grno	,			
            old_presence_dt		,
            txn_ts        
        }

        #endregion     

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        public override void ClearControls()
        {
            if (this.CurrentUIMode == UIModes.Insert)
            {
                if (string.IsNullOrEmpty(this.lookupSewa.DisplayText))
                {
                    if (DbManager.IsNotNull(this.dbFacade))
                    {
                        DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT s.sewa_id, s.sewa_nm, s.start_dt, s.finish_dt  FROM sewas s JOIN CDB..satsang_centres sc ON sc.satsang_centre_id = s.satsang_centre_id WHERE s.is_default_sewa = 'Yes' AND s.attendance_marking = 'Arbitrary' AND s.attendance_unit = 'Day' AND s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId()).Tables[0];
                        if (dT.Rows.Count > 0)
                        {
                            this.lookupSewa.SetControlValues(dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_id"].ToString());
                            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["finish_dt"]);
                            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["start_dt"]);
                        }
                    }
                }
                //To display default value in Sewa lookup in Insert mode
                this.ClearAllControlsOfContainer(this.tableLayoutPanel1, true, this.lookupSewa, this.dtPresence, this.dtFinish, this.dtStart);
            }
            else
            {
                base.ClearControls();
            }

            //To display the Satsang centre into Satsang Centre  textbox
            this.sewadarHeader1.txtSatsangCentre.DisplayText = satsangCentreName;

        }

        private void makeEditableOnlyInQueryMode(bool isQuery)
        {
            this.sewadarHeader1.txtSubDepartment.ReadOnly = !isQuery;
            this.sewadarHeader1.txtDepartmentName.ReadOnly = !isQuery;
            this.sewadarHeader1.makeReadOnlyFieldQueriable(isQuery);
        }
       
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
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

        public override void LoadBrowseView(int rowIndex)
        {
            makeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.sewadarHeader1.txtSatsangCentre.DisplayText = satsangCentreName;
            this.ParametersForLogOperation = this.GetHashTable();
            
        }




        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewArbitraryDailyPresenceSQLSelectQuery query = new ViewArbitraryDailyPresenceSQLSelectQuery();

            query.screen_id.Equal(this.ScreenId);
            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());

            query.sewadar_grno.Contains(this.sewadarHeader1.TxtGRNo.DisplayText);
            query.full_nm.Contains(this.sewadarHeader1.TxtName.DisplayText);
            query.sewadar_id.Equal(this.sewadarHeader1.intSewadarId.IdTextAsInteger);

            query.sewa_id.Equal(this.lookupSewa.IdTextAsInteger);
            query.presence_dt.Between(this.dtPresence);
            query.is_scanned.Equal(this.chkScanned.BlnString);
            query.department_nm.Contains(this.sewadarHeader1.txtDepartmentName.DisplayText);
            query.sub_department_nm.Contains(this.sewadarHeader1.txtSubDepartment.DisplayText);

            query.age.Between(this.sewadarHeader1.intAge);
            query.sewadar_status_dtm.Between(this.sewadarHeader1.dtmSewadarStatus);
            query.department_dt.Between(this.sewadarHeader1.dtDepJoiningDate);
            
            return dbFacade.ExecuteSelectQuery(query);

        }


        private Hashtable GetHashTable()
        {
            Hashtable tbl = new Hashtable();
            tbl.Add("p_transaction_dt", this.dtPresence.DisplayTextAsDateTime);
            tbl.Add("p_sewa_id", this.lookupSewa.IdTextAsInteger);
            tbl.Add("p_sewadar_grno", this.sewadarHeader1.txtGRNo.DisplayText);
            tbl.Add("p_satsang_centre_id", ZSMUtility.GetSatsangCentreId());
            return tbl;
        }

        public override void CreateData()
        {
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.InsUpdSewadarsTxntsAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.txtGRNo.DisplayText, this.lookupSewa.IdTextAsInteger, this.ScreenId, null));

            this.dbFacade.AddDbTask(this.dbFacade.InsertArbitraryDailyPresenceAsTask(this.lookupSewa.IdTextAsInteger,
                                                satsangCentreId,
                                                this.sewadarHeader1.TxtGRNo.DisplayText,
                                                this.dtPresence.DisplayTextAsDateTime,
                                                this.chkScanned.BlnString
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
                       
            DateTime ? dtOldPresence = this.grdList.AsDTM(grdListColNames.old_presence_dt.ToString());
            this.dbFacade.AddDbTask(this.dbFacade.UpdateArbitraryDailyPresenceAsTask(this.lookupSewa.IdTextAsInteger,
                                            satsangCentreId,
                                            this.sewadarHeader1.TxtGRNo.DisplayText,
                                            this.dtPresence.DisplayTextAsDateTime,
                                            this.chkScanned.BlnString,
                                            intOldSewaId,
                                            intOldSatsangCentreId,
                                            strOldSewadarGrno,
                                            dtOldPresence
                                            ));

            this.dbFacade.ExecuteDbTasks();

        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());

            int? intOldSewaId = this.grdList.AsInt(grdListColNames.old_sewa_id.ToString());
            int? intOldSatsangCentreId = this.grdList.AsInt(grdListColNames.old_satsang_centre_id.ToString());
            string strOldSewadarGrno = this.grdList.AsStr(grdListColNames.old_sewadar_grno.ToString());

            this.dbFacade.ClearDbTasks();                                    
            DateTime ? dtOldPresence = this.grdList.AsDTM(grdListColNames.old_presence_dt.ToString());

            this.dbFacade.DeleteArbitraryDailyPresence(intOldSewaId, intOldSatsangCentreId,
                                            strOldSewadarGrno, dtOldPresence);

            int rowCount = ZSMUtility.GetRecordCount(dbFacade, "arbitrary_daily_presences", strOldSewadarGrno, intOldSewaId, intOldSatsangCentreId);
            if (rowCount == 0)
            {
                this.dbFacade.DelSewadarstxnts(intOldSatsangCentreId, strOldSewadarGrno, intOldSewaId, this.ScreenId, txn_ts);
            }
            return true;
        }

        private void lookupSewa_LookupDialogShowing_1(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND s.attendance_marking = 'Arbitrary' AND s.attendance_unit = 'Day'"  );

        }

        private void lookupSewa_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["finish_dt"]);
            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["start_dt"]);
        }

        private void dtPresence_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (this.dtPresence.DisplayTextAsDateTime > DateTime.Now)
            {
                UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, "Presence Date | Today's date", MessageTypes.Error);
                e.Cancel = true;
            }
        }

       
    }
}
