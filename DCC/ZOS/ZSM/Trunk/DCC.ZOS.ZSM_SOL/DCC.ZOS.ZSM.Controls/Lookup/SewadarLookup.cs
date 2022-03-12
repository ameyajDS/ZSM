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
    public partial class SewadarLookup : BaseMasterLookup
    {
        bool isF7Pressed = false;
        bool isF8Pressed = false;

        public SewadarLookup()
        {
            InitializeComponent();
            this.KeyUp += new EventHandler<KeyEventArgs>(RegisteredSewadarLookup_KeyUp);
            this.LookupDialogShowing += new EventHandler<LookupEventArgs>(RegisteredSewadarLookup_LookupDialogShowing);
        }

        void RegisteredSewadarLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (isF8Pressed)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("?", "(1=1)");
                e.LookupSqlString += string.Format(" AND F8Column like '{0}%'", this.DisplayText);
            }
            else if (isF7Pressed)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("?", "(1=1)");
                e.LookupSqlString += string.Format(" AND F7Column like '{0}%'", this.DisplayText);
            }
            isF7Pressed = false;
            isF8Pressed = false;
        }

        void RegisteredSewadarLookup_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F7)
            {
                isF7Pressed = true;
                this.ShowLookupDialog(DCC.UMB.CDF.Lookup.Modal.LookupSearchModes.Absolute);
            }
            else if (e.KeyCode == Keys.F8)
            {
                isF8Pressed = true;
                this.ShowLookupDialog(DCC.UMB.CDF.Lookup.Modal.LookupSearchModes.Absolute);
            }
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
    }
}
