using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid.Column;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.UIAutomation;
using DCC.UMB.CDF.Utils;
using System.Text;
using System.Reflection;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.UIControls.Containers;

namespace DCC.UMB.CDF.UIControls.Grid
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCGrid.bmp")]
    public partial class DCCGrid : DataGridView, IUIAutomationCodeProvider, IDCCControl
    {
        /// <summary>
        /// This will be used to show the command strip on this grid.
        /// </summary>
        DCCGridToolStrip toolStripForGridCommands = null;

        /// <summary>
        /// This even is raised when the selection of the row has changed.
        /// </summary>
        public event EventHandler<GridRowSelectionModifiedEventArgs> RowSelectionModified;

        public event EventHandler<ComboBoxSelectionModifiedEventArgs> ComboBoxSelectionModified;

        /// <summary>
        /// This even is raised when the selection of the row has changed.
        /// </summary>
        public event EventHandler<RecordsRetrievedEventArgs> RecordsRetrieved;


        /// <summary>
        /// This event is raised when grid data is cleared (in method RemoveAllRecords)
        /// </summary>
        public event EventHandler<EventArgs> GridCleared;

        /// <summary>
        /// This event is raised when user tries to leave the current row.
        /// </summary>
        public event EventHandler<ValidateRowEventArgs> ValidateRow;

        /// <summary>
        /// This event is raised just before a Lookup is shown on a cell. 
        /// </summary>
        public event EventHandler<LookupEventArgs> LookupDialogShowing;

        /// <summary>
        /// This event is raised just after the lookup result is set into 
        /// the cell on which the lookup dialog is invoked.
        /// </summary>
        public event EventHandler<LookupResultEventArgs> LookupResultSet;


        private GridDataModel gridDataModel = null;

        private UIModes mode = UIModes.None;
        private static DCCDataGridViewCellStyle dccGridColumnHeaderCellStyle = new DCCDataGridViewCellStyle();

        //[[This falg indicates whether or not sorting is allowed (when user clicks on the column headers)
        private bool allowRowSorting = false;
        //]]
        private int previouslySelectedRowIndex;
        private UserModes userMode = UserModes.Auto;

        //[[This flag specifies if this grid should have atleaset one reocord for it to be a valid grid
        private bool isMandatory = false;
        //]]

        //[[These two falgs will specify wither or not these menu items will be disabled.
        bool insertRowsMenuItemsEnabled = true;
        bool deleteRowMenuEnabled = true;
        //]]
        ///[[Declare the event using EventHandler<T>
        /// <summary>
        /// Occurs when a cell of type button is clicked.
        /// </summary>
        public event EventHandler<ButtonCellEventArgs> ButtonCellClicked;
        //]]

        ///[[Declare the event using EventHandler<T>
        /// <summary>
        /// Occurs when a cell of type link is clicked.
        /// </summary>
        public event EventHandler<LinkCellClickedEventArgs> LinkCellClicked;
        //]]


        /// <summary>
        /// [[Declare the event using EventHandler<T>. This event will be raised
        /// when a new row in "None" mode is added
        /// </summary>
        public event EventHandler<FillDefaultCellValuesEventArgs> FillDefaultCellValues;

        /// <summary>
        /// This event is raised just before the row is getting deleted
        /// </summary>
        public event EventHandler<RowDeletingEventArgs> RowDeleting;

        /// <summary>
        /// This event is raised when the row is deleted.
        /// </summary>
        public event EventHandler<RowDeletedEventArgs> RowDeleted;





        /// <summary>
        /// This list will contain the objects of type DCCGridUniqueConstraint. This list is
        /// used while validating the row.
        /// </summary>
        private List<DCCGridUniqueConstraint> uniqueConstraints = new List<DCCGridUniqueConstraint>();

        private List<DCCGridColumn> lstSortByColumns = new List<DCCGridColumn>();

        private bool isCtrlKeyDown = false;

        private EventHandler comboBoxSelectDelegate = null;

        public DCCGrid()
        {
            //initialize the datamodel for the grid
            InitializeComponent();
            this.MultiSelect = false;
            this.ScrollBars = ScrollBars.Both;
            this.gridDataModel = new GridDataModel(this);
            this.VirtualMode = true;
            this.StandardTab = false;
            this.CellValuePushed += new DataGridViewCellValueEventHandler(DCCGrid_CellValuePushed);
            this.CellValueNeeded += new DataGridViewCellValueEventHandler(DCCGrid_CellValueNeeded);
            this.CellBeginEdit += new DataGridViewCellCancelEventHandler(DCCGrid_CellBeginEdit);
            this.DataError += new DataGridViewDataErrorEventHandler(DCCGrid_DataError);
            this.AllowUserToAddRows = false;
            this.RowValidating += new DataGridViewCellCancelEventHandler(DCCGrid_RowValidating);
            this.CellLeave += new DataGridViewCellEventHandler(DCCGrid_CellLeave);
            this.CurrentCellChanged += new EventHandler(DCCGrid_CurrentCellChanged);
            this.SizeChanged += new EventHandler(DCCGrid_SizeChanged);
            this.ColumnAdded += new DataGridViewColumnEventHandler(DCCGrid_ColumnAdded);
            this.DoubleBuffered = true;
            this.RowLeave += new DataGridViewCellEventHandler(DCCGrid_RowLeave);
            this.ColumnHeaderMouseClick += new DataGridViewCellMouseEventHandler(DCCGrid_ColumnHeaderMouseClick);
            //[[These two events are defined to capture if the control key is down or not. 
            //This flag(isCtrlKeyDown) is used in doing multi column sorting. If user holds the control key and then clicks on the
            //column header, all prevous multiple sort colums are ignred and clicked column is taken as
            //the column for fresh sort
            this.KeyDown += new KeyEventHandler(DCCGrid_KeyDown);
            this.KeyUp += new KeyEventHandler(DCCGrid_KeyUp);
            this.EditMode = DataGridViewEditMode.EditOnKeystrokeOrF2;
            //]]
            this.EditingControlShowing += new DataGridViewEditingControlShowingEventHandler(DCCGrid_EditingControlShowing);
            this.comboBoxSelectDelegate = new EventHandler(combo_SelectionChangeCommitted);
            this.CellToolTipTextNeeded += new DataGridViewCellToolTipTextNeededEventHandler(DCCGrid_CellToolTipTextNeeded);

        }

        void DCCGrid_CellToolTipTextNeeded(object sender, DataGridViewCellToolTipTextNeededEventArgs e)
        {
            try
            {
                if (e.RowIndex < 0 || e.ColumnIndex < 0) return;//if user is hovering over column header or row header then return
                //[[If the column currently hovered is of type lookup and has a valid lookup result stored in cell and 
                //has tooltipLookupField property defined then show the tooltip from the lookup result object.
                if (((DCCGridColumn)this.Columns[e.ColumnIndex]).Lookup)
                {
                    object cellValue = this.GetCellValue(e.ColumnIndex, e.RowIndex);
                    if (cellValue != null)
                    {
                        if (((LookupResult)cellValue).SelectedRecords[0].Row.Table.Columns.Contains(((DCCGridColumn)this.Columns[e.ColumnIndex]).ToolTipLookupField))
                        {
                            string tooltipValue = DCC.UMB.CDF.DB.DbManager.GetString(((LookupResult)cellValue).SelectedRecords[0][((DCCGridColumn)this.Columns[e.ColumnIndex]).ToolTipLookupField]);
                            e.ToolTipText = tooltipValue;

                        }
                    }
                }
                //]]
            }
            catch (Exception ex)
            {
                //throw ex;//DO NOTHING
            }
        }


        internal void StopEditing(bool commitChanges)
        {
            if (commitChanges)
            {
                this.EndEdit();
            }
            this.CancelEdit();
            if (this.EditingControl != null)
            {
                SendKeys.Send("{ESC}");
            }
        }


        void DCCGrid_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
        {
            //[[Now set the Edit mode to "EditOnEnter". This is set to "EditOnF2"
            //when user tries to open the context menu. The bugg was that if the 
            //current row is deleted with one cell in edit mode, the next row
            //coming upwards would have the same cell editor with the previous cell
            //value in that.
            this.EditMode = DataGridViewEditMode.EditOnEnter;
            //]]
            object o = this.EditingControl;
            if (o.GetType() == typeof(DataGridViewComboBoxEditingControl))
            {
                ComboBox cmbEditingControl = (ComboBox)e.Control;
                if (cmbEditingControl != null)
                {
                    cmbEditingControl.SelectionChangeCommitted -= comboBoxSelectDelegate;
                    cmbEditingControl.SelectionChangeCommitted += comboBoxSelectDelegate;
                }
            }
        }
        private void combo_SelectionChangeCommitted(object sender, EventArgs e)
        {
            // handle the event.
            ComboBox combo = sender as ComboBox;

            EventHandler<ComboBoxSelectionModifiedEventArgs> handler = ComboBoxSelectionModified;
            ComboBoxSelectionModifiedEventArgs args = new ComboBoxSelectionModifiedEventArgs();
            args.SelectedIndex = combo.SelectedIndex;
            args.ColumnIndex = this.CurrentColumnIndex;
            args.RowIndex = this.CurrentRowIndex;
            args.SelectedItem = (DropDownItem)combo.SelectedItem;
            //]]
            //Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, args);
            }

        }

        void DCCGrid_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyValue == (int)Keys.ControlKey)
            {
                isCtrlKeyDown = false;
            }
        }

        void DCCGrid_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyValue == (int)Keys.ControlKey)
            {
                isCtrlKeyDown = true;
            }
            this.HandleKeyDownEvent(e);
        }

        void DCCGrid_ColumnHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            //[[If sorting is not allowed, simply exit
            if (!this.AllowRowSorting)
            {
                return;
            }
            //]]
            //[[If the column whose header is clicked is not of type DCCGridColumn, then simply return
            bool result = UtilityManager.IsAssignableTo(this.Columns[e.ColumnIndex], typeof(DCCGridColumn));
            if (!result)
            {
                return;
            }

            //]]
            ResetSortOrderOfAllColumns((DCCGridColumn)this.Columns[e.ColumnIndex]);
            string currentRowIdentifier = this.CurrentRowIdentifier;
            this.gridDataModel.RefreshGrid(currentRowIdentifier);
        }
        public void SortOnColumn(string columnName)
        {
            DataGridViewColumn col = this.Columns[columnName];
            if (!UtilityManager.IsAssignableTo(col, typeof(DCCGridColumn)))
            {
                throw new Exception("Programatic sort is allowed only on CDF defined columns");
            }
            ResetSortOrderOfAllColumns((DCCGridColumn)col);
            string currentRowIdentifier = this.CurrentRowIdentifier;
            this.gridDataModel.RefreshGrid(currentRowIdentifier);
            this.gridDataModel.RefreshGrid(currentRowIdentifier);
            List<DCCDataRowView> lstNoneStateRows = this.GetRowsForState(RowStates.None);
            foreach (DCCDataRowView row in lstNoneStateRows)
            {
                this.gridDataModel.DeleteRow(row.RowIdentifier);
            }
        }
        private void ResetSortOrderOfAllColumns(DCCGridColumn dccGridColumn)
        {
            DataGridViewColumnCollection lstAllColumns = dccGridColumn.DataGridView.Columns;
            //[[if control key was not down, then remove the sort order on all the columns
            if (!isCtrlKeyDown)
            {
                foreach (DCCGridColumn col in lstAllColumns)
                {
                    if (!UtilityManager.IsAssignableTo(col, typeof(DCCGridColumn)))
                    {
                        continue;
                    }
                    if (col != dccGridColumn)
                    {
                        col.SortOrder = SortOrder.None;
                        this.lstSortByColumns.Remove(col);
                    }
                }
            }
            if (dccGridColumn.SortOrder == SortOrder.None || dccGridColumn.SortOrder == SortOrder.Descending)
            {
                dccGridColumn.SortOrder = SortOrder.Ascending;
            }
            else
            {
                dccGridColumn.SortOrder = SortOrder.Descending;
            }
            //[[Add this column in the list of columns on which the sorting is required.
            this.lstSortByColumns.Add(dccGridColumn);
            //]]
        }




        /// <summary>
        /// Adds a unique constraint on a single or set of columns. Once the constraint is defined
        /// the grid takes care of appropriate validations to restrict user from entriing duplicate 
        /// entries.
        /// </summary>
        /// <param name="ignoreCase">A boolean, specifying whether or not the case is ignored while comparing the cell values</param>
        /// <param name="trimValues">A boolean, specifying whether or not the values are trimmed while comparison</param>
        /// <param name="columnNames">Param Array, specyfing the names of the columns on which the constraint is defined.</param>
        public void AddUniqueColumnConstraint(bool ignoreCase, bool trimValues, params string[] columnNames)
        {
            uniqueConstraints.Add(new DCCGridUniqueConstraint(ignoreCase, trimValues, columnNames));
        }

        public static DCCDataGridViewCellStyle DccGridColumnHeaderCellStyle
        {
            get { return dccGridColumnHeaderCellStyle; }
        }
        /// <summary>
        /// Retunns a copy of underlying data model.
        /// </summary>
        /// <param name="exportDeletedRows">States whether or not the rows with deleted state will be exported</param>
        /// <returns></returns>
        public DataTable ExportGridModelData(bool exportDeletedRows)
        {
            return ExportGridModelData(exportDeletedRows, true);
        }

        public DataTable ExportGridModelData(bool exportDeletedRows, bool exportHiddenColumns)
        {
            //[[Get the entire model data as a table
            DataTable exportedTable = this.gridDataModel.ExportGridModelData(exportDeletedRows);
            //]]

            //[[Now if exportHiddenColumn is set to false, we will remove all those columns from this 
            //DataTable whose corresponding columns in this grid are either invisible or have width =0
            if (!exportHiddenColumns)
            {
                //[[Get the names of the colunms in the datatable which we want to retain
                List<string> lstColumnsToKeep = new List<string>();
                foreach (DataGridViewColumn col in this.Columns)
                {
                    lstColumnsToKeep.Add(col.Name);
                }
                //]]

                //[[Now get the list of columns from the datatable which will 
                //be removed. 
                List<DataColumn> lstColumnsToRemove = new List<DataColumn>();
                foreach (DataColumn col in exportedTable.Columns)
                {
                    if (!lstColumnsToKeep.Contains(col.ColumnName))
                    {
                        lstColumnsToRemove.Add(col);
                    }
                    else//change the name of the column to match the header text
                    {
                        //col.ColumnName = this.Columns[col.ColumnName].HeaderText;
                    }
                }
                //]]
                //[[Now remove the columns from the table and commit changes in datatable
                foreach (DataColumn column in lstColumnsToRemove)
                {
                    exportedTable.Columns.Remove(column);
                }
                exportedTable.AcceptChanges();
                //]]
            }
            //]]
            return exportedTable;
        }

        /// <summary>
        /// This method returns the position of the row in this data model while the 
        /// rows in the "Dleted"states are ignored. So net net, this returns the 
        /// position of the row in the grid as it is displayed to the user.
        /// </summary>
        /// <param name="rowIdentifier"></param>
        /// <returns></returns>
        public int GetDisplayOrder(string rowIdentifier)
        {
            return this.gridDataModel.GetDisplayOrder(rowIdentifier);
        }
        public string UserFriendlyName
        {
            get
            {
                return this.GetUserFriendlyNameOfGrid();
            }
        }
        internal string GetUserFriendlyNameOfGrid()
        {
            return string.IsNullOrEmpty(this.Title) ? this.Name : this.Title;
        }
        public bool IsValid()
        {
            return IsReadyToSave();
        }
        public virtual bool IsReadyToSave()
        {
            this.StopEditing(true);
            this.EditMode = DataGridViewEditMode.EditOnKeystrokeOrF2;
            //[[Check if the grid is Mandatory, and the sum of
            //New, Old and Updated rows is zero. If yes, return with false
            if (this.Mandatory)
            {
                if (this.GetRowsForState(RowStates.New).Count +
                    this.GetRowsForState(RowStates.Updated).Count +
                    this.GetRowsForState(RowStates.Old).Count == 0)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "Atleast one row of '" + this.GetUserFriendlyNameOfGrid() + "' grid", MessageTypes.Warning);
                    return false;
                }
            }
            //]]
            if (this.Rows.Count <= 0)
            {
                return true;
            }
            if (this.CurrentCell == null)
            {
                return true;
            }

            return ValidateRowAndShowMessageToUser(this.CurrentRowIndex);
        }
        internal List<DCCGridColumn> GetSortByColumnList()
        {
            return lstSortByColumns;
        }
        private void DCCGrid_ColumnAdded(object sender, DataGridViewColumnEventArgs e)
        {
            //TODO: this is a performance hit
            ApplyStyleAndAdjustColumnWidths();
        }

        private void DCCGrid_SizeChanged(object sender, EventArgs e)
        {
            ScrollBars bars = this.ScrollBars;
            this.ScrollBars = ScrollBars.None;
            this.Refresh();
            //TODO: This is a performance hit
            ApplyStyleAndAdjustColumnWidths();
            this.ScrollBars = bars;
        }

        private void ApplyStyleAndAdjustColumnWidths()
        {
            try
            {
                this.EnableHeadersVisualStyles = true;
                this.RowHeadersWidth = 15;
                int rowHeadersWidth = this.RowHeadersWidth;
                ScrollBar verticalScrollbar = this.VerticalScrollBar;
                int scrollBarWidth = 0;
                if (verticalScrollbar.Visible || !this.Visible)
                {
                    scrollBarWidth = verticalScrollbar.Width;
                }
                int assignableWidth = (this.Width - scrollBarWidth - rowHeadersWidth);
                int assignedWidth = 0;
                ////[[Set the size of all the columns here
                foreach (DCCGridColumn column in this.Columns)
                {
                    if (column.Visible)
                    {
                        column.Width = (int)(assignableWidth * column.PercentageWidth / 100);
                        assignedWidth += column.Width;
                    }
                }
                /// ]]

                ////[[Now check if the total assigned width is more than 
                /// the total assignable width, then show the horizontal scrollbar
                if (assignedWidth > assignableWidth)
                {
                    this.ScrollBars = this.ScrollBars | ScrollBars.Horizontal;
                }
                ///]]                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Specifies whether or not new rows will be added at the bottom of the grid automatically
        /// </summary>
        public bool AutoAddNewRowForUser { get; set; }

        /// <summary>
        /// This method adds a blank row for the user in the grid. The blank row remains in NONE mode unless edited by user.
        /// </summary>
        public void PrepareBlankRowForUser()
        {
            if (AutoAddNewRowForUser)
            {
                this.gridDataModel.PrepareBlankRowForUser();
            }
        }


        private void DCCGrid_CurrentCellChanged(object sender, EventArgs e)
        {
            if (this.CurrentCell == null)
            {
                return;
            }
            try
            {
                if (previouslySelectedRowIndex != this.CurrentRowIndex)
                {
                    this.RaiseRowSelectionModifiedEvent();

                    ///[[If the previously selected row (i.e. the row being loosing focus) was in "None"
                    /// mode then clear that row (because the default values might have been filled in)
                    if (previouslySelectedRowIndex < this.Rows.Count &&
                        this.GetRowState(this.previouslySelectedRowIndex) == RowStates.None)
                    {
                        ClearRowContents(this.previouslySelectedRowIndex);
                    }
                    ///]]
                }
            }
            finally
            {
                previouslySelectedRowIndex = this.CurrentRowIndex;
            }
        }

        private void RaiseRowDeletingEvent(RowDeletingEventArgs args)
        {
            EventHandler<RowDeletingEventArgs> handler = RowDeleting;
            if (handler != null)
            {
                handler(this, args);
            }
        }
        private void RaiseRowDeletedEvent(RowDeletedEventArgs args)
        {
            EventHandler<RowDeletedEventArgs> handler = RowDeleted;
            //Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, args);
            }
        }


        private void RaiseRowSelectionModifiedEvent()
        {
            RaiseRowSelectionModifiedEvent(false);

        }
        private void RaiseRowSelectionModifiedEvent(bool isBecauseOfRowDeletion)
        {
            EventHandler<GridRowSelectionModifiedEventArgs> handler = RowSelectionModified;
            //Event will be null if there are no subscribers
            GridRowSelectionModifiedEventArgs args = new GridRowSelectionModifiedEventArgs();
            if (this.Rows.Count > 0)
            {
                args.NewRowIndex = this.CurrentRowIndex;
                args.RowIdentifier = this.CurrentRowIdentifier;
            }
            else
            {
                args.NewRowIndex = -1;
                args.RowIdentifier = null;
            }
            args.PreviousRowIndex = isBecauseOfRowDeletion ? -1 : previouslySelectedRowIndex;
            ///[[In case when the Current Cell is getting changed because of the 
            ///fact that the new gridRenderingView has less number of rows than 
            ///the currently shown row index. In this case validation is not required.
            if (args.RowIdentifier == null)
            {
                return;
            }
            //]]
            if (handler != null)
            {
                handler(this, args);
            }
        }

        private DataRow CurrentDataRow
        {
            get { return GetDataRow(this.CurrentRowIndex); }
        }

        private DataRow GetDataRow(int rowIndex)
        {
            return gridDataModel.GetRowForRowIdentifier(
                gridDataModel.GetRowIdentifierForGridRowIndex(rowIndex));
        }

        private void ClearRowContents(int index)
        {
            this.gridDataModel.ClearRowContents(this.GetDataRow(index));

        }

        /// <summary>
        /// Gets and Sets the title of the grid
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        public string Title
        {
            get;
            set;
        }
        #region Command Strip related functionality

        private bool insertBeforeVisible = true;
        [Category("DCC.UMB.CDF.UIControls")]
        public bool InsertBeforeVisible { get { return insertBeforeVisible; } set { this.insertBeforeVisible = value; } }

        private bool insertAfterVisible = true;
        [Category("DCC.UMB.CDF.UIControls")]
        public bool InsertAfterVisible { get { return insertAfterVisible; } set { insertAfterVisible = value; } }

        private bool insertLastVisible = true;
        [Category("DCC.UMB.CDF.UIControls")]
        public bool InsertLastVisible { get { return insertLastVisible; } set { insertLastVisible = value; } }


        [Category("DCC.UMB.CDF.UIControls")]
        public bool MoveUpVisible { get; set; }
        [Category("DCC.UMB.CDF.UIControls")]
        public bool MoveDownVisible { get; set; }

        private bool deleteVisible = true;
        [Category("DCC.UMB.CDF.UIControls")]
        public bool DeleteVisible { get { return deleteVisible; } set { deleteVisible = value; } }


        private bool exportToExceldeleteVisibleisible = true;
        [Category("DCC.UMB.CDF.UIControls")]
        public bool ExportToExcelVisible { get { return exportToExceldeleteVisibleisible; } set { exportToExceldeleteVisibleisible = value; } }
        private bool showCommandStrip = false;
        [Category("DCC.UMB.CDF.UIControls")]
        public bool ShowCommandStrip
        {
            get
            {
                return this.showCommandStrip;
            }
            set
            {
                if (value && this.userMode == UserModes.Program)
                {
                    throw new Exception("ShowCommandStrip property can't be true if UserMode is set to 'Program'");
                }
                this.showCommandStrip = value;

                if (DesignMode) return;
                if (value)
                {
                    ShowCommandPanel();
                }
                else
                {
                    HideCommandPanel();
                }
            }
        }
        internal void ShowCommandPanel()
        {
            if (DesignMode) return;
            //[[If toolStripForGridCommands was never shown on this grid, then create it and create new instalnce of
            try
            {
                if (this.Parent == null) return;//in case the screen is just been build
                if (toolStripForGridCommands == null)
                {
                    toolStripForGridCommands = new DCCGridToolStrip();
                    toolStripForGridCommands.Grid = this;
                    toolStripForGridCommands.EnableDisableNavigationButtons();
                    this.panelForGridCommands.Controls.Add(toolStripForGridCommands, 1, 0);
                    toolStripForGridCommands.Dock = DockStyle.Fill;

                    //[[Note down the layout parameters of this grid, as was desinged in the design mode of visual studio
                    Control parentContainer = this.Parent;
                    TableLayoutPanelCellPosition cellPositoin = default(TableLayoutPanelCellPosition);//this will hold the cell position of this grid if this grid is in tablelayout panel
                    DockStyle existingDockStyle = this.Dock;//Preserve the existing dock style of this grid, this will become the dock style of the panelForGridCommands Panel
                    int rowSpan = 0;
                    int colSpan = 0;
                    if (parentContainer is TableLayoutPanel)
                    {
                        cellPositoin = ((TableLayoutPanel)parentContainer).GetCellPosition(this);
                        rowSpan = ((TableLayoutPanel)parentContainer).GetRowSpan(this);
                        colSpan = ((TableLayoutPanel)parentContainer).GetColumnSpan(this);
                    }
                    //[[Now remove the grid from its existing container and add it in the panelForGridCommands with dock style as fill, 
                    //the toolstrip is already added on the left side
                    parentContainer.Controls.Remove(this);
                    this.panelForGridCommands.Controls.Add(this, 0, 0);
                    this.panelForGridCommands.SetRowSpan(this, 1);
                    this.panelForGridCommands.SetColumnSpan(this, 1);
                    this.Dock = DockStyle.Fill;
                    //]]
                    //[[Now add the panelForGridCommands to the container of this grid, with the same layout parameters as the grid was
                    this.panelForGridCommands.Dock = existingDockStyle;
                    this.panelForGridCommands.Margin = this.Margin;
                    this.Margin = new Padding(0, 0, 0, 0);
                    if (parentContainer is TableLayoutPanel)
                    {
                        ((TableLayoutPanel)parentContainer).Controls.Add(this.panelForGridCommands, cellPositoin.Column, cellPositoin.Row);
                        ((TableLayoutPanel)parentContainer).SetRowSpan(this.panelForGridCommands, rowSpan);
                        ((TableLayoutPanel)parentContainer).SetColumnSpan(this.panelForGridCommands, colSpan);
                    }
                    else
                    {
                        parentContainer.Controls.Add(this.panelForGridCommands);
                    }
                    //[[Re-enforce button visible properties
                    this.toolStripForGridCommands.InsertAfterVisible = this.InsertAfterVisible;
                    this.toolStripForGridCommands.InsertBeforeVisible = this.InsertBeforeVisible;
                    this.toolStripForGridCommands.InsertLastVisible = this.InsertLastVisible;
                    this.toolStripForGridCommands.DeleteVisible = this.DeleteVisible;
                    this.toolStripForGridCommands.MoveUpVisible = this.MoveUpVisible;
                    this.toolStripForGridCommands.MoveDownVisible = this.MoveDownVisible;
                    this.toolStripForGridCommands.ExportToExcelVisible = this.ExportToExcelVisible;
                    //]]
                }
                else
                {
                    this.toolStripForGridCommands.Visible = true;
                }
                //]]
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }


        }
        internal void HideCommandPanel()
        {
            if (DesignMode) return;
            if (toolStripForGridCommands == null)
            {
                return;
            }

            this.toolStripForGridCommands.Visible = false;
        }
        #endregion


        /// <summary>
        /// Gets and Sets the mode of the grid
        /// </summary>
        [System.ComponentModel.Browsable(false)]
        [System.ComponentModel.ReadOnly(true)]
        public UIModes Mode
        {
            get { return mode; }
            set
            {
                mode = value;
                SetSpreadMode(value);
            }
        }


        /// <summary>
        /// Sets the dropdown vlaues in the cells of the Combox type of column
        /// </summary>
        /// <param name="columnName">Name of the column where the drop down values needs to be added. The type of the column must be DCCComboboxGridColumn</param>
        /// <param name="dataSource">This is the source which will be used to fill the drop down. This can be an arry/List of objects.</param>
        public void SetComboBoxColumnDataSource(string columnName, DataTable dataSource)
        {
            this.SetComboBoxColumnDataSource(columnName, dataSource, "ToString", "ToString");
        }
        public void SetComboBoxColumnDataSource(string columnName, DataTable dataSource, string valueMemberName,
                                                string displayMemberName)
        {
            if (this.Columns[columnName] == null)
            {
                throw new Exception(string.Format("Column with column name {0} not present in this grid", columnName));
            }
            DataGridViewCell template = this.Columns[columnName].CellTemplate;
            if (((DCCGridColumn)this.Columns[columnName]).ColumnCellType != DCCGridCellTypes.Combobox)
            {
                throw new Exception(string.Format("The column with name {0} is not of type combobox.", columnName));
            }
            List<DropDownItem> lstDropDownItems = DropDownItem.GenerateDropDownItems(dataSource, displayMemberName, valueMemberName);
            ((DataGridViewComboBoxCell)template).ValueMember = "ValueMember";
            ((DataGridViewComboBoxCell)template).DisplayMember = "DisplayMember";
            ((DataGridViewComboBoxCell)template).DataSource = lstDropDownItems;

        }
        public void SetComboBoxColumnDataSource(string columnName, ICollection dataSoruce)
        {
            this.SetComboBoxColumnDataSource(columnName, dataSoruce, "ToString", "ToString");
        }
        /// <summary>
        /// This method adds drop down values to the dropdown type of column cells.
        /// </summary>
        /// <param name="columnName">Name of the column where the drop down values needs to be added. The type of the column must be DCCComboboxGridColumn</param>
        /// <param name="dataSoruce">This is the source which will be used to fill the drop down. This can be an arry/List of objects or a datatable.</param>
        /// <param name="valueMember">Specifies which public property of the object, specified in 
        /// dataSource argument, will be used to define the value of the members in dropdown. In case the dataSource is an instance
        /// of DataTable, then valueMemver should be the name of the column.</param>
        /// <param name="displayMember">Specifies which public property of the object, specified in 
        /// dataSource argument, will be used to define in the display of the members in dropdown. In case the dataSource is an instance
        /// of DataTable, then valueMemver should be the name of the column.</param>
        public void SetComboBoxColumnDataSource(string columnName, ICollection dataSoruce, string valueMember,
                                                string displayMember)
        {
            if (this.Columns[columnName] == null)
            {
                throw new Exception(string.Format("Column with column name {0} not present in this grid", columnName));
            }
            DataGridViewCell template = this.Columns[columnName].CellTemplate;
            if (((DCCGridColumn)this.Columns[columnName]).ColumnCellType != DCCGridCellTypes.Combobox)
            {
                throw new Exception(string.Format("The column with name {0} is not of type combobox.", columnName));
            }
            List<DropDownItem> lstDropDownItems = DropDownItem.GenerateDropDownItems(dataSoruce, displayMember,
                                                                                     valueMember);
            ((DataGridViewComboBoxCell)template).ValueMember = "ValueMember";
            ((DataGridViewComboBoxCell)template).DisplayMember = "DisplayMember";
            ((DataGridViewComboBoxCell)template).DataSource = lstDropDownItems;

        }

        private void EnableContextMenu(bool enable)
        {
            enable = enable && (this.userMode != UserModes.Program);
            if (enable)
            {
                this.StopEditing(true);
            }

            dccContextMenuStrip.Enabled = enable;
            //[[Now sub menus of this context menus should be enabled or disabled vased upon 
            //properties AllowUserToAddRows and AllowUserToDeleteRows
            addRowAboveToolStripMenuItem.Enabled = enable && this.InsertRowsMenuItemsEnabled;
            addRowBelowToolStripMenuItem1.Enabled = enable && this.InsertRowsMenuItemsEnabled;
            deleteRowToolStripMenuItem.Enabled = enable && this.DeleteRowMenuEnabled;
            //]]
        }

        private void SetSpreadMode(UIModes modeToBeSet)
        {
            // commenting this line as this method might be used in clearing rows from spread even if already set...
            // e.g. if grid is already in 'query' mode & user fills some data in grid and
            // presses QUERY button again then again call to setting mode to 'query' will be there
            // in that case spread won't get cleared.

            //if (this.Mode == modeToBeSet) return;//return if the current modeToBeSet is same as the passed one

            ///[[Clear all the existing rows in the spread, as the modeToBeSet is chaning
            this.Rows.Clear();
            this.gridDataModel.Clear();
            this.Refresh();
            //]]

            EnableContextMenu(true);
            switch (modeToBeSet)
            {
                case UIModes.Insert:
                    //add a blank row for the user
                    this.InsertRowBelow();
                    break;
                case UIModes.Query:
                    //if this spread object is used for making a query, only then add a row 
                    this.InsertRowBelow();
                    EnableContextMenu(false);
                    break;
                case UIModes.Retrieve:
                    break;
                case UIModes.Browse:
                    break;
                case UIModes.List:
                    break;
                case UIModes.New:
                    this.InsertRowBelow();
                    break;
                case UIModes.Update:
                    break;
                case UIModes.Reference:
                    break;
                case UIModes.Params:
                    break;
                case UIModes.Report:
                    break;
                case UIModes.Tabular:
                    break;
                case UIModes.None:
                    break;
                default:
                    throw new ArgumentOutOfRangeException("value");
            }
        }

        private void DCCGrid_RowValidating(object sender, DataGridViewCellCancelEventArgs e)
        {
            if (UtilityManager.GetContainerScreen(this) != DCC.UMB.CDF.MGMT.Global.GlobalAppVariables.ObjMDIMain.ActiveChild)
            {
                return;
            }

            if (this.gridDataModel.gridRenderingView.Count <= 0 || this.CurrentCell == null)
            {
                return;
            }
            try
            {
                bool isThisRowValid = ValidateRowAndShowMessageToUser(this.CurrentRowIndex);
                if (!isThisRowValid)
                {
                    e.Cancel = true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool ValidateRowAndShowMessageToUser(int rowIndex)
        {
            //[[If the row with the specified row index is in None state,
            //just return with true value
            if (this.gridDataModel.GetRowState(rowIndex) == RowStates.None)
            {
                return true;
            }
            //]]
            int faultyColumnIndex = 0;
            if (IsMandatoryCellLeftEmpty(rowIndex, ref faultyColumnIndex))
            {
                //@1 must be specified
                string faultyColumnHeaderText = this.Columns[faultyColumnIndex].HeaderText;
                string userFriendlyGridName = this.GetUserFriendlyNameOfGrid() + " grid";
                string logicalNameOfMissingCell = string.Format("'{0}' of '{1}'", faultyColumnHeaderText,
                                                                userFriendlyGridName);
                //package_name of grid packages 
                UIManager.ShowMessage(MsgCodes.ValueReqd, logicalNameOfMissingCell, MessageTypes.Warning);
                return false;
            }
            if (IsUniqueConstraintViolated(rowIndex))
            {
                UIManager.ShowMessage(MsgCodes.DupValue, "");
                return false;
            }
            if (!IsDataInValidRange(rowIndex))
            {
                return false;
            }
            if (!IsValidAgainstRegularExpression(rowIndex))
            {
                return false;
            }

            //[[Now check if the screen code has custom logic to validate this row.
            EventHandler<ValidateRowEventArgs> handler = ValidateRow;
            //Event will be null if there are no subscribers
            ValidateRowEventArgs args = new ValidateRowEventArgs(rowIndex, true);
            if (handler != null)
            {
                handler(this, args);
                if (!args.IsValid)
                {
                    return false;
                }
            }
            //]]
            return true;
        }

        private bool IsValidAgainstRegularExpression(int rowIndex)
        {
            foreach (DCCGridColumn column in this.Columns)
            {
                if (column.ColumnCellType == DCCGridCellTypes.TextField)
                {
                    DCCTextFieldGridColumn col = (DCCTextFieldGridColumn)column;
                    if ((!string.IsNullOrEmpty(col.RegularExpressionValidator))
                            &&
                            (!string.IsNullOrEmpty(this.AsStr(column.Index, rowIndex)))
                       )
                    {
                        string cellValue = this.AsStr(column.Index, rowIndex);
                        bool result = UtilityManager.ValidateStringAgainstRegx(col.RegularExpressionValidator, cellValue);
                        if (!result)
                        {
                            UIManager.ShowMessage(MsgCodes.InvalidValue, "Value|'" + col.HeaderText + "' of '" + this.GetUserFriendlyNameOfGrid() + "' grid",
                                                  MessageTypes.Warning);
                            return false;
                        }
                    }
                }
            }
            return true;
        }

        private bool IsDataInValidRange(int rowIndex)
        {
            foreach (DCCGridColumn column in this.Columns)
            {
                if (column.ColumnCellType == DCCGridCellTypes.Date)
                {
                    DCCDateGridColumn col = (DCCDateGridColumn)column;
                    DateTime? cellValue = this.AsDTM(col.Index, rowIndex);
                    if (cellValue.HasValue)
                    {
                        if (cellValue.Value < col.MinValue || cellValue > col.MaxValue)
                        {
                            UIManager.ShowMessage(MsgCodes.OutOfRange,
                                                    string.Format("{0}|{1}|{2}",
                                                                    col.HeaderText, col.MaxValue.ToString(),
                                                                    col.MinValue.ToString()),
                                                    MessageTypes.Warning);
                            return false;
                        }
                    }
                }
                else if (column.ColumnCellType == DCCGridCellTypes.LongInteger)
                {
                    DCCLongIntegerGridColumn col = (DCCLongIntegerGridColumn)column;
                    long? cellValue = this.AsLng(col.Index, rowIndex);
                    if (cellValue.HasValue)
                    {
                        if (cellValue.Value < col.MinValue || cellValue > col.MaxValue)
                        {
                            UIManager.ShowMessage(MsgCodes.OutOfRange,
                                                    string.Format("{0}|{1}|{2}",
                                                                    col.HeaderText, col.MaxValue.ToString(),
                                                                    col.MinValue.ToString()),
                                                    MessageTypes.Warning);
                            return false;
                        }
                    }
                }
                else if (column.ColumnCellType == DCCGridCellTypes.DoubleFloat)
                {
                    DCCDoubleFloatGridColumn col = (DCCDoubleFloatGridColumn)column;
                    double? cellValue = this.AsDbl(col.Index, rowIndex);
                    if (cellValue.HasValue)
                    {
                        if (cellValue.Value < col.MinValue || cellValue > col.MaxValue)
                        {
                            UIManager.ShowMessage(MsgCodes.OutOfRange,
                                                    string.Format("{0}|{1}|{2}",
                                                                    col.HeaderText, col.MaxValue.ToString(),
                                                                    col.MinValue.ToString()),
                                                    MessageTypes.Warning);
                            return false;
                        }
                    }
                }
            }
            return true;
        }

        protected virtual bool IsMandatoryCellLeftEmpty(int rowIndex, ref int faultyColumnIndex)
        {
            //if any of the cell, which is defined as mandatory is left empty,
            //show the message and dont allow user to leave the row.
            bool isMandatoryCellLeftEmpty = false;
            foreach (DCCGridColumn column in this.Columns)
            {
                if (column.Mandatory)
                {
                    isMandatoryCellLeftEmpty = this.GetCellValue(column.Index, rowIndex) == null;
                    if (isMandatoryCellLeftEmpty)
                    {
                        faultyColumnIndex = column.Index;
                        break;
                    }
                }
            }
            return isMandatoryCellLeftEmpty;
        }

        private bool IsUniqueConstraintViolated(int rowIndex)
        {
            foreach (DCCGridUniqueConstraint constraint in this.uniqueConstraints)
            {
                List<KeyValuePair<string, object>> columnNameValuePairs = new List<KeyValuePair<string, object>>();
                List<RowStates> rowStatesToExclued = new List<RowStates>();
                rowStatesToExclued.Add(RowStates.Deleted);
                rowStatesToExclued.Add(RowStates.None);
                List<string> rowIdentifiersToExclue = new List<string>();
                foreach (string column in constraint.ColunmnNames)
                {
                    object cellValue = this.GetCellValue(column, rowIndex);
                    columnNameValuePairs.Add(new KeyValuePair<string, object>(column, cellValue));
                }
                rowIdentifiersToExclue.Add(this.GetRowIdentifier(rowIndex));
                List<DCCDataRowView> duplicateRecords =
                    FindRecords(columnNameValuePairs, rowStatesToExclued, rowIdentifiersToExclue, constraint.IgnoreCase,
                                constraint.TrimValues);
                if (duplicateRecords != null && duplicateRecords.Count > 0)
                {
                    return true;
                }
            }
            return false;
        }

        void DCCGrid_RowLeave(object sender, DataGridViewCellEventArgs e)
        {
            //NOTE: e.rowIndex means the index of the row which is leaving focus
            //and not the one which is getting focus.
        }
        private void DCCGrid_CellLeave(object sender, DataGridViewCellEventArgs e)
        {
            if (this.gridDataModel.Rows.Count <= 0) return;
            DCCGridColumn column = (DCCGridColumn)this.Columns[e.ColumnIndex];
            //[[If the column is of type combobox and currently being edited, then force the 
            //value of the selected item in combo to go to the data model as there a bug in 
            //.net combobox column editor that unless user changes the value in it , the value is not 
            //pushed automatically to data model
            if (column.ColumnCellType == DCCGridCellTypes.Combobox && this.EditingControl != null)
            {
                object selectedValue =
                    ((System.Windows.Forms.DataGridViewComboBoxEditingControl)(this.EditingControl)).SelectedValue;
                this.SetCellValue(e.ColumnIndex, e.RowIndex, selectedValue);

            }
        }


        protected override void OnCellPainting(DataGridViewCellPaintingEventArgs e)
        {
            try
            {
                this.ContextMenuStrip = this.dccContextMenuStrip;

                //as we are interested in header portions(row and column headers) only, 
                ///[[
                if (!(e.RowIndex == -1 || e.ColumnIndex == -1))
                {
                    return;
                }
                //]]

                if (e.ColumnIndex == -1 && e.RowIndex != -1) //for rendering the row headers as per the row states.
                {
                    e.PaintBackground(e.CellBounds, true);
                    e.PaintContent(e.CellBounds);
                    Font f = new Font(e.CellStyle.Font, FontStyle.Regular);
                    string state = this.gridDataModel.GetRowStateSymbol(this.GetDataRow(e.RowIndex));
                    e.Graphics.DrawString(state, f, Brushes.Maroon, e.CellBounds.Left, e.CellBounds.Top + 1);
                    e.Handled = true;
                    return;
                }
                if (e.ColumnIndex == -1)
                {
                    return;
                }

            }
            finally
            {
                base.OnCellPainting(e);
            }
        }


        private void DCCGrid_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            //do nothing. 
            //@@todo, implement a mechanism to track the errors. AR->Neeraj
        }


        private void DCCGrid_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            ///[[Prepare a blank row for the user.
            this.PrepareBlankRowForUser();
            //]]

        }


        private void DCCGrid_CellValueNeeded(object sender, DataGridViewCellValueEventArgs e)
        {
            try
            {
                //first set the value of the e.Value as the actual object value from the model
                e.Value = GetCellValue(e.ColumnIndex, e.RowIndex);
                if (e.RowIndex >= 2 && e.ColumnIndex >= 2)
                {
                }
                ///[[Now if the type of the column is of datetime, then if the editing is not happening
                /// in the cell, we need to format the date and show it in correct format. 
                /// Else if the editing is happening, then the DCCDateTimeField editor will take care of it
                /// automatically, as that editor shows the datetime in the correct string format for editing its value.
                if (this.gridDataModel.Columns[e.ColumnIndex].DataType == typeof(DateTime))
                {
                    if (this.EditingControl == null)
                    {
                        e.Value = ((DateTime)this.GetCellValue(e.ColumnIndex, e.RowIndex)).ToString(Constants.DATE_FORMAT);
                    }
                    else
                    {
                        if (!(this.CurrentRowIndex == e.RowIndex && this.CurrentColumnIndex == e.ColumnIndex))
                        {
                            e.Value = ((DateTime)this.GetCellValue(e.ColumnIndex, e.RowIndex)).ToString(Constants.DATE_FORMAT);
                        }
                    }
                }
                ///]]
            }
            catch
            {
                e.Value = null;
            }
        }


        /// <summary>
        /// Returns the Value in the specified cell
        /// </summary>
        /// <param name="columnIndex"></param>
        /// <param name="rowIndex"></param>
        /// <returns></returns>
        public object GetCellValue(int columnIndex, int rowIndex)
        {
            string rowIdentifier = this.gridDataModel.GetRowIdentifierForGridRowIndex(rowIndex);
            return GetCellValue(columnIndex, rowIdentifier);
        }

        /// <summary>
        /// Returns the Value in the specified cell
        /// </summary>
        /// <param name="columnIndex"></param>
        /// <param name="rowIdentifier">Identifier of the row</param>
        /// <returns></returns>
        public object GetCellValue(int columnIndex, string rowIdentifier)
        {
            object obj = gridDataModel.GetCellValue(rowIdentifier, columnIndex);
            return DBNull.Value.Equals(obj) ? null : obj;
        }

        /// <summary>
        /// Returns the Value in the specified cell
        /// </summary>
        /// <param name="columnName"></param>
        /// <param name="rowIdentifier">Identifier of the row</param>
        /// <returns></returns>
        public object GetCellValue(string columnName, string rowIdentifier)
        {
            if (this.Columns[columnName] == null)
            {
                throw new Exception(string.Format("Column with name '{0}' not found in grid '{1}'", columnName, this.GetUserFriendlyNameOfGrid()), null);
            }
            return GetCellValue(Columns[columnName].Index, rowIdentifier);
        }

        /// <summary>
        /// Returns the Value in the specified cell
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An object specifying the value of the cell</returns>
        public object GetCellValue(string columnName, int rowIndex)
        {
            if (this.Columns[columnName] == null)
            {
                throw new Exception(string.Format("Column with name '{0}' not found in grid '{1}'", columnName, this.GetUserFriendlyNameOfGrid()), null);
            }
            return GetCellValue(Columns[columnName].Index, rowIndex);
        }


        #region AsShort

        /// <summary>
        /// Returns the Value in the specified cell as an nullable short
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An integer (nullable) specifying the value of the cell</returns>
        public short? AsShort(int columnIndex, int rowIndex)
        {
            short? returnValue = null;
            int? intValue = AsInt(columnIndex, rowIndex);
            if (intValue.HasValue)
            {
                short embeddedShortValue = (short)intValue.Value;
                returnValue = embeddedShortValue;
            }
            return returnValue;
        }
        /// <summary>
        /// Returns the Value in the specified cell as an nullable short
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An integer (nullable) specifying the value of the cell</returns>
        public short? AsShort(string columnName, int rowIndex)
        {
            short? returnValue = null;
            int? intValue = AsInt(columnName, rowIndex);
            if (intValue.HasValue)
            {
                short embeddedShortValue = (short)intValue.Value;
                returnValue = embeddedShortValue;
            }
            return returnValue;
        }
        /// <summary>
        /// Returns the Value in the specified cell in the current row as an nullable short
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>An integer (nullable) specifying the value of the cell</returns>
        public short? AsShort(int columnIndex)
        {
            return AsShort(columnIndex, this.CurrentRowIndex);
        }
        /// <summary>
        /// Returns the Value in the specified cell of current row as an nullable short
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>An integer (nullable) specifying the value of the cell</returns>
        public short? AsShort(string columnName)
        {
            return AsShort(columnName, CurrentRowIndex);
        }
        #endregion
        #region AsInt
        /// <summary>
        /// Returns the Value in the specified cell as an nullable integer
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An integer (nullable) specifying the value of the cell</returns>
        public int? AsInt(string columnName, int rowIndex)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            int? returnValue = null;
            if (cellValue != null)
            {
                returnValue = Convert.ToInt32(cellValue);
            }
            return returnValue;
        }
        /// <summary>
        /// Returns the Value in the specified cell as an nullable integer
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An integer (nullable) specifying the value of the cell</returns>
        public int? AsInt(int columnIndex, int rowIndex)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            int? returnValue = null;
            if (cellValue != null)
            {
                returnValue = Convert.ToInt32(cellValue);
            }
            return returnValue;
        }
        /// <summary>
        /// Returns the Value in the specified cell as an nullable integer
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>An integer (nullable) specifying the value of the cell</returns>
        public int? AsInt(string columnName)
        {
            return AsInt(columnName, this.CurrentRowIndex);
        }
        /// <summary>
        /// Returns the Value in the specified cell as an nullable integer
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>An integer (nullable) specifying the value of the cell</returns>
        public int? AsInt(int columnIndex)
        {
            return AsInt(columnIndex, this.CurrentRowIndex);
        }
        #endregion

        #region AsLng
        /// <summary>
        /// Returns the Value in the specified cell as an nullable long
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An long (nullable) specifying the value of the cell</returns>
        public long? AsLng(string columnName, int rowIndex)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            long? returnValue = null;
            if (cellValue != null)
            {
                returnValue = Convert.ToInt64(cellValue);
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable long
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An long (nullable) specifying the value of the cell</returns>
        public long? AsLng(int columnIndex, int rowIndex)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            long? returnValue = null;
            if (cellValue != null)
            {
                returnValue = Convert.ToInt64(cellValue);
            }
            return returnValue;
        }
        /// <summary>
        /// Returns the Value in the specified cell as an nullable long
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>An long (nullable) specifying the value of the cell</returns>
        public long? AsLng(string columnName)
        {
            return AsLng(columnName, this.CurrentRowIndex);
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable long
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>An long (nullable) specifying the value of the cell</returns>
        public long? AsLng(int columnIndex)
        {
            return this.AsLng(columnIndex, this.CurrentRowIndex);
        }
        #endregion

        #region AsDbl
        /// <summary>
        /// Returns the Value in the specified cell as an nullable double value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A double value (nullable) specifying the value of the cell</returns>
        public double? AsDbl(int columnIndex, int rowIndex)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            double? returnValue = null;
            if (cellValue != null)
            {
                returnValue = Convert.ToDouble(cellValue);
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable double value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A double value (nullable) specifying the value of the cell</returns>
        public double? AsDbl(string columnName, int rowIndex)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            double? returnValue = null;
            if (cellValue != null)
            {
                returnValue = Convert.ToDouble(cellValue);
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable double value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>A double value (nullable) specifying the value of the cell</returns>
        public double? AsDbl(int columnIndex)
        {
            return AsDbl(columnIndex, this.CurrentRowIndex);
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable double value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>A double value (nullable) specifying the value of the cell</returns>
        public double? AsDbl(string columnName)
        {
            return AsDbl(columnName, this.CurrentRowIndex);
        }
        #endregion

        #region AsDTM
        /// <summary>
        /// Returns the Value in the specified cell as an nullable datetime object
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A datetime object(nullable) specifying the value of the cell</returns>
        public DateTime? AsDTM(int columnIndex, int rowIndex)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            DateTime? returnValue = null;
            if (cellValue != null)
            {
                returnValue = (DateTime)cellValue;
            }
            return returnValue;
        }


        /// <summary>
        /// Returns the Value in the specified cell as an nullable datetime object
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A datetime object(nullable) specifying the value of the cell</returns>
        public DateTime? AsDTM(string columnName, int rowIndex)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            DateTime? returnValue = null;
            if (cellValue != null)
            {
                if (cellValue is DateTime)
                {
                    returnValue = (DateTime)cellValue;
                }
                else
                {
                    DateTime toParse;
                    if (DateTime.TryParse(cellValue.ToString().Trim(), out toParse))
                    {
                        return toParse;
                    }
                    else
                    {
                        throw new DCC.UMB.CDF.MGMT.Modal.DCCException(null, MsgCodes.InvalidValue.ToString(), "value|column " + columnName + " in " + this.Name);
                    }
                }
            }
            return returnValue;
        }
        /// <summary>
        /// Returns the Value in the specified cell as an nullable datetime object
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>A datetime object(nullable) specifying the value of the cell</returns>
        public DateTime? AsDTM(int columnIndex)
        {
            return this.AsDTM(columnIndex, this.CurrentRowIndex);
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable datetime object
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>A datetime object(nullable) specifying the value of the cell</returns>
        public DateTime? AsDTM(string columnName)
        {
            return AsDTM(columnName, this.CurrentRowIndex);
        }
        #endregion

        #region AsBln
        /// <summary>
        /// Returns the Value in the specified cell as an nullable bool value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A bool value (nullable) specifying the value of the cell</returns>
        public bool? AsBln(int columnIndex, int rowIndex)
        {
            return AsBln(columnIndex, rowIndex, false);
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable bool value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A bool value (nullable) specifying the value of the cell</returns>
        public bool? AsBln(string columnName, int rowIndex)
        {
            return AsBln(columnName, rowIndex, false);
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable bool value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <param name="parseString">specifies that the column has textual data (i.e. Yes or No) 
        /// and it should be parsed to convert to a boolean</param>
        /// <returns>A bool value (nullable) specifying the value of the cell</returns>
        public bool? AsBln(int columnIndex, int rowIndex, bool parseString)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            bool? returnValue = null;
            if (cellValue != null)
            {
                if (parseString)
                {
                    returnValue = cellValue.ToString().ToUpper().Trim() == "YES";
                }
                else
                {
                    returnValue = (bool)cellValue;
                }
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable bool value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <param name="parseString">specifies that the column has textual data (i.e. Yes or No) 
        /// and it should be parsed to convert to a boolean</param>
        /// <returns>A bool value (nullable) specifying the value of the cell</returns>
        public bool? AsBln(string columnName, int rowIndex, bool parseString)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            bool? returnValue = null;
            if (parseString)
            {
                if (cellValue.ToString().ToUpper().Trim() != "YES" && cellValue.ToString().ToUpper().Trim() != "NO")
                {
                    throw new Exception("Grid cell has data which can't be parsed to a boolean");
                }
                returnValue = cellValue.ToString().ToUpper().Trim() == "YES";
            }
            else
            {
                returnValue = (bool?)cellValue;
            }
            return returnValue;
        }
        /// <summary>
        /// Returns the Value in the specified cell as an nullable bool value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>A bool value (nullable) specifying the value of the cell</returns>
        public bool? AsBln(int columnIndex)
        {
            return AsBln(columnIndex, this.CurrentRowIndex);
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable bool value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>A bool value (nullable) specifying the value of the cell</returns>
        public bool? AsBln(string columnName)
        {
            return this.AsBln(columnName, this.CurrentRowIndex);
        }
        #endregion

        #region AsDml
        /// <summary>
        /// Returns the Value in the specified cell as an nullable decimal value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A decimal value (nullable) specifying the value of the cell</returns>
        public decimal? AsDml(int columnIndex, int rowIndex)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            decimal? returnValue = null;
            if (cellValue != null)
            {
                returnValue = Convert.ToDecimal(cellValue);
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable decimal value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A decimal value (nullable) specifying the value of the cell</returns>
        public decimal? AsDml(string columnName, int rowIndex)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            decimal? returnValue = null;
            if (cellValue != null)
            {
                returnValue = Convert.ToDecimal(cellValue);
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable decimal value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>A decimal value (nullable) specifying the value of the cell</returns>
        public decimal? AsDml(int columnIndex)
        {
            return AsDml(columnIndex, this.CurrentRowIndex);
        }

        /// <summary>
        /// Returns the Value in the specified cell as an nullable decimal value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>A decimal value (nullable) specifying the value of the cell</returns>
        public decimal? AsDml(string columnName)
        {
            return AsDml(columnName, this.CurrentRowIndex);
        }
        #endregion

        #region AsLookupResult
        /// <summary>
        /// Gets the value in the speficied cell as a LookupResult object
        /// </summary>
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An instance of LookupResult specifying the value of the cell</returns>
        public LookupResult AsLookupResult(int columnIndex, int rowIndex)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            LookupResult returnValue = null;
            if (cellValue != null)
            {
                returnValue = (LookupResult)cellValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Gets the value in the speficied cell as a LookupResult object
        /// </summary>
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>An instance of LookupResult specifying the value of the cell</returns>
        public LookupResult AsLookupResult(string columnName, int rowIndex)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            LookupResult returnValue = null;
            if (cellValue != null)
            {
                returnValue = (LookupResult)cellValue;
            }
            return returnValue;
        }
        /// <summary>
        /// Gets the value in the speficied cell as a LookupResult object
        /// </summary>
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>An instance of LookupResult specifying the value of the cell</returns>
        public LookupResult AsLookupResult(int columnIndex)
        {
            return this.AsLookupResult(columnIndex, this.CurrentRowIndex);
        }

        /// <summary>
        /// Gets the value in the speficied cell as a LookupResult object
        /// </summary>
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>An instance of LookupResult specifying the value of the cell</returns>
        public LookupResult AsLookupResult(string columnName)
        {
            return this.AsLookupResult(columnName, this.CurrentRowIndex);
        }
        #endregion

        #region AsTxnTs
        /// <summary>
        /// Gets the value in the speficied cell as timestamp, which is nothing but an array of 8 bytes
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A byte[] specifying the timestamp value of the cell</returns>
        public byte[] AsTxnTs(int columnIndex, int rowIndex)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            byte[] returnValue = null;
            if (cellValue != null)
            {
                returnValue = (byte[])cellValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Gets the value in the speficied cell as timestamp, which is nothing but an array of 8 bytes
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A byte[] specifying the timestamp value of the cell</returns>
        public byte[] AsTxnTs(string columnName, int rowIndex)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            byte[] returnValue = null;
            if (cellValue != null)
            {
                returnValue = (byte[])cellValue;
            }
            return returnValue;
        }
        /// <summary>
        /// Gets the value in the speficied cell as timestamp, which is nothing but an array of 8 bytes
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>A byte[] specifying the timestamp value of the cell</returns>
        public byte[] AsTxnTs(int columnIndex)
        {
            return this.AsTxnTs(columnIndex, this.CurrentRowIndex);
        }

        /// <summary>
        /// Gets the value in the speficied cell as timestamp, which is nothing but an array of 8 bytes
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>A byte[] specifying the timestamp value of the cell</returns>
        public byte[] AsTxnTs(string columnName)
        {
            return this.AsTxnTs(columnName, this.CurrentRowIndex);
        }
        #endregion



        #region AsStr
        /// <summary>
        /// Returns the Value in the specified cell as a string value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A string value  specifying the value of the cell</returns>
        public string AsStr(int columnIndex, int rowIndex)
        {
            object cellValue = GetCellValue(columnIndex, rowIndex);
            string returnValue = null;
            if (cellValue != null)
            {
                returnValue = (string)cellValue;
            }
            return returnValue;
        }

        /// <summary>
        /// Returns the Value in the specified cell as a string value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <param name="rowIndex">Row-Index of the cell whose value is required</param>
        /// <returns>A string value  specifying the value of the cell</returns>
        public string AsStr(string columnName, int rowIndex)
        {
            object cellValue = GetCellValue(columnName, rowIndex);
            string returnValue = null;
            if (cellValue != null)
            {
                returnValue = cellValue.ToString();
            }
            return returnValue;
        }
        /// <summary>
        /// Returns the Value in the specified cell as a string value
        /// </summary>
        /// <param name="columnIndex">Column-Index of the cell whose value is required</param>
        /// <returns>A string value  specifying the value of the cell</returns>
        public string AsStr(int columnIndex)
        {
            return AsStr(columnIndex, this.CurrentRowIndex);
        }

        /// <summary>
        /// Returns the Value in the specified cell as a string value
        /// </summary>
        /// <param name="columnName">Column-Name of the cell whose value is required</param>
        /// <returns>A string value  specifying the value of the cell</returns>
        public string AsStr(string columnName)
        {
            return AsStr(columnName, this.CurrentRowIndex);
        }
        #endregion

        /// <summary>
        /// Sets the value of a cell, specified by column index and row index, in the grid
        /// </summary>
        /// <param name="columnIndex">column index of the cell whose value needs to be set</param>
        /// <param name="rowIndex">row index of the cell whose value needs to be set</param>
        /// <param name="cellValue">The value which needs to be set in the cell</param>
        public void SetCellValue(int columnIndex, int rowIndex, object cellValue)
        {
            string rowIdentifier = this.gridDataModel.GetRowIdentifierForGridRowIndex(rowIndex);
            if (rowIdentifier == null)
            {
                return;
            }
            this.SetCellValue(columnIndex, rowIdentifier, cellValue);
        }

        /// <summary>
        /// Sets the value of a cell, specified by column index and row index, in the grid
        /// </summary>
        /// <param name="columnIndex">column index of the cell whose value needs to be set</param>
        /// <param name="cellValue">The value which needs to be set in the cell</param>
        public void SetCellValue(int columnIndex, object cellValue)
        {
            SetCellValue(columnIndex, this.CurrentRowIndex, cellValue);
        }

        /// <summary>
        /// Sets the value of a cell, specified by column index and row identifier, in the grid
        /// </summary>
        /// <param name="columnIndex">column index of the cell whose value needs to be set</param>
        /// <param name="rowIdentifier">Identifier of the row whose cell value needs to be set</param>
        /// <param name="cellValue">The value which needs to be set in the cell</param>        
        public void SetCellValue(int columnIndex, string rowIdentifier, object cellValue)
        {
            try
            {
                // in case user passes DBNull value to set
                // might be a case when user picks value directly from database & sets here.
                if (DBNull.Value.Equals(cellValue))
                {
                    cellValue = null;
                }
                this.gridDataModel.SetCellValue(columnIndex, rowIdentifier, cellValue);
            }
            catch (Exception ex)
            {
                if (ex.Message != "Operation cannot be performed in this event handler.")
                {
                    throw;
                }
            }
        }
        /// <summary>
        /// Sets the value of a cell, specified by column index and row index, in the grid
        /// </summary>
        /// <param name="columnName">column name of the cell whose value needs to be set</param>
        /// <param name="rowIdentifier">row identifier of the cell whose value needs to be set</param>
        /// <param name="cellValue">The value which needs to be set in the cell</param>
        public void SetCellValue(string columnName, string rowIdentifier, object cellValue)
        {
            try
            {
                this.SetCellValue(Columns[columnName].Index, rowIdentifier, cellValue);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        /// <summary>
        /// Sets the value of a cell, specified by column index and row index, in the grid
        /// </summary>
        /// <param name="columnName">column name of the cell whose value needs to be set</param>
        /// <param name="rowIndex">row index of the cell whose value needs to be set</param>
        /// <param name="cellValue">The value which needs to be set in the cell</param>
        public void SetCellValue(string columnName, int rowIndex, object cellValue)
        {
            try
            {
                this.SetCellValue(Columns[columnName].Index, rowIndex, cellValue);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        /// <summary>
        /// Sets the value of a cell, specified by column index. The current row is used to set the value.
        /// </summary>
        /// <param name="columnName">column name of the cell whose value needs to be set</param>
        /// <param name="cellValue">The value which needs to be set in the cell</param>
        public void SetCellValue(string columnName, object cellValue)
        {
            try
            {
                this.SetCellValue(Columns[columnName].Index, this.CurrentRowIndex, cellValue);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        /// <summary>
        /// Returns the index of the current row
        /// </summary>
        public int CurrentRowIndex
        {
            get { if (this.CurrentCell == null) return -1; return this.CurrentCell.RowIndex; }
        }

        /// <summary>
        /// Returns the index of the current column
        /// </summary>
        public int CurrentColumnIndex
        {
            get { if (this.CurrentCell == null) return -1; return this.CurrentCell.ColumnIndex; }
        }

        /// <summary>
        /// Returns the name of the column of the current cell
        /// </summary>
        public string CurrentColumnName
        {
            get { if (this.CurrentCell == null) return null; return this.Columns[this.CurrentCell.ColumnIndex].Name; }
        }

        /// <summary>
        /// Sets the first visible cell of the row as the current cell.
        /// </summary>
        /// <param name="rowIndex"></param>
        internal void SetCurrentRow(int rowIndex)
        {
            if (this.Rows.Count > rowIndex)
            {
                string rowIdentifier = this.GetRowIdentifier(rowIndex);
                this.SetCurrentRow(rowIdentifier);
            }
        }

        /// <summary>
        /// Sets the first visible cell of the row as the current cell.
        /// </summary>
        /// <param name="rowIdentifier"></param>
        public void SetCurrentRow(string rowIdentifier)
        {
            if (rowIdentifier == null)
            {
                return;
            }
            int copyOfPreviouslySelectedRowIndex = previouslySelectedRowIndex;
            ///[[If the current row is same as the one already in 
            //selection then dont do anything.
            //string currentRowIndentifier = GetRowIdentifier(CurrentRowIndex);
            //if (rowIdentifier == currentRowIndentifier) return; //This line causes problems when a row is inserted below the curretn row. The row index remains same and this if condition fails.
            //]]
            this.gridDataModel.SetCurrentGridRow(rowIdentifier);
            //[[The line above will take care of raising the event when the rowIdentifier being passed
            //is different from the currently selected row of the grid. However, if it is same, even then the 
            //event MUST be raised. So the block below will take care of this.
            if (copyOfPreviouslySelectedRowIndex == this.gridDataModel.GetRowIndexFromRowIdentifier(rowIdentifier))
            {
                EventHandler<GridRowSelectionModifiedEventArgs> handler = RowSelectionModified;
                GridRowSelectionModifiedEventArgs args = new GridRowSelectionModifiedEventArgs();
                args.NewRowIndex = this.CurrentRowIndex;
                args.RowIdentifier = rowIdentifier;
                if (handler != null)
                {
                    handler(this, args);
                }
            }
            //]]

        }



        private void DCCGrid_CellValuePushed(object sender, DataGridViewCellValueEventArgs e)
        {
            try
            {
                this.SetCellValue(e.ColumnIndex, e.RowIndex, e.Value);
                DCCGridColumn column = (DCCGridColumn)this.Columns[e.ColumnIndex];
                if (column.Mandatory)
                {
                    if (this.GetCellValue(e.ColumnIndex, e.RowIndex) == null ||
                        this.GetCellValue(e.ColumnIndex, e.RowIndex) == DBNull.Value)
                    {
                        UIManager.ShowMessage(MsgCodes.MandatoryFieldsEmpty, this.GetUserFriendlyNameOfGrid() + " grid", MessageTypes.Warning);
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        /// <summary>
        /// Overriding this method to pass the Enter key to the underlaying Editor control
        /// </summary>
        /// <param name="keyData"></param>
        /// <returns></returns>
        protected override bool ProcessDialogKey(Keys keyData)
        {
            Keys key = (keyData & Keys.KeyCode);
            if (key == Keys.Enter)
            {
                return false;
                //This key should be passed to the underlaying editor for the lookup dialog.                
            }
            return base.ProcessDialogKey(keyData);
        }


        /// <summary>
        /// Overriding this method to pass the Enter key to the underlaying Editor control
        /// </summary>
        /// <param name="e"></param>
        /// <returns></returns>
        protected override bool ProcessDataGridViewKey(KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                return false;
                //This key should be passed to the underlaying editor for the lookup dialog.                
            }
            //[[If the grid is in editing mode, then just return false as the key strokes are captured by the underlying 
            //editor control
            if (this.EditingControl != null && e.KeyCode != Keys.Tab)
            {
                return false;
            }
            return base.ProcessDataGridViewKey(e);
        }


        /// <summary>
        /// Retrieves the records from a datatable. The grid is added with as many rows 
        /// as many records in the data table. The mapping of the datatable columns with 
        /// those of grid columns is done based upon the BindingKey property of the 
        /// Columns of the DCCGrid. 
        /// </summary>
        /// <param name="table">The DataTable from which the records needs to be fetched and 
        /// placed in the grid.</param>
        /// <param name="retainExistingRecords">A boolean which specifies whether or not to retain 
        /// the existing records in the grid.</param>
        /// <param name="rowState">State to which the fetched rows will be marked.</param>
        public void RetrieveRecords(DataTable table, bool retainExistingRecords, RowStates rowState)
        {
            try
            {
                this.gridDataModel.ImportData(table, retainExistingRecords, rowState);
                RaiseRecordsRetrievedEvent();
            }
            finally
            {
                this.StopEditing(false);
                this.EditMode = DataGridViewEditMode.EditOnKeystrokeOrF2;
            }
        }


        /// <summary>
        /// Retrieves the records from a list of object. The grid is added with as many rows 
        /// as many records in the the passed in list of objects. The mapping of the 
        /// properties of the object(in the passed in list)  with 
        /// those of grid columns is done based upon the BindingKey property of the 
        /// Columns of the DCCGrid. 
        /// </summary>
        /// <param name="lstObjects">The list of objects from which the records needs 
        /// to be fetched and placed in the grid.</param>
        /// <param name="retainExistingRecords">A boolean which specifies whether or not to retain 
        /// the existing records in the grid.</param>
        /// <param name="rowState">State to which the fetched rows will be marked.</param>
        public void RetrieveRecords(IList lstObjects, bool retainExistingRecords, RowStates rowState)
        {
            try
            {
                this.gridDataModel.ImportData(lstObjects, retainExistingRecords, rowState);
                RaiseRecordsRetrievedEvent();
            }
            finally
            {
                this.StopEditing(false);
                this.EditMode = DataGridViewEditMode.EditOnKeystrokeOrF2;
            }
        }
        private void RaiseGridClearedEvent()
        {
            EventHandler<EventArgs> handler = GridCleared;
            if (handler != null)
            {
                handler(this, new EventArgs());
            }
        }
        private void RaiseRecordsRetrievedEvent()
        {
            EventHandler<RecordsRetrievedEventArgs> handler = RecordsRetrieved;
            if (handler != null)
            {
                handler(this, new RecordsRetrievedEventArgs());
            }
        }

        internal void UpdateSingleRow(string rowIdentifier, DataTable toBeImportedTable, RowStates rowStateAfterRetrival)
        {
            this.gridDataModel.UpdateSingleRow(rowIdentifier, toBeImportedTable, rowStateAfterRetrival);
        }

        /// <summary>
        /// This method updates the objecect "objToBeUpdated" from the values of the grid row.
        /// The BindingKey property of each grid column is used to get the handle of the property of the
        /// passed object. So there must be a public set method on the targetted property of the object.
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="objToBeUpdated"></param>
        public void UpdateObjectPropertiesFromGridRow(int rowIndex, object objToBeUpdated)
        {
            foreach (DCCGridColumn column in this.Columns)
            {
                object cellValue = this.GetCellValue(column.Index, rowIndex);
                string propertyName = column.BindingKey;
                if (!string.IsNullOrEmpty(propertyName.Trim()))
                {
                    UtilityManager.SetPropertyValue(objToBeUpdated, propertyName, cellValue);
                }
            }
        }

        /// <summary>
        /// Returns a hashtable returning the bindingkey and columnname placed as key and value pair in hashtable
        /// with bindingKey as key of hashtable entry.
        /// </summary>
        /// <returns></returns>
        public Hashtable GetBindingKeyColumnNameMappings()
        {
            Hashtable table = new Hashtable();
            foreach (DCCGridColumn column in this.Columns)
            {
                if (!string.IsNullOrEmpty(column.BindingKey))
                {
                    table.Add(column.BindingKey, column.Name);
                }
            }
            return table;
        }


        /// <summary>
        /// This method returns the db tasks for this grid for delete, update and insert state (in order). 
        /// This method can be used while saving a grid. 
        /// This method internally loops through all the rows and finds out rows with
        /// the specified row state and then tries to map the binding key of individiual 
        /// columns to the parameters of the dbprocedure present in the dbFacade.
        /// </summary>
        /// <param name="rowState">The row state for which the db keys are required.</param>
        /// <param name="dbFacade">the facade object which has the ***AsTask method</param>
        /// <param name="deleteMethodNameInFacade">Name of the delete method(***AsTask) in the dbfacade(e.g. delPersons)</param>
        /// <param name="updateMethodNameInFacade">Name of the update method(***AsTask) in the dbfacade(e.g. updPersons)</param>
        /// <param name="insertMethodNameInFacade">Name of the insert method(***AsTask) in the dbfacade(e.g. insPersons)</param>
        /// <param name="seqNoColName">Name of the column which has the display order sequence.</param>
        /// <param name="overridingParameterValues">This is a hashtable which you can supply to specify those parameters and their values which could not be derived from the grid itself. 
        /// e.g. the id of the screen header to which this grid specifies as detail. The key of this hashtable is the name of the parameter which will be passed to the facade methods.</param>
        public List<string> GetAllDBTasks(object dbFacade, string deleteMethodNameInFacade, string updateMethodNameInFacade, string insertMethodNameInFacade, Hashtable overridingParameterValues)
        {
            return GetAllDBTasks(dbFacade, deleteMethodNameInFacade,
                updateMethodNameInFacade, insertMethodNameInFacade,
                overridingParameterValues, null, null, null);
        }

        /// <summary>
        /// This method returns the db tasks for this grid for delete, update and insert state (in order). 
        /// This method can be used while saving a grid. 
        /// This method internally loops through all the rows and finds out rows with
        /// the specified row state and then tries to map the binding key of individiual 
        /// columns to the parameters of the dbprocedure present in the dbFacade.
        /// </summary>
        /// <param name="rowState">The row state for which the db keys are required.</param>
        /// <param name="dbFacade">the facade object which has the ***AsTask method</param>
        /// <param name="deleteMethodNameInFacade">Name of the delete method(***AsTask) in the dbfacade(e.g. delPersons)</param>
        /// <param name="updateMethodNameInFacade">Name of the update method(***AsTask) in the dbfacade(e.g. updPersons)</param>
        /// <param name="insertMethodNameInFacade">Name of the insert method(***AsTask) in the dbfacade(e.g. insPersons)</param>
        /// <param name="seqNoColName">Name of the column which has the display order sequence.</param>
        /// <param name="overridingParameterValues">This is a hashtable which you can supply to specify those parameters and their values which could not be derived from the grid itself. 
        /// e.g. the id of the screen header to which this grid specifies as detail. The key of this hashtable is the name of the parameter which will be passed to the facade methods.</param>
        /// <param name="sequenceNegationMethodNameInFacade">If the grid manages records which are having a specific display order (or sequence number) in database, in that case you must provide
        /// a method in facade (generated from a stored procedure) which will negate (multiply with -1) to the current display order in database. Please note that this method must negate only one 
        /// record at a time and will be invoked muliple times. Also it must take the parameter which will be negative value of the display order as it appears in the grid after shuffleing has happened.</param>
        /// <param name="sequencePositiveMethodInFacade">In the last when the record values are set in database, the display order of the records which were set to negative values will be set to positive ones
        /// by multiplying the current negative value with -1. Please note that this method will be invoked only once and hence this method should take care of making positive all those records which
        /// come under the context of this grid</param>        
        /// <returns></returns>
        public List<string> GetAllDBTasks(object dbFacade,
            string deleteMethodNameInFacade,
            string updateMethodNameInFacade,
            string insertMethodNameInFacade,
            Hashtable overridingParameterValues,
            string seqNoColName,
            string sequenceNegationMethodNameInFacade,
            string sequencePositiveMethodInFacade)
        {
            List<string> returnValues = new List<string>();
            returnValues.AddRange(GetDBTasksForState(RowStates.Deleted, dbFacade, deleteMethodNameInFacade, overridingParameterValues, seqNoColName));
            if (!string.IsNullOrEmpty(seqNoColName) &&
                !string.IsNullOrEmpty(sequenceNegationMethodNameInFacade) &&
                !string.IsNullOrEmpty(sequencePositiveMethodInFacade))
            {
                returnValues.AddRange(GetDBTasksForSequenceNegation(dbFacade, sequenceNegationMethodNameInFacade, overridingParameterValues, seqNoColName));
            }
            returnValues.AddRange(GetDBTasksForState(RowStates.Updated, dbFacade, updateMethodNameInFacade, overridingParameterValues, seqNoColName));
            returnValues.AddRange(GetDBTasksForState(RowStates.New, dbFacade, insertMethodNameInFacade, overridingParameterValues, seqNoColName));
            if (!string.IsNullOrEmpty(seqNoColName) &&
               !string.IsNullOrEmpty(sequenceNegationMethodNameInFacade) &&
               !string.IsNullOrEmpty(sequencePositiveMethodInFacade))
            {
                returnValues.AddRange(GetDBTaskForSequencePositive(dbFacade, sequencePositiveMethodInFacade, overridingParameterValues));
            }
            return returnValues;
        }

        public List<string> GetDBTaskForSequencePositive(object dbFacade, string sequencePositiveMethodInFacade, Hashtable overridingParameterValues)
        {
            List<string> returnValues = new List<string>();
            Type type = dbFacade.GetType();
            MethodInfo dbMethod = type.GetMethod(sequencePositiveMethodInFacade);
            ParameterInfo[] methodParameters = dbMethod.GetParameters();


            List<object> parameterValues = CreateDBTaskForMethodInvocation(sequencePositiveMethodInFacade, overridingParameterValues, methodParameters);
            object methodInvocationResult = dbMethod.Invoke(dbFacade, parameterValues.ToArray());
            returnValues.Add(methodInvocationResult.ToString());

            return returnValues;
        }

        private List<object> CreateDBTaskForMethodInvocation(string sequencePositiveMethodInFacade, Hashtable overridingParameterValues, ParameterInfo[] methodParameters)
        {
            List<object> parameterValues = new List<object>();
            foreach (ParameterInfo info in methodParameters)
            {
                if (overridingParameterValues[info.Name] == null)
                {
                    throw new DCCException(null, MsgCodes.ObjectNotFound,
                        string.Format("Binding key corresponding to parameter '{0}' in method {1}|hashtable", info.Name, sequencePositiveMethodInFacade));
                }
                object typedValue = info.DefaultValue;
                if (info.ParameterType.Name.EndsWith("&"))//menas this parameter is passed by reference and should be initialize to its default value
                {
                    string baseTypeName = info.ParameterType.FullName.Substring(0, info.ParameterType.FullName.Length - 1);
                    Type t = Type.GetType(baseTypeName);
                    typedValue = Activator.CreateInstance(t);
                }
                typedValue = overridingParameterValues[info.Name];
                parameterValues.Add(typedValue);
            }
            return parameterValues;
        }
        public List<string> GetDBTasksForSequenceNegation(object dbFacade,
            string procedureName, Hashtable overridingParameterValues, string seqNoColName)
        {
            List<string> returnValues = new List<string>();
            Type type = dbFacade.GetType();
            MethodInfo dbMethod = type.GetMethod(procedureName);
            if (dbMethod == null)
            {
                throw new DCCException(null, MsgCodes.ObjectNotFound, string.Format("procedure name {0}|in passed in dbfacade", procedureName));
            }

            ParameterInfo[] methodParameters = dbMethod.GetParameters();

            List<DCCDataRowView> lstRows = this.GetRowsForState(RowStates.Old);
            lstRows.AddRange(this.GetRowsForState(RowStates.Updated));

            foreach (DCCDataRowView row in lstRows)
            {
                //[[If the sequenceNumber value present in the row is different from the palcement of the row
                //i.e. if the row has been altered per its sequence number, then proceed; else skip this row.
                if (row.AsInt(seqNoColName) == row.DisplayOrder)
                {
                    continue;
                }
                //]]
                List<object> parameterValues = CreateDBTaskForRow(procedureName, overridingParameterValues, methodParameters, row, seqNoColName, true);
                object methodInvocationResult = dbMethod.Invoke(dbFacade, parameterValues.ToArray());
                returnValues.Add(methodInvocationResult.ToString());
            }
            return returnValues;
        }

        /// <summary>
        /// This method returns the db tasks for this grid for the given row state. This method can be used
        /// while saving a grid. This method internally loops through all the rows and finds out rows with
        /// the specified row state and then tries to map the binding key of individiual columns to the parameters
        /// of the dbprocedure present in the dbFacade.
        /// </summary>
        /// <param name="rowState">The row state for which the db keys are required.</param>
        /// <param name="dbFacade">the facade object which has the ***AsTask method</param>
        /// <param name="procedureName">The name of the ***AsTask method.</param>
        /// <returns></returns>
        public List<string> GetDBTasksForState(RowStates rowState, object dbFacade,
            string procedureName, Hashtable overridingParameterValues, string seqNoColName)
        {
            List<string> returnValues = new List<string>();
            if (string.IsNullOrEmpty(procedureName))
            {
                return returnValues;
            }
            Type type = dbFacade.GetType();
            MethodInfo dbMethod = type.GetMethod(procedureName);
            if (dbMethod.ReturnType != typeof(string))
            {
                throw new Exception(string.Format("Method '{0}' can't be used to generate  a DBTask. Did you forgot to supply the ***AsTask method name instead?", procedureName), null);
            }
            ParameterInfo[] methodParameters = dbMethod.GetParameters();

            List<DCCDataRowView> lstRows = this.GetRowsForState(rowState);
            //[[Set the sequence number for all these rows as this will be null for new state
            if (rowState == RowStates.New && !string.IsNullOrEmpty(seqNoColName))
            {
                foreach (DCCDataRowView row in lstRows)
                {
                    string identifier = row.RowIdentifier;
                    this.SetCellValue(seqNoColName, identifier, row.DisplayOrder);
                }
            }
            //]]
            foreach (DCCDataRowView row in lstRows)
            {
                List<object> parameterValues = CreateDBTaskForRow(procedureName, overridingParameterValues, methodParameters, row, seqNoColName, false);
                object methodInvocationResult = dbMethod.Invoke(dbFacade, parameterValues.ToArray());
                returnValues.Add(methodInvocationResult.ToString());
            }
            return returnValues;
        }

        private List<object> CreateDBTaskForRow(string procedureName, Hashtable overridingParameterValues,
                                                ParameterInfo[] methodParameters, DCCDataRowView row,
                                                string seqNoColName, bool doNegationOfSequenceValue)
        {
            if (overridingParameterValues == null)
            {
                overridingParameterValues = new Hashtable();
            }

            List<object> parameterValues = new List<object>();
            Hashtable table = this.GetBindingKeyColumnNameMappings();
            foreach (ParameterInfo info in methodParameters)
            {
                if (!table.Contains(info.Name) && !overridingParameterValues.Contains(info.Name))
                {
                    throw new DCCException(null, MsgCodes.ObjectNotFound,
                        string.Format("binding key corresponding to parameter {0} in method {1}| in grid '{2}'", info.Name, procedureName, this.Title));
                }
                object typedValue = info.DefaultValue;
                if (info.ParameterType.Name.EndsWith("&"))//menas this parameter is passed by reference and should be initialize to its default value
                {
                    string baseTypeName = info.ParameterType.FullName.Substring(0, info.ParameterType.FullName.Length - 1);
                    Type t = Type.GetType(baseTypeName);
                    typedValue = Activator.CreateInstance(t);
                }
                else
                {
                    if (table[info.Name] != null)
                    {
                        string columnName = table[info.Name].ToString();
                        if (this.Columns[columnName].GetType() == typeof(DCCCheckBoxGridColumn))
                        {
                            typedValue = (row.AsBln(columnName).HasValue && row.AsBln(columnName).Value == true) ? "Yes" : "No";
                        }
                        else if (columnName == seqNoColName)
                        {
                            int multiplier = 1;
                            if (doNegationOfSequenceValue)
                            {
                                multiplier = -1;
                            }
                            typedValue = row.DisplayOrder;
                            if (info.ParameterType == typeof(short?))
                            {
                                int displayOrder = row.DisplayOrder * multiplier;
                                typedValue = (short?)displayOrder;
                            }
                            else if (info.ParameterType == typeof(short))
                            {
                                int displayOrder = row.DisplayOrder * multiplier;
                                typedValue = (short)displayOrder;
                            }
                        }
                        else
                        {
                            typedValue = row.GetTypedValue(columnName, info.ParameterType);
                        }
                    }
                }
                if (overridingParameterValues.Contains(info.Name))//i.e. the same parameter is defined in the hashtable as well, then override with this one
                {
                    typedValue = overridingParameterValues[info.Name];
                }

                parameterValues.Add(typedValue);
            }
            return parameterValues;
        }
        /// <summary>
        /// Clears grid of all the records.
        /// </summary>
        public void RemoveAllRecords()
        {
            this.gridDataModel.RemoveAllRecords();
            RaiseGridClearedEvent();
        }


        /// <summary>
        /// Inserts a row below of the current row and returns the identifier of the 
        /// newly added row
        /// </summary>
        /// <returns></returns>
        public string InsertRowBelow()
        {
            return InsertRowBelow(true);
        }

        /// <summary>
        /// Inserts a row below of the current row and returns the identifier of the 
        /// newly added row
        /// </summary>
        /// <returns></returns>
        public string InsertRowBelow(bool makeNewRowCurrent)
        {
            if (this.CurrentCell == null && this.RowCount != 0)
            {
                return null;
            }

            string newRowIdentifier;
            if (this.RowCount == 0)
            {
                newRowIdentifier = this.gridDataModel.AddRowBottom();
            }
            else
            {
                int rowIndex = this.CurrentCell.RowIndex;
                bool isCurrentRowValid = ValidateRowAndShowMessageToUser(rowIndex);
                if (!isCurrentRowValid)
                {
                    return null;
                }

                string rowIdentifier = this.gridDataModel.GetRowIdentifierForGridRowIndex(rowIndex);
                newRowIdentifier = this.gridDataModel.AddRowBelow(rowIdentifier);
            }
            if (makeNewRowCurrent)
            {
                this.SetCurrentRow(newRowIdentifier);
            }
            return newRowIdentifier;
        }

        /// <summary>
        /// Inserts a blank row at the bottom of the grid and returns the rowIdentifier of the 
        /// newly added row.
        /// </summary>
        public string InsertRowBottom()
        {
            return InsertRowBottom(true);
        }
        public string InsertRowBottom(bool makeNewRowCurrent)
        {
            return InsertRowBottom(makeNewRowCurrent, true);
        }
        /// <summary>
        /// Inserts a blank row at the bottom of the grid and returns the rowIdentifier of the 
        /// newly added row.
        /// </summary>
        public string InsertRowBottom(bool makeNewRowCurrent, bool compulsaryValidateRow)
        {
            //[[If there is a row(as sometimes the grid can be blank) and is selected
            //then validate it and move on to adding a new row at bottom
            if (this.CurrentCell != null)
            {
                int rowIndex = this.CurrentCell.RowIndex;
                bool isCurrentRowValid = true;
                if (compulsaryValidateRow)
                {
                    isCurrentRowValid = ValidateRowAndShowMessageToUser(rowIndex);
                }
                if (!isCurrentRowValid)
                {
                    return null;
                }
            }
            //]]
            //[[If there is already a row in the none mode in the last, then simply return
            if (this.Rows.Count > 0 &&
                this.GetRowState(this.Rows.Count - 1) == RowStates.None)
            {
                return null;
            }
            //]]

            string newRowIdentifier = this.gridDataModel.AddRowBottom();
            if (makeNewRowCurrent)
            {
                this.SetCurrentRow(newRowIdentifier);
            }
            return newRowIdentifier;

        }
        /// <summary>
        /// Inserts a row above of the current row and returns the identifier of the 
        /// newly added row
        /// </summary>
        /// <returns>The row identifier of the newly inserted row.</returns>
        public string InsertRowAbove()
        {
            return InsertRowAbove(true);
        }

        /// <summary>
        /// Inserts a row above of the current row and returns the identifier of the 
        /// newly added row
        /// </summary>
        /// <returns>The row identifier of the newly inserted row.</returns>
        public string InsertRowAbove(bool makeNewRowCurrent)
        {
            if (this.CurrentCell == null)
            {
                return null;
            }
            int rowIndex = this.CurrentCell.RowIndex;
            bool isCurrentRowValid = ValidateRowAndShowMessageToUser(rowIndex);
            if (!isCurrentRowValid)
            {
                return null;
            }
            string rowIdentifier = this.gridDataModel.GetRowIdentifierForGridRowIndex(rowIndex);
            string newRowIdentifier = this.gridDataModel.AddRowAbove(rowIdentifier);
            if (makeNewRowCurrent)
            {
                this.SetCurrentRow(newRowIdentifier);
            }
            return newRowIdentifier;
        }

        /// <summary>
        /// Deletes the current row of the grid
        /// </summary>
        public void DeleteRow()
        {
            if (this.CurrentCell == null || this.GetRowState(this.CurrentRowIndex) == RowStates.None)
            {
                return;
            }
            this.StopEditing(true);//Stop editing if the current cell is being edited.
            //[[Deleting the row causes the next row to take on to same row index and 
            //some internal glitch in DataGridView causes the editor component to carry 
            //the same value as of the active cell of the just deleted row. So just stop
            //the editing of the cell.
            this.EditMode = DataGridViewEditMode.EditOnKeystrokeOrF2;
            //]]
            int rowIndex = this.CurrentRowIndex;
            string rowIdentifier = this.gridDataModel.GetRowIdentifierForGridRowIndex(rowIndex);
            //[[Raise the RowDeleting event
            RowDeletingEventArgs rowDeletingEventArgs = new RowDeletingEventArgs(this.CurrentRowIndex);
            string identifierOfDeletedRow = this.CurrentRowIdentifier;
            RaiseRowDeletingEvent(rowDeletingEventArgs);
            if (rowDeletingEventArgs.Cancel)//If the event handler code has set the Cancel=true, then return from here
            {
                return;
            }
            //]]
            this.gridDataModel.DeleteRow(rowIdentifier);
            RowDeletedEventArgs rowDeletedEventArgs = new RowDeletedEventArgs(identifierOfDeletedRow);
            this.RaiseRowDeletedEvent(rowDeletedEventArgs);
            this.RaiseRowSelectionModifiedEvent(true);
        }

        public bool IsGridEmpty()
        {
            return GetVisibleRowsCount() <= 0;
        }

        public int GetVisibleRowsCount()
        {
            return GetVisibleRowsCount(false);
        }

        public int GetVisibleRowsCount(bool includeNoneStateRows)
        {
            int visibleRows = GetRowsForState(RowStates.Updated).Count +
            GetRowsForState(RowStates.Old).Count +
            GetRowsForState(RowStates.New).Count;

            if (includeNoneStateRows)
            {
                visibleRows += GetRowsForState(RowStates.None).Count;
            }
            return visibleRows;
        }

        /// <summary>
        /// Returns a list of DCCDataRowView objects representing the rows in the
        /// grid having the speficied Row State. This list can be used to iterate 
        /// through and to commit the changes in the database. Typical use of this
        /// method would be in the Save() method of the screen.
        /// </summary>
        /// <param name="rowState"></param>
        /// <returns></returns>
        public List<DCCDataRowView> GetRowsForState(RowStates rowState)
        {
            DataView view = this.gridDataModel.GetRowsForState(rowState);
            List<DCCDataRowView> lstRows = new List<DCCDataRowView>();
            foreach (DataRowView rowView in view)
            {
                lstRows.Add(new DCCDataRowView(rowView, this));
            }
            return lstRows;
        }

        /// <summary>
        /// Returns a list of DCCDataRowView objects representing the rows in the
        /// grid having the speficied Row State. This list can be used to iterate 
        /// through and to commit the changes in the database. Typical use of this
        /// method would be in the Save() method of the screen.
        /// </summary>
        /// <param name="rowState"></param>
        /// <returns></returns>
        public List<DCCDataRowView> GetAllNonDeletedRows()
        {
            DataView view = this.gridDataModel.GetAllNonDeletedRows();
            List<DCCDataRowView> lstRows = new List<DCCDataRowView>();
            foreach (DataRowView rowView in view)
            {
                lstRows.Add(new DCCDataRowView(rowView, this));
            }
            return lstRows;
        }

        /// <summary>
        /// Returns the row state for the given row index
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <returns></returns>
        public RowStates GetRowState(int rowIndex)
        {
            string rowGuid = this.gridDataModel.GetRowIdentifierForGridRowIndex(rowIndex);
            return this.gridDataModel.GetRowState(this.gridDataModel.GetRowForRowIdentifier(rowGuid));
        }

        private void DCCGrid_MouseDown(object sender, MouseEventArgs e)
        {
            //if (e.Button != MouseButtons.Right)
            //{
            //    return;
            //}
            //int rowIndex = this.HitTest(e.X, e.Y).RowIndex;
            //int columnIndex = this.HitTest(e.X, e.Y).ColumnIndex;
            //this.EnableContextMenu(false);
            //if (rowIndex == -1 ||  //Either user clicks on Grid Header
            //    (rowIndex == CurrentRowIndex && //Or if user clicks on the rowheader of the active row which is not in NONE mode
            //        columnIndex == -1 &&
            //        this.GetRowState(rowIndex) != RowStates.None))
            //{
            //    this.EnableContextMenu(true);
            //}
        }


        private void dccContextMenuStrip_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            if (e.ClickedItem == addRowAboveToolStripMenuItem)
            {
                this.InsertRowAbove();
            }
            else if (e.ClickedItem == addRowBelowToolStripMenuItem1)
            {
                this.InsertRowBelow();
            }
            else if (e.ClickedItem == deleteRowToolStripMenuItem)
            {
                this.DeleteRow();
            }
        }

        /// <summary>
        /// New method provided in DCC Grid to activate a cell with given column and row indices
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <param name="columnIndex"></param>
        internal void ActivateCell(int columnIndex, int rowIndex)
        {
            try
            {
                ////Check if there is any cell (other than specified by columnIndex and rowIndex) is in edit mode
                ////if yes, then stop editing 
                //if(this.EditingControl!=null)
                //{
                //    this.CancelEdit();
                //}
                this.CurrentCell = this[columnIndex, rowIndex];
            }
            catch (Exception ex)
            {
                if (ex.Message ==
                    "Operation did not succeed because the program cannot commit or quit a cell value change.")
                {
                    //donothing
                }
                else
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Sets the focus on the grid.
        /// </summary>
        /// <param name="columnIndex"></param>
        /// <param name="rowIndex"></param>
        public void SetFocus(int columnIndex, int rowIndex)
        {
            this.Focus();
            ActivateCell(columnIndex, rowIndex);
        }

        private void DCCGrid_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex < 0) return; //Return if the row header is cliecked.
            ////[[Use this event to capture if the Button cell was clicked.
            if (((DCCGridColumn)this.Columns[e.ColumnIndex]).ColumnCellType == DCCGridCellTypes.Button &&
                this.CurrentCell != null &&
                this.CurrentCell.RowIndex == e.RowIndex &&
                this.CurrentCell.ColumnIndex == e.ColumnIndex
                )
            {
                RaiseButtonCellClicked(e.ColumnIndex, e.RowIndex);
            }
            /// ]]


            ////[[Use this event to capture if the Link cell was clicked.
            if (((DCCGridColumn)this.Columns[e.ColumnIndex]).ColumnCellType == DCCGridCellTypes.Link &&
                this.CurrentCell != null &&
                this.CurrentCell.RowIndex == e.RowIndex &&
                this.CurrentCell.ColumnIndex == e.ColumnIndex
                )
            {
                RaiseLinkCellClicked(e.ColumnIndex, e.RowIndex);
            }
            /// ]]
        }

        protected virtual void RaiseButtonCellClicked(int columnIndex, int rowIndex)
        {
            ButtonCellEventArgs eventArgs = new ButtonCellEventArgs(columnIndex, rowIndex);
            // Make a temporary copy of the event to avoid possibility of
            // a race condition if the last subscriber unsubscribes
            // immediately after the null check and before the event is raised.
            EventHandler<ButtonCellEventArgs> handler = ButtonCellClicked;

            // Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, eventArgs);
            }
        }
        protected virtual void RaiseLinkCellClicked(int columnIndex, int rowIndex)
        {
            DCCGridLink link = (DCCGridLink)GetCellValue(columnIndex, rowIndex);
            if (link == null) return;//dont raise the event if there is no link info present in the cell.
            LinkCellClickedEventArgs eventArgs = new LinkCellClickedEventArgs(columnIndex, rowIndex, link);

            // Make a temporary copy of the event to avoid possibility of
            // a race condition if the last subscriber unsubscribes
            // immediately after the null check and before the event is raised.
            EventHandler<LinkCellClickedEventArgs> handler = LinkCellClicked;

            // Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, eventArgs);
            }
        }
        internal void RaiseFillDefaltCellValues(int rowIndex)
        {
            FillDefaultCellValuesEventArgs eventArgs = new FillDefaultCellValuesEventArgs(rowIndex);
            EventHandler<FillDefaultCellValuesEventArgs> handler = FillDefaultCellValues;
            if (handler != null)
            {
                handler(this, eventArgs);
            }
        }

        /// <summary>
        /// Finds the records in the grid which match the specified criteria.
        /// The criteria is specified in a List of KeyValuePairs, where the key
        /// is the name of the column and value is the "value" for which the serach 
        /// will be made. If there are multiple keyvaluesparis with the same key, then
        /// the values are taken as an OR condition, else the keys are taken as a set of 
        /// AND clasues
        /// </summary>
        /// <param name="columnNameValuePairs"></param>
        /// <param name="rowIdentifiersToExclude">Identifiers of the rows to be explicitly excluded from the final results</param>
        /// <param name="rowStatesToExclude">A list of RowStates objects stating the rows to be explicitly excluded from the final results</param>
        /// <example>E.g. if the grid has columns as FirstName and LastName, and you want to 
        /// Find all those records where first name is "abc" then you will provie a 
        /// keyvalue pair with key as "FirstName" and value as "abc". If you want to have
        /// all the name where first name is either "abc" or "def" then you specify 2 keyvalue
        /// pairs where the key in both the paris remains "FirstName" and values as "abc" and "def"
        /// respectively. And if you want to search those records where firstname is "abc" 
        /// and lastName is "xyz", then specify 2 keyvaluepairs where first pair has key as "FirstName"
        /// and value as "abc" and second pair has key as "LastName" and value as "xyz"</example>
        /// <returns></returns>
        public List<DCCDataRowView> FindRecords(List<KeyValuePair<string, object>> columnNameValuePairs,
                                                List<RowStates> rowStatesToExclude, List<string> rowIdentifiersToExclude,
                                                bool ignoreCase, bool trimValues)
        {
            List<DCCDataRowView> returnValues = new List<DCCDataRowView>();

            ///[[Segregate the items in the keyvalue paris list "columnNameValuePairs" into seprate buckets,
            //where the key is matching. the search will be made as "OR" condition within the
            //bucket and "AND" condition across the buckets.
            List<KeyAndValues> keyValueBuckets = new List<KeyAndValues>();
            foreach (KeyValuePair<string, object> pair in columnNameValuePairs)
            {
                KeyAndValues existingBucket = KeyAndValues.FindBucket(keyValueBuckets, pair.Key);
                if (existingBucket != null)
                {
                    existingBucket.AddValue(pair.Value);
                }
                else
                {
                    existingBucket = new KeyAndValues(pair.Key, pair.Value);
                    keyValueBuckets.Add(existingBucket);
                }
            }
            //]]

            ///[[Now loop through all the rows of the grid and apply the "OR" within bucket
            //and "AND" across bucekts.
            foreach (DataRow row in gridDataModel.Rows)
            {
                bool isRowOfInterest = true;
                foreach (KeyAndValues bucket in keyValueBuckets)
                {
                    isRowOfInterest = isRowOfInterest && IsAnyValuePresent(bucket, row, ignoreCase, trimValues);
                }
                if (isRowOfInterest)
                {
                    returnValues.Add(new DCCDataRowView(row));
                }
            }
            //]]

            ///[[Now exclude those rows where the row state is one of the specified row states
            if (rowStatesToExclude != null && rowStatesToExclude.Count > 0 && returnValues.Count > 0)
            {
                for (int i = returnValues.Count - 1; i >= 0; i--)
                {
                    if (rowStatesToExclude.Contains(returnValues[i].RowState))
                    {
                        returnValues.RemoveAt(i);
                    }
                }
            }
            //]]

            ///[[Now exclude those rows where the row identifier is one of the specified row identifiers
            if (rowIdentifiersToExclude != null && rowIdentifiersToExclude.Count > 0 && returnValues.Count > 0)
            {
                for (int i = returnValues.Count - 1; i >= 0; i--)
                {
                    if (rowIdentifiersToExclude.Contains(returnValues[i].RowIdentifier))
                    {
                        returnValues.RemoveAt(i);
                    }
                }
            }
            //]]
            return returnValues;
        }


        /// <summary>
        /// Gets the row identifier of the current row
        /// </summary>
        public string CurrentRowIdentifier
        {
            get
            {
                return this.gridDataModel.GetRowIdentifierForGridRowIndex(this.CurrentRowIndex);
            }

        }

        /// <summary>
        /// Specifies whether or not sorting is allowed when user clicks on the 
        /// header of the column. By default it is set to off. However, for grids
        /// which are ListViewGrids, this property is automatically set to true at 
        /// runtime by CDF.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Defines whether or not sorting would be allowed on rows of this grid.")]
        public bool AllowRowSorting
        {
            get { return allowRowSorting; }
            set { allowRowSorting = value; }
        }
        /// <summary>
        /// Specifies whether or not the "Insert Row Below" menu and related functionality will be enabled
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies whether or not the \"Insert Row above\" and \"Insert Row Below\" menus and related functionality will be enabled")]
        [System.ComponentModel.Browsable(false)]
        public bool InsertRowsMenuItemsEnabled
        {
            get
            {
                return this.insertRowsMenuItemsEnabled;
            }
            set
            {
                this.insertRowsMenuItemsEnabled = value;
                this.EnableContextMenu(this.dccContextMenuStrip.Enabled);
            }
        }
        /// <summary>
        /// Specifies whether or not the "Delete Row" menu and related functionality will be enabled
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies whether or not the \"Delete Row\" menu and related functionality will be enabled")]
        [System.ComponentModel.Browsable(false)]
        public bool DeleteRowMenuEnabled
        {
            get
            {
                return this.deleteRowMenuEnabled;
            }
            set
            {
                this.deleteRowMenuEnabled = value;
                this.EnableContextMenu(this.dccContextMenuStrip.Enabled);
            }
        }
        /// <summary>
        /// Specifies the user interaction mode of this grid. For normal grids where in user
        /// will feed the data (by typing) the value should be set to "Auto". For grids which
        /// are programatically controlled (e.g. List view or summary view grids) the value should 
        /// set to "Program"
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Set it to \"Auto\" for normal grids and to \"Program\" for List/Summary view grids.")]
        public UserModes UserMode
        {
            get { return userMode; }
            set
            {
                userMode = value;
                if (value == UserModes.Program)
                {
                    this.ReadOnly = true;
                    this.ShowCommandStrip = false;
                    this.EnableContextMenu(false);
                }
                

            }
        }

        /// <summary>
        /// Specifies whether or not atleaset one row must be speficied for 
        /// this grid to be valid for save.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies whether or not atleaset one row must be specified for this grid")]
        public bool Mandatory
        {
            get { return isMandatory; }
            set { isMandatory = value; }
        }


        /// <summary>
        /// Gets the row identifier of the row specified by row index.
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <returns></returns>
        public string GetRowIdentifier(int rowIndex)
        {
            return this.gridDataModel.GetRowIdentifierForGridRowIndex(rowIndex);
        }

        /// <summary>
        /// Returns the index of the row in the grid for the specified row-identifier.
        /// </summary>
        /// <param name="rowIdentifier"></param>
        /// <returns></returns>
        public int GetGridRowIndexFromRowIdentifier(string rowIdentifier)
        {
            return this.gridDataModel.GetGridRowIndexFromRowIdentifier(rowIdentifier);
        }


        private bool IsAnyValuePresent(KeyAndValues keyAndValues, DataRow row, bool ignoreCase, bool trimValue)
        {
            if (this.gridDataModel.GetRowState(row) == RowStates.None)
            {
                return false;
            }
            foreach (object value in keyAndValues.Values)
            {
                if (value == null) continue;

                if (this.gridDataModel.Columns[keyAndValues.Key].DataType == typeof(DateTime))
                {
                    DateTime valueAsDateTime = (DateTime)value;
                    DateTime cellValueAsDateTime = row[keyAndValues.Key] == null ||
                                                   row[keyAndValues.Key] == DBNull.Value
                                                       ? DateTime.MinValue
                                                       : (DateTime)row[keyAndValues.Key];
                    if (valueAsDateTime.ToString(Constants.DATE_FORMAT) == cellValueAsDateTime.ToString(Constants.DATE_FORMAT))
                    {
                        return true;
                    }
                }
                else if (this.gridDataModel.Columns[keyAndValues.Key].DataType != typeof(object))
                {
                    string valueAsString = value.ToString();
                    string cellValueAsString = row[keyAndValues.Key] == null
                                                   ? string.Empty
                                                   : row[keyAndValues.Key].ToString();
                    if (ignoreCase)
                    {
                        valueAsString = valueAsString.ToUpper();
                        cellValueAsString = cellValueAsString.ToUpper();
                    }
                    if (trimValue)
                    {
                        valueAsString = valueAsString.Trim();
                        cellValueAsString = cellValueAsString.Trim();
                    }
                    if (valueAsString == cellValueAsString)
                    {
                        return true;
                    }
                }
                else
                {
                    if (row[keyAndValues.Key] == value) return true;
                }
            }
            return false;
        }
        /// <summary>
        /// Moves the row, specified by rowIndex, up by one count. If the specified row is at index 0
        /// then nothing changes.
        /// </summary>
        /// <param name="rowIndex"></param>
        public void MoveRowUp(int rowIndex)
        {
            if (rowIndex < 0)
            {
                return;
            }
            //[[If the specified row is in None mode, then return
            if (this.GetRowState(rowIndex) == RowStates.None)
            {
                return;
            }
            //]]
            //[[If the specified row is alrady on the top, then return.
            if (rowIndex == 0)
            {
                return;
            }
            //]]
            //[[If the row at index one less than the specified row index is in None mode, then return.
            //This is an unlikely case, but still putting the check.
            if (this.GetRowState(rowIndex - 1) == RowStates.None)
            {
                return;
            }
            //]]
            SwapRows(rowIndex, rowIndex - 1);
        }

        /// <summary>
        /// Moves the current row, up by one count. If the specified row is at index 0
        /// then nothing changes.
        /// </summary>
        public void MoveRowUp()
        {
            MoveRowUp(this.CurrentRowIndex);
        }
        /// <summary>
        /// Moves the row, specified by rowIndex, up by one count. If the specified row is at index 0
        /// then nothing changes.
        /// </summary>
        /// <param name="rowIndex"></param>
        public void MoveRowDown(int rowIndex)
        {
            if (rowIndex < 0)
            {
                return;
            }
            //[[If the specified row is in None mode, then return
            if (this.GetRowState(rowIndex) == RowStates.None)
            {
                return;
            }
            //]]
            //[[If specified row is the last row of the grid, then return
            if (rowIndex == this.Rows.Count - 1)
            {
                return;
            }
            //]]
            //[[If the row next to the specified row is in None mode, return (the case of use moving the last non-none row of grid)
            if (this.GetRowState(rowIndex + 1) == RowStates.None)
            {
                return;
            }
            //]]
            SwapRows(rowIndex, rowIndex + 1);
        }

        /// <summary>
        /// Moves the current row, up by one count. If the specified row is at index 0
        /// then nothing changes.
        /// </summary>
        public void MoveRowDown()
        {
            MoveRowDown(this.CurrentRowIndex);
        }

        /// <summary>
        /// Swaps the condents of the rows.
        /// </summary>
        /// <param name="firstRowIndex"></param>
        /// <param name="secondRowIndex"></param>
        public void SwapRows(int firstRowIndex, int secondRowIndex)
        {
            string currentRowIdentifier = CurrentRowIdentifier;
            int currentColumnIndex = 0;
            int currentRowIndex = 0;
            if (!string.IsNullOrEmpty(currentRowIdentifier))
            {
                currentColumnIndex = this.CurrentColumnIndex;
                currentRowIndex = this.CurrentRowIndex;
            }
            try
            {
                this.gridDataModel.SwapRows(this.GetRowIdentifier(firstRowIndex), this.GetRowIdentifier(secondRowIndex));
            }
            finally
            {
                if (!string.IsNullOrEmpty(currentRowIdentifier))
                {
                    this.ActivateCell(currentColumnIndex, currentRowIndex == firstRowIndex ? secondRowIndex : firstRowIndex);
                }
            }
        }

        /// <summary>
        /// This method is invoked from DCCGridCellClass when user the editing cell
        /// wants to show lookup dialog.
        /// </summary>
        /// <param name="e"></param>
        internal void RaiseLookupShowingEvent(LookupEventArgs e)
        {
            EventHandler<LookupEventArgs> handler = LookupDialogShowing;
            if (handler != null)
            {
                handler(this, e);
            }
        }

        internal void RaiseLookupResultSetEvent(LookupResult result)
        {
            LookupResultEventArgs args = new LookupResultEventArgs(result);
            EventHandler<LookupResultEventArgs> handler = LookupResultSet;
            if (handler != null)
            {
                handler(this, args);
            }
        }
        internal ContextMenuStrip DCCGridContextMenu
        {
            get { return dccContextMenuStrip; }
        }
        private void dccContextMenuStrip_Opening(object sender, CancelEventArgs e)
        {
            this.StopEditing(true);
            //[[Now set the Edit mode to "EditOnF2". This is set back to "EditOnEnter"
            // when user tries to browse across the cells. "EditOnEnter" is the right
            // behavior. However it is set to "EditOnF2" here for a fix of a bugg.
            // The bugg was that if the current row is deleted with one cell in edit mode, 
            //the next row coming upwards would have the same cell editor with 
            //the previous cell value in that cell.
            this.EditMode = DataGridViewEditMode.EditOnKeystrokeOrF2;
            //]]
        }



        internal void HandleKeyDownEvent(KeyEventArgs e)
        {
            //Ctrl-Ins (for Insert Above - the most common operation), 
            //Ctrl-Shift-B (for Insert After), 
            //Ctrl-Shift-L (for Insert Last) 
            //and Ctrl-Del (for Delete).
            if (e.Modifiers == Keys.Control)
            {
                if (e.KeyCode == Keys.Insert)
                {
                    //[[If InsertRowsMenuItemsEnabled is set to false, then return 
                    if (!this.InsertRowsMenuItemsEnabled ||
                        !this.dccContextMenuStrip.Enabled)
                    {
                        return;
                    }
                    //]]
                    this.StopEditing(true);
                    this.InsertRowAbove();
                }
            }
            if (e.Modifiers == (Keys.Control | Keys.Shift))
            {
                if (e.KeyCode == Keys.B)
                {
                    //[[If InsertRowsMenuItemsEnabled is set to false, then return 
                    if (!this.InsertRowsMenuItemsEnabled ||
                        !this.dccContextMenuStrip.Enabled)
                    {
                        return;
                    }
                    //]]
                    this.StopEditing(true);
                    this.InsertRowBelow();
                }
            }
            if (e.Modifiers == (Keys.Control | Keys.Shift))
            {
                if (e.KeyCode == Keys.L)
                {
                    //[[If InsertRowsMenuItemsEnabled is set to false, then return 
                    if (!this.InsertRowsMenuItemsEnabled ||
                        !this.dccContextMenuStrip.Enabled)
                    {
                        return;
                    }
                    //]]
                    this.StopEditing(true);
                    this.InsertRowBottom();
                }
            }
            if (e.Modifiers == Keys.Control)
            {
                if (e.KeyCode == Keys.Delete)
                {
                    //[[If DeleteRowMenuEnabled is set to false, then return 
                    if (!this.DeleteRowMenuEnabled ||
                        !this.dccContextMenuStrip.Enabled)
                    {
                        return;
                    }
                    //]]
                    this.StopEditing(false);
                    this.DeleteRow();
                }
            }
        }
        #region IUIAutomationCodeProvider Members
        enum GrdListCols
        {
            [Description("col1")]
            col1,
            [Description("col2")]
            col2
        }
        public string GetAutomationCode()
        {
            StringBuilder sb = new StringBuilder();
            string gridName = this.Name;
            gridName = gridName.Substring(0, 1).ToUpper() + gridName.Substring(1, gridName.Length - 1);
            sb.AppendLine("public enum " + gridName + "Columns");
            sb.AppendLine("{");
            for (int i = 0; i < this.Columns.Count; i++)
            {
                string enumElement = GetColumnEnumElement(this.Columns[i]);
                if (i < this.Columns.Count - 1)
                {
                    sb.AppendLine('\t' + enumElement + ",");
                }
                else
                {
                    sb.AppendLine('\t' + enumElement);
                }
            }
            sb.AppendLine("}");
            string template = "public TAFGrid uiAutomationId{get {return this.GetGrid(\"uiAutomationId\");}}";
            sb.Append(template.Replace("uiAutomationId", this.Name));
            return sb.ToString();
        }
        private string GetColumnEnumElement(DataGridViewColumn column)
        {
            return string.Format(@"/// <summary>{0}</summary>
            {1}", column.HeaderText, column.Name);
        }

        #endregion

    }

    class KeyAndValues
    {
        private string key;
        private List<object> values = new List<object>();

        public KeyAndValues(string key, object value)
        {
            this.Key = key;
            AddValue(value);
        }

        public string Key
        {
            get { return key; }
            set { key = value; }
        }

        public List<object> Values
        {
            get { return values; }
            set { values = value; }
        }

        public void AddValue(object value)
        {
            this.Values.Add(value);
        }

        public static KeyAndValues FindBucket(List<KeyAndValues> keyValueBuckets, string key)
        {
            foreach (KeyAndValues bucket in keyValueBuckets)
            {
                if (bucket.Key == key)
                {
                    return bucket;
                }
            }
            return null;
        }
    }
    public class FillDefaultCellValuesEventArgs : EventArgs
    {
        private int rowIndex;

        public int RowIndex
        {
            get { return rowIndex; }
            set { rowIndex = value; }
        }

        public FillDefaultCellValuesEventArgs(int rowIndex)
        {
            this.rowIndex = rowIndex;
        }
    }

    public class ButtonCellEventArgs : EventArgs
    {
        private int rowIndex;
        private int columnIndex;

        public int RowIndex
        {
            get { return rowIndex; }
            set { rowIndex = value; }
        }

        public int ColumnIndex
        {
            get { return columnIndex; }
            set { columnIndex = value; }
        }

        public ButtonCellEventArgs(int columnIndex, int rowIndex)
        {
            this.columnIndex = columnIndex;
            this.rowIndex = rowIndex;
        }

    }
    public class LinkCellClickedEventArgs : EventArgs
    {
        private int rowIndex;
        private int columnIndex;

        public int RowIndex
        {
            get { return rowIndex; }
            set { rowIndex = value; }
        }

        public int ColumnIndex
        {
            get { return columnIndex; }
            set { columnIndex = value; }
        }

        public LinkCellClickedEventArgs(int columnIndex, int rowIndex, DCCGridLink linkObject)
        {
            this.columnIndex = columnIndex;
            this.rowIndex = rowIndex;
            this.Link = linkObject;
        }

        public DCCGridLink Link { get; set; }

    }


    public class ValidateRowEventArgs : EventArgs
    {
        private int rowIndex;
        private bool isValid = true;
        public ValidateRowEventArgs(int rowIndex, bool isValid)
        {
            this.rowIndex = rowIndex;
            this.IsValid = isValid;
        }
        /// <summary>
        /// The index of the row getting validated
        /// </summary>
        public int RowIndex
        {
            get { return rowIndex; }
        }

        /// <summary>
        /// A boolean representing whether this row is valid or not. Default value is true specifying that this row is valid, 
        /// unless the event handler code changes this value to false. The screen providing the handler of this event
        /// must set this property to false, if the current row is not valid.
        /// </summary>
        public bool IsValid
        {
            get { return isValid; }
            set { isValid = value; }
        }
    }
    public class RecordsRetrievedEventArgs : EventArgs
    {
        //this is a place holder for later properties
    }
    public class ComboBoxSelectionModifiedEventArgs : EventArgs
    {
        private int rowIndex;
        private int columnIndex;
        private int selectedIndex;
        private DropDownItem selectedItem;

        public int RowIndex
        {
            get { return rowIndex; }
            internal set { rowIndex = value; }
        }

        public int ColumnIndex
        {
            get { return columnIndex; }
            internal set { columnIndex = value; }
        }

        public int SelectedIndex
        {
            get { return selectedIndex; }
            internal set { selectedIndex = value; }
        }

        public object DisplayText
        {
            get { return this.SelectedItem.DisplayMember; }

        }

        public object ValueText
        {
            get { return this.SelectedItem.ValueMember; }
        }

        public DropDownItem SelectedItem
        {
            get { return selectedItem; }
            internal set { selectedItem = value; }
        }
    }
    /// <summary>
    /// This class represents arguments passed when the RowSelectionEvent is raised. 
    /// </summary>
    public class GridRowSelectionModifiedEventArgs : EventArgs
    {
        private int newRowIndex;
        private string rowIdentifier;
        private int previousRowIndex;

        /// <summary>
        /// Represents the index of the row after the change in selection
        /// </summary>
        public int NewRowIndex
        {
            get { return newRowIndex; }
            internal set { newRowIndex = value; }
        }

        /// <summary>
        /// Represents the identifier of the row after the change in selection i.e. the row getting the focus
        /// </summary>
        public string RowIdentifier
        {
            get { return rowIdentifier; }
            internal set { rowIdentifier = value; }
        }

        public int PreviousRowIndex
        {
            get { return previousRowIndex; }
            set { previousRowIndex = value; }
        }
    }

    public class RowDeletingEventArgs : EventArgs
    {
        public RowDeletingEventArgs(int indexOfRowBeingDeleted)
        {
            this.RowIndex = indexOfRowBeingDeleted;
        }
        /// <summary>
        /// The index of the row getting deleted
        /// </summary>
        public int RowIndex { get; set; }

        private bool cancel = false;
        public bool Cancel
        {
            get { return cancel; }
            set { cancel = value; }
        }
    }
    public class RowDeletedEventArgs : EventArgs
    {
        public RowDeletedEventArgs(string identifierOfDeletedRow)
        {
            this.RowIdentifier = identifierOfDeletedRow;
        }
        /// <summary>
        /// The index of the row getting deleted
        /// </summary>
        public string RowIdentifier { get; set; }
    }

    public class DCCGridLink
    {
        public string Title { get; set; }
        public object LinkCommand { get; set; }
        public override string ToString()
        {
            return Title;
        }
        public DCCGridLink(string aTitle, object aCommand)
        {
            this.Title = aTitle;
            this.LinkCommand = aCommand;
        }
    }
    public enum UserModes
    {
        Auto = 1,
        Program
    }
}
