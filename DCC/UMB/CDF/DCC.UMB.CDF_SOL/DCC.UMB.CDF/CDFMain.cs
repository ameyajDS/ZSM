using System;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.View.Menu;
//using DCC.UMB.CDF.Tools.CommandSwitches;

namespace DCC.UMB.CDF
{
    public class CDFMain
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            try
            {                
                //CommandSwitchManager commandSwitchManager = new CommandSwitchManager(args);
                //string commandResults = string.Empty;
                //commandSwitchManager.RunCommand(ref commandResults);
            }
            catch (Exception ex)
            {
                //throw;
            }
        }
    }
}
