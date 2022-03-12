using System.Collections.Generic;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.UMB.CDBControls.DropDown
{
    public partial class YesNoCombo : DCCComboBox
    {
        public YesNoCombo()
        {
            InitializeComponent();

            List<KeyValuePair<string, string>> lstActiveInactive = new List<KeyValuePair<string, string>>();
            KeyValuePair<string, string> activeKeyValuePair = new KeyValuePair<string, string>("Yes", "Yes");
            KeyValuePair<string, string> inActiveKeyValuePair = new KeyValuePair<string, string>("No", "No");
            lstActiveInactive.Add(activeKeyValuePair);
            lstActiveInactive.Add(inActiveKeyValuePair);
            SetDataSource(lstActiveInactive, "Value", "Key");            
        }
    }
}
