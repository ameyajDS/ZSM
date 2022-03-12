using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.Lookup.Modal;

namespace DCC.UMB.CDF.Lookup.Controller
{
    internal class LookupColumnPredicate
    {
        private string caption;
        private string sqlName;
        private string aliasName;
        private string toolTipText;
        private bool isDisplayMemberColumn = false;
        private bool isValueMemberColumn = false;
        private bool isCodeMemberColumn = false;
        public bool IsDisplayMemberColumn
        {
            get { return isDisplayMemberColumn; }
            set { isDisplayMemberColumn = value; }
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
        public bool Compare(LookupColumn column)
        {
            bool check = true;
            if (this.caption != null)
            {
                check = check && this.caption == column.Caption;
                if (!check) return check;
            }
            if (this.sqlName != null)
            {
                check = check && this.sqlName == column.SqlName;
                if (!check) return check;
            }
            if (this.aliasName != null)
            {
                check = check && this.aliasName == column.AliasName;
                if (!check) return check;
            }
            if (this.toolTipText != null)
            {
                check = check && this.toolTipText == column.ToolTipText;
                if (!check) return check;
            }
            if (this.isDisplayMemberColumn)
            {
                check = check && this.isDisplayMemberColumn == column.IsDisplayMemberColumn;
                if (!check) return check;
            }
            if (this.isCodeMemberColumn)
            {
                check = check && this.isCodeMemberColumn == column.IsCodeMemberColumn;
                if (!check) return check;
            }
            if (this.isValueMemberColumn)
            {
                check = check && this.isValueMemberColumn == column.IsValueMemberColumn;
                if (!check) return check;
            }

            return check;
        }
    }
}
