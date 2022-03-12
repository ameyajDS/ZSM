using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class ImportProgressDialog : Form
    {
        private string _progressMessage = "";
        public String ProgressMessage
        {
            get { return _progressMessage; }
            set
            {
                _progressMessage = value;
                txtFileProgress.AppendText("\n" + DateTime.Now.ToLongDateString() + " " + _progressMessage);
                if (_progressMessage.Contains("Completed"))
                {
                    progressBar.Value = 100;
                }
                else
                {
                    if (progressBar.Value == 100)
                        progressBar.Value = 0;
                    progressBar.Value++;
                }
            }
        }

        public ImportProgressDialog()
        {
            InitializeComponent();
            progressBar.Value = 0;
            progressBar.Step = 10;
        }
    }
}
