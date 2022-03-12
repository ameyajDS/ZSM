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
    public partial class ColourControlCombo : DCCComboBox
    {
        public static List<KeyValuePair<string, string>> GetcolourControlList()
        {
            List<KeyValuePair<string, string>> colourControl = new List<KeyValuePair<string, string>>();
            colourControl.Add(new KeyValuePair<string, string>("Colour", "Colour"));
            colourControl.Add(new KeyValuePair<string, string>("Department", "Department"));
            colourControl.Add(new KeyValuePair<string, string>("Centre", "Centre"));
            return colourControl;
        }
        public ColourControlCombo()
        {            
            InitializeComponent();
            this.ClearControlValues();
            this.SetDataSource(ColourControlCombo.GetcolourControlList(), "Key", "Value");
        }

    }
}
