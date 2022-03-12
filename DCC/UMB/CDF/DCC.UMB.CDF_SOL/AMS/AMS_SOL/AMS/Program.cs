using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.View;
using DCC.UMB.CDF.MGMT.View.Menu;
using DCC.UMB.CDF.UIControls.Windows;

namespace AES
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
                string commandLineArgument = "AMS_APP|Asset Management System|AMS|Asset Manamentment System|1|20-09-2005|AMS|192.168.1.3||jp|3|restart|AMS_Gnrc|password|50|No|Error|1||||||STR|1|10||";
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
                if(ex.InnerException!=null)
                {
                    Logger.Debug(""+ex.InnerException.Message);
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

                if (menuItem.Name == "Items")
                {
                    UIManager.OpenForm(typeof(Items), UIModes.Tabular,applicationId, string.Empty);
                }
                else if (menuItem.Name == "Satsang Centres")
                {
                    UIManager.OpenForm(typeof(SatsangCentres), UIModes.Tabular, applicationId, "");
                }
                else if (menuItem.Name == "Assets")
                {
                    UIManager.OpenForm(typeof(Assets), UIModes.Insert, applicationId, "");
                }
                else
                {

                }

            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}