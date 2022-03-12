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
using LumenWorks.Framework.IO.Csv;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class ImportSewadarList : ZSMAbstractScreen
    {
        private enum TableColumns
        {
            photo_id,
            first_nm,
            sewadar_id
        }

        public ImportSewadarList()
        {
            InitializeComponent();
            this.lblSatsangCentre.Text = ZSMUtility.GetSatsangCentreName();
            this.txtExcelLoc.DisplayText = AppStateVariables.ExcelPhotoPath;
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_SEWADAR_LIST_IN_BULK;
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

        private bool AddToSewadarList(DataTable GrNoList)
        {
            string ErrorMsg = string.Empty;
            try
            {

                this.dbFacade.FillBulkSewadarList(this.sewadarListLookup1.IdTextAsInteger, ZSMUtility.GetSatsangCentreId(), GrNoList);
            }
            catch (Exception)
            {
                throw;
            }
            return (string.IsNullOrEmpty(ErrorMsg));
        }

        public override void Save()
        {
            DialogResult result = MessageBox.Show(this, "System is beginning to update Sewadar List in bulk. This will change your database irreversibly. Proceed with caution.",
                      "Warning",
                      MessageBoxButtons.YesNo, MessageBoxIcon.Warning,
                      MessageBoxDefaultButton.Button1);
            if (result == DialogResult.Yes)
            {
                DataTable GrNoList = new DataTable();

                ReadCsv(ref GrNoList);
                AddToSewadarList(GrNoList);
                UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
            }
        }

        private void btnExcelLoc_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialogForSignature = new OpenFileDialog();
            if (!String.IsNullOrEmpty(AppStateVariables.ExcelPhotoPath))
            {
                openFileDialogForSignature.FileName = AppStateVariables.ExcelPhotoPath;
            }
            openFileDialogForSignature.Filter = "CSV files (*.csv)|*.csv";
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

        private void sewadarListLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "NOT EXISTS(SELECT 1 FROM generic_sewadar_lists_sewadars g where g.sewadar_list_id = generic_sewadar_lists.sewadar_list_id)");
        }

        private void ReadCsv(ref DataTable grNoList)
        {
            // open the file "data.csv" which is a CSV file with headers
            using (CsvReader csv = new CsvReader(new StreamReader(this.txtExcelLoc.DisplayText), true))
            {
                // missing fields will not throw an exception,
                // but will instead be treated as if there was a null value
                csv.MissingFieldAction = MissingFieldAction.ReplaceByNull;
                // to replace by "" instead, then use the following action:
                int fieldCount = csv.FieldCount;
                string[] headers = csv.GetFieldHeaders();

                grNoList.Columns.Add("GrNo", typeof(string));
                while (csv.ReadNextRecord())
                {
                    DataRow dataRow = grNoList.NewRow();
                    dataRow[headers[0]] = csv[0];
                    grNoList.Rows.Add(dataRow);
                }
            }
        }

    }
}
