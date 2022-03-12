using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.Common;
using System.IO;
using DCC.UMB.CDF.DB;


using DCC.UMB.CDF.Tools.DBFacadeGenerator.Method;
using System.Collections;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.Tools.Common;

namespace DCC.UMB.CDF.Tools.DBFacadeGenerator {
    public partial class FacadeGenerator : Form {
        private DbManager dbManager = null;
        private static string procFolder = string.Empty;
        private static Hashtable filesWithPathTable;
        private string dbName;
        public static bool FORCE_LOWER_CASE;


        public FacadeGenerator() {
            InitializeComponent();
            //[[Load User Settings
            LoadSettings();
            //]]
        }


        public static Hashtable FilesWithPathTable {
            get { return filesWithPathTable; }
            set { filesWithPathTable = value; }
        }
        public static string ProcFolder {
            get { return FacadeGenerator.procFolder; }
            set { FacadeGenerator.procFolder = value; }
        }

        private void btnGenerateFacade_Click(object sender, EventArgs e) {
            try {
                //[[Save user settings
                SaveSettings();
                //]]
                this.textBox1.Text = " Generating Code. Please wait for a while....";
                textBox1.Refresh();
                StringBuilder codeStringBuilder = new StringBuilder();
                CodeWriter writer = new CodeWriter(codeStringBuilder, "{", "}");
                LogStringWriter logWriter = new LogStringWriter(this.textBox1);
                GenerateCode(txtuserName.Text.Trim(), txtPassword.Text.Trim(),
                             txtDbServername.Text.Trim(), txtDbName.Text.Trim(), txtDbName.Text.Trim() + "_APP",
                             txtProcFolder.Text.Trim(), writer, logWriter, this.chkForWebFacade.Checked);
                this.textBox1.Text = "";
                this.textBox1.Text = codeStringBuilder.ToString();
            } catch (Exception ex) {
                Console.WriteLine(ex.Message + ex.StackTrace);
            }
        }

        private string ReturnCurrentDateTime() {
            return @"// Generated on : " + DateTime.Now.ToString("dd MMM yy - HH:mm:ss");
        }

        public void GenerateCode(string userName, string password, string dbServerName, string dbName, string appName, string procFolderLocation, CodeWriter writer, TextWriter logWriter, bool isForWeb, string packageId = null) {
            //[[if package id is null or empty, initialize it with dbName for backwords compatibility
            if (string.IsNullOrEmpty(packageId)) {
                packageId = dbName;
            }
            //]]
            this.dbManager = new DbManager(Guid.NewGuid().ToString(), dbName, userName, dbServerName, password);
            FacadeGenerator.ProcFolder = procFolderLocation;
            FacadeGenerator.FilesWithPathTable = null;

            try {
                DataSet dset = GetSPDetails();
                DataTable spNamesTable = UtilityManager.SelectDistinct(dset.Tables[0], "ROUTINE_NAME");

                writer.WriteLine(ReturnCurrentDateTime());
                writer.WriteLine("///This code is auto generated by CDF.");
                writer.WriteLine("///Please don't alter the contents of this file");
                writer.WriteLine("");


                writer.WriteLine("using System.Collections.Generic;");

                writer.WriteLine("using System;");
                writer.WriteLine("using System.Data;");
                writer.WriteLine("using System.Data.SqlClient;");
                if (isForWeb) {
                    writer.WriteLine("using DCC.UMB.WDF.DB;");
                } else {
                    writer.WriteLine("using DCC.UMB.CDF.DB;");
                }
                writer.WriteLine("using System.Text;");
                writer.WriteLine("using System.Linq;");

                if (isForWeb) {
                    writer.WriteLine(string.Format("namespace DCC.{0}.DBFacade", packageId.ToUpper()));
                } else {
                    writer.WriteLine("namespace DCC.DBFacade");
                }

                writer.StartBlock();
                string className = appName;
                char[] chars = className.ToCharArray();
                chars[0] = chars[0].ToString().ToUpper().ToCharArray()[0];
                className = new string(chars);

                writer.WriteLine("public partial class " + className.ToUpper() + "DbFacade" + (isForWeb ? ":IDBFacade" : ""));

                writer.StartBlock();
                writer.WriteLine("private List<string> dbTasks = new List<string>();");

                if (isForWeb) {
                    writer.WriteLine("public DbManager ObjDBManager { get; private set; }");
                    writer.WriteLine("public DataSet ExecuteSql(string sql){return ObjDBManager.ExecuteSQL(sql);}");
                } else {
                    writer.WriteLine("public IDbManager ObjDBManager = null;");
                }


                writer.WriteLine("public DCCSqlDataReader ExecuteSelectQuery(SQLSelectQuery sqlSelectQuery){return ObjDBManager.ExecuteReaderSQL(sqlSelectQuery.GetSQLSelectQuery());}");
                writer.WriteLine("public DataSet ExecuteSelectQueryDataSet(SQLSelectQuery sqlSelectQuery){return ObjDBManager.ExecuteSQL(sqlSelectQuery.GetSQLSelectQuery());}");
                /*
				 * public long BeginTrans(int userNo, string applicationId, string userRoleId, string objectId, AuditableActions action,string screenId) {			
			try {
				ObjDBManager.BeginTrans();
				long audit_log_id = 0;
				this.InsertAuditLog(ref audit_log_id, userNo, objectId, action.ToString().Substring(0, 1), userRoleId, applicationId, screenId);
				ObjDBManager.AuditLogId = audit_log_id;
				return audit_log_id;
			}
			catch(Exception ex){
				ObjDBManager.RollbackTrans();
				throw;
			}           
		}*/

                writer.WriteLine("public void BeginTrans() { ObjDBManager.BeginTrans(); }");
                if (isForWeb && spNamesTable.Select("ROUTINE_NAME='InsertAuditLog'").Length > 0) {
                    //if InsertAuditLog procedure is present, then emit the overloaded begin trans method.
                    /*writer.WriteLine("public long BeginTrans(int userNo, string applicationId, string userRoleId, string auditedObjectId, AuditableActions action,string screenId) ");
                    writer.StartBlock();//start of beginTran method
                    writer.WriteLine("return this.BeginTrans(userNo, applicationId, userRoleId,auditedObjectId, action, screenId, null );");
                    writer.EndBlock();*/
                    writer.WriteLine("public long BeginTrans(int userNo, string applicationId, string userRoleId, string auditedObjectId, AuditableActions action,string screenId, string actionId) ");
                    writer.StartBlock(); //start of beginTran method
                    writer.WriteLine("try");

                    writer.StartBlock(); //start of try
                    writer.WriteLine("ObjDBManager.BeginTrans();");
                    writer.WriteLine("long audit_log_id = 0;");
                    writer.WriteLine("this.InsertAuditLog(ref audit_log_id, userNo, auditedObjectId, action.ToString().Substring(0, 1), userRoleId, applicationId, screenId, actionId);");
                    writer.WriteLine("ObjDBManager.AuditLogId = audit_log_id;");
                    writer.WriteLine("return audit_log_id;");
                    writer.EndBlock(); //end of try
                    writer.WriteLine("catch(Exception ex)");
                    writer.StartBlock(); //start of catch
                    writer.WriteLine("ObjDBManager.RollbackTrans();");
                    writer.WriteLine("throw;");
                    writer.EndBlock(); //end of catch

                    writer.EndBlock(); //end of begintran method
                    writer.WriteLine("public void CommitTrans(string auditedObjectId) { ObjDBManager.CommitTrans(auditedObjectId); }");
                    writer.WriteLine(
                        "public void CommitTrans() {if (this.ObjDBManager.AuditLogId.HasValue){throw new Exception(\"CommitTran must consume the generated auditLog, call the other overload of CommitTran\");}ObjDBManager.CommitTrans(); }");
                } else {
                    writer.WriteLine("public void CommitTrans() { ObjDBManager.CommitTrans(); }");
                }

                writer.WriteLine("public void RollbackTrans() { ObjDBManager.RollbackTrans(); }");
                writer.WriteLine("public void AddDbTask(string task){this.dbTasks.Add(task);}");
                writer.WriteLine("public void AddDbTasks(List<string> tasks) { this.dbTasks.AddRange(tasks); }");
                writer.WriteLine("public void ClearDbTasks(){this.dbTasks.Clear();}");
                writer.WriteLine("ParameterDirection IN = ParameterDirection.Input;");
                writer.WriteLine("ParameterDirection OUT = ParameterDirection.Output;");
                writer.WriteLine("ParameterDirection INOUT = ParameterDirection.InputOutput;");
                writer.WriteLine(@"SqlDbType BIGINT = SqlDbType.BigInt, BINARY = SqlDbType.Binary, BIT = SqlDbType.Bit,CHAR = SqlDbType.Char,DATE = SqlDbType.Date,
		DATETIME = SqlDbType.DateTime,DATETIME2 = SqlDbType.DateTime2,DATETIMEOFFSET = SqlDbType.DateTimeOffset,DECIMAL = SqlDbType.Decimal,
		FLOAT = SqlDbType.Float,IMAGE = SqlDbType.Image,INT = SqlDbType.Int,MONEY = SqlDbType.Money,NCHAR = SqlDbType.NChar,NTEXT = SqlDbType.NText,
		NVARCHAR = SqlDbType.NVarChar,REAL = SqlDbType.Real,SMALLDATETIME = SqlDbType.SmallDateTime,SMALLINT = SqlDbType.SmallInt,SMALLMONEY = SqlDbType.SmallMoney,
		STRUCTURED = SqlDbType.Structured,TEXT = SqlDbType.Text,TIME = SqlDbType.Time,TIMESTAMP = SqlDbType.Timestamp,TINYINT = SqlDbType.TinyInt,
		UDT = SqlDbType.Udt,UNIQUEIDENTIFIER = SqlDbType.UniqueIdentifier,VARBINARY = SqlDbType.VarBinary,VARCHAR = SqlDbType.VarChar,
		VARIANT = SqlDbType.Variant,XML = SqlDbType.Xml;");
                writer.WriteLine("private void csp(string parameterName, object paramValue, SqlDbType parameterType, ParameterDirection direction, List<SqlParameter> p) { p.Add(ObjDBManager.CreateSqlParameter(parameterName, paramValue, parameterType, direction)); }");
                writer.WriteLine("private string gps(string procName, List<SqlParameter> parms) { return ObjDBManager.GetPrintableSQLString(procName, parms); }");
                writer.WriteLine("private DataSet esp(string procName, List<SqlParameter> parms) { return ObjDBManager.ExecuteStoredProc(procName, parms); }");


                if (isForWeb) {
                    writer.WriteLine(
                     "public " + className.ToUpper() +
                     "DbFacade(string conStringName, string dbName, string userId, string serverName, string password) { this.ObjDBManager = new DbManager(conStringName, dbName, userId, serverName, password); }");

                } else {
                    writer.WriteLine(
                    "public " + className +
                    "DbFacade(string applicationID) { this.ObjDBManager = DCC.UMB.CDF.Utils.UtilityManager.CreateDBManagerInstance(applicationID); }");
                }

                writer.WriteLine("public DataSet ExecuteDbTasks()");
                writer.StartBlock();
                writer.WriteLine("try");
                writer.StartBlock();
                writer.WriteLine("StringBuilder sb = new StringBuilder();");
                writer.WriteLine("if (this.dbTasks.Count == 0) { this.AddDbTask(\"select 'No tasks were defined'\"); }");
                writer.WriteLine("foreach(string task in this.dbTasks)");
                writer.StartBlock();
                writer.WriteLine("if (string.IsNullOrEmpty(task)) continue;");
                writer.WriteLine("sb.Append(task + \";\");");
                writer.WriteLine("sb.AppendLine();");
                writer.WriteLine("sb.AppendLine();");
                writer.EndBlock();
                writer.WriteLine("return ObjDBManager.ExecuteSQL(sb.ToString(), 100);");
                writer.EndBlock();
                writer.WriteLine("finally");
                writer.StartBlock();
                writer.WriteLine("this.dbTasks.Clear();");
                writer.EndBlock();
                writer.EndBlock();


                int i = 0;
                foreach (DataRow row in spNamesTable.Rows) {
                    string methodName = row["ROUTINE_NAME"].ToString();

                    logWriter.WriteLine("\r\nStarting Auto Code Generation for Stored Procedure:: " + methodName);


                    if (i == 0) {
                        WriteMethod(dset.Tables[0], writer, methodName, false);
                    } else {
                        WriteMethod(dset.Tables[0], writer, methodName, true);
                    }
                    i++;
                }
                writer.EndBlock();//end of class block

                //[[now write the classes corresponding to the functions and views for the query procedures
                //writer.WriteLine("public class Cndn : SQLSelectQueryWhereClauseCondition { public Cndn(string operandName, Type aType) : base(operandName, aType) { } }");
                DataView objectsReturningTablesDataView = new DataView(dset.Tables[0]);
                objectsReturningTablesDataView.RowFilter = "(ROUTINE_TYPE='FUNCTION' OR ROUTINE_TYPE='VIEW' OR ROUTINE_TYPE='TABLE') AND ROUTINE_DATA_TYPE='TABLE'";
                foreach (DataRowView rowView in objectsReturningTablesDataView) {
                    string sqlObjectNameReturningTable = rowView["ROUTINE_NAME"].ToString();
                    string functionOrView = rowView["ROUTINE_TYPE"].ToString();

                    //[[Check if the RUNTIME_TYPE is function and number of parameters are more than 0, then simply ignore
                    if (functionOrView == "FUNCTION") {
                        int parametersCount = dset.Tables[0].Select("ROUTINE_TYPE='FUNCTION' AND ROUTINE_NAME = '" +
                                                                    sqlObjectNameReturningTable +
                                                                    "' AND PARAMETER_NAME IS NULL").Length;
                        if (parametersCount != 1) {
                            continue;
                        }
                    }
                    //]]
                    logWriter.WriteLine("\r\nStarting Auto Code Generation for Function/View:: " + sqlObjectNameReturningTable);
                    WriteFunctionOrView(rowView, writer, sqlObjectNameReturningTable, true);
                }
                //]]
                writer.EndBlock();//end of namespace block
                writer.Close();
            } catch (Exception ex) {
                logWriter.WriteLine("\r\n An error has occured while generating code. See details below.\n");
                logWriter.WriteLine(ex.Message + "\r\n" + ex.StackTrace);
                throw;
            }
        }



        public string DB_NAME {
            get { return this.dbName; }
            set {
                this.dbName = value;
            }
        }
        private void WriteFunctionOrView(DataRowView rowView, CodeWriter writer, string functionname, bool giveLineBreak) {
            if (giveLineBreak) {
                writer.WriteLine("");
                writer.WriteLine("");
            }
            DataSet functionReturnDetails = null;

            if (rowView["ROUTINE_TYPE"].ToString() == "FUNCTION") {
                functionReturnDetails =
                    this.dbManager.ExecuteSQL("SET FMTONLY ON; SELECT * FROM " + rowView["ROUTINE_NAME"].ToString() +
                                              "(); SET FMTONLY OFF;");
            } else if (rowView["ROUTINE_TYPE"].ToString() == "VIEW" || rowView["ROUTINE_TYPE"].ToString() == "TABLE") {
                functionReturnDetails =
                    this.dbManager.ExecuteSQL("SET FMTONLY ON; SELECT * FROM " + rowView["ROUTINE_NAME"].ToString() +
                                              "; SET FMTONLY OFF;");
            }
            SQLObjectReturningTable objectReturningTable = new SQLObjectReturningTable(rowView, functionReturnDetails.Tables[0]);
            objectReturningTable.Print(writer);
        }
        private void WriteMethod(DataTable table, CodeWriter writer, string methodName, bool giveLineBreak) {
            if (giveLineBreak) {
                writer.WriteLine("");
                writer.WriteLine("");
            }

            DataView view = new DataView(table);
            view.RowFilter = "ROUTINE_NAME = '" + methodName + "'";
            Method.Method method = new Method.Method(view);
            string routineType = view[0]["ROUTINE_TYPE"].ToString();
            string routineDataType = view[0]["ROUTINE_DATA_TYPE"].ToString();

            //[[If the underlying object is a procedure then print the method as a normal method
            //and a task type method. Additionally if the method name starts from "qry" then emit 
            //out the special method returning reader.
            if (routineType == "PROCEDURE") {
                method.Print(writer, MethodType.DataSet, false);
                method.Print(writer, MethodType.DataSet, true);
                if (methodName.StartsWith("qry", StringComparison.InvariantCultureIgnoreCase)) {
                    method.Print(writer, MethodType.DataReader, false);
                }
            } else if (routineType == "FUNCTION" && routineDataType != "TABLE")//for scalar valued functions
              {
                method.Print(writer, MethodType.ScalarFunction, false);
            } else if (routineType == "FUNCTION" && routineDataType == "TABLE")//for Tabler Valued functions
              {
                method.Print(writer, MethodType.InlineFunction, false);
            }




        }


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>        
        private DataSet GetSPDetails() {
            string sqlString = @"SELECT	
								r.ROUTINE_NAME,	
								r.ROUTINE_TYPE,	
								r.DATA_TYPE AS ROUTINE_DATA_TYPE,       
								r.ROUTINE_SCHEMA + '.[' + r.ROUTINE_NAME + ']' AS STORED_PROCEDURE_NAME,	
								p.PARAMETER_NAME,	
								d.DOMAIN_NAME,	
								p.DATA_TYPE,	
								p.CHARACTER_MAXIMUM_LENGTH AS SIZE,	
								p.NUMERIC_PRECISION,	
								p.NUMERIC_SCALE,	
								p.ORDINAL_POSITION,	
								p.PARAMETER_MODE	
								FROM	
								INFORMATION_SCHEMA.ROUTINES AS r	
								LEFT JOIN	
								INFORMATION_SCHEMA.PARAMETERS AS p	
								ON  (   p.SPECIFIC_SCHEMA = r.SPECIFIC_SCHEMA	
								AND p.SPECIFIC_NAME = r.SPECIFIC_NAME	
								)	
								LEFT JOIN INFORMATION_SCHEMA.COLUMN_DOMAIN_USAGE AS d	
								ON  (   d.TABLE_SCHEMA = p.SPECIFIC_SCHEMA	
								AND d.TABLE_NAME = p.SPECIFIC_NAME	
								AND d.COLUMN_NAME = p.PARAMETER_NAME	
								)	
								WHERE	
								(r.ROUTINE_TYPE = 'PROCEDURE'	OR r.ROUTINE_TYPE = 'FUNCTION')
								AND r.ROUTINE_NAME NOT LIKE 'dt_%'	AND r.ROUTINE_SCHEMA LIKE 'dbo%' 
								 UNION ALL 
								 SELECT TABLE_NAME, 'VIEW', 'TABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL 
								 FROM information_schema.views WHERE TABLE_NAME not like 'adt_%' 
								 UNION ALL 
								 SELECT TABLE_NAME, 'TABLE', 'TABLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL 
								 FROM information_schema.tables where TABLE_TYPE='BASE TABLE'  AND TABLE_NAME not like 'adt_%' 
								 ORDER BY r.ROUTINE_NAME, p.ORDINAL_POSITION";

            // Vinod where clause condition for removing tables starting with sys is removed so it can get tables 
            // system_information_codes & GetSystemInfoValue. Previous lines are given below for ref
            // FROM information_schema.views where TABLE_NAME NOT LIKE 'sys%' 
            // AND TABLE_NAME NOT LIKE 'sys%'
            return dbManager.ExecuteSQL(sqlString);

        }

        public static string FindSPInDirectory(string dirName, string procName) {
            string ContentofFile = null;
            string procPhysicalPath = null;

            //Load file in memory
            if (filesWithPathTable == null) {
                filesWithPathTable = new Hashtable();
            }
            if (filesWithPathTable.Count == 0) {
                LoadFiles(dirName);
            }

            //Get physical path of the stored procedure
            procPhysicalPath = filesWithPathTable[procName.ToUpper()] as string;
            if (!string.IsNullOrEmpty(procPhysicalPath)) {
                ContentofFile = File.ReadAllText(procPhysicalPath);
                //using (StreamReader sr = new StreamReader(procPhysicalPath))
                //{
                //    ContentofFile = sr.ReadToEnd();
                //    sr.Close();
                //}
                return ContentofFile;
            }
            return ContentofFile;
        }
        private static void LoadFiles(string dirName) {
            RecursiveToFindFiles(dirName);
        }

        private static void RecursiveToFindFiles(string dirName) {
            DirectoryInfo dirInfo = new DirectoryInfo(dirName);
            FileInfo[] files = dirInfo.GetFiles();
            foreach (FileInfo file in files) {
                AddToHashTable(file.Name, file.FullName);
            }
            foreach (DirectoryInfo dir in dirInfo.GetDirectories()) {
                if (dir.FullName.Contains(".svn")) continue;
                RecursiveToFindFiles(dir.FullName);
            }
        }
        private static void AddToHashTable(string fileName, string filePath) {

            if (!filesWithPathTable.Contains(fileName.ToUpper())) {
                filesWithPathTable.Add(fileName.ToUpper(), filePath);
            } else {
                filesWithPathTable[fileName.ToUpper()] = null; //erase the previous entry, as there are now 2 proc files with the same name.
            }
        }
        private void LoadSettings() {
            this.txtuserName.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.UN;
            this.txtDbServername.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.SN;
            this.txtDbName.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.AID;
            this.txtPassword.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.PW;
            this.txtProcFolder.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.PDP;
        }
        private void SaveSettings() {
            DCC.UMB.CDF.Tools.Properties.Settings.Default.UN = this.txtuserName.Text;
            DCC.UMB.CDF.Tools.Properties.Settings.Default.SN = this.txtDbServername.Text;
            DCC.UMB.CDF.Tools.Properties.Settings.Default.AID = this.txtDbName.Text;
            DCC.UMB.CDF.Tools.Properties.Settings.Default.PW = this.txtPassword.Text;
            DCC.UMB.CDF.Tools.Properties.Settings.Default.PDP = this.txtProcFolder.Text;

            DCC.UMB.CDF.Tools.Properties.Settings.Default.Save();
        }
    }
    class LogStringWriter : StringWriter {
        private TextBox toOutput = null;

        public LogStringWriter(TextBox toOutput) {
            this.toOutput = toOutput;

        }
        public override void WriteLine(string line) {
            base.WriteLine(line);
            toOutput.AppendText(line + "\n\a");
        }
    }
}
