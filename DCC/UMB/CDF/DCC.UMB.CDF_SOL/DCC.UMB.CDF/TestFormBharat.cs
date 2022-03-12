using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DCC.CMN.CDF.UIControls.Windows;

namespace DCC.CMN.CDF
{
    public partial class TestFormBharat : AbstractScreen
    {
        public override string PackageId
        {
            get
            {
                return "SMS";
            }
        }

        public override string ScreenId
        {
            get
            {
                return "SMS_01";
            }
        }

        public TestFormBharat()
        {
            InitializeComponent();
        }
    }
}