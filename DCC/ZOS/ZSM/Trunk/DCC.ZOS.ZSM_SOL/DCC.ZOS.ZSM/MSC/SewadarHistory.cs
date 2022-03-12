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

namespace DCC.ZOS.ZSM.MSC
{
    public partial class SewadarHistory : ZSMAbstractScreen
    {
        private enum GridColumns
        {
            sewa_team_id,
            sewa_tema_nm,
            serial_id
        }

        public SewadarHistory()
        {
            InitializeComponent();
            this.sewadarHeader1.HeaderType = SewadarHeaderType.SewadarGRNoWise;
            this.sewadarHeader1.makeHeaderReadOnly();
            this.lblBadgeHistory.ForeColor = DCC.UMB.CDF.Configuration.Constants.DEFAULT_READONLY_FORE_COLOR;
            this.lblResponsibilityHistory.ForeColor = DCC.UMB.CDF.Configuration.Constants.DEFAULT_READONLY_FORE_COLOR;
            this.lblStatusHistory.ForeColor = DCC.UMB.CDF.Configuration.Constants.DEFAULT_READONLY_FORE_COLOR;
            this.lblTransferHistory.ForeColor = DCC.UMB.CDF.Configuration.Constants.DEFAULT_READONLY_FORE_COLOR;
        }

        public override string ScreenId { get { return Screens.MSC_SEWADAR_HISTORY; } }

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
            this.sewadarHeader1.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
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
                    string[] tokens = screenParameters.Split('|');
                    this.sewadarHeader1.SetNameAndFireEvent(null, int.Parse(tokens[0]), tokens[1]);
                    this.LoadGrid();
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

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarHeaderSQLSelectQuery query = new ViewSewadarHeaderSQLSelectQuery();
            query.sewadar_grno.Equal(this.sewadarHeader1.txtGRNo.DisplayText);
            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            return dbFacade.ExecuteSelectQuery(query);
        }

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.tlpTop);
            LoadGrid();
        }

        private void LoadGrid()
        {
            this.dbFacade.ClearDbTasks();
            List<string> allTasks = new List<string>();
            allTasks.Add(this.dbFacade.QuerySewadarsTransferAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.txtGRNo.DisplayText));
            allTasks.Add(this.dbFacade.QuerySewadarsResponsibilityChangeAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.txtGRNo.DisplayText));
            allTasks.Add(this.dbFacade.QuerySewadarsBadgeAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.txtGRNo.DisplayText));
            allTasks.Add(this.dbFacade.QuerySewadarsStatusChangeAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.txtGRNo.DisplayText));
            this.dbFacade.AddDbTasks(allTasks);
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            this.grdBadgeHistory.RetrieveRecords(dSet.Tables[2], false, RowStates.Old);
            this.grdResponsibilityHistory.RetrieveRecords(dSet.Tables[1], false, RowStates.Old);
            this.grdStatusHistory.RetrieveRecords(dSet.Tables[3], false, RowStates.Old);
            this.grdTransferHistory.RetrieveRecords(dSet.Tables[0], false, RowStates.Old);
        }
    }
}
