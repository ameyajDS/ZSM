using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;

namespace DCC.ZOS.ZSM.Controls.Lists
{
    public partial class ImageExtensionsListBox : DCCListBox
    {


        public class ImageExtension
        {
            private static List<ImageExtension> allImageExtension = new List<ImageExtension>();
            public static List<ImageExtension> GetAllImageExtensions()
            {
                return allImageExtension;
            }
            private string value;

            public string Value
            {
                get { return value; }
                set { this.value = value; }
            }
            private ImageExtension(string value)
            {
                this.Value = value;
            }
            static ImageExtension()
            {
                allImageExtension.Add(new ImageExtension("*.png"));
                allImageExtension.Add(new ImageExtension("*.gif"));
                allImageExtension.Add(new ImageExtension("*.jpg"));
            }
        }

        public ImageExtensionsListBox()
        {
            InitializeComponent();
            this.ClearControlValues();
            this.SetDataSource(ImageExtension.GetAllImageExtensions(),"Value","Value");
        }
    }
}
