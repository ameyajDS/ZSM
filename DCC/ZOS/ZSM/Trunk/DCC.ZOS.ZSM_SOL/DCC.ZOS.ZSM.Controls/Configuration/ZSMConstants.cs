using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DCC.ZOS.ZSM.Controls.Configuration
{
    public class ZSMConstants
    {
        public static int DEFAULT_INTEGER_VALUE = 0;

        public static string ROW_STATE_COLUMN_NAME = "DCC.UMB.CDF.UIControls.Grid.GridDataModel.RowStateColumn";

        public static string ROW_GUID_COLUMN_NAME = "DCC.UMB.CDF.UIControls.Grid.GridDataModel.RowGUIDColumn";

        public static string PACKAGE_ID = "ZSM";

        private static DataTable ZSMDataTypesTable = null;

        public static DataTable GetZSMDataTypesTable()
        {
            if (ZSMDataTypesTable == null)
            {
                ZSMDataTypesTable = new DataTable();
                ZSMDataTypesTable.Columns.Add("type_nm", typeof(string));
                ZSMDataTypesTable.Columns.Add("type", typeof(string));
                DataRow row = ZSMDataTypesTable.NewRow();
                row["type_nm"] = "Text";
                row["type"] = "T";
                ZSMDataTypesTable.Rows.Add(row);

                row = ZSMDataTypesTable.NewRow();
                row["type_nm"] = "Integer";
                row["type"] = "I";
                ZSMDataTypesTable.Rows.Add(row);

                row = ZSMDataTypesTable.NewRow();
                row["type_nm"] = "Real";
                row["type"] = "R";
                ZSMDataTypesTable.Rows.Add(row);

                row = ZSMDataTypesTable.NewRow();
                row["type_nm"] = "DateTime";
                row["type"] = "D";
                ZSMDataTypesTable.Rows.Add(row);

                ZSMDataTypesTable.AcceptChanges();

            }
            return ZSMDataTypesTable;
        }
    }

    public enum SewadarStatusSysInfoCode
    {
        All = 1,
        RegularSewadar = 2
    }
}