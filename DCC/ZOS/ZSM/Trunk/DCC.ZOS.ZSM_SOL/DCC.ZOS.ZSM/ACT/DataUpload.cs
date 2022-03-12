using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;
using DCC.DBFacade;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.MGMT.Global;
using System.IO;
using DCC.ZOS.ZSM.RPT;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class DataUpload : ZSMAbstractScreen
    {
        private enum TableColumns
        {
            photo_id,
            first_nm,
            sewadar_id
        }

        public DataUpload()
        {
            InitializeComponent();

            this.txtExcelLoc.DisplayText = AppStateVariables.ExcelPhotoPath;
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_UPLOAD_DATA_IN_BULK;
            }
        }

        public override void ClearControls()
        {
        }

        public override void ShowScreen(DCC.UMB.CDF.Configuration.UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ClearControls();
        }

        public override bool IsReadyToSave()
        {
            return base.IsReadyToSave();
        }

        public override void Save()
        {
            lblError.Text = "";
            DialogResult result = MessageBox.Show(this, "System is beginning to upload data in bulk. This will change your database irreversibly. Proceed with caution.",
                      "Warning",
                      MessageBoxButtons.YesNo, MessageBoxIcon.Warning,
                      MessageBoxDefaultButton.Button1);
            if (result == DialogResult.Yes)
            {
                ErrorCommentsView.DataSource = null;
                DataSet response = null;
                try
                {
                    int returnCode = 0;
                    int recordCount = 0;
                    String p_is_upload_data = "No";
                    int? satsangCentreId = int.Parse(zsmSatsangCentresLookup1.IdText);
                    this.dbFacade.BeginTrans();
                    response = this.dbFacade.UploadData(this.txtExcelLoc.DisplayText, satsangCentreId, p_is_upload_data, ref returnCode, ref recordCount);

                    bool isError = false;
                    if (response.Tables.Count > 1 && response.Tables[2].Rows.Count > 0)
                    {
                        foreach(DataRow row in response.Tables[2].Rows)
                        {
                            var comments = row.Field<string>("comments");
                            if (comments.Contains("ERROR"))
                            {
                                isError = true;
                                break;
                            }
                        }
                    }

                    if (returnCode < 0 || recordCount == 0 || isError)
                    {
                        if (returnCode == -1)
                        {
                            LoadCustomExceptionData(response, "Records having Name/DOB overwritten with character(s) other than Y or N");
                        }
                        else if (returnCode == -2)
                        {
                            LoadCustomExceptionData(response, "Mutiple sewadar records matching... (Names/DOBs which are to be over-written are not considered");
                        }
                        else
                        {
                            ErrorCommentsView.DataSource = response.Tables[2];
                        }
                        dbFacade.RollbackTrans();
                        return;
                    }
                    p_is_upload_data = "Yes";
                    response = this.dbFacade.UploadData(this.txtExcelLoc.DisplayText, satsangCentreId, p_is_upload_data, ref returnCode, ref recordCount);
                    if (returnCode < 0 || recordCount == 0 || isError)
                    {
                        dbFacade.RollbackTrans();
                    }
                    Regex r = new Regex(@"\b.xls\b");
                    var batchFilePath = r.Replace(txtExcelLoc.DisplayText, ".bat");
                    System.IO.StreamWriter file = new System.IO.StreamWriter(batchFilePath);
                    foreach (DataRow row in response.Tables[3].Rows)
                    {
                        file.WriteLine(row.Field<string>("Rename file entry"));
                    }
                    file.Close();
                    dbFacade.CommitTrans();
                }
                catch (IOException ioex)
                {
                    dbFacade.RollbackTrans();
                    throw;
                }
                catch (SqlException ex)
                {
                    dbFacade.RollbackTrans();
                    throw;
                }
                catch (Exception)
                {
                    dbFacade.RollbackTrans();
                    throw;
                }
                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
            }
        }

        private void LoadCustomExceptionData(DataSet response, string message)
        {
            lblError.Text = message;
            lblError.ForeColor = Color.IndianRed;
            if (response != null)
            {
                if (response.Tables[0].Rows.Count > 0)
                {
                    ErrorCommentsView.DataSource = response.Tables[0];
                }
                else
                {
                    if (response.Tables.Count > 1 && response.Tables[1].Rows.Count > 0)
                    {
                        ErrorCommentsView.DataSource = response.Tables[1];
                    }
                }
            }
        }

        private void btnExcelLoc_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialogForSignature = new OpenFileDialog();
            if (!String.IsNullOrEmpty(AppStateVariables.ExcelPhotoPath))
            {
                openFileDialogForSignature.FileName = AppStateVariables.ExcelPhotoPath;
            }
            openFileDialogForSignature.Filter = "Excel files (*.xlsx)|*.xlsx|(*.xls)|*.xls|All files (*.*)|*.*";
            openFileDialogForSignature.FilterIndex = 2;
            openFileDialogForSignature.RestoreDirectory = true;

            if (openFileDialogForSignature.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    this.txtExcelLoc.DisplayText = openFileDialogForSignature.FileName;
                    AppStateVariables.ExcelPhotoPath = txtExcelLoc.DisplayText;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }
        }

        private void dccGrid1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

    }
}
