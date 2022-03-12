using System.Linq;
using White.Core.UIItems;
using White.Core.UIItems.Finders;
using System.Threading;
using System;

namespace DCC.UMB.TAF.View
{
    partial class TAFAbstractScreen
    {
        public void ReEvaluateAllItems()
        {

            SearchCriteria cr = SearchCriteria.All;

            IUIItem[] items = ObjWindow.GetMultiple(cr);
            this.allItems.Clear();
            foreach (IUIItem item in items)
            {
                this.allItems.Add(item);
            }
        }

       
        #region Tool Bar Buttons
        public void Insert()
        {
            ClickToolBarButton("Insert");
        }
        public void Query()
        {
            ClickToolBarButton("Query");
        }
        public void List()
        {
            ClickToolBarButton("List  ");
        }
        public void Browse()
        {
            ClickToolBarButton("Brws");
        }
        public void Next()
        {
            ClickToolBarButton("Next");
        }
        public void Back()
        {
            ClickToolBarButton("Back");
        }
        public void First()
        {
            ClickToolBarButton("First");
        }
        public void Last()
        {
            ClickToolBarButton("Last");
        }
        public void Clear()
        {
            ClickToolBarButton("Clear");
        }
        public void Close()
        {
            ClickToolBarButton("Close");
            //ReEvaluateAllItems();
        }
        public void Exit()
        {
            ClickToolBarButton("Exit");
        }
        public void Save()
        {
            ClickToolBarButton("Save");
        }
        public void Get()
        {
            ClickToolBarButton(" Get ");
        }
        public void Delete()
        {
            ClickToolBarButton("Delete");
        }
        public void Print()
        {
            ClickToolBarButton("Print");
        }
        public void Preview()
        {
            ClickToolBarButton("Preview");
        }
        private void ClickToolBarButton(string buttonText)
        {
            Logger.Debug(buttonText + " button click initiated");
            try
            {
                SearchCriteria cr = SearchCriteria.ByControlType(typeof(White.Core.UIItems.Button)).AndByText(buttonText);
                (ObjWindow.Get<Button>(cr)).RaiseClickEvent();
                Thread.Sleep(TAFManager.ScreenLoadWaitSeconds);
                Thread.Sleep(4000);//just to make sure that the message stops blinking (as our buddy may read it when it was blank during blinking)
                Logger.Debug(buttonText + " button click completed successfully");
            }
            catch (System.Exception ex)
            {
                Logger.Error(buttonText + " button click could not suceed" + Environment.NewLine + ex.Message + Environment.NewLine + ex.StackTrace);
                throw;
            }
        }
        #endregion

        #region Message Bar and Status Panels
        public string ModeText
        {
            get
            {
                string modeText = GetStatusPanelText(1);
                return modeText.StartsWith("Browse") ? "Browse" : modeText;
            }
        }
        
        public string ScreenIdText
        {
            get { return GetStatusPanelText(2); }
        }
        public string UserText
        {
            get { return GetStatusPanelText(3); }
        }
        public string ServerName
        {
            get { return GetStatusPanelText(4).Replace("@", ""); }
        }
        public int CurrentRecordSeq
        {
            get
            {
                string modeText = GetStatusPanelText(1).Replace("Browse", "").Replace("+", "").Replace("[", "").Replace("]", "").Replace(" ", "");
                return int.Parse(modeText.Split(new char[] { '/' })[0]);
            }
        }
        public int RecordCount
        {
            get
            {
                string modeText = GetStatusPanelText(1).Replace("Browse", "").Replace("+", "").Replace("[", "").Replace("]", "").Replace(" ", "");
                return int.Parse(modeText.Split(new char[] { '/' })[1]);
            }
        }
        public string MessageText
        {
            get
            {
                SearchCriteria cr = SearchCriteria.ByAutomationId("lblMessageBar");
                return (ObjWindow.Get<Label>(cr)).Text;
            }
        }

        private string GetStatusPanelText(int paneIndex)
        {
            SearchCriteria cr = SearchCriteria.ByAutomationId("StatusBar.Pane" + paneIndex);
            return (ObjWindow.Get<WinFormTextBox>(cr)).Text;
        }
        #endregion
    }
}
