using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using DCC.UMB.CDF.Report;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using System.Configuration;

namespace DCC.SSM.RMS.Reporting.CMN
{
    public class RMSBaseParametersScreen : AbstractParametersScreen
    {
        protected RMS_RPT_DbFacade dbFacade = null;
        protected override void InitializeDbFacade()
        {
            this.dbFacade = new RMS_RPT_DbFacade(this.ApplicationId);
        }
        public override string ReportPath
        {
            get
            {
                return "/DCC.SSM.RMS.SQLReporting/" + ScreenId;
            }
        }
        public override string ReportServerURL
        {
            get
            {
                return ConfigurationSettings.AppSettings["ReportServerURL"].ToString();
            }
        }
    }
}
