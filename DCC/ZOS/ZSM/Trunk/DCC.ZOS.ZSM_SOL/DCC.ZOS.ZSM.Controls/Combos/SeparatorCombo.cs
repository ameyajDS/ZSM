using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Utils;

namespace DCC.ZOS.ZSM.Controls.Combos
{
    public partial class SeparatorCombo : DCCComboBox
    {
        public static List<KeyValuePair<string, string>> GetSeparatorList()
        {
            List<KeyValuePair<string, string>> colourControl = new List<KeyValuePair<string, string>>();
            colourControl.Add(new KeyValuePair<string, string>(" ", " "));
            colourControl.Add(new KeyValuePair<string, string>("-", "-"));
            colourControl.Add(new KeyValuePair<string, string>("()", "()"));
            colourControl.Add(new KeyValuePair<string, string>(":", ":"));
            return colourControl;
        }
        public SeparatorCombo()
        {            
            InitializeComponent();
            this.ClearControlValues();
            this.SetDataSource(SeparatorCombo.GetSeparatorList(), "Key", "Value");
        }

    }
}
