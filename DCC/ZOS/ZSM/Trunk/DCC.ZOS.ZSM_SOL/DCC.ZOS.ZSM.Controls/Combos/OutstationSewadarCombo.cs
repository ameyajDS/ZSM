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
    public partial class OutstationSewadarCombo : DCCComboBox
    {
        private static List<KeyValuePair<string, string>> GetGenderList()
        {
            List<KeyValuePair<string, string>> lstGender = new List<KeyValuePair<string, string>>();
            lstGender.Add(new KeyValuePair<string, string>("Local", "No"));
            lstGender.Add(new KeyValuePair<string, string>("Outstation", "Yes"));
            return lstGender;
        }

        public OutstationSewadarCombo()
        {
            InitializeComponent();
            SetDataSource(GetGenderList(), "Key", "Value");
        }

    }
}
