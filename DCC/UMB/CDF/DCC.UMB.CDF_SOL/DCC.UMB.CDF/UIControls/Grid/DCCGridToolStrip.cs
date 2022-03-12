using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.Utils;
using System.Diagnostics;

namespace DCC.UMB.CDF.UIControls.Grid
{
    public partial class DCCGridToolStrip : UserControl
    {
        private static int BUTTON_HEIGHT = 22;
        private DCCGrid grid = null;

        public DCCGridToolStrip()
        {
            InitializeComponent();
        }

        public bool InsertBeforeVisible
        {
            get
            {
                return this.btnInsertBefore.Visible;
            }
            set
            {
                this.btnInsertBefore.Visible = value;
                AdjustLayout(btnInsertBefore, value);
            }
        }

        public bool InsertAfterVisible
        {
            get
            {
                return this.btnInsertAfter.Visible;
            }
            set
            {
                this.btnInsertAfter.Visible = value;
                AdjustLayout(btnInsertAfter, value);
            }
        }
        public bool InsertLastVisible
        {
            get
            {
                return this.btnInsertLast.Visible;
            }
            set
            {
                this.btnInsertLast.Visible = value;
                AdjustLayout(btnInsertLast, value);
            }
        }
        public bool MoveUpVisible
        {
            get
            {
                return this.btnMoveUp.Visible;
            }
            set
            {
                this.btnMoveUp.Visible = value;
                AdjustLayout(btnMoveUp, value);
            }
        }
        public bool MoveDownVisible
        {
            get
            {
                return this.btnMoveDown.Visible;
            }
            set
            {
                this.btnMoveDown.Visible = value;
                AdjustLayout(btnMoveDown, value);
            }
        }
        public bool DeleteVisible
        {
            get
            {
                return this.btnDelete.Visible;
            }
            set
            {
                this.btnDelete.Visible = value;
                AdjustLayout(btnDelete, value);
            }
        }
        public bool ExportToExcelVisible
        {
            get
            {
                return this.btnExportToExcel.Visible;
            }
            set
            {
                this.btnExportToExcel.Visible = value;
                AdjustLayout(btnExportToExcel, value);
            }
        }
        public DCCGrid Grid
        {
            get
            {
                return this.grid;
            }
            set
            {
                this.grid = value;
                if (this.grid != null)
                {
                    EnableDisableNavigationButtons();
                    this.grid.SizeChanged += new EventHandler(grid_SizeChanged);
                    this.grid.RowSelectionModified += new EventHandler<GridRowSelectionModifiedEventArgs>(grid_RowSelectionModified);
                    this.grid.Rows.CollectionChanged += new CollectionChangeEventHandler(Rows_CollectionChanged);
                }
            }
        }

        void Rows_CollectionChanged(object sender, CollectionChangeEventArgs e)
        {
            EnableDisableNavigationButtons();
        }

        void grid_RowSelectionModified(object sender, GridRowSelectionModifiedEventArgs e)
        {
            EnableDisableNavigationButtons();
        }
        internal void EnableDisableNavigationButtons()
        {       
            if (this.grid==null || this.grid.Rows.Count == 0)
            {
                ///[[Toolbar items
                this.btnMoveDown.Enabled = false;
                this.btnMoveUp.Enabled = false;
                
                this.btnInsertBefore.Enabled = false;
                this.btnInsertAfter.Enabled = false;
                this.btnInsertLast.Enabled =  true;
                this.btnDelete.Enabled = false;
                ///]]
                return;
            }
            this.btnMoveDown.Enabled = !IsSummaryGridLastRow() ;
            this.btnMoveUp.Enabled = !IsSummaryGridFirstRow() ;
           
            this.btnInsertBefore.Enabled = Grid.Rows.Count > 0;
            this.btnInsertAfter.Enabled = Grid.Rows.Count > 0;
            this.btnDelete.Enabled = Grid.Rows.Count > 0; ;
            this.btnInsertLast.Enabled = Grid.Rows.Count > 0;
        }
        private bool IsSummaryGridLastRow()
        {
            return Grid.CurrentRowIndex == (Grid.Rows.Count - 1);
        }
        private bool IsSummaryGridFirstRow()
        {
            return Grid.CurrentRowIndex == 0;
        }

        void grid_SizeChanged(object sender, EventArgs e)
        {        
            this.dccTableLayoutPanel1.RowStyles[0].Height = this.grid.ColumnHeadersHeight;
        }

        private void AdjustLayout(Control control, bool visible)
        {
            //[[The control is in table layout, if it is visible, then the height of the row in which this control exists should be set to the pre-specified height
            //else to zero.            
            this.dccTableLayoutPanel1.RowStyles[this.dccTableLayoutPanel1.GetRow(control)].Height = visible ? BUTTON_HEIGHT : 0;            
            //]]
        }

        private void btnInsertBefore_Click(object sender, EventArgs e)
        {
            if (this.grid.InsertRowsMenuItemsEnabled) { this.grid.InsertRowAbove(); }
        }

        private void btnInsertAfter_Click(object sender, EventArgs e)
        {
            if (this.grid.InsertRowsMenuItemsEnabled) { this.grid.InsertRowBelow(); }
        }

        private void btnInsertLast_Click(object sender, EventArgs e)
        {
            if (this.grid.InsertRowsMenuItemsEnabled) { this.grid.InsertRowBottom(); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (this.grid.DeleteRowMenuEnabled) { this.grid.DeleteRow(); }
        }

        private void btnMoveUp_Click(object sender, EventArgs e)
        {
            this.grid.MoveRowUp();
        }

        private void btnMoveDown_Click(object sender, EventArgs e)
        {
            this.grid.MoveRowDown();

        }

        private void btnExportToExcel_Click(object sender, EventArgs e)
        {
            Guid UITxn = Guid.Empty;
            try
            {
                UITxn = DCC.UMB.CDF.MGMT.View.CursorManager.BeginTransaction("Exporting data to excel", true, this.btnExportToExcel);
                DataTable exportedTable = this.grid.ExportGridModelData(false, false);
                SaveFileDialog dialog = new SaveFileDialog();

                dialog.OverwritePrompt = true;
                dialog.Filter = "Excel Files(*.xls)|*.xls";
                DialogResult result = dialog.ShowDialog();
                if (result == DialogResult.OK)
                {
                    string selectedFile = dialog.FileName;
                    UtilityManager.ExportDataTableToExcel(exportedTable, selectedFile);
                    Process.Start(dialog.FileName);
                }
            }
            catch (Exception ex)
            {
                DCC.UMB.CDF.MGMT.Controller.UIManager.DisposeException(ex);
            }
            finally
            {
                DCC.UMB.CDF.MGMT.View.CursorManager.EndTransaction(UITxn);
            }
        }

       
    }
}
