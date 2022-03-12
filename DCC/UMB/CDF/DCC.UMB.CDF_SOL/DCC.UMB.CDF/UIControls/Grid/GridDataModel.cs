using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Reflection;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.UIControls.Grid.Column;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.Configuration;

namespace DCC.UMB.CDF.UIControls.Grid
{
    internal class GridDataModel : DataTable
    {
        #region Local Variables

        private DCCGrid grid = null;

        ////[[This view is used to render the grid cells. 
        /// This view is consructed each time the RefreshGrid() method (in this class)
        /// is called. The view will take care of the the deleted rows from  the model.
        internal DataView gridRenderingView = null;
        ///]]

        private DCCDataColumn rowStateColumn = null;

        ////[[ This column is added in this model, so that each row has a unique id
        /// which is set at the time of NewRow() method. This guid will be used to
        /// identify the row in the actual table, as normally the grid will be rendered
        /// from a view, which might show different set of rows than the actual set
        /// This difference might come because some of the rows get deleted (marked deleted)
        /// or because of some special sorting or filtering mechanism.
        private DCCDataColumn rowGuidColumn = null;
        ///]]

        internal static readonly string ROW_STATE_COLUMN_NAME = "DCC.UMB.CDF.UIControls.Grid.GridDataModel.RowStateColumn";
        internal static readonly string ROW_GUID_COLUMN_NAME = "DCC.UMB.CDF.UIControls.Grid.GridDataModel.RowGUIDColumn";

        private EventHandler<EventArgs> lookupPropertyChangedEventHandler = null;
        #endregion

        #region Constructors
        internal GridDataModel(DCCGrid objGrid)
            : base(objGrid.Name + " Data Model")
        {
            this.grid = objGrid;
            ////[[add a column in this table for capturing row state
            this.rowStateColumn = new DCCDataColumn(null, typeof(RowStates));
            this.rowStateColumn.ColumnName = ROW_STATE_COLUMN_NAME;
            this.Columns.Add(this.rowStateColumn);
            ///]]

            ////[[add a column in this table for capturing row guid, see the notes on the 
            ///declaration of the rowGuidColumn variable in this class.
            this.rowGuidColumn = new DCCDataColumn(null, typeof(string));
            this.rowGuidColumn.ColumnName = ROW_GUID_COLUMN_NAME;
            this.Columns.Add(this.rowGuidColumn);
            ///]]

            if (this.grid != null)
            {
                this.grid.ColumnAdded += new DataGridViewColumnEventHandler(grid_ColumnAdded);
                this.grid.ColumnRemoved += new DataGridViewColumnEventHandler(grid_ColumnRemoved);
                this.grid.ColumnNameChanged += new DataGridViewColumnEventHandler(grid_ColumnNameChanged);
            }
            lookupPropertyChangedEventHandler = new EventHandler<EventArgs>(LookupPropertyChangedEventHandler);
        }

        #endregion

        #region Basic Cell Value Editing Methods
        internal object GetCellValue(string rowIdentifier, int columnIndex)
        {
            if (rowIdentifier == null) return null;
            DataRow targetRow = GetRowForRowIdentifier(rowIdentifier);
            return targetRow[columnIndex];
        }

        /// <summary>
        /// This method returns the row identifier(the guid of each row) from the
        /// row index passed. This row index is nothing but the place of row present
        /// in the gridRenderingView.
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <returns></returns>
        public string GetRowIdentifierForGridRowIndex(int rowIndex)
        {
            if (rowIndex == -1 || rowIndex > this.gridRenderingView.Count - 1)
            {
                return null;
            }
            return (string)this.gridRenderingView[rowIndex].Row[ROW_GUID_COLUMN_NAME];
        }

        public int GetGridRowIndexFromRowIdentifier(string rowIdentifier)
        {
            if (this.gridRenderingView == null) return -1;
            for (int i = this.gridRenderingView.Count - 1; i >= 0; i--)
            {
                if (this.gridRenderingView[i][ROW_GUID_COLUMN_NAME].ToString() == rowIdentifier)
                {
                    return i;
                }
            }
            throw new Exception("The row identifier is not found in current grid rendering view");
        }

        /// <summary>
        /// This method returns the position of the row in this data model while the 
        /// rows in the "Dleted"states are ignored. So net net, this returns the 
        /// position of the row in the grid as it is displayed to the user.
        /// </summary>
        /// <param name="rowIdentifier"></param>
        /// <returns></returns>
        internal int GetDisplayOrder(string rowIdentifier)
        {
            int absoluteRowIndex = 1;
            foreach (DataRow row in this.Rows)
            {
                if (GetRowState(row) == RowStates.Deleted || GetRowState(row) == RowStates.None)
                {
                    continue;
                }
                if (row[ROW_GUID_COLUMN_NAME].ToString() == rowIdentifier)
                {
                    return absoluteRowIndex;
                }
                absoluteRowIndex++;
            }
            throw new Exception("This RowIdentifier does not exist in this grid data model: " + rowIdentifier);
        }



        internal void SetCellValue(int columnIndex, string rowIdentifier, object cellValue)
        {
            try
            {
                if (cellValue != null &&
                    typeof(string) == cellValue.GetType() &&
                    string.IsNullOrEmpty(cellValue.ToString()))
                {
                    cellValue = null;
                }

                DataRow targetRow = GetRowForRowIdentifier(rowIdentifier);
                object oldCellValue = targetRow[columnIndex];
                ///[[Check the "type" of the cell value, allow only that value which has the same type as the type of the column
                if (cellValue != null)
                {
                    bool isLookupColumn = false;
                    if (this.Columns[columnIndex].GetType() == typeof(DCCDataColumn) &&
                        ((DCCDataColumn)this.Columns[columnIndex]).DccGridColumn != null &&
                        ((DCCDataColumn)this.Columns[columnIndex]).DccGridColumn.Lookup)
                    {
                        isLookupColumn = true;
                    }
                    if (!isLookupColumn)
                    {
                        bool result = IsCastable(cellValue, this.Columns[columnIndex].DataType);
                        //if(this.Columns[columnIndex].DataType!=cellValue.GetType())
                        if (!result)
                        {
                            UIManager.ShowMessage(MsgCodes.MisMatchInfo, "specified value|grid column type",MessageTypes.Error);
                            return;
                        }
                    }
                }
                //]]

                targetRow[columnIndex] = cellValue ?? DBNull.Value;
                //if (oldCellValue != targetRow[columnIndex])
                if (!AreObjectValuesEqual(oldCellValue, targetRow[columnIndex]))
                {
                    this.MarkRowAsModified(targetRow);//this method internally will take care of if the state is unchanged, only then it will be marked as modified.
                }
            }
            finally
            {
                this.RefreshGrid(); //force the grid to paint.
            }
        }
        private bool AreObjectValuesEqual(object oldCellValue, object newCellValue)
        {
            return oldCellValue.Equals(newCellValue);
        }
        internal void SwapRows(string firstRowIdentifier, string secondRowIdentifier)
        {
            try
            {
                //int firstRowIndex = this.Rows.IndexOf(this.GetRowForRowIdentifier(firstRowIdentifier));
                //int secondRowIndex = this.Rows.IndexOf(this.GetRowForRowIdentifier(secondRowIdentifier));
                DataRow[] firstRows = this.Select(string.Format("{0}='{1}'", ROW_GUID_COLUMN_NAME, firstRowIdentifier));
                DataRow firstRow = null;
                if (firstRows != null && firstRows.Length > 0)
                {
                    firstRow = firstRows[0];
                    
                }
                DataRow[] secondRows = this.Select(string.Format("{0}='{1}'", ROW_GUID_COLUMN_NAME, secondRowIdentifier));
                DataRow secondRow = null;
                if (secondRows != null && secondRows.Length > 0)
                {
                    secondRow = secondRows[0];
                }
                if (firstRow != null && secondRow != null)
                {
                    object[] itemsInSecondDataRow = secondRow.ItemArray;
                    object[] itemsInFirstDataRowDuplicate = firstRow.ItemArray;

                    firstRow.ItemArray = itemsInSecondDataRow;
                    secondRow.ItemArray = itemsInFirstDataRowDuplicate;
                    this.AcceptChanges();
                }
            }
            finally
            {
                this.RefreshGrid();
            }
        }
        
        

        private bool IsCastable(object obj, Type toType)
        {
            try
            {
                if (toType == typeof(System.Object)) return true;
                TypeCode code = Convert.GetTypeCode(obj);
                Convert.ChangeType(obj, toType);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        internal DataRow GetRowForRowIdentifier(string identifier)
        {
            DataRow[] matchingRows = this.Select(ROW_GUID_COLUMN_NAME + "='" + identifier + "'");
            if (matchingRows.Length > 1)
            {
                throw new Exception("Multiple matching rows found for a given row identifier");
            }
            if (matchingRows.Length == 0)
            {
                return null;
            }
            return matchingRows[0];
        }

        #endregion

        #region Row Insertion Deletion Methods

        internal string AddRowBelow(string rowIdentifier)
        {
            try
            {
                //NewRow() mehtod is overridden in this class, will take care of marking the rowState as "New"
                DataRow targetRow = GetRowForRowIdentifier(rowIdentifier);
                int rowIndex = this.Rows.IndexOf(targetRow);
                return AddRowBelow(rowIndex);
            }
            finally
            {
                this.RefreshGrid();
            }
        }
        private string AddRowBelow(int rowIndex)
        {
            return AddRowBelow(rowIndex, true);
        }

        private string AddRowBelow(int rowIndex, bool doRefresh)
        {
            try
            {
                DataRow newRow = this.NewRow();
                if (rowIndex == this.Rows.Count - 1) //meaning the focus is already on the last row
                {
                    Rows.Add(newRow);
                }
                else
                {
                    this.Rows.InsertAt(newRow, rowIndex + 1);
                }
                if (doRefresh) this.RefreshGrid();
                //[[Now as this is the only method which adds rows to the grid by user intervention, 
                //and the row is added in new mode. At this time raise the event for filling default values
                try
                {
                    int rowIndexInGrid = this.GetGridRowIndexFromRowIdentifier(newRow[ROW_GUID_COLUMN_NAME].ToString());
                    if (rowIndexInGrid >= 0)
                    {
                        this.grid.RaiseFillDefaltCellValues(rowIndexInGrid);
                    }
                }
                catch (Exception ex1)
                {
                    //dont throw
                }
                //]]
                return newRow[this.rowGuidColumn].ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }

        internal string AddRowAbove(string rowIdentifier)
        {
            DataRow targetRow = GetRowForRowIdentifier(rowIdentifier);
            int rowIndex = this.Rows.IndexOf(targetRow);
            return AddRowBelow(rowIndex - 1);
        }


        internal string AddRowBottom()
        {
            return AddRowBelow(this.Rows.Count - 1);
        }

        internal void DeleteRow(string rowIdentifier)
        {
            try
            {
                DataRow targetRow = GetRowForRowIdentifier(rowIdentifier);
                int rowIndex = this.Rows.IndexOf(targetRow);
                this.grid.CommitEdit(DataGridViewDataErrorContexts.LeaveControl);
                if (GetRowState(targetRow) == RowStates.New)
                {
                    this.Rows.Remove(targetRow);
                }
                else
                {
                    this.MarkRowAsDeleted(targetRow);
                }
            }
            finally
            {
                this.RefreshGrid();
            }
        }

        #endregion

        #region Row State Maintenance

        internal RowStates GetRowState(DataRow targetRow)
        {
            return (RowStates)targetRow[this.rowStateColumn];
        }
        /// <summary>
        /// Returns the row state for the given row index
        /// </summary>
        /// <param name="rowIndex"></param>
        /// <returns></returns>
        internal RowStates GetRowState(int rowIndex)
        {
            string rowGuid = this.GetRowIdentifierForGridRowIndex(rowIndex);
            return this.GetRowState(this.GetRowForRowIdentifier(rowGuid));
        }
        internal string GetRowStateSymbol(DataRow targetRow)
        {
            RowStates state = this.GetRowState(targetRow);
            switch (state)
            {
                case RowStates.New:
                    return "N";
                case RowStates.Old:
                    return "O";
                case RowStates.Updated:
                    return "U";
                case RowStates.Deleted:
                    return "D";
                case RowStates.None:
                    //return "";
                    //return "+";
                    //return "¤";
                    return "»";
                //return "X";
                default:
                    throw new Exception("Unknown row state, can't return row state symbol");
            }
            return null;
        }



        private void MarkRowAsDeleted(DataRow targetRow)
        {
            try
            {
                targetRow[this.rowStateColumn] = RowStates.Deleted;
            }
            finally
            {
                this.RefreshGrid();
            }
        }

        internal void MarkRowAsnew(DataRow targetRow)
        {
            ///[[If the existing state of the row is "None" then mark it new
            if (GetRowState(targetRow) == RowStates.None)
            {
                targetRow[this.rowStateColumn] = RowStates.New;
            }
            ///]]
        }
        private void MarkRowAsModified(DataRow targetRow)
        {
            try
            {
                ///[[if the existing state of the row is 
                //old, then mark it modified, else return
                if (GetRowState(targetRow) == RowStates.Old)
                {
                    targetRow[this.rowStateColumn] = RowStates.Updated;
                }
                //]]
                if (this.GetRowState(targetRow) == RowStates.None)// && this.grid.EditingControl != null)
                {
                    targetRow[this.rowStateColumn] = RowStates.New;
                    PrepareBlankRowForUser();
                }
            }
            finally
            {
                this.RefreshGrid();
            }
        }


        internal void UpdateSingleRow(string rowIdentifier, DataTable toBeImportedTable, RowStates rowStateAfterRetrival)
        {
            DataRow rowToBeUpdated = this.GetRowForRowIdentifier(rowIdentifier);
            //[[Pick up those columns of this datatable where the dccGridColumn is not null and bindingkey is not null(or empty)
            List<KeyValuePair<DCCDataColumn, string>> lstColumnVsBindingKey = GetLstColumnVsBindingKey();
            //]]
            try
            {
                ImportInRow(lstColumnVsBindingKey, rowToBeUpdated, toBeImportedTable.Rows[0], rowStateAfterRetrival);
            }
            catch (Exception e)
            {
                throw;
            }

        }
        private List<KeyValuePair<DCCDataColumn, string>> GetLstColumnVsBindingKey()
        {
            List<KeyValuePair<DCCDataColumn, string>> lstColumnVsBindingKey = new List<KeyValuePair<DCCDataColumn, string>>();
            foreach (DCCDataColumn column in this.Columns)
            {
                if (column.DccGridColumn != null && !string.IsNullOrEmpty(column.DccGridColumn.BindingKey))
                {
                    lstColumnVsBindingKey.Add(new KeyValuePair<DCCDataColumn, string>(column, column.DccGridColumn.BindingKey));
                }
            }
            return lstColumnVsBindingKey;
        }

        private void ImportInRow(List<KeyValuePair<DCCDataColumn, string>> lstColumnVsBindingKey, DataRow rowToBeUpdatedInGridModel, DataRow rowToBeImported, RowStates rowStateAfterRetrival)
        {
            rowToBeUpdatedInGridModel[this.rowStateColumn] = rowStateAfterRetrival;

            //Now fill the values in the newRow for those columns which have binding key is defined and caputred above
            foreach (KeyValuePair<DCCDataColumn, string> pair in lstColumnVsBindingKey)
            {
                //[[Now, if the DCCDataColumn has lookup enabled, then we have to form the lookup result object and keep in the cell
                //else just keep the key
                if (pair.Key.DccGridColumn.Lookup)
                {
                    rowToBeUpdatedInGridModel[pair.Key] = CreateLookupResultObject(pair, rowToBeImported);
                }
                else
                {
                    if (rowToBeImported.Table.Columns[pair.Value] == null)
                    {
                        UIManager.ShowMessage(MsgCodes.InvalidValue, string.Format("or missing column '{0}'|source table used to import data in grid {1}",pair.Value,this.grid.GetUserFriendlyNameOfGrid()), MessageTypes.Error);
                        //throw new Exception("The source table used to import data into grid does not have a column '"+pair.Value+"'");
                        continue;
                    }
                    object value = rowToBeImported[pair.Value];
                    value = MassageValueForFitness(pair.Key, value);
                    rowToBeUpdatedInGridModel[pair.Key] = value;
                }
                //]]
            }
        }

        /// <summary>
        /// This method massages the value based upon the passed in DCCDataColumn.
        /// The massaging is typically done to match conventions. e.g. from database,
        /// we might receive a "Yes" or "No" but we have to convert it to a bool to fit into cell.
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        private object MassageValueForFitness(DCCDataColumn key, object value)
        {
            object returnValue = value;
            if (key.DataType == typeof(bool))
            {
                if (value.ToString().ToUpper() == "YES")
                {
                    returnValue = true;
                }
                else if (value.ToString().ToUpper().Trim() == "NO")
                {
                    returnValue = false;
                }
            }
            return returnValue;
        }

        /// <summary>
        /// This method tries to create a lookup result from the columns of the DataRow passed. The Lookup Result essentially
        /// will have DisplayMember and ValueMember properties being set. Rest of the columns of the LookupResult (the selected records property)
        /// are ignored at this time, as we are interested in the core properties of the LookupResult.
        /// Step1: From within the columns defined in the lookupColumns property of DCCColumn, which one is marked as DisplayMember. 
        /// Step2: After figuring out the DisplayMember column, figure out its alias_name. 
        /// Step3: In the passed in DataRow, there must be a column with same name as alias_name evaluated above.
        /// Step4: If DataRow has that column, then get the value and treat that value as the DisplayMember value of the lookupresult.
        /// Step5: If DataRow does not have that column, then throw an exception.
        /// Step6: Repeat the above steps for ValueMember property.
        /// Step7: Return the created lookupResult object. This object needs to be set as the cell value of the specified column of the DataGrid.
        /// </summary>
        /// <param name="pair">The key of this pair the column itself and the vlaue is the binding key.</param>
        /// <param name="row"></param>
        /// <returns></returns>
        private LookupResult CreateLookupResultObject(KeyValuePair<DCCDataColumn, string> pair, DataRow row)
        {
            if (row[pair.Value] != DBNull.Value && row[pair.Value] != null)
            {
                LookupResult result = new LookupResult();
                DataTable selectedRecordsTable = new DataTable();
                string sqlString = string.Empty;
                List<LookupPropertyColumn> lstLookupColumns = LookupColumnsPropertyEditor.GetPreviousExistingColumns(
                    pair.Key.DccGridColumn.LookupColumns, ref sqlString);
                DataRow lookupResultSelectedRecordRow = selectedRecordsTable.NewRow();
                foreach (LookupPropertyColumn column in lstLookupColumns)
                {
                    //[[First set the DisplayMember proeprty of the lookup result
                    if (column.IsDisplayMemberColumn)
                    {
                        if (!selectedRecordsTable.Columns.Contains(column.AliasName))
                        {
                            selectedRecordsTable.Columns.Add(column.AliasName);
                        }
                        ///[[the DataRow passed must have the columns corresponding to DisplayMember defined for the lookup
                        if (row.Table.Columns[column.AliasName] == null)
                        {
                            throw new Exception(
                                string.Format(
                                    @"The column {0} of DCCGrid {1} has a lookup 
                                                                column for which Display Member column is {2}. 
                                                                However the Datatable from which results are 
                                                                being imported does not have any such column defined!",
                                    pair.Key.ColumnName, this.grid.Name, column.AliasName));
                        }
                        object lookupResultDisplayMember = row[column.AliasName];
                        //]]
                        lookupResultSelectedRecordRow[column.AliasName] = lookupResultDisplayMember.ToString();
                        result.DisplayMember = lookupResultDisplayMember;
                    }
                    //]]
                    //[[Now set the ValueMember property of the Looup result.
                    if (column.IsValueMemberColumn)
                    {
                        if (!selectedRecordsTable.Columns.Contains(column.AliasName))
                        {
                            selectedRecordsTable.Columns.Add(column.AliasName);
                        }
                        ///[[the DataRow passed must have the columns corresponding to ValueMember defined for the lookup
                        if (row.Table.Columns[column.AliasName] == null)
                        {
                            throw new Exception(
                                string.Format(
                                    @"The column {0} of DCCGrid {1} has a lookup 
                                                                column for which value Member column is {2}. 
                                                                However the Datatable from which results are 
                                                                being imported does not have any such column defined!",
                                    pair.Key.ColumnName, this.grid.Name, column.AliasName));
                        }
                        object lookupResultValueMember = row[column.AliasName];
                        //]]
                        lookupResultSelectedRecordRow[column.AliasName] = lookupResultValueMember.ToString();
                        result.ValueMember = lookupResultValueMember;
                    }
                    //]]                    
                }
                //[[Now see if the column corresponding to tooltipLookupField property value is imported as part of the DataRow (passed as parameter to this function)
                //then set the tooltipLookupField inside the lookupResultSelectedReocrdRow.
                string strToolTipLookupFieldName = pair.Key.DccGridColumn.ToolTipLookupField ;
                if(!string.IsNullOrEmpty(strToolTipLookupFieldName))
                {
                    if (!selectedRecordsTable.Columns.Contains(strToolTipLookupFieldName))
                    {
                        selectedRecordsTable.Columns.Add(strToolTipLookupFieldName);
                    }
                    if (row.Table.Columns.Contains(strToolTipLookupFieldName))
                    {
                        lookupResultSelectedRecordRow[strToolTipLookupFieldName] = row[strToolTipLookupFieldName];
                    }
                }
                //]]
                selectedRecordsTable.Rows.Add(lookupResultSelectedRecordRow);
                result.SelectedRecords = selectedRecordsTable.DefaultView;
                return result;
            }
            return null;
        }

        #endregion

        #region On Save Methods
        internal DataView GetRowsForState(RowStates rowState)
        {
            DataView view = new DataView(this);
            view.RowFilter = ROW_STATE_COLUMN_NAME + "='" + (int)rowState + "'";
            view.AllowEdit = false;
            view.AllowNew = false;
            return view;
        }
        internal DataView GetAllNonDeletedRows()
        {
            DataView view = new DataView(this);
            view.RowFilter = ROW_STATE_COLUMN_NAME + "<>'" + (int)RowStates.Deleted + "' AND " + ROW_STATE_COLUMN_NAME + "<>'" + (int)RowStates.None + "'";
            view.AllowEdit = false;
            view.AllowNew = false;
            return view;
        }
        #endregion

        #region Misc

        /// <summary>
        /// This method forces the grid to repaint. This method tells the grid
        /// about the number or rows it should render. And the number of rows are 
        /// nothing but the number of rows of the gridRenderingView, which gets 
        /// modified each time user addes/removes/updates a row in the model. Now when
        /// the grid tries to paint its cells, it will first get the row identifier from teh 
        /// method GetRowIdentifierForGridRow() method. This method returns the value of the guid
        /// column of the row present at the particular index of the gridRenderingView.
        /// Thus actual values are returned from the underlaying datamodel.
        /// </summary>
        internal void RefreshGrid(string rowIdentifierToMakeActivateRow)
        {
            try
            {
                this.RebuildGridRenderingView();
                if (this.gridRenderingView.Count == 0)
                {
                    this.grid.Rows.Clear();
                    this.grid.ClearSelection();
                }
                else
                {
                    this.grid.RowCount = this.gridRenderingView.Count;
                }
                this.grid.Invalidate();
                int matchingRowIndex = -1;
                if (!string.IsNullOrEmpty(rowIdentifierToMakeActivateRow))
                {
                    matchingRowIndex = this.GetRowIndexFromRowIdentifier(rowIdentifierToMakeActivateRow);
                }
                if (matchingRowIndex >= 0)
                {
                    int firstVisibleColumnIndex = GetFirstVisibleColumnIndex();
                    this.grid.CurrentCell = this.grid[firstVisibleColumnIndex, matchingRowIndex];
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.StartsWith("Operation did not succeed because the program cannot commit or quit a cell value change."))
                {
                    //do nothing.. supress this error.
                }
                else
                {
                    throw;
                }
            }
        }
        public int GetRowIndexFromRowIdentifier(string rowIdentifierToMakeActivateRow)
        {
            int matchingRowIndex = -1;
            ///[[search the row index of the row, within the gridRenderingView
            //where the row GUID is matchig with the row identifier
            //and make that row the current row, the current column can be kept 
            //as the first visible column(and whose width is more than 0%)
            for (int i = 0; i < this.gridRenderingView.Count; i++)
            {
                if (this.gridRenderingView[i][ROW_GUID_COLUMN_NAME].ToString() == rowIdentifierToMakeActivateRow)
                {
                    matchingRowIndex = i;
                    break;
                }
            }
            return matchingRowIndex;
        }


        private int GetFirstVisibleColumnIndex()
        {
            int firstVisibleColumnIndex = 0;
            foreach (DCCGridColumn column in this.grid.Columns)
            {
                if (column.Visible && column.PercentageWidth > 0)
                {
                    firstVisibleColumnIndex = column.Index;
                    break;
                }
            }
            return firstVisibleColumnIndex;
        }

        internal void RefreshGrid()
        {
            RefreshGrid(null);
        }

        private void RebuildGridRenderingView()
        {
            this.gridRenderingView = new DataView(this);
            this.gridRenderingView.RowFilter = ROW_STATE_COLUMN_NAME + "<>'" + (int)RowStates.Deleted + "'";
            this.gridRenderingView.AllowEdit = false;
            this.gridRenderingView.AllowNew = false;
            //[[Now sort this view based upon the sort order present in the columns of the grid.
            StringBuilder sb = new StringBuilder();
            foreach(DCCGridColumn col in  this.grid.GetSortByColumnList())
            {
                if(col.SortOrder!=SortOrder.None)
                {
                    sb.Append(col.Name);
                    if(col.SortOrder==SortOrder.Descending)
                    {
                        sb.Append(" desc");
                    }
                    sb.Append(",");
                }
            }
            string sortOrderString = sb.ToString();
            if(sortOrderString.EndsWith(","))
            {
                sortOrderString = sortOrderString.Substring(0, sortOrderString.Length - 1);
            }
            //]]
            this.gridRenderingView.Sort = sortOrderString;
        }
        #endregion

        #region Event Handlers       
        private void grid_ColumnRemoved(object sender, DataGridViewColumnEventArgs e)
        {
            if (this.Columns.Contains(((DCCGridColumn)(e.Column)).Name))
            {
                this.Columns.Remove(((DCCGridColumn)(e.Column)).Name);
            }
        }
        private void grid_ColumnAdded(object sender, DataGridViewColumnEventArgs e)
        {
            if (!this.Columns.Contains(((DCCGridColumn)(e.Column)).GuidName))
            {
                this.Columns.Remove(this.rowStateColumn);
                this.Columns.Remove(this.rowGuidColumn);
                Type dataType = GetDataTypeFromAddedColumn((DCCGridColumn)e.Column);

                this.Columns.Add(new DCCDataColumn((DCCGridColumn)e.Column, dataType));

                this.Columns.Add(this.rowStateColumn);
                this.Columns.Add(this.rowGuidColumn);
                ((DCCGridColumn)e.Column).LookupPropertyChanged += LookupPropertyChangedEventHandler;
            }

            this.grid.Refresh();
        }

        void LookupPropertyChangedEventHandler(object sender, EventArgs e)
        {
            DCCGridColumn col = (DCCGridColumn)sender;
            if (col.Lookup)
            {
                foreach (DCCDataColumn column in this.Columns)
                {
                    if (column.DccGridColumn.GuidName == col.GuidName)
                    {
                        column.DataType = typeof(LookupResult);
                        return;
                    }
                }
            }
        }

        private Type GetDataTypeFromAddedColumn(DCCGridColumn column)
        {
            switch (column.ColumnCellType)
            {
                case DCCGridCellTypes.TextField:
                    return typeof(string);
                case DCCGridCellTypes.Date:
                    return typeof(DateTime);
                case DCCGridCellTypes.DoubleFloat:
                    return typeof(double);
                case DCCGridCellTypes.LongInteger:
                    return typeof(long);
                case DCCGridCellTypes.Combobox:
                    return typeof(object);
                case DCCGridCellTypes.Label:
                    return typeof(string);
                case DCCGridCellTypes.CheckBox:
                    return typeof(bool);
                case DCCGridCellTypes.Object:
                    return typeof(object);
                default:
                    return typeof(object);
            }
        }

        void grid_ColumnNameChanged(object sender, DataGridViewColumnEventArgs e)
        {
            this.Columns[((DCCGridColumn)e.Column).GuidName].ColumnName = ((DCCGridColumn)e.Column).Name;
        }
        #endregion

        #region Overridden Methods from Base Class
        /// <summary>
        /// Overriding the base class NewRow() method to mark the row state as New.
        /// </summary>
        /// <returns></returns>
        protected new DataRow NewRow()
        {
            DataRow newRow = base.NewRow();
            newRow[this.rowStateColumn] = RowStates.New;
            newRow[this.rowGuidColumn] = Guid.NewGuid().ToString();
            return newRow;
        }
        #endregion

        internal void SetCurrentGridRow(string rowIdentifier)
        {
            this.RefreshGrid(rowIdentifier);
        }

        /// <summary>
        /// Removes all the records from this model and refreshes the grid.
        /// </summary>
        public void RemoveAllRecords()
        {
            try
            {
                this.Clear();
            }
            finally
            {
                RefreshGrid();
            }
        }


        internal void PrepareBlankRowForUser()
        {
            //[[If Insertion of new rows is blocked, then dont add a row for user
            if (!this.grid.InsertRowsMenuItemsEnabled)
            {
                return;
            }
            //]]
            ///[[Now check if the userMode is set to "Auto" then create a row in "None" mode
            /// so that user can start editing it
            if (this.grid.UserMode == UserModes.Auto)
            {
                //If this grid already has a prepared row for user (a none state row in the last, then exit)
                if (this.Rows.Count > 0 &&
                    (RowStates)this.Rows[this.Rows.Count - 1][this.rowStateColumn] == RowStates.None)
                {
                    return;
                }
                string rowIdentifier = AddRowBelow(this.Rows.Count - 1, false);
                this.GetRowForRowIdentifier(rowIdentifier)[this.rowStateColumn] = RowStates.None;
                this.RefreshGrid();
            }
            /// ]]
        }

        /// <summary>
        /// Clears the contents of a row.
        /// </summary>
        /// <param name="row">The reference to the DataRow object whose contents needs to be cleared.</param>
        public void ClearRowContents(DataRow row)
        {
            try
            {
                foreach (DataColumn col in row.Table.Columns)
                {
                    if (!IsReservedColumn(col))
                        row[col] = DBNull.Value;
                }
            }
            finally
            {
                this.RefreshGrid();
            }
        }

        /// <summary>
        /// if the toBeImportedTable is an instance of GridDataModel then simply
        ///import the datamodel including rowidentifiers and row states. In this case
        ///the parameters retainExistingRecords and rowStateAfterRetrival will be ignored
        /// </summary>
        /// <param name="toBeImportedTable"></param>
        /// <param name="retainExistingRecords"></param>
        /// <param name="rowStateAfterRetrival"></param>
        internal void ImportData(DataTable toBeImportedTable, bool retainExistingRecords, RowStates rowStateAfterRetrival)
        {
            try
            {
                if (!retainExistingRecords)
                {
                    this.Clear(); //To removed all the rows from the datatable
                }

                if (toBeImportedTable == null)
                {
                    return;
                }
                //[[Check if the toBeImportedTable is an instance of GridDataModel then simply
                //import the datamodel including rowidentifiers and row states. In this case
                //the parameters retainExistingRecords and rowStateAfterRetrival will be ignored
                if (toBeImportedTable.Columns[ROW_STATE_COLUMN_NAME] != null)
                {
                    this.ImportGridModelData(toBeImportedTable);
                    return;
                }
                //]]
                //[[In case the grid is still in edit mode cancel that as the editor continues to carry the value in it and there is a danger that this value will get saved into the model
                this.grid.CancelEdit();
                //]]

                //[[Remove the blank row (the hanging row in the end, with NONE mode)
                this.RemoveNoneModeRows();
                //]]

                //[[Pick up those columns of this datatable where the dccGridColumn is not null and bindingkey is not null(or empty)
                List<KeyValuePair<DCCDataColumn, string>> lstColumnVsBindingKey = GetLstColumnVsBindingKey();
                //]]

                foreach (DataRow row in toBeImportedTable.Rows)
                {
                    try
                    {
                        DataRow newRowInGridModel = this.NewRow();
                        this.Rows.Add(newRowInGridModel);
                        ImportInRow(lstColumnVsBindingKey, newRowInGridModel, row, rowStateAfterRetrival);
                    }
                    catch (Exception e)
                    {
                        throw;
                    }
                }
            }
            catch (Exception ex)
            {
                //throw;
            }
            finally
            {
                PrepareBlankRowForUser();
                this.RefreshGrid(); //force the grid to paint.
            }
        }
        internal void RemoveNoneModeRows()
        {
            try
            {
                DataView view = this.GetRowsForState(RowStates.None);
                List<DataRow> lstRowsToBeRemoved = new List<DataRow>();
                foreach (DataRowView rowView in view)
                {
                    lstRowsToBeRemoved.Add(rowView.Row);
                }
                foreach (DataRow row in lstRowsToBeRemoved)
                {
                    this.Rows.Remove(row);
                }
            }
            finally
            {
                this.RefreshGrid();
            }
        }
        internal void ImportData(IList lstObject, bool retainExistingRecords, RowStates rowStateAfterRetrival)
        {
            try
            {
                //[[In case the grid is still in edit mode cancel that as the editor continues to carry the value in it and there is a danger that this value will get saved into the model
                this.grid.CancelEdit();
                //]]
                if (!retainExistingRecords)
                {
                    this.Clear(); //To removed all the rows from the datatable
                }

                //[[Remove the blank row (the hanging row in the end, with NONE mode)
                this.RemoveNoneModeRows();
                //]]

                foreach (object obj in lstObject)
                {
                    DataRow newRow = this.NewRow();
                    this.Rows.Add(newRow);
                    newRow[this.rowStateColumn] = rowStateAfterRetrival;

                    foreach (DCCDataColumn column in this.Columns)
                    {
                        if (column.DccGridColumn != null && !string.IsNullOrEmpty(column.DccGridColumn.BindingKey))
                        {
                            newRow[column] = UtilityManager.GetPropertyValue(obj, column.DccGridColumn.BindingKey);
                        }
                    }
                }
            }
            finally
            {
                PrepareBlankRowForUser();
                this.RefreshGrid(); //force the grid to paint.
            }
        }
        internal DataTable ExportGridModelData(bool exportDeletedRows)
        {
            DataTable tableToBeExported = new DataTable();
            UtilityManager.CopyDataTable(this, tableToBeExported);
            List<DataRow> rowsToBeRemoved = new List<DataRow>();
            ///If exportDeletedRows is set to false then remove the deleted rows
            if (!exportDeletedRows)
            {
                foreach (DataRow row in tableToBeExported.Rows)
                {
                    if ((RowStates)row[ROW_STATE_COLUMN_NAME] == RowStates.Deleted)
                    {
                        rowsToBeRemoved.Add(row);
                    }
                }
                foreach (DataRow row in rowsToBeRemoved)
                {
                    tableToBeExported.Rows.Remove(row);
                }
            }
            ///]]
            /// [[Remove all those rows in tableToBeExported which are in NONE mode
            rowsToBeRemoved.Clear();
            foreach (DataRow row in tableToBeExported.Rows)
            {
                if ((RowStates)row[ROW_STATE_COLUMN_NAME] == RowStates.None)
                {
                    rowsToBeRemoved.Add(row);
                }
            }
            foreach (DataRow row in rowsToBeRemoved)
            {
                tableToBeExported.Rows.Remove(row);
            }
            ///]]
            tableToBeExported.AcceptChanges();
            return tableToBeExported;
        }
        private void ImportGridModelData(DataTable gridModelData)
        {
            //[[In case the grid is still in edit mode cancel that as the editor continues to carry the value in it and there is a danger that this value will get saved into the model
            this.grid.CancelEdit();
            //]]
            this.Clear();
            if (gridModelData != null)//If grid model data is null, then dont copy data model
            {
                UtilityManager.CopyDataTable(gridModelData, this);
            }
            this.RefreshGrid();
        }

        private bool IsReservedColumn(DataColumn col)
        {
            if (col == this.rowStateColumn || col == this.rowGuidColumn)
            {
                return true;
            }
            else return false;
        }
    }


    #region DCCDataColumn:DataColumn Class
    internal class DCCDataColumn : DataColumn
    {
        private DCCGridColumn dccGridColumn;

        internal DCCDataColumn(DCCGridColumn dccGridColumn, Type columnType)
            : base(dccGridColumn == null ? null : dccGridColumn.GuidName, columnType)
        {
            this.dccGridColumn = dccGridColumn;
        }

        internal DCCGridColumn DccGridColumn
        {
            get { return dccGridColumn; }
            set { dccGridColumn = value; }
        }
    }
    #endregion

    /// <summary>
    /// Defines the states a row can have in this data model
    /// </summary>
    public enum RowStates
    {
        New = 1,
        Old,
        Updated,
        Deleted,
        None
    }
}