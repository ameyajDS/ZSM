using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.Lookup.Controller;
using DCC.UMB.CDF.Lookup.View;
using DCC.UMB.CDF.Lookup.Modal;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;
namespace DCC.UMB.CDF.Lookup
{
    public enum LookupDialogSizes
    {
        Normal = 530,
        Large = 600,
        Larger = 700,
        Largest = 785
    }
    public class LookupManager
    {
        private static List<LookupColumn> lstLookupColumns = new List<LookupColumn>();
        //private static string connectionString;
        private static IDbManager objDBManager = null;


        public static List<LookupResult> GetLookupSuggestions(string sqlString,
                                            string searchString)
        {


            List<LookupResult> lstSuggestedResults = new List<LookupResult>();

            LookupResult logicalLookupResult = GetLookupSuggestion(sqlString, searchString, true, false, false);
            AddLookupResultInListIfDoesNotExists(logicalLookupResult, lstSuggestedResults);

            logicalLookupResult = GetLookupSuggestion(sqlString, searchString, false, true, false);
            AddLookupResultInListIfDoesNotExists(logicalLookupResult, lstSuggestedResults);
            LookupDataProvider dataProvider = null;
            try
            {
                //con = new SqlConnection(connectionString);
                //con.Open();
                dataProvider = new LookupDataProvider(objDBManager, sqlString, searchString, lstLookupColumns);
                LookupColumnPredicate predicate = new LookupColumnPredicate();
                predicate.IsDisplayMemberColumn = true;
                LookupColumn targetMberColumn = lstLookupColumns.Find(predicate.Compare);
                if (targetMberColumn == null)
                {
                    return lstSuggestedResults;
                }
                dataProvider.ReloadResults(searchString, targetMberColumn, LookupSearchOperators.StartsWith);
                CreateAndLookupResultsForEachMatchingRecord(lstSuggestedResults, dataProvider);

                //[[Now if all the characters typed in by the user in search string are in upper case,
                //this means that user wants to perform linguistic search, which will be performed by
                // a regular expression in our query.
                //These linguistic results should be part of the already build list of lookup results.
                if (searchString.Length > 1 && AreAllCharactersInUpperCase(searchString))//if more than one character is specified
                {
                    string linguisticSearchString = CreateLinguisticSearchString(searchString);
                    dataProvider.ReloadResults(linguisticSearchString, targetMberColumn, LookupSearchOperators.StartsWith);
                    CreateAndLookupResultsForEachMatchingRecord(lstSuggestedResults, dataProvider);
                }
                //]]

            }
            finally
            {
                if (dataProvider != null) dataProvider.CloseDataReaderForLookup();
            }
            return lstSuggestedResults;
        }

        private static void CreateAndLookupResultsForEachMatchingRecord(List<LookupResult> lstSuggestedResults, LookupDataProvider dataProvider)
        {
            for (int i = 0; i < dataProvider.AvailableRecordsView.Count; i++)
            {
                dataProvider.TransferSelectedRecords(new int[] { i });
                LookupResult currentResult = dataProvider.CreateResult(LookupReturnModes.Select, false);
                AddLookupResultInListIfDoesNotExists(currentResult, lstSuggestedResults);

                dataProvider.RejectAllRecords();
            }
        }

        private static void AddLookupResultInListIfDoesNotExists(LookupResult currentResult, List<LookupResult> lstSuggestedResults)
        {
            if (currentResult == null)
            {
                return;
            }
            bool alreadyExists = false;
            foreach (LookupResult result in lstSuggestedResults)
            {
                if (result.ValueMember.ToString() == currentResult.ValueMember.ToString())
                {
                    alreadyExists = true;
                    break;
                }
            }
            if (!alreadyExists)
            {
                lstSuggestedResults.Add(currentResult);
            }
        }
        private static string CreateLinguisticSearchString(string str)
        {
            StringBuilder sb = new StringBuilder();
            char[] chars = str.ToCharArray();

            foreach (char c in chars)
            {
                sb.Append(c);
                sb.Append("% ");
            }
            return sb.ToString().TrimEnd(new char[] { '%', ' ' });
        }

        private static bool AreAllCharactersInUpperCase(string str)
        {
            char[] chars = str.ToCharArray();
            foreach (char c in chars)
            {
                if (!((((int)c) <= 90) &&
                    (((int)c) >= 65)))
                {
                    return false;
                }
            }
            return true;

        }

        private static LookupResult GetLookupSuggestion(string sqlString,
                                            string searchString, bool searchOnCodeMember, bool searchOnValueMember, bool searchOnDisplayMember)
        {
            LookupDataProvider dataProvider = null;
            try
            {
                LookupColumnPredicate predicate = new LookupColumnPredicate();
                predicate.IsCodeMemberColumn = searchOnCodeMember;
                predicate.IsValueMemberColumn = searchOnValueMember;
                predicate.IsDisplayMemberColumn = searchOnDisplayMember;

                LookupColumn targetMberColumn = lstLookupColumns.Find(predicate.Compare);
                if (targetMberColumn == null)
                {
                    return null;
                }
                //con = new SqlConnection(connectionString);
                //con.Open();
                dataProvider = new LookupDataProvider(objDBManager, sqlString, searchString, lstLookupColumns);


                LookupResult logicalLookupResult = GetLookupResultForTargetColumn(searchString, targetMberColumn, dataProvider);
                return logicalLookupResult;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (dataProvider != null) dataProvider.CloseDataReaderForLookup();
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sqlString">A sqlstring template, e.g. "select * from items where item_sub_head_cd = 'IA' AND ? Order by item_nm" The question mark
        /// will be replaced by a filter expression by the lookup dialog automatically at run time.
        /// Please note that the "?" markup symbol will be replaced by a where condition at run time. e.g. in above example
        /// the "?" symbol can be replaced by " item_nm like 'Air Condition%' ". There are three parts of the expression
        /// First is the left hand side sql object name ("item_nm" in this case), Second is the operator. And third is the the search string.
        /// The first part is derived from the "sqlName" property of one of the registered columns to this lookup dialog.
        /// The choice of the specific column by the lookup dialog depends upon the search mode. If the search mode is Absolute, then that 
        /// column will be chosen whose "isDisplayMemberColumn" property is set to true. If search mode is logical then different columns are 
        /// chosen in sequence unless a unique record is found. First that column is chosen whose the "IsCodeTextColumn" property is true.
        /// Secondly, that column is chosen whose "IsValueMemberColumn" property is true. And, at last, thirdly that column
        /// is chosen whose "IsDisplayMemberColumn" property is true. The 3rd part of the filter expression is the search string which is passed
        /// to this method.</param>
        /// <param name="searchString">The search string provided by the user in the lookup enabled control on the screen</param>
        /// <param name="searchMode">Defines the type of Search made. Valid Search Modes are defined in the SearchModes enumeration</param>
        /// <param name="additionalValues">If the user chooses to open a called form (in reference/new/update mode) 
        /// then the calling form may want to send some values to called form, so taht the called form can show the information correctly.
        /// for example the lookup is working on "items" entity, however the user chooses to open the items screen
        /// in new mode. In this case the calling form may want to pass the item-head and item-sub-head codes to the called screen (items screen)
        /// to prefil the values in the respective fields of the called screen</param>
        public static LookupResult ShowLookupDialog(string sqlString,
                                            string searchString,
                                            LookupSearchModes searchMode,
                                            Hashtable additionalValues,
                                            LookupDialogSizes lookupDialogWidth,
                                            bool isMultiSelect,
                                            bool enableNew,
                                            bool enableUpdate,
                                            bool enableReference,
                                            IWin32Window owner,
                                            Control invokingControl,
                                            string lookupTitle)
        {
            return ShowLookupDialog(sqlString,
                                            searchString,
                                            searchMode,
                                            additionalValues,
                                            lookupDialogWidth,
                                            isMultiSelect,
                                            enableNew,
                                            enableUpdate,
                                            enableReference,
                                            owner,
                                            lookupTitle,
                                            invokingControl,
                                            0);
        }
        public static LookupResult ShowLookupDialog(string sqlString,
                                            string searchString,
                                            LookupSearchModes searchMode,
                                            Hashtable additionalValues,
                                            LookupDialogSizes lookupDialogWidth,
                                            bool isMultiSelect,
                                            bool enableNew,
                                            bool enableUpdate,
                                            bool enableReference,
                                            IWin32Window owner,
                                            string lookupTitle,
                                            Control invokingControl,
                                            int minCharactersForQuery)
        {
            try
            {
                //[[Get the LookupColumn objects corresponding to Code, Value and Display Members
                //These will be required to update the looup result to tell it that what are the 
                //names of code, value and display member column names.
                LookupColumnPredicate predicate = new LookupColumnPredicate();
                predicate.IsCodeMemberColumn = true;
                LookupColumn codeMemberColumn = lstLookupColumns.Find(predicate.Compare);
                predicate = new LookupColumnPredicate();
                predicate.IsValueMemberColumn = true;
                LookupColumn valueMemberColumn = lstLookupColumns.Find(predicate.Compare);
                predicate = new LookupColumnPredicate();
                predicate.IsDisplayMemberColumn = true;
                LookupColumn displayMemberColumn = lstLookupColumns.Find(predicate.Compare);
                //]]

                ///[[If the searchMode is logical, then first a trial will be made to find
                //a matching unique record
                if (searchMode == LookupSearchModes.Logical)
                {
                    LookupResult result = CreateResultForLogicalSearch(objDBManager, sqlString, searchString);
                    if (result != null)
                    {
                        return UpdateColumnBindings(result, codeMemberColumn, valueMemberColumn, displayMemberColumn);
                    }
                }
                //]]
                LookupDataProvider dataProvider = null;
                try
                {
                    dataProvider = new LookupDataProvider(objDBManager, sqlString, searchString, lstLookupColumns);
                    dataProvider.MinimumCharactersForQuery = minCharactersForQuery;

                    LookupDialog lookupDialog = new LookupDialog();
                    lookupDialog.MinimumCharactersForQuery = minCharactersForQuery;
                    LookupResult lookupResult = lookupDialog.ShowLookup(dataProvider, owner, searchMode, (int)lookupDialogWidth, isMultiSelect, enableNew, enableUpdate, enableReference, lookupTitle, invokingControl);
                    ClearLookupModal();
                    return UpdateColumnBindings(lookupResult, codeMemberColumn, valueMemberColumn, displayMemberColumn);
                }
                finally
                {
                    dataProvider.CloseDataReaderForLookup();   
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                ClearLookupModal();
            }
        }

        private static LookupResult UpdateColumnBindings(LookupResult result, LookupColumn codeMemberColumn, LookupColumn valueMemberColumn, LookupColumn displayMemberColumn)
        {

            if (codeMemberColumn != null)
            {
                result.CodeMemberColumnName = codeMemberColumn.AliasName;
            }
            if (valueMemberColumn != null)
            {
                result.ValueMemberColumnName = valueMemberColumn.AliasName;
            }
            if (displayMemberColumn != null)
            {
                result.DisplayMemberColumnName = displayMemberColumn.AliasName;
            }
            return result;
        }

        internal static LookupResult CreateResultForLogicalSearch(IDbManager objDBManager, string sqlString,
                                                                string searchString)
        {
            LookupDataProvider dataProvider = new LookupDataProvider(objDBManager, sqlString, searchString, lstLookupColumns);
            try
            {
                ///[[First check if the searc is logical, then first see if we can find 
                //a unique reocrd with the code, then with id and then with displaytext. 
                //If we find a unique record while going through this progression, then
                //there is no need of showing the dialog. Simply create the lookup result and 
                //return to the caller.

                ///[[search on CodeMember
                LookupColumnPredicate predicate = new LookupColumnPredicate();
                predicate.IsCodeMemberColumn = true;
                LookupColumn targetMberColumn = lstLookupColumns.Find(predicate.Compare);

                string sqlOnCode = dataProvider.GetSQLStatementForLogicalSearchOnTargetColumn(searchString, targetMberColumn, LookupSearchOperators.Equals);
                //]]

                ///[[Search on ValueMember
                predicate = new LookupColumnPredicate();
                predicate.IsValueMemberColumn = true;
                targetMberColumn = lstLookupColumns.Find(predicate.Compare);
                string sqlOnId = dataProvider.GetSQLStatementForLogicalSearchOnTargetColumn(searchString, targetMberColumn, LookupSearchOperators.Equals);
                //]]

                ///[[Search on DisplayMember
                predicate = new LookupColumnPredicate();
                predicate.IsDisplayMemberColumn = true;
                targetMberColumn = lstLookupColumns.Find(predicate.Compare);
                string sqlOnDisplay = dataProvider.GetSQLStatementForLogicalSearchOnTargetColumn(searchString, targetMberColumn, LookupSearchOperators.Equals);
                string sqlOnDisplayWithStartsWith = dataProvider.GetSQLStatementForLogicalSearchOnTargetColumn(searchString, targetMberColumn, LookupSearchOperators.StartsWith);
                //]]

                dataProvider.RelaodResultsForLogicalSearch(sqlOnCode, sqlOnId, sqlOnDisplay, sqlOnDisplayWithStartsWith);
                if (dataProvider.RowCountForAvailableRecordsTable == 1)
                {
                    dataProvider.TransferAllRecords();
                    return dataProvider.CreateResult(LookupReturnModes.Select, false);
                }

                return null;
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                dataProvider.CloseDataReaderForLookup();
            }
        }

        private static LookupResult GetLookupResultForTargetColumn(string searchString, LookupColumn targetMberColumn, LookupDataProvider dataProvider)
        {
            try
            {
                if (targetMberColumn != null)
                {
                    dataProvider.ReloadResults(searchString, targetMberColumn, LookupSearchOperators.Equals);
                    if (dataProvider.RowCountForAvailableRecordsTable == 1)
                    {
                        dataProvider.TransferAllRecords();
                        return dataProvider.CreateResult(LookupReturnModes.Select, false);
                    }
                }
                return null;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static void ClearLookupModal()
        {
            lstLookupColumns.Clear();
        }


        public static IDbManager DBManager
        {
            get { return LookupManager.objDBManager; }
            set { LookupManager.objDBManager = value; }
        }
        //public static string ConnectionString
        //{
        //    get { return LookupManager.connectionString; }
        //    set { LookupManager.connectionString = value; }
        //}

        public static void AddColumn(string caption,
                                        string sqlName,
                                        string aliasName,
                                        int percentageWidth,
                                        string toolTipText,
                                        bool isDisplayMemberColumn,
                                        bool isValueMemberColumn,
                                        bool isCodeMemberColumn,
                                    string tablePrefix)
        {
            ///see if there is an already existing column with the same column caption or aliasname or sqlName
            ///if yes then throw an exception.
            ////[[
            LookupColumnPredicate predicate = new LookupColumnPredicate();
            predicate.AliasName = aliasName;
            if (lstLookupColumns.Find(predicate.Compare) != null)
            {
                throw new Exception("A column is already existing with matching aliasName");
            }
            predicate = new LookupColumnPredicate();
            predicate.Caption = caption;
            if (lstLookupColumns.Find(predicate.Compare) != null)
            {
                throw new Exception("A column is already existing with matching caption");
            }
            predicate = new LookupColumnPredicate();
            predicate.SqlName = sqlName;
            if (lstLookupColumns.Find(predicate.Compare) != null)
            {
                throw new Exception("A column is already existing with matching sqlName");
            }
            predicate = new LookupColumnPredicate();
            if (!string.IsNullOrEmpty(toolTipText.Trim()))
            {
                predicate.ToolTipText = toolTipText;
                if (lstLookupColumns.Find(predicate.Compare) != null)
                {
                    throw new Exception("A column is already existing with matching tooltiptext");
                }
            }
            ///]]
            ///See if this column has been defined as DisplayMemberColumn then check that no other column in the list
            ///of already added column is not specified as DisplayMemberColumn
            ////[[
            predicate = new LookupColumnPredicate();
            predicate.IsDisplayMemberColumn = isDisplayMemberColumn;
            if (isDisplayMemberColumn && lstLookupColumns.Find(predicate.Compare) != null)
            {
                throw new Exception("An existing column has already been specified as Display-Text Column");
            }
            ///]]

            ///See if this column has been defined as IdTextColumn then check that no other column in the list
            ///of already added column is not specified as IdTextColumn
            ////[[
            predicate = new LookupColumnPredicate();
            predicate.IsValueMemberColumn = isValueMemberColumn;
            if (isValueMemberColumn && lstLookupColumns.Find(predicate.Compare) != null)
            {
                throw new Exception("An existing column has already been specified as Id-Text Column");
            }
            ///]]
            ///See if this column has been defined as CodeTextColumn then check that no other column in the list
            ///of already added column is not specified as CodeTextColumn
            ////[[
            predicate = new LookupColumnPredicate();
            predicate.IsCodeMemberColumn = isCodeMemberColumn;
            if (isCodeMemberColumn && lstLookupColumns.Find(predicate.Compare) != null)
            {
                throw new Exception("An existing column has already been specified as Code-Text Column");
            }
            ///]]
            LookupColumn column = new LookupColumn(caption, sqlName, aliasName, percentageWidth, toolTipText, isDisplayMemberColumn, isValueMemberColumn, isCodeMemberColumn, tablePrefix);
            lstLookupColumns.Add(column);
        }
        public static void AddColumn(string caption,
                                     string sqlName,
                                     string aliasName,
                                     int percentageWidth,
                                     string toolTipText,
                                    string tablePrefix)
        {
            AddColumn(caption, sqlName, aliasName, percentageWidth, toolTipText, false, false, false, tablePrefix);
        }
    }
}
