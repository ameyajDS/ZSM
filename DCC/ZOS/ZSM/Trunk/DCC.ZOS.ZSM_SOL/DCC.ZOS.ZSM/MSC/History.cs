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
    public partial class History : ZSMAbstractScreen
    {
        private enum GridColumns
        {
            sewa_team_id,
            sewa_tema_nm,
            serial_id
        }

        public History()
        {
            InitializeComponent();
        }

        public override string ScreenId { get { return Screens.MSC_HISTORY; } }

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
                    this.historyHeader1.sewadarHeader1.SetNameAndFireEvent(int.Parse(screenParameters), null, null);
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
            query.sewadar_id.Equal(this.historyHeader1.sewadarHeader1.intSewadarId.DisplayText);

            return dbFacade.ExecuteSelectQuery(query);
        }

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.historyHeader1.tlpTop);
            LoadGrid();
        }

        private void LoadGrid()
        {
            DataTable dT = this.dbFacade.QuerySewadarHistory(this.historyHeader1.sewadarHeader1.intSewadarId.IdTextAsInteger).Tables[0];
            this.historyHeader1.grdHistory.RetrieveRecords(dT, false, RowStates.Old);
        }

    }
}
