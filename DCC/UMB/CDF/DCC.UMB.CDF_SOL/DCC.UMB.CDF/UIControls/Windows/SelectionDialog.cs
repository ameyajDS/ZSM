using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Reflection;
using System.ComponentModel;

namespace DCC.UMB.CDF.UIControls.Windows
{
    public class SelectionDialog<TEnum>:Form   where TEnum:struct
    {
        private TableLayoutPanel tableLayoutPanel1;
        private ComboBox cmbValues;
        private Button btnCancel;
        private Button btnOk;
        private TEnum? returnValue;
        private void InitializeComponent()
        {
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.cmbValues = new System.Windows.Forms.ComboBox();
            this.btnOk = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.cmbValues, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.btnOk, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.btnCancel, 1, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(412, 117);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // cmbValues
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.cmbValues, 2);
            this.cmbValues.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbValues.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbValues.FormattingEnabled = true;
            this.cmbValues.Location = new System.Drawing.Point(10, 20);
            this.cmbValues.Margin = new System.Windows.Forms.Padding(10, 20, 10, 10);
            this.cmbValues.Name = "cmbValues";
            this.cmbValues.Size = new System.Drawing.Size(392, 21);
            this.cmbValues.TabIndex = 0;
            this.cmbValues.KeyDown += new System.Windows.Forms.KeyEventHandler(this.cmbValues_KeyDown);
            // 
            // btnOk
            // 
            this.btnOk.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnOk.Location = new System.Drawing.Point(20, 68);
            this.btnOk.Margin = new System.Windows.Forms.Padding(20, 10, 20, 10);
            this.btnOk.Name = "btnOk";
            this.btnOk.Size = new System.Drawing.Size(166, 39);
            this.btnOk.TabIndex = 1;
            this.btnOk.Text = "OK";
            this.btnOk.UseVisualStyleBackColor = true;
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnCancel.Location = new System.Drawing.Point(226, 68);
            this.btnCancel.Margin = new System.Windows.Forms.Padding(20, 10, 20, 10);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(166, 39);
            this.btnCancel.TabIndex = 2;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // SelectionDialog
            // 
            this.ClientSize = new System.Drawing.Size(412, 117);
            this.ControlBox = false;
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "SelectionDialog";
            this.Text = "Select a Value";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }
        private SelectionDialog()
        {
            InitializeComponent();
        }
        
        /// <summary>
        /// Shows a modal dialog with a combobox loaded with set of values defined in the input enum
        /// </summary>
        /// <param name="inputEnum">Input Enum</param>
        /// <param name="parentForm">The window on which this dialog should show up as a modal</param>
        /// <returns></returns>
        public static TEnum? ShowSelectionDialog(string dialogTitle, Form parentForm, params TEnum[] elementsToExclude)
        {
            SelectionDialog<TEnum> dialog = new SelectionDialog<TEnum>();
            dialog.Text = dialogTitle;
            
            //dialog.cmbValues.DataSource = Enum.GetValues(typeof(TEnum));            
            dialog.cmbValues.DataSource = GetDropDownData<TEnum>(elementsToExclude);
            dialog.cmbValues.DisplayMember = "Value";
            dialog.cmbValues.ValueMember = "Key";
            dialog.ShowDialog(parentForm);
            return dialog.returnValue;
        }

        private static List<KeyValuePair<TEnum, string>> GetDropDownData<TEnum>(params TEnum[] elementsToExclude)
        {
            List<KeyValuePair<TEnum, string>> returnValues = new List<KeyValuePair<TEnum, string>>();
           
            Array enumValues = Enum.GetValues(typeof(TEnum));

            foreach (TEnum value in enumValues)
            {
                if (elementsToExclude.Contains(value)) continue;
                KeyValuePair<TEnum, string> pair = new KeyValuePair<TEnum, string>(value, GetDescription(value));
                returnValues.Add(pair);
            }

            return returnValues;
        }

        private static string GetDescription(object value)
        {
            string description = value.ToString();
            FieldInfo fieldInfo = value.GetType().GetField(description);
            DescriptionAttribute[] attributes =(DescriptionAttribute[])
             fieldInfo.GetCustomAttributes(typeof(DescriptionAttribute), false);

            if (attributes != null && attributes.Length > 0)
            {
                description = attributes[0].Description;
            }
            return description;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.returnValue = null;
            this.Dispose();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            this.returnValue = (TEnum)this.cmbValues.SelectedValue;
            this.Dispose();
        }

        private void cmbValues_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                this.returnValue = (TEnum)this.cmbValues.SelectedValue;
                this.Dispose();
            }
        }

       
    }
}
