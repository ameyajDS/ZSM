using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.View;
using DCC.UMB.CDF.MGMT.Modal;

namespace DCC.UMB.CDF.MGMT.Global
{
    public class GlobalAppVariables
    {
        private static MDIMain objMDIMain = null;
        private static AppContext appContext = null;

        public static AppContext AppContext
        {
            get { return appContext; }
            internal set { appContext = value; }
        }
        public static MDIMain ObjMDIMain
        {
            get { return GlobalAppVariables.objMDIMain; }
            internal set { GlobalAppVariables.objMDIMain = value; }
        }
    }
}
