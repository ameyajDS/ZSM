using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.DbManagerWebService;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.Utils;
using System.Xml;
using ParameterDirection = System.Data.ParameterDirection;
using SqlDbType = System.Data.SqlDbType;
using SqlParameter = System.Data.SqlClient.SqlParameter;

namespace DCC.UMB.CDF.Log
{

    public class Logger
    {
        private static StreamWriter writer = null;
        System.Collections.Queue msgQueue = new Queue();
        private const int MAX_NO_OF_MSG = 5;
        private static string logFilePath;
        private static XmlDocument doc;
        private static XmlElement root;



        internal static void InitializeLogger(string applicationid, string sessionId)
        {
            try
            {
                doc = new XmlDocument();
                root = doc.CreateElement("LogInfo");

                string CDFAssemblyLocation = Assembly.GetExecutingAssembly().Location;
                FileInfo CDFAssemblyFileInfo = new FileInfo(CDFAssemblyLocation);
                logFilePath = CDFAssemblyFileInfo.Directory.FullName + "\\" + applicationid + "_Logs_" + sessionId + ".log";
                if (File.Exists(logFilePath))
                {
                    File.Delete(logFilePath);
                }
                writer = new StreamWriter(logFilePath, true);
                writer.AutoFlush = true;
                writer.WriteLine(DateTime.Now.ToString("dd-MMM-yyyy hh:mm:ss tt") + " : Logging initialized for this session");
                writer.WriteLine();
            }
            catch (Exception e)
            {
                writer = null;
                //Do Nothing.
            }
        }
        public static string LogFilePath
        {
            get
            {
                return logFilePath;
            }
        }


        public static void Debug(string messageText)
        {
            Debug(messageText, false);
        }
        public static void Debug(string messageText, bool insertLineBreakBeforeMessageText)
        {
            try
            {
                Debug(MsgCodes.ToBeChanged, null, UIModes.None, messageText, null, null, insertLineBreakBeforeMessageText);
            }
            catch (Exception)
            {


            }
        }
        public static void Debug(string messageCode, string screenId, UIModes screenMode, string messageText, string otherInformation,
                               string stackTrace)
        {
            Debug(messageCode, screenId, screenMode, messageText, otherInformation, stackTrace, false);
        }
        public static void Debug(string messageCode, string screenId, UIModes screenMode, string messageText, string otherInformation,
                                string stackTrace, bool insertLineBreakBeforeMessageText)
        {
            try
            {
                WriteEvent(GlobalAppVariables.AppContext.SessionIdAsInteger, messageCode, 'M', DateTime.Now, screenId, screenMode, messageText, otherInformation, stackTrace, insertLineBreakBeforeMessageText);
            }
            catch (Exception)
            {

                //throw;
            }
        }
        internal static void LogMessage(MessageTypes messageType, string messageCode, string screenId, UIModes screenMode, string messageText, string otherInformation, string stackTrace)
        {
            switch (messageType)
            {
                case MessageTypes.Plain:
                    Logger.Debug(messageCode, screenId, screenMode, messageText, otherInformation, string.Empty);
                    break;
                case MessageTypes.Warning:
                    Logger.Warning(messageCode, screenId, screenMode, messageText, otherInformation, string.Empty);
                    break;
                case MessageTypes.Error:
                    Logger.Error(messageCode, screenId, screenMode, messageText, otherInformation, string.Empty);
                    break;
                case MessageTypes.Fatal:
                    Logger.Fatal(messageCode, screenId, screenMode, messageText, otherInformation, string.Empty);
                    break;
                case MessageTypes.None:
                    Logger.Debug(messageCode, screenId, screenMode, messageText, otherInformation, string.Empty);
                    break;
                default:
                    Logger.Debug(messageCode, screenId, screenMode, messageText, otherInformation, string.Empty);
                    break;
            }

        }
        public static void Warning(string messageCode, string screenId, UIModes screenMode, string messageText, string otherInformation,
                                string stackTrace)
        {
            WriteEvent(GlobalAppVariables.AppContext.SessionIdAsInteger, messageCode, 'W', DateTime.Now, screenId, screenMode, messageText, otherInformation, stackTrace);
        }

        public static void Fatal(string messageCode, string screenId, UIModes screenMode, string messageText, string otherInformation,
                                string stackTrace)
        {
            WriteEvent(GlobalAppVariables.AppContext.SessionIdAsInteger, messageCode, 'F', DateTime.Now, screenId, screenMode, messageText, otherInformation, stackTrace);
        }

        public static void Error(string messageCode, string screenId, UIModes screenMode, string messageText, string otherInformation,
                                string stackTrace)
        {
            WriteEvent(GlobalAppVariables.AppContext.SessionIdAsInteger, messageCode, 'E', DateTime.Now, screenId, screenMode, messageText, otherInformation, stackTrace);
        }

        /// <summary>
        /// Actual function to collect the messages into the buffer and inject into database on queue full.
        /// </summary>
        /// <param name="sessionId"></param>
        /// <param name="messageCode"></param>
        /// <param name="severityLevel"></param>
        /// <param name="messageDateTime"></param>
        /// <param name="screenId"></param>
        /// <param name="screenMode"></param>
        /// <param name="messageText"></param>
        /// <param name="otherInformation"></param>
        /// <param name="stackTrace"></param>
        /// 
        private static void WriteEvent(int sessionId, string messageCode, char severityLevel, DateTime messageDateTime,
                                string screenId, UIModes screenMode, string messageText, string otherInformation,
                                string stackTrace)
        {
            WriteEvent(sessionId, messageCode, severityLevel, messageDateTime, screenId, screenMode,messageText,  otherInformation, stackTrace, false);
        }
        private static void WriteEvent(int sessionId, string messageCode, char severityLevel, DateTime messageDateTime,
                                string screenId, UIModes screenMode, string messageText, string otherInformation,
                                string stackTrace, bool insertLineBreakBeforeMessageText)
        {
            WriteEventInLogFile(sessionId, messageCode, severityLevel, messageDateTime, screenId, screenMode, messageText, otherInformation, stackTrace, insertLineBreakBeforeMessageText);
            
            
            /* we are not more interested in storing the log into the message logs table
            LogLevels logLevel = GetLogLevelFromSeverityCharacter(severityLevel);

            //[[If the loglevel of the application is lesser than the severity passed, than just exit.
            if ((int)logLevel < (int)GlobalAppVariables.AppContext.LogLevel)
            {
                return;
            }
            //]]
            try
            {
                //[[Create the event as a node and add into the doc 
                string uiModeCode = UtilityManager.GetUIModeCodeForLogging(screenMode);
                //]]

                XmlElement msg = doc.CreateElement("msg");
                {
                    msg.SetAttribute("session_id", sessionId.ToString());
                    msg.SetAttribute("message_cd", messageCode);
                    msg.SetAttribute("severity_level", severityLevel.ToString());
                    msg.SetAttribute("message_dts", messageDateTime.ToString());
                    msg.SetAttribute("screen_id", screenId);
                    msg.SetAttribute("screen_mode", uiModeCode);
                    msg.SetAttribute("message_information", messageText);
                    msg.SetAttribute("other_information", otherInformation);
                    msg.SetAttribute("stack_trace", stackTrace);
                }
                root.AppendChild(msg);

                if (root.ChildNodes.Count >= MAX_NO_OF_MSG)
                {
                    //[[Queue is full of message and time to fetch into the database and clear the queue
                    InsertIntoDBAndClearFromMemory(root.OuterXml);
                    //]]
                }
            }
            catch (Exception err)
            {
                //Do nothing.   
            }
             */
        }

        private static LogLevels GetLogLevelFromSeverityCharacter(char level)
        {
            switch (level)
            {
                case 'M':
                    return LogLevels.Message;
                case 'W':
                    return LogLevels.Warning;
                case 'E':
                    return LogLevels.Error;
                case 'F':
                    return LogLevels.Fatal;
                default:
                    throw new Exception("Wrong severity level character passed!");
            }
        }

        /// <summary>
        /// Make a local copy of message on client machine
        /// </summary>
        /// <param name="sessionId"></param>
        /// <param name="messageCode"></param>
        /// <param name="severityLevel"></param>
        /// <param name="messageDateTime"></param>
        /// <param name="screenId"></param>
        /// <param name="screenMode"></param>
        /// <param name="messageText"></param>
        /// <param name="otherInformation"></param>
        /// <param name="stackTrace"></param>
        private static void WriteEventInLogFile(int sessionId, string messageCode, char severityLevel, DateTime messageDateTime,
                                string screenId, UIModes screenMode, string messageText, string otherInformation,
                                string stackTrace, bool insertLineBreakBeforeMessageText)
        {
            try
            {
                if (writer != null)
                {
                    string line = "--" + 
                                    messageDateTime.ToString("hh:mm:ss") + 
                                    ">" + 
                                    severityLevel + ": " +
                                    (insertLineBreakBeforeMessageText?System.Environment.NewLine:"") + 
                                    messageText;
                    writer.WriteLine(line);
                    Console.Out.WriteLine(line.Length > 2000 ? line.Substring(0, 2000) + "....more.." : line);
                    if (!string.IsNullOrEmpty(stackTrace) || !string.IsNullOrEmpty(otherInformation))
                    {
                        string trace = otherInformation + System.Environment.NewLine + stackTrace;
                        trace = ((char)System.Windows.Forms.Keys.Tab).ToString() + trace.Replace(System.Environment.NewLine, System.Environment.NewLine + ((char)System.Windows.Forms.Keys.Tab).ToString());
                        writer.WriteLine(trace);
                        Console.Out.WriteLine(trace);
                    }
                    writer.WriteLine();
                    writer.Flush();
                }
            }
            catch (Exception ex)
            {
                //Do nothing
            }
        }

        /* We are no more interested in writing the logs into message logs table.
        /// <summary>
        /// Store Log Read/Write application
        /// </summary>
        public static void InsertIntoDBAndClearFromMemory(string xmlContents)
        {
            try
            {
                IDbManager dbm = UtilityManager.CreateDBManagerInstance("SAM");
                System.Data.SqlClient.SqlParameter param = dbm.CreateSqlParameter("xml", xmlContents, SqlDbType.NText, ParameterDirection.Input);
                List<System.Data.SqlClient.SqlParameter> lstParam = new List<System.Data.SqlClient.SqlParameter>();
                lstParam.Add(param);
                dbm.ExecuteStoredProc("log..insMessageLogs", lstParam, false);
                //dbm.ExecuteSQL("log..insMessageLogs N'" + xmlContents + "'",false);
                root.RemoveAll();
            }
            catch (Exception e)
            {
                //Do nothing. Logging should never raise exceptions.
            }
        }
        */
    }
}
