using System.Web;
using System.Web.Mvc;

namespace DCC.UMB.CDB.Web {
    public class FilterConfig {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters) {
            filters.Add(new HandleErrorAttribute());
        }
    }
}