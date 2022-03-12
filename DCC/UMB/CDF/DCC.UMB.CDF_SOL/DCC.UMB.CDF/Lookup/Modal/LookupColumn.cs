using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Windows.Forms;

namespace DCC.UMB.CDF.Lookup.Modal
{
    internal class LookupColumn : DataGridViewColumn
    {
        private string caption;
        private string sqlName;
        private string aliasName;
        private int percentageWidth;
        private string toolTipText;
        private bool isDisplayMemberColumn = false;
        private bool isValueMemberColumn = false;
        private bool isCodeMemberColumn = false;
        private Type dataType;
        private SortOrder sortOrder = SortOrder.None;
        private string tablePrefix;

        internal LookupColumn(string caption,
                             string sqlName,
                             string aliasName,
                             int percentageWidth,
                            string toolTipText,
                             bool isDisplayMemberColumn,
                             bool isIdMemberColumn,
                             bool isCodeMemberColumn,
                                    string tablePrefix)
        {
            this.Name = aliasName;
            this.SortMode = DataGridViewColumnSortMode.Programmatic;

            this.caption = caption;
            this.sqlName = sqlName;
            this.aliasName = aliasName;
            this.percentageWidth = percentageWidth;
            this.toolTipText = toolTipText;
            this.IsDisplayMemberColumn = isDisplayMemberColumn;
            this.isValueMemberColumn = isIdMemberColumn;
            this.IsCodeMemberColumn = isCodeMemberColumn;
            this.TablePrefix = tablePrefix;

            this.HeaderText = caption;
            this.ToolTipText = toolTipText;
            this.Resizable = DataGridViewTriState.False;
            this.ReadOnly = true;
            this.CellTemplate = new DataGridViewTextBoxCell();
        }
        internal LookupColumn(string caption,
                             string sqlName,
                             string aliasName,
                             int percentageWidth,
                            string toolTipText,
                                    string tablePrefix)
            : this(caption, sqlName, aliasName, percentageWidth, toolTipText, false, false, false,
                                    tablePrefix)
        {

        }
        internal LookupColumn(string caption,
                             string sqlName,
                             string aliasName,
                             int percentageWidth,
                            string tablePrefix)
            : this(caption, sqlName, aliasName, percentageWidth, null, tablePrefix)
        {

        }
        public bool IsDisplayMemberColumn
        {
            get { return isDisplayMemberColumn; }
            set { isDisplayMemberColumn = value; }
        }
        internal Type DataType
        {
            get { return dataType; }
            set { dataType = value; }
        }

        public bool IsValueMemberColumn
        {
            get { return isValueMemberColumn; }
            set { isValueMemberColumn = value; }
        }

        public bool IsCodeMemberColumn
        {
            get { return isCodeMemberColumn; }
            set { isCodeMemberColumn = value; }
        }

        public string ToolTipText
        {
            get { return toolTipText; }
            set { toolTipText = value; }
        }

        public int PercentageWidth
        {
            get { return percentageWidth; }
            set { percentageWidth = value; }
        }

        public string AliasName
        {
            get { return aliasName; }
            set { aliasName = value; }
        }
        public string SqlName
        {
            get { return sqlName; }
            set { sqlName = value; }
        }
        public string Caption
        {
            get { return caption; }
            set { caption = value; }
        }
        public SortOrder SortOrder
        {
            get { return sortOrder; }
            set
            {
                sortOrder = value;
                this.HeaderCell.SortGlyphDirection = value;
            }
        }

        public string TablePrefix
        {
            get { return tablePrefix; }
            set { tablePrefix = value; }
        }
        public string TablePrefixedSqlName
        {
            get
            {
                if (string.IsNullOrEmpty(this.TablePrefix))
                {
                    return this.SqlName;
                }
                else
                {
                    return this.tablePrefix + "." + this.SqlName;
                }
            }
        }
    }
}
