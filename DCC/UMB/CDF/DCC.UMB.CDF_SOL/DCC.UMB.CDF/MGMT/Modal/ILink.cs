using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.Lookup.Modal;
using System.Windows.Forms;

namespace DCC.UMB.CDF.MGMT.Modal
{
    public interface ILink
    {
        LookupResult GetLookupResult();
        void SetLookupResult(LookupResult result, Control targetControl);
    }
}
