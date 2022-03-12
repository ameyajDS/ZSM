using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.Lookup.Modal;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    internal class DCCSuggestionToolStripItem : ToolStripMenuItem
    {
        public LookupResult LookupSuggestion { get; set; }
        public DCCTextField OwningTextField { get; set; }
        public ContextMenuStrip OwningContextMenu { get; set; }
        public DCCSuggestionToolStripItem(LookupResult result, ContextMenuStrip owningContextMenu, DCCTextField owningTextField)
            : base(result.ToString())
        {
            this.LookupSuggestion = result;
            this.OwningTextField = owningTextField;
            this.OwningContextMenu = owningContextMenu;
            this.Click += new EventHandler(DCCSuggestionToolStripItem_Click);
        }

        void DCCSuggestionToolStripItem_Click(object sender, EventArgs e)
        {
            DCCSuggestionToolStripItem clickedItem = (DCCSuggestionToolStripItem) sender;
            clickedItem.OwningTextField.DoneWithLookup(clickedItem.LookupSuggestion);
            this.OwningContextMenu.Close();
        }
    }
}
