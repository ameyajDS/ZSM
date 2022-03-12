using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.Lookup.Controller;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.DB;
using System.Text.RegularExpressions;

namespace DCC.UMB.CDF.Lookup.Modal
{
    internal class LookupDataProvider
    {
        int BUFFER_COUNT_CONSTANT = 20; //This variable defines as to how many records will be read from teh underlaying datareader and stored into the availableRecordsDataTable
        const string GUID_COL_NAME = "GUID_COL_NAME";
        string sqlTemplateString = null;
        string searchString = null;
        List<LookupColumn> lstLookupColumns = new List<LookupColumn>();
        private DataTable availableRecordsTable = null;
        private DataTable selectedRecordsTable = null;
        private DataView availableRecordsView = null;
        private DataView selectedRecordsView = null;
        private DCCSqlDataReader dataReader = null;
        
        ///[[These two variables are used to hold the values as to on which
        //searchstring and on which column, the search was made
        private string previousSearchString = null;
        private LookupColumn previousSearchOnColumn = null;
        //]]

        
       
        private IDbManager objDbManager = null;

        internal LookupDataProvider(IDbManager objDbManager,
                                            string sqlTemplateString,
                                            string searchString,
                                            List<LookupColumn> columns)
        {
            this.objDbManager = objDbManager;
            this.sqlTemplateString = sqlTemplateString;
            this.searchString = searchString;
            this.lstLookupColumns = columns;
            if (this.dataReader != null)
            {
                this.dataReader.CloseReaderAndConnection();
            }
        }

      
        public string SearchString
        {
            get { return searchString; }
            set { searchString = value; }
        }
        internal List<LookupColumn> LookupColumns
        {
            get { return lstLookupColumns; }
        }


        /// <summary>
        /// Returns the number of records available in the AbailabeRecordsTable. Note 
        /// that this datatable fills in the records as the user scrolls down. The number
        /// of records read each time are defined by variable BUFFER_COUNT_CONST
        /// </summary>
        internal int RowCountForAvailableRecordsTable
        {
            get { if (this.availableRecordsTable == null)return 0; return this.availableRecordsTable.Rows.Count; }
        }

        /// <summary>
        /// Returns the number of records available in the selected record table. Normally
        /// if the Multiselect is set to false, then this will have 0 or 1 value. Else it will
        /// represent the number of records selected by user from left to right grid in a multiselect
        /// lookup scheme.
        /// </summary>
        internal int RowCountForSelectedRecordsTable
        {
            get { if (this.selectedRecordsTable == null)return 0; return this.selectedRecordsTable.Rows.Count; }
        }

        internal string GetSQLStatementForLogicalSearchOnTargetColumn(string searchString, LookupColumn searchOnColumn, LookupSearchOperators searchOperator)
        {
            if (searchOnColumn == null) return string.Empty;
            string filterExpression = GetFilterExpression(searchString, searchOnColumn, searchOperator);
            string sqlString = sqlTemplateString.Replace("?", filterExpression);
            return sqlString;                
        }

        internal int MinimumCharactersForQuery { get; set; }
        internal void CloseDataReaderForLookup()
        {
            if (dataReader != null)
            {
                dataReader.CloseReaderAndConnection();
            }
        }
        /// <summary>
        /// This method clears the AvailableRecordsTable and SelectedRecordsTable and fills them
        /// afresh by opening a new datareader. Previous records are scraped.
        /// This event is called when the user types in different search string or when 
        /// the dialog is loading for the first time.
        /// </summary>
        /// <param name="searchString"></param>
        /// <param name="searchOnColumn"></param>
        /// <param name="searchOperator"></param>
        internal void ReloadResults(string searchString, LookupColumn searchOnColumn, LookupSearchOperators searchOperator)
        {
            try
            {
                ///[[check if the searchstring and the searchoncolumn combination is same
                //as of the current datareader, if yes, then simply return
                if (searchString == previousSearchString && searchOnColumn == previousSearchOnColumn)
                {
                    return;
                }
                //]]
                string filterExpression = GetFilterExpression(searchString, searchOnColumn, searchOperator);
                string sqlString = sqlTemplateString.Replace("?", filterExpression);
                //[[if the length of the searchString is less than the minimum number of required characters to fetch records, then append a false returning expression
                if (searchString.Length < this.MinimumCharactersForQuery)
                {
                    //sqlString += System.Environment.NewLine + " AND (1=2) --appended since the minimum number of characters for query to be valid are not passed in.";
                    Regex regx = new Regex("WHERE", RegexOptions.IgnoreCase);
                    Match match = regx.Match(sqlString);
                    if (match != null)
                    {
                        sqlString = sqlString.Replace(match.ToString(), match.ToString() + " (10=20) AND ");
                    }
                }
                //]]

                if (dataReader != null)
                {
                    dataReader.CloseReaderAndConnection();
                }
                Logger.Debug("Lookup Qry: " + sqlString);
                DataTable firstBucketTable = null;
                this.dataReader = objDbManager.ExecuteReaderSQL(sqlString, BUFFER_COUNT_CONSTANT, ref firstBucketTable);

                ReinitializeBufferTable(new DataTableReader(firstBucketTable).GetSchemaTable());
                LoadFetchedDataBucketIntoBufferTable(firstBucketTable);
                previousSearchOnColumn = searchOnColumn;
                previousSearchString = searchString;
            }
            catch (Exception ex)
            {                
                throw;
            }
        }
        internal void RelaodResultsForLogicalSearch(string sqlOnCode,string sqlOnId, string sqlOnDisplay, string sqlOnDisplayWithStartsWith)
        {
            string consolidatedSqlForLogicalSearch = "SET ROWCOUNT 2;" +
                                                          sqlOnCode + "; " + sqlOnId + "; " + sqlOnDisplay + "; " + sqlOnDisplayWithStartsWith + "; " +
                                                            "SET ROWCOUNT 0;";
            consolidatedSqlForLogicalSearch = consolidatedSqlForLogicalSearch.Replace(";;;;", ";");
            consolidatedSqlForLogicalSearch=consolidatedSqlForLogicalSearch.Replace(";;;", ";");
            consolidatedSqlForLogicalSearch=consolidatedSqlForLogicalSearch.Replace(";;", ";");
            
            DataSet dset = objDbManager.ExecuteSQL(consolidatedSqlForLogicalSearch); 
            int consumedDataTableIndex = -1;
            if (!string.IsNullOrEmpty(sqlOnCode))
            {
                consumedDataTableIndex++;
                if (dset.Tables[consumedDataTableIndex].Rows.Count > 0)//fill data equal to code member
                {
                    ReinitializeBufferTable(new DataTableReader(dset.Tables[consumedDataTableIndex]).GetSchemaTable());
                    LoadFetchedDataBucketIntoBufferTable(dset.Tables[consumedDataTableIndex]);
                    return;
                }
            }
            if (!string.IsNullOrEmpty(sqlOnId))
            {
                consumedDataTableIndex++;
                if (dset.Tables[consumedDataTableIndex].Rows.Count > 0)//fill data equal to id member
                {
                    ReinitializeBufferTable(new DataTableReader(dset.Tables[consumedDataTableIndex]).GetSchemaTable());
                    LoadFetchedDataBucketIntoBufferTable(dset.Tables[consumedDataTableIndex]);
                    return;
                }
            }
            if (!string.IsNullOrEmpty(sqlOnDisplay))
            {
                consumedDataTableIndex++;
                if (dset.Tables[consumedDataTableIndex].Rows.Count > 0)////fill data equal to display member
                {
                    ReinitializeBufferTable(new DataTableReader(dset.Tables[consumedDataTableIndex]).GetSchemaTable());
                    LoadFetchedDataBucketIntoBufferTable(dset.Tables[consumedDataTableIndex]);
                    return;
                }
            }
            if (!string.IsNullOrEmpty(sqlOnDisplayWithStartsWith))
            {
                consumedDataTableIndex++;
                if (dset.Tables[consumedDataTableIndex].Rows.Count > 0)//fill data starting with display member
                {
                    ReinitializeBufferTable(new DataTableReader(dset.Tables[consumedDataTableIndex]).GetSchemaTable());
                    LoadFetchedDataBucketIntoBufferTable(dset.Tables[consumedDataTableIndex]);
                    return;
                }
            }
        }

        /// <summary>
        /// This method loads one set of records (called bucket) into the availableRecordsDataTable.
        /// </summary>
        private void LoadDataBucketIntoBufferTable()
        {
            try
            {
                int bufferCount = 0;
                DataTable table = dataReader.ReadNextBucketFromBrowseModeDataReader(BUFFER_COUNT_CONSTANT);
                LoadFetchedDataBucketIntoBufferTable(table);               
            }
            catch (Exception ex)
            {
                throw;
            }            
        }

        private bool LoadFetchedDataBucketIntoBufferTable(DataTable table)
        {
            bool recordFound = false;
            try
            {
                int bufferCount = 0;
                foreach (DataRow dataRow in table.Rows)
                {
                    DataRow row = availableRecordsTable.NewRow();
                    recordFound = true;
                    for (int i = 0; i < availableRecordsTable.Columns.Count; i++)
                    {
                        if (availableRecordsTable.Columns[i].ColumnName == GUID_COL_NAME) continue;
                        row[availableRecordsTable.Columns[i].ColumnName] = dataRow[availableRecordsTable.Columns[i].ColumnName];
                    }
                    availableRecordsTable.Rows.Add(row);
                    row[GUID_COL_NAME] = System.Guid.NewGuid().ToString();
                    bufferCount++;
                    if (bufferCount >= BUFFER_COUNT_CONSTANT) break;
                }
                return recordFound;
            }
            catch
            {
                throw;
            }
            finally
            {
                if (recordFound) ResetSortOrderOfAllColumns();
            }
        }
        
        //Resets the sort order of all the columns in the grid.
        private void ResetSortOrderOfAllColumns()
        {
            foreach (LookupColumn col in lstLookupColumns)
            {
                if (col.SortOrder != System.Windows.Forms.SortOrder.None)
                {
                    col.SortOrder = System.Windows.Forms.SortOrder.None;
                }
            }
        }

        /// <summary>
        /// The availableRecordsTable is reinitialized. All the columns are recreated
        /// </summary>
        /// <param name="dataReader"></param>
        private void ReinitializeBufferTable(DataTable schemaTable)
        {
            if (availableRecordsTable==null)
            {
                availableRecordsTable = new DataTable();                
                //This is for generating a unique identity for each row
                //This id can also be used to check if a record has been added 
                //to the right hand side table (the selected records table)
                availableRecordsTable.Columns.Add(GUID_COL_NAME, typeof(string));
                selectedRecordsTable = new DataTable();
                selectedRecordsTable.Columns.Add(GUID_COL_NAME, typeof(string));
                foreach (DataRow row in schemaTable.Rows)
                {
                    DataColumn dataColumnForBufferTable = new DataColumn(row["ColumnName"].ToString(), (Type)row["DataType"]);
                    availableRecordsTable.Columns.Add(dataColumnForBufferTable);
                    DataColumn dataColumnForSelectedRecordsTable = new DataColumn(row["ColumnName"].ToString(), (Type)row["DataType"]);
                    selectedRecordsTable.Columns.Add(dataColumnForSelectedRecordsTable);                    
                }
                foreach (LookupColumn col in lstLookupColumns)
                {
                    DataRow[] rows = schemaTable.Select("ColumnName='" + col.AliasName + "'");
                    ///[[meaning there are more than 1 column having the same alias name, then throw an error
                    if (rows.Length > 1)
                    {
                        throw new Exception("The column alias is repeated: " + col.AliasName);
                    }
                    //]]
                    ///[[if no row is found with the matching alias then throw an error
                    if (rows.Length == 0)
                    {
                        throw new Exception("The result set does not have a column with alias : " + col.AliasName);
                    }
                    //]]
                    col.DataType = (Type)rows[0]["DataType"];
                }                
            }
            this.availableRecordsTable.Clear();
        }

        internal string GetFilterExpression(string searchString, LookupColumn searchOnColumn, LookupSearchOperators searchOperator)
        {
            searchString = searchString.Replace("'", "''");
            //@todo form a cool sql string based upon the data type of the searchOnColumn.
            //@todo should it be alias name instead of SQL Name in the below mentioned statements.
            string strOperator = null;
            if (searchOnColumn.DataType == typeof(string))
            {
                if (searchOperator == LookupSearchOperators.StartsWith)
                {
                    return " " + searchOnColumn.TablePrefixedSqlName + " LIKE '" + searchString + "%' ";
                }
                else if (searchOperator == LookupSearchOperators.Contains)
                {
                    return " " + searchOnColumn.TablePrefixedSqlName + " LIKE '%" + searchString + "%' ";
                }
                else if (searchOperator == LookupSearchOperators.EndsWith)
                {
                    return " " + searchOnColumn.TablePrefixedSqlName + " LIKE '%" + searchString + "' ";
                }
                else if (searchOperator == LookupSearchOperators.Equals)
                {
                    return " " + searchOnColumn.TablePrefixedSqlName + " LIKE '" + searchString + "' ";
                }
                return null;
            }
            else
            {
                if (searchOperator == LookupSearchOperators.StartsWith)
                {
                    return " CONVERT(Varchar(8000)," + searchOnColumn.TablePrefixedSqlName + ") LIKE '" + searchString + "%' ";
                }
                else if (searchOperator == LookupSearchOperators.Contains)
                {
                    return " CONVERT(Varchar(8000)," + searchOnColumn.TablePrefixedSqlName + ") LIKE '%" + searchString + "%' ";
                }
                else if (searchOperator == LookupSearchOperators.EndsWith)
                {
                    return " CONVERT(Varchar(8000)," + searchOnColumn.TablePrefixedSqlName + ") LIKE '%" + searchString + "' ";
                }
                else if (searchOperator == LookupSearchOperators.Equals)
                {
                    return " CONVERT(Varchar(8000)," + searchOnColumn.TablePrefixedSqlName + ") LIKE '" + searchString + "' ";
                }
                return null;
            }
        }

        internal DataView AvailableRecordsView
        {
            get
            {
                return availableRecordsTable.DefaultView;
            }
        }

        internal object GetCellValueForAvailableRecordsGrid(int rowIndex, string columnAliasName)
        {
            try
            {
                if (availableRecordsTable == null || availableRecordsTable.Rows.Count == 0)
                {
                    return null;
                }
                if (this.availableRecordsView == null) this.availableRecordsView = this.availableRecordsTable.DefaultView;
                
                ////[[before returning the cell value, check if the row index is nearing the available rows in the 
                ///buffer table, if yes, then load one more bucket from database
                if ((rowIndex >= availableRecordsTable.Rows.Count - 5) && (availableRecordsTable.Rows.Count >= BUFFER_COUNT_CONSTANT))
                {
                    LoadDataBucketIntoBufferTable();
                }
                ////]]
                //return this.availableRecordsTable.Rows[rowIndex][columnAliasName].ToString();
                return this.availableRecordsView[rowIndex][columnAliasName].ToString();
            }
            catch (Exception ex)
            {                
                throw;
            }
        }
        

        #region Methods for Selection/Rejection
        internal object GetCellValueForSelectedRecordsGrid(int rowIndex, string columnAliasName)
        {
            try
            {
                if (selectedRecordsTable==null || selectedRecordsTable.Rows.Count == 0)
                {
                    return null;
                }
                if (this.selectedRecordsView == null) this.selectedRecordsView = this.selectedRecordsTable.DefaultView;
                return this.selectedRecordsView[rowIndex][columnAliasName].ToString();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        internal void TransferSelectedRecords(int[] selectedRowIndices)
        {
            TransferRecordsToSelectedRecordsDataTable(selectedRowIndices);
        }

        internal void TransferAllRecords()
        {
            int[] selectedRowIndices = new int[availableRecordsTable.Rows.Count];
            for (int i = 0; i < selectedRowIndices.Length; i++)
            {
                selectedRowIndices[i] = i;
            }
            TransferRecordsToSelectedRecordsDataTable(selectedRowIndices);
        }

        internal void RejectAllRecords()
        {
            this.selectedRecordsTable.Clear();
        }

        internal void RejectSelectedRecords(int[] selectedRowIndces)
        {
            //run a reverse loop
            try
            {
                //for (int i = selectedRowIndces.Length - 1; i >= 0; i--)
                for(int i=0; i<selectedRowIndces.Length; i++)
                {
                    this.selectedRecordsTable.Rows.RemoveAt(selectedRowIndces[i]);
                }
            }
            catch (Exception ex)
            {                
                throw;
            }
        }

        private void TransferRecordsToSelectedRecordsDataTable(int[] rowIndices)
        {
            for (int i = 0; i < rowIndices.Length; i++)
            {
                if (this.availableRecordsView == null)
                {
                    this.availableRecordsView = this.availableRecordsTable.DefaultView;
                }
                DataRowView row = availableRecordsView[rowIndices[i]];
                string soruceGuid = (string)row[GUID_COL_NAME];
                DataRow[] repeatedRows = selectedRecordsTable.Select(GUID_COL_NAME + "='" + soruceGuid + "'");
                if (repeatedRows.Length != 0) continue;
                DataRow newSelectedRow = selectedRecordsTable.NewRow();
                foreach (DataColumn col in selectedRecordsTable.Columns)
                {
                    newSelectedRow[col.ColumnName] = row[col.ColumnName];
                }
                selectedRecordsTable.Rows.Add(newSelectedRow);
            }
        }
        #endregion // Methods for Selection/Rejection


        internal void SortAvailableRecordsTable(LookupColumn lookupColumn, string sortPrefix)
        {
            //set the sort of all other columns to none
            //string sortPrefix = ResetSortOrderOfAllColumns(lookupColumn);       
            this.availableRecordsView = new DataView(this.availableRecordsTable, "", lookupColumn.AliasName+sortPrefix, DataViewRowState.CurrentRows);            
        }
        internal void SortSelectedRecordsTable(LookupColumn lookupColumn, string sortPrefix)
        {
            //set the sort of all other columns to none
            //string sortPrefix = ResetSortOrderOfAllColumns(lookupColumn);
            this.selectedRecordsView = new DataView(this.selectedRecordsTable, "", lookupColumn.AliasName + sortPrefix, DataViewRowState.CurrentRows);
        }
        
        
        /// <summary>
        /// This method creates the result of the lookup dialog.
        /// </summary>
        /// <param name="returnMode"></param>
        /// <returns></returns>
        internal LookupResult CreateResult(LookupReturnModes returnMode, bool appendRecordsToCallingControl)
        {
            try
            {
                LookupResult result = new LookupResult();
                result.ReturnMode = returnMode;
                if (this.selectedRecordsView == null)
                {
                    DataTable replicatedDataTable = new DataTable();
                    UtilityManager.CopyDataTable(this.selectedRecordsTable, replicatedDataTable);
                    this.selectedRecordsView = replicatedDataTable.DefaultView;

                }
                if (returnMode == LookupReturnModes.None || returnMode == LookupReturnModes.New)
                {
                    result.SelectedRecords = null;
                }
                else
                {
                    result.SelectedRecords = this.selectedRecordsView;
                }
                if (returnMode == LookupReturnModes.Select ||
                    returnMode == LookupReturnModes.Update ||
                    returnMode == LookupReturnModes.Reference)
                {
                    LookupColumnPredicate predicate = new LookupColumnPredicate();
                    predicate.IsDisplayMemberColumn = true;
                    LookupColumn displayMemberColumn = lstLookupColumns.Find(predicate.Compare);
                    predicate = new LookupColumnPredicate();
                    predicate.IsValueMemberColumn = true;
                    LookupColumn valueMemberColumn = lstLookupColumns.Find(predicate.Compare);

                    result.DisplayMember = result.SelectedRecords[0][displayMemberColumn.AliasName];
                    result.ValueMember = result.SelectedRecords[0][valueMemberColumn.AliasName];
                    result.AppendResults = appendRecordsToCallingControl;
                }
                return result;
            }
            finally
            {
                this.selectedRecordsView = null;
            }
        }

        public bool IsAnyRecordSelected()
        {
            return !(this.selectedRecordsTable.Rows.Count == 0);
        }
    }
}
