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
    public abstract class TAFAbstractControl
    {
        private Window parentWindow = null;
        private IUIItem embeddedUIItem = null;
        public TAFAbstractControl(IUIItem anEmbeddedUIItem)
        {
            this.UIItem = anEmbeddedUIItem;
        }

        public Window ParentWindow
        {
            get { return parentWindow; }
            set { parentWindow = value; }
        }

        public IUIItem UIItem
        {
            get { return embeddedUIItem; }
            set { embeddedUIItem = value; }
        }

        /// <summary>
        /// Sets the focus on this UIItem.
        /// </summary>
        public void Focus()
        {
            this.UIItem.Focus();
            Logger.Debug("Focus set on :" + this.embeddedUIItem.Name);
        }
        
    }
}
