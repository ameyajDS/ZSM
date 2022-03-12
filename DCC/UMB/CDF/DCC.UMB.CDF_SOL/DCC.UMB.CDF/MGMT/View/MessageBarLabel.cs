using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using DCC.UMB.CDF.MGMT.Global;
using System.Drawing;
using DCC.UMB.CDF.Sound;
using DCC.UMB.CDF.Configuration;

namespace DCC.UMB.CDF.MGMT.View
{
    internal class MessageBarLabel : Label
    {
        private string messageDetails;
        private static MessageFlasher flasher = null;
        private MessageTypes currentMmessageType;

        public MessageBarLabel()
        {
            flasher = new MessageFlasher(this);
        }
        public string MessageDetails
        {
            get { return this.messageDetails; }
            set { this.messageDetails = value; }
        }
        public string CurrentMessageText
        {
            get
            {
                return flasher.MessageText;
            }
        }
        public MessageTypes CurrentMessageType
        {
            get
            {
                return this.currentMmessageType;
            }
        }



        public void SetMessageText(string message, MessageTypes messageType, string otherInformation)
        {
            this.MessageDetails = message + System.Environment.NewLine + otherInformation;
            this.currentMmessageType = messageType;
            Font existingFont = this.Font;
            Font newNotBoldFont = new Font(existingFont, FontStyle.Regular);
            this.Font = newNotBoldFont;
            switch (messageType)
            {
                case MessageTypes.Plain:
                    this.ForeColor = Color.Green;
                    SoundManager.PlayPlainSound();
                    break;
                case MessageTypes.Warning:
                    this.ForeColor = Color.BlueViolet;
                    SoundManager.PlayWarningSound();
                    break;
                case MessageTypes.Error:
                    this.ForeColor = Color.Red;
                    break;
                case MessageTypes.Fatal:
                    this.ForeColor = Color.Red;
                    Font newBoldFont = new Font(existingFont, FontStyle.Bold);
                    this.Font = newBoldFont;
                    SoundManager.PlayFatalSound();
                    break;
                default:
                    break;
            }
            //[[Now blick the text in the message bar so as to get user's attention
            flasher.MessageText = message;
            Thread t = new Thread(new ThreadStart(flasher.FlashMessage));
            t.Start();
            //]]
        }
    }
    internal class MessageFlasher
    {
        private Label lblMessageBar = null;
        private string messageText = null;
        private bool isAlreadyFlashing;//this flag stands if the message is alredy flasing. If yes, no separate flashing is allowed
        public MessageFlasher(Label lblMessageBar)
        {
            this.lblMessageBar = lblMessageBar;
        }



        public string MessageText
        {
            get { return messageText; }
            set { messageText = value; }
        }


        public void FlashMessage()
        {
            if(this.isAlreadyFlashing)
            {
                return;
            }
            
            try
            {
                this.isAlreadyFlashing = true;
                MethodInvoker mi = new MethodInvoker(Updater);
                int interval = 400;
                for (int i = 0; i < 6; i++)
                {
                    GlobalAppVariables.ObjMDIMain.BeginInvoke(mi);
                    Thread.Sleep(interval);
                }
                mi = new MethodInvoker(FreezeText);
                GlobalAppVariables.ObjMDIMain.BeginInvoke(mi);
            }
            catch (Exception ex)
            {
                //Do Nothing..
            }
            finally
            {
                this.isAlreadyFlashing = false;
            }
        }
        private void Updater()
        {
            if (this.messageText.Trim() == string.Empty)
            {
                lblMessageBar.Text = string.Empty;
                return;
            }
            if (lblMessageBar.Text.Length == 0)
            {
                lblMessageBar.Text = MessageText;
            }
            else
            {
                lblMessageBar.Text = string.Empty;
            }
            lblMessageBar.Refresh();
        }
        private void FreezeText()
        {
            lblMessageBar.Text = this.MessageText;
            lblMessageBar.Refresh();
        }
    }
}
