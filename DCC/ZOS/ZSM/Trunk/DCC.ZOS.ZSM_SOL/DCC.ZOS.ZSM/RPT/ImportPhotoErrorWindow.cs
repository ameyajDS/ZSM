using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class ImportPhotoErrorWindow : ZSMAbstractScreen
    {

        public ImportPhotoErrorWindow(string errorString)
        {
            InitializeComponent();
            rtbError.Text = errorString;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnCopy_Click(object sender, EventArgs e)
        {
            Clipboard.SetText(rtbError.Text, TextDataFormat.Text);
        }

        private void ImportPhotoErrorWindow_KeyPress(object sender, KeyPressEventArgs e)
        {
            //this.Close();
        }

        private void ImportPhotoErrorWindow_KeyUp(object sender, KeyEventArgs e)
        {
            
        }


    }
}
