using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.MGMT.View.Menu;
using DCC.UMB.CDF.Report;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.UIAutomation;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Utils;
using System.Drawing;
using System.Net.Sockets;
using System.Threading;
using DCC.UMB.CDF.MGMT.TAF;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;

namespace DCC.UMB.CDF.MGMT.View
{
    public partial class MDIMain : Form
    {
        private KeyArgsEventList<KeyEventArgs> previousKeyEventArgs = new KeyArgsEventList<KeyEventArgs>();
        private List<DCCToolStripMenuItemGroup> lstToolStripMenuItemGroups = new List<DCCToolStripMenuItemGroup>();
        private IDbManager dbManager = null;
        private DCCGrid retrivalGrid = null;
        private ToolStripMenuItem dccScreenActionsToolStripItem = null;
        private EventHandler<GridRowSelectionModifiedEventArgs> retrivalGridRowSelectionModifiedHandler = null;
        private EventHandler retrivalGridDoubleClickHandler = null;
        internal MDIMain(DCCToolStripItemClicked menuClickEventHandler)
        {
            InitializeComponent();
            Logger.Debug("Command Line arguments received : " + GlobalAppVariables.AppContext.GetPrintableCommandLineArgs());
            this.dbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            LoadApplicationMenus(menuClickEventHandler);
            this.lblUserRoleIDStatus.Text = GlobalAppVariables.AppContext.UserId + " / " +
                                            GlobalAppVariables.AppContext.UserRoleId;
            if (!GlobalAppVariables.AppContext.IsWebDBEnabled)
            {
                this.lblCurrentEnvironment.Text = "@" + GlobalAppVariables.AppContext.ServerName;
            }
            else
            {
                this.lblCurrentEnvironment.Text = "@" + GlobalAppVariables.AppContext.DBWebServiceURL;
            }
            retrivalGridRowSelectionModifiedHandler = new EventHandler<GridRowSelectionModifiedEventArgs>(retrivalGrid_RowSelectionModified);
            retrivalGridDoubleClickHandler = new EventHandler(retrivalGrid_DoubleClick);
            SetUIModeForNoneMode();
            //[[start the socket listner for TAF, so that the custom commands can be passed over by TAF to this application
            //the port on which the socket will listne is 9000+the sessionid passed to this app
            if (UtilityManager.IsTAFEnvironment())
            {                
                ServiceHost host = new ServiceHost(typeof(TAFGridService), new Uri("net.pipe://localhost/TAFPipe"), new Uri("net.tcp://localhost:9797"));
                host.AddServiceEndpoint(typeof(ITAFGridService), new NetNamedPipeBinding(), "TAFGridService");
                host.CloseTimeout = new TimeSpan(0, 0, 3);//kill the service in 3 seconds if the host process i.e. the CDF app is closed.


                BindingElement bindingElement = new TcpTransportBindingElement();
                CustomBinding binding = new CustomBinding(bindingElement);

                ServiceMetadataBehavior behavior = new ServiceMetadataBehavior();
                host.Description.Behaviors.Add(behavior);
                
                
                host.AddServiceEndpoint(typeof(IMetadataExchange), binding, "MEX");

                host.Open();

            }
            //]]
        }
        
        public AbstractScreen ActiveChild
        {
            get { return (AbstractScreen)this.ActiveMdiChild; }
        }

        private void MDIMain_KeyUp(object sender, KeyEventArgs e)
        {
            ////[[See if this key is from F1 to F12 and then see if the current screen is in browse mode
            ////and there is any action loaded, if yes, then check what Function key maps to that and fire that event
            //if ((int)e.KeyCode >= (int)Keys.F1 && (int)e.KeyCode <= (int)Keys.F12)
            //{
            //    //HandleFunctionKey(e);
            //    this.previousKeyEventArgs.Clear();
            //    e.Handled = true;
            //    return;
            //}
            ////]]
            if (e.Modifiers != Keys.Control)
            {
                this.previousKeyEventArgs.Clear();
                return; //Just return if the control key is not pressed
            }
            if (e.KeyValue == (int)Keys.Escape)//If the key provided is escape then ignore it. When the performClick() is performed by .net framework, it emits an Escape key.
            {
                return;
            }
            if (this.previousKeyEventArgs.Contains(e)) return;
            this.previousKeyEventArgs.Add(e);
            //[[A special combination is for QA Test Automation. If the combination QAUTO is pressed
            //is pressed, then generate the text and store the text in the clipboard of the user and 
            //return from here
            if (CheckKeyCombination("QAUTO"))
            {
                CopyAutomationCodeInClipBoard();
                this.previousKeyEventArgs.Clear();
                return;
            }
            //]]
            //[[A special combination is for showing up log file. If the combination LOGS (stands for show log) is pressed, then show the log file in notepad
            if (CheckKeyCombination("LOG"))
            {
                Process.Start(Logger.LogFilePath);
                this.previousKeyEventArgs.Clear();
                return;
            }
            //]]
            //[[A special combination (P107) is for resizing the application screen to 1024*768 pixels. 
            if (CheckKeyCombination("P107"))
            {
                this.WindowState = FormWindowState.Normal;
                this.Size = new Size(1024, 768);
                this.previousKeyEventArgs.Clear();
                return;

            }
            //]]

            ///[[LOGIC: Now search for a menu item whose placement in the menu structure is such that
            //the set of key args match with the control accessor keys of the menu hiararchy.
            //this.MainMenuStrip.
            //
            //The logic is to loop through the collected key event args in previouskeyEventArgs
            //and for each arg in this list see if there is a corresponding menu item.
            //
            //If an ACTIONABLE menu item is found fire the click event on that and clear the 
            //previousKeyEventArg list and return
            //
            //If  found a menu item which has further dropdown items (basically a group)
            //then further drill down by choosing next eventArgs and drill down in that group
            //If not found, just return. DONT CLEAR THE EVNET ARGS AS THE USER HAS STILL PRESSED THE CTRL KEY
            //]]
            ToolStripMenuItem correspondingItem = null;
            foreach (KeyEventArgs args in previousKeyEventArgs)
            {
                correspondingItem = GetCorrespondingToolStripMenuItem(args, correspondingItem);
                if (correspondingItem == null) return;
                if (correspondingItem.DropDownItems == null || correspondingItem.DropDownItems.Count == 0)
                {
                    correspondingItem.PerformClick();
                    this.previousKeyEventArgs.Clear();
                    //e.Handled = true; //asserting that this event has been handled
                    return;
                }
                if (correspondingItem.DropDownItems.Count > 0)
                {
                    //e.Handled = true; //asserting that this event has been handled.
                    continue;
                }
            }

        }

        

        private void CopyAutomationCodeInClipBoard()
        {
            if (this.ActiveChild == null)
            {
                return;
            }
            List<Control> lstControls = new List<Control>();
            UtilityManager.GetAllControlsInContainer(this.ActiveChild, lstControls);
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(@"using System;
                            using System.Collections.Generic;
                            using System.Linq;
                            using System.Text;
                            using DCC.UMB.TAF.View;
                            ");
            string strNamespace = this.ActiveChild.GetType().Namespace;
            string className = this.ActiveChild.GetType().Name;
            string packageId = GlobalAppVariables.AppContext.PackageId;
            strNamespace = strNamespace.Replace("." + packageId + ".", "." + packageId + ".Test.");

            sb.AppendLine("namespace " + strNamespace);
            sb.AppendLine("{");//begin of namespace
            sb.AppendLine(string.Format("public class {0} : TAFAbstractScreen",className));
            sb.AppendLine("{");//begin of class
            sb.Append("public "+className+@"(White.Core.Application application,  string[] menuPath)
                            : base(application, menuPath)
                        {

                        }
                    ");
            foreach (Control control in lstControls)
            {
                if (typeof(IUIAutomationCodeProvider).IsAssignableFrom(control.GetType()))
                {
                    sb.Append(((IUIAutomationCodeProvider)control).GetAutomationCode());
                    sb.AppendLine();
                }
                else if (control.GetType() == typeof(Button))
                {
                    string template = "public TAFButton uiAutomationId{get{return this.GetButton(\"uiAutomationId\");}}";
                    template = template.Replace("uiAutomationId", control.Name);
                    sb.Append(template);
                    sb.AppendLine();
                }
            }
            sb.AppendLine("}");//end of class
            sb.AppendLine("}");//end of namespace
            Clipboard.SetText(sb.ToString());
        }

        private bool CheckKeyCombination(string combination)
        {
            //foreach (KeyEventArgs arg in previousKeyEventArgs)
            char[] arr = new char[previousKeyEventArgs.Count];
            for (int i = 0; i < previousKeyEventArgs.Count; i++)
            {
                arr[i] = (char)previousKeyEventArgs[i].KeyValue;
            }
            string shortCutStirng = new string(arr);
            return string.Compare(shortCutStirng, combination, true) == 0;
        }


        private ToolStripMenuItem GetCorrespondingToolStripMenuItem(KeyEventArgs args,
                                                                    ToolStripMenuItem correspondingItem)
        {
            if (correspondingItem == null)
            {
                foreach (ToolStripMenuItem item in this.MainMenuStrip.Items)
                {
                    if (item.GetType() == typeof(DCCToolStripMenuItem) ||
                        item.GetType() == typeof(DCCToolStripMenuItemGroup))
                    {
                        if ((int)(((DCCMenuInterface)item).GetControlkeyAccessor()) == args.KeyValue)
                        {
                            return item;
                        }
                    }
                }
            }
            else
            {
                foreach (ToolStripMenuItem item in correspondingItem.DropDownItems)
                {
                    if (item.GetType() == typeof(DCCToolStripMenuItem) ||
                        item.GetType() == typeof(DCCToolStripMenuItemGroup))
                    {
                        if ((int)(((DCCMenuInterface)item).GetControlkeyAccessor()) == args.KeyValue)
                        {
                            return item;
                        }
                    }
                }
            }
            return null;
        }

        public void SetStatusText(string text)
        {
            this.currentStatusLabel.Text = text == string.Empty ? "Ready" : text;
        }
        public string StatusText
        {
            set { this.currentStatusLabel.Text = string.IsNullOrEmpty(value) ? "Ready" : value; }
            get { return this.currentStatusLabel.Text; }
        }

        private void MDIMain_MdiChildActivate(object sender, EventArgs e)
        {
            SetMDIMainForActiveChild();
        }

        private void SetMDIMainForActiveChild()
        {
            AbstractScreen activatedChild = (AbstractScreen)GlobalAppVariables.ObjMDIMain.ActiveMdiChild;
            if (activatedChild == null) return;
            //[[Invoking to make sure that the application id is implemented in the Child Screen. 
            //Otherise the implementation in the AbstractScreen will automatically throw an error.
            string applicationId = activatedChild.ApplicationId;
            if (string.IsNullOrEmpty(applicationId))
            {
                throw new Exception("Application Id can't be null for an activating child!!");
            }
            //]]

            UIModes uiMode = activatedChild.CurrentUIMode;
            this.SetUIMode(uiMode);

            ///[[Check if the activated child is in List or in Browse mode, then set the 
            /// local variable retrivalGrid to the reference of the ListViewGrid of the child screen
            if (uiMode == UIModes.List || uiMode == UIModes.Browse || uiMode==UIModes.Update)
            {
                this.SetRetrivalGrid(activatedChild.ListViewGrid);
                //[[Now set the navigation buttons status based upon the current record and the total number of records available
                EnableDisableNavigationButtons(this.retrivalGrid.CurrentRowIndex);
                //]]
            }
            ///]]
        }

        #region Mode Settings of MDI Main
        private void SetUIMode(UIModes uiMode)
        {
            Logger.Debug(string.Format("Setting UIMode of the application environment to {0} mode", uiMode));
            UIManager.ClearMessageBar();
            //Set the mode to none mode first
            SetUIModeForNoneMode();
            //]]
            switch (uiMode)
            {
                case UIModes.Insert:
                    SetUIModeForInsertMode();
                    break;
                case UIModes.Query:
                    SetUIModeForQueryMode();
                    break;
                case UIModes.Retrieve:
                    SetUIModeForRetrieveMode();
                    break;
                case UIModes.Browse:
                    SetUIModeForBrowseMode();
                    break;
                case UIModes.List:
                    SetUIModeForListMode();
                    break;
                case UIModes.New:
                    SetUIModeForNewMode();
                    break;
                case UIModes.Update:
                    SetUIModeForUpdateMode();
                    break;
                case UIModes.Reference:
                    SetUIModeForReferenceMode();
                    break;
                case UIModes.Params:
                    SetUIModeForParamsMode();
                    break;
                case UIModes.Report:
                    SetUIModeForReportMode();
                    break;
                case UIModes.Tabular:
                    SetUIModeForTabularMode();
                    break;
                case UIModes.None:
                    SetUIModeForNoneMode();
                    break;
                default:
                    throw new Exception("Invalid UI Mode passed");
            }
            this.SetModeOfStatusBar();
            Logger.Debug(string.Format("UIMode of the application environment set to {0} mode", uiMode));
        }

        private void SetModeOfStatusBar()
        {
            ////[[ first set the lables to blank.
            this.lblScreenIdStatus.Text = string.Empty;
            this.lblWindowModeStatus.Text = string.Empty;
            ///]]

            AbstractScreen activatedChild = (AbstractScreen)GlobalAppVariables.ObjMDIMain.ActiveMdiChild;
            if (activatedChild == null)
            {
                return;
            }

            UIModes uiMode = activatedChild.CurrentUIMode;

            ////[[Now set the text of the labels accouring to the settings of the current form
            this.lblScreenIdStatus.Text = activatedChild.CurrentUIMode == UIModes.Report ? "Report" : activatedChild.ScreenId;

            if (uiMode == UIModes.Browse)
            {
                SetRecordCounterForBrowseMode(uiMode);
            }
            else
            {
                this.lblWindowModeStatus.Text = uiMode.ToString();
            }
            ///]]
        }

        private void SetRecordCounterForBrowseMode(UIModes uiMode)
        {
            string format = new string('0', this.retrivalGrid.Rows.Count.ToString().Length);
            if (this.ActiveChild.BrowseModeDataReader == null ||
                this.ActiveChild.BrowseModeDataReader.IsClosed)
            {
                this.lblWindowModeStatus.Text =
                    string.Format("{0} [ {1} / {2} ]", uiMode.ToString(),
                                  (this.retrivalGrid.CurrentRowIndex + 1).ToString(format),
                                  this.retrivalGrid.Rows.Count.ToString(format));
            }
            else
            {
                this.lblWindowModeStatus.Text =
                    string.Format("{0} [ {1} / {2} ]", uiMode.ToString(),
                                  (this.retrivalGrid.CurrentRowIndex + 1).ToString(format),
                                  this.retrivalGrid.Rows.Count.ToString(format) + "++");
            }
        }

        private void SetUIModeForTabularMode()
        {
            this.saveToolStripButton.Enabled = true &&
                                               this.IsUpdateOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);
            this.saveToolStripButton.Enabled = this.saveToolStripButton.Enabled;

            this.closeToolStripButton.Enabled = true;
        }

        private void SetUIModeForListMode()
        {
            this.insertToolStripButton.Enabled = true &&
                                                       IsInsertOperationPermittedToThisApplicationContext(
                                                           this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);

            this.newToolStripMenuItem.Enabled = true;

            this.referenceToolStripMenuItem.Enabled = true;

            this.queryToolStripButton.Enabled = true &&
                                                this.IsSelectOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);


            this.browseToolStripMenuItem.Enabled = true;
            this.listToolStripButton.Enabled = true;

            this.closeToolStripButton.Enabled = true;
            this.listToolStripButton.Text = "Brws";


            this.browseToolStripMenuItem.Enabled = true;
            this.listToolStripMenuItem1.Enabled = false;

            this.exportToExcelToolStripButton.Enabled = EnableReportExport;
        }

        private void SetUIModeForNoneMode()
        {
            ///[[first disalbe all the menu items and toolbar buttons
            foreach (ToolStripItem item in this.tblStripMain.Items)
            {
                item.Enabled = false;
            }
            foreach (ToolStripItem item in this.operationsToolStripMenuItem.DropDownItems)
            {
                item.Enabled = false;
            } //]]
            ///[[now enable the exit toolbar and exit menu item as this will remain active in all the modes
            this.exitToolStripButton.Enabled = true;
            //]]

            //[[Hide the Actions Menu, as it should be shown only in browse mode
            this.mnuStrpMain.Items.Remove(this.dccScreenActionsToolStripItem);
            //]]

            //[[Reset the list/browse toggle item to "List  "
            this.listToolStripButton.Text = "List  ";
            //]]
        }

        private void SetUIModeForReportMode()
        {
            this.closeToolStripButton.Enabled = true;
        }

        private void SetUIModeForParamsMode()
        {
            this.eraseToolStripButton.Enabled = true;

            this.closeToolStripButton.Enabled = true;

            this.printToolStripButton.Enabled = true &&
                GlobalAppVariables.AppContext.IsPrintSupported(ActiveChild.ScreenId, GlobalAppVariables.AppContext.ApplicationId) &&
                GlobalAppVariables.AppContext.IsPrintGranted(ActiveChild.ScreenId, GlobalAppVariables.AppContext.ApplicationId);

            this.previewToolStripButton.Enabled = true &&
                GlobalAppVariables.AppContext.IsPrintSupported(ActiveChild.ScreenId, GlobalAppVariables.AppContext.ApplicationId) &&
                GlobalAppVariables.AppContext.IsPrintGranted(ActiveChild.ScreenId, GlobalAppVariables.AppContext.ApplicationId);

        }

        private void SetUIModeForReferenceMode()
        {
            this.closeToolStripButton.Enabled = true;
        }

        private void SetUIModeForUpdateMode()
        {
            this.saveToolStripButton.Enabled = true &&
                                               this.IsUpdateOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);


            this.newToolStripMenuItem.Enabled = true;
            this.referenceToolStripMenuItem.Enabled = true;
            this.closeToolStripButton.Enabled = true;
        }

        private void SetUIModeForNewMode()
        {
            this.saveToolStripButton.Enabled = true &&
                                                 this.IsInsertOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);

            this.newToolStripMenuItem.Enabled = true;
            this.referenceToolStripMenuItem.Enabled = true;

            this.eraseToolStripButton.Enabled = true;

            this.closeToolStripButton.Enabled = true;
        }

        private void SetUIModeForQueryMode()
        {
            this.insertToolStripButton.Enabled = true &&
                                                       this.IsInsertOperationPermittedToThisApplicationContext(
                                                           this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);

            this.retrieveToolStripButton.Enabled = true;

            this.eraseToolStripButton.Enabled = true;

            this.closeToolStripButton.Enabled = true;
        }

        private void SetUIModeForRetrieveMode()
        {
            this.closeToolStripButton.Enabled = true;
        }

        private void SetUIModeForBrowseMode()
        {
            this.saveToolStripButton.Enabled = true &&
                                               this.IsUpdateOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);



            this.insertToolStripButton.Enabled = true &&
                                                       this.IsInsertOperationPermittedToThisApplicationContext(
                                                           this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);

            this.newToolStripMenuItem.Enabled = true;

            this.referenceToolStripMenuItem.Enabled = true;

            this.queryToolStripButton.Enabled = true &&
                                                this.IsSelectOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);



            this.deleteToolStripButton.Enabled = true &&
                                                 this.IsDeleteOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);


            this.listToolStripButton.Enabled = true;
            this.browseToolStripMenuItem.Enabled = true;

            this.closeToolStripButton.Enabled = true;
            this.listToolStripButton.Text = "List  ";

            this.browseToolStripMenuItem.Enabled = false;
            this.listToolStripMenuItem1.Enabled = true;


            this.printToolStripButton.Enabled = true && this.IsPrintOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);

        }

        private void SetUIModeForInsertMode()
        {
            this.saveToolStripButton.Enabled = true &&
                                               this.IsInsertOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);

            this.newToolStripMenuItem.Enabled = true;
            this.referenceToolStripMenuItem.Enabled = true;

            this.queryToolStripButton.Enabled = true &&
                                                this.IsSelectOperationPermittedToThisApplicationContext(this.ActiveChild.ScreenId, this.ActiveChild.ApplicationId);


            this.eraseToolStripButton.Enabled = true;
            this.closeToolStripButton.Enabled = true;
        }

        #endregion // Mode Settings of MDI Main

        #region Loading Menus to MDI Main

        private void LoadActionMenus(List<KeyValuePair<string, short>> lstRelevantGrantedActions)
        {
            //[[if current screen is not in browse mode then return
            if (!(
                    (this.ActiveChild.CurrentUIMode == UIModes.Browse) ||
                    (this.ActiveChild.CurrentUIMode == UIModes.Update)
                )
               )
            {
                return;
            }
            if (this.ActiveChild.ListViewGrid.CurrentCell == null) return;
            //]]
            //[[Check for the existance of "Actions" menu. If it does not exist, then add it just before 
            //windows menu. If it exists, then remove all its sub menus and add the menus as have been
            //sent as parameter.
            if (dccScreenActionsToolStripItem == null)
            {
                this.dccScreenActionsToolStripItem = new ToolStripMenuItem("Actions");
            }
            //]]
            //[[Remove the Action Menu from the main menu. Add it only if it has sub menus.
            this.mnuStrpMain.Items.Remove(this.dccScreenActionsToolStripItem);
            //]]

            //[[Now remove all previously added sub menus to Action menu, and add the newly 
            //Evaluated list of Menus
            this.dccScreenActionsToolStripItem.DropDownItems.Clear();
            foreach (KeyValuePair<string, short> actionName in lstRelevantGrantedActions)
            {
                ToolStripMenuItem actionMenuItem = new ToolStripMenuItem(actionName.Key);
                //actionMenuItem.Tag = this.ActiveChild.DoesActionCauseReloadOfCurrentRecordInBrowseMode(actionName.Key);
                actionMenuItem.Name = actionName.Key;
                actionMenuItem.Click += new EventHandler(actionMenuItem_Click);
                actionMenuItem.ShortcutKeys = (Keys)Enum.Parse(typeof(Keys), "F" + actionName.Value);
                this.dccScreenActionsToolStripItem.DropDownItems.Add(actionMenuItem);
            }
            //]]

            //[[If passed in list of actions is null or is empty, then no need of showing the Actions Menu to the user
            if (this.dccScreenActionsToolStripItem.DropDownItems.Count > 0)
            {
                this.mnuStrpMain.Items.Insert(this.mnuStrpMain.Items.Count - 1, this.dccScreenActionsToolStripItem);
            }
            //]]
        }

        void actionMenuItem_Click(object sender, EventArgs e)
        {
            if (this.ActiveChild != null)
            {
                Guid txn = Guid.Empty;
                try
                {
                    txn = CursorManager.BeginTransaction("Executing action '" + ((ToolStripMenuItem)sender).Text + "'", true,null);
                   this.ActiveChild.ExecuteScreenAction(((ToolStripMenuItem)sender).Text);
                }
                catch (Exception ex)
                {
                    UIManager.DisposeException(ex);
                }
                finally
                {
                    try
                    {
                        ///[[Now check if the screen is in Browse/Update mode. In that case, the current row of 
                        ///the summary spread must be updated and the detialed view must be refreshed 
                        /// with the correct values from the database. This will also force to load the 
                        /// current transaction timestamp and reset the rowstates (to old) in all the grids
                        /// of the deailed view (if at all there are grids)
                        /// This will be achieved by calling the ChildScreen method GetQueryModeRetrivalResults() 
                        /// which is used to fetch the records in the retrieve mode. Now when user presses save(0
                        /// on this screen, the DCCSQLDataReader will return only one record as different fields of the
                        /// screen are filled and probably the ID field is also filled with data.
                        /// If more records are found, then this block must throw an exception and the child screen
                        /// must implement appropraite plumbing to return appropriate DCCSQLDataReader based upon the 
                        /// mode of the screen.
                        if (this.ActiveChild.CurrentUIMode == UIModes.Browse ||
                            this.ActiveChild.CurrentUIMode == UIModes.Update)
                        {
                            ((ToolStripMenuItem)sender).Tag = this.ActiveChild.DoesActionCauseReloadOfCurrentRecordInBrowseMode(((ToolStripMenuItem)sender).Name);                    
                            if (((ToolStripMenuItem)sender).Tag != null && (bool)((ToolStripMenuItem)sender).Tag == true)
                            {
                                if (this.ActiveChild.CurrentUIMode == UIModes.Browse)////as in update mode, we really dont have to worry about loading the record in gridlist.
                                {
                                    DCCSqlDataReader listModeGridCurrentRowUpdateReader = this.ActiveChild.GetQueryModeRetrivalResults();
                                    DataTable table = ReadNextBucketFromBrowseModeDataReader(listModeGridCurrentRowUpdateReader);
                                    if (table.Rows.Count > 1)
                                    {
                                        throw new DCC.UMB.CDF.MGMT.Modal.DCCException(null, MsgCodes.NoUniqueRecordFound, string.Empty, this.ActiveChild.ScreenId, this.ActiveChild.CurrentUIMode);
                                    }
                                    string currentRowIdentifier = this.ActiveChild.ListViewGrid.CurrentRowIdentifier;
                                    this.ActiveChild.ListViewGrid.UpdateSingleRow(currentRowIdentifier, table, RowStates.Old);
                                    this.ActiveChild.SetCurrentlySelectedRowIndexOfListGrid(this.ActiveChild.ListViewGrid.CurrentRowIndex, true);
                                }
                            }
                        }
                        /// ]]
                        this.LoadActionMenus(this.ActiveChild.GetRelevantGrantedActions());
                    }
                    catch (Exception ex1)
                    {
                        UIManager.DisposeException(ex1);
                        //throw;
                    }
                    CursorManager.EndTransaction(txn);
                }
            }
        }

        /// <summary>
        /// This method loads the application menu-groups and sub-menus there in.
        /// </summary>
        /// <param name="menuClickEventHandler"></param>
        private void LoadApplicationMenus(DCCToolStripItemClicked menuClickEventHandler)
        {
            Logger.Debug("Loading application menus..");
            DataTable menuGroupTable = GlobalAppVariables.AppContext.PackageMenusGroupsTable;
            DataView topMenuItemsView =
                new DataView(menuGroupTable, "parent_menu_group_id is null", "display_order",
                             DataViewRowState.CurrentRows);
            foreach (DataRowView drv in topMenuItemsView)
            {
                AddMenuGroups(this.MainMenuStrip.Items, drv, menuGroupTable, menuClickEventHandler);
            }
            DataTable menuItemsTable = GlobalAppVariables.AppContext.PackageMenusTable;
            foreach (DataRow row in menuItemsTable.Rows)
            {
                AddMenuItem(row, menuClickEventHandler);
            }
            Logger.Debug("Application menus loaded");
        }

        private void AddMenuItem(DataRow row, DCCToolStripItemClicked menuClickEventHandler)
        {
            //group_id, menu_nm, menu_desc, screen_params, ctrl_key_accessor, display_order
            string groupId = DbManager.GetString(row["menu_group_id"]);
            string menuName = DbManager.GetString(row["menu_nm"]);
            string menuDesc = DbManager.GetString(row["menu_dsc"]);
            char controlKeyAccessor = DbManager.GetChar(row["ctrl_key_accessor"]);
            int displayOrder = DbManager.GetInteger(int.Parse(row["display_order"].ToString()));

            DCCToolStripMenuItem item =
                new DCCToolStripMenuItem(groupId, menuName, menuDesc, controlKeyAccessor, displayOrder,
                                         menuClickEventHandler);

            DCCToolStripMenuItemGroupPredicate predicate = new DCCToolStripMenuItemGroupPredicate();
            predicate.GroupId = groupId;

            DCCToolStripMenuItemGroup parentMenuGroup =
                this.lstToolStripMenuItemGroups.Find(predicate.Compare);

            if (parentMenuGroup == null)
            {
                throw new Exception("Parent Group of this menu item " + item.Text + " not found");
            }
            parentMenuGroup.DropDownItems.Add(item);
            item.SetShortcutKeyDisplayText(GetShortCutKeyDisplayText(item.ControlKeyAccessor, parentMenuGroup));
        }

        private string GetShortCutKeyDisplayText(char controlKeyAccessor, DCCToolStripMenuItemGroup parentMenuGroup)
        {
            string shortcutKeyPrefix = "Ctrl+";
            if (controlKeyAccessor == '\0') return null;
            Stack<char> accessors = new Stack<char>();

            StringBuilder sb = new StringBuilder();
            sb.Append(shortcutKeyPrefix);
            accessors.Push(controlKeyAccessor);
            DCCToolStripMenuItemGroupPredicate predicate = new DCCToolStripMenuItemGroupPredicate();
            while (parentMenuGroup != null)
            {
                //sb.Append(parentMenuGroup.ControlKeyAccessor.ToString() + ", ");
                char intermediateAccessorKey = parentMenuGroup.ControlKeyAccessor;
                if (intermediateAccessorKey == '\0') return null;
                accessors.Push(intermediateAccessorKey);
                predicate.GroupId = parentMenuGroup.ParentGroupId;
                if (!string.IsNullOrEmpty(parentMenuGroup.ParentGroupId))
                {
                    parentMenuGroup = this.lstToolStripMenuItemGroups.Find(predicate.Compare);
                }
                else
                {
                    parentMenuGroup = null;
                }
            }
            int count = accessors.Count;
            for (int i = 0; i < count; i++)
            {
                sb.Append(accessors.Pop() + ", ");
            }
            string returnString = sb.ToString().Trim();
            if (returnString == shortcutKeyPrefix) return null;
            if (returnString.EndsWith(","))
            {
                returnString = returnString.Substring(0, returnString.Length - 1);
            }
            return returnString;
        }

        private void AddMenuGroups(ToolStripItemCollection parentCollection, DataRowView currentMenuItemDetails,
                                   DataTable menuGroupTable, DCCToolStripItemClicked menuClickEventHandler)
        {
            //group_id, package_id, parent_group_id, group_nm, group_desc, ctrl_key_accessor, display_order

            DCCToolStripMenuItemGroup item =
                new DCCToolStripMenuItemGroup(DbManager.GetString(currentMenuItemDetails["menu_group_id"]),
                                              DbManager.GetString(currentMenuItemDetails["parent_menu_group_id"]),
                                              DbManager.GetString(currentMenuItemDetails["menu_group_nm"]),
                                              DbManager.GetString(currentMenuItemDetails["menu_group_dsc"]),
                                              DbManager.GetChar(currentMenuItemDetails["ctrl_key_accessor"]));

            lstToolStripMenuItemGroups.Add(item);
            if (parentCollection == this.MainMenuStrip.Items)
            {
                parentCollection.Insert(parentCollection.Count - 1, item);
            }
            else
            {
                parentCollection.Add(item);
            }
            string itemGroupId = currentMenuItemDetails["menu_group_id"].ToString();
            DataView view =
                new DataView(menuGroupTable, "parent_menu_group_id='" + itemGroupId + "'", "display_order",
                             DataViewRowState.CurrentRows);
            foreach (DataRowView drv in view)
            {
                AddMenuGroups(item.DropDownItems, drv, menuGroupTable, menuClickEventHandler);
            }
        }

        #endregion // Loading Menus to MDI Main

        #region Static Menu Items' Click event handlers

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Saving the screen data...", true, this.tblStripMain);
                SaveCurrentScreen();
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }



        /// <summary>
        /// This method triggers the actions to save the current screen. 
        /// First a call to IsReadyToSave() is made, if this call returns true,
        /// then Save() method of the current screen is invoked.
        /// </summary>
        public void SaveCurrentScreen()
        {
            //[[Before starting the save sequence, clear any message being shown to the user
            UIManager.ClearMessageBar();
            //]]
            if (this.ActiveChild.Validate() && this.ActiveChild.ValidateAllControlsofContainer(this.ActiveChild) && this.ActiveChild.IsReadyToSave())
            {
                this.ActiveChild.Save();
                ///[[Now check if the screen is in Browse mode and is not chained up. In that case, the current row of 
                ///the summary spread must be updated and the detialed view must be refreshed 
                /// with the correct values from the database. This will also force to load the 
                /// current transaction timestamp and reset the rowstates (to old) in all the grids
                /// of the deailed view (if at all there are grids)
                /// This will be achieved by calling the ChildScreen method GetQueryModeRetrivalResults() 
                /// which is used to fetch the records in the retrieve mode. Now when user presses save(0
                /// on this screen, the DCCSQLDataReader will return only one record as different fields of the
                /// screen are filled and probably the ID field is also filled with data.
                /// If more records are found, then this block must throw an exception and the child screen
                /// must implement appropraite plumbing to return appropriate DCCSQLDataReader based upon the 
                /// mode of the screen.
                if (this.ActiveChild.CurrentUIMode == UIModes.Browse && !this.ActiveChild.ChainedUp)
                {
                    DCCSqlDataReader listModeGridCurrentRowUpdateReader = this.ActiveChild.GetQueryModeRetrivalResults();
                    DataTable table = ReadNextBucketFromBrowseModeDataReader(listModeGridCurrentRowUpdateReader);
                    if (table.Rows.Count > 1)
                    {
                        throw new DCC.UMB.CDF.MGMT.Modal.DCCException(null, MsgCodes.NoUniqueRecordFound, string.Empty, this.ActiveChild.ScreenId, this.ActiveChild.CurrentUIMode);
                    }
                    string currentRowIdentifier = this.ActiveChild.ListViewGrid.CurrentRowIdentifier;
                    this.ActiveChild.ListViewGrid.UpdateSingleRow(currentRowIdentifier, table, RowStates.Old);
                    this.ActiveChild.SetCurrentlySelectedRowIndexOfListGrid(this.ActiveChild.ListViewGrid.CurrentRowIndex, true);
                    //[[Now that the screen is showing the appropriate record in browse view
                    //Load the appropriate actions for the current record.
                    this.LoadActionMenus(this.ActiveChild.GetRelevantGrantedActions());
                    //]]
                }
                /// ]]
                ///[[Now if the screen being saved is in Update or in New mode, then we will need
                /// to close this screen and remove it from the calling chain stack
                if (this.ActiveChild != null &&
                               this.ActiveChild.ChainedUp)
                {
                    //[[Get the lookup results from the current screen, as it is opened in calling chain, on the top
                    //of some other screen. Then close this screen and remove the link corresponding to this screen
                    //from the chain and return the lookupResult to the below link.
                    //Since both the screens (the one being closed and the one below it) are both
                    //implementations of ILink interface, called the method of this interface to 
                    //get the LookupResult and to set the result.
                    LookupResult result = this.ActiveChild.GetLookupResult();
                    if (result != null)
                    {
                        result.ReturnMode = LookupReturnModes.Select;
                    }
                    Link currentScreenLink = UIManager.GetLinkOfType(this.ActiveChild.GetType());
                    Link linkBelowThisScreen = UIManager.RemoveLinkFromChain(this.ActiveChild);
                    CloseCurrentScreen();
                    linkBelowThisScreen.CalledScreen.SetLookupResult(result, currentScreenLink.CallingControl);
                    return;//as the screen is closed, and the active screen is different now.
                }
                /// ]]
                ///[[If the screen being saved is in insert mode, then after successful save the 
                /// screen must reopen itself  in insert mode
                //Also as the showscreen() would set the message text to blank which might have been showing the "successful save msg", we need to show that again to user.
                //so preserve the existing message.
                if (this.ActiveChild != null && this.ActiveChild.CurrentUIMode == UIModes.Insert)
                {
                    string existingMessageToUser = this.lblMessageBar.CurrentMessageText;
                    MessageTypes existingMessageType = this.lblMessageBar.CurrentMessageType;
                    this.ActiveChild.ShowScreen(UIModes.Insert, this.ActiveChild.ScreenParameters);
                    this.lblMessageBar.SetMessageText(existingMessageToUser, existingMessageType, string.Empty);
                }
                /// ]]
            }
        }



        private void insertModeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Switching to Insert Mode...", true,this.tblStripMain);
                FireInsertMode();
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        public void FireInsertMode()
        {
            if (ActiveChild != null && ActiveChild.IsReadyToSwitchMode(ActiveChild.CurrentUIMode, UIModes.Insert))
            {
                ChangeModeAndSetMenusAccoudingly(UIModes.Insert);
                ActiveChild.ClearControlsAndSetLooksAsPerCurrentMode(false);
                ActiveChild.ShowScreen(UIModes.Insert, null);
            }
        }
        public void FireQueryMode()
        {
            this.FireQueryMode(false);
        }

        private void FireQueryMode(bool retainSearchCriteria)
        {
            if (ActiveChild != null && ActiveChild.IsReadyToSwitchMode(ActiveChild.CurrentUIMode, UIModes.Query))
            {
                ActiveChild.RetainSearchCriteria = retainSearchCriteria;
                ChangeModeAndSetMenusAccoudingly(UIModes.Query);
                if (!retainSearchCriteria)
                {
                    ActiveChild.ClearControlsAndSetLooksAsPerCurrentMode(true);
                }
                this.ActiveChild.ShowScreen(UIModes.Query, null);
            }
        }
        private void FireDelete()
        {
            if (ActiveChild != null)
            {
                if (!ActiveChild.IsReadyToDelete())
                {
                    return;
                }
                if (!UtilityManager.IsTAFEnvironment())
                {
                    DialogResult result = MessageBox.Show(this,
                                                          ActiveChild.DeleteMessage,
                                                          "Confirm Delete",
                                                          MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation,
                                                          MessageBoxDefaultButton.Button1);
                    if (result == DialogResult.No)
                    {
                        return;
                    }
                }
                
                //[[Sometimes the screen is responsible for deleting portions of the currently 
                //viewed record. In this case the record should not be deleted from the listViewGrid
                bool removeRecordFromListViewGrid = true;
                ActiveChild.DeleteRecord(ref removeRecordFromListViewGrid);

                ///[[Now if the active child has deleted the record susscessfully (qualified by no exception raised)
                /// Then the ListView Grid must delete this record. So that the next record can be populated in the browse mode.
                if (removeRecordFromListViewGrid)
                {
                    this.ActiveChild.ListViewGrid.DeleteRow();
                }
                if (this.ActiveChild.ListViewGrid.RowCount > 0)
                {
                    this.ActiveChild.SetCurrentlySelectedRowIndexOfListGrid(this.ActiveChild.ListViewGrid.CurrentRowIndex, true);
                }
                else
                {
                    if (!UtilityManager.IsTAFEnvironment())
                    {
                        MessageBox.Show(this, "Successfully deleted! No active record to be browsed! Switching to Query mode automatically.",
                                          "CDF Information!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    this.FireQueryMode();
                }
                ///]]
            }
        }

        private void ChangeModeAndSetMenusAccoudingly(UIModes mode)
        {
            ActiveChild.CurrentUIMode = mode;
            MDIMain_MdiChildActivate(null, null);

        }

        private void newToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void referenceToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void queryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Switching to Query Mode...", true,this.tblStripMain);
                FireQueryMode();
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }


        private void getToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Switching to Retrieve Mode...", true,this.tblStripMain);
                FireRetrieveMode();
            }
            catch (Exception ex)
            {
                this.FireQueryMode();
                UIManager.DisposeException(ex);                
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }
        public void FireRetrieveMode()
        {
            //[[This would fire the validating event on the last control having foucs on the screen. 
            //(e.g. the datetime validating event would cause set of the datetime value)
            if (!this.ActiveChild.Validate() || !this.ActiveChild.IsReadyToRetrieve())
            {
                return;
            }
            //]]
            UIModes currentModeOfActiveScreen = this.ActiveChild.CurrentUIMode;
            ChangeModeAndSetMenusAccoudingly(UIModes.Retrieve);
            switch (currentModeOfActiveScreen)
            {
                case UIModes.Insert:
                case UIModes.Retrieve:
                case UIModes.Browse:
                case UIModes.List:
                case UIModes.New:
                case UIModes.Params:
                case UIModes.Report:
                case UIModes.Tabular:
                case UIModes.None:
                    throw new Exception("How did you come here");
                    break;
                case UIModes.Query:
                    RetrieveRecordsAndSwitchToMode(UIModes.Browse);
                    break;
                case UIModes.Update:
                    RetrieveRecordsAndSwitchToMode(UIModes.Update);
                    break;
                case UIModes.Reference:
                    RetrieveRecordsAndSwitchToMode(UIModes.Reference);
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        private void EnableDisableNavigationButtons(int index)
        {
            if (this.retrivalGrid.Rows.Count == 0)
            {
                ///[[Toolbar items
                this.backToolStripButton.Enabled = false;
                this.firstToolStripButton.Enabled = false;
                this.nextToolStripButton.Enabled = false;
                this.lastToolStripButton.Enabled = false;
                ///]]
                return;
            }
            this.backToolStripButton.Enabled = !IsListGridFirstRow() &&
                                                this.retrivalGrid.Rows.Count > 0;
            this.firstToolStripButton.Enabled = !IsListGridFirstRow() &&
                                                this.retrivalGrid.Rows.Count > 0;
            this.nextToolStripButton.Enabled = !IsListGridLastRow() &&
                                                this.retrivalGrid.Rows.Count > 0;
            this.lastToolStripButton.Enabled = !IsListGridLastRow() &&
                                                this.retrivalGrid.Rows.Count > 0;
        }

        private void firstToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Selecting first record from query results...", true, this.tblStripMain);
                if (this.retrivalGrid.Rows.Count > 0)
                {
                    this.retrivalGrid.SetCurrentRow(0);
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }

        }

        private void backwardToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;            
            this.backToolStripButton.Enabled = false;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Selecting previous record from query results...", true, this.tblStripMain);
                if (this.retrivalGrid.Rows.Count > 0 && this.retrivalGrid.CurrentRowIndex != 0)
                {
                    this.retrivalGrid.SetCurrentRow(this.retrivalGrid.CurrentRowIndex - 1);
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void forwardToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.nextToolStripButton.Enabled = false;
            Console.WriteLine("Starting Fetch: " + DateTime.Now.ToLongTimeString());
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Selecting next record from query results...", true, this.tblStripMain);
                if (this.retrivalGrid.Rows.Count > 0 && this.retrivalGrid.CurrentRowIndex != this.retrivalGrid.Rows.Count - 1)
                {
                    this.retrivalGrid.SetCurrentRow(this.retrivalGrid.CurrentRowIndex + 1);
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);            
            }
            Console.WriteLine("Fetch Complete: " + DateTime.Now.ToLongTimeString());
        }

        private void lastToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Selecting last record from query results...", true, this.tblStripMain);
                if (this.retrivalGrid.Rows.Count > 0)
                {
                    this.retrivalGrid.SetCurrentRow(this.retrivalGrid.Rows.Count - 1);
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void deleteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Deleting this record...", true, this.tblStripMain);
                FireDelete();
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }



        private void listToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Toggling List/Browse mode ...", true, this.tblStripMain);
                if (this.listToolStripButton.Text == "List  ")
                {
                    FireListMode();
                    this.listToolStripButton.Text = "Brws";
                }
                else
                {
                    FireBrowseMode();
                    this.listToolStripButton.Text = "List  ";
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void FireBrowseMode()
        {
            ChangeModeAndSetMenusAccoudingly(UIModes.Browse);
        }

        public void FireListMode()
        {
            ChangeModeAndSetMenusAccoudingly(UIModes.List);
        }

        private void browseToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Toggling List/Browse mode ...", true, this.tblStripMain);
                if (this.listToolStripButton.Text == "List  ")
                {
                    FireListMode();
                    this.listToolStripButton.Text = "Brws";
                }
                else
                {
                    FireBrowseMode();
                    this.listToolStripButton.Text = "List  ";
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void previewToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void printToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Selecting last record from query results...", true, this.tblStripMain);
                FirePrint();
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }

        }
        public void FireWebReportPrint()
        {
            FirePrint(true);
        }
        public void FirePrint()
        {
            FirePrint(false);
        }

        public void FirePrint(bool isWebReportPrint)
        {
            if (this.ActiveChild == null)
            {
                return;
            }
            AbstractParametersScreen parameterScreen = (AbstractParametersScreen)this.ActiveChild;
            //[[Now at this point, the parameters screen has all the parameters filled in
            //and user is ready to get the report
            bool isReadyToPrint = parameterScreen.IsReadyToPrint() &&
                                  parameterScreen.ValidateAllControlsofContainer(parameterScreen);
            if (!isReadyToPrint)
            {
                return;
            }
            //]]

            AbstractReportContainer reportContainerScreen = null;
            string reportPath = parameterScreen.ReportPath;
            string reportServerURL = parameterScreen.ReportServerURL;
            if (reportPath.ToUpper().EndsWith(".RPT"))
            {
                reportContainerScreen = new CrystalReportContainer();

            }
            else
            {
                reportContainerScreen = new MSRSReportContainer();
            }
            //[[Set the export option of the target report viewer control
            reportContainerScreen.EnableReportExport = EnableReportExport;
            //]]
            reportContainerScreen.Text = GlobalAppVariables.AppContext.GetScreenName(ActiveChild.ApplicationId, ActiveChild.ScreenId) + "[Report]";
            reportContainerScreen.ApplicationId = ActiveChild.ApplicationId;
            reportContainerScreen.MdiParent = GlobalAppVariables.ObjMDIMain;
            reportContainerScreen.ParameterValueRequired += parameterScreen.reportContainer_ParameterValueRequired;
            reportContainerScreen.FormulaValueRequired += parameterScreen.reportContainer_FormulaValueRequired;
            reportContainerScreen.ReportDataTableRequired += parameterScreen.reportContainer_DataTableRequired;
            reportContainerScreen.ZoomModeRequired += parameterScreen.reportContainer_ZoomMode;

            if (isWebReportPrint)
            {
                ((CrystalReportContainer)reportContainerScreen).LoadReportPdfFromWeb(reportServerURL, reportPath);
            }
            else
            {
                reportContainerScreen.ShowScreen(UIModes.Report, string.Empty);
                reportContainerScreen.WindowState = FormWindowState.Maximized;
                reportContainerScreen.LoadReport(reportServerURL, reportPath);
            }
        }

        //[[This property holds a flag which will be used to set the export-reprot option of the reportcontainer screen when those are created
        private bool enableReportExport = true;
        public bool EnableReportExport
        {
            get { return enableReportExport; }
            set { this.enableReportExport = value; }
        }
        //]]

        public ToolTip GlobalToolTip
        {
            get { return this.toolTip1; }
        }

        private void eraseToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Clearing up current screen ...", true, this.tblStripMain);
                if (ActiveChild != null)
                {
                    ActiveChild.RetainSearchCriteria = false;
                    ActiveChild.ClearControlsAndSetLooksAsPerCurrentMode(true);
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                UIManager.ClearMessageBar();
                CursorManager.EndTransaction(tranGuid);
            }
        }





        private void closeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.ActiveChild != null &&
                        !this.ActiveChild.IsReadyToClose())
                {
                    Logger.Debug("Screen is not yet ready to be closed");
                    return;
                }
                ///[[Now if the screen being closed is in Update or in New mode, then we will need
                /// to close this screen and remove it from the calling chain stack
                if (this.ActiveChild != null &&
                               this.ActiveChild.ChainedUp)
                {
                    //[[Get the lookup results from the current screen, as it is opened in calling chain, on the top
                    //of some other screen. Then close this screen and remove the link corresponding to this screen
                    //from the chain and return the lookupResult to the below link.
                    //Since both the screens (the one being closed and the one below it) are both
                    //implementations of ILink interface, called the method of this interface to 
                    //get the LookupResult and to set the result.
                    LookupResult result = new LookupResult() { ReturnMode = LookupReturnModes.None };
                    Link currentScreenLink = UIManager.GetLinkOfType(this.ActiveChild.GetType());
                    Link linkBelowThisScreen = UIManager.RemoveLinkFromChain(this.ActiveChild);
                    CloseCurrentScreen();
                    linkBelowThisScreen.CalledScreen.SetLookupResult(result, currentScreenLink.CallingControl);
                    return;//as the screen is closed, and the active screen is different now.
                }
                /// ]]   
                CloseCurrentScreen();
            }
            catch (Exception ex)
            {
                //do nothing, as this screen is closing, and some of the objects might have 
                //been eaten up by GC, or the call chain might have been corrupted coz user closed in wrong sequence.
                
            }
        }

        public void CloseCurrentScreen()
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Closing current screen ...", false, this.tblStripMain);
                if (ActiveChild != null)
                {
                    UIManager.CloseScreen(ActiveChild);
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                try
                {
                    this.SetUIMode(UIModes.None);
                    SetMDIMainForActiveChild();
                }
                finally
                {
                    UIManager.ClearMessageBar();
                    CursorManager.EndTransaction(tranGuid);
                }
            }
        }

        private void exportToExcelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.ActiveChild != null && this.ActiveChild.CurrentUIMode == UIModes.List)
                {
                    DataTable exportedTable = this.ActiveChild.ListViewGrid.ExportGridModelData(false, false);
                    SaveFileDialog dialog = new SaveFileDialog();

                    dialog.OverwritePrompt = true;
                    dialog.Filter = "Excel Files(*.xls)|*.xls";
                    DialogResult result = dialog.ShowDialog();
                    if (result == DialogResult.OK)
                    {
                        string selectedFile = dialog.FileName;
                        UtilityManager.ExportDataTableToExcel(exportedTable, selectedFile);
                        Process.Start(dialog.FileName);
                    }
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
              Application.Exit();

        }

        private void cascadeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.Cascade);
        }

        private void tileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.TileVertical);
        }

        #endregion // Static Menu Items' Click event handlers

        #region Static Toolbar Buttons Click Event Handlers

        private void saveToolStripButton_Click(object sender, EventArgs e)
        {
            this.saveToolStripMenuItem_Click(sender, e);
        }

        private void insertToolStripButton_Click(object sender, EventArgs e)
        {
            this.insertModeToolStripMenuItem_Click(sender, e);
        }

        private void queryToolStripButton_Click(object sender, EventArgs e)
        {
            this.queryToolStripMenuItem_Click(sender, e);
        }

        private void getToolStripButton_Click(object sender, EventArgs e)
        {
            this.getToolStripMenuItem_Click(sender, e);
        }

        private void firstToolStripButton_Click(object sender, EventArgs e)
        {
            this.firstToolStripMenuItem_Click(sender, e);
        }

        private void backToolStripButton_Click(object sender, EventArgs e)
        {
            this.backwardToolStripMenuItem_Click(sender, e);
        }

        private void nextToolStripButton_Click(object sender, EventArgs e)
        {
            this.forwardToolStripMenuItem_Click(sender, e);
        }

        private void lastToolStripButton_Click(object sender, EventArgs e)
        {
            this.lastToolStripMenuItem_Click(sender, e);
        }

        private void listToolStripButton_Click(object sender, EventArgs e)
        {
            this.listToolStripMenuItem_Click(sender, e);
        }

        private void deleteToolStripButton_Click(object sender, EventArgs e)
        {
            this.deleteToolStripMenuItem_Click(sender, e);
        }

        private void previewToolStripButton_Click(object sender, EventArgs e)
        {
            this.previewToolStripMenuItem_Click(sender, e);
        }

        private void toolStripButton7_Click(object sender, EventArgs e)
        {
            this.printToolStripMenuItem_Click(sender, e);
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            this.eraseToolStripMenuItem_Click(sender, e);

        }

        private void closeToolStripButton_Click(object sender, EventArgs e)
        {
            this.closeToolStripMenuItem_Click(sender, e);
        }

        private void excelToolStripButton_Click(object sender, EventArgs e)
        {
            this.exportToExcelToolStripMenuItem_Click(sender, e);
        }

        private void exitToolStripButton_Click(object sender, EventArgs e)
        {
            this.exitToolStripMenuItem_Click(sender, e);
        }

        #endregion // Static Toolbar Buttons Click Event Handlers

        internal MessageBarLabel MessageTextBox
        {
            get { return this.lblMessageBar; }
        }

        #region List-Browse Mode implementation
        ///[[the implementation of List-Browse view is as following
        /// 1. Wheneer a child screen switches to retrive mode, the list view grid
        /// is asked for and the reference is assigned to the variable retrivalGrid in this class.
        /// This is done in method SetRetrivalGrid() where a reference of the listviewgrid of the screen
        /// is assigned to the variable retrivalGrid and also rowSelectionmodified event handler is bound to it 
        /// However the previous event handler is removed from the previous reference.
        /// 2. The same is done when a child screen gets activated and the child screen is in list/browse mode
        /// ]]
        private void RetrieveRecordsAndSwitchToMode(UIModes targetMode)
        {
            this.SetRetrivalGrid(this.ActiveChild.ListViewGrid);//Set the ListViewGrid
            this.retrivalGrid.RowCount = 0;
            DCCSqlDataReader dataReader = this.ActiveChild.GetQueryModeRetrivalResults();//Get the Dataset from the child screen
            this.ActiveChild.BrowseModeDataReader = dataReader;

            //[[Load the initial bucket from the retrival datareader and bind the results with the listview grid
            //while binding, we will say "false" to retainExistingRecords parameter, so as to refresh the list view grid
            //However, while scccessive fetches from datareader, we will keep the records added to the list view grid.
            DataTable table = ReadNextBucketFromBrowseModeDataReader(dataReader);
            retrivalGrid.RetrieveRecords(table, false, RowStates.Old);
            //]]

            ///[[Once the records are retrieved and the count of retrieved records is >0
            ///then we should switch to target mode immediately, else rollback to query mode again
            if (retrivalGrid.RowCount > 0)
            {
                this.ChangeModeAndSetMenusAccoudingly(targetMode);
                try
                {
                    //[[Now set the looks of all the controls on the active child 
                    //[[to that of browse mode
                    this.ActiveChild.ClearControlsAndSetLooksAsPerCurrentMode(false);
                    //]]
                    this.retrivalGrid.SetCurrentRow(0);
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
            else
            {
                //TODO - we are shifting directly to query mode, thus loosing all the query data user might have filled in.
                //the problem can be avoided by having abstract screen a parameter in ShowScreen() method, which tells about 
                //the previous mode. If the previous mode has been Retrieve mode, then the child screen can take action not to 
                //clear the screen when the showScreen() method is invoked. But this implementation is still pending.
                if (targetMode == UIModes.Browse)
                {
                    this.FireQueryMode(true);
                }

                ///[[Show a message to user that no record was found
                UIManager.ShowMessage(MsgCodes.NoMatchFound, string.Empty, MessageTypes.Warning);
                /// ]]
            }
            //]]

        }

        private static DataTable ReadNextBucketFromBrowseModeDataReader(DCCSqlDataReader dataReader)
        {
            try
            {
                DataTable table = new DataTable();
                if (dataReader == null || dataReader.IsClosed)
                {
                    return table;
                }
                return dataReader.ReadNextBucketFromBrowseModeDataReader(GlobalAppVariables.AppContext.BrowseModeRetrivalBucketSize);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void SetRetrivalGrid(DCCGrid grid)
        {
            //[[Check if the UserMode property of the passed grid is set to "Program". If it is any other
            //value than "Program" then throw an error
            if (grid.UserMode != UserModes.Program)
            {
                throw new Exception("UserMode property must be \"Program\" for list view grids");
            }
            //]]

            //If a previous reference is set, make sure that the event handler is removed 
            //from the grid before we loose the old reference of the grid (which might be of some other grid in other screen)
            if (this.retrivalGrid != null)
            {
                this.retrivalGrid.RowSelectionModified -= retrivalGridRowSelectionModifiedHandler;
                retrivalGrid.DoubleClick -= retrivalGridDoubleClickHandler;
            }
            this.retrivalGrid = grid;
            this.retrivalGrid.AllowRowSorting = true;
            retrivalGrid.RowSelectionModified += this.retrivalGridRowSelectionModifiedHandler;
            retrivalGrid.DoubleClick += retrivalGridDoubleClickHandler;
            //[[Now that the screen is showing the appropriate record in browse view
            //Load the appropriate actions for the current record.
            this.LoadActionMenus(this.ActiveChild.GetRelevantGrantedActions());
            //]]
        }

        void retrivalGrid_DoubleClick(object sender, EventArgs e)
        {
            listToolStripMenuItem_Click(null, null);
        }

        void retrivalGrid_RowSelectionModified(object sender, EventArgs e)
        {
            if (this.ActiveChild.CurrentUIMode == UIModes.Browse ||
                this.ActiveChild.CurrentUIMode == UIModes.Reference ||
                this.ActiveChild.CurrentUIMode == UIModes.Update)
            {
                UIManager.ClearMessageBar();
                this.ActiveChild.SetCurrentlySelectedRowIndexOfListGrid(this.ActiveChild.ListViewGrid.CurrentRowIndex, false);
                //[[Now that the screen is showing the appropriate record in browse viee
                //Load the appropriate actions for the current record.
                this.LoadActionMenus(this.ActiveChild.GetRelevantGrantedActions());
                //]]
            }
            //[[Now see if the retrivalGrid's currentRow index has reached 5 less than the max-count 
            //of the records in the grid, then fetch next bucket from the database
            if (this.retrivalGrid.CurrentRowIndex >= this.retrivalGrid.RowCount - 5)
            {
                DataTable table = ReadNextBucketFromBrowseModeDataReader(this.ActiveChild.BrowseModeDataReader);
                retrivalGrid.RetrieveRecords(table, true, RowStates.Old);
            }
            //]]
            //[[Now set the navigation buttons status based upon the current record and the total number of records available
            EnableDisableNavigationButtons(this.retrivalGrid.CurrentRowIndex);
            //]]
            //[[Now Set the record counter if the current mode is browse mode
            if (this.ActiveChild.CurrentUIMode == UIModes.Browse)
            {
                SetRecordCounterForBrowseMode(UIModes.Browse);
            }
            //]]
        }


        private bool IsListGridLastRow()
        {
            return this.retrivalGrid.CurrentRowIndex == (this.retrivalGrid.Rows.Count - 1);
        }
        private bool IsListGridFirstRow()
        {
            return this.retrivalGrid.CurrentRowIndex == 0;
        }

        #endregion

        private void saveToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.saveToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void insertToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.insertModeToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void queryToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.queryToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void retrieveToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.retrieveToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void firstToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.firstToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void backToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.backwardToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void nextToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.nextToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void lastToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.lastToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void deleteToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.deleteToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void previewToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.previewToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void printToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.printToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void eraseToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.eraseToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void closeToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.closeToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void exportToExcelToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.exportToExcelToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void exitToolStripButton_EnabledChanged(object sender, EventArgs e)
        {
            this.exitToolStripMenuItem.Enabled = ((ToolStripButton)sender).Enabled;
        }

        private void lblMessageBar_DoubleClick(object sender, EventArgs e)
        {
            MessageDetailViewer viewer = new MessageDetailViewer();
            viewer.SetMessageDetails(this.lblMessageBar.MessageDetails);
            viewer.ShowDialog(this);
        }


        private bool IsInsertOperationPermittedToThisApplicationContext(string screenId, string applicationId)
        {
            return GlobalAppVariables.AppContext.IsInsertSupported(screenId, applicationId) &&
                   GlobalAppVariables.AppContext.IsInsertGranted(screenId, applicationId);
        }
        private bool IsSelectOperationPermittedToThisApplicationContext(string screenId, string applicationId)
        {
            return GlobalAppVariables.AppContext.IsSelectSupported(screenId, applicationId) &&
                   GlobalAppVariables.AppContext.IsSelectGranted(screenId, applicationId);
        }

        private bool IsUpdateOperationPermittedToThisApplicationContext(string screenId, string applicationId)
        {
            return GlobalAppVariables.AppContext.IsUpdateSupported(screenId, applicationId) &&
                   GlobalAppVariables.AppContext.IsUpdateGranted(screenId, applicationId);
        }

        private bool IsDeleteOperationPermittedToThisApplicationContext(string screenId, string applicationId)
        {
            return GlobalAppVariables.AppContext.IsDeleteSupported(screenId, applicationId) &&
                   GlobalAppVariables.AppContext.IsDeleteGranted(screenId, applicationId);
        }

        private bool IsPrintOperationPermittedToThisApplicationContext(string screenId, string applicationId)
        {
            return GlobalAppVariables.AppContext.IsPrintSupported(screenId, applicationId) &&
                   GlobalAppVariables.AppContext.IsPrintGranted(screenId, applicationId);
        }

        private void MDIMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            UIManager.CloseCurrentSession();
        }

        private void currentStatusLabel_TextChanged(object sender, EventArgs e)
        {
            if (this.currentStatusLabel.Text == "Ready")
            {
                this.currentStatusLabel.Image = null;
            }
            else
            {
                if (this.currentStatusLabel.Image == null)
                {
                    this.currentStatusLabel.Image = global::DCC.UMB.CDF.Properties.Resources.Wait;
                }
            }
        }


        private void tblStripMain_EnabledChanged(object sender, EventArgs e)
        {
            this.mnuStrpMain.Enabled = this.tblStripMain.Enabled;
        }

    }
}