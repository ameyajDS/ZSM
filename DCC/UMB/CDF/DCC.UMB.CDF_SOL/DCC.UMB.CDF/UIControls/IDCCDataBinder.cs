using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DCC.UMB.CDF.UIControls
{
    interface IDCCDataBinder
    {
        string IdTextBindingKey { get; set; }
        string DisplayTextBindingKey { get; set; }
    }
    interface IDCCControl
    {
        bool IsValid();
        bool ReadOnly { get; set; }
        bool Mandatory { get; set; }
        string UserFriendlyName { get; }
    }
}
