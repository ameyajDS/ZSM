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

namespace DCC.ZOS.ZSM.RPT
{
    public class ZSMBaseParametersScreen : AbstractParametersScreen
    {
        protected ZSM_MUMDbFacade dbFacade = null;
        protected bool SSRS_Enabled = System.Configuration.ConfigurationManager.AppSettings["SSRS_Enabled"]=="false"?false:true;
        protected override void InitializeDbFacade()
        {
            this.dbFacade = new ZSM_MUMDbFacade(this.ApplicationId);
        }
        public virtual string ReportFileName
        {
            get
            {
                throw new Exception("Child Screen must implement this method");
            }
        }

        public override string ReportPath
        {
            get
            {
                return @"C:\nobackup\RS\DERA_APPS\DCC\ZOS\ZSM\Branches\v5.00\DCC.ZOS.ZSM_SOL\DCC.ZOS.ZSM\" + this.ReportFileName; ;
            }
        }

        public override string ReportServerURL
        {
            get
            {
                return null;
            }
        }
    }
}
