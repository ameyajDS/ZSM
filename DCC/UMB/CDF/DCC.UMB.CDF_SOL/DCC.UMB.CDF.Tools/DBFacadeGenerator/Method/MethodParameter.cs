using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Configuration;


namespace DCC.UMB.CDF.Tools.DBFacadeGenerator.Method {
    class MethodParameter {
        string name;
        //System.Type paramType;
        SqlDbType paramSqlDbType;

        public SqlDbType ParamSqlDbType {
            get { return paramSqlDbType; }
            set { paramSqlDbType = value; }
        }
        string paramDirection;
        int index;

        public int Index {
            get { return index; }
            set { index = value; }
        }

        public string Name {
            get { return name; }
            set { name = value; }
        }

        public string ParamDirection {
            get { return paramDirection; }
            set { paramDirection = value; }
        }
        public MethodParameter(DataRowView row, int index) {
            this.name = DbManager.GetString(row["PARAMETER_NAME"]).Replace("@", "");


            this.paramDirection = DbManager.GetString(row["PARAMETER_MODE"]).ToUpper();
            string strType = DbManager.GetString(row["DATA_TYPE"]);

            if (strType == "numeric")//as numeric is not available in SqlDbType
            {
                strType = "decimal";
            }
            if (strType == "table type")
                strType = "STRUCTURED";

            SqlDbType sqlDbType = (SqlDbType)Enum.Parse(typeof(SqlDbType), strType, true);
            paramSqlDbType = sqlDbType;
            this.index = index;
        }
        private MethodParameter() {

        }

        public override string ToString() {
            Type type = TypeConvertor.ToNetType(this.ParamSqlDbType);
            var replaceType = "";
            if (type.ToString().Contains("System.Data."))
                replaceType = "System.Data.";
            else
                replaceType = "System.";
            string parameterType = type.IsValueType && this.paramDirection == "IN" ? type.ToString().Replace(replaceType, "") + "?" : type.ToString().Replace(replaceType, "");
            return (this.paramDirection == "IN" ? "" : "ref ") + parameterType + " " + this.GetSafeParameterName();
        }
        public string GetParameterSyntaxToPassOnToOtherMethod() {
            //Type type = TypeConvertor.ToNetType(this.ParamSqlDbType);
            //string parameterType = type.IsValueType && this.paramDirection == "IN" ? type.ToString() + "?" : type.ToString();            
            return (this.paramDirection == "IN" ? "" : "ref ") + this.GetSafeParameterName();
        }
        public string GetSafeParameterName() {
            return GetSafeName(this.name);
        }
        public static string GetSafeName(string name) {
            List<string> lstKeywords = new List<string>();
            lstKeywords.AddRange(cSharpKeywords);
            if (lstKeywords.Contains(name)) {
                return name + "_";
            } else {
                return name;
            }
        }
        public string GetParameterSQLTypeName() {
            //return TypeConvertor.ToNetType(this.ParamSqlDbType).ToString();
            //return TypeConvertor.ToSqlDbType((this.ParamSqlDbType).ToString();
            return TypeConvertor.ToNetType(this.paramSqlDbType).ToString();
        }
        public string GetGeneratedSQLParameterName() {
            return this.Name + "_Parameter";
        }
        public static string[] cSharpKeywords = new string[]{
            "abstract",
"as",
"base",
"bool",
"break",
"byte",
"case",
"catch",
"char",
"checked",
"class",
"const",
"continue",
"decimal",
"default",
"delegate",
"do",
"double",
"else",
"enum",
"event",
"explicit",
"extern",
"finally",
"fixed",
"float",
"for",
"foreach",
"goto",
"if",
"implicit",
"in",
"int",
"interface",
"internal",
"is",
"lock",
"long",
"namespace",
"new",
"null",
"object",
"operator",
"out",
"override",
"params",
"private",
"protected",
"public",
"readonly",
"ref",
"return",
"sbyte",
"sealed",
"short",
"sizeof",
"stackalloc",
"static",
"string",
"struct",
"switch",
"this",
"throw",
"try",
"typeof",
"uint",
"ulong",
"unchecked",
"unsafe",
"ushort",
"using",
"virtual",
"void",
"volatile",
"while",
"FALSE",
"TRUE"
    };

    }
    class MethodParameterPredicate {
        string paramDirection = null;

        public string ParamDirection {
            get { return paramDirection; }
            set { paramDirection = value; }
        }
        public bool Compare(MethodParameter parameter) {
            bool check = true;
            if (!string.IsNullOrEmpty(this.paramDirection)) {
                check = check && parameter.ParamDirection == this.paramDirection;
                if (!check) return check;
            }
            return check;
        }
    }
}
