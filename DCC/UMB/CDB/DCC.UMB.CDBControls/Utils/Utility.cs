using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DCC.UMB.CDBControls.Utils
{
    public class Utility
    {
        public static List<KeyValuePair<string, string>> GetGenderList()
        {
            List<KeyValuePair<string, string>> lstGender = new List<KeyValuePair<string, string>>();
            lstGender.Add(new KeyValuePair<string, string>("Male", "M"));
            lstGender.Add(new KeyValuePair<string, string>("Female", "F"));
            return lstGender;
        }
    }
}
