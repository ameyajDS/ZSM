using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DCC.UMB.TAF.View;
using NUnit.Framework;
using White.Core.UIItems.WindowItems;
using White.Core;

namespace DCC.ZOS.ZSM.TEST.Activities
{
    public class SewadarHistoryScreen : TAFAbstractScreen
    {
        private Window _mainWindow;

        public SewadarHistoryScreen(Application application, params string[] menuPath)  : base(application, menuPath)
        {
            _mainWindow = application.GetWindow("Zonal Sewadar Management");
        }

        public void VerifySewadarHistoryForSystemId(int systemId)
        {
            
            //this.OpenScreen("Activities", "Sewadars Information");
            this.GetTextField("intSewadarId").Text = systemId.ToString();
            this.Get();
            //this.OpenScreen("Actions", "Sewadar History");
            TAFGrid statusGrid = this.GetGrid("grdStatusHistory");
            //string status = statusGrid.GetCellValue(0, 0);
            //string statusDate = statusGrid.GetCellValue(0, 1);
            //Assert.AreEqual(status, "In-active");
            //Assert.AreEqual(statusDate, "14 Aug 2005"); 
        }
    }
}
