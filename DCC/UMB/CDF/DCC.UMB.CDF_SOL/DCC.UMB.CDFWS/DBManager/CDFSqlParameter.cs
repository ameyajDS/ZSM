using System.Data;
using System.Data.SqlClient;

namespace DCC.UMB.CDFWS.DBManager
{
    /// <summary>
    /// Summary description for CDFSqlParameter
    /// </summary>
    public class CDFSqlParameter
    {
        public CDFSqlParameter()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private string parameterName;
        private object parameterValue;
        private DbType parameterType;
        private ParameterDirection direction;


        public string ParameterName
        {
            get { return parameterName; }
            set { parameterName = value; }
        }

        
        public object ParameterValue
        {
            get { return parameterValue; }
            set { parameterValue = value; }
        }

        
        public DbType ParameterType
        {
            get { return parameterType; }
            set { parameterType = value; }
        }

        
        public ParameterDirection Direction
        {
            get { return direction; }
            set { direction = value; }
        }

        internal SqlParameter GetSqlParameter()
        {
            SqlParameter sqlParameter = new SqlParameter(parameterName, parameterValue);
            sqlParameter.DbType = parameterType;
            sqlParameter.Direction = direction;
            return sqlParameter;
        }
    }

}