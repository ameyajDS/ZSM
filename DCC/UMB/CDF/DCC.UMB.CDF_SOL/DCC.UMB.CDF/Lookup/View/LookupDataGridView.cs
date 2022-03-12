using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.Lookup.View
{
    class LookupDataGridView : DataGridView
    {
        public ScrollBar VerticalScrollBar
        {
            get { return base.VerticalScrollBar; }
        }

    }
}
