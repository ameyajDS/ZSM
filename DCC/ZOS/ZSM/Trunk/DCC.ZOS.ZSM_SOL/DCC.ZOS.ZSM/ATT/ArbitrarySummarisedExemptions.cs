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
    partial class ArbitrarySummarisedExemptions : ZSMAbstractScreen2
    {

        private int? satsangCentreId = ZSMUtility.GetSatsangCentreId();
        private string satsangCentreName = ZSMUtility.GetSatsangCentreName();

        public ArbitrarySummarisedExemptions()
        {
            InitializeComponent();
            this.sewadarHeader1.SttsCode = "SttsAttnd";
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ATT_ARBITRARY_SUMMARISED_EXEMPTIONS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            old_sewa_id,
            old_satsang_centre_id,
            old_sewadar_grno    ,
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

                        DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT s.sewa_id, s.sewa_nm, s.start_dt, s.finish_dt FROM sewas s JOIN CDB..satsang_centres sc ON sc.satsang_centre_id = s.satsang_centre_id WHERE s.is_default_sewa = 'Yes' AND s.attendance_marking = 'Arbitrary' AND s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId()).Tables[0];
                        if (dT.Rows.Count > 0)
                        {
                            this.lookupSewa.SetControlValues(dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_nm"].ToString(), dT.Rows[0]["sewa_id"].ToString());
                            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["finish_dt"]);
                            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dT.Rows[0]["start_dt"]);
                        }
                    }
                }
                //To display default value in Sewa lookup in Insert mode
                this.ClearAllControlsOfContainer(this.tableLayoutPanel1, true, this.lookupSewa, this.lookupSewaExemption, this.dtFinish, this.dtStart);
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
                this.lookupSewa.ReadOnly = false;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                this.lookupSewa.ReadOnly = false;                
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
            this.lookupSewa.ReadOnly = true;
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.sewadarHeader1.txtSatsangCentre.DisplayText = satsangCentreName;
            this.ParametersForLogOperation = this.GetHashTable();
        }

        
        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewArbitrarySummarisedExemptionSQLSelectQuery query = new ViewArbitrarySummarisedExemptionSQLSelectQuery();

            query.screen_id.Equal(this.ScreenId);
            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());

            query.sewadar_grno.Contains(this.sewadarHeader1.TxtGRNo.DisplayText);
            query.full_nm.Contains(this.sewadarHeader1.TxtName.DisplayText);
            
            query.sewadar_id.Equal(this.sewadarHeader1.intSewadarId.IdTextAsInteger);

            query.sewa_id.Equal(this.lookupSewa.IdTextAsInteger);
            query.sewa_exemption_id.Equal(this.lookupSewaExemption.IdTextAsInteger);
            query.sewa_id.Equal(this.lookupSewa.IdTextAsInteger);
            query.exemption_days.Equal(this.decimalExemptionDays.DisplayTextAsDecimal);
            query.department_nm.Contains(this.sewadarHeader1.txtDepartmentName.DisplayText);
            query.sub_department_nm.Contains(this.sewadarHeader1.txtSubDepartment.DisplayText);

            query.age.Between(this.sewadarHeader1.intAge);
            query.sewadar_status_dtm.Between(this.sewadarHeader1.dtmSewadarStatus);
            query.department_dt.Between(this.sewadarHeader1.dtDepJoiningDate);

            query.AddOrderByClause(query.start_dt, OrderByTypes.DESC);
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

            this.dbFacade.AddDbTask(this.dbFacade.InsertArbitrarySummarisedExemptionAsTask(this.lookupSewa.IdTextAsInteger,
                                                satsangCentreId,
                                                this.sewadarHeader1.TxtGRNo.DisplayText,
                                                this.lookupSewaExemption.IdTextAsShort,
                                                this.decimalExemptionDays.DisplayTextAsDecimal
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

            this.dbFacade.AddDbTask(this.dbFacade.UpdateArbitrarySummarisedExemptionAsTask(this.lookupSewa.IdTextAsInteger,
                                                  satsangCentreId,
                                                  this.sewadarHeader1.TxtGRNo.DisplayText,
                                                  this.lookupSewaExemption.IdTextAsShort,
                                                  this.decimalExemptionDays.DisplayTextAsDecimal,
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
            this.dbFacade.DeleteArbitrarySummarisedExemption(intOldSewaId, intOldSatsangCentreId, strOldSewadarGrno);

            int rowCount = ZSMUtility.GetRecordCount(dbFacade, "arbitrary_summarised_exemptions", strOldSewadarGrno, 
                intOldSewaId, intOldSatsangCentreId);
            if (rowCount == 0)
            {
                this.dbFacade.DelSewadarstxnts(intOldSatsangCentreId, strOldSewadarGrno, intOldSewaId, this.ScreenId, txn_ts);
            }
            return true;
        }

        private void lookupSewa_LookupDialogShowing_1(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND s.attendance_marking = 'Arbitrary'");

        }

        private void lookupSewa_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.dtFinish.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["finish_dt"]);
            this.dtStart.DisplayTextAsDateTime = DbManager.GetNullableDateTime(e.LookupResult.SelectedRecords[0]["start_dt"]); 
        }

        private void intExemptionDays_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (this.decimalExemptionDays.DisplayText.IndexOf('.') > 0)
            {
                if (this.decimalExemptionDays.DisplayText.Substring(this.decimalExemptionDays.DisplayText.IndexOf('.')).Length > 3)
                {
                    UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, "Decimal digits|2", MessageTypes.Error);
                    e.Cancel = true;
                }
            }
        }

       

    
    }
}
