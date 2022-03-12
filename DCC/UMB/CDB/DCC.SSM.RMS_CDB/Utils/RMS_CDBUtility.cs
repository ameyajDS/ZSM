using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DCC.UMB.CDF;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.View.Menu;
using System.Configuration;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls;
using System.IO;
using DCC.DBFacade;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Drawing2D;


namespace DCC.SSM.CDB2.Utils
{
    
    public class CDBUtility
    {
        public static bool CompareTwoDCCDateTimeField(DCCDateTimeField DateField_1, DCCDateTimeField DateField_2, string screenId, UIModes screenMode)
        {
            if (DateField_1.DisplayText != null && DateField_2.DisplayText != null)
            {
                DateTime Date_1 = DateTime.Parse(DateField_1.DisplayText);
                DateTime Date_2 = DateTime.Parse(DateField_2.DisplayText);

                if (Date_2 < Date_1)
                {
                    UIManager.ShowMessage(MsgCodes.GreaterValueReqd, "Effective Till|Effective From", MessageTypes.Warning, screenId, screenMode);
                    return false;
                }
            }
            else
            {
                UIManager.ShowMessage("Blank Values Not Accepted in Date Fields", string.Empty, MessageTypes.Error, screenId, screenMode);
                return false;
            }
            return true;
        }
        public static string Delete_Operation
        {

            get { return ConfigurationSettings.AppSettings["DELETE/REMOVE"]; }

        }

        public static string Modify_Operation
        {

            get { return ConfigurationSettings.AppSettings["MODIFY/UPDATE"]; }

        }

        public static string Insert_Operation
        {
            get { return ConfigurationSettings.AppSettings["ADD/INSERT"]; }

        }
        public static DateTime GetDateTime(DataRow row, string columnName)
        {
            object value = row[columnName];
            return isNull(value) ? DateTime.Now : (DateTime)value;
        }

        private static bool isNull(object value)
        {
            return value == null || value == DBNull.Value;
        }

        public static int GetInt(DataRow row, string columnName)
        {
            object value = row[columnName];
            return isNull(value) ? -1 : int.Parse(value.ToString());
        }

        public static short GetShort(DataRow row, string columnName)
        {
            object value = row[columnName];
            return isNull(value) ? (short)-1 : short.Parse(value.ToString());
        }

        public static bool GetBool(DataRow row, string columnName)
        {
            object value = row[columnName];
            try
            {
                return isNull(value) ? false : bool.Parse(value.ToString());
            }
            catch
            {
                return value.ToString().ToUpper().Equals("YES");
            }
        }

        public static string GetString(DataRow row, string columnName)
        {
            object value = row[columnName];
            return isNull(value) ? null : value.ToString();
        }

        public static char GetChar(DataRow row, string columnName)
        {
            object value = row[columnName];
            return isNull(value) ? ' ' : (char)value;
        }

    }
}
