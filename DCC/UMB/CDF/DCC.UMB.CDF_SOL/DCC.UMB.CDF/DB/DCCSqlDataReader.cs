using System.Data.SqlClient;
using System.Data;
using System;
using DCC.UMB.CDF.MGMT.Global;
namespace DCC.UMB.CDF.DB
{
    public class DCCSqlDataReader
    {
        private SqlDataReader reader;
        private SqlConnection connection;
        private SqlCommand command;
        public DCCSqlDataReader(SqlDataReader reader, SqlConnection connection, SqlCommand aCommand)
        {
            this.reader = reader;
            this.connection = connection;
            this.command = aCommand;
        }
        ~DCCSqlDataReader()
        {
            this.CloseReaderAndConnection();
        }
        public DCCSqlDataReader() { }//dummy constructor for the inherited class (aka DCCWebSqlDataReader)
        internal virtual bool IsClosed
        {
            get { return this.reader.IsClosed; }
        }
        internal virtual DataTable GetSchemaTable()
        {
            return this.reader.GetSchemaTable();
        }
        internal virtual DataTable ReadNextBucketFromBrowseModeDataReader(int bucketSize)
        {
            DataTable table = new DataTable();
            if (this.reader.IsClosed) return table;
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
            //[[Now check if the readRecords < GlobalAppVariables.AppContext.BrowseModeRetrivalBucketSize
            //if true that means the reader has reached till the end of the recordset in database and should be closed
            if (readRecords < bucketSize)
            {
                CloseReaderAndConnection();
            }
            return table;
        }
        internal virtual void CloseReaderAndConnection()
        {
            try
            {
                this.command.Cancel();
                this.command.Dispose();
                this.reader.Close();
                this.connection.Close();
                this.connection.Dispose();
            }
            catch (System.Exception)
            {
                //Do nothing.
            }
            finally
            {
                try
                {
                    this.connection.Close();    
                }
                catch
                {
                    //Do nothing
                }
            }
        }
    }
}