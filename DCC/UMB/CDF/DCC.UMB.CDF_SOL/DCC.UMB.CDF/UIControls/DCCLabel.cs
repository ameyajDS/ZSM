using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.UIControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCLabel.bmp")]
    public partial class DCCLabel : Label
    {
        public DCCLabel()
        {
            InitializeComponent();
        }
    }
}
