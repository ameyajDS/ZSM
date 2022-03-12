using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Resources;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.Properties;
using DCC.UMB.CDF.UIControls;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.Windows;
using System.Data.SqlClient;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.DB;
using System.ComponentModel;

namespace DCC.UMB.CDF.Utils
{
    /// <summary>
    /// Summary description for UtilityManagerWS
    /// </summary>
    public class UtilityManager
    {
        /// <summary>
        /// Returns true if the passed character is 'y' or 'Y'
        /// </summary>
        /// <param name="ch"></param>
        /// <returns></returns>
        public static bool GetBooleanValue(char ch)
        {
            return char.ToUpper(ch) == 'Y';
        }

        /// <summary>
        /// Returns 'Y' if the passed in value is true, else 'N'
        /// </summary>
        /// <param name="boolValue"></param>
        /// <returns></returns>
        internal static char GetCharValue(bool boolValue)
        {
            return boolValue ? 'Y' : 'N';
        }

        /// <summary>
        /// Gets an integer from the passed in object. if the object is null, a -1 is returned
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        internal static int GetInteger(object value)
        {
            return IsNotNull(value) ? (int)value : 0;
        }
        internal static bool IsNotNull(object value)
        {
            return value != DBNull.Value && value != null;
        }

        public static bool ValidateAllControlsofContainer(Control container, params Control[] containersToExclude)
        {
            List<Control> lstControls = new List<Control>();
            UtilityManager.GetAllControlsInContainer(container, lstControls, containersToExclude);
            foreach (Control ctrl in lstControls)
            {
                if (!ValidateControl(ctrl))
                {
                    return false;
                }
            }
            return true;
        }

        public static void MarkControlsReadonly(Control container, bool isReadOnly, params Control[] controlsToIgnore)
        {
            List<Control> lstAllControls = new List<Control>();
            GetAllControlsInContainer(container, lstAllControls);
            MarkControlsReadonly(lstAllControls, isReadOnly, controlsToIgnore);
        }

        public static void MarkControlsReadonly(List<Control> lstControls, bool isReadOnly, params Control[] controlsToIgnore)
        {
            List<Control> lstToIgnore = new List<Control>();
            lstToIgnore.AddRange(controlsToIgnore);
            MarkControlsReadonly(lstControls, isReadOnly, lstToIgnore);
        }
        
        public static void MarkControlsReadonly(List<Control> lstControls, bool isReadOnly, List<Control> lstToIgnore)
        {            
            foreach (Control ctrl in lstControls)
            {
                if(lstToIgnore.Contains(ctrl))continue;
                if(ctrl is IDCCControl)
                {
                    ((IDCCControl)ctrl).ReadOnly = isReadOnly;
                }
            }
        }
         public static void MarkControlsMandatory(Control container, bool isMandatory, params Control[] controlsToIgnore)
        {
            List<Control> lstAllControls = new List<Control>();
            GetAllControlsInContainer(container, lstAllControls);
            MarkControlsMandatory(lstAllControls, isMandatory);
        }
        public static void MarkControlsMandatory(List<Control> lstControls, bool isMandatory, params Control[] controlsToIgnore)
        {
            List<Control> lstToIgnore = new List<Control>();
            lstToIgnore.AddRange(controlsToIgnore);
            MarkControlsMandatory(lstControls, isMandatory, controlsToIgnore);
        }
        private static void MarkControlsMandatory(List<Control> lstControls, bool isMandatory, List<Control> lstToIgnore)
        {            
            foreach (Control ctrl in lstControls)
            {
                if (lstToIgnore.Contains(ctrl)) continue;
                if (ctrl is IDCCControl)
                {
                    ((IDCCControl)ctrl).Mandatory = isMandatory;
                }
            }
        }
       
        private static bool ValidateControl(Control ctrl)
        {
            bool returnValue = true;
            if (ctrl.Enabled == false) return true;
            if (ctrl is IDCCControl)
            {
                returnValue = ((IDCCControl)ctrl).IsValid();
            }
            //if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCTextField)))
            //{
            //    returnValue = ((DCCTextField)ctrl).IsValid(true);
            //}
            //else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCComboBox)))
            //{
            //    returnValue = ((DCCComboBox)ctrl).IsValid(true);
            //}
            //else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCListBox)))
            //{
            //    returnValue = ((DCCListBox)ctrl).IsValid(true);
            //}
            //else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCGrid)))
            //{
            //    AbstractScreen screen = GetContainerScreen(ctrl);

            //    if (screen!=null && screen.IsListViewGridAvailableInChildScreen())
            //    {
            //        if (ctrl != screen.ListViewGrid)
            //        {
            //            returnValue = ((DCCGrid)ctrl).IsReadyToSave();
            //        }
            //    }
            //    else
            //    {
            //        returnValue = ((DCCGrid)ctrl).IsReadyToSave();
            //    }
            //}
            //else if (UtilityManager.IsAssignableTo(ctrl, typeof(SummaryDetailNavigator)))
            //{
            //    returnValue = ((SummaryDetailNavigator)ctrl).PrepareForSave();
            //}
            //else if (UtilityManager.IsAssignableTo(ctrl, typeof(DateRangePair)))
            //{
            //    returnValue = ((DateRangePair)ctrl).IsValid();
            //}
            //else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCImageBox)))
            //{
            //    returnValue = ((DCCImageBox)ctrl).IsValid(true);
            //}
            if (!returnValue)
            {
                Logger.Debug(string.Format("ValidateControl of control: [{0}] returned with false value", ctrl.Name));
            }
            return returnValue;
        }

        public static AbstractScreen GetContainerScreen(Control control)
        {
            if (control == null || control.Parent == null) return null;
            Control parentControl = control.Parent;

            if (parentControl != null && (
                parentControl.GetType().BaseType.Equals(typeof(AbstractScreen)) ||
                IsAssignableTo(parentControl, typeof(AbstractScreen))))
            {
                return (AbstractScreen)parentControl;
            }
            else
            {
                return GetContainerScreen(parentControl);
            }
        }

        public static Form GetContainerForm(Control control)
        {
            if (control == null || control.Parent == null) return null;
            Control parentControl = control.Parent;

            if (parentControl != null && parentControl.GetType().BaseType == typeof(Form))
            {
                return (Form)parentControl;
            }
            else
            {
                return GetContainerForm(parentControl);
            }
        }

        internal static DateTime GetWebServerCurrentDateTime()
        {
            return DateTime.Now;
        }

        public static DataTable SelectDistinct(DataTable sourceTable, params string[] fieldNames)
        {
            object[] lastValues;
            DataTable newTable;
            DataRow[] orderedRows;

            if (fieldNames == null || fieldNames.Length == 0)
                throw new ArgumentNullException("FieldNames");

            lastValues = new object[fieldNames.Length];
            newTable = new DataTable();

            foreach (string fieldName in fieldNames)
                newTable.Columns.Add(fieldName, sourceTable.Columns[fieldName].DataType);

            orderedRows = sourceTable.Select("", string.Join(", ", fieldNames));

            foreach (DataRow row in orderedRows)
            {
                if (!FieldValuesAreEqual(lastValues, row, fieldNames))
                {
                    newTable.Rows.Add(CreateRowClone(row, newTable.NewRow(), fieldNames));

                    SetLastValues(lastValues, row, fieldNames);
                }
            }

            return newTable;
        }

        private static bool FieldValuesAreEqual(object[] lastValues, DataRow currentRow, string[] fieldNames)
        {
            bool areEqual = true;

            for (int i = 0; i < fieldNames.Length; i++)
            {
                if (lastValues[i] == null || !lastValues[i].Equals(currentRow[fieldNames[i]]))
                {
                    areEqual = false;
                    break;
                }
            }

            return areEqual;
        }

        private static DataRow CreateRowClone(DataRow sourceRow, DataRow newRow, string[] fieldNames)
        {
            foreach (string field in fieldNames)
                newRow[field] = sourceRow[field];

            return newRow;
        }

        private static void SetLastValues(object[] lastValues, DataRow sourceRow, string[] fieldNames)
        {
            for (int i = 0; i < fieldNames.Length; i++)
                lastValues[i] = sourceRow[fieldNames[i]];
        }

        public static void SetPropertyValue(object obj, string propertyName, object value)
        {
            Type t = obj.GetType();
            System.Reflection.PropertyInfo pi;
            try
            {
                pi = t.GetProperty(propertyName);

            }
            catch (Exception ex)
            {
                throw new Exception("Invalid property:" + propertyName, ex);
            }
            if (pi == null)
            {
                throw new Exception(
                    string.Format("Could not find property {0} in obj {1}", propertyName, obj));
            }
            try
            {
                if (pi.CanWrite)
                {
                    pi.SetValue(obj, value, null);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("No getter for:" + propertyName, ex);
            }
        }
        internal static string GetUIModeCodeForLogging(UIModes uiMode)
        {
            switch (uiMode)
            {
                case UIModes.Insert:
                    return "I";
                case UIModes.Query:
                    return "Q";
                case UIModes.Retrieve:
                    return "V";
                case UIModes.Browse:
                    return "B";
                case UIModes.List:
                    return "L";
                case UIModes.New:
                    return "N";
                case UIModes.Update:
                    return "U";
                case UIModes.Reference:
                    return "F";
                case UIModes.Params:
                    return "P";
                case UIModes.Report:
                    return "R";
                case UIModes.Tabular:
                    return "T";
                case UIModes.None:
                    return null;
                default:
                    return null;
            }
        }
        public static object GetPropertyValue(object obj, string propertyName)
        {
            Type t = obj.GetType();
            System.Reflection.PropertyInfo pi;
            try
            {
                pi = t.GetProperty(propertyName);

            }
            catch (Exception ex)
            {
                throw new Exception("Invalid property:" + propertyName, ex);
            }
            if (pi == null)
            {
                throw new Exception(
                    string.Format("Could not find property {0} in obj {1}", propertyName, obj));
            }
            try
            {
                return pi.GetValue(obj, null);
            }
            catch (Exception ex)
            {
                throw new Exception("No getter for:" + propertyName, ex);
            }
        }
        public static string FormMessageTokens(params string[] tokens)
        {
            string msgTokens = "";
            foreach (string token in tokens)
            {
                msgTokens = msgTokens + token + "|";
            }
            if (msgTokens.EndsWith("|"))
            {
                msgTokens = msgTokens.Substring(0, msgTokens.Length - 1);
            }
            return msgTokens;
        }
        internal static bool IsStrictlyAssignableTo(object anObject, Type targetType)
        {
            return targetType.FullName == anObject.GetType().FullName;
        }
        internal static bool IsAssignableTo(object anObject, Type targetType)
        {
           return  IsAssignableToType(anObject.GetType(), targetType);            
        }
        internal static bool IsAssignableToType(Type anObjectType, Type targetType)
        {
            try
            {
                return anObjectType == targetType ||
                           anObjectType.BaseType == targetType ||
                           anObjectType.BaseType.BaseType == targetType ||
                           anObjectType.BaseType.BaseType.BaseType == targetType ||
                           anObjectType.BaseType.BaseType.BaseType.BaseType == targetType ||
                           anObjectType.BaseType.BaseType.BaseType.BaseType.BaseType == targetType ||
                           anObjectType.BaseType.BaseType.BaseType.BaseType.BaseType.BaseType == targetType;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Returns "Yes" or "No" based upon the boolean passed
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        public static string GetBlnString(bool b)
        {
            return b ? "Yes" : "No";
        }

        /// <summary>
        /// Casts the passed object into boolean, return "Yes" or "No" baed upon the value of the boolean 
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        public static string GetBlnString(object b)
        {
            bool bol = (bool)b;
            return bol ? "Yes" : "No";
        }

        /// <summary>
        /// Returns a boolean from a string. The string must have one of these values. "Yes", "No". 
        /// Returns true of specified string is "Yes" else false.
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        public static bool GetBlnFromBlnString(string b)
        {
            return b.ToUpper().Equals("YES") ? true : false;
        }

        /// <summary>
        /// This method checks if the given string stringToValidate is in accordance with the specified regularExpression.
        /// </summary>
        /// <param name="regularExpression"></param>
        /// <param name="stringToValidate"></param>
        /// <returns></returns>
        internal static bool ValidateStringAgainstRegx(string regularExpression, string stringToValidate)
        {
            System.Text.RegularExpressions.Regex objRegex = new System.Text.RegularExpressions.Regex(regularExpression);

            return objRegex.IsMatch(stringToValidate);
        }


        public static string GetUserFriendlyCaptionFromDatabaseObjectName(string name)
        {
            try
            {
                //get the name by removing the "_" characters with space and making
                //first letter of each token to uppercase
                string[] tokens = name.Split(new char[] { '_' });
                StringBuilder sb = new StringBuilder();
                foreach (string str in tokens)
                {
                    string token = str;
                    if (str.Equals("nm", StringComparison.InvariantCultureIgnoreCase))
                    {
                        token = "Name";
                    }
                    else if (str.Equals("cd", StringComparison.InvariantCultureIgnoreCase))
                    {
                        token = "Code";
                    }
                    else if (str.Equals("dt", StringComparison.InvariantCultureIgnoreCase))
                    {
                        token = "Date";
                    }
                    else if (str.Equals("dtm", StringComparison.InvariantCultureIgnoreCase))
                    {
                        token = "Date";
                    }
                    else if (str.Equals("no", StringComparison.InvariantCultureIgnoreCase))
                    {
                        token = "No.";
                    }
                    else if (str.Equals("dsc", StringComparison.InvariantCultureIgnoreCase))
                    {
                        token = "Desc.";
                    }
                    else if (str.Equals("sq", StringComparison.InvariantCultureIgnoreCase))
                    {
                        token = "Seq.";
                    }
                    else if (str.Equals("seq", StringComparison.InvariantCultureIgnoreCase))
                    {
                        token = "Seq.";
                    }
                    //if(string.Equal(token,"nm",))
                    string firstChar = token.Substring(0, 1);
                    sb.Append(" " + firstChar.ToUpper() + token.Substring(1));
                }
                return sb.ToString().Trim();
            }
            catch (Exception ex)
            {
                return name;
            }
        }

        /// <summary>
        /// This function returns a datetime object by parsing the string passed to it. 
        /// The ideal scenario is to have a string having 3 parts in sequence i.e. day, month and year
        /// e.g. 26/03/2008. The separater character can by anyting out of these ['/', '.', '\', ' ', '-', '_']
        /// The day part must be speficied, ther other two parts viz, month and year are optional in the input string
        /// and current system month and year is taken into consideration.
        /// The month can be specified as a number or as a 3 letter code of month e.g. JAN or jan for specifying the month of January
        /// </summary>
        /// <param name="strDate">A string roughly defining a date as specified in the summary of this method.</param>
        /// <returns></returns>
        public static DateTime GetDateFromString(string strDate)
        {
            strDate = strDate.Trim();//remove all leading and trailing spaces.
            //[[Now if strDate has presense of a ':' then that means it has time info as well
            //take out the time part out of it. The assumption is that the time piece is written after a space/
            //e.g. "19 DEC 2010 12:18pm" or "19 DEC 2010 12:18 pm"
            //to fetch out the time part, take out the piece which is matching with regular expression
            //(01|02|03|04|05|06|07|08|09|10|11|12):[0-5][0-9] ?(AM|PM|am|pm)
            string strTimePart = "";
            string pattern = "(1|2|3|4|5|6|7|8|9|01|02|03|04|05|06|07|08|09|10|11|12):(0|1|2|3|4|5|6|7|8|9|00|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59) ?(a|p|A|P|AM|PM|am|pm)$";
            Regex timeRegx = new Regex(pattern);
            Match m = timeRegx.Match(strDate);
            
            if (m != null && m.Success)//i.e. the time piece is present
            {
                strTimePart = m.ToString();
                strDate = strDate.Replace(strTimePart, "").Trim();
            }            
            //]]
            try
            {
                //example "19 DEC 2010" or "19 DEC 2010 12:18pm"
                //[[first normalize the date to a tokenized text of.only 
                strDate = strDate.Trim();
                strDate = strDate.Replace(" ", ".");
                strDate = strDate.Replace("_", ".");
                strDate = strDate.Replace("-", ".");
                strDate = strDate.Replace("/", ".");
                strDate = strDate.Replace("\\", ".");
                //]]
                string[] tokens = strDate.Split(new char[] { '.' });
                if (tokens.Length > 3)
                {
                    throw new Exception("Invlaid date format!");
                }
                string[] formedTokens = new string[3];
                int i = 0;
                foreach (string token in tokens)
                {
                    formedTokens[i] = token;
                    i++;
                }

                if (tokens.Length < 3)
                {
                    if (formedTokens[2] == null)
                    {
                        formedTokens[2] = DateTime.Now.Year.ToString();
                    }
                    if (formedTokens[1] == null)
                    {
                        formedTokens[1] = DateTime.Now.Month.ToString();
                    }
                }
                if (formedTokens[2].Length > 4 || formedTokens[2].Length < 1)
                {
                    throw new Exception("Invlaid date format!");
                }
                int resultingNumber = -1;
                if (!(int.TryParse(formedTokens[0], out resultingNumber) && int.TryParse(formedTokens[2], out resultingNumber)))
                {
                    throw new Exception("Invlaid date fomrat!");
                }
                int day, year;
                string month;
                day = int.Parse(formedTokens[0]);
                year = int.Parse(formedTokens[2]);
                month = formedTokens[1];

                if (formedTokens[2].Length < 4)
                {
                    if (year < 80)
                    {
                        year = 2000 + year;
                    }
                    else
                    {
                        year = 1900 + year;
                    }
                }


                try
                {
                    DateTime dt;
                    CultureInfo culture = CultureInfo.CreateSpecificCulture("en-US");
                    if (IsNumeric(month))
                    {
                        dt =
                            DateTime.Parse(string.Format("{1} {0} {2}", day.ToString(), month, year.ToString()), culture, DateTimeStyles.None);

                    }
                    else
                    {
                        dt =
                            DateTime.Parse(string.Format("{0} {1} {2}", day.ToString(), month, year.ToString()), culture, DateTimeStyles.None);

                    }
                    dt = DateTime.Parse(dt.ToString(DCC.UMB.CDF.Configuration.Constants.DATE_FORMAT) + " " + strTimePart);
                    return dt;
                }
                catch (Exception)
                {
                    throw;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        /// <summary>
        /// Returns if the given object is a numeric (int, double, float, decimal etc)
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static bool IsNumeric(object obj)
        {
            if (obj == null)
            {
                return false;
            }
            // Variable to collect the Return value of the TryParse method.
            bool isNum;

            // Define variable to collect out parameter of the TryParse method. If the conversion fails, the out parameter is zero.
            double retNum;

            // The TryParse method converts a string in a specified style and culture-specific format to its double-precision floating point number equivalent.
            // The TryParse method does not generate an exception if the conversion fails. If the conversion passes, True is returned. If it does not, False is returned.
            isNum = Double.TryParse(Convert.ToString(obj), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
            return isNum;
        }

        public static string ConvertContentsToPascalCase(string contents)
        {
            if (string.IsNullOrEmpty(contents.Trim())) return contents;

            List<char> punChars = new List<char>();
            for (int i = 0; i <= 64; i++)
            {
                punChars.Add((char)i);
                //Console.WriteLine("i={0} : char=[{1}]", i.ToString(), ((char)(i)).ToString());
            }
            for (int i = 91; i <= 96; i++)
            {
                punChars.Add((char)i);
                //Console.WriteLine("i={0} : char=[{1}]", i.ToString(), ((char)(i)).ToString());
            }
            for (int i = 123; i <= 255; i++)
            {
                punChars.Add((char)i);
                //Console.WriteLine("i={0} : char=[{1}]", i.ToString(), ((char)(i)).ToString());
            }
            char[] chars = contents.ToCharArray();
            if (!punChars.Contains(chars[0]))//make the first character in upper case
            {
                chars[0] = char.ToUpper(chars[0]);
            }
            for (int i = 1; i < chars.Length; i++)//now make all the characters followed by each of the punctuation mark
            {
                if (punChars.Contains(chars[i - 1]) && !punChars.Contains(chars[i]))
                {
                    chars[i] = char.ToUpper(chars[i]);
                }
            }
            return new string(chars);
        }
        public static void ExportDataTableToExcel(DataTable sourceTable, string fileName)
        {

            System.IO.StreamWriter excelDoc;

            excelDoc = new System.IO.StreamWriter(fileName);
            const string startExcelXML = "<xml version>\r\n<Workbook " +
                  "xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\"\r\n" +
                  " xmlns:o=\"urn:schemas-microsoft-com:office:office\"\r\n " +
                  "xmlns:x=\"urn:schemas-    microsoft-com:office:" +
                  "excel\"\r\n xmlns:ss=\"urn:schemas-microsoft-com:" +
                  "office:spreadsheet\">\r\n <Styles>\r\n " +
                  "<Style ss:ID=\"Default\" ss:Name=\"Normal\">\r\n " +
                  "<Alignment ss:Vertical=\"Bottom\"/>\r\n <Borders/>" +
                  "\r\n <Font/>\r\n <Interior/>\r\n <NumberFormat/>" +
                  "\r\n <Protection/>\r\n </Style>\r\n " +
                  "<Style ss:ID=\"BoldColumn\">\r\n <Font " +
                  "x:Family=\"Swiss\" ss:Bold=\"1\"/>\r\n </Style>\r\n " +
                  "<Style     ss:ID=\"StringLiteral\">\r\n <NumberFormat" +
                  " ss:Format=\"@\"/>\r\n </Style>\r\n <Style " +
                  "ss:ID=\"Decimal\">\r\n <NumberFormat " +
                  "ss:Format=\"0.0000\"/>\r\n </Style>\r\n " +
                  "<Style ss:ID=\"Integer\">\r\n <NumberFormat " +
                  "ss:Format=\"0\"/>\r\n </Style>\r\n <Style " +
                  "ss:ID=\"DateLiteral\">\r\n <NumberFormat " +
                  "ss:Format=\"mm/dd/yyyy;@\"/>\r\n </Style>\r\n " +
                  "</Styles>\r\n ";
            const string endExcelXML = "</Workbook>";

            int rowCount = 0;
            int sheetCount = 1;
            /*
           <xml version>
           <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
           xmlns:o="urn:schemas-microsoft-com:office:office"
           xmlns:x="urn:schemas-microsoft-com:office:excel"
           xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
           <Styles>
           <Style ss:ID="Default" ss:Name="Normal">
             <Alignment ss:Vertical="Bottom"/>
             <Borders/>
             <Font/>
             <Interior/>
             <NumberFormat/>
             <Protection/>
           </Style>
           <Style ss:ID="BoldColumn">
             <Font x:Family="Swiss" ss:Bold="1"/>
           </Style>
           <Style ss:ID="StringLiteral">
             <NumberFormat ss:Format="@"/>
           </Style>
           <Style ss:ID="Decimal">
             <NumberFormat ss:Format="0.0000"/>
           </Style>
           <Style ss:ID="Integer">
             <NumberFormat ss:Format="0"/>
           </Style>
           <Style ss:ID="DateLiteral">
             <NumberFormat ss:Format="mm/dd/yyyy;@"/>
           </Style>
           </Styles>
           <Worksheet ss:Name="Sheet1">
           </Worksheet>
           </Workbook>
           */
            excelDoc.Write(startExcelXML);
            excelDoc.Write("<Worksheet ss:Name=\"Sheet" + sheetCount + "\">");
            excelDoc.Write("<Table>");
            excelDoc.Write("<Row>");
            for (int x = 0; x < sourceTable.Columns.Count; x++)
            {
                excelDoc.Write("<Cell ss:StyleID=\"BoldColumn\"><Data ss:Type=\"String\">");
                excelDoc.Write(sourceTable.Columns[x].ColumnName);
                excelDoc.Write("</Data></Cell>");
            }
            excelDoc.Write("</Row>");
            foreach (DataRow x in sourceTable.Rows)
            {
                rowCount++;
                //if the number of rows is > 64000 create a new page to continue output
                if (rowCount == 64000)
                {
                    rowCount = 0;
                    sheetCount++;
                    excelDoc.Write("</Table>");
                    excelDoc.Write(" </Worksheet>");
                    excelDoc.Write("<Worksheet ss:Name=\"Sheet" + sheetCount + "\">");
                    excelDoc.Write("<Table>");
                }
                excelDoc.Write("<Row>"); //ID=" + rowCount + "
                for (int y = 0; y < sourceTable.Columns.Count; y++)
                {
                    System.Type rowType;
                    rowType = x[y].GetType();
                    string XMLstring;
                    switch (rowType.ToString())
                    {
                        case "System.String":
                            XMLstring = x[y].ToString();
                            XMLstring = XMLstring.Trim();
                            XMLstring = XMLstring.Replace("&", "&amp;");
                            XMLstring = XMLstring.Replace(">", "&gt;");
                            XMLstring = XMLstring.Replace("<", "&lt;");
                            excelDoc.Write("<Cell ss:StyleID=\"StringLiteral\">" +
                                           "<Data ss:Type=\"String\">");
                            excelDoc.Write(XMLstring);
                            excelDoc.Write("</Data></Cell>");
                            break;
                        case "DCC.UMB.CDF.Lookup.Modal.LookupResult":
                            XMLstring = ((DCC.UMB.CDF.Lookup.Modal.LookupResult)x[y]).DisplayMember.ToString();
                            XMLstring = XMLstring.Trim();
                            XMLstring = XMLstring.Replace("&", "&");
                            XMLstring = XMLstring.Replace(">", ">");
                            XMLstring = XMLstring.Replace("<", "<");
                            excelDoc.Write("<Cell ss:StyleID=\"StringLiteral\">" +
                                           "<Data ss:Type=\"String\">");
                            excelDoc.Write(XMLstring);
                            excelDoc.Write("</Data></Cell>");
                            break;
                        case "System.DateTime":
                            //Excel has a specific Date Format of YYYY-MM-DD followed by  
                            //the letter 'T' then hh:mm:sss.lll Example 2005-01-31T24:01:21.000
                            //The Following Code puts the date stored in XMLDate 
                            //to the format above
                            DateTime XMLDate = (DateTime)x[y];
                            string XMLDatetoString = ""; //Excel Converted Date
                            XMLDatetoString = XMLDate.Year.ToString() +
                                 "-" +
                                 (XMLDate.Month < 10 ? "0" +
                                 XMLDate.Month.ToString() : XMLDate.Month.ToString()) +
                                 "-" +
                                 (XMLDate.Day < 10 ? "0" +
                                 XMLDate.Day.ToString() : XMLDate.Day.ToString()) +
                                 "T" +
                                 (XMLDate.Hour < 10 ? "0" +
                                 XMLDate.Hour.ToString() : XMLDate.Hour.ToString()) +
                                 ":" +
                                 (XMLDate.Minute < 10 ? "0" +
                                 XMLDate.Minute.ToString() : XMLDate.Minute.ToString()) +
                                 ":" +
                                 (XMLDate.Second < 10 ? "0" +
                                 XMLDate.Second.ToString() : XMLDate.Second.ToString()) +
                                 ".000";
                            excelDoc.Write("<Cell ss:StyleID=\"DateLiteral\">" +
                                         "<Data ss:Type=\"DateTime\">");
                            excelDoc.Write(XMLDatetoString);
                            excelDoc.Write("</Data></Cell>");
                            break;
                        case "System.Boolean":
                            excelDoc.Write("<Cell ss:StyleID=\"StringLiteral\">" +
                                        "<Data ss:Type=\"String\">");
                            excelDoc.Write(x[y].ToString());
                            excelDoc.Write("</Data></Cell>");
                            break;
                        case "System.Int16":
                        case "System.Int32":
                        case "System.Int64":
                        case "System.Byte":
                            excelDoc.Write("<Cell ss:StyleID=\"Integer\">" +
                                    "<Data ss:Type=\"Number\">");
                            excelDoc.Write(x[y].ToString());
                            excelDoc.Write("</Data></Cell>");
                            break;
                        case "System.Decimal":
                        case "System.Double":
                            excelDoc.Write("<Cell ss:StyleID=\"Decimal\">" +
                                  "<Data ss:Type=\"Number\">");
                            excelDoc.Write(x[y].ToString());
                            excelDoc.Write("</Data></Cell>");
                            break;
                        case "System.DBNull":
                            excelDoc.Write("<Cell ss:StyleID=\"StringLiteral\">" +
                                  "<Data ss:Type=\"String\">");
                            excelDoc.Write("");
                            excelDoc.Write("</Data></Cell>");
                            break;
                        case "System.Byte[]":
                            excelDoc.Write("<Cell ss:StyleID=\"StringLiteral\">" +
                                  "<Data ss:Type=\"String\">");
                            excelDoc.Write("Binary Data");
                            excelDoc.Write("</Data></Cell>");
                            break;
                        default:
                            throw (new Exception(rowType.ToString() + " not handled."));
                    }
                }
                excelDoc.Write("</Row>");
            }
            excelDoc.Write("</Table>");
            excelDoc.Write(" </Worksheet>");
            excelDoc.Write(endExcelXML);
            excelDoc.Close();
        }

        /// <summary>
        /// Get the embedded resoruce from a file name, the file must be placed in the root of the proeject.
        /// </summary>
        /// <param name="type"></param>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static Stream GetEmbeddedFile(Type type, string fileName)
        {
            try
            {
                string assemblyName = type.Assembly.GetName().Name;
                return type.Assembly.GetManifestResourceStream(assemblyName+"."+ fileName);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Recurses through the container hierarchy and gets the list of all controls
        /// </summary>
        /// <param name="containerControl">The container control which needs to be looked into for children (recursively)</param>
        /// <param name="output">A list of Controls which will be populated with the child controls</param>
        /// <param name="containersToExclude">The containers or controls which needs to be exculded</param>
        public static void GetAllControlsInContainer(Control containerControl, List<Control> output, params Control[] containersToExclude)
        {
            if (containerControl.Controls == null || containerControl.Controls.Count <= 0)
            {
                return;
            }
            List<Control> lstContainersToExclude = new List<Control>();
            lstContainersToExclude.AddRange(containersToExclude);
            if (lstContainersToExclude.Contains(containerControl))
            {
                return;
            }

            foreach (Control control in containerControl.Controls)
            {
                if (lstContainersToExclude.Contains(control))
                {
                    continue;
                }
                output.Add(control);
                GetAllControlsInContainer(control, output, containersToExclude);
            }
            //[[ Now sort all the controls based upon TabIndex property
            output.Sort((new ControlTabIndexComparer()).Compare);
            //]]
        }
        public static System.Drawing.Bitmap GetCDFResourceImage(string resourceName)
        {
            global::System.Resources.ResourceManager resourceMan = new global::System.Resources.ResourceManager("DCC.UMB.CDF.Properties.Resources", typeof(Resources).Assembly);
            object obj = resourceMan.GetObject(resourceName, System.Globalization.CultureInfo.CurrentCulture);
            return ((System.Drawing.Bitmap)(obj));

        }
        /// <summary>
        /// This method clears all the controls on this screen which are of type DCCTextField or DCCGrid or DCCDropDown or DCCCheckBox type
        /// </summary>
        /// <param name="clearListGrid">A boolean specifying whether or not to clear the contents of List view Grid. Typically, if the screen is in Browse/List mode, this parameter should be false, else true.</param>
        /// <param name="container">The container whose sub controls needs to be cleared.</param>
        /// <param name="containerScreen">The instance of the abstract screen on thich the container to be cleared is hosted. This can set to null and CDF would figure it out, however with a performance  overhead. </param>
        /// <param name="controlsNotToBeCleared">Params list of controls which should be ignored.</param>
        public static void ClearAllControlsOfContainer(Control container, bool clearListGrid,AbstractScreen containerScreen, params Control[] controlsNotToBeCleared)
        {
            Control.ControlCollection controlCollection = container.Controls;
            List<Control> lstToBeIgnoredControls = new List<Control>();
            lstToBeIgnoredControls.AddRange(controlsNotToBeCleared);
            foreach (Control ctrl in controlCollection)
            {
                if (lstToBeIgnoredControls.Contains(ctrl)) continue;
                ClearControl(ctrl, clearListGrid,containerScreen, controlsNotToBeCleared);
            }
        }
        public static void ClearControl(Control ctrl, bool clearListGrid,AbstractScreen containerScreen, params Control[] controlsNotToBeCleared)
        {
            if (containerScreen == null)
            {
                containerScreen = UtilityManager.GetContainerScreen(ctrl);
            }
            if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCTextField)))
            {
                ((DCCTextField)ctrl).ClearControlValues();
            }
            else if (UtilityManager.IsAssignableTo(ctrl, typeof(DateRangePair)))
            {
                ((DateRangePair)ctrl).ClearControlValues();
            }
            else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCComboBox)))
            {
                ((DCCComboBox)ctrl).ClearControlValues();
            }
            else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCCheckBox)))
            {
                if (containerScreen.CurrentUIMode == UIModes.Query)
                {
                    ((DCCCheckBox)ctrl).ThreeState = true;
                    ((DCCCheckBox)ctrl).CheckState = CheckState.Indeterminate;
                }
                else
                {
                    ((DCCCheckBox)ctrl).ThreeState = false;
                    ((DCCCheckBox)ctrl).Checked = false;
                }
            }
            else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCGrid)))
            {
                if (containerScreen.IsListViewGridAvailableInChildScreen() && ctrl != containerScreen.ListViewGrid)
                {
                    ((DCCGrid)ctrl).RemoveAllRecords();
                }
            }
            else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCListBox)))
            {
                ((DCCListBox)ctrl).ClearControlValues();
            }
            else if (UtilityManager.IsAssignableTo(ctrl, typeof(SummaryDetailNavigator)))
            {
                ((SummaryDetailNavigator)ctrl).ClearControlValues();
            }
            else
            {
                ClearAllControlsOfContainer(ctrl, clearListGrid, containerScreen, controlsNotToBeCleared);
            }
        }
        
        public static DataTable CopyDataTable(DataTable toBeCopied, DataTable targetTable)
        {
            targetTable.Clear();
            //targetTable.Columns.Clear();
            foreach (DataColumn column in toBeCopied.Columns)
            {
                if (targetTable.Columns[column.ColumnName] == null)
                {
                    targetTable.Columns.Add(new DataColumn(column.ColumnName, column.DataType));
                }
            }
            foreach (DataRow row in toBeCopied.Rows)
            {
                DataRow newImportedRow = targetTable.NewRow();
                try
                {
                    targetTable.Rows.Add(newImportedRow);
                }
                catch (Exception)
                {
                    //do nothing.
                }
                foreach (DataColumn column in toBeCopied.Columns)
                {
                    newImportedRow[column.ColumnName] = row[column];
                }
            }
            targetTable.AcceptChanges();
            return targetTable;
        }

        public static bool IsTAFEnvironment()
        {
            //[[Return if the environment variable "TAF_ENV" is available
            if (!string.IsNullOrEmpty(Environment.GetEnvironmentVariable("TAF_ENV",EnvironmentVariableTarget.User)))
            {
                return true;
            }
            return false;
            //]]
        }

        internal static SqlParameter CreateSqlParameter(string parameterName,
                                                object paramValue,
                                                SqlDbType parameterType,
                                               ParameterDirection direction)
        {
            SqlParameter sqlParam = new SqlParameter();
            sqlParam.ParameterName = parameterName;
            sqlParam.SqlDbType = parameterType;
            if (!(paramValue is DataTable) && (paramValue == null || paramValue.ToString() == string.Empty))
            {
                sqlParam.Value = DBNull.Value;
            }
            else
            {
                sqlParam.Value = paramValue;
            }
            sqlParam.Direction = direction;
            if ((direction == ParameterDirection.Output || direction == ParameterDirection.InputOutput)&& paramValue is string)
            {
                sqlParam.Size = 8000;
            }
            return sqlParam;
        }

        internal static string GetCommaSeparatedParameters(List<SqlParameter> parameters)
        {
            StringBuilder sb = new StringBuilder();
            foreach (SqlParameter param in parameters)
            {
                if (param.Value == DBNull.Value)
                {
                    sb.Append("NULL, ");
                }
                else
                {
                    sb.Append("'" + param.SqlValue + "', ");
                }
            }
            return sb.ToString().Trim().TrimEnd(new char[] { ',' });
        }

        internal static string GetPrintableSQLString(string storedProcedureName, List<SqlParameter> lstParameters)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC " + storedProcedureName);
            if (lstParameters != null)
            {
                for (int i = 0; i < lstParameters.Count; i++)
                {
                    SqlParameter param = lstParameters[i];
                    sb.Append(System.Environment.NewLine);
                    sb.Append("@" + param.ParameterName);
                    if ((param.Value != null) &&
                            (param.Value != DBNull.Value) &&
                            ((param.SqlDbType == SqlDbType.VarBinary) ||
                                (param.SqlDbType == SqlDbType.Timestamp) ||
                                (param.SqlDbType == SqlDbType.Image)
                            )
                       )
                    {
                        sb.Append(" = 0x");
                        byte[] b = (byte[])param.Value;
                        foreach (byte b1 in b)
                        {
                            sb.Append(String.Format("{0:x2}", (int)b1));
                        }
                        sb.Append("");
                    }
                    else if (param.Value != null && param.Value != DBNull.Value)
                    {
                        sb.Append(" = '");
                        if (param.Value.GetType() == typeof(DateTime))
                        {
                            sb.Append("" + ((DateTime)param.Value).ToString("dd MMM yyyy HH:mm:ss"));
                        }
                        else
                        {
                            sb.Append("" + param.Value.ToString().Replace("'", "''"));
                        }
                        sb.Append("'");
                    }
                    else
                    {
                        sb.Append(" = NULL");
                    }
                    if (i != lstParameters.Count - 1)
                    {
                        sb.Append(",");
                    }
                }
            }
            return sb.ToString();
        }




        public static IDbManager CreateDBManagerInstanceForCurrentApp()
        {
            return CreateDBManagerInstance(GlobalAppVariables.AppContext.ApplicationId);
        }
        public static IDbManager CreateDBManagerInstanceForSysAdmin()
        {
            return CreateDBManagerInstance("SAM");
        }
        public static IDbManager CreateDBManagerInstance(string applicationID)
        {            
            if (GlobalAppVariables.AppContext != null  && GlobalAppVariables.AppContext.IsWebDBEnabled)
            {
                return new WebDbManager(applicationID, GlobalAppVariables.AppContext.UserRoleId, GlobalAppVariables.AppContext.ServerName, GlobalAppVariables.AppContext.UserRoleIdentity, GlobalAppVariables.AppContext.DBWebServiceURL);
            }
            else
            {
                return new DbManager(applicationID);
            }
        }

        public static DateTime GetServerDate()
        {
            return (DateTime)CreateDBManagerInstanceForCurrentApp().ExecuteScalar("Select getdate()");
        }
    }


    internal class ControlTabIndexComparer : IComparer<Control>
    {
        #region IComparer<Control> Members

        public int Compare(Control x, Control y)
        {
            return x.TabIndex.CompareTo(y.TabIndex);
        }

        #endregion
    }
}
