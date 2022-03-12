using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Configuration;
using DCC.UMB.CDB2;
using DCC.UMB.CDF.MGMT.View.Menu;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDB2.ENT;
//using DCC.UMB.CDF.WEB.Log;
//using DCC.UMB.CDF.WEB.Configuration;

namespace DCC.SSM.CDB2
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            try
            {
                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
               
                string commandLineArgument = ConfigurationSettings.AppSettings["ConnectionString"];
                

                if (args != null && args.Length > 0)
                {
                    commandLineArgument = args[0];
                }
                UIManager.StartFramework(commandLineArgument, MenuClicked);
            }
            catch (Exception ex)
            {

                Logger.Debug(ex.Message);
                Logger.Debug(ex.StackTrace);
                if (ex.InnerException != null)
                {
                    Logger.Debug("" + ex.InnerException.Message);
                    Logger.Debug("" + ex.InnerException.StackTrace);
                }
                
               throw;
            }
        }
        private static void MenuClicked(DCCToolStripMenuItem menuItem)
        {
            try
            {
                string applicationId = GlobalAppVariables.AppContext.ApplicationId;
                string SessionID = GlobalAppVariables.AppContext.SessionId;

                if (menuItem.Name == "Working Units")
                {
                    UIManager.OpenForm(typeof(WorkingUnits), UIModes.Insert, "CDB_CDF", string.Empty);
                }
                else if (menuItem.Name == "Qualification")
                {
                    UIManager.OpenForm(typeof(Qualifications), UIModes.Query, "CDB_CDF", string.Empty);
                }
                else if (menuItem.Name == "Qualification Subjects")
                {
                    UIManager.OpenForm(typeof(QualificationSubjects), UIModes.Insert, "CDB_CDF", string.Empty);
                }
                else if (menuItem.Name == "AMS City Clean")
                {
                    UIManager.OpenForm(typeof(AMSCityClean),UIModes.Reference,"CDB_CDF",string.Empty);
                }
            }
            catch(Exception ex)
            {
                throw;
            }
        }

        static void screen_FormClosing(object sender, ChildClosingEventArgs e)
        {
            string applicationId = GlobalAppVariables.AppContext.ApplicationId;
            AbstractScreen closingScreen = (AbstractScreen)sender;
            if (closingScreen.CurrentUIMode != UIModes.Insert)
            {
                return;
            }
        }

        
    }
}
