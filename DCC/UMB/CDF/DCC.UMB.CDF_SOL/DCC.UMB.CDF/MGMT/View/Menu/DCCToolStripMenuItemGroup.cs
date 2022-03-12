using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.MGMT.Modal;

namespace DCC.UMB.CDF.MGMT.View.Menu
{
    internal enum MenuTypes
    {
        Group=1,
        Menu
    }
    internal class DCCToolStripMenuItemGroup : ToolStripMenuItem, DCCMenuInterface
    {
        private string groupId;
        private char controlKeyAccessor;
        private string parentGroupId;

        public string ParentGroupId
        {
            get { return parentGroupId; }
            set { parentGroupId = value; }
        }
        public string GroupId
        {
            get { return groupId; }
            set { groupId = value; }
        }
        public char GetControlkeyAccessor()
        {
            return this.controlKeyAccessor;
        }

        public char ControlKeyAccessor
        {
            get { return controlKeyAccessor; }
            set { controlKeyAccessor = value; }
        }

        public DCCToolStripMenuItemGroup(string groupId, 
                                        string parentGroupId,
                                        string name, 
                                        string text, 
                                        char accessKey)
        {
            this.groupId = groupId;
            if(string.IsNullOrEmpty(parentGroupId))
            {
                this.parentGroupId = null;
            }
            else
            {
                this.parentGroupId = parentGroupId;
            }
            this.Name = name;
            this.controlKeyAccessor = accessKey;
            this.Text = text;            
        }
    }
}
