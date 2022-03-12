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
    public partial class SewadarTeamTransfers : ZSMAbstractScreen
    {
        private bool terminate = true;
        private DateTime? effectiveDate = null;
        private int? serialId = null;
        private int? sewaId = null;
        private DepartmentTransfers callingScreen = null;
        private int? currentTeamId = null;
        private enum GridColumns
        {
            sewa_team_id,
            sewa_tema_nm,
            serial_id,
            sewa_id
        }

        public SewadarTeamTransfers()
        {
            InitializeComponent();
            this.sewadarHeader1.SttsCode = "SttsScrTrf";
        }

        public override string ScreenId { get { return Screens.MSC_SEWADAR_TEAM_TRANSFERS; } }

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
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert || uiMode == UIModes.New)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    string[] tokens = screenParameters.Split('|');
                    if (tokens.Length >= 3)
                    {
                        int? swdId = int.Parse(tokens[0]);
                        string swdName = tokens[1];
                        this.effectiveDate = DateTime.Parse(tokens[2]);
                        this.sewadarHeader1.SetNameAndFireEvent(swdId, null, null);
                        DataTable dT = this.dbFacade.GetActiveSerialIdForSewadar(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.TxtGRNo.DisplayText, this.effectiveDate).Tables[0];
                        this.currentTeamId = DbManager.GetNullableInteger(dT.Rows[0][GridColumns.sewa_team_id.ToString()]);
                        this.txtCurrentSewaTeam.DisplayText = DbManager.GetString(dT.Rows[0][GridColumns.sewa_team_id.ToString()]); ;
                        serialId = DbManager.GetNullableInteger(dT.Rows[0][GridColumns.serial_id.ToString()]);
                        sewaId = DbManager.GetNullableInteger(dT.Rows[0][GridColumns.sewa_id.ToString()]);
                        DataTable dTTeams = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select transfer_in_dt, transfer_out_dt from sewa_team_wise_sewadars WHERE serial_id = {0} AND sewa_team_id = {1}", serialId, this.currentTeamId)).Tables[0];
                        this.dtTransferIn.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dTTeams.Rows[0]["transfer_in_dt"]);
                        this.dtTransferOut.DisplayTextAsDateTime = DbManager.GetNullableDateTime(dTTeams.Rows[0]["transfer_out_dt"]);
                        AbstractScreen screen = this.CallingScreen;
                        if (screen.GetType() == typeof(DepartmentTransfers))
                        {
                            callingScreen = (DepartmentTransfers)screen;
                            callingScreen.SetDepartments(this.departmentChooserFrom, this.departmentChooserTo);
                        }
                        this.dtEffective.DisplayTextAsDateTime = this.effectiveDate;
                    }
                }
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

        public override bool IsReadyToSave()
        {
            //[[The new team team cannot be same as the existing team. 
            if (this.currentTeamId == this.sewaTeamsLookup1.IdTextAsInteger)
            {
                UIManager.ShowMessage(MsgCodes.InvalidValue, "operation | team transfers. The new team team cannot be same as the existing team.", MessageTypes.Error);
                return false;
            }
            //]]
            return base.IsReadyToSave();
        }

        public override void Save()
        {
            if (terminate)
            {
                terminate = false;
                throw new DCCException(new Exception(""), MsgCodes.ValueReqd, "New team");
            }
            else
            {
                this.callingScreen.AddDbTasks(this.dbFacade.UpdateSewaTeamWiseSewadarAsTask(this.currentTeamId, serialId, serialId, ZSMUtility.GetSatsangCentreId()
                    , this.sewadarHeader1.TxtGRNo.DisplayText, this.dtTransferIn.DisplayTextAsDateTime, this.effectiveDate.Value.AddDays(-1)));
                this.callingScreen.AddDbTasks(this.dbFacade.InsertSewaTeamWiseSewadarAsTask(this.sewaTeamsLookup1.IdTextAsInteger, this.dbFacade.FnGetMaxSerialId(this.sewaTeamsLookup1.IdTextAsInteger), ZSMUtility.GetSatsangCentreId()
                    , this.sewadarHeader1.TxtGRNo.DisplayText, this.effectiveDate, null));

                //UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, "");       
            }
        }

        private void sewaTeamsLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "s.sewa_team_id <> " + this.currentTeamId + " AND s.sewa_id = " + this.sewaId.GetValueOrDefault(0) );
        }

    }
}
