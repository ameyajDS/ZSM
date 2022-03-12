using System;
using System.Collections;
using System.Data;

namespace DCC.UMB.CDF.Tools.DBFacadeGenerator.Utils
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
            public DbTypeMapEntry(Type type, DbType dbType, SqlDbType sqlDbType)
            {
                this.Type = type;
                this.DbType = dbType;
                this.SqlDbType = sqlDbType;                
            }

        };

        private static ArrayList dbTypeList = new ArrayList();


        #region Constructors
        static TypeConvertor()
        {
            DbTypeMapEntry dbTypeMapEntry
            = new DbTypeMapEntry(typeof(bool), DbType.Boolean, SqlDbType.Bit);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(byte), DbType.Int16, SqlDbType.TinyInt);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(byte[]), DbType.Binary, SqlDbType.Image);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(DateTime), DbType.DateTime, SqlDbType.DateTime);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Decimal), DbType.Decimal, SqlDbType.Decimal);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(double), DbType.Double, SqlDbType.Float);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Guid), DbType.Guid, SqlDbType.UniqueIdentifier);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Int16), DbType.Int16, SqlDbType.SmallInt);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Int32), DbType.Int32, SqlDbType.Int);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(Int64), DbType.Int64, SqlDbType.BigInt);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(object), DbType.Object, SqlDbType.Variant);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(string), DbType.String, SqlDbType.VarChar);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(string), DbType.String, SqlDbType.NVarChar);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(string), DbType.String, SqlDbType.NText);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
                       = new DbTypeMapEntry(typeof(string), DbType.String, SqlDbType.Text);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(string), DbType.StringFixedLength, SqlDbType.Char);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
            = new DbTypeMapEntry(typeof(decimal), DbType.Decimal, SqlDbType.Money);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
           = new DbTypeMapEntry(typeof(DateTime), DbType.Date, SqlDbType.SmallDateTime);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
                       = new DbTypeMapEntry(typeof(System.Byte[]), DbType.Object, SqlDbType.Timestamp);
            dbTypeList.Add(dbTypeMapEntry);

            dbTypeMapEntry
                       = new DbTypeMapEntry(typeof(System.Byte[]), DbType.Object, SqlDbType.VarBinary);
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
        integer,
        money,
        ntext,
        nvarchar,
        smallint,
        uniqueidentifier,
        varchar
    }
}

