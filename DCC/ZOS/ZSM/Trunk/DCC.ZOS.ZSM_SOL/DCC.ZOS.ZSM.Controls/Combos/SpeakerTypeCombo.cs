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
    public partial class SpeakerTypeCombo : DCCComboBox
    {
        private static List<KeyValuePair<string, string>> GetSpeakerTypeList()
        {
            List<KeyValuePair<string, string>> lstSpeakerType = new List<KeyValuePair<string, string>>();
            lstSpeakerType.Add(new KeyValuePair<string, string>("Satsang Karta", "Satsang Karta"));
            lstSpeakerType.Add(new KeyValuePair<string, string>("Satsang Reader", "Satsang Reader"));
            lstSpeakerType.Add(new KeyValuePair<string, string>("Pathi", "Pathi"));
            lstSpeakerType.Add(new KeyValuePair<string, string>("Bal Satsang Karta", "Bal Satsang Karta"));
            lstSpeakerType.Add(new KeyValuePair<string, string>("Bal Pathi", "Bal Pathi"));


            return lstSpeakerType;
        }

        public SpeakerTypeCombo()
        {
            InitializeComponent();
            SetDataSource(GetSpeakerTypeList(), "Key", "Value");
        }

    }
}
