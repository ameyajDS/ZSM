using System;
using DCC.UMB.CDF.Configuration;

namespace DCC.UMB.CDF.MGMT.Modal
{
    public class DCCException : Exception
    {
        private Exception nestedException = null;
        private string messageCode;
        private string messageTokens;
        private string screenId;
        private UIModes screenMode;
        private string otherInformation;
        
        public DCCException(Exception nestedException, string messageCode, string messageTokens):
            this(nestedException, messageCode, messageTokens, null, UIModes.None)
        {

        }
        public DCCException(Exception nestedException, string messageCode, string messageTokens, string screenId, UIModes screenMode)
        {
            this.nestedException = nestedException;
            this.MessageCode = messageCode;
            this.MessageTokens = messageTokens;
            this.ScreenId = screenId;
            this.ScreenMode = screenMode;
            this.OtherInformation = nestedException == null ? string.Empty : nestedException.StackTrace;
        }

        
        public Exception NestedException
        {
            get { return nestedException; }
            set { nestedException = value; }
        }

        public string MessageCode
        {
            get { return messageCode; }
            set { messageCode = value; }
        }

        public string MessageTokens
        {
            get { return messageTokens; }
            set { messageTokens = value; }
        }

        public string ScreenId
        {
            get { return screenId; }
            set { screenId = value; }
        }

        public UIModes ScreenMode
        {
            get { return screenMode; }
            set { screenMode = value; }
        }

        public string OtherInformation
        {
            get { return otherInformation; }
            set { otherInformation = value; }
        }
    }
}
