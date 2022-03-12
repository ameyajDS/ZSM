using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Xml;

namespace DCC.UMB.CDF.Tools.DBFacadeGenerator.Method
{
    public partial class APIDocExtractor 
    {
        public static ProcApiDocs GetProcApiDocs(string procString)
        {
            //if the content of the proc does not have the string <SP_SUMMARY> then just skip parsing the procedure contents
            if(string.IsNullOrEmpty(procString)) return null;
            //if (procString.IndexOf("<SP_SUMMARY>") <= 0) return null;
            StringReader reader = new StringReader(procString);
            string line = null;
            List<ProcApiDocs> procedures = new List<ProcApiDocs>();

            while ((line = reader.ReadLine()) != null)
            {
                line = line.Trim();
                if (line.ToUpper().Replace(" ", "").Replace("\t", "").StartsWith("CREATEPROCEDURE"))
                {
                    string[] tokens = line.Split(new string[] { " ", "\t" }, StringSplitOptions.RemoveEmptyEntries);
                    string procedureName = tokens[2];
                    ProcApiDocs aProc = CreateProcedure(procedureName, reader);
                    procedures.Add(aProc);
                }
            }
            return procedures[0];
            //foreach (Procedure proc in procedures)
            //{
            //    this.storedProceduresTreeView.Nodes.Add(proc);
            //}


        }

        
        private static ProcApiDocs CreateProcedure(string procedureName, StringReader reader)
        {
            ProcApiDocs proc = new ProcApiDocs(procedureName);
            string line = null;
            //loop through the reader till we scroll the line which has "(" in it
            //This is the opening bracket of the parameters
            while ((line = reader.ReadLine()) != null)
            {
                if (IsStartOfParamBody(line)) break;
                if (IsStartOfProcBody(line)) return proc;
            }
            //at this point we have reached at the level of parameters
            while ((line = reader.ReadLine()) != null)
            {
                if (IsStartOfProcBody(line)) return proc;
                if (IsStartOfProcDocs(line))
                {
                    string docs = GetPreExistingPorcDocs(reader, line);
                    proc.DocComments = docs;
                }
                if (IsAParameterDefinition(line))
                {
                    proc.CreateParameter(line);
                }
            }
            return proc;
        }

        private static string GetPreExistingPorcDocs(StringReader reader, string firstDocLine)
        {
            string procDocs = firstDocLine;
            string line = null;
            while ((line = reader.ReadLine()) != null)
            {
                if (IsEndOfProcDocs(line))
                {
                    procDocs += "\r\n" + line;
                    return procDocs;
                }

                procDocs += "\r\n" + line;
                if (IsStartOfProcBody(line)) 
                    return null;


            }
            return null;
        }

        private static bool IsStartOfProcDocs(string line)
        {
            if (ShredLine(line).StartsWith("<SP_SUMMARY>")) return true;
            return false;
        }
        private static bool IsEndOfProcDocs(string line)
        {
            if (ShredLine(line).StartsWith("</SP_SUMMARY>")) return true;
            return false;
        }
        private static bool IsStartOfParamBody(string line)
        {
            if (ShredLine(line) == "(") return true;
            return false;
        }
        private static bool IsStartOfProcBody(string line)
        {
            if (ShredLine(line) == "AS") return true;
            return false;
        }
        private static bool IsAParameterDefinition(string line)
        {
            if (ShredLine(line).StartsWith("@")) return true;
            return false;
        }

        public static string ShredLine(string line)
        {
            return line.Trim().Replace("\t", "").Replace(" ", "");
        }

        
    }
    public class ProcApiDocs 
    {
        string name;
        string docComments;
        XmlDocument doc = null;

        List<ParamApiDocs> parameters = new List<ParamApiDocs>();

        public List<ParamApiDocs> Parameters
        {
            get { return parameters; }            
        }

        public ProcApiDocs(String name)
        {
            this.name = name;            
        }
        public string DocComments
        {
            get { return docComments; }
            set
            {
                docComments = value;
                this.doc = new XmlDocument();
                doc.LoadXml(docComments);
            }
        }
        public string Summary
        {
            get
            {
                if(this.doc==null)
                {
                    return string.Empty;
                }
                XmlNode descriptionNode = doc.SelectSingleNode("/SP_SUMMARY/DESCRIPTION");
                if (descriptionNode != null)
                {
                    return descriptionNode.InnerText;                    
                }
                return string.Empty;                
            }
        }
        public string Remarks
        {
            get
            {
                if (this.doc == null)
                {
                    return string.Empty;
                }
                XmlNode remarksNode = doc.SelectSingleNode("/SP_SUMMARY/REMARKS");
                if (remarksNode != null)
                {
                    return remarksNode.InnerText;
                }
                return string.Empty;
            }
        }
        public string Returns
        {
            get
            {
                if (this.doc == null)
                {
                    return string.Empty;
                }
                XmlNode returnsNode = doc.SelectSingleNode("/SP_SUMMARY/RETURNS");
                if (returnsNode != null)
                {
                    return returnsNode.InnerText;
                }
                return string.Empty;
            }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public override string ToString()
        {
            return this.name;
        }

        internal void CreateParameter(string line)
        {
            this.parameters.Add(new ParamApiDocs(line));
        }
    }
    public class ParamApiDocs
    {
        string parameterName;
        string docComments;

        public ParamApiDocs(string line)
        {
            string[] tokens = line.Trim().Replace("\t", " ").Split(new string[] { " " }, StringSplitOptions.None);
            this.parameterName = tokens[0];
            string lineWithNormalizedElementNames = line.Replace("<desc>", "<DESC>");
            lineWithNormalizedElementNames = lineWithNormalizedElementNames.Replace("</desc>", "</DESC>");
            tokens = lineWithNormalizedElementNames.Split(new string[] { "--<DESC>" }, StringSplitOptions.None);
            if (tokens.Length > 1)
            {
                this.docComments = "<DESC>" + tokens[1].Trim();
                if (!this.docComments.Trim().EndsWith("</DESC>"))
                {
                    this.docComments += "</DESC>";
                }
            }
        }
        public string ParameterName
        {
            get { return parameterName; }
            set { parameterName = value; }
        }
        public string DocComments
        {
            get { return docComments; }
            set { docComments = value; }
        }
        public override string ToString()
        {
            return this.parameterName;
        }

    }

}