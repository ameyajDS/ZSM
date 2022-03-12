using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using White.Core;
using NUnit.Framework;

namespace DCC.ZOS.ZSM.TEST.RPT
{
    [Test]
    public class TestBadgePrinting
    {
        private static Application _application = null;
        private static BadgePrinting _badgePrintingScreen = null;

        [SetUp]
        public void Setup()
        {
            string currentPath = System.Windows.Forms.Application.StartupPath;
            string appPath = currentPath + @"\..\..\..\..\DCC.ZOS.ZSM_SOL\DCC.ZOS.ZSM\bin\Debug\DCC.ZOS.ZSM.exe";
            _application = Application.Launch(appPath);

            // Thread.Sleep(2000);
            _badgePrintingScreen = new BadgePrinting(_application, new string[] { "Activities", "Badge Printing" });
            _badgePrintingScreen.Open();
        }

        public void TestValidationsOnBadgePrinting()
        {
            _badgePrintingScreen.Save();
            Assert.AreEqual(_badgePrintingScreen.MessageText.Trim(), "\"Badge Template\" must be specified");
        }
    }
}
