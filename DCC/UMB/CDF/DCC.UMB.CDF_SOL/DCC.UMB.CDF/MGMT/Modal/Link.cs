using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using System.Windows.Forms;

namespace DCC.UMB.CDF.MGMT.Modal
{
    internal class Link
    {
        private Control callingControl = null;        
        private AbstractScreen calledScreen = null;

        internal Link(AbstractScreen calledScreen, Control callingControl)
        {
            this.callingControl = callingControl;
            this.calledScreen = calledScreen;
            //[[If calling control is not null, that means the called screen has
            //been opened in a chain and must be closed during save operation. So, 
            //set the ChainedUp property of called screen to true.
            if (callingControl != null)
            {
                calledScreen.ChainedUp = true;
            }
            //]]
        }

        
        
        public AbstractScreen CalledScreen
        {
            get { return calledScreen; }
            set { calledScreen = value; }
        }

        
        public Control CallingControl
        {
            get { return callingControl; }
            set { callingControl = value; }
        }
    }
}
