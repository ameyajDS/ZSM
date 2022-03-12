using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using White.Core.UIItems;
using White.Core.UIItems.WindowItems;
using White.Core.InputDevices;
using White.Core.UIItems.MenuItems;
using White.Core.WindowsAPI;

namespace DCC.UMB.TAF.View
{
    public class TAFTextField : TAFAbstractControl
    {
        private WinFormTextBox txtField = null;
        
        //MultilineTextBox
        public TAFTextField(WinFormTextBox objTextField, Window containerWindow):base(objTextField)
        {
            this.txtField = objTextField;
            this.ParentWindow = containerWindow;
        }
        public string Text
        {
            get { return this.txtField.Text; }
            set 
            { 
                this.txtField.Focus();
                AttachedKeyboard keyB = this.ParentWindow.Keyboard;
                this.txtField.Text = value;
            }
        }
        public WinFormTextBox EmbeddedUIItem
        {
            get { return this.txtField; }
        }
       

    }

}
