using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using System.IO;
using System.Data.SqlClient;
using DCC.UMB.CDF.DB;
using System.Xml;
using System.Collections;
using DCC.UMB.CDF.Tools.Common;
using DCC.UMB.CDF.Configuration;


namespace DCC.UMB.CDF.Tools.DBFacadeGenerator.Method {
    enum MethodType {
        DataSet = 1,
        DataReader,
        ScalarFunction,
        InlineFunction
    }
    class SQLObjectReturningTable {
        private DataRowView rowView;
        private readonly DataTable returnDetails;
        private readonly DataTable dataTypeMapping;

        public SQLObjectReturningTable(DataRowView view, DataTable returnDetails) {
            this.rowView = view;
            this.returnDetails = returnDetails;
            this.dataTypeMapping = dataTypeMapping;
        }

        public void Print(CodeWriter writer) {
            string functionName = rowView["ROUTINE_NAME"].ToString();
            string routineType = rowView["ROUTINE_TYPE"].ToString();

            if (!FacadeGenerator.FORCE_LOWER_CASE) {
                char[] chars = functionName.ToCharArray();
                chars[0] = chars[0].ToString().ToUpper().ToCharArray()[0];
                functionName = new string(chars);
            }

            writer.WriteLine(string.Format("public class {0}SQLSelectQuery : SQLSelectQuery", functionName));
            writer.StartBlock();//start of functionWhereClause class
            foreach (DataColumn col in returnDetails.Columns) {
                //writer.WriteLine(string.Format("Cls l_{0} = new Cls(\"{0}\", typeof({1}));", col.ColumnName, col.DataType.ToString().Replace("System.","")));
                //writer.WriteLine(
                //        string.Format("public SQLSelectQueryWhereClauseCondition {0} % get % return this.l_{0}; $ $", col.ColumnName).Replace("%","{").Replace("$","}")
                //        );
                //public SQLSelectQueryWhereClauseCondition person_id = new Cls("person_id", typeof(Int32));
                writer.WriteLine(string.Format("public Cndn {0} = new Cndn(\"{0}\", typeof({1}));", MethodParameter.GetSafeName(col.ColumnName), col.DataType.ToString().Replace("System.", "")));
            }
            writer.WriteLine(string.Format("public {0}SQLSelectQuery()", functionName));
            writer.StartBlock(); //start of functionWhereClauseConstructor
            writer.WriteLine(string.Format("SqlObjectName = \"{0}\";", functionName));
            if (routineType == "VIEW") {
                writer.WriteLine(string.Format("SQLObjectType = SQLObjectTypes.{0};", SQLObjectTypes.View));
            } else if (routineType == "FUNCTION") {
                writer.WriteLine(string.Format("SQLObjectType = SQLObjectTypes.{0};", SQLObjectTypes.Function));
            }
            writer.WriteLine();
            foreach (DataColumn col in returnDetails.Columns) {
                writer.WriteLine(string.Format("lst.Add({0});", MethodParameter.GetSafeName(col.ColumnName)));
            }
            writer.EndBlock(); //end of functionWhereClauseConstructor
            writer.EndBlock();//end of functionWhereClause class
        }
    }
    class Method {
        private List<MethodParameter> parameters = new List<MethodParameter>();

        string methodName;
        private static int openBlockCount = 2;
        string apiDocString = string.Empty;
        private ProcApiDocs apiDocs = null;
        private DataView methodView = null;

        /// <summary>        
        /// </summary>        
        /// <param name="view"></param>
        public Method(DataView view) {
            //string[] parameters = new string[spDetailsTable.Rows.Count + 1]; //+1 is done for the transaction parameter            
            this.methodName = view[0]["ROUTINE_NAME"].ToString();


            for (int i = 0; i < view.Count; i++) {
                DataRowView row = view[i];
                if (string.IsNullOrEmpty(DbManager.GetString(row["PARAMETER_NAME"]))) continue;
                this.parameters.Add(new MethodParameter(row, i));
            }
            this.methodView = view;
            apiDocString = GetAPIDocString();
        }

        private string GetAPIDocString() {
            ///[[Get the proc body from the databae, most likely, it is going to be encrypted, but just try
            try {
                string procContents = FacadeGenerator.FindSPInDirectory(FacadeGenerator.ProcFolder, this.methodName + ".sql");

                this.apiDocs = APIDocExtractor.GetProcApiDocs(procContents);

                StringBuilder sb = new StringBuilder();
                StringWriter sw = new StringWriter(sb);
                XmlTextWriter writer = new XmlTextWriter(sw);
                writer.Formatting = Formatting.Indented;
                writer.WriteStartElement("root");
                ///[[write summary
                writer.WriteStartElement("summary");
                writer.WriteString(this.apiDocs.Summary);
                writer.WriteEndElement();
                //]]
                ///[[write params
                List<ParamApiDocs> paramDocs = this.apiDocs.Parameters;
                foreach (ParamApiDocs paramDoc in paramDocs) {
                    writer.WriteStartElement("param");
                    writer.WriteAttributeString("name", paramDoc.ParameterName.Replace("@", string.Empty));
                    if (paramDoc.DocComments != null) {
                        writer.WriteString(paramDoc.DocComments.Replace("</DESC>", string.Empty).Replace("<DESC>", string.Empty));
                    }
                    writer.WriteEndElement();
                }
                //]]
                ///[[write remarks
                writer.WriteStartElement("remarks");
                writer.WriteString(this.apiDocs.Remarks);
                writer.WriteEndElement();
                //]]
                ///[[write returns
                writer.WriteStartElement("returns");
                writer.WriteString(this.apiDocs.Returns);
                writer.WriteEndElement();
                //]]
                writer.WriteEndElement();
                writer.Close();
                string strOutput = sb.ToString();
                strOutput = strOutput.Replace("</root>", string.Empty);
                strOutput = strOutput.Replace("<root>", string.Empty);

                strOutput = strOutput.Replace(System.Environment.NewLine, System.Environment.NewLine + "///");
                if (strOutput.Trim().EndsWith("///")) {
                    strOutput = strOutput.Trim();
                    strOutput = strOutput.Substring(0, strOutput.Length - 3);
                }
                return strOutput.Trim();
            } catch (Exception ex) {
                return string.Empty;
            }
            //]]
        }

        private bool isSignagureForParameterCreationMethodGenerated = false;
        internal void Print(CodeWriter writer, MethodType methodType, bool asTask) {
            if (!FacadeGenerator.FORCE_LOWER_CASE) {
                char[] chars = methodName.ToCharArray();
                chars[0] = chars[0].ToString().ToUpper().ToCharArray()[0];
                methodName = new string(chars);
            }


            //[[Write the sql parameter creater method
            if (!isSignagureForParameterCreationMethodGenerated) {
                CreateMethodSignatureForParameterCreation(writer);
                writer.StartBlock();
                CreateMethodBodyForParametersGenerator(writer);
                writer.EndBlock();
                isSignagureForParameterCreationMethodGenerated = true;
            }
            //]]

            CreateMethodSignagure(writer, methodType, asTask);
            writer.StartBlock(); ;//start the method level braces
            CreateMethodBody(asTask, methodType, writer);
            writer.EndBlock(); //end the method level braces


        }

        private void CreateMethodSignatureForParameterCreation(CodeWriter writer) {
            StringBuilder methodDefinition = new StringBuilder();
            methodDefinition.Append(System.Environment.NewLine);
            methodDefinition.Append("private List<SqlParameter> " + this.methodName + "_Params");

            methodDefinition.Append("(");

            int len = methodDefinition.ToString().Length; //This will be used to offset rest of the parameters
            for (int i = 0; i < this.parameters.Count; i++) {
                if (i == 0) {
                    methodDefinition.Append(this.parameters[i].ToString());
                } else {
                    methodDefinition.Append(", \r\n" + writer.GetSpaces(len) + this.parameters[i].ToString());
                }
            }
            methodDefinition.Append(")");
            writer.WriteLine(methodDefinition.ToString());
        }

        private void CreateMethodBodyForParametersGenerator(CodeWriter writer) {
            writer.WriteLine("List<SqlParameter> p = new List<SqlParameter>();");
            foreach (MethodParameter param in this.parameters) {
                if (param.Name == "trans") continue;
                if (param.ParamDirection == "IN") {
                    writer.WriteLine("csp(\"" + param.Name + "\", " + param.GetSafeParameterName() + ", " + param.ParamSqlDbType.ToString().ToUpper() + ", IN, p);");
                } else if (param.ParamDirection == "INOUT") {
                    writer.WriteLine("csp(\"" + param.Name + "\", " + param.GetSafeParameterName() + ", " + param.ParamSqlDbType.ToString().ToUpper() + ", INOUT, p);");
                } else {
                    writer.WriteLine("csp(\"" + param.Name + "\", " + param.GetSafeParameterName() + ", " + param.ParamSqlDbType.ToString().ToUpper() + ", OUT, p);");
                }
            }
            writer.WriteLine("return p;");
        }
        private void CreateMethodBody(bool isTask, MethodType methodType, CodeWriter writer) {
            StringBuilder sb = new StringBuilder();
            sb.Append("List<SqlParameter> prms = " + this.methodName + "_Params(");

            for (int i = 0; i < this.parameters.Count; i++) {
                sb.Append(this.parameters[i].GetParameterSyntaxToPassOnToOtherMethod());
                if (i != this.parameters.Count - 1) {
                    sb.Append(", ");
                }
            }
            sb.Append(");");
            writer.WriteLine(sb.ToString());

            if (!isTask) {
                switch (methodType) {
                    case MethodType.DataSet:
                        writer.WriteLine("DataSet dset = esp(\"" + this.methodName +
                                         "\", prms);");
                        break;
                    case MethodType.DataReader:
                        writer.WriteLine("DCCSqlDataReader reader = ObjDBManager.ExecuteReader(\"" + this.methodName +
                                         "\", prms);");
                        break;
                    case MethodType.InlineFunction:
                        writer.WriteLine("string commaSeparatedParameters = ObjDBManager.GetCommaSeparatedParameters(prms);");
                        writer.WriteLine(string.Format("DataSet dset = ObjDBManager.ExecuteSQL(\"SELECT * FROM dbo.{0}(\" + commaSeparatedParameters + \")\");", this.methodName));
                        break;
                    case MethodType.ScalarFunction:
                        writer.WriteLine("string commaSeparatedParameters = ObjDBManager.GetCommaSeparatedParameters(prms);");
                        writer.WriteLine(string.Format("Object obj = ObjDBManager.ExecuteScalar(\"SELECT dbo.{0}(\" + commaSeparatedParameters + \")\");", this.methodName));
                        break;
                    default:
                        break;
                }
            } else {
                writer.WriteLine("return gps(\"" + this.methodName +
                                 "\", prms);");
            }

            //[[Now write code to set the output parameters.
            if (!isTask) {
                for (int i = 0; i < this.parameters.Count; i++) {
                    MethodParameter param = this.parameters[i];
                    if (param.ParamDirection.ToUpper().Trim() == "INOUT" || param.ParamDirection.ToUpper().Trim() == "OUT") {
                        ////medical_surgery_id = (System.Int16)medical_surgery_id_Parameter.Value;
                        //writer.WriteLine(param.GetSafeParameterName() + " = (" +
                        //                 this.parameters[i].GetParameterSQLTypeName() + ")" +
                        //                 param.GetGeneratedSQLParameterName() + ".Value;");

                        //sqlParameters_gen.FirstOrDefault(p => p.ParameterName == "medical_surgery_id")
                        writer.WriteLine(param.GetSafeParameterName() + " = (" +
                                        this.parameters[i].GetParameterSQLTypeName() + ")" +
                                        string.Format("prms.FirstOrDefault(p => p.ParameterName == \"{0}\")", param.GetSafeParameterName()) +
                                        //param.GetGeneratedSQLParameterName() +
                                        ".Value;");
                    }
                }
            }
            //]]
            if (this.parameters.Count > 0) {
                writer.WriteLine();
            }
            if (!isTask) {
                switch (methodType) {
                    case MethodType.DataSet:
                        writer.WriteLine("return dset;");
                        break;
                    case MethodType.DataReader:
                        writer.WriteLine("return reader;");
                        break;
                    case MethodType.InlineFunction:
                        writer.WriteLine("return dset;");
                        break;
                    case MethodType.ScalarFunction:
                        string scalarFunctionReturnTypeName = this.methodView[0]["ROUTINE_DATA_TYPE"].ToString();
                        SqlDbType sqlDbType = default(SqlDbType);
                        if (scalarFunctionReturnTypeName.ToLower() == "numeric") {
                            sqlDbType = SqlDbType.Decimal;
                        } else {
                            sqlDbType = (SqlDbType)Enum.Parse(typeof(SqlDbType), scalarFunctionReturnTypeName, true);
                        }
                        Type scalarFunctionReturnType = TypeConvertor.ToNetType(sqlDbType);
                        if (scalarFunctionReturnType.IsValueType) {
                            writer.WriteLine(
                                string.Format("return (obj == null || obj == DBNull.Value) ? null : ({0}?)obj;",
                                              scalarFunctionReturnType));
                        } else {
                            writer.WriteLine(
                                string.Format("return obj == null || obj == DBNull.Value ? null : ({0})obj;",
                                              scalarFunctionReturnType));
                        }
                        break;
                    default:
                        break;
                }
            } else {
                //writer.WriteLine("return taskString;");
            }
        }

        private void CreateMethodSignagure(CodeWriter writer, MethodType methodType, bool isTask) {
            StringBuilder methodDefinition = new StringBuilder();
            methodDefinition.Append(System.Environment.NewLine);
            switch (methodType) {
                case MethodType.DataSet:
                case MethodType.InlineFunction:
                    if (!isTask) {
                        methodDefinition.Append("public DataSet " + this.methodName);
                    } else {
                        methodDefinition.Append("public string " + this.methodName + "AsTask");
                    }
                    break;
                case MethodType.DataReader:
                    methodDefinition.Append("public DCCSqlDataReader " + this.methodName + "AsReader");
                    break;
                case MethodType.ScalarFunction:
                    string scalarFunctionReturnTypeName = this.methodView[0]["ROUTINE_DATA_TYPE"].ToString();
                    SqlDbType sqlDbType = default(SqlDbType);
                    if (scalarFunctionReturnTypeName.ToLower() == "numeric") {
                        sqlDbType = SqlDbType.Decimal;
                    } else {
                        sqlDbType = (SqlDbType)Enum.Parse(typeof(SqlDbType), scalarFunctionReturnTypeName, true);
                    }
                    Type scalarFunctionReturnType = TypeConvertor.ToNetType(sqlDbType);

                    if (scalarFunctionReturnType.IsValueType) {
                        methodDefinition.Append(string.Format("public {0}? {1}", scalarFunctionReturnType,
                                                              this.methodName));
                    } else {
                        methodDefinition.Append(string.Format("public {0} {1}", scalarFunctionReturnType,
                                                              this.methodName));
                    }
                    break;
                default:
                    break;
            }

            methodDefinition.Append("(");

            int len = methodDefinition.ToString().Length; //This will be used to offset rest of the parameters
            for (int i = 0; i < this.parameters.Count; i++) {
                if (i == 0) {
                    methodDefinition.Append(this.parameters[i].ToString());
                } else {
                    methodDefinition.Append(", \r\n" + writer.GetSpaces(len) + this.parameters[i].ToString());
                }
            }
            methodDefinition.Append(")");
            writer.WriteLine(apiDocString + methodDefinition.ToString());
        }

    }

}
