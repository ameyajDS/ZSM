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
    public partial class WorkingUnitLookup : BaseCDBMasterLookup
    {
        public WorkingUnitLookup()
        {
            InitializeComponent();
            this.LookupDialogShowing += new EventHandler<CDF.UIControls.TextControls.LookupEventArgs>(WorkingUnitLookup_LookupDialogShowing);
        }

        void WorkingUnitLookup_LookupDialogShowing(object sender, CDF.UIControls.TextControls.LookupEventArgs e)
        {
            if (SocietyId.HasValue)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("(society_id=society_id)", string.Format("(society_id={0})", SocietyId.Value.ToString()));
            }
        }
        public short? SocietyId
        {
            get;
            set;
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
