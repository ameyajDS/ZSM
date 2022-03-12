using System;
using System.Collections.Generic;
using System.Text;
using White.Core.UIItems;
using White.Core.UIItems.WindowItems;
using White.Core.InputDevices;
using White.Core.UIItems.MenuItems;
using White.Core.WindowsAPI;
using System.Threading;


namespace DCC.UMB.TAF.View
{
    public class TAFButton : TAFAbstractControl
    {
        private White.Core.UIItems.Button button = null;
        public TAFButton(Button objButton, Window containerWindow)
            : base(objButton)
        {
            this.button = objButton;
            this.ParentWindow = containerWindow;
        }
        public void Click()
        {
            button.RaiseClickEvent();
            Thread.Sleep(TAFManager.ScreenLoadWaitSeconds);
            Logger.Debug(string.Format("Button with id = '{0}' clicked",this.button.Id));
        }
    }
}
