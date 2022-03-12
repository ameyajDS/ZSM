using System;
using System.Collections.Generic;
using System.Text;

namespace DCC.UMB.CDF.Lookup.Modal
{
    public enum LookupSearchModes
    {
        Logical = 1,
        Absolute
    }
    public enum LookupReturnModes
    {
        Select = 1,
        New,
        Update,
        Reference,
        None
    }
    public enum LookupSearchOperators
    {
        StartsWith=1,
        Contains,
        EndsWith,
        Equals
    }
    class LookupConstants
    {
        

    }
}
