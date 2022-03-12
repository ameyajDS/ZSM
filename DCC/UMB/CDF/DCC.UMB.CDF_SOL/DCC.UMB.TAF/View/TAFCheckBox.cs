using System;
using System.Collections.Generic;
using System.Text;
using White.Core.UIItems;
using White.Core.UIItems.WindowItems;

namespace DCC.UMB.TAF.View
{
    public class TAFCheckBox : TAFAbstractControl
    {
        private CheckBox checkBox = null;
        public TAFCheckBox(White.Core.UIItems.CheckBox objCheckBox, Window containerWindow)
            : base(objCheckBox)
        {
            this.checkBox = objCheckBox;
            this.ParentWindow = containerWindow;
        }
        public bool Checked
        {
            get
            {
                return checkBox.Checked;
            }
            set
            {
                checkBox.Checked=value;
                Logger.Debug(string.Format("Checkbox with Id = '{0}' {1}", this.checkBox.Id, value ? "Checked" : "Unchecked"));
            }
        }
        
        public CheckBox EmbeddedUIItem
        {
            get { return this.checkBox; }
        }
    }
}
