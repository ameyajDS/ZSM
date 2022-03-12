using System;
using System.Collections.Generic;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    //define a aclass to hold the looupeventset event info
    public class LookupResultEventArgs : EventArgs
    {
        private CDF.Lookup.Modal.LookupResult lookupResult;
        public LookupResultEventArgs(LookupResult aLookupResult)
        {
            this.LookupResult = aLookupResult;
        }

        public CDF.Lookup.Modal.LookupResult LookupResult
        {
            get { return lookupResult; }
            internal set { lookupResult = value; }
        }
    }
    // Define a class to hold custom event info
    public class LookupEventArgs : EventArgs
    {
        private string lookupSqlString;
        private List<LookupPropertyColumn> lstLookupPropertyColumns;

        public LookupEventArgs(string lookupSqlString, List<LookupPropertyColumn> lstLookupPropertyColumns)
        {
            this.lookupSqlString = lookupSqlString;
            this.lstLookupPropertyColumns = lstLookupPropertyColumns;
        }

        public List<LookupPropertyColumn> LstLookupPropertyColumns
        {
            get { return lstLookupPropertyColumns; }
        }

        public string LookupSqlString
        {
            get { return lookupSqlString; }
            set { lookupSqlString = value; }
        }
    }    
}
