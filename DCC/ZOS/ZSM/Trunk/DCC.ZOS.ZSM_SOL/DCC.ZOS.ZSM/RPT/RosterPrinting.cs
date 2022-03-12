using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.DBFacade;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.UIControls.Windows;
using System.IO;
using System.Reflection;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class RosterPrinting : ZSMBaseParametersScreen
    {
        private string reportPath = default(string);
        public RosterPrinting()
        {
            InitializeComponent();
            ClearControls();
            string s = Assembly.GetExecutingAssembly().Location;
            FileInfo fi = new FileInfo(s);
            this.reportPath = @fi.Directory.FullName + "\\RPT\\SewadarRoster.rpt";
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_ROSTER_PRINTING;
            }
        }

        public override void ClearControls()
        {
            base.ClearControls();
            this.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
            if (DbManager.IsNotNull(this.dbFacade))
            {
                DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("SELECT s.sewa_id, s.sewa_nm, s.sewa_cd FROM sewas s JOIN CDB..satsang_centres sc ON sc.satsang_centre_id = s.satsang_centre_id WHERE s.attendance_marking = 'Team-wise' AND s.locked_dtm IS NULL AND s.is_default_sewa = 'Yes' AND s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId()).Tables[0];
                if (dT.Rows.Count > 0)
                {
                    this.sewaLookup1.IdText = dT.Rows[0]["sewa_id"].ToString();
                    ZSMUtility.setDisplayValueText(this.sewaLookup1, dT.Rows[0]["sewa_nm"].ToString());
                }
            }
            this.yesNoCombo1.SelectedValue = "No ";
        }

        public override string ReportPath
        {
            get
            {
                return this.reportPath;
            }
        }

        public override string ReportServerURL
        {
            get
            {
                return null;
            }
        }

        public override object GetReportParameterValues(string parameterName)
        {
            switch (parameterName)
            {
                case "p_sewa_id":
                    return this.sewaLookup1.IdTextAsInteger;
                case "p_team_id":
                    return this.sewaTeamsLookup1.IdTextAsInteger;
                case "p_prev_year_sewa_id":
                    return this.sewaLookupLastYear.IdTextAsInteger;
                case "p_prev_2nd_year_sewa_id":
                    return this.sewaLookupSecondLast.IdTextAsInteger;
                case "p_prev_3rd_year_sewa_id":
                    return this.sewaLookupThirdLat.IdTextAsInteger;
                case "p_construction_sewa_id":
                    return this.sewaContructionLookup.IdTextAsInteger;
                case "p_NonInitiateTeam":
                    return this.yesNoCombo1.SelectedValue;
            }
            return null;
        }

        public override bool IsReadyToSave()
        {
            bool printingAllowed = true;
            int? sewaId = this.sewaLookup1.IdTextAsInteger.Value;
            int? lastYrSewaId = this.sewaLookupLastYear.IdTextAsInteger;
            int? thirdLastYrSewaId = this.sewaLookupThirdLat.IdTextAsInteger;
            int? secondLastYrSewaId = this.sewaLookupSecondLast.IdTextAsInteger;

            if (((sewaId == secondLastYrSewaId) || (sewaId == thirdLastYrSewaId) || (sewaId == lastYrSewaId))
                || ((DbManager.IsNotNull(secondLastYrSewaId) && DbManager.IsNotNull(thirdLastYrSewaId)) && (secondLastYrSewaId == thirdLastYrSewaId))
                || ((DbManager.IsNotNull(lastYrSewaId) && DbManager.IsNotNull(thirdLastYrSewaId)) && (lastYrSewaId == thirdLastYrSewaId))
                || ((DbManager.IsNotNull(secondLastYrSewaId) && DbManager.IsNotNull(lastYrSewaId)) && (secondLastYrSewaId == lastYrSewaId))
                )
            {
                //Invalid @1 for @2
                UIManager.ShowMessage(MsgCodes.InvalidValue, "Sewa Values | Sewa. The Sewas specified in Sewa and previous three years Sewas are distinct.", MessageTypes.Error);
                printingAllowed = false;
            }
            return base.IsReadyToSave() && printingAllowed;
        }

        public override void Save()
        {
            if (GlobalAppVariables.AppContext.IsWebDBEnabled)
            {
                GlobalAppVariables.ObjMDIMain.FireWebReportPrint();
            }
            else
            {
                GlobalAppVariables.ObjMDIMain.FirePrint();
            }
            UIManager.LogOperation(this.dbFacade.ObjDBManager, this, AudiLogActions.Insert, this.sewaLookup1.IdText + "|" + this.sewaTeamsLookup1.IdText);
        }

        private void sewaLookup1_LookupDialogShowing(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "WHERE s.attendance_marking = 'Team-wise' AND s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND ");
        }

        private void sewaLookupLastYear_LookupDialogShowing(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND s.attendance_marking = 'Team-wise' ");
        }

        private void sewaLookupSecondLast_LookupDialogShowing(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "WHERE s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND ");
        }

        private void sewaLookupThirdLat_LookupDialogShowing(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("WHERE", "WHERE s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + " AND ");
        }

        private void sewaTeamsLookup1_LookupDialogShowing(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "(s.sewa_id = " + this.sewaLookup1.IdTextAsInteger.GetValueOrDefault(0) +" )");
        }

        private void sewaContructionLookup_LookupDialogShowing(object sender, UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", " s.is_satsang_programme = 'No' And s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }
    }
}
