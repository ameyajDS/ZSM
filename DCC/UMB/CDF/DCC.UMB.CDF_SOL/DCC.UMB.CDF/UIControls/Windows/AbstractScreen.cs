using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.UIControls.Grid.Column;
using DCC.UMB.CDF.Lookup.Modal;

namespace DCC.UMB.CDF.UIControls.Windows
{
    /// <summary>
    /// This class defines the base class for all the screens managing
    /// entity or transactional information. An object of this type
    /// (or inherited types from this) is supported by CDF.
    /// All screens which are to be shown within MDI of the application
    /// must inherit from this base class and must override the methods
    /// to interact with CDF. 
    /// </summary>
    public class AbstractScreen : Form, ILink
    {
        private UIModes currentUIMode = UIModes.None;
        private string screenParameters = null;
        protected bool enableCompositeBuffering = false;

        
        /// <summary>
        /// This even is raised when the selection of the row has changed.
        /// </summary>
        public event EventHandler<ChildClosingEventArgs> ChildClosing;

        //[[This flag specifies whether this screen has been invoked on the top of an already opened screen
        private bool chainedUp = false;
        //]]

        private int WM_CLOSE = 2; //it is being used in the overridden method WndProc
        private bool isFormClosing = false;
        private string applicationId = null;
        private DCCSqlDataReader browseModeDataReader;
        private int currentlySelectedRowIndexOfListGrid = -1;

        public AbstractScreen()
            : base()
        {
            string strEnableCompositeBuffering = System.Configuration.ConfigurationManager.AppSettings["ENABLE_COMPOSITE_BUFFERING"];
            if (!string.IsNullOrEmpty(strEnableCompositeBuffering) && strEnableCompositeBuffering.ToLower().Trim() == "true")
            {
                this.enableCompositeBuffering = true;
            }
            this.ControlBox = false;
        }
        public virtual Boolean EnableCompositeBuffering
        {
            get { return enableCompositeBuffering; }            
        }

        internal List<KeyValuePair<string, short>> GetRelevantGrantedActions()
        {
            DataRow[] allGrantedActionsOnThisScreen = GlobalAppVariables.AppContext.UserRoleGrantedActionsTable.Select("screen_id='" + this.ScreenId + "'");
            List<KeyValuePair<string, short>> lstRelevantGrantedActions = new List<KeyValuePair<string, short>>();
            if (!(
                    (this.CurrentUIMode == UIModes.Browse) ||
                    (this.CurrentUIMode == UIModes.Update)
                ))
            {
                return lstRelevantGrantedActions;
            }
            if (this.CurrentUIMode == UIModes.Browse)
            {
                if (this.ListViewGrid.CurrentCell == null) return lstRelevantGrantedActions;
            }
            foreach (DataRow row in allGrantedActionsOnThisScreen)
            {
                string actionId = row["action_id"].ToString();
                short displayOrder = DbManager.GetShort(row["display_order"]);
                if (IsAValidScreenAction(actionId))
                {
                    lstRelevantGrantedActions.Add(new KeyValuePair<string, short>(actionId, displayOrder));
                }
            }
            return lstRelevantGrantedActions;
        }

        /// <summary>
        /// This method evaluates each of the action for its validity, before the action 
        /// is displayed as a menu-item under "Actions" sub menu.
        /// </summary>
        /// <param name="actionId">A string specifying the id of the action to be evaluated.</param>
        /// <returns></returns>
        protected virtual bool IsAValidScreenAction(string actionId)
        {
            return true;
        }

        /// <summary>
        /// This method is invoked when user presses on the Print button of the screen
        /// opened in Params mode. The child screen must override this method and must 
        /// provide an implementation returning a DataSet. The first table of this data
        /// set must have all the columns which are being referred to in the reporty 
        /// definition (in rdl file). Please note that the field names are case sensitive.
        /// </summary>
        /// <returns></returns>
        //private virtual DataTable GetReportData()
        //{
        //    throw new Exception("Method GetReportData() must be overridden by child screen!");
        //}

        /// <summary>
        /// Passed to this window when the menu item is cliecked. 
        /// These parameters are typically registered in SysAdmin.
        /// </summary>
        public string ScreenParameters
        {
            get { return screenParameters; }
            internal set { screenParameters = value; }
        }

        internal Chain ContainerChain { get; set; }
        public AbstractScreen CallingScreen
        {
            get
            {
                if (this.ContainerChain != null)
                {
                    return ContainerChain.GetPreviousSibling(this);
                }
                return null;
            }
        }

        /// <summary>
        /// Overiding this method of Form to know if the form is closing.
        /// In that case we will set a property "FormClosing" to true which will 
        /// be checked in the validating events of the controls of this form
        /// </summary>
        /// <param name="message"></param>
        protected override void WndProc(ref Message message)
        {
            try
            {
                if (message.HWnd == this.Handle &&
                        message.Msg == WM_CLOSE)
                {
                    // Set our flag
                    IsFormClosing = true;
                    //[[Throw the ChildClosing event
                    EventHandler<ChildClosingEventArgs> handler = ChildClosing;
                    if (handler != null)
                    {
                        handler(this, new ChildClosingEventArgs());
                    }
                    //]]
                    //[[Close the BrowseModeDataReader if it is opened and is in use.
                    CloseBrowseModeDataReaderIfOpened();
                    //]]
                    UIManager.CloseScreen(this);
                }
            }
            finally
            {
                base.WndProc(ref message);
            }

        }

        public virtual bool IsReadyToClose()
        {
            return true;
        }

        /// <summary>
        /// Returns a boolean specifying whether this child screen is closing.
        /// This normaly is the case when the close button is pressed and 
        /// a window message has been posted to this screen to close.
        /// </summary>
        public bool IsFormClosing
        {
            get { return isFormClosing; }
            private set { isFormClosing = value; }
        }

        /// <summary>
        /// Gets or sets the current UI mode of this Screen.
        /// </summary>
        public UIModes CurrentUIMode
        {
            get { return currentUIMode; }
            set
            {
                UIModes previousMode = this.currentUIMode;
                if (currentUIMode != value)
                {
                    //[[If the screen is getting to any other mode than Retrieve/List/Browse
                    //Then close the database reader and reset the value of flat currentlySelectedRowIndexOfListGrid to -1
                    if (value != UIModes.Retrieve && value != UIModes.List && value != UIModes.Browse)
                    {
                        CloseBrowseModeDataReaderIfOpened();
                        currentlySelectedRowIndexOfListGrid = -1;
                    }
                    //]]
                    currentUIMode = value;

                    ///[[If previous mode is list or browse and the new mode is toggleing 
                    /// the list or browse mode, then the screen must be invoked for ShowScreen
                    /// as the screen is already opened and it is not invoked from menus.
                    /// However, for any other mode the screen is opened from menus or from calling
                    /// chain and ShowScreen is invoked automatically (through openForm method)
                    if ((previousMode == UIModes.Browse && value == UIModes.List) ||
                        (previousMode == UIModes.List && value == UIModes.Browse))
                    {
                        this.ShowScreen(value, screenParameters);
                        if (value == UIModes.List)
                        {
                            ListViewGrid.Focus();//When user goes to list view, set the focus on list view, so that he can operate on this grid with keyboard.
                        }
                    }
                    ///]]

                    ///[[Now if the mode is switching from List to Browse, then the browse mode 
                    ///must show the detials of the current row in the list view grid, as user
                    ///might have selected different row index in list mode.
                    if (currentUIMode == UIModes.Browse && previousMode == UIModes.List)
                    {
                        this.SetCurrentlySelectedRowIndexOfListGrid(ListViewGrid.CurrentRowIndex, false);
                    }
                    ///]]
                    //this.WindowState = FormWindowState.Maximized;
                }
            }
        }
        internal void SetCurrentlySelectedRowIndexOfListGrid(int rowIndex, bool forceLoadBrowseView)
        {
            int previousValue = this.currentlySelectedRowIndexOfListGrid;
            this.currentlySelectedRowIndexOfListGrid = rowIndex;
            if (forceLoadBrowseView ||
                (previousValue != rowIndex && rowIndex >= 0)
                )
            {
                //[[Try to get focus on the control having least tab index
                StopEditingOfAllGrids();
                //]]
                this.LoadBrowseView(rowIndex);
            }
        }

        private void StopEditingOfAllGrids()
        {
            List<Control> lstControls = new List<Control>();
            UtilityManager.GetAllControlsInContainer(this, lstControls);
            foreach (Control control in lstControls)
            {
                if (UtilityManager.IsAssignableTo(control, typeof(DCCGrid)))
                {
                    ((DCCGrid)control).StopEditing(false);
                }
            }
        }

        private void GetFocusOnFirstFocusableControl()
        {
            List<Control> lstControls = new List<Control>();
            UtilityManager.GetAllControlsInContainer(this, lstControls);
            lstControls.Sort(new TabIndexComparer());
            //[[Now try to get the focus on the first focusable field
            foreach (Control control in lstControls)
            {
                try
                {
                    if (control.Focus())
                    {
                        break;
                    }
                }
                catch
                {
                    //do noting
                }
            }
            //]]
        }

        private void CloseBrowseModeDataReaderIfOpened()
        {
            if (this.BrowseModeDataReader != null)
            {
                this.BrowseModeDataReader.CloseReaderAndConnection();
                this.BrowseModeDataReader = null;
            }
        }

        /// <summary>
        /// Gets the screen id of this Screen. 
        /// </summary>
        public virtual string ScreenId
        {
            get { throw new Exception("Unspecified Screen Id, ScreenId property must be overridden by the Child Screen"); }
        }

        /// <summary>
        /// Gets the DeleteMessage of this Screen. 
        /// </summary>
        public virtual string DeleteMessage
        {
            get { return "Are you sure you want to delete this information permanently!"; }
        }

        /// <summary>
        /// Gets the Application Id in which this screen resides. This MUST match with the 
        /// enttry in the applications table of SysAdmin
        /// </summary>
        public string ApplicationId
        {
            get
            {
                return this.applicationId;
            }
            set
            {
                this.applicationId = value;
                this.InitializeDbFacade();//To re-initialize the instance of dbfacade in the screen
                this.SetApplicationIdOfScreenLookups();
            }
        }

        protected virtual void SetApplicationIdOfScreenLookups()
        {
            //place holder for child screen.
            //throw new Exception(
            //    "The child screen must override SetApplicationIdOfScreenLookups method and should set the ApplicationIdForDbConnection property.");
        }

        /// <summary>
        /// 
        /// </summary>
        protected virtual void InitializeDbFacade()
        {
            throw new Exception(
                "The child screen must override InitalizeDbFacade method and should initialize an isntance of appropraite db facade class.");
        }

        /// <summary>
        /// This method is invoked just before the retrival mode is fired (when the user clicks on the get button in query mode)
        /// The screen can make checks (e.g. atleaset one query criterial must be defined etc) and can show user friendly messages.
        /// If Screen returns a false value, then retrival is aborted and screen remains in query mode.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsReadyToRetrieve()
        {
            return true;
        }
        /// <summary>
        /// This property tells whether or not when the screen shifts to query mode, should it clear the query criteria or not.
        /// </summary>
        public bool RetainSearchCriteria { get; internal set; }
        /// <summary>
        /// Gets the DCCGrid object representing the List view grid of the screen.
        /// This property must be overridden by the child screen.
        /// </summary>
        public virtual DCCGrid ListViewGrid
        {
            get
            {
                throw new Exception("Unspecified list view grid object, The \"ListViewGrid\" property must be overridden by the Child Screen");
            }
        }


        /// <summary>
        /// NOTE: This function must be invoked ONLY from one location and that is from within 
        /// set of CurrentlySelectedRowIndexOfListGrid property.
        /// This method loads the browse view from the grid view row. Whenever there is a change 
        /// in the row selection of list view grid, this method will be invoked. Please note that
        /// when user hits on the tool bar buttons "next", "previous", "first" and "last", the underlying
        /// behaviour is to change the row selection of the list view grid, and hence this method gets
        /// invoked.
        /// </summary>
        /// <param name="rowIndex">The current rowindex of the list view grid.</param>
        public virtual void LoadBrowseView(int rowIndex)
        {
            throw new Exception("Load Browse View not implemented by the chid screen, however it went into browse mode.");
        }

        /// <summary>
        /// Gets the sql string, which should be formed by the input provided by the user in the query mode of the screen.
        /// This property must be overridden by the child screen.
        /// </summary>
        public virtual DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            throw new Exception("Unspecified Results for retrieve mode, The \"QueryModeRetrivalResults\" method must be overridden by the Child Screen");
        }

        //This reader is set in this screen so that the browsing of the records in the browse mode can happen.
        //It is set to internal scope so that the child screen implementation should not hamper with this data reader. 
        //All the handling is done in the MDIMain class.
        internal DCCSqlDataReader BrowseModeDataReader
        {
            get { return this.browseModeDataReader; }
            set { this.browseModeDataReader = value; }
        }

        /// <summary>
        /// Specifies if this screen was opened on the top of another screen.
        /// </summary>
        internal bool ChainedUp
        {
            get { return chainedUp; }
            set { chainedUp = value; }
        }

        /// <summary>
        /// This method is invoked when user clicks on one of the action menu
        /// loaded for this screen.
        /// </summary>
        /// <param name="actionId"></param>
        public virtual void ExecuteScreenAction(string actionId)
        {
            //Do Nothing, as the Child screen will be implementing the body of this method.
        }


        /// <summary>
        /// This method will be invoked when user presses the save button in the toolbar
        /// or clicks on the menu item and before an actual hit to databae is made. Typical implementation of this method will include
        /// validation of all the controls on the screen. If this method returns false,
        /// then the database hit is aborted.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsReadyToSave()
        {
            return this.Validate() && true;//This last control is validated by this.Validate();
        }

        /// <summary>
        /// This method gets invoked when user clicks on the "Save" button in tool bar or chooses the "Save" menu
        /// item in "Operations" menu. The child screen must override thid method and must do the appropriate save
        /// tasks.
        /// </summary>
        public virtual void Save()
        {
            throw new Exception("Either the Save() should be overridden in the Child Screen or Save should not be invoked");
        }

        /// <summary>
        /// This method gets invoked when user clicks on the "Clear" Button on the tool bar or chooses "Erase" menu items in 
        /// "Operations" menu.
        /// </summary>
        internal void ClearControlsAndSetLooksAsPerCurrentMode(bool doClearControls)
        {
            //[[Tell all the controls of the child screen to adjust colors and padding
            //and that will take care of the colors and padding
            List<Control> lstAllControls = new List<Control>();
            UtilityManager.GetAllControlsInContainer(this, lstAllControls);
            foreach (Control ctrl in lstAllControls)
            {
                if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCTextField)))
                {
                    ((DCCTextField)ctrl).AdjustPaddingAndColors();
                }
                else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCComboBox)))
                {
                    ((DCCComboBox)ctrl).AdjustPaddingAndColors();
                }
                else if (UtilityManager.IsAssignableTo(ctrl, typeof(DateRangePair)))
                {
                    ((DateRangePair)ctrl).AdjustPaddingAndColors();
                }
                else if (UtilityManager.IsAssignableTo(ctrl, typeof(DCCCheckBox)))
                {
                    if (this.currentUIMode == UIModes.Query)
                    {
                        ((DCCCheckBox)ctrl).ThreeState = true;
                        ((DCCCheckBox)ctrl).CheckState = CheckState.Indeterminate;
                    }
                    else
                    {
                        ((DCCCheckBox)ctrl).ThreeState = false;
                        if (doClearControls)
                        {
                            ((DCCCheckBox)ctrl).Checked = false;
                        }
                    }
                }
            }
            //]]
            //[[Now deligate to the child screen for the clearControls method.
            if (doClearControls)
            {
                ClearControls();
            }
            //]]
        }
        public virtual void ClearControls()
        {
            ///The virtual implementation would be to clear all controls of this screen
            ///including list grids and any other grids etc.
            ClearAllControlsOfContainer(this, true);
            UIManager.ClearMessageBar();
        }


        /// <summary>
        /// Shows this Screen in the specified uiMode while passeing in the sepcified parameters
        /// </summary>
        /// <param name="uiMode"></param>
        /// <param name="screenParameters"></param>
        public virtual void ShowScreen(UIModes uiMode, string screenParameters)
        {
            this.CurrentUIMode = uiMode;
            this.screenParameters = screenParameters;
            this.MdiParent = GlobalAppVariables.ObjMDIMain;
            this.WindowState = FormWindowState.Maximized;
            this.Show();
            Logger.Debug("Screen is visible now");
        }

        /// <summary>
        /// This function will set a particular control(from the form's control collection)
        /// on this form into focus. This function will be invoked by UIManager typically in
        /// the cases of errors from the database. The parameter fieldReferenceIndicator is
        /// a indicator specifying the name of the field. This indicator is typically set 
        /// in the sotred procedure and is thrown as a part of the error 
        /// </summary>
        /// <param name="fieldReferenceIndicator"></param>
        public virtual void SetFieldInFocus(string fieldReferenceIndicator)
        {
            //Do nothing
        }


        private void InitializeComponent()
        {
            this.SuspendLayout();
            // 
            // AbstractScreen
            // 
            this.ClientSize = new System.Drawing.Size(742, 472);
            this.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "AbstractScreen";
            //this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.AbstractScreen_FormClosing);
            this.ResumeLayout(false);

        }

        /// <summary>
        /// Thid method is invoked when user presses on the Delete button in the toolbar
        /// or choose the "Remove" item in the "Operations" Menu
        /// </summary>
        public virtual void DeleteRecord()
        {
            //Child screen will override this method.
        }

        /// <summary>
        /// This method is invoked just before the current record in browse mode is about to delete. If this method returns false
        /// then the delete function is aborted.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsReadyToDelete()
        {
            return true;
        }

        public virtual void DeleteRecord(ref bool removeRecordFromListViewGrid)
        {
            //By default call DeleteRecord of this class. In case this method is overridden
            //then the passed in parameter will be taken up.
            this.DeleteRecord();
        }



        #region ILink Members
        public virtual DCC.UMB.CDF.Lookup.Modal.LookupResult GetLookupResult()
        {
            return null; //the actual value should be reutnred by the concrete class implementation
        }

        public virtual void SetLookupResult(DCC.UMB.CDF.Lookup.Modal.LookupResult result, Control targetControl)
        {
            if (!UtilityManager.IsAssignableTo(targetControl, typeof(DCCTextField)))
            {
                return;
            }
            ((DCCTextField)targetControl).LookupResult = result;
            if (((DCCTextField)targetControl).IsGridViewCellEditor)
            {
                ((DCCTextField)targetControl).ParentGridView.RaiseLookupResultSetEvent(result);
            }
            else
            {
                ((DCCTextField)targetControl).RaiseLookupResultSetEvent(result);
            }
        }
        #endregion

        public virtual bool IsReadyToSwitchMode(UIModes oldUIMode, UIModes newUIMode)
        {
            return true;
        }

        private void AbstractScreen_FormClosing(object sender, FormClosingEventArgs e)
        {
            ///[[Notify the UIManager to remove this closing screen from the appropriate chain
            //UIManager.CloseScreen(this);
            //]]
        }

        /// <summary>
        /// This method is invoked while loading the action menu. 
        /// If this method returns false for a given action, then on the execution of that action browse mode is not refreshed.
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        public virtual bool DoesActionCauseReloadOfCurrentRecordInBrowseMode(string p)
        {
            return true;
        }

        /// <summary>
        /// This method validates all the controls of the given container.
        /// This method drills through the control hierarchy and calls for
        /// IsValid() method of every leaf level control provided the control
        /// belongs to package DCC.UMB.CDF.***. 
        /// </summary>
        /// <param name="container">The container whose controls will be validated</param>
        /// <returns></returns>
        public virtual bool ValidateAllControlsofContainer(Control container)
        {
            return UtilityManager.ValidateAllControlsofContainer(container);
        }

        protected void ShowListView(SplitContainer aListBrowseSplitContainer, bool showListView)
        {
            try
            {
                aListBrowseSplitContainer.Panel2Collapsed = !showListView;
                aListBrowseSplitContainer.Panel1Collapsed = showListView;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void LoadDataToContainer(LookupResult result, Control container, params Control[] containersToExclude)
        {
            LoadDataToContainer(result.SelectedRecords[0], container, containersToExclude);
        }
        public void LoadDataToContainer(DataTable table, Control container, params Control[] containersToExclude)
        {
            LoadDataToContainer(table.DefaultView[0], container, containersToExclude);
        }

        public void LoadDataToContainer(DataRowView dataRowView, Control container, params Control[] containersToExclude)
        {
            try
            {
                List<Control> lstAllControls = new List<Control>();
                UtilityManager.GetAllControlsInContainer(container, lstAllControls, containersToExclude);
                foreach (Control control in lstAllControls)
                {
                    try
                    {
                        if (UtilityManager.IsAssignableTo(control, typeof(DCCDateTimeField)))
                        {
                            DCCDateTimeField txtDTM = (DCCDateTimeField)control;
                            DateTime? dtm = null;

                            if (!string.IsNullOrEmpty(txtDTM.DisplayTextBindingKey))
                            {
                                dtm = DbManager.GetNullableDateTime(dataRowView[txtDTM.DisplayTextBindingKey]);
                                txtDTM.DisplayTextAsDateTime = dtm;
                            }
                        }
                        else if (UtilityManager.IsAssignableTo(control, typeof(DCCTextField)))
                        {
                            DCCTextField txtField = (DCCTextField)control;
                            string displayText = null;
                            string idText = null;

                            if (!string.IsNullOrEmpty(txtField.DisplayTextBindingKey))
                            {
                                displayText = DbManager.GetString(dataRowView[txtField.DisplayTextBindingKey]);
                            }
                            if (!string.IsNullOrEmpty(txtField.IdTextBindingKey))
                            {
                                idText = DbManager.GetString(dataRowView[txtField.IdTextBindingKey]);
                            }
                            if (!string.IsNullOrEmpty(txtField.DisplayTextBindingKey) || !string.IsNullOrEmpty(txtField.IdTextBindingKey))
                            {
                                txtField.SetControlValues(displayText, displayText, idText);
                            }
                        }
                        else if (UtilityManager.IsAssignableTo(control, typeof(DCCComboBox)))
                        {
                            DCCComboBox cmbBox = (DCCComboBox)control;
                            object selectedValue = null;
                            if (!string.IsNullOrEmpty(cmbBox.SelectedValueBindingKey))
                            {
                                selectedValue = DbManager.GetString(dataRowView[cmbBox.SelectedValueBindingKey]);
                                cmbBox.SelectedValue = selectedValue;
                            }
                        }
                        else if (UtilityManager.IsAssignableTo(control, typeof(DCCCheckBox)))
                        {
                            DCCCheckBox chkBox = (DCCCheckBox)control;
                            if (!string.IsNullOrEmpty(chkBox.BindingKey))
                            {
                                var cellValue = DbManager.GetString(dataRowView[chkBox.BindingKey]);
                                if (cellValue != null)
                                {
                                    chkBox.CheckState = cellValue.ToString().ToUpper() == "YES" ||
                                        cellValue.ToString().ToUpper() == "TRUE" ||
                                        cellValue.ToString() == "1" ? CheckState.Checked : CheckState.Unchecked;
                                }
                                else
                                {
                                    chkBox.CheckState = CheckState.Unchecked;
                                }

                            }
                        }
                    }
                    catch (Exception ex1)
                    {
                        throw;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public void LoadDataFromGridToContainer(DCCGrid grid, int rowIndex, Control container, params Control[] containersToExclude)
        {
            try
            {
                List<Control> lstAllControls = new List<Control>();
                UtilityManager.GetAllControlsInContainer(container, lstAllControls, containersToExclude);
                foreach (Control control in lstAllControls)
                {
                    try
                    {
                        if (UtilityManager.IsAssignableTo(control, typeof(DCCDateTimeField)))
                        {
                            DCCDateTimeField txtDTM = (DCCDateTimeField)control;
                            DateTime? dtm = null;

                            if (!string.IsNullOrEmpty(txtDTM.DisplayTextBindingKey))
                            {
                                dtm = grid.AsDTM(txtDTM.DisplayTextBindingKey, rowIndex);
                                txtDTM.DisplayTextAsDateTime = dtm;
                            }
                        }
                        else if (UtilityManager.IsAssignableTo(control, typeof(DCCTextField)))
                        {
                            DCCTextField txtField = (DCCTextField)control;
                            string displayText = null;
                            string idText = null;

                            if (!string.IsNullOrEmpty(txtField.DisplayTextBindingKey))
                            {
                                displayText = grid.AsStr(txtField.DisplayTextBindingKey, rowIndex);
                            }
                            if (!string.IsNullOrEmpty(txtField.IdTextBindingKey))
                            {
                                idText = grid.AsStr(txtField.IdTextBindingKey, rowIndex);
                            }
                            if (!string.IsNullOrEmpty(txtField.DisplayTextBindingKey) || !string.IsNullOrEmpty(txtField.IdTextBindingKey))
                            {
                                txtField.SetControlValues(displayText, displayText, idText);
                            }
                        }
                        else if (UtilityManager.IsAssignableTo(control, typeof(DCCComboBox)))
                        {
                            DCCComboBox cmbBox = (DCCComboBox)control;
                            object selectedValue = null;
                            if (!string.IsNullOrEmpty(cmbBox.SelectedValueBindingKey))
                            {
                                selectedValue = grid.GetCellValue(cmbBox.SelectedValueBindingKey, rowIndex);
                                cmbBox.SelectedValue = selectedValue;
                            }
                        }
                        else if (UtilityManager.IsAssignableTo(control, typeof(DCCCheckBox)))
                        {
                            DCCCheckBox chkBox = (DCCCheckBox)control;
                            if (!string.IsNullOrEmpty(chkBox.BindingKey))
                            {
                                var cellValue = grid.GetCellValue(chkBox.BindingKey, rowIndex);
                                if (cellValue != null && cellValue.GetType() == typeof(string))
                                {
                                    chkBox.CheckState = grid.AsBln(chkBox.BindingKey, rowIndex, true).Value ? CheckState.Checked : CheckState.Unchecked;
                                }
                                else
                                {
                                    bool isChecked = false;
                                    if (cellValue != null)
                                    {
                                        isChecked = grid.AsBln(chkBox.BindingKey, rowIndex, false).Value;
                                    }
                                    chkBox.CheckState = isChecked ? CheckState.Checked : CheckState.Unchecked;
                                }

                            }
                        }
                    }
                    catch (Exception ex1)
                    {
                        throw;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void LoadDataFromContainerToGrid(DCCGrid grid, int rowIndex, Control container, params Control[] containersToExclude)
        {
            List<Control> lstAllControls = new List<Control>();
            UtilityManager.GetAllControlsInContainer(container, lstAllControls, containersToExclude);
            foreach (Control control in lstAllControls)
            {
                if (UtilityManager.IsAssignableTo(control, typeof(DCCDateTimeField)))
                {
                    DCCDateTimeField txtDTM = (DCCDateTimeField)control;
                    DateTime? dtm = txtDTM.DisplayTextAsDateTime;
                    if (!string.IsNullOrEmpty(txtDTM.DisplayTextBindingKey))
                    {
                        grid.SetCellValue(txtDTM.DisplayTextBindingKey, rowIndex, dtm);
                    }
                }
                else if (UtilityManager.IsAssignableTo(control, typeof(DCCLongIntegerField)))
                {
                    DCCLongIntegerField txtField = (DCCLongIntegerField)control;
                    if (!string.IsNullOrEmpty(txtField.DisplayTextBindingKey))
                    {
                        grid.SetCellValue(txtField.DisplayTextBindingKey, rowIndex, txtField.DisplayTextAsLong);
                    }
                }
                else if (UtilityManager.IsAssignableTo(control, typeof(DCCDoubleFloatField)))
                {
                    DCCDoubleFloatField txtField = (DCCDoubleFloatField)control;
                    if (!string.IsNullOrEmpty(txtField.DisplayTextBindingKey))
                    {
                        grid.SetCellValue(txtField.DisplayTextBindingKey, rowIndex, txtField.DisplayTextAsDouble);
                    }
                }
                else if (UtilityManager.IsAssignableTo(control, typeof(DCCTextArea)))
                {
                    DCCTextArea txtField = (DCCTextArea)control;
                    if (!string.IsNullOrEmpty(txtField.DisplayTextBindingKey))
                    {
                        grid.SetCellValue(txtField.DisplayTextBindingKey, rowIndex, txtField.DisplayText);
                    }
                }
                else if (UtilityManager.IsAssignableTo(control, typeof(DCCTextField)))
                {
                    DCCTextField txtField = (DCCTextField)control;
                    if (!string.IsNullOrEmpty(txtField.DisplayTextBindingKey))
                    {
                        grid.SetCellValue(txtField.DisplayTextBindingKey, rowIndex, txtField.DisplayText);
                    }
                    if (!string.IsNullOrEmpty(txtField.IdTextBindingKey))
                    {
                        grid.SetCellValue(txtField.IdTextBindingKey, rowIndex, txtField.IdText);
                    }
                }
                else if (UtilityManager.IsAssignableTo(control, typeof(DCCComboBox)))
                {
                    DCCComboBox cmbBox = (DCCComboBox)control;
                    if (!string.IsNullOrEmpty(cmbBox.SelectedValueBindingKey))
                    {
                        grid.SetCellValue(cmbBox.SelectedValueBindingKey, rowIndex, cmbBox.SelectedValue);
                        grid.AsStr(cmbBox.SelectedValueBindingKey, rowIndex);
                    }
                }
                else if (UtilityManager.IsAssignableTo(control, typeof(DCCCheckBox)))
                {
                    DCCCheckBox chkBox = (DCCCheckBox)control;
                    if (!string.IsNullOrEmpty(chkBox.BindingKey))
                    {
                        if (grid.Columns[chkBox.BindingKey] == null)
                        {
                            throw new Exception("Grid does not have a column named '" + chkBox.BindingKey + "'");
                        }
                        if (grid.Columns[chkBox.BindingKey].GetType() == typeof(DCCTextFieldGridColumn))
                        {
                            grid.SetCellValue(chkBox.BindingKey, rowIndex, chkBox.BlnString);
                        }
                        else if (grid.Columns[chkBox.BindingKey].GetType() == typeof(DCCCheckBoxGridColumn))
                        {
                            grid.SetCellValue(chkBox.BindingKey, rowIndex, chkBox.Checked);
                        }

                    }
                }
            }
        }


        /// <summary>
        /// This method clears all the controls on this screen which are of type DCCTextField or DCCGrid or DCCDropDown or DCCCheckBox type
        /// </summary>
        /// <param name="clearListGrid">A boolean specifying whether or not to clear the contents of List view Grid. Typically, if the screen is in Browse/List mode, this parameter should be false, else true.</param>
        /// <param name="container">The container whose sub controls needs to be cleared.</param>
        /// <param name="controlsNotToBeCleared">Params list of controls which should be ignored.</param>
        public void ClearAllControlsOfContainer(Control container, bool clearListGrid, params Control[] controlsNotToBeCleared)
        {
            UtilityManager.ClearAllControlsOfContainer(container, clearListGrid, this, controlsNotToBeCleared);
        }
        internal bool IsListViewGridAvailableInChildScreen()
        {
            try
            {
                if (this.ListViewGrid != null)
                {
                    return true;
                }
            }
            catch
            {
                return false;
            }
            return false;
        }

        //[[This overridden method takes care of the flickering
        protected override CreateParams CreateParams
        {
            get
            {
                CreateParams cp = base.CreateParams;
                if (this.EnableCompositeBuffering)
                {
                    cp.ExStyle |= 0x02000000;  // Turn on WS_EX_COMPOSITED                    
                }
                return cp;
            }
        }
        //]]


        

    }
    class TabIndexComparer : IComparer<Control>
    {


        public int Compare(Control x, Control y)
        {
            return x.TabIndex.CompareTo(y.TabIndex);
        }
    }
    public class ChildClosingEventArgs : EventArgs
    {

    }





}
