using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using DCC.UMB.WDF.Utils;

namespace DCC.UMB.CDB.Web {
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication {
        protected void Application_Start() {
            log4net.Config.XmlConfigurator.Configure();
            log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            log.Debug("Logging Started"); 
            AreaRegistration.RegisterAllAreas();
            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles); // For adding minification
            //[[Modify the JSON Formatter for dates, since our sql server is in India and we use dates w.r.t. indian time in sql server. But the javascript assumes all dates w.r.t. GMT so we have to adjust the time by 5:30 hrs
            UtilityManager.ModifyJsonFormatterForDates();
            //]]
        }
    }
}