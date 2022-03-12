using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using DCC.UMB.CDF.DB;
//using DCC.UMB.CDF.Tools.DBFacadeGenerator;
using DCC.UMB.CDF.Utils;

namespace DCC.UMB.CDF.UIControls.TextControls.Lookup
{
    public partial class LookupColumnCreatorDialog : Form
    {
        private string lookupColumns = string.Empty;
        public LookupColumnCreatorDialog()
        {
            InitializeComponent();
        }
        public string ShowModalDialog(Form owner, string queryString)
        {
            //[[Load the values of connection string fields from settings
            LoadSettings();
            //]]
            this.txtSqlText.Text = queryString.Replace("?", " (1=1) ");
            this.ShowDialog(owner);

            return this.lookupColumns;
        }
        private void LoadSettings()
        {
            this.txtuserName.Text = DCC.UMB.CDF.Properties.Settings.Default.UN;
            this.txtDbServername.Text = DCC.UMB.CDF.Properties.Settings.Default.SN;
            this.txtDBName.Text = DCC.UMB.CDF.Properties.Settings.Default.AID;
            this.txtPassword.Text = DCC.UMB.CDF.Properties.Settings.Default.PW;
        }
        private void SaveSettings()
        {
            DCC.UMB.CDF.Properties.Settings.Default.UN = this.txtuserName.Text;
            DCC.UMB.CDF.Properties.Settings.Default.SN = this.txtDbServername.Text;
            DCC.UMB.CDF.Properties.Settings.Default.AID = this.txtDBName.Text;
            DCC.UMB.CDF.Properties.Settings.Default.PW = this.txtPassword.Text;
            DCC.UMB.CDF.Properties.Settings.Default.Save();
        }
        private void btnGetColumns_Click(object sender, EventArgs e)
        {
            //[[Save the settings of the user
            SaveSettings();
            //]]
            DbManager dbManager = null;
            try
            {
                string userId = txtuserName.Text.Trim();
                string password = txtPassword.Text.Trim();
                string serverName = txtDbServername.Text.Trim();
                string dbname = this.txtDBName.Text.Trim();
                dbManager = new DbManager(Guid.NewGuid().ToString(), dbname, userId, serverName, password);
                dbManager.ExecuteScalar("SET FMTONLY ON");

                DataSet dset = dbManager.ExecuteSQL(this.txtSqlText.Text.Trim());
                StringBuilder sb = new StringBuilder();
                StringWriter stringWriter = new StringWriter(sb);
                XmlTextWriter writer = new XmlTextWriter(stringWriter);
                writer.WriteStartElement("Root");
                writer.WriteAttributeString("LookupSqlQuery", this.txtSqlText.Text.Trim());
                foreach (DataColumn col in dset.Tables[0].Columns)
                {
                    writer.WriteStartElement("LookupColumn");
                    string caption = UtilityManager.GetUserFriendlyCaptionFromDatabaseObjectName(col.ColumnName);
                    writer.WriteAttributeString("caption", caption);
                    writer.WriteAttributeString("sqlName", col.ColumnName);
                    writer.WriteAttributeString("aliasName", col.ColumnName);
                    writer.WriteAttributeString("percentageWidth", "25");
                    writer.WriteAttributeString("toolTipText", caption);
                    writer.WriteAttributeString("isDisplayMemberColumn", "False");
                    writer.WriteAttributeString("isValueMemberColumn", "False");
                    writer.WriteAttributeString("isCodeMemberColumn", "False");
                    writer.WriteEndElement();
                }
                writer.WriteEndElement();
                writer.Close();
                lookupColumns = sb.ToString();
                this.Dispose();
                //<?xml version="1.0" encoding="utf-16"?>
                //<Root LookupSqlQuery="select satsang_centre_id, satsang_centre_nm from satsang_centres WHERE ?">
                //  <LookupColumn caption="Satsant Centre Name" sqlName="satsang_centre_nm" aliasName="satsang_centre_nm" percentageWidth="70" toolTipText="Satsang Centre Name" isDisplayMemberColumn="True" isValueMemberColumn="False" isCodeMemberColumn="False" />
                //  <LookupColumn caption="Satsang Centre ID" sqlName="satsang_centre_id" aliasName="satsang_centre_id" percentageWidth="40" toolTipText="Satsang Centre ID" isDisplayMemberColumn="False" isValueMemberColumn="True" isCodeMemberColumn="False" />
                //</Root>

            }
            catch (Exception ex)
            {
                MessageBox.Show(this, ex.Message, "CDF Lookup Columns: SQL Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                try
                {
                    if (dbManager != null)
                    {
                        dbManager.ExecuteScalar("SET FMTONLY OFF");
                    }
                }
                catch
                {
                    //Do nothing.
                }

            }
        }

    }
}