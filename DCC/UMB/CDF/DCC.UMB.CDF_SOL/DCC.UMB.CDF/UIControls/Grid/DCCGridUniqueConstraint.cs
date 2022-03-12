using System;
using System.Collections.Generic;
using System.Text;

namespace DCC.UMB.CDF.UIControls.Grid
{
    public class DCCGridUniqueConstraint
    {
        private List<string> colunmnNames = new List<string>();
        private bool ignoreCase;
        private bool trimValues;

        internal DCCGridUniqueConstraint(bool ignoreCase, bool trimValues, params string[] columnNames)
        {
            this.ignoreCase = ignoreCase;
            this.trimValues = trimValues;
            ColunmnNames.AddRange(columnNames);
        }
        public bool IgnoreCase
        {
            get { return ignoreCase; }
        }
        
        public bool TrimValues
        {
            get { return trimValues; }
        }

        public List<string> ColunmnNames
        {
            get { return colunmnNames; }
            
        }
    }
}
