using System;
using System.Collections.Generic;
using System.Text;

namespace DCC.UMB.CDF.MGMT.View.Menu
{
    class DCCToolStripMenuItemGroupPredicate
    {
        string groupId;
        
        
        public string GroupId
        {
            get { return groupId; }
            set { groupId = value; }
        }

        public bool Compare(DCCToolStripMenuItemGroup dccToolStripMenuItem)
        {
            bool check = true;
            if (!string.IsNullOrEmpty(this.groupId))
            {
                check = check && this.groupId == dccToolStripMenuItem.GroupId;
                if (!check) return check;
            }        
            return check;
        }
    }
}
