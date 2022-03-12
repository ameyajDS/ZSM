using System;
using System.Collections;
using System.Data;

namespace DCC.UMB.CDF.Configuration
{
    /// <summary>
    /// Convert a base data type to another base data type
    /// </summary>
    public sealed class TypeConvertor
    {
        private struct DbTypeMapEntry
        {
            public Type Type;
            public DbType DbType;
            public SqlDbType SqlDbType;
            public string TypeScriptType;
            public DbTypeMapEntry(Type type, DbType dbType, SqlDbType sqlDbType, string typeScriptType)
            {
                this.Type = type;
                this.DbType = dbType;
                this.SqlDbType = sqlDbType;
                this.TypeScriptType = typeScriptType;
            }

        };

        private static ArrayList dbTypeList = new ArrayList();


        #region Constructors
        static TypeConvertor()
        {
            DbTypeMapEntry dbTypeMapEntry
            = new DbTypeMapEntry(typeof(bool), DbType.Boolean, SqlDbType.Bit,"bool");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
           = new DbTypeMapEntry(typeof(bool), DbType.Decimal, SqlDbType.Real, "number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(byte), DbType.Int16, SqlDbType.TinyInt, "number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(byte[]), DbType.Binary, SqlDbType.Image,"");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(DateTime), DbType.DateTime, SqlDbType.DateTime,"Date");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
           = new DbTypeMapEntry(typeof(DateTime), DbType.Date, SqlDbType.Date,"Date");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Decimal), DbType.Decimal, SqlDbType.Decimal,"number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(double), DbType.Double, SqlDbType.Float, "number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Guid), DbType.Guid, SqlDbType.UniqueIdentifier, "string");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Int16), DbType.Int16, SqlDbType.SmallInt,"number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Int32), DbType.Int32, SqlDbType.Int,"number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Int64), DbType.Int64, SqlDbType.BigInt,"number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(object), DbType.Object, SqlDbType.Variant,"");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(string), DbType.String, SqlDbType.VarChar, "string");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(string), DbType.String, SqlDbType.NVarChar, "string");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(string), DbType.String, SqlDbType.NText, "string");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
                       = new DbTypeMapEntry(typeof(string), DbType.String, SqlDbType.Text, "string");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(string), DbType.StringFixedLength, SqlDbType.Char,"string");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(decimal), DbType.Decimal, SqlDbType.Money,"number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
           = new DbTypeMapEntry(typeof(DateTime), DbType.Date, SqlDbType.SmallDateTime, "Date");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
                       = new DbTypeMapEntry(typeof(System.Byte[]), DbType.Object, SqlDbType.Timestamp, "number");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
                       = new DbTypeMapEntry(typeof(System.Byte[]), DbType.Object, SqlDbType.VarBinary,"");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry = new DbTypeMapEntry(typeof(string), DbType.Xml, SqlDbType.Xml, "string");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry = new DbTypeMapEntry(typeof(System.TimeSpan), DbType.Time, SqlDbType.Time, "string");
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry = new DbTypeMapEntry(typeof(DataTable), DbType.Object, SqlDbType.Structured, "");
            dbTypeList.Add(dbTypeMapEntry);
        }

        private TypeConvertor()
        {

        }

        #endregion


        #region Methods

        /// <summary>
        /// Convert db type to .Net data type
        /// </summary>
        /// <param name="dbType"></param>
        /// <returns></returns>
        public static Type ToNetType(DbType dbType)
        {
            DbTypeMapEntry entry = Find(dbType);
            return entry.Type;
        }

        /// <summary>
        /// Convert TSQL type to .Net data type
        /// </summary>
        /// <param name="sqlDbType"></param>
        /// <returns></returns>
        public static Type ToNetType(SqlDbType sqlDbType)
        {
            DbTypeMapEntry entry = Find(sqlDbType);
            return entry.Type;
        }

        public static string ToTypeScriptType(SqlDbType sqlDbType)
        {
            DbTypeMapEntry entry = Find(sqlDbType);
            return entry.TypeScriptType;
        }

        /// <summary>
        /// Convert .Net type to Db type
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static DbType ToDbType(Type type)
        {
            DbTypeMapEntry entry = Find(type);
            return entry.DbType;
        }

        /// <summary>
        /// Convert TSQL data type to DbType
        /// </summary>
        /// <param name="sqlDbType"></paramn>
        /// <returns></returns>
        public static DbType ToDbType(SqlDbType sqlDbType)
        {
            DbTypeMapEntry entry = Find(sqlDbType);
            return entry.DbType;
        }

        /// <summary>
        /// Convert .Net type to TSQL data type
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static SqlDbType ToSqlDbType(Type type)
        {
            DbTypeMapEntry entry = Find(type);
            return entry.SqlDbType;
        }

        /// <summary>
        /// Convert DbType type to TSQL data type
        /// </summary>
        /// <param name="dbType"></param>
        /// <returns></returns>
        public static SqlDbType ToSqlDbType(DbType dbType)
        {
            DbTypeMapEntry entry = Find(dbType);
            return entry.SqlDbType;
        }

        private static DbTypeMapEntry Find(Type type)
        {
            object retObj = null;
            for (int i = 0; i < dbTypeList.Count; i++)
            {
                DbTypeMapEntry entry = (DbTypeMapEntry)dbTypeList[i];
                if (entry.Type == type)
                {
                    retObj = entry;
                    break;
                }
            }
            if (retObj == null)
            {
                throw new ApplicationException("Referenced an unsupported Type");
            }

            return (DbTypeMapEntry)retObj;
        }

        private static DbTypeMapEntry Find(DbType dbType)
        {
            object retObj = null;
            for (int i = 0; i < dbTypeList.Count; i++)
            {
                DbTypeMapEntry entry = (DbTypeMapEntry)dbTypeList[i];
                if (entry.DbType == dbType)
                {
                    retObj = entry;
                    break;
                }
            }
            if (retObj == null)
            {
                throw new ApplicationException("Referenced an unsupported DbType");
            }

            return (DbTypeMapEntry)retObj;
        }
        private static DbTypeMapEntry Find(SqlDbType sqlDbType)
        {
            object retObj = null;
            for (int i = 0; i < dbTypeList.Count; i++)
            {
                DbTypeMapEntry entry = (DbTypeMapEntry)dbTypeList[i];
                if (entry.SqlDbType == sqlDbType)
                {
                    retObj = entry;
                    break;
                }
            }
            if (retObj == null)
            {
                throw new ApplicationException("Referenced an unsupported SqlDbType");
            }

            return (DbTypeMapEntry)retObj;
        }

        #endregion
        internal static DbType GetDotNetParamType(ParamTypes paramType)
        {
            switch (paramType)
            {
                case ParamTypes.character:
                    return DbType.AnsiStringFixedLength;
                case ParamTypes.datetime:
                    return DbType.DateTime;
                case ParamTypes.date:
                    return DbType.DateTime;
                case ParamTypes.integer:
                    return DbType.Int32;
                case ParamTypes.money:
                    return DbType.Decimal;
                case ParamTypes.ntext:
                    return DbType.String;
                case ParamTypes.nvarchar:
                    return DbType.String;
                case ParamTypes.smallint:
                    return DbType.Int16;
                case ParamTypes.uniqueidentifier:
                    return DbType.Guid;
                case ParamTypes.varchar:
                    return DbType.String;
                
                default:
                    throw new Exception("Wrong sql data type passed");
            }
            throw new Exception("Wrong sql data type passed");
        }       
    }
    public enum ParamTypes
    {
        character = 1,
        datetime,
        date,
        integer,
        money,
        ntext,
        nvarchar,
        smallint,
        uniqueidentifier,
        varchar
    }
}

