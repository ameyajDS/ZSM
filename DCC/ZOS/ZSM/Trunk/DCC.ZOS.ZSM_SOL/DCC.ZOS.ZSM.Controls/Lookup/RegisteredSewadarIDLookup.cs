using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    public partial class RegisteredSewadarIDLookup : BaseMasterLookup
    {
        string sttsCode = default(string);

        public string SttsCode
        {
            get
            {
                return sttsCode;
            }
            set
            {
                sttsCode = value;
            }
        }

        public RegisteredSewadarIDLookup()
        {
            InitializeComponent();
        }

        [Browsable(false)]
        [ReadOnly(true)]
        public override string LookupColumns
        {
            get
            {
                return base.LookupColumns;
            }
            set
            {
                base.LookupColumns = value;
            }
        }

        private void RegisteredSewadarIDLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (string.IsNullOrEmpty(this.SttsCode))
                throw (new Exception("SttsCode not defined for the lookup"));
            if (string.Compare(this.SttsCode, "SttsCode", true) == 0)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("JOIN system_information_values siv ON (siv.system_info_cd = 'SttsCode' AND vs.sewadar_status_cd = siv.value_varchar)", " ");
            }
            else
            {
                e.LookupSqlString = e.LookupSqlString.Replace("SttsCode", this.SttsCode);
            }
        }
    }
}
