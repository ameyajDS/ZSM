using System;
using System.Collections.Generic;
using System.Text;

namespace DCC.UMB.CDF.DB
{
    class Constants
    {
        public const int DEFAULT_INTEGER_VALUE = 0;
        public const decimal DEFAULT_DECIMAL_VALUE = 0.0M;
        public const float DEFAULT_FLOAT_VALUE = 0.0F;
        public const double DEFAULT_DOUBLE_VALUE = 0.0D;
        public const char DEFAULT_CHAR_VALUE = '\0';
        public static readonly DateTime DEFAULT_DATE_VALUE = new DateTime(1, 1, 1); //can'd define the structure as constant here, so defining as a readonly static variable.       

    }
}
