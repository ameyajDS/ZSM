using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class PhotoReports : GenericReports
    {
        public PhotoReports()
        {
            InitializeComponent();
        }

        public override string ScreenId { get { return Screens.RPT_PHOTO_REPORTS; } }
    }
}
