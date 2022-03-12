using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DCC.UMB.WDF.Controllers;

namespace DCC.UMB.CDB.Web.Controllers
{
    [WDFViewTemplateAuthorize]
    public class PartialsController : Controller
    {
        [ScreenID("WDF.NILL")]
        public ActionResult Main() {
            return View();
        }
        [ScreenID("WDF.NILL")]
        public ActionResult Default() {
            return View();
        }        

        [ScreenID("CDB_01")]
        public ActionResult Relation() {
            return View();
        }

        [ScreenID("CDB_02")]
        public ActionResult WorkingUnits() {
            return View();
        }

        [ScreenID("GEO_01")]
        public ActionResult Level_0_Countries() {
            return View();
        }

        [ScreenID("GEO_02")]
        public ActionResult Level_1_States() {
            return View();
        }

        [ScreenID("GEO_03")]
        public ActionResult Level_2_Districts() {
            return View();
        }

        [ScreenID("GEO_04")]
        public ActionResult Level_3_Cities() {
            return View();
        }

        [ScreenID("GEO_05")]
        public ActionResult Level_4_PostOffices() {
            return View();
        }
    }
}
