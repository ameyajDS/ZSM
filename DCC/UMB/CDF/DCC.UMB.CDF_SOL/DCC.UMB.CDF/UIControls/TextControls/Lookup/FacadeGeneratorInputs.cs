using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;


namespace DCC.UMB.CDF.Tools.DBFacadeGenerator
{
    public partial class FacadeGeneratorInputs : Form
    {
        public FacadeGeneratorInputs()
        {
            InitializeComponent();
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            DbConnectionFactory.UserId = txtuserName.Text.Trim();
            DbConnectionFactory.Password = txtPassword.Text.Trim();
            DbConnectionFactory.DataSource = txtDbServername.Text.Trim();
            FacadeGenerator form = new FacadeGenerator();
            //form.DB_NAME = txtDbName.Text.Trim();
            form.ApplicationId = txtApplicationId.Text.Trim();
            FacadeGenerator.ProcFolder = txtProcFolder.Text.Trim();
            FacadeGenerator.FilesWithPathTable = null;
            form.Show();
        }
    }
}