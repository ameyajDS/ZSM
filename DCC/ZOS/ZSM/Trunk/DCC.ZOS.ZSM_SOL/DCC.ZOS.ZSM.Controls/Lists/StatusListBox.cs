using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.ZOS.ZSM.Controls.Lists
{
    public partial class StatusListBox : DCCListBox
    {
        public StatusListBox()
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

        [Browsable(false)]
        [ReadOnly(true)]
        public override bool Lookup
        {
            get
            {
                return base.Lookup;
            }
            set
            {
                base.Lookup = value;
            }
        }

        public bool IsGlobal { get; set; }

        private void StatusListBox_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (IsGlobal)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "(is_global = 'Yes')");
            }
            else
            {
                e.LookupSqlString = e.LookupSqlString.Replace("(2=2)", "(is_global = 'No')");
            }
        }
    }
}