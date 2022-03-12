using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Controller;

namespace DCC.UMB.CDF.Lookup.View
{
    public partial class LookupDialog : Form
    {
        private LookupDataProvider dataProvider = null;
        private DateTime lastSearchStringModifiedAt = DateTime.Now;
        private bool multiSelect = false;
        const int WIAT_MILLISCONDS = 150;
        const int SCROLL_BAR_WIDTH = 20;
        private LookupReturnModes returnMode = LookupReturnModes.None;

        ///[[A book keeping variable which is set to true when user has left a cell,
        //Just to indicate that the cell was left by the user while the dialog was visible        
        private bool hasUserLeftTheCell = false;
        //]]
        //private bool isInitialColumnWidthsSet = false;
        //bool enableNew;
        //bool enableUpdate;
        //bool enableReference;


        public LookupDialog()
        {
            try
            {
                InitializeComponent();
                //Control.CheckForIllegalCrossThreadCalls = false;

                this.dgvAvailableRecords.AllowUserToAddRows = false;
                this.dgvSelectedRecords.AllowUserToAddRows = false;
                this.dgvAvailableRecords.VirtualMode = true;
                this.dgvAvailableRecords.CellValueNeeded += new DataGridViewCellValueEventHandler(dgvAvailableRecords_CellValueNeeded);
                this.dgvSelectedRecords.VirtualMode = true;
                this.dgvSelectedRecords.CellValueNeeded += new DataGridViewCellValueEventHandler(dgvSelectedRecords_CellValueNeeded);

                //add the resizing handlers, so that at the time of resizing of the grid, the columns adjust automatically
                this.dgvAvailableRecords.Resize += new EventHandler(dgvAvailableRecords_Resize);
                this.dgvSelectedRecords.Resize += new EventHandler(dgvSelectedRecords_Resize);

                DataGridViewCellStyle cellStyle = new DataGridViewCellStyle(this.dgvAvailableRecords.ColumnHeadersDefaultCellStyle);

                Font font = new Font(cellStyle.Font, FontStyle.Regular);
                cellStyle.Font = font;
                cellStyle.ForeColor = Color.Navy;
                cellStyle.WrapMode = DataGridViewTriState.False;
                this.dgvAvailableRecords.DefaultCellStyle = cellStyle;
                this.dgvSelectedRecords.DefaultCellStyle = cellStyle;
                foreach (LookupSearchOperators opr in Enum.GetValues(typeof(LookupSearchOperators)))
                {
                    this.cmbSearchOperator.Items.Add(opr);
                }
                this.cmbSearchOperator.SelectedItem = LookupSearchOperators.StartsWith;

            }
            catch (Exception ex)
            {
                throw;
            }
        }


        void dgvAvailableRecords_Resize(object sender, EventArgs e)
        {
            SetWidthsOfDataGridColumns();
        }

        void dgvSelectedRecords_Resize(object sender, EventArgs e)
        {
            SetWidthsOfDataGridColumns();
        }

        void dgvAvailableRecords_CellValueNeeded(object sender, DataGridViewCellValueEventArgs e)
        {
            this.Cursor = Cursors.WaitCursor;
            try
            {
                LookupColumn selectedLookupColumn = (LookupColumn)this.dgvAvailableRecords.Columns[e.ColumnIndex];

                e.Value = this.dataProvider.GetCellValueForAvailableRecordsGrid(e.RowIndex, selectedLookupColumn.AliasName);
                //reset the row count, as the dataprovider might have fetched more rows.
                if (this.dataProvider.RowCountForAvailableRecordsTable > 0)
                {
                    this.dgvAvailableRecords.RowCount = this.dataProvider.RowCountForAvailableRecordsTable;
                }

            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                this.Cursor = Cursors.Arrow;
            }
        }
        void dgvSelectedRecords_CellValueNeeded(object sender, DataGridViewCellValueEventArgs e)
        {
            try
            {
                LookupColumn selectedLookupColumn = (LookupColumn)this.dgvSelectedRecords.Columns[e.ColumnIndex];
                e.Value = this.dataProvider.GetCellValueForSelectedRecordsGrid(e.RowIndex, selectedLookupColumn.AliasName);
                //reset the row count, as the dataprovider might have fetched more rows.
                if (this.dataProvider.RowCountForSelectedRecordsTable > 0)
                {
                    this.dgvSelectedRecords.RowCount = this.dataProvider.RowCountForSelectedRecordsTable;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //[[this property is used to show a message to the user that minimum n characters are required to be punched in before a query is fired.
        private int minCharactersForQuery = 0;
        internal int MinimumCharactersForQuery
        {
            get { return this.minCharactersForQuery; }
            set
            {
                this.minCharactersForQuery = value;
                if (this.minCharactersForQuery > 0)
                {
                    if (!this.lblSearchString.Text.Contains("Min."))
                    {
                        this.lblSearchString.Text += "Min " + minCharactersForQuery + " chars. reqd.";
                        this.lblSearchString.ForeColor = Color.Maroon;
                    }
                }
            }
        }
        //]]
        internal LookupResult ShowLookup(LookupDataProvider dataProvider,
                                        IWin32Window owner,
                                        LookupSearchModes searchMode,
                                        int dialogWidth,
                                        bool isMultiSelect,
                                        bool enableNew,
                                        bool enableUpdate,
                                        bool enableReference,
                                        string lookupTitle,
                                        Control invokingControl)
        {
            try
            {
                //[[Set the title of the lookup dialog
                if (string.IsNullOrEmpty(lookupTitle))
                {
                    this.Text = this.MultiSelect ? "Select values" : "Select a value";
                }
                else
                {
                    lookupTitle = lookupTitle.Replace("&", "");
                    this.Text = this.MultiSelect ? "Select values for " + lookupTitle : "Select a " + lookupTitle;
                }//]]

                this.dataProvider = dataProvider;
                this.btnNew.Enabled = enableNew;
                this.btnUpdate.Enabled = enableUpdate;
                this.btnReference.Enabled = enableReference;

                lastSearchStringModifiedAt = DateTime.Now;//Just to avoid the first automatic loading.                
                SetSearchOnComboBox();
                SetSearchString(dataProvider.SearchString);
                AddColumnsInGrid();
                ReloadResults();
                this.multiSelect = isMultiSelect;
                if (MultiSelect)
                {
                    this.spltResultPanel.Panel2.Enabled = true;
                    this.spltResultPanel.SplitterWidth = 5;
                    this.spltResultPanel.IsSplitterFixed = false;
                    this.spltResultPanel.SplitterDistance = (this.Width / 2) - 30;//30 is half of the panel containing buttons
                    this.spltResultPanel.Panel1.Bounds = new Rectangle(0, 0, 0, 0);
                    this.dgvSelectedRecords.MultiSelect = true;
                    this.dgvAvailableRecords.MultiSelect = true;
                }
                else
                {
                    this.spltResultPanel.Panel2.Enabled = false;
                    this.spltResultPanel.SplitterWidth = 1;
                    this.spltResultPanel.IsSplitterFixed = true;
                    this.spltResultPanel.SplitterDistance = this.Width;
                    this.spltResultPanel.Panel1.Bounds = new Rectangle(0, 0, 0, 0);
                    this.dgvSelectedRecords.MultiSelect = false;
                    this.dgvAvailableRecords.MultiSelect = false;
                }
                this.Width = dialogWidth;
                this.Height = (int)(dialogWidth * 0.75);
                this.dgvAvailableRecords.Focus();
                this.mtxtSearchString.SelectionStart = this.mtxtSearchString.Text.Length;
                Point controlLocationOnScreen = invokingControl.PointToScreen(new Point(0,0));
                int a, b, c, d;
                a = controlLocationOnScreen.Y;
                b = invokingControl.Height;
                c = this.Height;
                d = Screen.GetWorkingArea(invokingControl).Height;
                this.StartPosition = FormStartPosition.Manual;
                //[[compute the x location of the looku dialog
                int xLocation = 100;
                if (controlLocationOnScreen.X + this.Width < Screen.GetWorkingArea(invokingControl).Width)
                {
                    xLocation = controlLocationOnScreen.X;
                }
                else
                {
                    xLocation = controlLocationOnScreen.X - ((controlLocationOnScreen.X + this.Width)-Screen.GetWorkingArea(invokingControl).Width );
                }
                //]]

                if (a + b + c < d)
                {                    
                    this.Location = new Point(xLocation, a + b);

                }
                else if (a + b > c)
                {
                    this.Location = new Point(xLocation, 0);
                }
                else
                {
                    this.StartPosition = FormStartPosition.CenterParent;
                }
                this.ShowDialog(owner);
                return dataProvider.CreateResult(this.returnMode, this.chkAppend.Checked);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool MultiSelect
        {
            get { return multiSelect; }
            set { multiSelect = value; this.dgvAvailableRecords.MultiSelect = value; }
        }

        private void AddColumnsInGrid()
        {
            this.dgvSelectedRecords.Columns.Clear();
            this.dgvAvailableRecords.Columns.Clear();
            for (int i = 0; i < dataProvider.LookupColumns.Count; i++)
            {
                try
                {
                    LookupColumn colForResultsGrid = dataProvider.LookupColumns[i];
                    LookupColumn colForSelectedRecordsGrid = new LookupColumn(colForResultsGrid.Caption, colForResultsGrid.SqlName, colForResultsGrid.AliasName, colForResultsGrid.PercentageWidth, colForResultsGrid.TablePrefix);
                    //LookupDataGridViewColumn col = new LookupDataGridViewColumn(lookupColumn);
                    //colForResultsGrid.Width = (this.Width - 50) * colForResultsGrid.PercentageWidth / 100;
                    //colForSelectedRecordsGrid.Width = (this.Width - 50) * colForSelectedRecordsGrid.PercentageWidth / 100;
                    this.dgvAvailableRecords.Columns.Add(colForResultsGrid);
                    colForResultsGrid.Resizable = DataGridViewTriState.True;
                    this.dgvSelectedRecords.Columns.Add(colForSelectedRecordsGrid);
                    colForSelectedRecordsGrid.Resizable = DataGridViewTriState.True;
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
            SetWidthsOfDataGridColumns();
        }
        private void SetWidthsOfDataGridColumns()
        {
            ScrollBar verticalScrollbar = this.dgvAvailableRecords.VerticalScrollBar;
            int scrollBarWidth = 0;
            if (verticalScrollbar.Visible || !this.Visible)
            {
                scrollBarWidth = verticalScrollbar.Width;
            }
            int rowHeadersWidth = 0;
            if (this.dgvAvailableRecords.RowHeadersVisible)
            {
                rowHeadersWidth = this.dgvAvailableRecords.RowHeadersWidth;
            }
            int availableTotalWidthOfAvailableRecordsGrid = (this.dgvAvailableRecords.Width - scrollBarWidth - rowHeadersWidth);

            verticalScrollbar = this.dgvSelectedRecords.VerticalScrollBar;
            scrollBarWidth = 0;
            if (verticalScrollbar.Visible && !this.Visible)
            {
                scrollBarWidth = verticalScrollbar.Width;
            }

            int availableTotalWidthOfSelectedRecordsGrid = (this.dgvSelectedRecords.Width - scrollBarWidth - rowHeadersWidth);
            for (int i = 0; i < dataProvider.LookupColumns.Count; i++)
            {
                try
                {
                    LookupColumn colForAvailableRecordsGrid = (LookupColumn)this.dgvAvailableRecords.Columns[i];
                    LookupColumn colForSelectedRecordsGrid = (LookupColumn)this.dgvSelectedRecords.Columns[i];
                    //LookupDataGridViewColumn col = new LookupDataGridViewColumn(lookupColumn);
                    colForAvailableRecordsGrid.Width = (availableTotalWidthOfAvailableRecordsGrid - 2) * colForAvailableRecordsGrid.PercentageWidth / 100;
                    colForSelectedRecordsGrid.Width = (availableTotalWidthOfSelectedRecordsGrid - 2) * colForSelectedRecordsGrid.PercentageWidth / 100;
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
        }

        private void ReloadResults()
        {
            try
            {
                this.Cursor = Cursors.WaitCursor;
                this.dataProvider.ReloadResults(this.mtxtSearchString.Text, (LookupColumn)this.cmbSearchOn.SelectedItem, (LookupSearchOperators)this.cmbSearchOperator.SelectedItem);
                this.dgvAvailableRecords.RowCount = this.dataProvider.RowCountForAvailableRecordsTable;
                this.dgvAvailableRecords.Refresh();
                SetWidthsOfDataGridColumns();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                this.Cursor = Cursors.Arrow;
            }
        }

        private void SetSearchString(string searchString)
        {
            LookupColumn column = (LookupColumn)this.cmbSearchOn.SelectedItem;
            ///set the mask on the search field based upon the selected column, in the combobox
            ///@tobe done
            this.mtxtSearchString.Mask = null;
            this.mtxtSearchString.Text = searchString;
        }

        private void SetSearchOnComboBox()
        {
            this.cmbSearchOn.DataSource = dataProvider.LookupColumns;
            this.cmbSearchOn.DisplayMember = "Caption";
            foreach (LookupColumn col in dataProvider.LookupColumns)
            {
                if (col.IsDisplayMemberColumn)
                {
                    this.cmbSearchOn.SelectedItem = col;
                    break;
                }
            }
        }

        private void cmbSearchOn_SelectedIndexChanged(object sender, EventArgs e)
        {
            //NOTE: DONT ENABLE THIS. It gets fired when user moves between cells and the entire records are erased
            //NotifyTypingStarted();
        }

        private void mtxtSearchString_TextChanged(object sender, EventArgs e)
        {
            NotifyTypingStarted();
        }

        private void typingTimer_Tick(object sender, EventArgs e)
        {
            try
            {
                TimeSpan span = DateTime.Now.Subtract(lastSearchStringModifiedAt);
                if (span.TotalMilliseconds > WIAT_MILLISCONDS)
                {
                    ReloadResults();
                    typingTimer.Stop();
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
        }

        private void mtxtSearchString_KeyUp(object sender, KeyEventArgs e)
        {
            //NotifyTypingStarted();
        }
        private void NotifyTypingStarted()
        {
            lastSearchStringModifiedAt = DateTime.Now;
            typingTimer.Stop();
            typingTimer.Start();
        }

        private void btnSelectRecord_Click(object sender, EventArgs e)
        {
            MoveSelectedRecordsToSelectedRecordsGrid();
        }

        private void MoveSelectedRecordsToSelectedRecordsGrid()
        {
            List<int> selectedRowIndices = new List<int>();
            for (int i = 0; i < this.dgvAvailableRecords.SelectedCells.Count; i++)
            {
                if (!selectedRowIndices.Contains(this.dgvAvailableRecords.SelectedCells[i].RowIndex))
                {
                    selectedRowIndices.Add(this.dgvAvailableRecords.SelectedCells[i].RowIndex);
                }
            }
            dataProvider.TransferSelectedRecords(selectedRowIndices.ToArray());
            InvlaidateSelectedRecrdsDataGridView();
        }

        private void btnSelectAllRecords_Click(object sender, EventArgs e)
        {
            dataProvider.TransferAllRecords();
            InvlaidateSelectedRecrdsDataGridView();
        }

        private void btnRejectRecord_Click(object sender, EventArgs e)
        {
            RemoveSelectedRecordsFromSelectedRecordsGrid();
        }

        private void RemoveSelectedRecordsFromSelectedRecordsGrid()
        {
            try
            {
                List<int> selectedRowIndices = new List<int>();
                for (int i = 0; i < this.dgvSelectedRecords.SelectedCells.Count; i++)
                {
                    if (!selectedRowIndices.Contains(this.dgvSelectedRecords.SelectedCells[i].RowIndex))
                    {
                        selectedRowIndices.Add(this.dgvSelectedRecords.SelectedCells[i].RowIndex);
                    }
                }
                dataProvider.RejectSelectedRecords(selectedRowIndices.ToArray());
                InvlaidateSelectedRecrdsDataGridView();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void btnRejectAllRecords_Click(object sender, EventArgs e)
        {
            dataProvider.RejectAllRecords();
            InvlaidateSelectedRecrdsDataGridView();
        }

        private void InvlaidateSelectedRecrdsDataGridView()
        {
            //ThreadStart ts = new ThreadStart(InvlaidateSelectedRecrdsDataGridView);
            //Thread thread = new Thread(ts);
            //thread.Start();
            //InvlaidateSelectedRecrdsDataGridView123();
            this.dgvSelectedRecords.RowCount = dataProvider.RowCountForSelectedRecordsTable;
            this.dgvSelectedRecords.Refresh();
        }

        private void dgvAvailableRecords_DoubleClick(object sender, EventArgs e)
        {
            if (dgvAvailableRecords.RowCount <= 0 || this.dgvAvailableRecords.SelectedCells.Count <= 0) {
                return;
            }
            int mouseClickedAt = ((MouseEventArgs)e).Y;
            int heightOfColumnHeader = dgvAvailableRecords.ColumnHeadersHeight;
            if (heightOfColumnHeader >= mouseClickedAt) return;
            if (this.multiSelect)
            {
                this.MoveSelectedRecordsToSelectedRecordsGrid();
            }
            else
            {
                dataProvider.RejectAllRecords();
                this.MoveSelectedRecordsToSelectedRecordsGrid();
                this.returnMode = LookupReturnModes.Select;
                this.Close();
            }
        }

        private void dgvSelectedRecords_DoubleClick(object sender, EventArgs e)
        {
            int mouseClickedAt = ((MouseEventArgs)e).Y;
            int heightOfColumnHeader = dgvSelectedRecords.ColumnHeadersHeight;
            if (heightOfColumnHeader >= mouseClickedAt) return;
            if (this.multiSelect)
            {
                this.RemoveSelectedRecordsFromSelectedRecordsGrid();
            }
        }



        private void dgvAvailableRecords_CurrentCellChanged(object sender, EventArgs e)
        {
            try
            {
                ///[[set the combobox value to the column in which the user is moving
                if (!hasUserLeftTheCell)
                {
                    return;
                }
                if (dgvAvailableRecords.CurrentCell == null) return;
                LookupColumn currentColumn = (LookupColumn)dgvAvailableRecords.Columns[dgvAvailableRecords.CurrentCell.ColumnIndex];
                this.cmbSearchOn.SelectedItem = currentColumn;
                hasUserLeftTheCell = false;
                //]]
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void dgvAvailableRecords_CellLeave(object sender, DataGridViewCellEventArgs e)
        {
            hasUserLeftTheCell = true;
        }





        private void dgvSelectedRecords_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete)
            {
                this.RemoveSelectedRecordsFromSelectedRecordsGrid();
                e.Handled = true;
                e.SuppressKeyPress = false;
            }
        }

        private void dgvAvailableRecords_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                ProcessHighlightedRecordsInAvailableRecordsGrid();
                e.Handled = true;
                e.SuppressKeyPress = true;
            }
        }

        private void ProcessHighlightedRecordsInAvailableRecordsGrid()
        {
            if (this.multiSelect)
            {
                this.MoveSelectedRecordsToSelectedRecordsGrid();
                //e.Handled = true;
                //e.SuppressKeyPress = true;
            }
            else
            {
                //remove all the records from the selected records grid and add this one only
                dataProvider.RejectAllRecords();
                this.MoveSelectedRecordsToSelectedRecordsGrid();
                this.returnMode = LookupReturnModes.Select;
                ///[[make a check here that there should be a record selected
                //there can be a case where there is no record in the availableRecardsTable
                //and user presses Enter key. In that case, nothing should happen, and the dialog 
                //should not close.
                if (dataProvider.RowCountForSelectedRecordsTable == 0)
                {
                    return;
                }
                //]]
                this.typingTimer.Enabled = false;
                this.Close();
            }

        }

        private void mtxtSearchString_KeyPress(object sender, KeyPressEventArgs e)
        {
            NotifyTypingStarted();
        }

        private void mtxtSearchString_Enter(object sender, EventArgs e)
        {
            //this.mtxtSearchString.SelectionStart = 0;
            //this.mtxtSearchString.SelectionLength = this.mtxtSearchString.Text.Length;
        }

        private void dgvAvailableRecords_ColumnHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            string sortPrefix = ResetSortOrderOfAllColumns((LookupColumn)this.dgvAvailableRecords.Columns[e.ColumnIndex]);
            dataProvider.SortAvailableRecordsTable((LookupColumn)this.dgvAvailableRecords.Columns[e.ColumnIndex], sortPrefix);
            this.dgvAvailableRecords.Invalidate();
        }

        private void dgvSelectedRecords_ColumnHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            string sortPrefix = ResetSortOrderOfAllColumns((LookupColumn)this.dgvSelectedRecords.Columns[e.ColumnIndex]);
            dataProvider.SortSelectedRecordsTable((LookupColumn)this.dgvSelectedRecords.Columns[e.ColumnIndex], sortPrefix);
            this.dgvSelectedRecords.Invalidate();
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            MakeLookupResultAndCloseDialog();
        }

        private void MakeLookupResultAndCloseDialog()
        {
            if (!this.multiSelect)
            {
                dataProvider.RejectAllRecords();
                this.MoveSelectedRecordsToSelectedRecordsGrid();
            }
            if (!dataProvider.IsAnyRecordSelected())
            {
                return;
            }
            this.returnMode = LookupReturnModes.Select;
            this.Close();
        }


        private string ResetSortOrderOfAllColumns(LookupColumn lookupColumn)
        {
            Console.WriteLine("Property value is : " + this.dgvAvailableRecords.AllowUserToResizeColumns);
            DataGridViewColumnCollection lstLookupColumns = lookupColumn.DataGridView.Columns;
            foreach (LookupColumn col in lstLookupColumns)
            {
                if (col != lookupColumn) col.SortOrder = SortOrder.None;
            }
            string sortPrefix = "";
            if (lookupColumn.SortOrder == SortOrder.None || lookupColumn.SortOrder == SortOrder.Descending)
            {
                lookupColumn.SortOrder = SortOrder.Ascending;
            }
            else
            {
                lookupColumn.SortOrder = SortOrder.Descending;
                sortPrefix = " desc";
            }
            return sortPrefix;
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            this.returnMode = LookupReturnModes.New;
            dataProvider.RejectAllRecords();
            this.Close();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!this.multiSelect)
            {
                dataProvider.RejectAllRecords();
                this.MoveSelectedRecordsToSelectedRecordsGrid();
            }
            this.returnMode = LookupReturnModes.Update;
            this.Close();
        }

        private void btnReference_Click(object sender, EventArgs e)
        {
            if (!this.multiSelect)
            {
                dataProvider.RejectAllRecords();
                this.MoveSelectedRecordsToSelectedRecordsGrid();
            }
            this.returnMode = LookupReturnModes.Reference;
            this.Close();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.returnMode = LookupReturnModes.None;
            dataProvider.RejectAllRecords();
            this.Close();
        }

        private void LookupDialog_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
            {
                this.returnMode = LookupReturnModes.None;
                dataProvider.RejectAllRecords();
                this.Close();
            }

        }

        private void LookupDialog_Activated(object sender, EventArgs e)
        {
            this.mtxtSearchString.Focus();
        }

        private void btnDone_Click(object sender, EventArgs e)
        {
            this.MakeLookupResultAndCloseDialog();
        }

        private void btnExit_Click_1(object sender, EventArgs e)
        {

        }

        private void LookupDialog_KeyDown(object sender, KeyEventArgs e)
        {
            //if up or down arrow key is pressed and the focus is not on the available-records-grid, then shift focus on that and start
            //selection of the rows in the grid.
            if (e.KeyCode == Keys.Up || e.KeyCode == Keys.Down)
            {
                if (!this.dgvAvailableRecords.Focused)
                {
                    if(this.dgvAvailableRecords.RowCount<=0)
                    {
                        return;
                    }
                    this.dgvAvailableRecords.Focus();
                    DataGridViewCell cell = this.dgvAvailableRecords.CurrentCell;
                    if (cell == null) return;
                    if (e.KeyCode == Keys.Up)
                    {
                        if (cell.RowIndex > 0)
                        {
                            this.dgvAvailableRecords.CurrentCell = this.dgvAvailableRecords[cell.ColumnIndex, cell.RowIndex - 1];
                        }
                    }
                    else if (e.KeyCode == Keys.Down)
                    {
                        if (cell.RowIndex < this.dgvAvailableRecords.Rows.Count - 1)
                        {
                            this.dgvAvailableRecords.CurrentCell = this.dgvAvailableRecords[cell.ColumnIndex, cell.RowIndex + 1];
                        }
                    }
                }
            }
            else if (e.KeyCode == Keys.Back || e.KeyCode == Keys.Delete)
            {
                if (!this.mtxtSearchString.Focused)
                {
                    this.mtxtSearchString.Focus();
                    int currentCaretLocation = this.mtxtSearchString.SelectionStart;
                    string fullText = this.mtxtSearchString.Text;

                    string strBeforeCaret = fullText.Substring(0, currentCaretLocation);
                    string strAfterCaret = fullText.Substring(currentCaretLocation);
                    if (e.KeyCode == Keys.Back)
                    {
                        strBeforeCaret = string.IsNullOrEmpty(strBeforeCaret) ? strBeforeCaret : strBeforeCaret.Substring(0, strBeforeCaret.Length - 1);
                        this.mtxtSearchString.Text = strBeforeCaret + strAfterCaret;
                        this.mtxtSearchString.SelectionStart = currentCaretLocation == 0 ? currentCaretLocation : currentCaretLocation - 1;
                    }
                    else if (e.KeyCode == Keys.Delete)
                    {
                        strAfterCaret = string.IsNullOrEmpty(strAfterCaret) ? strAfterCaret : strAfterCaret.Substring(1);
                        this.mtxtSearchString.Text = strBeforeCaret + strAfterCaret;
                        this.mtxtSearchString.SelectionStart = currentCaretLocation;
                    }
                }
            }
            else if (e.KeyCode == Keys.Enter)
            {
                if (this.mtxtSearchString.Focused)
                {
                    ProcessHighlightedRecordsInAvailableRecordsGrid();
                }
            }
        }

        private void LookupDialog_KeyPress(object sender, KeyPressEventArgs e)
        {
            //[[If the search box is not in focus, and the key pressed is ascii key (keypress is fired only on ascii keys)
            //then send these keys on to the search box.
            if (mtxtSearchString.Focused) return;
            int intKey = (int)e.KeyChar;

            if (intKey >= 32 && intKey <= 126)
            {
                this.mtxtSearchString.Focus();
                this.mtxtSearchString.SelectedText = ((char)e.KeyChar).ToString();
            }
            //]]
        }

    }

}