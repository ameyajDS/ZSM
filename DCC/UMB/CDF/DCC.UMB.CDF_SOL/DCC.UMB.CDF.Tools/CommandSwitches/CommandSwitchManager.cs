using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.MGMT.View.Menu;
using System.Windows.Forms;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.Tools.Common;
using DCC.UMB.CDF.Tools.DBFacadeGenerator;
using DCC.UMB.CDF.Tools.GeneratePackageSetupScripts;
using DCC.UMB.CDF.Tools.WebQueryAnalyzer;
using DCC.UMB.CDF.Utils;
using System.Data;
using DCC.UMB.CDF.Tools.GenerateAppSetup;

namespace DCC.UMB.CDF.Tools.CommandSwitches {
    public class CommandSwitchManager {
        private int profileId = 0;
        private string[] args = null;
        private List<string> commandSwitches = new List<string>(new string[] {
            "GENERATE_FACADE_COMMAND_LINE",
            "GENERATE_FACADE_WINDOW",
            "GENERATE_GRID_COLUMNS",
            "GENERATE_DB_PROCEDURE",
            "GENERATE_DB_BATCH_WINDOW",
            "GENERATE_DB_BATCH_COMMAND_LINE",
            "GENERATE_PACKAGE_SETUP_SCRIPTS",
        "GENERATE_APP_SETUP"});
        private List<string> AllValidSwitches = new List<string>(new string[] { "GENERATE_FACADE_COMMAND_LINE",
            "GENERATE_FACADE_WINDOW", 
            "GENERATE_GRID_COLUMNS",
            "GENERATE_DB_PROCEDURE",
            "GENERATE_DB_BATCH_WINDOW",
            "GENERATE_DB_BATCH_COMMAND_LINE",
            "GENERATE_PACKAGE_SETUP_SCRIPTS",
            "GENERATE_APP_SETUP",
            "UN", "PW", "SN", "AID","DBID", "PDP", "FFP","WEB","FORCE_LOWER_CASE","PACKAGE_ID"});
        private List<KeyValuePair<string, string>> switches = new List<KeyValuePair<string, string>>();
        private const string GENERATE_FACADE_COMMAND_SWITCH = "GENERATE_FACADE_COMMAND_LINE";
        private const string GENERATE_FACADE_WINDOW_SWITCH = "GENERATE_FACADE_WINDOW";
        private const string GENERATE_GRID_COLUMNS_SWITCH = "GENERATE_GRID_COLUMNS";
        private const string GENERATE_DB_PROCEDURE = "GENERATE_DB_PROCEDURE";
        private const string GENERATE_DB_BATCH_WINDOW_SWITCH = "GENERATE_DB_BATCH_WINDOW";
        private const string GENERATE_DB_BATCH_COMMAND_SWITCH = "GENERATE_DB_BATCH_COMMAND_LINE";
        private const string GENERATE_PACKAGE_SETUP_SCRIPTS = "GENERATE_PACKAGE_SETUP_SCRIPTS";
        private const string GENERATE_APP_SETUP = "GENERATE_APP_SETUP";
        private const string USER_NAME = "UN";
        private const string FOR_WEB = "WEB";
        private const string PASSWORD = "PW";
        private const string SERVER_NAME = "SN";
        private const string DB_NAME = "DBID";
        private const string APP_ID = "AID";
        private const string FACADE_FILE_PATH = "FFP";
        private const string PROC_DIR = "PDP";
        private const string PACKAGE_ID = "PACKAGE_ID";
        private string commandExecutionResults = null;

        public CommandSwitchManager(string[] commandLIneArguments) {
            if (commandLIneArguments.Length == 1 && commandLIneArguments[0].Length == 1)//here we are taking shortcut commands of common functions and simulating the full commands
            {
                char shortcutChar = commandLIneArguments[0].ToUpper().ToCharArray()[0];
                switch (shortcutChar) {
                    case 'F':
                        args = new string[] { "-GENERATE_FACADE_WINDOW" };
                        break;
                    case 'G':
                        args = new string[] { "-GENERATE_GRID_COLUMNS" };
                        break;
                    case 'B':
                        args = new string[] { "-GENERATE_DB_BATCH_WINDOW" };
                        break;
                    case 'P':
                        args = new string[] { "-GENERATE_DB_PROCEDURE" };
                        break;
                    case 'A':
                        args = new string[] { "-GENERATE_APP_SETUP" };
                        break;
                    default:
                        args = commandLIneArguments;
                        break;
                }
            } else {
                args = commandLIneArguments;
            }

        }

        public bool RunCommand(ref string commandResults) {
            ConsoleColor originalForeGroundColor = System.Console.ForegroundColor;
            try {
                CollectSwitches();
                ValidateSwitches();
                ExecuteCommand();

                commandResults = commandExecutionResults;
                return true;
            } catch (Exception e) {
                PrintException(e);
                return false;
            } finally {
                Console.ForegroundColor = originalForeGroundColor;
                //Console.WriteLine("Press a key to exit");
                //Console.ReadKey();
            }
        }
        private bool RunCommand() {
            string commandResults = null;
            this.RunCommand(ref commandResults);
            return true;
        }

        private void ExecuteCommand() {
            string commandSwitch = switches[0].Key;
            switch (commandSwitch) {
                case GENERATE_FACADE_COMMAND_SWITCH:
                    ExecuteGenerateFacadeOnCommandLineCommand();
                    break;

                case GENERATE_FACADE_WINDOW_SWITCH:
                    ExecuteGenerateFacadeInWindowCommand();
                    break;
                case GENERATE_GRID_COLUMNS_SWITCH:
                    ExecuteGenerateGridColumns();
                    break;
                case GENERATE_DB_PROCEDURE:
                    ExecuteGenerateDbProcedure();
                    break;
                case GENERATE_DB_BATCH_WINDOW_SWITCH:
                    ExecuteGenerateDbBatchOnWindowCommand();
                    break;
                case GENERATE_DB_BATCH_COMMAND_SWITCH:
                    ExecuteGenerateDbBatchOnCommandLineCommand();
                    break;
                case GENERATE_PACKAGE_SETUP_SCRIPTS:
                    ExecuteGeneratePackageSetupScripts();
                    break;
                case GENERATE_APP_SETUP:
                    ExecuteGenerateAppSetup();
                    break;
                default:
                    throw new Exception("Invalid Command Switch Found.");
            }
        }

        private void ExecuteGenerateAppSetup() {
            if (!HasSwitch(FACADE_FILE_PATH)) {
                throw new Exception("Facade File path is requried, not provided. FFP should point to the ODS file");
            }
            string odsFilePath = GetSwitchValue(FACADE_FILE_PATH);
            AppSetupGenerator.GenerateAppSetupScript(odsFilePath);
        }
        private void ExecuteGeneratePackageSetupScripts() {
            Application.Run(new PackageSetupScriptGenerator());
        }
        private void ExecuteGenerateDbBatchOnWindowCommand() {
            Application.Run(new DCC.UMB.CDF.Tools.GenerateDBBatch.GenerateBatch());
        }
        private void ExecuteGenerateDbBatchOnCommandLineCommand() {
            if (!HasSwitch(PROC_DIR)) {
                throw new Exception("Required switches are not available");
            }
            if (!(HasSwitch(PROC_DIR) &&
                HasSwitch(FACADE_FILE_PATH)
                )) {
                throw new Exception("Required switches are not available");
            }
            StringBuilder sb = new StringBuilder();
            DCC.UMB.CDF.Tools.GenerateDBBatch.GenerateBatch objGenerateBatch =
                new DCC.UMB.CDF.Tools.GenerateDBBatch.GenerateBatch();
            objGenerateBatch.RootPath = GetSwitchValue(PROC_DIR);
            objGenerateBatch.PrintFileNames(sb);
            string outputFilePath = GetSwitchValue(FACADE_FILE_PATH);
            if (File.Exists(outputFilePath)) {
                File.Delete(outputFilePath);
            }
            File.WriteAllText(outputFilePath, sb.ToString());
        }
        private void ExecuteGenerateGridColumns() {
            Application.Run(new GenerateGridColumns.GenerateGridColumns());
        }
        private void ExecuteGenerateDbProcedure() {
            Application.Run(new GenerateSQLProcsFromTable.GenerateProc());
        }

        private void ExecuteGenerateFacadeInWindowCommand() {
            Application.Run(new FacadeGenerator());
        }

        private void ExecuteGenerateFacadeOnCommandLineCommand() {
            if (!(HasSwitch(USER_NAME) &&
                HasSwitch(PASSWORD) &&
                HasSwitch(SERVER_NAME) &&
                HasSwitch(APP_ID) &&
                HasSwitch(FACADE_FILE_PATH) &&
                HasSwitch(DB_NAME)
                )) {
                throw new Exception("Required switches are not available");
            }

            StringBuilder codeStringBuilder = new StringBuilder();
            CodeWriter writer = new CodeWriter(codeStringBuilder, "{", "}");
            string userName = GetSwitchValue(USER_NAME);
            string password = GetSwitchValue(PASSWORD);
            string serverName = GetSwitchValue(SERVER_NAME);
            string dbName = GetSwitchValue(DB_NAME);
            string applicationId = GetSwitchValue(APP_ID);
            string procDir = GetSwitchValue(PROC_DIR);
            string facadeFilepath = GetSwitchValue(FACADE_FILE_PATH);
            string strForWeb = HasSwitch(FOR_WEB) ? GetSwitchValue(FOR_WEB) : "";
            bool isForWeb = false;
            if (!string.IsNullOrEmpty(strForWeb)) {
                isForWeb = bool.Parse(strForWeb);
            }

            //LogStringWriter logWriter = new LogStringWriter(this.textBox1);
            FacadeGenerator generator = new FacadeGenerator();
            if (args.Contains("FORCE_LOWER_CASE")) {
                FacadeGenerator.FORCE_LOWER_CASE = true;
            }
            string packageId = null;
            if (HasSwitch(PACKAGE_ID)) {
                packageId = GetSwitchValue(PACKAGE_ID);
            }
            generator.GenerateCode(userName, password,
                         serverName, dbName, applicationId,
                         procDir, writer, System.Console.Out, isForWeb, packageId);
            File.WriteAllText(facadeFilepath, codeStringBuilder.ToString());

        }


        private void ValidateSwitches() {
            //If the first switch is not one of the command switches viz Add,Update,Delete,Get
            //then throw an exception
            if (!commandSwitches.Contains(switches[0].Key)) {
                throw new Exception("The first switch must be a command switch!");
            }
            //Check that all the switches should be the possible switches
            foreach (KeyValuePair<string, string> pair in switches) {
                if (!AllValidSwitches.Contains(pair.Key)) {
                    throw new Exception("Invalid Switch Found : " + pair.Key);
                }
            }
        }

        private void CollectSwitches() {
            if (args == null || args.Length == 0) {
                throw new Exception("Invalid Command Line Arguments");
            }
            foreach (string arg in args) {
                string[] argNameArgValue = arg.Split(new char[] { '=' });
                if (argNameArgValue.Length > 2 || argNameArgValue.Length < 1) {
                    throw new Exception("Invalid Command Line Arguments");
                }
                if (HasSwitch(argNameArgValue[0])) {
                    throw new Exception("Invalid Switch Found: " + argNameArgValue[0]);
                }
                switches.Add(new KeyValuePair<string, string>
                                 (argNameArgValue[0].Replace("-", string.Empty),
                                      argNameArgValue.Length == 1
                                          ?
                                      null
                                          :
                                      argNameArgValue[1]));


            }
        }
        private bool HasSwitch(string switchName) {
            return GetSwitch(switchName).HasValue;
        }
        private KeyValuePair<string, string>? GetSwitch(string switchName) {
            foreach (KeyValuePair<string, string> pair in switches) {
                if (pair.Key == switchName) return pair;
            }
            return null;
        }
        private string GetSwitchValue(string switchName) {
            KeyValuePair<string, string>? targetSwitch = null;
            targetSwitch = GetSwitch(switchName);
            if (targetSwitch == null) {
                return null;
            }
            return targetSwitch.Value.Value;
        }
        private void PrintResult(string s) {
            ConsoleColor originalForeGroundColor = System.Console.ForegroundColor;
            try {
                Console.ForegroundColor = System.ConsoleColor.Green;
                Console.Out.WriteLine(s);
            } finally {
                Console.ForegroundColor = originalForeGroundColor;
            }
        }
        private void PrintException(Exception ex) {
            ConsoleColor originalForeGroundColor = System.Console.ForegroundColor;
            try {
                Console.ForegroundColor = System.ConsoleColor.Red;
                Console.Out.WriteLine(ex.Message);
                Console.Out.WriteLine("\n");
                Console.ForegroundColor = originalForeGroundColor;
                string[] resources = System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceNames();
                StreamReader reader =
                    new StreamReader(UtilityManager.GetEmbeddedFile(this.GetType(),
                                                                    "UsageNotes.txt"));
                string usageNotes = reader.ReadToEnd();
                Console.WriteLine(usageNotes);
            } finally {
                Console.ForegroundColor = originalForeGroundColor;
            }

        }

    }
}