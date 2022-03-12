using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.UMB.CDF.MGMT.Modal
{
    class KeyArgsEventList<T>:List<T>
    {
        public void Add(T obj)
        {
            base.Add(obj);
            GlobalAppVariables.ObjMDIMain.StatusText = "Found part(s) of combined key, waiting...";
        }
        public void Clear()
        {
            base.Clear();
            GlobalAppVariables.ObjMDIMain.StatusText = string.Empty;
        }
    }
}
