using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.UMB.CDBControls.Lists
{
    public partial class SatsangCentresListBox : DCCListBox
    {
        public SatsangCentresListBox()
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
    }
}