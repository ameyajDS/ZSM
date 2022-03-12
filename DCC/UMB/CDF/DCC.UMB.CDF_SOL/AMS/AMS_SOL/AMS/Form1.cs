using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;

namespace AES
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LookupColumnsPropertyEditor dialog = new LookupColumnsPropertyEditor(string.Empty);
            string s = dialog.ShowLookupPropertyDialog(string.Empty);
            Console.Out.WriteLine(s);
        }
    }
}