using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Optimization;

namespace DCC.UMB.CDB.Web {
    public class BundleConfig {
        public static void RegisterBundles(BundleCollection bundles) {            
          bundles.Add(new ScriptBundle("~/c/js/cdbJS").IncludeDirectory("~/js","*.js",true));
            /*
            bundles.Add(new ScriptBundle("~/c/js/samJS").Include("~/c/js/sam.js"                                                         
                                                        //[[ManageUsers
                                                        ,"~/c/js/ManageUsers/ManageUsersController.js"
                                                        ,"~/c/js/ManageUsers/ManageUserViewModel.js"
                                                        //]]              
                                                        //[[UserPrivileges
                                                        , "~/c/js/UserPrivileges/UserPrivilegesController.js"
                                                        , "~/c/js/UserPrivileges/UserPrivilegesController.js"
                                                        //]]
                                                                    
                ));
             */

            // This includes files found with a pattern in dir.   //.Include("~/c/JS/*.js", "~/c/JS/Masters/AMSSettings/*.js"));

            BundleTable.EnableOptimizations = ("" + System.Configuration.ConfigurationManager.AppSettings["ENABLE_WEB_OPTIMIZATIONS"]).ToLower() == "true";
        }
    }
}