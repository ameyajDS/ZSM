using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

using DCC.UMB.WDF.DB;
using DCC.CDB.DBFacade;
using DCC.UMB.WDF.Utils;


namespace DCC.UMB.CDB.Web.Controllers {
    public class CDBUtils {
        public static DbManager GetNewDbManager() {
            DbManager dbManager = new DbManager("CDB", "CDB", ConfigurationManager.AppSettings["USER_ID"], ConfigurationManager.AppSettings["SERVER"], UtilityManager.GetPassword("PASSWORD"));
            return dbManager;
        }
        public static CDB_APPDbFacade GetCDBFacade() {
            return new CDB_APPDbFacade("CDB", "CDB", ConfigurationManager.AppSettings["USER_ID"], ConfigurationManager.AppSettings["SERVER"], UtilityManager.GetPassword("PASSWORD"));
        }
    }
}