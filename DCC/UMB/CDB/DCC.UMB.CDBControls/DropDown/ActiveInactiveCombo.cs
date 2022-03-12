using System.Collections.Generic;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.UMB.CDBControls.DropDown
{
    public partial class ActiveInactiveCombo : DCCComboBox
    {
        public ActiveInactiveCombo()
        {
            InitializeComponent();

            List<KeyValuePair<string, string>> lstActiveInactive = new List<KeyValuePair<string, string>>();
            KeyValuePair<string, string> activeKeyValuePair = new KeyValuePair<string, string>("Yes", "Active");
            KeyValuePair<string, string> inActiveKeyValuePair = new KeyValuePair<string, string>("No ", "Inactive");
            lstActiveInactive.Add(activeKeyValuePair);
            lstActiveInactive.Add(inActiveKeyValuePair);
            SetDataSource(lstActiveInactive, "Value", "Key");            
        }
    }
}
