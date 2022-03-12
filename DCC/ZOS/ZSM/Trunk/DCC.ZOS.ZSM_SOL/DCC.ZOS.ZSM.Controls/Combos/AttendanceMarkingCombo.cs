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
    public partial class AttendanceMarkingCombo : DCCComboBox
    {
        private static List<KeyValuePair<string, string>> GetAttendanceMarkingList()
        {
            List<KeyValuePair<string, string>> lstGender = new List<KeyValuePair<string, string>>();
            lstGender.Add(new KeyValuePair<string, string>("Team-wise", "Team-wise"));
            lstGender.Add(new KeyValuePair<string, string>("Arbitrary", "Arbitrary"));
            lstGender.Add(new KeyValuePair<string, string>("Summary", "Summary"));
            lstGender.Add(new KeyValuePair<string, string>("Computed", "Computed"));

            return lstGender;
        }

        public AttendanceMarkingCombo()
        {
            InitializeComponent();
            SetDataSource(GetAttendanceMarkingList(), "Key", "Value");
        }


    }
}
