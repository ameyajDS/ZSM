using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DCC.DBFacade;

namespace DCC.ZOS.ZSM
{
    public class ZSMStoredProcParamCreator
    {
        private ZSM_MUMDbFacade _dbFacade = null;
        private static ZSMStoredProcParamCreator _instance = null;

        public static ParameterDirection IN = ParameterDirection.Input;
        public static ParameterDirection OUT = ParameterDirection.Output;
        public static SqlDbType BIGINT = SqlDbType.BigInt, BINARY = SqlDbType.Binary, BIT = SqlDbType.Bit, CHAR = SqlDbType.Char, DATE = SqlDbType.Date,
        DATETIME = SqlDbType.DateTime, DATETIME2 = SqlDbType.DateTime2, DATETIMEOFFSET = SqlDbType.DateTimeOffset, DECIMAL = SqlDbType.Decimal,
        FLOAT = SqlDbType.Float, IMAGE = SqlDbType.Image, INT = SqlDbType.Int, MONEY = SqlDbType.Money, NCHAR = SqlDbType.NChar, NTEXT = SqlDbType.NText,
        NVARCHAR = SqlDbType.NVarChar, REAL = SqlDbType.Real, SMALLDATETIME = SqlDbType.SmallDateTime, SMALLINT = SqlDbType.SmallInt, SMALLMONEY = SqlDbType.SmallMoney,
        STRUCTURED = SqlDbType.Structured, TEXT = SqlDbType.Text, TIME = SqlDbType.Time, TIMESTAMP = SqlDbType.Timestamp, TINYINT = SqlDbType.TinyInt,
        UDT = SqlDbType.Udt, UNIQUEIDENTIFIER = SqlDbType.UniqueIdentifier, VARBINARY = SqlDbType.VarBinary, VARCHAR = SqlDbType.VarChar,
        VARIANT = SqlDbType.Variant, XML = SqlDbType.Xml;

        public static ZSMStoredProcParamCreator GetInstance(ZSM_MUMDbFacade dbFacade)
        {
            if (_instance == null)
            {
                _instance = new ZSMStoredProcParamCreator(dbFacade);
            }
            return _instance;
        }

        private ZSMStoredProcParamCreator(ZSM_MUMDbFacade dbFacade)
        {
            _dbFacade = dbFacade;
        }

        public void CreateSqlParameter(string parameterName, object paramValue, SqlDbType parameterType, 
            ParameterDirection direction, List<SqlParameter> p)
        {
            p.Add(_dbFacade.ObjDBManager.CreateSqlParameter(parameterName, paramValue, parameterType, direction));
        }
    }
}
