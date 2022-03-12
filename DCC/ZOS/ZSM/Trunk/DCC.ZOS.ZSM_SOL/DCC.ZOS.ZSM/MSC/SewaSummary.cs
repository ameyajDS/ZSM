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
    public partial class SewaSummary : ZSMAbstractScreen
    {
        private enum GridColumns
        {
            sewa_team_id,
            sewa_tema_nm,
            serial_id
        }

        public SewaSummary()
        {
            InitializeComponent();
            this.sewadarHeader1.HeaderType = SewadarHeaderType.SewadarGRNoWise;
            this.sewadarHeader1.makeHeaderReadOnly();
            this.lblResponsibilityHistory.ForeColor = DCC.UMB.CDF.Configuration.Constants.DEFAULT_READONLY_FORE_COLOR;
        }

        public override string ScreenId { get { return Screens.MSC_SEWA_SUMMARY; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
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
            }
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.Reference)
            {
                ClearControls();
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    string[] tokens = screenParameters.Split('|');
                    this.sewadarHeader1.SetNameAndFireEvent(null, int.Parse(tokens[0]), tokens[1]);
                    this.sewadarHeader1.SatsangCentreId = int.Parse(tokens[0]);
                    this.LoadGrid(int.Parse(tokens[0]), tokens[1]);
                }
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
            LoadGrid(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.txtGRNo.DisplayText);
        }

        private void LoadGrid(int? satsangId, string grNo)
        {
            this.dbFacade.ClearDbTasks();
            DataSet dSet = this.dbFacade.QuerySewadarWiseSewaSummarie(satsangId, grNo);
            this.grdTransferHistory.RetrieveRecords(dSet.Tables[0], false, RowStates.Old);
        }
    }
}
