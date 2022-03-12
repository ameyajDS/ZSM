using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.ZOS.ZSM.Controls.Utils;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ACT
{
    public partial class ImportFingerprintAttendance : ZSMAbstractScreen
    {
        public ImportFingerprintAttendance()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ACT_IMPORT_FINGERPRINT_ATTENDANCE;
            }
        }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }

        public override void ClearControls()
        {
            txtControllingId.DisplayText = "";
            dtpFromTo.ClearControlValues();
            sewaLookup.ClearControlValues();
            grdAttendanceRecorded.RemoveAllRecords();
            grdIncompleteAttendance.RemoveAllRecords();
            txtShift1.DisplayText = "";
            txtShift2.DisplayText = "";
            txtShift3.DisplayText = "";
            txtProcessedDtm.DisplayText = "";
        }

        public override void ShowScreen(DCC.UMB.CDF.Configuration.UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            SetContolVisibility(true);
            if (uiMode == UIModes.Insert || uiMode == UIModes.New)
            {
                this.ShowListView(this.scListOrBrowse, false);
                ClearControls();
                SetContolVisibility(false);
            }
            else if (uiMode == UIModes.Query || uiMode == UIModes.Update)
            {
                ClearControls();
                MakeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    this.txtControllingId.DisplayText = screenParameters;
                    GlobalAppVariables.ObjMDIMain.FireRetrieveMode();
                }
            }
            else if (uiMode == UIModes.List)
            {
                this.ShowListView(this.scListOrBrowse, true);
            }
            else if (uiMode == UIModes.Browse)
            {
                this.ShowListView(this.scListOrBrowse, false);
            }
        }

        public override void LoadBrowseView(int rowIndex)
        {
            MakeEditableOnlyInQueryMode(false);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1, grdAttendanceRecorded, grdIncompleteAttendance);
            LoadGrids();
        }

        public override bool IsReadyToSave()
        {
            if (!ValidateFilenames())
            {
                return false;
            }
            return true;

        }


        public override void Save()
        {
            try
            {
                DialogResult result = MessageBox.Show(this, "System is begining to add attendance records. Please note:\n" +
                "1. Ensure you have selected correct date range.\n" +
                "2. ALL the required files are added, and no file is left out.\n" +
                "3. It is an Irreversible action; once imported, cannot be reverted back!\n" +
                "Proceed with caution.", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);

                if (result == DialogResult.Yes)
                {
                    var dataTable = CreateSewadarIdDateDataTable();

                    IList<string> fileList = new List<string>();
                    foreach (DataGridViewRow row in grdFileSelection.Rows)
                    {
                        var filename = (string)row.Cells[0].Value;
                        filename = filename.Trim();
                        if (string.IsNullOrEmpty(filename))
                            continue;
                        fileList.Add(filename);
                    }
                    foreach (string filePath in fileList)
                    {
                        var datas = File.ReadAllLines(filePath);
                        foreach (var data in datas)
                        {
                            var elements = data.Trim().Split("\t".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).ToArray();
                            if (elements.Length == 0)
                                continue;
                            var datarow = dataTable.NewRow();
                            datarow[0] = elements[0];
                            datarow[1] = elements[1];
                            dataTable.Rows.Add(datarow);
                        }
                    }
                    int controllingId = 0;
                    this.dbFacade.BeginTrans();
                    dbFacade.ProcessScannedFingerPrints(int.Parse(sewaLookup.IdText), dtpFromTo.FromDate.Value, dtpFromTo.ToDate.Value, dataTable, ref controllingId);
                    if (controllingId <= 0)
                    {
                        this.dbFacade.RollbackTrans();
                    }
                    else
                    {
                        this.dbFacade.CommitTrans();
                        ShowScreen(UIModes.Query, controllingId.ToString());
                    }

                }
                else
                {
                    return;
                }
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
            UIManager.ShowMessage(MsgCodes.SaveMsg, string.Empty, MessageTypes.Plain);
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewFingerprintControllingDateSQLSelectQuery query = new ViewFingerprintControllingDateSQLSelectQuery();
            query.controlling_id.Equal(txtControllingId.DisplayText);
            query.controlling_id.IsExcluisive = true;
            query.sewa_id.Equal(sewaLookup.IdText);
            return dbFacade.ExecuteSelectQuery(query);
        }

        private DataTable CreateSewadarIdDateDataTable()
        {
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("sewadar_id", typeof(int));
            dataTable.Columns.Add("fp_scan_dtm", typeof(DateTime));
            return dataTable;
        }

        private void SetContolVisibility(bool visible)
        {
            grdFileSelection.Visible = !visible;
            btnFileSelect.Visible = !visible;
            FilePanel.Visible = !visible;
            txtControllingId.Visible = visible;
            txtProcessedDtm.Visible = visible;
            grdAttendanceRecorded.Visible = visible;
            grdIncompleteAttendance.Visible = visible;
            txtShift1.Visible = visible;
            txtShift2.Visible = visible;
            txtShift3.Visible = visible;
            lblAttendanceIncomplete.Visible = visible;
            lblAttendanceRecorded.Visible = visible;
        }

        private bool ValidateFilenames()
        {
            HashSet<string> fileList = new HashSet<string>();
            string duplicateFileNames = "";
            string invalidFileNames = "";
            foreach (DataGridViewRow row in grdFileSelection.Rows)
            {
                var filename = (string)row.Cells[0].Value;
                filename = filename.Trim();
                if (string.IsNullOrEmpty(filename))
                    continue;
                if (fileList.Contains(filename))
                {
                    duplicateFileNames += filename + ", ";
                    continue;
                }
                if (!File.Exists(filename))
                {
                    invalidFileNames += filename + ", ";
                    continue;
                }
                fileList.Add(filename);
            }
            if (!string.IsNullOrEmpty(duplicateFileNames))
            {
                MessageBox.Show(this, "Following duplicate files selected, \n" + duplicateFileNames, "Error",
                       MessageBoxButtons.OK, MessageBoxIcon.Error,
                       MessageBoxDefaultButton.Button1);
                return false;
            }
            if (!string.IsNullOrEmpty(invalidFileNames))
            {
                MessageBox.Show(this, "Following invalid files selected, \n" + invalidFileNames, "Error",
                       MessageBoxButtons.OK, MessageBoxIcon.Error,
                       MessageBoxDefaultButton.Button1);
                return false;
            }
            return true;
        }



        private void LoadGrids()
        {
            dbFacade.ClearDbTasks();
            Int32? intControllingId = Int32.Parse(this.txtControllingId.ValueText);
            this.dbFacade.AddDbTask(this.dbFacade.QueryScannedFingerprintsStoreAsTask(intControllingId));
            this.dbFacade.AddDbTask(this.dbFacade.QueryScannedFingerprintsAsTask(intControllingId));
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT = dSet.Tables[0];
            this.grdAttendanceRecorded.RetrieveRecords(dT, false, RowStates.Old);
            dT = dSet.Tables[1];
            this.grdIncompleteAttendance.RetrieveRecords(dT, false, RowStates.Old);
        }

        private void MakeEditableOnlyInQueryMode(bool isQueryMode)
        {
            this.txtControllingId.ReadOnly = !isQueryMode;
            this.sewaLookup.ReadOnly = !isQueryMode;
            this.dtpFromTo.ReadOnly = !isQueryMode;
        }

        private void btnFileSelect_Click(object sender, EventArgs e)
        {
            OpenFileDialog fileDialog = new OpenFileDialog();
            fileDialog.Filter = "DAT files (*.dat)|*.dat";
            var result = fileDialog.ShowDialog();
            if (result == DialogResult.OK)
            {
                if (fileDialog.CheckFileExists)
                {
                    var rowIdn = grdFileSelection.InsertRowBottom();
                    grdFileSelection.SetCurrentRow(rowIdn);
                    grdFileSelection.SetCellValue(0, fileDialog.FileName);
                }
            }
        }
    }
}
