using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using System.ComponentModel;

namespace DCC.UMB.CDBControls.Lookups
{
    public class BaseCDBMasterLookup : BaseMasterLookup
    {
        [Browsable(false)]
        [ReadOnly(true)]
        public override string ApplicationIdForDbConnection
        {
            get
            {
                return "CDB_App";
            }
            set
            {

            }
        }

        [Browsable(false)]
        [ReadOnly(true)]
        public override bool Lookup
        {
            get
            {
                return true;
            }
            set
            {

            }
        }

    }
}