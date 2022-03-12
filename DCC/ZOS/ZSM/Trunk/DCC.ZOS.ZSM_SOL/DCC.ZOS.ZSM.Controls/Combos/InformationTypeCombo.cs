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
    public partial class InformationTypeCombo : DCCComboBox
    {
        public static List<KeyValuePair<string, string>> GetInformationTypeList()
        {
            List<KeyValuePair<string, string>> informationType = new List<KeyValuePair<string, string>>();
            informationType.Add(new KeyValuePair<string, string>("Sewadar", "Sewadar"));
            informationType.Add(new KeyValuePair<string, string>("Number", "Number"));
            informationType.Add(new KeyValuePair<string, string>("Range", "Range"));
            return informationType;
        }

        public InformationTypeCombo()
        {            
            InitializeComponent();
            this.ClearControlValues();
            this.SetDataSource(InformationTypeCombo.GetInformationTypeList(), "Key", "Value");
        }

    }
}
