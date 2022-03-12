using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.MGMT.Controller;

namespace DCC.UMB.CDF.MGMT.View.Menu
{
    public delegate void DCCToolStripItemClicked(DCCToolStripMenuItem menuItem);
    
    public class DCCToolStripMenuItem : ToolStripMenuItem, DCCMenuInterface
    {
        
        //group_id, menu_nm, menu_desc, screen_params, ctrl_key_accessor, display_order
        private string groupId;
        private char controlKeyAccessor;
        int displayOrder;
        DCCToolStripItemClicked itemClicked;
        internal DCCToolStripMenuItem() { }
        public DCCToolStripMenuItem(string groupId,
                                     string menuName,
                                     string menuDesc,
                                     char controlKeyAccessor,
                                     int displayOrder,
                                     DCCToolStripItemClicked menuClickEventHandler)
        {
            this.groupId = groupId;
            this.Name = menuName;
            this.Text = menuDesc;
            this.controlKeyAccessor = controlKeyAccessor;
            this.displayOrder = displayOrder;
            this.itemClicked = menuClickEventHandler;
            this.Click += new EventHandler(DCCToolStripMenuItem_Click);
            this.ShowShortcutKeys = true;
        }
        public void SetShortcutKeyDisplayText(string displayText)
        {
           this.ShortcutKeyDisplayString = displayText;
        }
        
        public char GetControlkeyAccessor()
        {
            return this.controlKeyAccessor;
        }
        void DCCToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Performing menu click action...", true,null);
                this.itemClicked.Invoke((DCCToolStripMenuItem)sender);
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
            
        }
        public char ControlKeyAccessor
        {
            get { return controlKeyAccessor; }
            internal set { controlKeyAccessor = value; }
        }

        public string GroupId
        {
            get { return groupId; }
            internal set { groupId = value; }
        }
        public int DisplayOrder
        {
            get { return displayOrder; }
            internal set { displayOrder = value; }
        }

    }
}
