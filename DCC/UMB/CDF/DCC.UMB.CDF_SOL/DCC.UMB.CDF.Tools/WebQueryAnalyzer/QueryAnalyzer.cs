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
    public partial class QueryAnalyzer : Form
    {
        private WebDbManager dbManager = null;
        public QueryAnalyzer(string applicationId, string userId, string dbServerName, string password, string dbServiceURL)
        {
            InitializeComponent();
            dbManager = new WebDbManager(null, userId, dbServerName, password, dbServiceURL);
            this.Closing += new CancelEventHandler(QueryAnalyzer_Closing);
        }

        void QueryAnalyzer_Closing(object sender, CancelEventArgs e)
        {
            Application.Exit();
        }
        public void ExecuteUserQuery()
        {
            try
            {
                this.tlpQueryResults.Controls.Clear();
                this.tlpQueryResults.RowCount = 0;
                List<DataSet> dsets = new List<DataSet>();
                string userQuery = string.Empty;
                 if (string.IsNullOrEmpty(this.txtQuery.SelectedText))
                {
                    userQuery = this.txtQuery.Text;
                }
                else
                {
                    userQuery = this.txtQuery.SelectedText;
                }
                userQuery = userQuery + System.Environment.NewLine;
                userQuery = userQuery.Replace(System.Environment.NewLine + "go", System.Environment.NewLine + "GO");
                userQuery = userQuery.Replace(System.Environment.NewLine + "Go", System.Environment.NewLine + "GO");
                userQuery = userQuery.Replace(System.Environment.NewLine + "gO", System.Environment.NewLine + "GO");
               

                string[] queryParts = userQuery.Split(new string[] { System.Environment.NewLine + "GO" + System.Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
                
                foreach(string q in queryParts)
                {
                    if (q.Trim() != string.Empty && q.Trim().ToUpper()!="GO")
                    {
                        dsets.Add(dbManager.ExecuteSQL(q));
                    }
                }
                
                if(dsets.Count>0)
                {
                    foreach(DataSet dset in dsets)
                    {
                        foreach(DataTable table in dset.Tables)
                        {
                            this.tlpQueryResults.RowCount = this.tlpQueryResults.RowCount + 1;
                            this.tlpQueryResults.RowStyles.Add(new RowStyle());
                            this.tlpQueryResults.RowStyles[this.tlpQueryResults.RowCount - 1].Height =
                                ((int) (this.tlpQueryResults.Height*0.75));
                            DataGridView dgv = new DataGridView();
                            this.tlpQueryResults.Controls.Add(dgv,0,this.tlpQueryResults.RowCount-1);
                            dgv.Dock = DockStyle.Fill;
                            dgv.DataSource = table;
                        }
                    }
                    this.tlpQueryResults.AutoScroll = true;
                    
                }
            }
            catch (Exception ex)
            {
                this.txtMessages.Text = ex.Message + System.Environment.NewLine + ex.StackTrace;
                this.tabPaneQueryResults.SelectedIndex = 1;
            }
        }

        private void QueryAnalyzer_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void QueryAnalyzer_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.F5)
            {
                ExecuteUserQuery();
            }
        }
    }
}