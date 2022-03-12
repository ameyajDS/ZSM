using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using DCC.UMB.CDF.Tools.CommandSwitches;

namespace DCC.UMB.CDF.Tools
{
    public static class CDFToolsMain
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        public static void Main(string[] args)
        {
            try
            {  
                CommandSwitchManager commandSwitchManager = new CommandSwitchManager(args);
                string commandResults = string.Empty;
                commandSwitchManager.RunCommand(ref commandResults);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
