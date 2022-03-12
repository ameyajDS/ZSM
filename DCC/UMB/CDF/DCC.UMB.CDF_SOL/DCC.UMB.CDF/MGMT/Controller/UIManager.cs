using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.MGMT.View.Menu;
using System.Windows.Forms;
using DCC.UMB.CDF.MGMT.View;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.Sound;
//using DCC.UMB.CDF.Tools.DBFacadeGenerator.Utils;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.MGMT.Modal;
using System.Reflection;
using DCC.UMB.CDF.Utils;
using System.Collections.Specialized;
using System.Net;
using System.IO;
using System.Web;
using System.Configuration;
using DCC.UMB.CDF.Crypto;

namespace DCC.UMB.CDF.MGMT.Controller
{
    public class UIManager
    {
        private static List<Chain> lstChains = new List<Chain>();
        private static DataTable standardMessages = null;
        private static Thread standardMessageLoaderThread = null;
        public static event EventHandler<EventArgs> FrameworkRunning;
        private static EventHandler objMDIMain_ActivatedEventHandler = null;
        /// <summary>
        /// This method starts the CDF's runtime by the specified command line parameters.
        /// The command line parameters are same as passed by application launcher to this
        /// application.
        /// </summary>
        /// <param name="commandLineArguments">A string, specifying command line arguments, as passed in by application launcher.</param>
        /// <param name="menuClickEventHandler">A Delegate which will be invoked when user clicks on any of the menu items.
        /// This excludes sub menus of "Operations", "Actions" and "Windows" menu groups present in the main menu bar.</param>
        public static void StartFramework(string commandLineArguments, DCCToolStripItemClicked menuClickEventHandler)
        {
            //[[Check if the application has been launched from the web (as clickonce application)
            //if yes, then we have to initialize the webDbmanager instance and not local dbManager.
            //Also capture the guid passed to this application. This guid is something which is
            //stored on the web server static cache and would be used to return the command line arguments
            //to this application
            string cdfwsurl = null;
            bool isLaunchedFromWebLauncher = (AppDomain.CurrentDomain.SetupInformation.ActivationArguments != null &&
                AppDomain.CurrentDomain.SetupInformation.ActivationArguments.ActivationData != null &&
                AppDomain.CurrentDomain.SetupInformation.ActivationArguments.ActivationData[0] != null);
            if (ConfigurationManager.AppSettings["SimulateWebDB"] == "true" ||
                isLaunchedFromWebLauncher
                )
            {
                //MessageBox.Show("Attach process now");
                string weburl = null;
                if (isLaunchedFromWebLauncher)
                {
                    weburl = AppDomain.CurrentDomain.SetupInformation.ActivationArguments.ActivationData[0];
                }
                else
                //if (ConfigurationManager.AppSettings["SimulateWebDB"] == "true")
                {
                    //weburl = "http://srvaddon.dnsalias.net:8087/WebLauncher/apps/zsm/dcc.zos.zsm.application?guid=909";
                    weburl = ConfigurationManager.AppSettings["SimulateWebDBURL"];
                }
                Uri uri = new Uri(weburl);
                NameValueCollection col = HttpUtility.ParseQueryString(uri.ToString());
                if (col.Count <= 0)
                {
                    MessageBox.Show("Error: Invalid Context", "CDF Web Launcher");
                    Application.Exit();
                }
                string guid = col.Get(0);
                cdfwsurl = uri.Scheme + "://" + uri.Authority + "/cdfws/DbManager/dbmanagerws.asmx";
                //cdfwsurl = cdfwsurl.Replace("http", "https");    
                if (ConfigurationManager.AppSettings["SimulateWebDB"] != "true")
                {
                    string urlOfAppParametersSender = uri.Scheme + "://" + uri.Authority + "/webLauncher/auth/AppParameters.aspx?guid=" + guid;
                    WebClient client = new WebClient();

                    commandLineArguments = (new StreamReader(client.OpenRead(urlOfAppParametersSender))).ReadToEnd();
                    if (commandLineArguments.ToUpper().StartsWith("ERROR:"))
                    {
                        MessageBox.Show("Error: Invalid Context", "CDF Web Launcher");
                        Application.Exit();
                    }
                    commandLineArguments = EncryptDecrypt.Decrypt(commandLineArguments);
                }
            }
            //]]
            GlobalAppVariables.AppContext = new AppContext(commandLineArguments);
            GlobalAppVariables.AppContext.InitializeAppContext(cdfwsurl);
            Logger.InitializeLogger(GlobalAppVariables.AppContext.ApplicationId, GlobalAppVariables.AppContext.SessionId);
            Logger.Debug("Starting Common Development Framework");
            MDIMain objMDIMain = new MDIMain(menuClickEventHandler);

            GlobalAppVariables.ObjMDIMain = objMDIMain;
            Logger.Debug("MDI Main Created Successfully!");
            objMDIMain.Text = GlobalAppVariables.AppContext.ApplicationName;
            standardMessageLoaderThread = new Thread(LoadStandardMessages);
            standardMessageLoaderThread.Start();
            //LoadStandardMessages();
            objMDIMain_ActivatedEventHandler = new EventHandler(objMDIMain_Activated);
            objMDIMain.Activated += objMDIMain_ActivatedEventHandler;
            Application.Run(objMDIMain);//This line is blocking as windows application will start.

            //Below lines will execute when user will shut down the application gracefully.
            Logger.Debug("Common Development Framework will now close the application and exit.");
            Logger.Debug("Good Bye....");
        }

        static void objMDIMain_Activated(object sender, EventArgs e)
        {
           //[[Now that the mdimain has been initialized and is activated, we can safely raise the FramworkRunning event, but before taht
            //un-subscribbe the activated event handler
            if (objMDIMain_ActivatedEventHandler != null)
            {
                GlobalAppVariables.ObjMDIMain.Activated -= objMDIMain_ActivatedEventHandler;
                EventHandler<EventArgs> handler = FrameworkRunning;
                if (handler != null)
                {
                    handler(GlobalAppVariables.ObjMDIMain, new EventArgs());
                }
                objMDIMain_ActivatedEventHandler = null;
            }
        }

        private static void LoadStandardMessages()
        {
            IDbManager dbManager = UtilityManager.CreateDBManagerInstanceForSysAdmin();
            DataSet dset = dbManager.ExecuteSQL("SELECT * FROM sysadmin..standard_messages");
            UIManager.StandardMessages = dset.Tables[0];
        }

        internal static void CloseCurrentSession()
        {
            try
            {
                IDbManager dbManager = UtilityManager.CreateDBManagerInstanceForSysAdmin();
                dbManager.ExecuteSQL(string.Format("CloseSession @p_user_no={0}, @p_application_id={1}, @p_session_id={2}",
                                                   GlobalAppVariables.AppContext.UserNumber.ToString(),
                                                   GlobalAppVariables.AppContext.ApplicationId.ToString(),
                                                   GlobalAppVariables.AppContext.SessionId.ToString()));

                Logger.Debug("Session Closed Successfully.");
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
                //Do nothing, as application is exiting.
            }
        }
        /// <summary>
        /// This method opens a child screen of specified type in specified mode.
        /// </summary>
        /// <param name="type">The type of the child screen to be opened.
        /// This must be an inheritted class from AbstractScreen class</param>
        /// <param name="uiMode">The mode in which this screen should be opened</param>
        /// <param name="applicationId">The applicationId in whose context this screen 
        /// should be opened. The applicationId actually specifies to which database
        /// this application makes connection to for its database operations.</param>
        /// <param name="screenParameters">Any specific parameters which needs to be passed
        /// to this screen before it is opened.</param>
        /// <returns></returns>
        public static AbstractScreen OpenForm(Type type, UIModes uiMode, string applicationId, string screenParameters)
        {
            return OpenForm(type, uiMode, applicationId, screenParameters, null, null);
        }

        /// <summary>
        /// Opens a Screen of given type in given UI Mode. If the screen is beining opened 
        /// in a chain (like in New/Update/Reference modes) then the screen is added as a link
        /// in a chain stack, else a new chain is opened with this screen as the base level link.
        /// </summary>
        /// <param name="type">The type of the screen to be opened.</param>
        /// <param name="uiMode">The mode in which the screen needs to be opened</param>
        /// <param name="screenParameters">Any parameters which screen needs to be passed.</param>
        /// <param name="callingScreen">If the screen is being opened in a calling chain, then who is the calling screen. Else specify null</param>
        /// <param name="callingControl">If the screen is being opened in a calling chain, then who is the calling control in the calling screen. Else specify null</param>
        /// <returns>Returns the instance of the opend screen</returns>
        public static AbstractScreen OpenForm(Type type, UIModes uiMode, string applicationId,
            string screenParameters, AbstractScreen callingScreen, Control callingControl)
        {
            Logger.Debug("Request to open screen of type " + type);

            ///[[First check if any of the chain in the Chains has the child screen of 
            //same type if yes, then show a message and return
            if (uiMode != UIModes.Reference &&
                uiMode != UIModes.Report &&
                uiMode != UIModes.New &&
                uiMode != UIModes.Update)
            {
                foreach (Chain chain in lstChains)
                {
                    Link linkContainingScreen = chain.GetLinkOfType(type);
                    AbstractScreen existingChildScreen = null;
                    if (linkContainingScreen != null)
                    {
                        existingChildScreen = linkContainingScreen.CalledScreen;
                    }

                    if (existingChildScreen != null &&
                        existingChildScreen.CurrentUIMode != UIModes.Reference &&
                        //existingChildScreen.CurrentUIMode != UIModes.Update &&
                        //existingChildScreen.CurrentUIMode != UIModes.New &&
                        existingChildScreen.CurrentUIMode != UIModes.Report)
                    {
                        UIManager.ShowMessage(MsgCodes.ScreenAlreadyOpened,
                            UtilityManager.FormMessageTokens(existingChildScreen.Text, existingChildScreen.CurrentUIMode.ToString()),
                            MessageTypes.Warning);
                        return existingChildScreen;
                    }
                }
            }
            //]]    

            Logger.Debug("This type of screen is not opened in any chain. Starting a new chain or link in existing chain.");

            ////[[Now if the callingScreen is null, that means the form is not being opened
            ///on the top of any other form. So simply start a new chain. with this form as the 
            ///root of the chain, where calling form will always be null.
            Chain objChain = null;
            if (callingScreen == null)
            {
                objChain = new Chain();
            }
            else
            {
                objChain = GetContainerChain(callingScreen);
            }

            //[[Create the instance of the child screen
            AbstractScreen childScreen = (AbstractScreen)System.Activator.CreateInstance(type);
            //]]

            //[[If current user role does not have any access (check if selected is not granted) then show a message and come out
            if (!GlobalAppVariables.AppContext.IsSelectGranted(childScreen.ScreenId, applicationId))
            {
                //try to get the screen name
                string screenName = childScreen.ScreenId;
                try
                {
                    screenName =
                        GlobalAppVariables.AppContext.GetScreenName(applicationId, childScreen.ScreenId);
                }
                catch
                {
                    //do nothing
                }
                UIManager.ShowMessage(MsgCodes.PermissionDenied, screenName + "|" + uiMode.ToString(), MessageTypes.Warning);
                return null;
            }
            //]]

            //[[Now tell the child screen isntance about the application id, in whose context it should perform
            childScreen.ApplicationId = applicationId;
            //]]

            Logger.Debug(string.Format("Screen of type {0} created successfully!", type));
            objChain.AddLink(new Link(childScreen, callingControl));
            //[[Now register the chain object to the screen
            childScreen.ContainerChain = objChain;
            //]]

            if (!lstChains.Contains(objChain))
            {
                lstChains.Add(objChain);
            }
            //childScreen.MdiParent = GlobalAppVariables.ObjMDIMain;
            childScreen.Text = GlobalAppVariables.AppContext.GetScreenName(childScreen.ApplicationId, childScreen.ScreenId);
            childScreen.ShowScreen(uiMode, screenParameters);
            
            //[[Now that the screen is to  be shown, set the look and feel of the controls
            childScreen.ClearControlsAndSetLooksAsPerCurrentMode(false);
            //]]
            //childScreen.WindowState = FormWindowState.Maximized;
           
            return childScreen;
        }

        /// <summary>
        /// This method removes a link from the call chain stack.
        /// </summary>
        /// <param name="closingChildScreen"></param>
        internal static Link RemoveLinkFromChain(AbstractScreen closingChildScreen)
        {
            ///[[Get the handle of the chain which has the closingChildScreen as a link.
            foreach (Chain chain in lstChains)
            {
                AbstractScreen existingChildScreenLink = null;
                Link linkContainingScreen = chain.GetLinkOfType(closingChildScreen.GetType());
                if (linkContainingScreen != null)
                {
                    existingChildScreenLink = linkContainingScreen.CalledScreen;
                }
                if (existingChildScreenLink != null)
                {
                    Logger.Debug("Link found of type {0}, removing it from the chain.");
                    return chain.RemoveLink();
                }
            }
            //]]    
            return null;
        }

        internal static Link GetLinkOfType(Type calledScreenType)
        {
            foreach (Chain chain in lstChains)
            {
                Link link = chain.GetLinkOfType(calledScreenType);
                if (link != null)//means this chain has a link whose calledscreen type is "calledScreenType" (the parameter to this method)
                {
                    return link;
                }
            }
            return null;
        }
        public static void LogOperation(IDbManager ObjDBManager, AbstractScreen currentScreen,
                                        AudiLogActions action,
                                        string objectId)
        {
            Hashtable table = new Hashtable();
            table.Add("p_object_id", objectId);
            LogOperation(ObjDBManager, currentScreen, action, table);
        }
        /// <summary>
        /// This method invokes the LogOperation stored procedure on the database   
        /// which corresponds to the ApplicationId property of the AbstractScreen instance invoking
        /// this method.
        /// This method MUST be invoked in the Save() method of the screen and must be within the 
        /// one SQL transaction scope. In case of the update/delete operations this method should 
        /// be invoked before actual update/deletes is invoked on to the database. In case of Insert
        /// operation, this method should be invoked once the insert has been invoked on the database
        /// and the primary key of the object has been formed. The transaction must rollback if 
        /// Log Operation fails.
        /// </summary>
        /// <param name="currentScreen">The instance of AbstractScreen invoking this method.</param>
        /// <param name="action">DBAction being logged into audit_log table</param>
        /// <param name="screenSpecificParameters">A Hashtable used to capture screen specific arguments passed to 
        /// LogOperation stored procedure. The spelling of the "key" in the hashtable MUST match with the 
        /// name of the argument expected by the stored procedure.</param>
        public static void LogOperation(IDbManager ObjDBManager,
                                        AbstractScreen currentScreen,
                                        AudiLogActions action,
                                        Hashtable screenSpecificParameters)
        {
            //IDbManager ObjDBManager = UtilityManager.CreateDBManagerInstance(currentScreen.ApplicationId); 
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_session_id", GlobalAppVariables.AppContext.SessionId, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_session_id_Parameter);
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", GlobalAppVariables.AppContext.GetPackageName(currentScreen.ApplicationId), SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", currentScreen.ApplicationId, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", GlobalAppVariables.AppContext.UserNumber, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", GlobalAppVariables.AppContext.UserRoleId, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_operation_Parameter = ObjDBManager.CreateSqlParameter("p_operation", action.ToString().ToCharArray()[0], SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_operation_Parameter);
            SqlParameter p_screen_id_Parameter = ObjDBManager.CreateSqlParameter("p_screen_id", currentScreen.ScreenId, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_screen_id_Parameter);

            SqlParameter p_object_id_Parameter = null;
            StringBuilder sb = new StringBuilder();
            foreach (object key in screenSpecificParameters.Keys)
            {
                SqlDbType sqlType = TypeConvertor.ToSqlDbType(screenSpecificParameters[key].GetType());
                SqlParameter param = ObjDBManager.CreateSqlParameter(key.ToString(), screenSpecificParameters[key], sqlType, ParameterDirection.Input);
                if (param.ParameterName == "p_object_id")//if the p_object_id_Parameter is passed in hashtable, presreve the handle.
                {
                    p_object_id_Parameter = param;
                }
                sqlParameters.Add(param);
                sb.Append(screenSpecificParameters[key].ToString() + "|");
            }
            //[[form the value of the parameter p_object_id, by concatinating the values in the pipeSeparatedObjectValue hashtable
            string pipeSeparatedObjectValue = sb.ToString();
            if (pipeSeparatedObjectValue.EndsWith("|"))
            {
                pipeSeparatedObjectValue = pipeSeparatedObjectValue.Substring(0, pipeSeparatedObjectValue.Length - 1);
            }
            if (p_object_id_Parameter == null)
            {
                p_object_id_Parameter = ObjDBManager.CreateSqlParameter("p_object_id", pipeSeparatedObjectValue, SqlDbType.VarChar, ParameterDirection.Input);
                sqlParameters.Add(p_object_id_Parameter);
            }
            else
            {
                p_object_id_Parameter.Value = p_object_id_Parameter.Value == null ? pipeSeparatedObjectValue :
                                                                                    p_object_id_Parameter.Value.ToString();
            }

            //]]
            ObjDBManager.ExecuteStoredProc("LogOperation", sqlParameters);
        }


        /// <summary>
        /// This method closes the screen and removes its reference from the containing calling chain
        /// </summary>
        /// <param name="aScreen">The screen getting closed</param>
        public static void CloseScreen(AbstractScreen aScreen)
        {
            Logger.Debug(string.Format("Closing screen {0}", aScreen.Text));
            Chain containerChain = GetContainerChain(aScreen);
            if (containerChain != null)
            {
                containerChain.RemoveLink();
            }
            if (!aScreen.IsFormClosing)
            {
                aScreen.Dispose();
            }
            Logger.Debug(string.Format("Screen {0} closed and removed from chain", aScreen.Text));
            System.GC.Collect();
        }

        /// <summary>
        /// Clears message bar of any contents.
        /// </summary>
        internal static void ClearMessageBar()
        {
            MessageBarLabel lblMessageBar = GlobalAppVariables.ObjMDIMain.MessageTextBox;
            lblMessageBar.SetMessageText(string.Empty, MessageTypes.None, string.Empty);
        }



        /// <summary>
        /// Shows a message in the message bar
        /// </summary>
        /// <param name="messageCode">The code of the message to be shown. The valid codes are defined in SysAdmin database (table standard_messages) </param>
        /// <param name="messageTokens">A "|" separated string specifying the replacements to be made in the messageCode</param>
        public static void ShowMessage(string messageCode, string messageTokens)
        {
            ShowMessage(messageCode, messageTokens, MessageTypes.Plain, null, UIModes.None, null);
        }
        /// <summary>
        /// Shows a message in the message bar
        /// </summary>
        /// <param name="messageCode">The code of the message to be shown. The valid codes are defined in SysAdmin database (table standard_messages) </param>
        /// <param name="messageTokens">A "|" separated string specifying the replacements to be made in the messageCode</param>
        /// <param name="messageType">The type of the message.</param>
        public static void ShowMessage(string messageCode, string messageTokens, MessageTypes messageType)
        {
            ShowMessage(messageCode, messageTokens, messageType, null, UIModes.None, null);
        }
        /// <summary>
        /// Shows a message in the message bar
        /// </summary>
        /// <param name="messageCode">The code of the message to be shown. The valid codes are defined in SysAdmin database (table standard_messages) </param>
        /// <param name="messageTokens">A "|" separated string specifying the replacements to be made in the messageCode</param>
        /// <param name="messageType">The type of the message.</param>
        /// <param name="screenId">The Id of the screen which is trying to show this message.</param>
        public static void ShowMessage(string messageCode, string messageTokens, MessageTypes messageType, string screenId)
        {
            ShowMessage(messageCode, messageTokens, messageType, screenId, UIModes.None, null);
        }
        /// <summary>
        /// Shows a message in the message bar
        /// </summary>
        /// <param name="messageCode">The code of the message to be shown. The valid codes are defined in SysAdmin database (table standard_messages) </param>
        /// <param name="messageTokens">A "|" separated string specifying the replacements to be made in the messageCode</param>
        /// <param name="messageType">The type of the message.</param>
        /// <param name="screenId">The Id of the screen which is trying to show this message.</param>
        /// <param name="screenMode">The current mode of the screen which is trying to show this message</param>
        public static void ShowMessage(string messageCode, string messageTokens, MessageTypes messageType, string screenId, UIModes screenMode)
        {
            ShowMessage(messageCode, messageTokens, messageType, screenId, screenMode, null);
        }

        /// <summary>
        /// Shows a message in the message bar
        /// </summary>
        /// <param name="messageCode">The code of the message to be shown. The valid codes are defined in SysAdmin database (table standard_messages) </param>
        /// <param name="messageTokens">A "|" separated string specifying the replacements to be made in the messageCode</param>
        /// <param name="messageType">The type of the message.</param>
        /// <param name="screenId">The Id of the screen which is trying to show this message.</param>
        /// <param name="screenMode">The current mode of the screen which is trying to show this message</param>
        /// <param name="otherInformation">Any supplementary iformaiton which can enhance the message content.</param>
        public static void ShowMessage(string messageCode, string messageTokens, MessageTypes messageType, string screenId, UIModes screenMode, string otherInformation)
        {
            string[] tokens = messageTokens.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
            FormAndShowMessage(messageCode, messageType, screenId, screenMode, otherInformation, tokens);
        }
        private static void FormAndShowMessage(string messageCode, MessageTypes messageType, string screenId, UIModes screenMode, string otherInformation, string[] messageTokens)
        {
            string messageCodeTemplate = GetMessageCodeTemplate(messageCode);

            int numberOfPlaceHodlersInMessageCode = CountOccurrences(messageCodeTemplate, "@");
            if (numberOfPlaceHodlersInMessageCode != messageTokens.Length)
            {
                throw new Exception(
                    "The number of Message Tokens passed are not equal to the number of expected tokens in message code");
            }
            string messageString = messageCodeTemplate;
            for (int i = 0; i < messageTokens.Length; i++)
            {
                messageString = messageString.Replace("@" + (i + 1).ToString(), messageTokens[i]);
            }
            GlobalAppVariables.ObjMDIMain.MessageTextBox.SetMessageText(messageString, messageType, otherInformation);
            //[[Now log this message on to the logger
            Logger.LogMessage(messageType, messageCodeTemplate, screenId, screenMode, messageString, otherInformation, string.Empty);
            //]]
        }

        private static string GetMessageCodeTemplate(string code)
        {
            //[[If the message code passed is ExceptionHandlerMessageCode, then return the same, as it is special case of exception handling
            if (code == MsgCodes.ExceptionHandlerMessageCode)
            {
                return code;
            }

            //]]
            standardMessageLoaderThread.Join();
            DataRow[] selectedRows = StandardMessages.Select(string.Format("message_cd='{0}'", code));
            if (selectedRows == null || selectedRows.Length != 1)
            {
                throw new DCCException(null,
                                       MsgCodes.ToBeChanged, string.Format("The specified message code {0} doesn't have a message template", code));
            }
            return selectedRows[0]["message_text"].ToString();
        }

        private static int CountOccurrences(string stringToBeSearched, string searchPhrase)
        {
            Regex r = new Regex(searchPhrase, RegexOptions.IgnoreCase);
            // Match the regular expression pattern against a text string.
            MatchCollection ma = r.Matches(stringToBeSearched);
            return ma.Count;  //returns five
        }


        private static Chain GetContainerChain(AbstractScreen callingScreen)
        {
            Chain objChain = null;
            foreach (Chain chain in lstChains)
            {
                AbstractScreen objExistingScreen = null;
                Link containerLink = chain.GetLinkOfType(callingScreen.GetType());
                if (containerLink != null)
                {
                    objExistingScreen = containerLink.CalledScreen;
                }
                if (objExistingScreen != null)
                {
                    objChain = chain;
                    break;
                }
            }
            return objChain;
        }

        public static void DisposeException(Exception ex)
        {
            try
            {
                if (ex.GetType() == typeof(DCCException))
                {
                    DCCException dccEx = (DCCException)ex;
                    UIManager.ShowMessage(dccEx.MessageCode, dccEx.MessageTokens, MessageTypes.Error, dccEx.ScreenId, dccEx.ScreenMode, dccEx.OtherInformation);
                }
                else if (!CheckIfDatabaseException(ex))
                {
                    if (ex.Message != "")
                    {
                        UIManager.ShowMessage(MsgCodes.ToBeChanged,
                                              ex.Message.Replace(System.Environment.NewLine, " \\ ").Replace("|", " \\ "), MessageTypes.Error,
                                              null, UIModes.None,
                                              ex.Message + Environment.NewLine + ex.StackTrace + Environment.NewLine +
                                              (ex.InnerException != null ? ex.InnerException.StackTrace : string.Empty));
                    }
                }
            }
            catch (Exception ex1)
            {
                //Kill the exception, as this is the last point of error propagation.
            }
        }

        /// <summary>
        /// This method is the last method in the exception propagation chain. A final
        /// check is made to evaluate if the exception object passed is raised from 
        /// database (either by raise error message or by constraints present in schema)
        /// </summary>
        /// <param name="ex"></param>
        /// <returns></returns>
        private static bool CheckIfDatabaseException(Exception ex)
        {
            try
            {
                //[[Check if the exception is raised by a database object by calling SysAdmin..RaiseErrorMessage procedure
                //The check is that the ex.Message will have tokens, with first parameter as error severity
                //and rest of those specifying messageCode and its parameters.
                string exceptionMessage = ex.Message;
                if (exceptionMessage.StartsWith("Server was unable to process request. ---> "))
                {
                    exceptionMessage = exceptionMessage.Replace("Server was unable to process request. ---> ", "");
                }
                string[] tokens = exceptionMessage.Split(new char[] { '|' });
                if (tokens.Length >= 5 &&
                    (tokens[0] == MessageTypes.Warning.ToString() ||
                    tokens[0] == MessageTypes.Error.ToString() ||
                    tokens[0] == MessageTypes.Fatal.ToString())
                   )
                {
                    MessageTypes messageType = (MessageTypes)Enum.Parse(typeof(MessageTypes), tokens[0]);
                    string errorMessageParameters = string.Empty;
                    errorMessageParameters = errorMessageParameters +
                                             (string.IsNullOrEmpty(tokens[3]) ? string.Empty : tokens[3]) + "|" +
                                             (string.IsNullOrEmpty(tokens[4]) ? string.Empty : tokens[4]) + "|" +
                                             (string.IsNullOrEmpty(tokens[5]) ? string.Empty : tokens[5]);
                    //string messageCode = DbManager
                    UIManager.ShowMessage(tokens[1], errorMessageParameters, messageType);
                    return true;
                }
                //]]

                //[[If the exception has occured because of constraint errors (like CheckConstraint, UniquekeyConstraint ect)
                //Then as per convention, the name of the constraint should tell different pieces of the error.
                //e.g. Violation of PRIMARY KEY constraint 'PersonStatus_PK_PersonStatusId'. Cannot insert duplicate key in object 'packages'.
                string constraintName = null;
                if (IsConstraintNameFormatted(exceptionMessage))
                {
                    constraintName = GetConstraintName(exceptionMessage);
                    if (string.IsNullOrEmpty(constraintName))
                    {
                        return false;
                    }
                    //[[See if we can get the user firendly message from the extended property. As
                    //per convention the name of the extended property is same as the name of the constraint
                    IDbManager dbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                    object constraintMessage = dbManager.ExecuteScalar(
                        string.Format(
                            "SELECT  value FROM    ::fn_listextendedproperty (NULL, 'USER', 'dbo', 'TABLE', default, default, default) WHERE   name = '{0}'",
                            constraintName));
                    if (constraintMessage != null && constraintMessage != DBNull.Value)
                    {
                        UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, constraintMessage.ToString(), MessageTypes.Error);
                        return true;
                    }
                    //]]
                    //[[Now if the extended property is not defined, then try to form the message from the constraint name
                    string tableName = string.Empty;
                    string columnNames = string.Empty;
                    bool isMultipleColumn = false;
                    GetMessagePiecesForDBConstraintError(constraintName, ref tableName, ref columnNames, ref isMultipleColumn);
                    if (constraintName.Contains("_PK_") || IsUniqueConstraint(constraintName))
                    {
                        //SessionId, ReportTemplateId, DataUnitAlias, and DUSColumnId have unique values for TmpReportDUSColumnValues
                        string messageDisplayString = string.Format("{0} {1} unique values for {2}", columnNames,
                                                                    isMultipleColumn ? "have" : "has", tableName);
                        UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, messageDisplayString, MessageTypes.Error);
                        return true;
                    }
                    else if (constraintName.Contains("_FK_"))
                    {
                        //ReportTemplateSheetId, and DataUnitSq of RTSDataUnitParameters do not have correct lookup information.
                        string messageDisplayString = string.Empty;
                        if (isMultipleColumn)
                        {
                            messageDisplayString = string.Format("{0} of {1} do not have correct lookup information.", columnNames, tableName);

                        }
                        else
                        {
                            messageDisplayString = string.Format("{0} in {1} does not have correct lookup information.", columnNames, tableName);
                        }
                        UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, messageDisplayString, MessageTypes.Error);
                        return true;
                    }
                    else if (constraintName.Contains("_CK_"))
                    {
                        //Check constraint defined on LinePartPosition, and OffsetColumnNo of RTSLineParts failed.
                        string messageDisplayString = string.Empty;
                        messageDisplayString = string.Format("Check constraint defined on {0} of {1} failed.", columnNames, tableName);
                        UIManager.ShowMessage(MsgCodes.ExceptionHandlerMessageCode, messageDisplayString, MessageTypes.Error);
                        return true;
                    }
                }
                //]]
            }
            catch (Exception ex1)
            {
                //Do nothing, just return false. This means that the exception could not be handled as Database Exception.
                return false;
            }
            return false;
        }

        private static bool IsUniqueConstraint(string constraintName)
        {
            Regex regx = new Regex("[U][K1-9]");
            MatchCollection matches = regx.Matches(constraintName);
            if (matches.Count > 0)
            {
                return true;
            }
            return false;
        }

        private static bool IsConstraintNameFormatted(string constraintName)
        {
            Regex regx = new Regex("[PFUC][K1-9]");
            MatchCollection matches = regx.Matches(constraintName);
            if (matches.Count > 0)
            {
                return true;
            }
            return false;
        }
        private static void GetMessagePiecesForDBConstraintError(string constraintName, ref string tableName, ref string columnNames, ref bool isMultipleColumn)
        {
            //string constraintName = "Table1_PK_COL1";
            string[] tokens = constraintName.Split(new string[] { "_" }, StringSplitOptions.None);
            tableName = tokens[0];
            StringBuilder sb = new StringBuilder();
            for (int i = 2; i < tokens.Length; i++)
            {
                sb.Append(tokens[i]);
                if (i == tokens.Length - 2)
                {
                    sb.Append(" and ");
                    isMultipleColumn = true;
                }
                else
                {
                    sb.Append(", ");
                }
            }
            columnNames = sb.ToString();
            if (columnNames.EndsWith(", "))
            {
                columnNames = columnNames.Substring(0, columnNames.Length - 2);
            }
        }
        private static string GetConstraintName(string message)
        {
            string[] tokens = message.Split(new char[] { ' ', '\'', '"' });
            foreach (string token in tokens)
            {
                if (token.Contains("_PK_") ||
                    token.Contains("_FK_") ||
                    token.Contains("_CK_") ||
                    IsUniqueConstraint(token))
                {
                    return token;
                }
            }
            return null;
        }

        internal static DataTable StandardMessages
        {
            get { return standardMessages; }
            set { standardMessages = value; }
        }
    }

}
