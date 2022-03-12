using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.Lookup.Modal;
using System.Data;
using System.Xml;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;
namespace DCC.UMB.CDF.Lookup.Modal
{
    public class LookupResult
    {
        private LookupReturnModes returnMode = LookupReturnModes.None;
        private DataView selectedRecords = null;
        private object displayMember;
        private object valueMember;
        private string displayMemberColumnName;
        private string codeMemberColumnName;
        private string valueMemberColumnName;
        private bool appendResults;
        
        /// <summary>
        /// Returns the selected record
        /// </summary>
        public DataView SelectedRecords
        {
            get { return selectedRecords; }
            set { selectedRecords = value; }
        }

        private string FinalSqlTemplate
        {
            get;
            set;
        }
        private string LookupColumnsXML
        {
            get;
            set;
        }
        private string ApplicationIdForDbConnection
        {
            get;
            set;
        }
        internal void SetLookupResultChainFlowProperties(string finalSqlTemplate, string lookupColumnsXML, string appidForDBConnection)
        {
            this.FinalSqlTemplate = finalSqlTemplate;
            this.LookupColumnsXML = lookupColumnsXML;
            this.ApplicationIdForDbConnection = appidForDBConnection;
        }
        public LookupResult FormLookupResultFromOnePointedSearchString(string onePointedSearchString)
        {
            string dummyString = string.Empty;
            LookupManager.ClearLookupModal();
            List<LookupPropertyColumn> lstExistingColumns =
                LookupColumnsPropertyEditor.GetPreviousExistingColumns(this.LookupColumnsXML, ref dummyString);

            foreach (LookupPropertyColumn col in lstExistingColumns)
            {
                LookupManager.AddColumn(col.Caption, col.SqlName, col.AliasName, col.PercentageWidth, col.ToolTipText,
                                        col.IsDisplayMemberColumn, col.IsValueMemberColumn, col.IsCodeMemberColumn,
                                        col.TablePrefix);
            }

            LookupManager.DBManager = UtilityManager.CreateDBManagerInstance(this.ApplicationIdForDbConnection);
            LookupResult result = LookupManager.CreateResultForLogicalSearch(LookupManager.DBManager, FinalSqlTemplate, onePointedSearchString);
            return result;
        }

        public object DisplayMember
        {
            get { return displayMember; }
            set { displayMember = value; }
        }

        public object ValueMember
        {
            get { return valueMember; }
            set { valueMember = value; }
        }

        public int? ValueMemberAsInt
        {
            get
            {
                int? returnValue;
                if (this.valueMember == null)
                {
                    returnValue = null;
                }
                else
                {
                    int embeddedLongValue = (int) this.valueMember;
                    returnValue = embeddedLongValue;
                }
                return returnValue;
            }
        }

        public short? ValueMemberAsShort
        {
            get
            {
                short? returnValue;
                if (this.valueMember == null)
                {
                    returnValue = null;
                }
                else
                {
                    short embeddedShortValue = (short) this.valueMember;
                    returnValue = embeddedShortValue;
                }
                return returnValue;
            }
        }

        public long? ValueMemberAsLng
        {
            get
            {
                long? returnValue;
                if (this.valueMember == null)
                {
                    returnValue = null;
                }
                else
                {
                    long embeddedLongValue = (long) this.valueMember;
                    returnValue = embeddedLongValue;
                }
                return returnValue;
            }
        }

        /// <summary>
        /// Gets the mode of closure of the dialog. The valid modes are defined in LookupReturnModes
        /// </summary>
        public LookupReturnModes ReturnMode
        {
            get { return returnMode; }
            internal set { returnMode = value; }
        }

        internal string DisplayMemberColumnName
        {
            get { return displayMemberColumnName; }
            set { displayMemberColumnName = value; }
        }

        internal string CodeMemberColumnName
        {
            get { return codeMemberColumnName; }
            set { codeMemberColumnName = value; }
        }

        internal string ValueMemberColumnName
        {
            get { return valueMemberColumnName; }
            set { valueMemberColumnName = value; }
        }

        internal bool AppendResults
        {
            get { return appendResults; }
            set { appendResults = value; }
        }

        public override string ToString()
        {
            return ""+this.displayMember;
        }
        public override bool Equals(object obj)
        {
            if (!(obj is LookupResult))
            {
                return false;
            }

            return ToXMLString(this).Equals(ToXMLString((LookupResult) obj));
        }
        internal static string ToXMLString(LookupResult result)
        {
            StringBuilder sb = new StringBuilder();
            XmlWriter writer = XmlWriter.Create(sb);
            writer.WriteStartElement("root");
            writer.WriteStartElement("lookupResult");
            writer.WriteAttributeString("displayMember", ""+result.DisplayMember);
            writer.WriteAttributeString("valueMember", ""+result.ValueMember);
            writer.WriteAttributeString("returnMode", ""+result.ReturnMode);            
            writer.WriteEndElement();            
            writer.WriteEndElement();
            writer.Flush();
            writer.Close();
            return sb.ToString();
        }
        public string GetLookupResultsVitals()
        {
            if (this.ValueMember == null) return null;
            return this.ValueMember + "<%|%>" + this.DisplayMember;
        }
        /// <summary>
        /// Creates a lookup result object from vital values
        /// </summary>
        /// <param name="lookupResultVitals">Represents vital values from which lookup object can be created. 
        /// The vitals is a string which has two values separated by a "&lt;%|%&gt;". The first token is ValueMember and second is DisplayMember</param>
        /// <returns></returns>
        public static LookupResult CreateLookupResultFromVitals(string lookupResultVitals)
        {
            if (string.IsNullOrEmpty(lookupResultVitals)) return null;
            string[] tokens = lookupResultVitals.Split(new string[] { "<%|%>" }, StringSplitOptions.None);
            return new LookupResult() { ValueMember = tokens[0], DisplayMember = tokens[1], ReturnMode=LookupReturnModes.Select };
        }
       
    }
}
