using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.UIControls
{
    public class SummaryDetailButton : Button
    {
        private string buttonText;
        private Image iconImage;
        private SummaryDetailNavigator.NavigatorDisplayStyle displayStyle;

        public SummaryDetailNavigator.NavigatorDisplayStyle DisplayStyle
        {
            get { return displayStyle; }
            set
            {
                displayStyle = value;
                if(value==SummaryDetailNavigator.NavigatorDisplayStyle.Icons)
                {
                    this.Image = this.IconImage;
                    this.Text = string.Empty;
                }
                else
                {
                    this.Image = null;
                    this.Text = this.ButtonText;
                }
            }
        }

        public Image IconImage
        {
            get { return iconImage; }
            set { iconImage = value; }
        }

        public string ButtonText
        {
            get { return buttonText; }
            set { buttonText = value; }
        }
        
    }
}
