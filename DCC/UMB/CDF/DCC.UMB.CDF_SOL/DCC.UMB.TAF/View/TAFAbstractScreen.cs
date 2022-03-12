using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Reflection;
using System.Text;
using White.Core.UIItems.ListBoxItems;
using White.Core.UIItems.TableItems;
using White.Core.UIItems.WindowItems;
using White.Core;
using White.Core.UIItems.MenuItems;
using White.Core.UIItems;
using White.Core.UIItems.Finders;
using White.Core.Factory;
using System.Threading;
using White.Core.UIItems.WindowStripControls;
using Bricks;
using NUnit.Framework;
using System.Windows.Automation;

namespace DCC.UMB.TAF.View
{
    public abstract partial class TAFAbstractScreen
    {
        public readonly Window ObjWindow;
        private readonly Application application;
        private readonly UIItemContainer mdiChild;
        private List<IUIItem> allItems = new List<IUIItem>();
        private readonly MenuBar menuBar;
        private Menu level2Menu;
        private string[] menuPath;
        public TAFAbstractScreen(Application application, params string[] aMenuPath)
        {
            this.application = application;
            string uniqueScreenIdentifier = application.Name + "_" + string.Join("_", aMenuPath);
            this.ObjWindow = application.GetWindow(SearchCriteria.All, InitializeOption.NoCache.AndIdentifiedBy(uniqueScreenIdentifier));
            this.menuBar = ObjWindow.MenuBar;
            menuPath = aMenuPath;
            level2Menu = menuBar.MenuItem(aMenuPath);
            Logger.Debug(string.Format("Screen with menu path '{0}' created in memory", string.Join("_", aMenuPath)));
        }

        /// <summary>
        /// Opens this screen as if someone clicked on the menu item.
        /// </summary>
        public void Open()
        {
            //this.level2Menu = menuBar.MenuItem(this.menuPath);
            level2Menu.RaiseClickEvent();
            Thread.Sleep(TAFManager.ScreenLoadWaitSeconds * 1000);
            Logger.Debug(string.Format("Screen with menu path '{0}' opened", string.Join("_", menuPath)));
            //[[Preserved for future reference for auto generating screen classes.
            //ReEvaluateAllItems();
            //]]            
        }

        /// <summary>
        /// Searches and returns a TextField present on the screen, if the text field is not found, an exception is thrown
        /// </summary>
        /// <param name="automationId">The automation id of the field being sought</param>
        /// <returns></returns>
        public TAFTextField GetTextField(string automationId)
        {
            Logger.Debug(string.Format("Searching text field with id = '{0}'", automationId));
            IUIItem item = allItems.FirstOrDefault(m => m.Id == automationId && (m is WinFormTextBox));
            if (item == null)
            {
                item = ObjWindow.Get<WinFormTextBox>(SearchCriteria.ByAutomationId(automationId));
                this.allItems.Add(item);
            }
            if (item == null)
            {
                Logger.Error(string.Format("A textbox with the automation id {0} cant be found on the screen", automationId));
            }
            Assert.IsNotNull(item);
            Logger.Debug(string.Format("Found text field with id = '{0}'", automationId));
            return new TAFTextField((WinFormTextBox)item, this.ObjWindow);
        }

        public TAFSummaryDetailNavigator GetSummaryDetailNavigator(string automationId)
        {
            Logger.Debug(string.Format("Searching tool strip with id = '{0}'", automationId));
            IUIItem item = allItems.FirstOrDefault(m => m.Id == automationId && (m is ToolStrip));
            if (item == null)
            {
                item = ObjWindow.Get<ToolStrip>(SearchCriteria.ByAutomationId(automationId));
                this.allItems.Add(item);
            }
            if (item == null)
            {
                Logger.Error(string.Format("A tool strip with the automation id {0} cant be found on the screen", automationId));
            }
            Assert.IsNotNull(item);
            Logger.Debug(string.Format("Found tool strip with id = '{0}'", automationId));
            return new TAFSummaryDetailNavigator((ToolStrip)item, this.ObjWindow);
        }
        /// <summary>
        /// Searches and returns a button present on the screen, if the button is not found and exception is thrown
        /// </summary>
        /// <param name="automationId">The automation id of the button being sought</param>
        /// <returns></returns>
        public TAFButton GetButton(string automationId)
        {
            Logger.Debug(string.Format("Searching button with id = '{0}'", automationId));
            IUIItem item = allItems.FirstOrDefault(m => m.Id == automationId && (m is Button));
            if (item == null)
            {
                item = ObjWindow.Get<Button>(SearchCriteria.ByAutomationId(automationId));
                this.allItems.Add(item);
            }
            if (item == null)
            {
                Logger.Debug(string.Format("A button with the automation id {0} cant be found on the screen", automationId));
            }
            Assert.IsNotNull(item);
            Logger.Debug(string.Format("Found button with id = '{0}'", automationId));
            return new TAFButton((Button)item, this.ObjWindow);
        }

        /// <summary>
        /// Searches and returns a text area present on the screen, if the text area is not found and exception is thrown
        /// </summary>
        /// <param name="automationId">The automation id of the text area being sought</param>
        /// <returns></returns>
        public TAFTextArea GetTextArea(string automationId)
        {
            Logger.Debug(string.Format("Searching text area with id = '{0}'", automationId));

            IUIItem item = allItems.FirstOrDefault(m => m.Id == automationId && (m is MultilineTextBox));
            if (item == null)
            {
                item = ObjWindow.Get<MultilineTextBox>(SearchCriteria.ByAutomationId(automationId));
                this.allItems.Add(item);
            }
            if (item == null)
            {
                Logger.Debug(string.Format("A textbox with the automation id {0} cant be found on the screen", automationId));
            }
            Assert.IsNotNull(item);
            Logger.Debug(string.Format("Found text area with id = '{0}'", automationId));
            return new TAFTextArea((MultilineTextBox)item, this.ObjWindow);
        }

        /// <summary>
        /// Searches and returns a combo box present on the screen, if the combo box is not found and exception is thrown
        /// </summary>
        /// <param name="automationId">The automation id of the combo box being sought</param>
        /// <returns></returns>
        public TAFComboBox GetComboBox(string automationId)
        {
            Logger.Debug(string.Format("Searching combo box with id = '{0}'", automationId));
            IUIItem item = allItems.FirstOrDefault(m => m.Id == automationId && (m is WinFormComboBox));
            if (item == null)
            {
                item = ObjWindow.Get<WinFormComboBox>(SearchCriteria.ByAutomationId(automationId));
                this.allItems.Add(item);
            }
            if (item == null)
            {
                Logger.Debug(string.Format("A combobox with the automation id {0} cant be found on the screen", automationId));
            }
            Assert.IsNotNull(item);
            Logger.Debug(string.Format("Searching combo box with id = '{0}'", automationId));
            return new TAFComboBox((WinFormComboBox)item, this.ObjWindow);
        }

        /// <summary>
        /// Searches and returns a check box present on the screen, if the check box is not found and exception is thrown
        /// </summary>
        /// <param name="automationId">The automation id of the check box being sought</param>
        /// <returns></returns>
        public TAFCheckBox GetCheckBox(string automationId)
        {
            Logger.Debug(string.Format("Searching check box with id = '{0}'", automationId));
            IUIItem item = allItems.FirstOrDefault(m => m.Id == automationId && (m is CheckBox));
            if (item == null)
            {
                item = ObjWindow.Get<CheckBox>(SearchCriteria.ByAutomationId(automationId));
                this.allItems.Add(item);
            }
            if (item == null)
            {
                Logger.Debug(string.Format("A checkbox with the automation id {0} can't be found on the screen", automationId));
            }
            Assert.IsNotNull(item);
            Logger.Debug(string.Format("Found check box with id = '{0}'", automationId));
            return new TAFCheckBox((CheckBox)item, this.ObjWindow);
        }

        /// <summary>
        /// Searches and returns a grid present on the screen, if the grid is not found and exception is thrown
        /// </summary>
        /// <param name="automationId">The automation id of the grid being sought</param>
        /// <returns></returns>        
        public TAFGrid GetGrid(string automationId)
        {
            Logger.Debug(string.Format("Searching grid with id = '{0}'", automationId));
            IUIItem item = allItems.FirstOrDefault(m => m.Id == automationId && (m is Table));
            if (item == null)
            {
                item = this.ObjWindow.Get(SearchCriteria.ByAutomationId(automationId));
                this.allItems.Add(item);
            }
            if (item == null)
            {
                Logger.Debug(string.Format("A grid with the automation id {0} can't be found on the screen", automationId));
            }
            Assert.IsNotNull(item);
            Logger.Debug(string.Format("Found check box with id = '{0}'", automationId));
            return new TAFGrid(this, (Table)item, this.ObjWindow);
        }

        /// <summary>
        /// Pauses the current execution for the specified seconds so that the target application finishes its background work.
        /// </summary>
        /// <param name="secondsCount"></param>
        public void Pause(int secondsCount)
        {
            Thread.Sleep(secondsCount * 1000);
        }
    }

}
