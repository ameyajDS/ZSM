using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Tools.DBFacadeGenerator;

using DCC.UMB.CDF.UIControls.Grid.Column;
using DCC.UMB.CDF.Utils;

namespace DCC.UMB.CDF.Tools.GenerateGridColumns
{
    public partial class GenerateGridColumns : Form
    {
        
        private DbManager dbManager = null;
        public GenerateGridColumns()
        {
            InitializeComponent();
            //[[Load user settings
            LoadSettings();
            //]]
        }

        private void btnGenerateGridColumns_Click(object sender, EventArgs e)
        {
            //[[Save user settings
            SaveSettings();
            //]]
            textBox1.Text = "";
            this.dbManager = new DbManager(Guid.NewGuid().ToString(),this.txtDbName.Text, this.txtuserName.Text, this.txtDbServername.Text, this.txtPassword.Text);
            //this.UserId = this.txtuserName.Text;
            //this.Password = this.txtPassword.Text;
            //this.DataSource = this.txtDbServername.Text;
            //this.ApplicationId = this.txtApplicationId.Text;
            string tableName = this.txtTable.Text;
            string columnPrefix = this.txtColumnPrefix.Text;

            try
            {
                DataSet dset =
                    this.dbManager.ExecuteSQL(
                        string.Format("select * from information_schema.columns where table_name = '{0}'", tableName));
                DataTable columnsTable = dset.Tables[0];


                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText("------------------------FOR DEFINITIONS--------------------------");
                this.textBox1.AppendText(Environment.NewLine);
                foreach (DataRow row in columnsTable.Rows)
                {
                    string columnName = row["COLUMN_NAME"].ToString();
                    string type = row["DATA_TYPE"].ToString();
                    string length = row["CHARACTER_MAXIMUM_LENGTH"].ToString();

                    this.textBox1.AppendText(GetColumnDefinition(columnPrefix, columnName, type, length));
                    this.textBox1.AppendText(Environment.NewLine);
                }

                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText("------------------------ADD COLUMNS RANGE TO GRID--------------------------");
                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText("this.<grid>.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {");

                foreach (DataRow row in columnsTable.Rows)
                {
                    string columnName = row["COLUMN_NAME"].ToString();
                    string type = row["DATA_TYPE"].ToString();
                    string length = row["CHARACTER_MAXIMUM_LENGTH"].ToString();
                    this.textBox1.AppendText(Environment.NewLine);

                    this.textBox1.AppendText(string.Format("this.{0}{1},", columnPrefix, columnName));
                    //this.dus_parameter_nm,
                    //this.dus_parameter_data_type,
                    //this.is_multiple_value,
                    //this.parameterValues});
                }
                this.textBox1.Text = this.textBox1.Text.Substring(0, this.textBox1.Text.Length - 1);
                this.textBox1.AppendText("});");
                this.textBox1.AppendText(Environment.NewLine);
 

                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText("------------------------COLUMN PROPERTIES--------------------------");
                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText(Environment.NewLine);
                
                foreach (DataRow row in columnsTable.Rows)
                {
                    string columnName = row["COLUMN_NAME"].ToString();
                    string type = row["DATA_TYPE"].ToString();
                    string length = row["CHARACTER_MAXIMUM_LENGTH"].ToString();

                    this.textBox1.AppendText("//");
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(string.Format("//{0}{1}", columnPrefix, columnName));
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText("//");
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(
                        string.Format("this.{0}{1}.BindingKey = \"{1}\";",columnPrefix,columnName)
                        );
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(
                                            string.Format("this.{0}{1}.ColumnCellType = {2};", columnPrefix, columnName, GetGridColumnCellType(type))
                                            );
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(string.Format("this.{0}{1}.HeaderText = \"{2}\";", columnPrefix,columnName, UtilityManager.GetUserFriendlyCaptionFromDatabaseObjectName(columnName)));
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(
                                            string.Format("this.{0}{1}.Lookup = false;", columnPrefix, columnName, GetGridColumnClassType(type))
                                            );
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(
                                            string.Format("this.{0}{1}.LookupColumns = \"\";", columnPrefix, columnName, GetGridColumnClassType(type))
                                            );
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(
                                            string.Format("this.{0}{1}.Mandatory = false;", columnPrefix, columnName, GetGridColumnClassType(type))
                                            );
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(
                                            string.Format("this.{0}{1}.Name = \"{0}{1}\";", columnPrefix, columnName, GetGridColumnClassType(type))
                                            );
                    this.textBox1.AppendText(Environment.NewLine);
                    this.textBox1.AppendText(
                                            string.Format("this.{0}{1}.PercentageWidth = 25;", columnPrefix, columnName, GetGridColumnClassType(type))
                                            );
                    this.textBox1.AppendText(Environment.NewLine);
                }

                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText("------------------------FOR DECLARATIONS---------------------------");
                this.textBox1.AppendText(Environment.NewLine);
                this.textBox1.AppendText(Environment.NewLine);
                foreach (DataRow row in columnsTable.Rows)
                {
                    string columnName = row["COLUMN_NAME"].ToString();
                    string type = row["DATA_TYPE"].ToString();
                    string length = row["CHARACTER_MAXIMUM_LENGTH"].ToString();

                    this.textBox1.AppendText(GetColumnDeclaration(columnPrefix, columnName, type, length));
                    this.textBox1.AppendText(Environment.NewLine);
                }
                
                
               
                
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        private string GetColumnDefinition(string prefix, string columnName, string type, string length)
        {
            string columnClassType = GetGridColumnClassType(type);
            string definition =
                string.Format(
                    "this.{0}{1} = new {2}();",prefix,columnName,columnClassType);
            return definition;
            
        }

        private string GetColumnDeclaration(string prefix, string columnName, string type, string length)
        {
            string columnClassType = GetGridColumnClassType(type);
            
            return "private " + columnClassType + " " + prefix+columnName+";";
        }

        private string GetGridColumnClassType(string type)
        {
            string columnClassType;
            switch (type)
            {
                case "char":
                    columnClassType = typeof(DCCTextFieldGridColumn).ToString();
                    break;
                case "datetime":
                    columnClassType = typeof(DCCDateGridColumn).ToString();
                    break;
                case "int":
                    columnClassType = typeof(DCCLongIntegerGridColumn).ToString();
                    break;
                case "bigint":
                    columnClassType = typeof(DCCLongIntegerGridColumn).ToString();
                    break;
                case "numeric":
                    columnClassType = typeof(DCCDoubleFloatGridColumn).ToString();
                    break;
                case "smallint":
                    columnClassType = typeof(DCCLongIntegerGridColumn).ToString();
                    break;
                case "timestamp":
                    columnClassType = typeof(DCCObjectGridColumn).ToString();
                    break;
                case "tinyint":
                    columnClassType = typeof(DCCLongIntegerGridColumn).ToString();
                    break;
                case "varchar":
                    columnClassType = typeof(DCCTextFieldGridColumn).ToString();
                    break;
                case "nvarchar":
                    columnClassType = typeof(DCCTextFieldGridColumn).ToString();
                    break;
                default:
                    throw new Exception("Invalid data type for column: " + type);
            }
            return columnClassType;
        }
        private string GetGridColumnCellType(string type)
        {
            //DCC.UMB.CDF.UIControls.DCCGridCellTypes
            //TextField = 1,
            //Date,
            //DoubleFloat,
            //LongInteger,
            //Combobox,
            //Label,
            //CheckBox,
            //Object,
            //Button
            string columnClassType;
            switch (type)
            {
                case "char":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField";
                    break;
                case "datetime":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date";
                    break;
                case "int":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger";
                    break;
                case "bigint":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger";
                    break;
                case "numeric":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat";
                    break;
                case "smallint":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger";
                    break;
                case "timestamp":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.Object";
                    break;
                case "tinyint":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger";
                    break;
                case "varchar":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField";
                    break;
                case "nvarchar":
                    columnClassType = "DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField";
                    break;
                default:
                    throw new Exception("Invalid data type for column: " + type);
            }
            return columnClassType;
        }

        
        private void LoadSettings()
        {
            this.txtuserName.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.UN;
            this.txtDbServername.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.SN;
            this.txtDbName.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.AID;
            this.txtPassword.Text = DCC.UMB.CDF.Tools.Properties.Settings.Default.PW;
        }
        private void SaveSettings()
        {
            DCC.UMB.CDF.Tools.Properties.Settings.Default.UN = this.txtuserName.Text;
            DCC.UMB.CDF.Tools.Properties.Settings.Default.SN = this.txtDbServername.Text;
            DCC.UMB.CDF.Tools.Properties.Settings.Default.AID = this.txtDbName.Text;
            DCC.UMB.CDF.Tools.Properties.Settings.Default.PW = this.txtPassword.Text;
            DCC.UMB.CDF.Tools.Properties.Settings.Default.Save();
        }

 
    }
}