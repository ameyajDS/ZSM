using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DCC.UMB.CDF;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.View.Menu;
using System.Configuration;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls;
using System.IO;
using DCC.DBFacade;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Drawing2D;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.DB;
using System.Reflection;
using System.Collections;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.Log;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class MergeSewadars : ZSMAbstractScreen
    {
        private enum GridColumns
        {
            src_sewadar_id,
            src_full_nm,
            dst_sewadar_id,
            dst_full_nm,
            merged_dtm
        }

        public MergeSewadars()
        {
            InitializeComponent();

            this.historyHeader1.sewadarHeader1.txtGRNo.Title = "Source GR No.";
            this.historyHeader1.sewadarHeader1.txtName.Title = "Source Sewadar Name";
            this.historyHeader1.sewadarHeader1.intSewadarId.Title = "Source Sewadar ID";
            this.historyHeader2.sewadarHeader1.intSewadarId.Title = "Dest. Sewadar ID";
            this.historyHeader2.sewadarHeader1.txtGRNo.Title = "Dest. Sewadar Name";
            this.historyHeader2.sewadarHeader1.txtName.Title = "Dest. Sewadar Name";

            this.historyHeader1.sewadarHeader1.txtGRNo.ReadOnly = true;
            this.historyHeader1.sewadarHeader1.txtName.ReadOnly = true;
            this.historyHeader2.sewadarHeader1.txtGRNo.ReadOnly = true;
            this.historyHeader2.sewadarHeader1.txtName.ReadOnly = true;
            this.historyHeader1.sewadarHeader1.SttsCode = "SttsInaSrc";
            this.historyHeader2.sewadarHeader1.SttsCode = "sttsCode";
            this.historyHeader1.sewadarHeader1.txtSatsangCentre.Lookup = true;
            this.historyHeader1.sewadarHeader1.txtSatsangCentre.ReadOnly = false;
            this.historyHeader2.sewadarHeader1.txtSatsangCentre.Lookup = true;
            this.historyHeader2.sewadarHeader1.txtSatsangCentre.ReadOnly = false;
        }

        public override string ScreenId { get { return Screens.ACT_MERGE_SEWADARS; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        private void makeEditableOnlyInQueryMode(bool isQuery)
        {

        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.historyHeader1.sewadarHeader1.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
            this.historyHeader2.sewadarHeader1.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
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
            else if (uiMode == UIModes.Reference)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    this.historyHeader1.sewadarHeader1.intSewadarId.DisplayText = screenParameters;
                    GlobalAppVariables.ObjMDIMain.FireRetrieveMode();
                }
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

        public override void Save()
        {
            try
            {
                this.dbFacade.BeginTrans();
                switch (this.CurrentUIMode)
                {
                    case UIModes.Insert:
                    case UIModes.New:
                        this.CreateData();
                        break;
                }
                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
                this.dbFacade.CommitTrans();
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                throw ex;
            }
        }

        public override bool IsReadyToSave()
        {
			//Uparwala should be always inactive for current GRNo. irrespective of global status
            if (this.historyHeader1.sewadarHeader1.SewadarId == this.historyHeader2.sewadarHeader1.SewadarId)
            {
                UIManager.ShowMessage(MsgCodes.DeleteNotAllowed, "sewadar Id :" + this.historyHeader2.sewadarHeader1.SewadarId + "|" + "As both sewadars are the same. Please choose different sewadars to merge", MessageTypes.Error);
                return false;
            }
            return base.IsReadyToSave();
        }

        public override void CreateData()
        {
            if (DbManager.IsNotNull(this.historyHeader1.sewadarHeader1.SewadarId)
                 && DbManager.IsNotNull(this.historyHeader2.sewadarHeader1.SewadarId))
            {
                DialogResult result = MessageBox.Show(this,
                                                      string.Format("Are you sure you want to delete sewadar id : {0} permanently!", this.historyHeader1.sewadarHeader1.SewadarId),
                                                      "Confirm Delete",
                                                      MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation,
                                                      MessageBoxDefaultButton.Button1);
                if (result == DialogResult.No)
                {
                    return;
                }
                this.dbFacade.InsertSewadarsMerged(this.historyHeader1.sewadarHeader1.SewadarId, this.historyHeader2.sewadarHeader1.SewadarId);
                UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, this.historyHeader2.sewadarHeader1.SewadarId.ToString());
                this.dbFacade.MergeSewadarInformation(this.historyHeader1.sewadarHeader1.SewadarId, this.historyHeader2.sewadarHeader1.SewadarId);
            }
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewMergeSewadarInformationSQLSelectQuery query = new ViewMergeSewadarInformationSQLSelectQuery();
            query.src_sewadar_id.Equal(this.historyHeader1.sewadarHeader1.intSewadarId.DisplayText);
            query.dst_sewadar_id.Equal(this.historyHeader1.sewadarHeader1.intSewadarId.DisplayText);
            return dbFacade.ExecuteSelectQuery(query);
        }

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.historyHeader1.tlpTop);
            this.historyHeader1.sewadarHeader1.SetNameAndFireEvent(this.grdList.AsInt(GridColumns.src_sewadar_id.ToString()), null, null);
            this.historyHeader1.sewadarHeader1.SetNameAndFireEvent(this.grdList.AsInt(GridColumns.dst_sewadar_id.ToString()), null, null);
                                                    
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarHistoryAsTask(this.historyHeader1.sewadarHeader1.intSewadarId.IdTextAsInteger));
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarHistoryAsTask(this.historyHeader2.sewadarHeader1.intSewadarId.IdTextAsInteger));
            DataSet dT = this.dbFacade.ExecuteDbTasks();
            this.historyHeader1.grdHistory.RetrieveRecords(dT.Tables[0], false, RowStates.Old);
            this.historyHeader2.grdHistory.RetrieveRecords(dT.Tables[1], false, RowStates.Old);
        }

    }
}
