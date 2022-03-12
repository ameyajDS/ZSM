using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDBControls.Utils;

namespace DCC.ZOS.ZSM.Controls.DropDown
{
    public partial class SewaExemptionTypeCombo : DCCComboBox
    {
        private static List<KeyValuePair<string, string>> GetSewaExemptionTypeList()
        {
            List<KeyValuePair<string, string>> lstGender = new List<KeyValuePair<string, string>>();
            lstGender.Add(new KeyValuePair<string, string>("Life-time", "Life-time"));
            lstGender.Add(new KeyValuePair<string, string>("Duration", "Duration"));
            lstGender.Add(new KeyValuePair<string, string>("Once only", "Once only"));

            return lstGender;
        }

        public SewaExemptionTypeCombo()
        {
            InitializeComponent();
            SetDataSource(GetSewaExemptionTypeList(), "Key", "Value");
        }

    }
}
