using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.Tools.Common
{
    public class CodeWriter : System.IO.StringWriter
    {
        /// <summary>
        /// Creates a code writer with a feature to add blocks of code
        /// </summary>
        /// <param name="sb"></param>
        /// <param name="defaultStartBlockCharacter">The starting character (or string) for a code. e.g. for c# it would be "{" or for SQL it would be "BEGIN"</param>
        /// <param name="defaultEndBlockCharacter">The starting character (or string) for a code. e.g. for c# it would be "}" or for SQL it would be "END"</param>
        public CodeWriter(StringBuilder sb, string defaultStartBlockCharacter, string defaultEndBlockCharacter)
            : base(sb)
        {
            this.defaultStartBlockCharacter = defaultStartBlockCharacter;
            this.defaultEndBlockCharacter = defaultEndBlockCharacter;            
        }
        private int openBlockCount = 0;
        private string defaultStartBlockCharacter = string.Empty;
        private string defaultEndBlockCharacter = string.Empty;

        public string DefaultEndBlockCharacter
        {
            get { return defaultEndBlockCharacter; }
            set { defaultEndBlockCharacter = value; }
        }

        public string DefaultStartBlockCharacter
        {
            get { return defaultStartBlockCharacter; }
            set { defaultStartBlockCharacter = value; }
        }

        /// <summary>
        /// Writes a start block with the defaultStartBlockCharacter and then moves the tab indentation of this code writer to right by one unit
        /// </summary>
        public void StartBlock()
        {
            this.StartBlock(defaultStartBlockCharacter, false);
        }
        /// <summary>
        /// Writes a start block with the defaultStartBlockCharacter and then moves the tab indentation of this code writer to right by one unit
        /// </summary>
        public void StartBlock(bool inlineContent)
        {
            this.StartBlock(defaultStartBlockCharacter, inlineContent);
        }
        /// <summary>
        /// Writes a start block with the startBlockString and then moves the tab indentation of this code writer to right by one unit.
        /// The defaultStartBlockCharacter for this code writer is ignored in this case. This is typically required when using a language which
        /// has multiple syntaxes for writing blocks. E.G. Visual Basic, SQL (BEGIN, END) etc.
        /// </summary>
        public void StartBlock(string startBlockString)
        {
            this.StartBlock(startBlockString, false);
        }
        public void StartBlock(string startBlockString, bool inLineContent)
        {
            this.StartBlock(startBlockString, inLineContent, 0);
        }

        /// <summary>
        /// Writes a start block with the defaultStartBlockCharacter and then moves the tab indentation of this code writer to right by one unit
        /// <param name="inLineContent">Specifies if the content of the block will be written in the same line as of the startBlockCharacter</param>
        /// </summary>
        public void StartBlock(string startBlockString, bool inLineContent, int additionalTabCount)
        {
            if (startBlockString.Trim() == string.Empty)
            {
                openBlockCount++; 
                return;
            }
            if(inLineContent)
            {
                this.WriteInline(startBlockString);
            }
            else
            {
                this.WriteLine(startBlockString);    
            }
            
            if(!inLineContent)
            {
                openBlockCount++;
            }
            openBlockCount = openBlockCount + additionalTabCount;
        }
        /// <summary>
        /// Writes a end block with the defaultEndBlockCharacter and then moves the tab indentation of this code writer to left by one unit
        /// </summary>
        public void EndBlock()
        {
            this.EndBlock(defaultEndBlockCharacter, false);
        }
        public void EndBlock(bool inlineContent)
        {
            this.EndBlock(defaultEndBlockCharacter, inlineContent);
        }
        /// <summary>
        /// Writes a start block with the endBlockString and then moves the tab indentation of this code writer to left by one unit.
        /// The defaultStartBlockCharacter for this code writer is ignored in this case. This is typically required when using a language which
        /// has multiple syntaxes for writing blocks. E.G. Visual Basic, SQL (BEGIN, END) etc.
        /// </summary>
        public void EndBlock(string endBlockString)
        {
            this.EndBlock(endBlockString, false);
        }
        public void EndBlock(string endBlockString, bool inLineContent)
        {
            this.EndBlock(endBlockString, inLineContent, 0);
        }

        /// <summary>
        /// Writes a start block with the defaultStartBlockCharacter and then moves the tab indentation of this code writer to right by one unit
        /// <param name="inLineContent">Specifies if the content of the block will be written in the same line as of the startBlockCharacter</param>
        /// </summary>
        public void EndBlock(string endBlockString, bool inLineContent, int additionalTabCount)
        {
            openBlockCount--;
            if (endBlockString.Trim() == string.Empty)
            {
                return;
            }
            openBlockCount = openBlockCount - additionalTabCount;
            if (inLineContent)
            {
                this.WriteInline(endBlockString);
            }
            else
            {
                this.WriteLine(endBlockString);
            }
        }
        
        public override void WriteLine(string line)
        {
            line = GetBlockSpace() + line;
            base.WriteLine(line);
            //if (line.Trim() == string.Empty)
            //{
            //    base.Write(line);
            //}
            //else
            //{
            //    base.WriteLine(line);
            //}
        }
        private void WriteInline(string line)
        {
            line = GetBlockSpace() + line;
            base.Write(line);
        }
        public override void Write(string line)
        {
            line = GetBlockSpace() + line;
            base.Write(line);
        }
        private string GetBlockSpace()
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < openBlockCount; i++)
            {
                sb.Append(((char)Keys.Tab).ToString());
            }
            return sb.ToString();            
        }
        public void TrimEnd(char[] chars)
        {
            string s = this.GetStringBuilder().ToString();
            bool endsWithNewline = s.EndsWith(System.Environment.NewLine);
            char[] arrChars = s.ToCharArray();
            int counter = 0;
            for (int i = arrChars.Length - 1; i >= 0; i--)
            {
                if (chars.Contains(arrChars[i]) 
                    || arrChars[i]=='\r'
                    || arrChars[i] == '\n')
                {
                    ++counter;
                }
                else
                {
                    break;
                }
            }
            this.GetStringBuilder().Remove(this.GetStringBuilder().ToString().Length - counter, counter);
            if (endsWithNewline)
            {
                this.GetStringBuilder().AppendLine();
            }
        }

        public string GetSpaces(int len)
        {
            len = len + 4 - (len % 4);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < len; i++)
            {
                sb.Append(" ");
            }
            return GetBlockSpace() + sb.ToString();
        }
    }
}
