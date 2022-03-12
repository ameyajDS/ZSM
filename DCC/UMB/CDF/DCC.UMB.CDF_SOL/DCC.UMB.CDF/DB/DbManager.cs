using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Data.Sql;
using System.Data.SqlClient;
using DCC.UMB.CDF.Log;
using System.Linq;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.UMB.CDF.DB
{
    public class DbManager : IDbManager
    {
        private int commandTimeoutSeconds = 20;//initialize to 20 seconds, then try to read from config to override.
        private string applicationId;
        private DbConnectionFactory objDbConnectionFactory = new DbConnectionFactory();
        private SqlTransaction trans = null;
        //[[This is set to false only by logreader(the process 
        //which sends logs to database). For all other applications
        //this setting must be true.
        private bool isLoggingEnabled = true;
        
        public DbManager(string applicationId) :this(applicationId,GlobalAppVariables.AppContext.UserRoleId,GlobalAppVariables.AppContext.ServerName,GlobalAppVariables.AppContext.UserRoleIdentity)
        {
            
        }

        /// <summary>
        /// This constructor to be used only with Logger tool, to transfer log messages from system event logs to database.
        /// </summary>
        /// <param name="applicationId"></param>
        /// <param name="userId"></param>
        /// <param name="serverName"></param>
        /// <param name="password"></param>
        private DbManager(string applicationId, string userId, string serverName, string password)
        {
            this.applicationId = applicationId;
            objDbConnectionFactory.DataSource = serverName;
            objDbConnectionFactory.UserId = userId;
            objDbConnectionFactory.Password = password;
            this.overrideCommandTimeOut();
        }
        

        public DbManager(string conStringName, string dbName, string userId, string serverName, string password)
        {
            this.applicationId = conStringName;            
            objDbConnectionFactory.UserId = userId;
            objDbConnectionFactory.Password = password;
            objDbConnectionFactory.SetConnectionStringForDirectDb(conStringName, dbName, serverName);
            this.overrideCommandTimeOut();
        }

        private void overrideCommandTimeOut(){
            string strCommandTimeOutSecondsToOverride = System.Configuration.ConfigurationManager.AppSettings["COMMAND_TIME_OUT_SECONDS"];
            if(!string.IsNullOrEmpty(strCommandTimeOutSecondsToOverride)){
                this.commandTimeoutSeconds = int.Parse(strCommandTimeOutSecondsToOverride.Trim());
            }
        }
        
        public string ApplicationId
        {
            get { return applicationId; }
        }

        public bool IsLoggingEnabled
        {
            get { return isLoggingEnabled; }
            set { isLoggingEnabled = value; }
        }


        /// <summary>
        /// Creates a new connection and begins a transaction to return. Also logs to the logger that the transaction has been started
        /// </summary>
        /// <returns>transaction object</returns>
        public void BeginTrans()
        {
            if (isLoggingEnabled) Logger.Debug("Transaction Created");
            this.trans = objDbConnectionFactory.GetConnection(applicationId, null).BeginTransaction(IsolationLevel.ReadCommitted);
        }
        /// <summary>
        /// Creates a new connection and begins a transaction to return. Also logs to the logger that the transaction has been started
        /// </summary>        
        /// <returns>transaction object</returns>
        public void BeginTrans(IsolationLevel isolationLevel)
        {
            if (isLoggingEnabled) Logger.Debug("Transaction Created with isolation level: " + isolationLevel.ToString());
            this.trans = objDbConnectionFactory.GetConnection(applicationId, null).BeginTransaction(isolationLevel);
        }
        /// <summary>
        /// Commits on the transaction object passed. Also logs to the logger that the trnasaction has been commited.
        /// </summary>
        public void CommitTrans()
        {
            SqlConnection con = this.trans.Connection;//get a handle of the underlying connection of this SQLTransaction, as we will need to close it.
            try
            {
                this.trans.Commit();
                if (isLoggingEnabled) Logger.Debug("Transaction Commited");
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                objDbConnectionFactory.DisposeConnection(con, null);
                //objDbConnectionFactory.DisposeConnection(this.trans.Connection, null);
                this.trans = null;
            }
        }

        /// <summary>
        /// Perfomrs rollback on the transaction object passed. Also logs to the logger that the trnasaction has been rolled back.
        /// </summary>
        public void RollbackTrans()
        {
            try
            {
                if (trans != null && trans.Connection != null)
                {
                    this.trans.Rollback();
                    if (isLoggingEnabled) Logger.Debug("Transaction Rolledback");
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (trans != null)
                {
                    objDbConnectionFactory.DisposeConnection(this.trans.Connection, null);
                    this.trans = null;
                }
            }
        }

        public DataSet ExecuteSQL(string sqlString)
        {
            return ExecuteSQL(sqlString, true, this.commandTimeoutSeconds);
        }
        public DataSet ExecuteSQL(string sqlString, int timeoutSeconds)
        {
            return ExecuteSQL(sqlString, true, timeoutSeconds);
        }
        //internal DataSet ExecuteSQL(string sqlString, bool logQuery)
        //{
        //    return ExecuteSQL(sqlString, logQuery, this.commandTimeoutSeconds);
        //}
        internal DataSet ExecuteSQL(string sqlString, bool logQuery, int timeoutSeconds)
        {
            SqlConnection con = null;
            try
            {
                if (isLoggingEnabled)
                    if (logQuery)
                    {
                        Logger.Debug(sqlString, true);
                    }
                con = objDbConnectionFactory.GetConnection(applicationId, this.trans);
                SqlCommand objSqlCommand = con.CreateCommand();
                objSqlCommand.CommandType = CommandType.Text;
                objSqlCommand.CommandText = sqlString;
                objSqlCommand.Transaction = this.trans;
                objSqlCommand.CommandTimeout = timeoutSeconds;
                SqlDataAdapter adapter = new SqlDataAdapter(objSqlCommand);
                DataSet dset = new DataSet();
                adapter.Fill(dset);
                if (isLoggingEnabled && logQuery) Logger.Debug("Sql Executed Successfully");
                return dset;
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                objDbConnectionFactory.DisposeConnection(con, this.trans);
            }
        }
        public DataSet ExecuteStoredProc(string storedProcedureName,
                                                        List<SqlParameter> parameters)
        {
            return ExecuteStoredProc(storedProcedureName, parameters, true, this.commandTimeoutSeconds);
        }
        public DataSet ExecuteStoredProc(string storedProcedureName,
                                                        List<SqlParameter> parameters, int timeoutSeconds)
        {
            return ExecuteStoredProc(storedProcedureName, parameters, true, timeoutSeconds);
        }
        public DataSet ExecuteStoredProc(string storedProcedureName,
                                                List<SqlParameter> parameters, bool logQuery)
        {
            return ExecuteStoredProc(storedProcedureName, parameters, logQuery, this.commandTimeoutSeconds);
        }
        public DataSet ExecuteStoredProc(string storedProcedureName,
                                                List<SqlParameter> parameters, bool logQuery, int timeoutSeconds)
        {
            SqlConnection con = null;
            try
            {
                if (isLoggingEnabled && logQuery)
                {
                    Logger.Debug(GetPrintableSQLString(storedProcedureName, parameters), true);
                }
                con = objDbConnectionFactory.GetConnection(applicationId, trans);
                SqlCommand objDBCommand = con.CreateCommand();
                objDBCommand.CommandType = CommandType.StoredProcedure;
                objDBCommand.CommandText = storedProcedureName;
                objDBCommand.CommandTimeout = timeoutSeconds;
                objDBCommand.Transaction = this.trans;

                foreach (SqlParameter param in parameters)
                {
                    objDBCommand.Parameters.Add(param);
                }
                SqlDataAdapter adapter = new SqlDataAdapter(objDBCommand);

                DataSet dset = new DataSet();
                adapter.Fill(dset);
                return dset;
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                objDbConnectionFactory.DisposeConnection(con, this.trans);
            }
        }
        private DataTable ReadDataTableFromDataReader(int bucketSize, SqlDataReader reader)
        {
            DataTable table = new DataTable();
            if (reader.IsClosed) return table;
            DataTable schemaTable = reader.GetSchemaTable();
            foreach (DataRow row in schemaTable.Rows)
            {
                table.Columns.Add(new DataColumn(row["ColumnName"].ToString(), Type.GetType(row["DataType"].ToString())));
            }

            int readRecords = 0;

            while (readRecords < bucketSize
                && reader.Read())
            {
                readRecords++;
                DataRow row = table.NewRow();
                //bool recordFound = true;
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    int ordinal = reader.GetOrdinal(table.Columns[i].ColumnName);
                    Object obj = reader.GetValue(ordinal);
                    row[table.Columns[i].ColumnName] = obj;
                }
                table.Rows.Add(row);
            }

            return table;
        }

        public DCCSqlDataReader ExecuteReaderSQL(string sqlString, int bucketSize, ref DataTable table)
        {
            try
            {
                if (isLoggingEnabled) Logger.Debug(sqlString, true);
                SqlConnection con = objDbConnectionFactory.GetDataReaderConnection(applicationId);
                SqlCommand objDBCommand = con.CreateCommand();
                objDBCommand.CommandType = CommandType.Text;
                objDBCommand.CommandText = sqlString;
                objDBCommand.Transaction = this.trans;
                SqlDataReader reader = objDBCommand.ExecuteReader();
                table = ReadDataTableFromDataReader(bucketSize, reader);
                return new DCCSqlDataReader(reader, con, objDBCommand);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public DCCSqlDataReader ExecuteReader(string storedProcedureName, List<SqlParameter> parameters, int bucketSize, ref DataTable table)
        {
            try
            {
                if (isLoggingEnabled) Logger.Debug(GetPrintableSQLString(storedProcedureName, parameters), true);
                SqlConnection con = objDbConnectionFactory.GetDataReaderConnection(applicationId);
                SqlCommand objDBCommand = con.CreateCommand();
                objDBCommand.CommandType = CommandType.StoredProcedure;
                objDBCommand.CommandText = storedProcedureName;
                objDBCommand.Transaction = this.trans;
                foreach (SqlParameter param in parameters)
                {
                    objDBCommand.Parameters.Add(param);
                }
                SqlDataReader reader = objDBCommand.ExecuteReader();
                table = ReadDataTableFromDataReader(bucketSize, reader);
                return new DCCSqlDataReader(reader, con, objDBCommand);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DCCSqlDataReader ExecuteReaderSQL(string sqlString)
        {
            DataTable table = null;
            return ExecuteReaderSQL(sqlString, 0, ref table);
        }
        public DCCSqlDataReader ExecuteReader(string storedProcedureName, List<SqlParameter> parameters)
        {
            DataTable table = null;
            return ExecuteReader(storedProcedureName, parameters, 0, ref table);
        }

        public DCCSqlDataReader ExecuteReader(string storedProcedureName)
        {
            try
            {
                return ExecuteReader(storedProcedureName, new List<SqlParameter>());
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        /// <summary>
        /// Executes the given Stored Procedure.
        /// Executes the storedProcedureName with parameterValues and returns the results 
        /// in a new System.Data.DataSet.
        /// It creates a DbCommand object and then uses ExecuteDataSet method to reutrn the result in term of
        /// DataSet.
        /// </summary>
        /// <param name="storedProcedureName">Strored Procedure Name to execute.</param>
        /// <returns>A System.Data.DataSet with the results of the storedProcedureName.</returns>
        public DataSet ExecuteStoredProc(string storedProcedureName)
        {
            try
            {
                return ExecuteStoredProc(storedProcedureName, new List<SqlParameter>());
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        public SqlParameter CreateSqlParameter(string parameterName,
                                                 object paramValue,
                                                 SqlDbType parameterType,
                                                ParameterDirection direction)
        {
            return Utils.UtilityManager.CreateSqlParameter(parameterName, paramValue, parameterType, direction);
        }

        /// <summary>
        /// Executes the command and returns the first column of the first row in the
        /// result set returned by the query. Extra columns or rows are ignored.
        /// </summary>
        /// <param name="sqlString">the query to execute</param>
        /// <returns>The first column of the first row in the result set.</returns>
        public Object ExecuteScalar(string sqlString)
        {
            SqlConnection con = null;
            try
            {
                if (isLoggingEnabled) Logger.Debug(sqlString, true);
                con = objDbConnectionFactory.GetConnection(applicationId, this.trans);
                SqlCommand objSQLCommand = con.CreateCommand();
                objSQLCommand.CommandType = CommandType.Text;
                objSQLCommand.Transaction = this.trans;
                objSQLCommand.CommandText = sqlString;
                return objSQLCommand.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                objDbConnectionFactory.DisposeConnection(con, this.trans);
            }
        }
        public string GetPrintableSQLString(string storedProcedureName, List<SqlParameter> lstParameters)
        {
            return Utils.UtilityManager.GetPrintableSQLString(storedProcedureName, lstParameters);
        }

        #region Utility Methods for Getting Data from DataRow
        public static bool IsNotNull(object value)
        {
            return value != DBNull.Value && value != null;
        }
        /// Gets an integer from the passed in object. if the object is null, 0 is returned
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static int GetInteger(object value)
        {
            return IsNotNull(value) ? (int)value : Constants.DEFAULT_INTEGER_VALUE;
        }

        public static int? GetNullableInteger(object value)
        {
            return IsNotNull(value) ? (int)value : (int?)null;
        }
        /// Gets an short from the passed in object. if the object is null, 0 is returned
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static short GetShort(object value)
        {
            return IsNotNull(value) ? (short)value : (short)0;
        }
        /// Gets an short from the passed in object. if the object is null, 0 is returned
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static short? GetNullableShort(object value)
        {
            return IsNotNull(value) ? (short)value : (short?)null;
        }
        /// Gets a long from the passed in object. if the object is null, 0 is returned
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static long GetLong(object value)
        {
            return IsNotNull(value) ? (long)value : Constants.DEFAULT_INTEGER_VALUE;
        }

        /// Gets a long from the passed in object. if the object is null, a nullable long is returned.
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static long? GetNullableLong(object value)
        {
            return IsNotNull(value) ? (long)value : (long?)null;
        }

        /// Gets a byte from the passed in object. if the object is null, 0x is returned
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static byte GetByte(object value)
        {
            return IsNotNull(value) ? (byte)value : byte.MinValue;
        }

        public static byte? GetNullableByte(object value)
        {
            return IsNotNull(value) ? (byte)value : (byte?)null;
        }
        public static string GetString(object value)
        {
            return IsNotNull(value) ? value.ToString() : null;
        }
        public static DateTime GetDateTime(object value)
        {
            return IsNotNull(value) ? (DateTime)value : Constants.DEFAULT_DATE_VALUE;
        }
        public static DateTime? GetNullableDateTime(object value)
        {
            return IsNotNull(value) ? (DateTime)value : (DateTime?)null;
        }
        public static float GetFloat(object value)
        {
            return IsNotNull(value) ? (float)value : Constants.DEFAULT_FLOAT_VALUE;
        }
        public static float? GetNullableFloat(object value)
        {
            return IsNotNull(value) ? (float)value : (float?)null;
        }
        public static double GetDouble(object value)
        {
            return IsNotNull(value) ? (double)value : Constants.DEFAULT_DOUBLE_VALUE;
        }
        public static double? GetNullableDouble(object value)
        {
            return IsNotNull(value) ? (double)value : (double?)null;
        }
        public static decimal GetDecimal(object value)
        {
            return IsNotNull(value) ? (decimal)value : Constants.DEFAULT_DECIMAL_VALUE;
        }
        public static decimal? GetNullableDecimal(object value)
        {
            return IsNotNull(value) ? (decimal)value : (decimal?)null;
        }

        public static char GetChar(object value)
        {
            return IsNotNull(value) ? ((string)value).ToCharArray()[0] : Constants.DEFAULT_CHAR_VALUE;
        }
        public static char? GetNullableChar(object value)
        {
            return IsNotNull(value) ? ((string)value).ToCharArray()[0] : (char?)null;
        }

        public static bool GetBool(object value)
        {
            return GetBooleanValue(GetString(value));
        }
        public static bool? GetNullableBool(object value)
        {
            return IsNotNull(value) ? (bool)value : (bool?)null;
        }
        private static bool GetBooleanValue(string strValue)
        {
            if (string.IsNullOrEmpty(strValue))
            {
                return false;
            }
            return strValue.ToUpper() == "YES";
        }

        #endregion // Utility Methods for Getting Data from DataRow

        public string GetCommaSeparatedParameters(List<SqlParameter> parameters)
        {
            return Utils.UtilityManager.GetCommaSeparatedParameters(parameters);
        }
    }

    public enum SQLObjectTypes
    {
        StoredProcedure,
        Function,
        View,
        Table,
        None
    }
    public enum OrderByTypes
    {
        ASC,
        DESC
    }
    public abstract class SQLSelectQuery
    {
        public List<SQLSelectQueryWhereClauseCondition> lstConditions = new List<SQLSelectQueryWhereClauseCondition>();
        public List<SQLSelectQueryWhereClauseCondition> lst { get { return lstConditions; } }//this property points to the lst, kept for short facade generation.
        private string sqlObjectName;
        private SQLObjectTypes sqlObjectType = SQLObjectTypes.None;
        private List<KeyValuePair<SQLSelectQueryWhereClauseCondition, OrderByTypes>> lstOrderByConditions = new List<KeyValuePair<SQLSelectQueryWhereClauseCondition, OrderByTypes>>();
        private int? topNRecords = null;
        public void AddSelectTopNRecords(int n)
        {
            this.topNRecords = n;
        }
        public void AddOrderByClause(SQLSelectQueryWhereClauseCondition condition, OrderByTypes orderByType)
        {
            foreach (KeyValuePair<SQLSelectQueryWhereClauseCondition, OrderByTypes> pair in lstOrderByConditions)
            {
                if (pair.Key == condition)
                {
                    throw new Exception(
                        string.Format("Order by condition has already been added for WhereClauseCondition {0}",
                                      pair.Key.OperandName));
                }
            }
            lstOrderByConditions.Add(new KeyValuePair<SQLSelectQueryWhereClauseCondition, OrderByTypes>(condition, orderByType));
        }
        public string GetSQLSelectQuery()
        {
            string strWhereClause = GetWhereClause();
            string returnValue;
            string strTopN = this.topNRecords.HasValue ? " TOP " + this.topNRecords.Value : string.Empty;
            if (string.IsNullOrEmpty(strWhereClause))
            {
                returnValue = string.Format("SELECT {2} * FROM dbo.{0}{1}", this.SqlObjectName, sqlObjectType == SQLObjectTypes.Function ? "()" : string.Empty, strTopN);
            }
            else
            {
                returnValue = string.Format("SELECT {3} * FROM dbo.{0}{1} WHERE {2}", this.SqlObjectName, sqlObjectType == SQLObjectTypes.Function ? "()" : string.Empty, strWhereClause, strTopN);
            }
           

            StringBuilder orderByConditionBuilder = new StringBuilder();
            foreach (KeyValuePair<SQLSelectQueryWhereClauseCondition, OrderByTypes> pair in lstOrderByConditions)
            {
                orderByConditionBuilder.Append(" " + pair.Key.OperandName + " " + pair.Value.ToString() + ", ");
                orderByConditionBuilder.AppendLine();
            }
            if (!string.IsNullOrEmpty(orderByConditionBuilder.ToString()))
            {
                returnValue = returnValue + " ORDER BY " + orderByConditionBuilder.ToString();
            }
            returnValue = returnValue.Trim().TrimEnd(new char[] { ',' });
            return returnValue;
        }

        /// <summary>
        /// Specifies whether or not atleast one where condition is defined in 
        /// the where clause of this SQL Select Query.
        /// </summary>
        /// <returns></returns>
        public bool IsAnyWhereClauseDefined()
        {
            foreach (SQLSelectQueryWhereClauseCondition con in this.lstConditions)
            {
                if (con.Opr != WhereClauseConditionOperators.None)
                {
                    return true;
                }
            }
            return false;
        }

        private string GetWhereClause()
        {
            StringBuilder sb = new StringBuilder();
            List<SQLSelectQueryWhereClauseCondition> lstExclusiveConditions = this.lstConditions.FindAll(cndn => cndn.IsExcluisive == true).ToList();
            bool isAnyExclusiveConditionDefinedByUser = false;
            //[[if any one of the condition is specified as exclusive and user has assigned a value to this condition, then only consider those and ignore others
            foreach (SQLSelectQueryWhereClauseCondition exclusiveCondition in lstExclusiveConditions)
            {
                if (exclusiveCondition.Opr != WhereClauseConditionOperators.None)
                {
                    isAnyExclusiveConditionDefinedByUser = true;
                    sb.Append(exclusiveCondition.ToString());
                    sb.Append(System.Environment.NewLine);
                    sb.Append(" AND ");
                }
            }
            //]]
            if (!isAnyExclusiveConditionDefinedByUser)
            {
                foreach (SQLSelectQueryWhereClauseCondition con in this.lstConditions)
                {
                    if (con.Opr == WhereClauseConditionOperators.None) continue;
                    sb.Append(con.ToString());
                    sb.Append(System.Environment.NewLine);
                    sb.Append(" AND ");
                }
            }
            return sb.ToString().Trim().TrimEnd(new char[] { 'A', 'N', 'D' });
        }
        public string SqlObjectName
        {
            get { return sqlObjectName; }
            set { sqlObjectName = value; }
        }

        public SQLObjectTypes SQLObjectType
        {
            get { return sqlObjectType; }
            set { sqlObjectType = value; }
        }
    }

    public class SQLSelectQueryWhereClauseCondition
    {
        private Type operandType = null;
        private WhereClauseConditionOperators opr = WhereClauseConditionOperators.None;
        private string operandName;
        private object value;
        private bool isExclusive;
        public bool IsExcluisive
        {
            get
            {
                return isExclusive;
            }
            set
            {
                this.isExclusive = value;
            }
        }
        public SQLSelectQueryWhereClauseCondition(string operandName, Type aType)
        {
            this.operandName = operandName;
            this.operandType = aType;
        }
        public string OperandName
        {
            get { return operandName; }
            set { operandName = value; }
        }

        public WhereClauseConditionOperators Opr
        {
            get { return opr; }
            set { opr = value; }
        }

        internal Type OperandType
        {
            get { return operandType; }
            set { operandType = value; }
        }

        public object Value
        {
            get { return value; }
            set { this.value = value; }
        }
        public string Title { get; set; }
        public override string ToString()
        {
            string returnValue;
            returnValue = this.operandName + GetOperatorSymbolFromOperator(this.Opr) +
                          GetRightHandSideOfCondition();
            return returnValue;
        }

        private string GetRightHandSideOfCondition()
        {
            switch (this.opr)
            {
                case WhereClauseConditionOperators.StartsWith:
                    return string.Format("'{0}%'", GetSQLFormattedValue());
                case WhereClauseConditionOperators.EndsWith:
                    return string.Format("'%{0}'", GetSQLFormattedValue());
                case WhereClauseConditionOperators.Contains:
                    return string.Format("'%{0}%'", GetSQLFormattedValue());
                case WhereClauseConditionOperators.LessThan:
                case WhereClauseConditionOperators.LessThanEqualTo:
                case WhereClauseConditionOperators.GreaterThan:
                case WhereClauseConditionOperators.GreaterThanEqualTo:
                case WhereClauseConditionOperators.Equal:
                case WhereClauseConditionOperators.NotEqual:
                    return string.Format("'{0}'", GetSQLFormattedValue());

                case WhereClauseConditionOperators.In:
                    return string.Format("({0})", GetSQLFormattedValue());
                case WhereClauseConditionOperators.Between:
                    return string.Format(" BETWEEN {0}", GetSQLFormattedValue());
                case WhereClauseConditionOperators.IsNull:
                case WhereClauseConditionOperators.IsNotNull:
                    return string.Empty;
                case WhereClauseConditionOperators.None:
                default:
                    throw new Exception("Reached invalid condition. The operator must be defined for a where condition");
            }
        }
        private string GetSQLFormattedValue()
        {
            string returnValue = string.Empty;
            switch (this.Opr)
            {
                case WhereClauseConditionOperators.StartsWith:
                case WhereClauseConditionOperators.EndsWith:
                case WhereClauseConditionOperators.Contains:
                case WhereClauseConditionOperators.LessThan:
                case WhereClauseConditionOperators.LessThanEqualTo:
                case WhereClauseConditionOperators.GreaterThan:
                case WhereClauseConditionOperators.GreaterThanEqualTo:
                case WhereClauseConditionOperators.Equal:
                case WhereClauseConditionOperators.NotEqual:
                    if (this.value.GetType() == typeof(DateTime))
                    {
                        returnValue = ((DateTime)this.Value).ToString("dd MMM yyyy HH:mm:ss");
                    }
                    else
                    {
                        returnValue = this.value.ToString();
                    }
                    break;
                case WhereClauseConditionOperators.In:
                    object[] inClauseValues = (object[])this.Value;
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < inClauseValues.Length; i++)
                    {
                        string toAppend = string.Empty;
                        if (this.value.GetType() == typeof(DateTime))
                        {
                            toAppend = ((DateTime)inClauseValues[i]).ToString("dd MMM yyyy HH:mm:ss");
                        }
                        else
                        {
                            toAppend = inClauseValues[i].ToString();
                        }
                        if (i == 0)
                        {
                            sb.Append("'" + toAppend + "'");
                        }
                        else
                        {
                            sb.Append(", '" + toAppend + "'");
                        }
                    }
                    returnValue = sb.ToString();
                    break;
                case WhereClauseConditionOperators.Between:
                    object[] betweenValues = (object[])this.Value;
                    if (this.value.GetType() == typeof(DateTime)
                            ||
                            (betweenValues.Length == 2 &&
                                betweenValues[0].GetType() == typeof(DateTime) &&
                                betweenValues[1].GetType() == typeof(DateTime)
                            )
                        )
                    {
                        returnValue = "'" +
                                      ((DateTime)betweenValues[0]).ToString("dd MMM yyyy HH:mm:ss") +
                                      "' AND '" +
                                      ((DateTime)betweenValues[1]).ToString("dd MMM yyyy HH:mm:ss") +
                                      "'";
                    }
                    else
                    {
                        returnValue = "'" +
                                      betweenValues[0].ToString() +
                                      "' AND '" +
                                      betweenValues[1].ToString() +
                                      "'";
                    }
                    break;
                case WhereClauseConditionOperators.None:
                    break;
                default:
                    throw new Exception("Reached at wrong place..");
            }

            return returnValue;
        }

        internal string GetOperatorSymbolFromOperator(WhereClauseConditionOperators opr)
        {
            switch (opr)
            {
                case WhereClauseConditionOperators.StartsWith:
                case WhereClauseConditionOperators.EndsWith:
                case WhereClauseConditionOperators.Contains:
                    return " LIKE ";
                case WhereClauseConditionOperators.LessThan:
                    return " < ";
                case WhereClauseConditionOperators.LessThanEqualTo:
                    return " <= ";
                case WhereClauseConditionOperators.GreaterThan:
                    return " > ";
                case WhereClauseConditionOperators.GreaterThanEqualTo:
                    return " >= ";
                case WhereClauseConditionOperators.Equal:
                    return " = ";
                case WhereClauseConditionOperators.NotEqual:
                    return " <> ";
                case WhereClauseConditionOperators.In:
                    return " IN ";
                case WhereClauseConditionOperators.Between:
                    return "";
                case WhereClauseConditionOperators.IsNull:
                    return " IS NULL ";
                case WhereClauseConditionOperators.IsNotNull:
                    return " IS NOT NULL ";
                case WhereClauseConditionOperators.None:
                default:
                    throw new Exception("Reached in valid condition. The operator must be defined for a where condition");
            }
        }

        #region Condition Methods
        public void StartsWith(object val)
        {
            SetOperandValueAndOperator("StartsWith", val, WhereClauseConditionOperators.StartsWith);
        }
        public void StartsWith(object val, string title)
        {
            SetOperandValueAndOperator("StartsWith", val, WhereClauseConditionOperators.StartsWith, title);
        }
        public void EndsWith(object val)
        {
            SetOperandValueAndOperator("EndsWith", val, WhereClauseConditionOperators.EndsWith);
        }
        public void EndsWith(object val, string title)
        {
            SetOperandValueAndOperator("EndsWith", val, WhereClauseConditionOperators.EndsWith, title);
        }
        public void Contains(object val)
        {
            SetOperandValueAndOperator("Contains", val, WhereClauseConditionOperators.Contains);
        }
        public void Contains(object val, string title)
        {
            SetOperandValueAndOperator("Contains", val, WhereClauseConditionOperators.Contains, title);
        }
        public void LessThan(object val)
        {
            SetOperandValueAndOperator("LessThan", val, WhereClauseConditionOperators.LessThan);
        }
        public void LessThan(object val, string title)
        {
            SetOperandValueAndOperator("LessThan", val, WhereClauseConditionOperators.LessThan, title);
        }
        public void LessThanEqualTo(object val)
        {
            SetOperandValueAndOperator("LessThanEqualTo", val, WhereClauseConditionOperators.LessThanEqualTo);
        }
        public void LessThanEqualTo(object val, string title)
        {
            SetOperandValueAndOperator("LessThanEqualTo", val, WhereClauseConditionOperators.LessThanEqualTo, title);
        }
        public void GreaterThan(object val)
        {
            SetOperandValueAndOperator("GreaterThan", val, WhereClauseConditionOperators.GreaterThan);
        }
        public void GreaterThan(object val, string title)
        {
            SetOperandValueAndOperator("GreaterThan", val, WhereClauseConditionOperators.GreaterThan, title);
        }
        public void GreaterThanEqualTo(object val)
        {
            SetOperandValueAndOperator("GreaterThanEqualTo", val, WhereClauseConditionOperators.GreaterThanEqualTo);
        }
        public void GreaterThanEqualTo(object val, string title)
        {
            SetOperandValueAndOperator("GreaterThanEqualTo", val, WhereClauseConditionOperators.GreaterThanEqualTo, title);
        }
        public void Equal(object val)
        {
            SetOperandValueAndOperator("Equal", val, WhereClauseConditionOperators.Equal);
        }
        public void Equal(object val, string title)
        {
            SetOperandValueAndOperator("Equal", val, WhereClauseConditionOperators.Equal, title);
        }
        public void NotEqual(object val)
        {
            SetOperandValueAndOperator("NotEqual", val, WhereClauseConditionOperators.NotEqual);
        }
        public void NotEqual(object val, string title)
        {
            SetOperandValueAndOperator("NotEqual", val, WhereClauseConditionOperators.NotEqual, title);
        }
        public void In(params object[] values)
        {
            SetOperandValueAndOperator("In", values, WhereClauseConditionOperators.In);
        }

        public void Between(object startValue, object endValue)
        {
            SetOperandValueAndOperator("Between", new object[] { startValue, endValue }, WhereClauseConditionOperators.Between);
        }
        public void Between(DCCTextField fieldWithRangeEnabled)
        {
            if (UtilityManager.IsAssignableTo(fieldWithRangeEnabled, typeof(DCCDateTimeField)))
            {
                DateTime? lowerBoundDTM = ((DCCDateTimeField)fieldWithRangeEnabled).DisplayTextAsDateTime;
                DateTime? upperBoundDTM = null;
                if (fieldWithRangeEnabled.RangeSupplement == null)
                {
                    upperBoundDTM = ((DCCDateTimeField)fieldWithRangeEnabled).DisplayTextAsDateTime;
                }
                else
                {
                    upperBoundDTM = ((DCCDateTimeField)fieldWithRangeEnabled.RangeSupplement).DisplayTextAsDateTime;
                }
                //[[If both are blank, then just dont do anything.
                if (!lowerBoundDTM.HasValue && !upperBoundDTM.HasValue)
                {
                    return;
                }
                //]]
                if (lowerBoundDTM.HasValue && !upperBoundDTM.HasValue)
                {
                    upperBoundDTM = lowerBoundDTM;
                }
                if (upperBoundDTM.HasValue && !lowerBoundDTM.HasValue)
                {
                    lowerBoundDTM = upperBoundDTM;
                }
                this.Between(lowerBoundDTM, upperBoundDTM);
            }
            else
            {
                string lowerBoundDisplayText = fieldWithRangeEnabled.DisplayText;
                string upperBoundDisplayText = fieldWithRangeEnabled.RangeSupplement == null ? fieldWithRangeEnabled.DisplayText : fieldWithRangeEnabled.RangeSupplement.DisplayText;
                //[[If both are blank, then just dont do anything.
                if (string.IsNullOrEmpty(lowerBoundDisplayText) && string.IsNullOrEmpty(upperBoundDisplayText))
                {
                    return;
                }
                //]]
                if (!string.IsNullOrEmpty(lowerBoundDisplayText) && string.IsNullOrEmpty(upperBoundDisplayText))
                {
                    upperBoundDisplayText = lowerBoundDisplayText;
                }
                else if (!string.IsNullOrEmpty(upperBoundDisplayText) && string.IsNullOrEmpty(lowerBoundDisplayText))
                {
                    lowerBoundDisplayText = upperBoundDisplayText;
                }
                this.Between(lowerBoundDisplayText, upperBoundDisplayText);
            }
        }


        public void Between(object startValue, object endValue, string title)
        {
            SetOperandValueAndOperator("Between", new object[] { startValue, endValue }, WhereClauseConditionOperators.Between, title);
        }
        public void IsNull()
        {
            SetOperandValueAndOperator("IsNull", null, WhereClauseConditionOperators.IsNull);
        }
        public void IsNotNull()
        {
            SetOperandValueAndOperator("IsNotNull", null, WhereClauseConditionOperators.IsNotNull);
        }
        private bool IsAValidOperation(Type type, WhereClauseConditionOperators opr)
        {
            switch (opr)
            {
                case WhereClauseConditionOperators.StartsWith:
                case WhereClauseConditionOperators.EndsWith:
                case WhereClauseConditionOperators.Contains:
                    if (type == typeof(string)) return true;
                    return false;
                    break;
                case WhereClauseConditionOperators.LessThan:
                case WhereClauseConditionOperators.GreaterThan:
                case WhereClauseConditionOperators.GreaterThanEqualTo:
                case WhereClauseConditionOperators.LessThanEqualTo:
                    if (type == typeof(Int16) ||
                            type == typeof(Int32) ||
                            type == typeof(Int64) ||
                            type == typeof(Decimal) ||
                            type == typeof(float) ||
                            type == typeof(double) ||
                            type == typeof(DateTime) ||
                            type == typeof(byte)
                            )
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                case WhereClauseConditionOperators.Equal:
                case WhereClauseConditionOperators.NotEqual:
                case WhereClauseConditionOperators.In:
                case WhereClauseConditionOperators.Between:
                    if (type == typeof(Int16) ||
                           type == typeof(Int32) ||
                           type == typeof(Int64) ||
                           type == typeof(Decimal) ||
                           type == typeof(float) ||
                           type == typeof(double) ||
                           type == typeof(DateTime) ||
                           type == typeof(byte) ||
                           type == typeof(string) ||
                           type == typeof(byte[]) ||
                           type == typeof(Guid) ||
                           type == typeof(bool)
                           )
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    break;
                case WhereClauseConditionOperators.None:
                    break;
                case WhereClauseConditionOperators.IsNull:
                case WhereClauseConditionOperators.IsNotNull:
                    return true;
                default:
                    return false;
                    break;
            }
            return false;
        }
        private void SetOperandValueAndOperator(string functionName, object val, WhereClauseConditionOperators oprtor)
        {
            SetOperandValueAndOperator(functionName, val, oprtor, null);
        }
        private void SetOperandValueAndOperator(string functionName, object val, WhereClauseConditionOperators oprtor, string title)
        {
            if (!IsAValidOperation(OperandType, oprtor))
            {
                throw new Exception(
                    string.Format("'{0}' operator cann't be applied to operand of type {1}", functionName, OperandType.ToString()));
            }
            //[[If there is no value specified, then simply dont set the operand
            if (val == null || string.IsNullOrEmpty(val.ToString()))
            {
                if (!
                       (
                            (oprtor == WhereClauseConditionOperators.IsNull)
                            ||
                            (oprtor == WhereClauseConditionOperators.IsNotNull)
                       )
                    )
                {
                    return;
                }
            }
            //]]
            this.opr = oprtor;
            this.Value = val;
            this.Title = title;
            //]]
        }

        #endregion
    }
    //[[This is a proxy clas to reduce the code weight of generated facade
    public class Cndn : SQLSelectQueryWhereClauseCondition { public Cndn(string operandName, Type aType) : base(operandName, aType) { } }
    //]]
    public enum WhereClauseConditionOperators
    {
        StartsWith = 1,
        EndsWith,
        Contains,
        LessThan,
        LessThanEqualTo,
        GreaterThan,
        GreaterThanEqualTo,
        Equal,
        NotEqual,
        In,
        Between,
        IsNull,
        IsNotNull,
        None
    }
}