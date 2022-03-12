using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Tools.Common;
using System.IO;
using System.Diagnostics;


namespace DCC.UMB.CDF.Tools.GenerateSQLProcsFromTable
{
    public partial class GenerateProc : Form
    {
        private DbManager dbManager = null;
        private static string procFolder = string.Empty;
        private static Hashtable filesWithPathTable;
        private string dbName;
        private string applicationId;
        private static int NUMBER_OF_CHARS_IN_TAB = 4;

        public string ApplicationId
        {
            get { return applicationId; }
            set
            {
                applicationId = value;
                dbManager = new DbManager(this.applicationId);
            }
        }
        public GenerateProc()
        {
            InitializeComponent();
            //[[Load user settings
            LoadSettings();
            //]]
            this.txtTableName.Focus();
        }

        private void btnGenerateProc_Click(object sender, EventArgs e)
        {
            //[[Save user settings
            SaveSettings();
            //]]
            try
            {
                DbConnectionFactory.UserId = txtuserName.Text.Trim();
                DbConnectionFactory.Password = txtPassword.Text.Trim();
                DbConnectionFactory.DataSource = txtDbServername.Text.Trim();
                this.ApplicationId = txtApplicationId.Text.Trim();
                DataSet dset = GetTableDetails(this.txtTableName.Text);
                DataTable tableDetails = dset.Tables[0];
                DataTable primaryKeyColumnName = dset.Tables[1];
                string tableName = tableDetails.Rows[0]["table_name"].ToString();
                string insertProcName = string.Empty;
                string updateProcName = string.Empty;
                string deleteProcName = string.Empty;
                string queryProcName = string.Empty;
                
                string insertProc = CreateInsertProcedure(tableName, tableDetails, primaryKeyColumnName, ref insertProcName);
                string updateProc = CreateUpdateProcedure(tableName, tableDetails, primaryKeyColumnName, ref updateProcName);
                string delProc = CreateDeleteProcedure(tableName, tableDetails, primaryKeyColumnName, ref deleteProcName);
                string qryProc = CreateQueryProcedure(tableName, tableDetails);
                this.txtConsolidatedProcs.Text = insertProc + System.Environment.NewLine;

                this.txtConsolidatedProcs.Text += updateProc + System.Environment.NewLine;
                this.tabPage1.Name = insertProcName;
                this.tabPage2.Name = updateProcName;
                this.tabPage3.Name = deleteProcName;
                this.txtConsolidatedProcs.Text += delProc + System.Environment.NewLine;
                this.txtConsolidatedProcs.Text += qryProc + System.Environment.NewLine;
                this.txtConsolidatedProcs.Text = this.txtConsolidatedProcs.Text.Replace("-- vim:ts=4 sw=4 ht=4", "") + System.Environment.NewLine + "-- vim:ts=4 sw=4 ht=4";
                
            }
            catch (Exception ex)
            {
                this.txtInsertProc.Text = ex.Message + "\n" + ex.StackTrace;
            }

        }
        private string CreateDeleteProcedure(string tableName, DataTable tableDetails, DataTable primaryKeyColumnName, ref string procName)
        {
            string singleColumnIdentityPrimarykeyColumnName = null;
            if (primaryKeyColumnName != null
                && primaryKeyColumnName.Rows.Count > 0
                && primaryKeyColumnName.Rows[0][0] != null
                && primaryKeyColumnName.Rows[0][0] != DBNull.Value)
            {
                singleColumnIdentityPrimarykeyColumnName = primaryKeyColumnName.Rows[0][0].ToString();
            } 
            StringBuilder sb = new StringBuilder();
            CodeWriter writer = new CodeWriter(sb, string.Empty, string.Empty);
            procName = GetUserFriendlyProcName("Delete", tableName);
            WriteDropObjectBlock(writer, procName);
            WriteCreateProcedureBlock(writer, tableDetails, procName, false, true);
            writer.StartBlock("BEGIN");
            writer.WriteLine("DELETE FROM " + tableName);
            writer.WriteLine("WHERE (1 = 2) --ADD YOUR WHERE CLAUSE");
            if (!string.IsNullOrEmpty(singleColumnIdentityPrimarykeyColumnName))
            {
                writer.WriteLine(" AND " + singleColumnIdentityPrimarykeyColumnName + " = @" + singleColumnIdentityPrimarykeyColumnName);
            }
            bool doesTxnTSColumnExist = false;
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {
                if (tableDetails.Rows[i]["data_type"].ToString().ToUpper() == "TIMESTAMP")
                {
                    doesTxnTSColumnExist=true;
                    string colName = tableDetails.Rows[i]["column_name"].ToString();
                    colName = GetTabbedFormattedString(" AND " + colName, "=" + GetTabs(1) + "@" + colName,0);
                    colName += ",";
                    writer.WriteLine(colName.Trim().TrimEnd(new char[] { ',' }));
                }
            }
            if(doesTxnTSColumnExist)
            {
                writer.WriteLine(@"IF (@@ROWCOUNT != 1)");
                writer.StartBlock("BEGIN");
                writer.WriteLine("EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL");
                writer.EndBlock("END");
            }
            writer.EndBlock("END");
            writer.WriteLine("GO");
            WriteVimInstructions(writer);
            writer.Close();
            this.txtDeleteProc.Text = sb.ToString();
            return sb.ToString();
        }
        private string CreateQueryProcedure(string tableName, DataTable tableDetails)
        {
            StringBuilder sb = new StringBuilder();
            CodeWriter writer = new CodeWriter(sb, string.Empty, string.Empty);
            string procName = GetUserFriendlyProcName("Query", tableName);
            WriteDropObjectBlock(writer, procName);
            WriteCreateProcedureBlock(writer, tableDetails, procName, false, true);
            writer.StartBlock("BEGIN");
            writer.StartBlock("SELECT");
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {
                string colName = tableDetails.Rows[i]["column_name"].ToString();
                if (i != tableDetails.Rows.Count - 1)
                {
                    colName += ", ";
                }
                writer.WriteLine(colName);
            }
            writer.EndBlock();
            writer.WriteLine("FROM " + tableName);
            writer.WriteLine("WHERE (1 = 2) --ADD YOUR WHERE CLAUSE");
            writer.EndBlock("END");
            writer.WriteLine("GO");
            WriteVimInstructions(writer);
            writer.Close();
            this.txtQryProc.Text = sb.ToString();
            return sb.ToString();
        }

        private string CreateUpdateProcedure(string tableName, DataTable tableDetails, DataTable primaryKeyColumnName, ref string procName)
        {
            string singleColumnIdentityPrimarykeyColumnName = null;
            if (primaryKeyColumnName != null
                && primaryKeyColumnName.Rows.Count > 0
                && primaryKeyColumnName.Rows[0][0] != null
                && primaryKeyColumnName.Rows[0][0] != DBNull.Value)
            {
                singleColumnIdentityPrimarykeyColumnName = primaryKeyColumnName.Rows[0][0].ToString();
            }
            StringBuilder sb = new StringBuilder();
            CodeWriter writer = new CodeWriter(sb, string.Empty, string.Empty);
            procName = GetUserFriendlyProcName("Update", tableName);
            WriteDropObjectBlock(writer, procName);
            WriteCreateProcedureBlock(writer, tableDetails, procName, false, true);
            writer.StartBlock("BEGIN");
            writer.WriteLine("UPDATE    " + tableName);
            writer.StartBlock("SET");
            int maxColumnNameLength = 0;
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {
                string colName = tableDetails.Rows[i]["column_name"].ToString();
                if (colName.Length > maxColumnNameLength)
                {
                    maxColumnNameLength = colName.Length;
                }
            }
            int numberOfTabs = (maxColumnNameLength / NUMBER_OF_CHARS_IN_TAB) + 2;
            bool doesTxnTSColumnExist = false;
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {
                if (tableDetails.Rows[i]["column_name"].ToString() == singleColumnIdentityPrimarykeyColumnName) continue;//dont update values of primary keys
                if (tableDetails.Rows[i]["data_type"].ToString().ToUpper() == "TIMESTAMP")
                {
                    doesTxnTSColumnExist = true;
                    continue;//DONT update values of timestamp column                
                }
                string colName = tableDetails.Rows[i]["column_name"].ToString();
                colName = GetTabbedFormattedString(colName, "=" + GetTabs(1) + "@" + colName, numberOfTabs);
                colName += ",";
                writer.WriteLine(colName);
            }
            writer.TrimEnd(new char[] { ',', ' ' });
            writer.EndBlock("");

            writer.WriteLine("WHERE (1 = 2) --ADD YOUR WHERE CLAUSE");
            if (!string.IsNullOrEmpty(singleColumnIdentityPrimarykeyColumnName))
            {
                writer.WriteLine(" AND " + singleColumnIdentityPrimarykeyColumnName + " = @" + singleColumnIdentityPrimarykeyColumnName);
            }
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {
                if (tableDetails.Rows[i]["data_type"].ToString().ToUpper() == "TIMESTAMP")
                {
                    string colName = tableDetails.Rows[i]["column_name"].ToString();
                    colName = GetTabbedFormattedString(" AND " + colName, "=" + GetTabs(1) + "@" + colName, numberOfTabs);
                    colName += ",";
                    writer.WriteLine(colName.Trim().TrimEnd(new char[] { ',' }));
                }
            }
            if (doesTxnTSColumnExist)
            {
                writer.WriteLine(@"IF (@@ROWCOUNT != 1)");
                writer.StartBlock("BEGIN");
                writer.WriteLine("EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL");
                writer.EndBlock("END");
            }
            writer.EndBlock("END");
            writer.WriteLine("GO");
            WriteVimInstructions(writer);
            writer.Close();
            this.txtUpdateProc.Text = sb.ToString();
            return sb.ToString();
        }
        private string CreateInsertProcedure(string tableName, DataTable tableDetails, DataTable primaryKeyColumnName, ref string procName)
        {
            string singleColumnIdentityPrimarykeyColumnName = null;
            if (primaryKeyColumnName != null
                && primaryKeyColumnName.Rows.Count > 0
                && primaryKeyColumnName.Rows[0][0] != null
                && primaryKeyColumnName.Rows[0][0] != DBNull.Value)
            {
                singleColumnIdentityPrimarykeyColumnName = primaryKeyColumnName.Rows[0][0].ToString();
            }
            StringBuilder sb = new StringBuilder();
            CodeWriter writer = new CodeWriter(sb, string.Empty, string.Empty);

            procName = GetUserFriendlyProcName("Insert", tableName);
            WriteDropObjectBlock(writer, procName);
            WriteCreateProcedureBlock(writer, tableDetails, procName, true, singleColumnIdentityPrimarykeyColumnName, false);
            writer.StartBlock("BEGIN");
            writer.WriteLine("INSERT INTO " + tableName);
            writer.StartBlock("(");
            string colName = string.Empty;
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {
                if (tableDetails.Rows[i]["column_name"].ToString() == singleColumnIdentityPrimarykeyColumnName) continue;
                if (tableDetails.Rows[i]["data_type"].ToString().ToUpper() == "TIMESTAMP") continue;//DONT insert values of timestamp column
                colName += tableDetails.Rows[i]["column_name"].ToString();
                colName += ", ";


            }
            colName = colName.Trim().TrimEnd(new char[] { ',' });
            writer.WriteLine(colName);
            writer.EndBlock(")");

            writer.WriteLine("VALUES");
            writer.StartBlock("(");
            string values = string.Empty;
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {
                if (tableDetails.Rows[i]["column_name"].ToString() == singleColumnIdentityPrimarykeyColumnName) continue;
                if (tableDetails.Rows[i]["data_type"].ToString().ToUpper() == "TIMESTAMP") continue;//DONT insert values of timestamp column
                values += "@" + tableDetails.Rows[i]["column_name"].ToString();
                values += ", ";
            }
            values = values.Trim().TrimEnd(new char[] { ',' });
            writer.WriteLine(values);
            writer.EndBlock(")");
            if (!string.IsNullOrEmpty(singleColumnIdentityPrimarykeyColumnName))
            {
                writer.WriteLine("SELECT @{0} = SCOPE_IDENTITY()", singleColumnIdentityPrimarykeyColumnName);
            }
            writer.EndBlock("END");
            writer.WriteLine("GO");
            WriteVimInstructions(writer);
            writer.Close();
            this.txtInsertProc.Text = sb.ToString();
            return sb.ToString();
        }
        private string GetUserFriendlyProcName(string procTypePrefix, string tableName)
        {
            string friendlyNameOfTable =
                DCC.UMB.CDF.Utils.UtilityManager.GetUserFriendlyCaptionFromDatabaseObjectName(tableName);
            string procName = procTypePrefix + friendlyNameOfTable.Replace(" ", "");
            if (procName.EndsWith("s"))
            {
                procName = procName.Substring(0, procName.Length - 1);
            }
            return procName;
        }
        private void WriteVimInstructions(CodeWriter writer)
        {            
            writer.WriteLine(@"-- =============================================================================
-- vim:ts=4 sw=4 ht=4");
        }
        private static void WriteCreateProcedureBlock(CodeWriter writer, DataTable tableDetails, string procName, bool writeNullableParameter, bool emitTimeStampColumnAsParameter)
        {
            WriteCreateProcedureBlock(writer, tableDetails, procName, writeNullableParameter, null, emitTimeStampColumnAsParameter);
        }
        private static void WriteCreateProcedureBlock(CodeWriter writer, DataTable tableDetails, string procName, bool writeNullableParameter, string singleColumnIdentityPrimarykeyColumnName, bool emitTimeStampColumnAsParameter)
        {
            writer.WriteLine("CREATE PROCEDURE dbo." + procName);
            writer.StartBlock("(");
            //[[First figure out the number of tabs required to separate out the column names with their types
            int maxColumnNameLength = 0;
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {
                string colName = "@" + tableDetails.Rows[i]["column_name"].ToString();
                if (colName.Length > maxColumnNameLength)
                {
                    maxColumnNameLength = colName.Length;
                }
            }
            int numberOfTabs = (maxColumnNameLength / NUMBER_OF_CHARS_IN_TAB) + 2;
            //]]
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < tableDetails.Rows.Count; i++)
            {

                string paramName = "@" + tableDetails.Rows[i]["column_name"];
                string dataType = null;
                object domainName = tableDetails.Rows[i]["domain_name"];
                if (domainName == null || domainName == DBNull.Value)
                {
                    dataType = tableDetails.Rows[i]["data_type"].ToString();
                    if (dataType.ToUpper().Contains("CHAR"))
                    {
                        dataType += "(" + tableDetails.Rows[i]["character_maximum_length"] + ")";
                    }
                }
                else
                {
                    dataType = domainName.ToString();
                }
                if (!emitTimeStampColumnAsParameter && dataType.ToUpper() == "TIMESTAMP") continue;
                if (writeNullableParameter &&
                    tableDetails.Rows[i]["is_nullable"].ToString().ToUpper() == "YES")
                {
                    dataType = GetTabbedFormattedString(dataType, " = NULL", 1);
                }
                paramName = GetTabbedFormattedString(paramName, dataType, numberOfTabs);
                if (!string.IsNullOrEmpty(singleColumnIdentityPrimarykeyColumnName) && singleColumnIdentityPrimarykeyColumnName == tableDetails.Rows[i]["column_name"].ToString())
                {
                    paramName += " output";
                }
                paramName += ",";
                //sb.AppendLine(paramName);

                writer.WriteLine(paramName);
            }
            //string consolidatedParamNames = sb.ToString().Trim().TrimEnd(new char[] { ',' });
            //writer.WriteLine(consolidatedParamNames);
            writer.TrimEnd(new char[] { ',', ' ' });
            writer.EndBlock(")");
            writer.WriteLine("WITH ENCRYPTION");
            writer.WriteLine("AS");
        }

        private static string GetTabbedFormattedString(string firstString, string secondString, int numberOfTabs)
        {
            int effectiveTabs = numberOfTabs - ((int)(firstString.Length / NUMBER_OF_CHARS_IN_TAB));

            return firstString + GetTabs(effectiveTabs) + secondString;

        }

        private static void WriteDropObjectBlock(CodeWriter writer, string procName)
        {
            writer.WriteLine(string.Format(
@"SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	{0}
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='{0}'
			)
	BEGIN
		DROP PROCEDURE  dbo.{0}
	END
GO", procName));
        }

        private DataSet GetTableDetails(string p)
        {
            string sqlText = string.Format(@"SELECT c.table_name, c.column_name, c.domain_name, c.is_nullable, c.character_maximum_length, c.data_type, c.*
                                            From information_schema.tables t
                                            join information_schema.columns c on (c.table_name = t.table_name)
                                            where t.table_type = 'BASE TABLE'
                                            and t.table_name = '{0}'
                                            order by ORDINAL_POSITION

                                            select 	c.COLUMN_NAME 
                                            from 	INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk 
		                                            JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c on (pk.TABLE_NAME=c.TABLE_NAME and c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME)
		                                            JOIN sys.columns cols on (cols.object_id=object_id('{0}') and c.COLUMN_NAME=cols.name)
                                            where 	pk.TABLE_NAME = '{0}'
                                            and	pk.CONSTRAINT_TYPE = 'PRIMARY KEY'
                                            and cols.is_identity=1", p);
            return dbManager.ExecuteSQL(sqlText);
        }
        private static string GetTabs(int tabCount)
        {
            string returnString = string.Empty;
            for (int i = 0; i < tabCount; i++)
            {
                returnString += ((char)Keys.Tab).ToString();
            }
            return returnString;
        }
        private void LoadSettings()
        {
            this.txtuserName.Text = DCC.UMB.CDF.Properties.Settings.Default.UN;
            this.txtDbServername.Text = DCC.UMB.CDF.Properties.Settings.Default.SN;
            this.txtApplicationId.Text = DCC.UMB.CDF.Properties.Settings.Default.AID;
            this.txtPassword.Text = DCC.UMB.CDF.Properties.Settings.Default.PW;
        }
        private void SaveSettings()
        {
            DCC.UMB.CDF.Properties.Settings.Default.UN = this.txtuserName.Text;
            DCC.UMB.CDF.Properties.Settings.Default.SN = this.txtDbServername.Text;
            DCC.UMB.CDF.Properties.Settings.Default.AID = this.txtApplicationId.Text;
            DCC.UMB.CDF.Properties.Settings.Default.PW = this.txtPassword.Text;
            DCC.UMB.CDF.Properties.Settings.Default.Save();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            openFileDialog1.FileName = "DONT_TYPE_HERE";
            openFileDialog1.Filter = "folders|*.neverseenthisfile";
            openFileDialog1.CheckFileExists = false;
            openFileDialog1.CheckPathExists = false;
            openFileDialog1.Multiselect = false;
            
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                FileInfo info = new FileInfo(openFileDialog1.FileName);
                DCC.UMB.CDF.Properties.Settings.Default.PDP = info.Directory.FullName;
                string directoryPath = info.Directory.FullName;
                string insertProcFilePath = directoryPath + "\\" + this.tabPage1.Name + ".sql";
                string updateProcFilePath = directoryPath + "\\" + this.tabPage2.Name + ".sql";
                string deleteProcFilePath = directoryPath + "\\" + this.tabPage3.Name + ".sql";

                ConfirmAndWriteFile(insertProcFilePath, txtInsertProc.Text);
                ConfirmAndWriteFile(updateProcFilePath, txtUpdateProc.Text);
                ConfirmAndWriteFile(deleteProcFilePath, txtDeleteProc.Text);
                DialogResult result = MessageBox.Show("Procedure Files Generated Successfully. Open folder?","CDF: Confirm", MessageBoxButtons.YesNo);
                if(result==System.Windows.Forms.DialogResult.Yes)
                {
                    try
                    {
                        Process.Start(directoryPath);
                    }
                    catch (Exception ex)
                    {
                        //kill expcetion.
                    }
                }
            }
        }

        private void ConfirmAndWriteFile(string procFilePath, string procString)
        {
            if (File.Exists(procFilePath))
            {
                DialogResult result = MessageBox.Show("The file " + procFilePath + " already exists, overwrite?", "CDF confirm file overwrite", MessageBoxButtons.YesNo);
                if (result == System.Windows.Forms.DialogResult.No)
                {
                    return;
                }
                else
                {
                    File.Delete(procFilePath);
                }
            }
            File.WriteAllText(procFilePath, procString);
        }
    }

}
