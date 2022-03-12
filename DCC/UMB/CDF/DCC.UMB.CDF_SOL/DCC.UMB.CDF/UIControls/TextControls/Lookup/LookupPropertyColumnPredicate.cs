using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;

namespace DCC.UMB.CDF.UIControls.TextControls.Lookup
{
    class LookupPropertyColumnPredicate
    {
        private bool isDisplayMember = false;
        private bool isValueMember = false;
        private string sqlName = null;
        private string aliasName = null;
        private string caption = null;

        public string Caption
        {
            get { return caption; }
            set { caption = value; }
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
        public bool IsDisplayMember
        {
            get { return isDisplayMember; }
            set { isDisplayMember = value; }
        }
        
        public bool IsValueMember
        {
            get { return isValueMember; }
            set { isValueMember = value; }
        }
        public bool Compare(LookupPropertyColumn column)
        {
            bool check = true;
            if (this.isDisplayMember)
            {
                check = check && this.isDisplayMember == column.IsDisplayMemberColumn;
                if (!check) return check;
            }
            if (this.isValueMember)
            {
                check = check && this.isValueMember == column.IsValueMemberColumn;
                if (!check) return check;
            }
            if (this.aliasName != null)
            {
                check = check && this.aliasName == column.AliasName;
                if (!check) return check;
            }
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

            return check;
        }
    }
}
