using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace DCC.ZOS.ZSM.TEST.Infrastructure
{
    public class AutomationHelper
    {
        public static string GetRandomString()
        {
            return Path.GetRandomFileName().Replace(".", "");
        }

    }
}
