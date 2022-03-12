using System;
using System.Collections.Generic;
using System.Text;
using White.Core.UIItems;
using White.Core.UIItems.WindowItems;
using White.Core.InputDevices;
using White.Core.UIItems.MenuItems;
using White.Core.WindowsAPI;
using White.Core.UIItems.ListBoxItems;

namespace DCC.UMB.TAF.View
{
    public class TAFComboBox : TAFAbstractControl
    {
        private WinFormComboBox cmbField = null;
        //
        public TAFComboBox(WinFormComboBox objCmbField, Window containerWindow)
            : base(objCmbField)
        {
            this.cmbField = objCmbField;
            this.ParentWindow = containerWindow;

        }
        public string Text
        {
            get { return this.cmbField.SelectedItem.Text; }
            set
            {
                this.Focus();
                this.cmbField.SetValue(value);
                Logger.Debug(string.Format("Combobox with Id = '{0}' set to a selected value {1}", this.cmbField.Id, string.IsNullOrEmpty(value) ? "NULL" : value));
            }
        }
        public WinFormComboBox EmbeddedUIItem
        {
            get { return this.cmbField; }
        }

    }

}
