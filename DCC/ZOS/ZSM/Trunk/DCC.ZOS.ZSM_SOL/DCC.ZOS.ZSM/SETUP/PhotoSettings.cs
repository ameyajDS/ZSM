using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.SETUP
{
    public partial class PhotoSettings : Form
    {
        public PhotoSettings()
        {
            InitializeComponent();
            txtSewadarPath.Text = Properties.Settings.Default.SewadarPhotoPath;
            txtTempPath.Text = Properties.Settings.Default.TempPath;
            chkSaveToFile.Checked = Properties.Settings.Default.SaveToFile == "Yes" ? true : false;
            txtAspectRatio.Text = Properties.Settings.Default.AspectRatio;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.SaveToFile = chkSaveToFile.Checked ? "Yes" : "No";
            if (chkSaveToFile.Checked)
            {
                if (Directory.Exists(txtSewadarPath.Text))
                {
                    Properties.Settings.Default.SewadarPhotoPath = txtSewadarPath.Text;
                }
                else
                {
                    MessageBox.Show("Specified Sewadar Photo Path does not exists.");
                    return;
                }
            }
            if (Directory.Exists(txtTempPath.Text))
            {
                Properties.Settings.Default.TempPath = txtTempPath.Text;
            }
            else
            {
                MessageBox.Show("Specified Temporary Photo Path does not exists.");
                return;
            }
            Properties.Settings.Default.AspectRatio = txtAspectRatio.Text;

            this.Close();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void chkSaveToFile_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSaveToFile.Checked)
            {
                txtSewadarPath.Enabled = true;
            }
            else
            {
                txtSewadarPath.Enabled = false;
            }
        }


    }
}
