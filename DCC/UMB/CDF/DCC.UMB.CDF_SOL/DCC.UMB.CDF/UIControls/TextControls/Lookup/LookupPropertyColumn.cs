using System.Xml;
using System.Text;
namespace DCC.UMB.CDF.UIControls.TextControls.Lookup
{
    public class LookupPropertyColumn
    {
        private string caption = "Caption";
        private string sqlName = string.Empty;
        private string aliasName = string.Empty;
        private int percentageWidth = 20;
        private string toolTipText = string.Empty;
        private bool isDisplayMemberColumn = false;
        private bool isValueMemberColumn = false;
        private bool isCodeMemberColumn = false;
        private string guid = System.Guid.NewGuid().ToString();
        private string tablePrefix;
        
        public string Guid
        {
            get { return guid; }
            set { guid = value; }
        }
        internal LookupPropertyColumn()
        {

        }
        internal LookupPropertyColumn(string caption,
                                    string sqlName,
                                    string aliasName,
                                    int percentageWidth,
                                    string toolTipText,
                                    bool isDisplayMemberColumn,
                                    bool isValueMemberColumn,
                                    bool isCodeMemberColumn,
                                    string tablePrefix)
        {
            this.caption = caption;
            this.sqlName = sqlName;
            this.aliasName = aliasName;
            this.percentageWidth = percentageWidth;
            this.toolTipText = toolTipText;
            this.IsDisplayMemberColumn = isDisplayMemberColumn;
            this.isValueMemberColumn = isValueMemberColumn;
            this.IsCodeMemberColumn = isCodeMemberColumn;
            this.ToolTipText = toolTipText;
            this.tablePrefix = tablePrefix;
        }

        public bool IsDisplayMemberColumn
        {
            get { return isDisplayMemberColumn; }
            set { isDisplayMemberColumn = value; }
        }

        public bool IsValueMemberColumn
        {
            get { return isValueMemberColumn; }
            set { isValueMemberColumn = value; }
        }

        public bool IsCodeMemberColumn
        {
            get { return isCodeMemberColumn; }
            set { isCodeMemberColumn = value; }
        }

        public string ToolTipText
        {
            get { return toolTipText; }
            set { toolTipText = value; }
        }

        public int PercentageWidth
        {
            get { return percentageWidth; }
            set { percentageWidth = value; }
        }

        public string AliasName
        {
            get { return aliasName; }
            set { aliasName = value; }
        }
        public string SqlName
        {
            get { return sqlName; }
            set { sqlName = value; }
        }
        public string Caption
        {
            get { return caption; }
            set { caption = value; }
        }

        

        public string TablePrefix
        {
            get { return tablePrefix; }
            set { tablePrefix = value; }
        }

        public static LookupPropertyColumn CreateColumnFromXmlString(XmlNode lookupColumnNode)
        {
            string caption = lookupColumnNode.Attributes["caption"].Value;
            string sqlName = lookupColumnNode.Attributes["sqlName"].Value;
            string aliasName = lookupColumnNode.Attributes["aliasName"].Value;
            int percentageWidth = int.Parse(lookupColumnNode.Attributes["percentageWidth"].Value);
            string toolTipText = lookupColumnNode.Attributes["toolTipText"].Value;
            bool isDisplayMemberColumn = bool.Parse(lookupColumnNode.Attributes["isDisplayMemberColumn"].Value);
            bool isValueMemberColumn = bool.Parse(lookupColumnNode.Attributes["isValueMemberColumn"].Value);
            bool isCodeMemberColumn = bool.Parse(lookupColumnNode.Attributes["isCodeMemberColumn"].Value);
            string tablePrefix = lookupColumnNode.Attributes["tablePrefix"] != null
                                                  ? lookupColumnNode.Attributes["tablePrefix"].Value
                                                  : null;
            

            return new LookupPropertyColumn(caption, sqlName, aliasName, percentageWidth, toolTipText, isDisplayMemberColumn, isValueMemberColumn, isCodeMemberColumn,tablePrefix);
        }
        public void WriteXmlString(XmlWriter writer)
        {
            //string caption,
            //string sqlName,
            //string aliasName,
            //int percentageWidth,
            //string toolTipText,
            //bool isDisplayMemberColumn,
            //bool isIdMemberColumn,
            //bool isCodeMemberColumn
            //string tablePrefix,
            //string codeMemberTablePrefix,
            //string valueMemberTablePrefix

            writer.WriteStartElement("LookupColumn");
            writer.WriteAttributeString("caption", this.caption == null ? string.Empty : this.caption);
            writer.WriteAttributeString("sqlName", sqlName == null ? string.Empty : this.sqlName);
            writer.WriteAttributeString("aliasName", aliasName == null ? string.Empty : this.aliasName);
            writer.WriteAttributeString("percentageWidth", percentageWidth.ToString());
            writer.WriteAttributeString("toolTipText", toolTipText == null ? string.Empty : this.toolTipText);
            writer.WriteAttributeString("isDisplayMemberColumn", isDisplayMemberColumn.ToString());
            writer.WriteAttributeString("isValueMemberColumn", isValueMemberColumn.ToString());
            writer.WriteAttributeString("isCodeMemberColumn", isCodeMemberColumn.ToString());
            writer.WriteAttributeString("tablePrefix", tablePrefix);
            writer.WriteEndElement();
        }
        public override string ToString()
        {
            return this.caption.Trim();
        }
    }
}