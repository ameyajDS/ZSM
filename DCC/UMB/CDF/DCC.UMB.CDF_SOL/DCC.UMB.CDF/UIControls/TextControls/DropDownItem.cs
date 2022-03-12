using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Reflection;
using IList = System.Collections.IList;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    public class DropDownItem
    {
        private object displayMember;//This is the value which will be shown to user.
        private object valueMember;//This is the value which is stored as the chosen data in th egrid
        private object item;//This is the actual item which is converted to this DropDownItem

        public DropDownItem(object displayMember, object valueMember, object item)
        {
            this.DisplayMember = displayMember;
            this.ValueMember = valueMember;
            this.item = item;
        }

        public object DisplayMember
        {
            get { return displayMember; }
            set { displayMember = value; }
        }

        public object ValueMember
        {
            get { return valueMember; }
            set { valueMember = value; }
        }

        public object Item
        {
            get { return item; }
            set { item = value; }
        }

        public override string ToString()
        {
            return displayMember.ToString();
        }
       
        public static List<DropDownItem> GenerateDropDownItems(DataTable dataSourceTable, string displayMemberName, string valueMemberName)
        {
            return GenerateDropDownItems(dataSourceTable, displayMemberName, valueMemberName, true);
        }
       
        /// <summary>
        /// This method generated DropDown items from given datasource, displayMemberName and valueMemberName
        /// </summary>
        /// <param name="dataSourceTable">A DataTable used as source</param>
        /// <param name="displayMemberName">Name of the column in the DataTable used as displayMember</param>
        /// <param name="valueMemberName">Name of the column in DataTable used as valueMember</param>
        /// <returns></returns>
         public static List<DropDownItem> GenerateDropDownItems(DataTable dataSourceTable, string displayMemberName, string valueMemberName, bool createNullItem)
        {
             return GenerateDropDownItems(dataSourceTable, displayMemberName, valueMemberName, createNullItem, null);
        }
        public static List<DropDownItem> GenerateDropDownItems(DataTable dataSourceTable, string displayMemberName, string valueMemberName, bool createNullItem, string nullItemDisplayText)
        {
            try
            {
                //[[If passed in datasourceTable is null, then set the datasource of the embedded combox to null and go on.
                if (dataSourceTable == null)
                {
                    return null;
                }
                //]]
                IListSource src = (IListSource)dataSourceTable;
                IList lst = src.GetList();
                List<DropDownItem> items = CreateItemsFromIList(displayMemberName, valueMemberName, lst, createNullItem, nullItemDisplayText);
                return items;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private static List<DropDownItem> CreateItemsFromIList(string displayMemberName, string valueMemberName, IList lst, bool createNullItem, string nullItemDisplayText)
        {
            List<DropDownItem> items = new List<DropDownItem>();

            if (createNullItem)
            {
                nullItemDisplayText = string.IsNullOrEmpty(nullItemDisplayText) ? "......." : nullItemDisplayText;
                items.Add(new DropDownItem(nullItemDisplayText, null, null));
            }

            foreach (object item in lst)
            {
                object displayMember = item.GetType().GetProperty("Item", typeof(object), new Type[] { typeof(string) }).GetGetMethod().Invoke(item, new object[] { displayMemberName });
                object valueMember = item.GetType().GetProperty("Item", typeof(object), new Type[] { typeof(string) }).GetGetMethod().Invoke(item, new object[] { valueMemberName });
                items.Add(new DropDownItem(displayMember, valueMember, item));
            }
            return items;
        }
        
        public static List<DropDownItem> GenerateDropDownItems(ICollection dataSourceCollection, string displayMemberName, string valueMemberName)
        {
            return GenerateDropDownItems(dataSourceCollection, displayMemberName, valueMemberName, true);
        }

        public static List<DropDownItem> GenerateDropDownItems(ICollection dataSourceCollection, string displayMemberName, string valueMemberName, bool createNullItem)
        {
            return GenerateDropDownItems(dataSourceCollection, displayMemberName, valueMemberName, createNullItem, null);
        }
        public static List<DropDownItem> GenerateDropDownItems(ICollection dataSourceCollection, string displayMemberName, string valueMemberName, bool createNullItem, string nullItemDisplayText)
        {
            try
            {
                //[[If passed in dataSourceCollection is null, then set the datasource of the embedded combox to null and go on.
                if (dataSourceCollection == null)
                {
                    return null;
                }
                //]]
                ICollection col = (ICollection)dataSourceCollection;
                List<DropDownItem> items = new List<DropDownItem>();

                if (createNullItem)
                {
                    nullItemDisplayText = string.IsNullOrEmpty(nullItemDisplayText) ? "......." : nullItemDisplayText;
                    items.Add(new DropDownItem(nullItemDisplayText, null, null));
                }

                foreach (object item in col)
                {
                    PropertyInfo displayMemberPropertyInfo = item.GetType().GetProperty(displayMemberName);
                    MethodInfo displayMemberMethodInfo = null;
                    if (displayMemberPropertyInfo != null)
                    {
                        displayMemberMethodInfo = displayMemberPropertyInfo.GetGetMethod();
                    }
                    else
                    {
                        displayMemberMethodInfo = item.GetType().GetMethod(displayMemberName, new Type[] { });
                    }
                    PropertyInfo valueMemberPropertyInfo = item.GetType().GetProperty(valueMemberName);
                    MethodInfo valueMemberMethodInfo = null;
                    if (valueMemberPropertyInfo != null)
                    {
                        valueMemberMethodInfo = valueMemberPropertyInfo.GetGetMethod();
                    }
                    else
                    {
                        valueMemberMethodInfo = item.GetType().GetMethod(valueMemberName, new Type[] { });
                    }
                    object displayMember = displayMemberMethodInfo.Invoke(item, null);
                    object valueMember = valueMemberMethodInfo.Invoke(item, null);
                    items.Add(new DropDownItem(displayMember, valueMember, item));
                }
                return items;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
