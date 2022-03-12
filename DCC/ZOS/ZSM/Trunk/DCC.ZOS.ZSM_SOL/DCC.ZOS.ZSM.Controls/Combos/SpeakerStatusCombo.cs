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
using DCC.ZOS.ZSM.Controls.Configuration;

namespace DCC.ZOS.ZSM.Controls.Combos
{
    public partial class SpeakerStatusCombo : DCCComboBox
    {
        private static List<KeyValuePair<string, string>> GetSpeakerStatusList()
        {
            List<KeyValuePair<string, string>> lstSpeakerStatus = new List<KeyValuePair<string, string>>();
            lstSpeakerStatus.Add(new KeyValuePair<string, string>("Active", "Active"));
            lstSpeakerStatus.Add(new KeyValuePair<string, string>("Provisional", "Provisional"));
            lstSpeakerStatus.Add(new KeyValuePair<string, string>("InActive", "InActive"));
            lstSpeakerStatus.Add(new KeyValuePair<string, string>("Retired", "Retired"));
            lstSpeakerStatus.Add(new KeyValuePair<string, string>("Shifted", "Shifted"));


            return lstSpeakerStatus;
        }

        public SpeakerStatusCombo()
        {
            InitializeComponent();
            SetDataSource(GetSpeakerStatusList(), "Key", "Value");
        }

    }
}
