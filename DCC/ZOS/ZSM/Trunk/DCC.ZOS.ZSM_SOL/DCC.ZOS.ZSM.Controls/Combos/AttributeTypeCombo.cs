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
    public partial class AttributeTypeCombo : DCCComboBox
    {
        private static List<KeyValuePair<string, string>> GetAttributeTypeList()
        {
            List<KeyValuePair<string, string>> lstAttributeType = new List<KeyValuePair<string, string>>();
            lstAttributeType.Add(new KeyValuePair<string, string>("Boolean", "Boolean"));
            lstAttributeType.Add(new KeyValuePair<string, string>("Date", "Date"));
            lstAttributeType.Add(new KeyValuePair<string, string>("Timestamp", "Timestamp"));
            lstAttributeType.Add(new KeyValuePair<string, string>("String", "String"));
            lstAttributeType.Add(new KeyValuePair<string, string>("Integer", "Integer"));
            lstAttributeType.Add(new KeyValuePair<string, string>("Number", "Number"));
            lstAttributeType.Add(new KeyValuePair<string, string>("List", "List"));

            return lstAttributeType;
        }

        public AttributeTypeCombo()
        {
            InitializeComponent();
            SetDataSource(GetAttributeTypeList(), "Key", "Value");
        }

    }
}
