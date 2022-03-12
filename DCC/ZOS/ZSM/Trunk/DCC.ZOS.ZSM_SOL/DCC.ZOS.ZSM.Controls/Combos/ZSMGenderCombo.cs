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
    public partial class ZSMGenderCombo : DCCComboBox
    {
        private static List<KeyValuePair<string, string>> GetGenderList()
        {
            List<KeyValuePair<string, string>> lstGender = new List<KeyValuePair<string, string>>();
            lstGender.Add(new KeyValuePair<string, string>("Male", "Male"));
            lstGender.Add(new KeyValuePair<string, string>("Female", "Female"));
            return lstGender;
        }

        public ZSMGenderCombo()
        {
            InitializeComponent();
            SetDataSource(GetGenderList(), "Key", "Value");
        }


    }
}
