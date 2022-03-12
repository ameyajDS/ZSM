using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;

namespace DCC.UMB.CDF.Tools.WebQueryAnalyzer
{
    public partial class UserCredentials : Form
    {
        public UserCredentials()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            QueryAnalyzer analyzer = new QueryAnalyzer(null,this.txtuserName.Text.Trim(), this.txtDbServerName.Text.Trim(), 
                                                    this.txtPassword.Text.Trim(), this.txtDbServiceUrl.Text.Trim());
            analyzer.Show();
            this.Visible = false;

        }
    }
}