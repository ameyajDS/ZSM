using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DCC.UMB.CDF.DB
{
    public interface IDbManager
    {
        string ApplicationId { get; }
        bool IsLoggingEnabled { get; set; }
        /// <summary>
        /// Creates a new connection and begins a transaction to return. Also logs to the logger that the transaction has been started
        /// </summary>
        /// <returns>transaction object</returns>
        void BeginTrans();

        /// <summary>
        /// Creates a new connection and begins a transaction to return. Also logs to the logger that the transaction has been started
        /// </summary>        
        /// <returns>transaction object</returns>
        void BeginTrans(IsolationLevel isolationLevel);

        /// <summary>
        /// Commits on the transaction object passed. Also logs to the logger that the trnasaction has been commited.
        /// </summary>
        void CommitTrans();

        /// <summary>
        /// Perfomrs rollback on the transaction object passed. Also logs to the logger that the trnasaction has been rolled back.
        /// </summary>
        void RollbackTrans();

        DataSet ExecuteSQL(string sqlString);
        DataSet ExecuteSQL(string sqlString, int timeoutSeconds);

        DataSet ExecuteStoredProc(string storedProcedureName,List<SqlParameter> parameters);
        DataSet ExecuteStoredProc(string storedProcedureName, List<SqlParameter> parameters, int timeoutSeconds);

        /// <summary>
        /// Executes the given Stored Procedure.
        /// Executes the storedProcedureName with parameterValues and returns the results 
        /// in a new System.Data.DataSet.
        /// It creates a DbCommand object and then uses ExecuteDataSet method to reutrn the result in term of
        /// DataSet.
        /// </summary>
        /// <param name="storedProcedureName">Strored Procedure Name to execute.</param>
        /// <returns>A System.Data.DataSet with the results of the storedProcedureName.</returns>
        DataSet ExecuteStoredProc(string storedProcedureName);

        DataSet ExecuteStoredProc(string storedProcedureName, List<SqlParameter> parameters, bool logQuery);


        /// <summary>
        /// Executes the command and returns the first column of the first row in the
        /// result set returned by the query. Extra columns or rows are ignored.
        /// </summary>
        /// <param name="sqlString">the query to execute</param>
        /// <returns>The first column of the first row in the result set.</returns>
        Object ExecuteScalar(string sqlString);

        DCCSqlDataReader ExecuteReader(string storedProcedureName);
        DCCSqlDataReader ExecuteReader(string storedProcedureName, List<SqlParameter> parameters);
        DCCSqlDataReader ExecuteReaderSQL(string sqlString);
        DCCSqlDataReader ExecuteReader(string storedProcedureName, List<SqlParameter> parameters, int bucketSize, ref DataTable table);
        DCCSqlDataReader ExecuteReaderSQL(string sqlString, int bucketSize, ref DataTable table);
        SqlParameter CreateSqlParameter(string parameterName, object paramValue, SqlDbType parameterType, ParameterDirection direction);
        string GetCommaSeparatedParameters(List<SqlParameter> parameters);
        string GetPrintableSQLString(string storedProcedureName, List<SqlParameter> lstParameters);

    }
}