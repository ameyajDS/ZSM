using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDBControls.Lookups
{
    public partial class DesignationsLookup : BaseCDBMasterLookup
    {
        public DesignationsLookup()
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
    }
}
