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
using DCC.UMB.CDF.Utils;
using System.Collections;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ATT
{
    partial class ArbitraryShiftPresences : ZSMAbstractScreen2
    {

        private int? satsangCentreId = ZSMUtility.GetSatsangCentreId();
        private string satsangCentreName = ZSMUtility.GetSatsangCentreName();

        private DateTime SewaMaxPresenceAllowedDate;
        
        public ArbitraryShiftPresences()
        {
            InitializeComponent();
            this.sewadarHeader1.SttsCode = "SttsCnstSewa";
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ATT_ARBITRARY_SHIFT_PRESENCES;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {                
            sewa_id,
            sewa_nm,
            old_sewa_id,
            old_sewa_shift,
            sewa_shift,
            old_satsang_centre_id,
            old_sewadar_grno,
            satsang_centre_id,
            sewadar_grno,
            sewadar_id,
            full_nm,
            presence_dt,
            old_presence_dt,
            is_scanned,
            gender,
            birth_dtm,
            age,
            is_married,
            initiation_dt,
            initiation_place_id,
            place_nm,
            initiation_by,
            global_sewadar_status_cd,
            global_sewadar_status_dt,
            sewadar_status_dtm,
            global_sewadar_status_nm,
            sewadar_status_nm,
            sewadar_status_cd,
            centre_nm,
            sewadar_status_dt,
            department_dt,
            appointment_dt,
            department_nm,
            sub_department_nm,
            full_department_nm,
            weekly_satsang_centre_id,
            weekly_satsang_centre_nm,
            sewadar_txn_ts
        }

        #endregion     

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }
      
        public override bool IsReadyToSwitchMode(UIModes oldUIMode, UIModes newUIMode)
        {
            if (newUIMode == UIModes.Insert)
            {
                this.chkScanned.Visible = false;
            }
            else
            {
                this.chkScanned.Visible = true;
            }
            return base.IsReadyToSwitchMode(oldUIMode, newUIMode);           
        }
        public override void ClearControls()
        {                     

            //To display default value in Sewa lookup in Insert mode
            if (this.CurrentUIMode == UIModes.Insert)
            {
                if (string.IsNullOrEmpty(this.lookupSewa.DisplayText))
                {
                    if (DbManager.IsNotNull(this.dbFacade))
                    {
                        DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT s.sewa_id, s.sewa_nm, s.start_dt, s.finish_dt FROM sewas s JOIN CDB..satsang_centres sc ON sc.satsang_centre_id = s.satsang_centre_id WHERE s.is_default_sewa = 'Yes' AND s.attendance_marking = 'Arbitrary' AND s.attendance_unit = 'Shift' AND s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId()).Tables[0];
                        if (dT.Rows.Count > 0)
                        {
                            this.lookupSewa.SetControlValues(dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_id"].ToString());
                            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["finish_dt"]);
                            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["start_dt"]);
                            lkpSewaSetAction();
                        }
                    }
                }
                this.ClearAllControlsOfContainer(this.tableLayoutPanel1, true, this.lookupSewa, this.cmbSewaShift, this.dtPresence, this.dtFinish, this.dtStart);
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


        private Hashtable GetHashTable()
        {
            Hashtable tbl = new Hashtable();
            tbl.Add("p_transaction_dt", this.dtPresence.DisplayTextAsDateTime);
            tbl.Add("p_sewa_id", this.lookupSewa.IdTextAsInteger);
            tbl.Add("p_sewadar_grno", this.sewadarHeader1.txtGRNo.DisplayText);
            tbl.Add("p_satsang_centre_id", ZSMUtility.GetSatsangCentreId());
            tbl.Add("p_object_id", this.cmbSewaShift.SelectedValue);
            return tbl;
        }

        public override void LoadBrowseView(int rowIndex)
        {
            makeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.sewadarHeader1.txtSatsangCentre.DisplayText = satsangCentreName;
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            DataTable dt = objDbManager.ExecuteSQL("select sss.sewa_shift from sewas_sewa_shifts  sss JOIN sewas s ON s.sewa_id = sss.sewa_id WHERE  s.sewa_id = " + lookupSewa.IdText + " ORDER BY sss.sewa_shift_sq").Tables[0];
            this.cmbSewaShift.ClearControlValues();
            this.cmbSewaShift.SetDataSource(dt, "sewa_shift", "sewa_shift");
            this.cmbSewaShift.DisplayText = this.grdList.AsStr(grdListColNames.sewa_shift.ToString(), rowIndex);
            this.ParametersForLogOperation = this.GetHashTable();
        }


        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewArbitraryShiftPresenceSQLSelectQuery query = new ViewArbitraryShiftPresenceSQLSelectQuery();

            query.screen_id.Equal(this.ScreenId);
            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());

            query.sewadar_grno.Contains(this.sewadarHeader1.TxtGRNo.DisplayText);
            query.full_nm.Contains(this.sewadarHeader1.TxtName.DisplayText);
            query.sewadar_id.Equal(this.sewadarHeader1.intSewadarId.IdTextAsInteger);
                        
            query.sewa_id.Equal(this.lookupSewa.IdTextAsInteger);
            query.sewa_shift.Contains(this.cmbSewaShift.SelectedValue);
            query.presence_dt.Between(this.dtPresence);
           // query.is_scanned.Equal(this.chkScanned.BlnString);
            query.department_nm.Contains(this.sewadarHeader1.txtDepartmentName.DisplayText);
            query.sub_department_nm.Contains(this.sewadarHeader1.txtSubDepartment.DisplayText);

            //query.age.Between(this.sewadarHeader1.intAge);
            // query.sewadar_status_dtm.Between(this.sewadarHeader1.dtmSewadarStatus);
            //query.department_dt.Between(this.sewadarHeader1.dtDepJoiningDate);

            return dbFacade.ExecuteSelectQuery(query);

        }

        public override bool IsReadyToSave()
        {
            if (dtPresence.DisplayTextAsDateTime > this.SewaMaxPresenceAllowedDate)
            {
                UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, "The Presence Date specified is later than the last allowable date [06-Jan-2014]", MessageTypes.Error);
                return false;
            }
           
           return  base.IsReadyToSave();
        }
        public override void CreateData()
        {
            this.dbFacade.ClearDbTasks();

            this.dbFacade.AddDbTask(this.dbFacade.InsUpdSewadarsTxntsAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.txtGRNo.DisplayText, this.lookupSewa.IdTextAsInteger, this.ScreenId, null));

            this.dbFacade.AddDbTask(this.dbFacade.InsertArbitraryShiftPresenceAsTask(this.lookupSewa.IdTextAsInteger,
                                                satsangCentreId,
                                                this.sewadarHeader1.TxtGRNo.DisplayText,
                                                this.dtPresence.DisplayTextAsDateTime,  
                                                this.cmbSewaShift.DisplayText                                               
                                                ));
            this.dbFacade.ExecuteDbTasks();
            this.ParametersForLogOperation = this.GetHashTable();
        }
       
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.sewadar_txn_ts.ToString());

            int? intOldSewaId = this.grdList.AsInt(grdListColNames.old_sewa_id.ToString());
            int? intOldSatsangCentreId = this.grdList.AsInt(grdListColNames.old_satsang_centre_id.ToString());
            string strOldSewadarGrno = this.grdList.AsStr(grdListColNames.old_sewadar_grno.ToString());
            string strOldSewaShift = this.grdList.AsStr(grdListColNames.old_sewa_shift.ToString());

            DateTime? dtOldPresence = this.grdList.AsDTM(grdListColNames
                .old_presence_dt.ToString());

            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.InsUpdSewadarsTxntsAsTask(intOldSatsangCentreId, strOldSewadarGrno, intOldSewaId, this.ScreenId, txn_ts));            

            this.dbFacade.AddDbTask(this.dbFacade.UpdateArbitraryShiftPresenceAsTask(this.lookupSewa.IdTextAsInteger,
                                            satsangCentreId,
                                            this.sewadarHeader1.TxtGRNo.DisplayText,
                                            this.dtPresence.DisplayTextAsDateTime,
                                            this.cmbSewaShift.DisplayText,
                                            this.chkScanned.BlnString,
                                            intOldSewaId,
                                            intOldSatsangCentreId,
                                            strOldSewadarGrno,
                                            dtOldPresence,
                                            strOldSewaShift
                                            ));

            this.dbFacade.ExecuteDbTasks();

        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("sewadar_txn_ts");
            int? intOldSewaId = this.grdList.AsInt(grdListColNames.old_sewa_id.ToString());
            int? intOldSatsangCentreId = this.grdList.AsInt(grdListColNames.old_satsang_centre_id.ToString());
            string strOldSewadarGrno = this.grdList.AsStr(grdListColNames.old_sewadar_grno.ToString());
            DateTime? dtOldPresence = this.grdList.AsDTM(grdListColNames.old_presence_dt.ToString());
            string strOldSewaShift = this.grdList.AsStr(grdListColNames.old_sewa_shift.ToString());

            this.dbFacade.DeleteArbitraryShiftPresence(intOldSewaId, intOldSatsangCentreId, strOldSewadarGrno,
                                            dtOldPresence, strOldSewaShift);

            int rowCount = ZSMUtility.GetRecordCount(dbFacade, "arbitrary_shift_presences", strOldSewadarGrno, intOldSewaId, intOldSatsangCentreId);
            if (rowCount == 0)
            {
                this.dbFacade.DelSewadarstxnts(intOldSatsangCentreId, strOldSewadarGrno, intOldSewaId, this.ScreenId, txn_ts);
            }
            return true;
        }


        private void lookupSewa_LookupDialogShowing_1(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND s.attendance_marking = 'Arbitrary' AND s.attendance_unit = 'Shift'");

        }

        private void lkpSewaSetAction()
        {
            IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            DataTable dt = objDbManager.ExecuteSQL("select sss.sewa_shift from sewas_sewa_shifts  sss JOIN sewas s ON s.sewa_id = sss.sewa_id WHERE  s.sewa_id = " + lookupSewa.IdText + " ORDER BY sss.sewa_shift_sq").Tables[0];
            this.cmbSewaShift.ClearControlValues();
            this.cmbSewaShift.SetDataSource(dt, "sewa_shift", "sewa_shift");
            string query = string.Format("select dbo.GetSewaMaxPresenceAllowedDate({0}) ", this.lookupSewa.IdTextAsInteger);
            dt = objDbManager.ExecuteSQL(query).Tables[0];
            this.SewaMaxPresenceAllowedDate = (DateTime)dt.Rows[0][0];
        }
        private void lookupSewa_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (!string.IsNullOrEmpty(lookupSewa.IdText.ToString()))
            {
                this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["finish_dt"]);
                this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["start_dt"]);       
                lkpSewaSetAction();
            }
        }


    
    }
}
