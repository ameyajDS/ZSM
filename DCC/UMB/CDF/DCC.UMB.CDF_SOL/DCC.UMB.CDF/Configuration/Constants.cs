using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;

namespace DCC.UMB.CDF.Configuration
{
    public enum MessageTypes
    {
        Plain,
        Warning,
        Error,
        Fatal,
        None
    }
    public enum LogLevels
    {
        Message = 1,
        Warning,
        Error,
        Fatal
    }
    public enum UIModes
    {
        Insert = 1,
        Query,
        Retrieve,
        Browse,
        List,
        New,
        Update,
        Reference,
        Params,
        Report,
        Tabular,
        None
    }
    public enum AudiLogActions
    {
        Action = 1,
        Print,
        Insert,
        Update,
        Delete
    }
    public enum DisplayTextStyles
    {
        Id,
        Name,
        Code
    }
    public class RegxConstants
    {
        public const string VALID_PHONE_NUMBER = @"^[0-9()+\-\, MT]+$";
        /// <summary>
        /// A Valid C# identifier. This can be used for making codes of identities.
        /// Supported characters are 0-9, A-Z, a-z.
        /// </summary>
        public const string VALID_IDENTIFIER = @"^[0-9A-Za-z_]+$";

        public const string NUMERIC_ONLY = @"^[0-9]+$";
        public const string UPPER_CASE_ALPHA_ONLY = @"^[A-Z]+$";
        public const string LOWER_CASE_ALPHA_ONLY = @"^[a-z]+$";
    }

    public class Constants
    {
        public const int DEFAULT_INTEGER_VALUE = 0;
        public const decimal DEFAULT_DECIMAL_VALUE = 0.0M;
        public const float DEFAULT_FLOAT_VALUE = 0.0F;
        public const double DEFAULT_DOUBLE_VALUE = 0.0D;
        public const char DEFAULT_CHAR_VALUE = '\0';
        public static readonly DateTime DEFAULT_DATE_VALUE = new DateTime(1, 1, 1); //can'd define the structure as constant here, so defining as a readonly static variable.       
        public const int TITLE_LEFT_PADING = 2;
        public static Color DEFAULT_READWRITE_FORE_COLOR = System.Drawing.SystemColors.WindowText;
        public static Color DEFAULT_READONLY_FORE_COLOR = System.Drawing.Color.Maroon;
        public static Color DEFAULT_NON_MANDATORY_BACK_COLOR = System.Drawing.SystemColors.InactiveBorder;
        public static Color DEFAULT_MANDATORY_BACK_COLOR = System.Drawing.SystemColors.Info;
        public static string DATE_FORMAT = "dd MMM yyyy";
        public static string DATE_TIME_FORMAT = "dd MMM yyyy hh:mm tt";
    }
}
