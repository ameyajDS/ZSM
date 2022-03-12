using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.IO;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.Configuration;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class PrintSewadarDetails : ZSMBaseParametersScreen
    {
        private long sewadar_id;
        private string sewadar_grno;

        private string reportPath = default(string);
        public override string ReportPath
        {
            get
            {
                return this.reportPath;
            }
        }

        public override string ScreenId { get { return Screens.MSC_PRINT_SEWADAR_DETAILS; } }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            
            if (screenParameters != "")
            {
                string[] param = screenParameters.Split(',');
                sewadar_id = Int64.Parse(param[0]);
                sewadar_grno = param[1];
                InvokePrintDetails();
                this.Close();
            }
        }

        public override object GetReportParameterValues(string parameterName)
        {
            switch (parameterName)
            {
                case "sewadar_id":
                    return sewadar_id;
                
                case "sewadar_gr_no":
                    return sewadar_grno;

                case "p_satsang_centre_id":
                    return ZSMUtility.GetSatsangCentreId();
            }
            return null;
        }

        private void InvokePrintDetails()
        {
            string s = Assembly.GetExecutingAssembly().Location;
            FileInfo fi = new FileInfo(s);
            if (GlobalAppVariables.AppContext.IsWebDBEnabled)
            {
                this.reportPath = @fi.Directory.FullName + "\\RPT\\PrintSewadarPersonalDetails.rdlc";

                GlobalAppVariables.ObjMDIMain.FireWebReportPrint();
            }
            else
            {
                this.reportPath = @fi.Directory.FullName + "\\RPT\\PrintSewadarPersonalDetails.rpt";
                GlobalAppVariables.ObjMDIMain.FirePrint();
            }
        }


    }
}
