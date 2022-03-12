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

namespace DCC.UMB.CDBControls.DropDown
{
    public partial class GenderCombo : DCCComboBox
    {
        public GenderCombo()
        {
            InitializeComponent();
            SetDataSource(Utility.GetGenderList(), "Key", "Value");
        }


    }
}
