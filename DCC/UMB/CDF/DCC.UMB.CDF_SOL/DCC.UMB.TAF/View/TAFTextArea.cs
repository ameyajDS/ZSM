using System;
using System.Collections.Generic;
using System.Text;
using White.Core.UIItems;
using White.Core.UIItems.WindowItems;
using White.Core.InputDevices;
using White.Core.UIItems.MenuItems;
using White.Core.WindowsAPI;


namespace DCC.UMB.TAF.View
{
    public class TAFTextArea : TAFAbstractControl
    {
        private MultilineTextBox txtArea = null;
        //
        public TAFTextArea(MultilineTextBox objTextField, Window containerWindow):base(objTextField)
        {
            this.txtArea = objTextField;
            this.ParentWindow = containerWindow;
        }
        public string Text
        {
            get { return this.txtArea.Text; }
            set { this.txtArea.Text = value; }
        }
        public MultilineTextBox EmbeddedUIItem
        {
            get { return this.txtArea; }
        }
        
    }
}
