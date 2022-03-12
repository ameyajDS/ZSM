using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.ACT
{
    class OpenSewadarsInformation : OpenTraineeSewadarsInformation
    {
        public override string ScreenId
        {
            get
            {
                return Screens.ACT_OPEN_SEWADARS_INFORMATION;
            }
        }

        public override string GetSewadarType()
        {
            return SewadarTypes.OPEN_SWD;
        }
    }
}
