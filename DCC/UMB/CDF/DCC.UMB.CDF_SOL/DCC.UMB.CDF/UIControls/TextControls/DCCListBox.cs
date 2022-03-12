using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Design;
using System.Drawing.Text;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.Lookup;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.View;
using DCC.UMB.CDF.Properties;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Utils;
using Constants = DCC.UMB.CDF.Configuration.Constants;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCListBox.bmp")]
    public partial class DCCListBox : UserControl, IDCCDataBinder
    {

        private bool isEnable = true;
        private bool isMandatory = false;
        private bool isLookupLabelVisible = false;
        protected string title = "Title";
        private string lookupColumns;
        private char mnemonic;



        private LookupResult lookupResult = null;

        private string applicationIdForDbConnection;
        private LookupDialogSizes lookupDialogSize = LookupDialogSizes.Large;

        private const int PADDING_WIDTH_FOR_RIGHT_SIDE_ICON = 14;
        private const int PADDING_WIDTH_FOR_TOP_TITLE = 17;


        ///[[Declare the event using EventHandler<T> for specifying an event just before the looup dialog is shown
        public event EventHandler<LookupEventArgs> LookupDialogShowing;
        //]]

        ///[[Declare the event using EventHandler<T> for specifying an event just after the lookup dialog has set the values into this text field
        public event EventHandler<LookupResultEventArgs> LookupResultSet;
        /// ]]

        public DCCListBox()
        {
            InitializeComponent();
            ///[[This is required to avoid flickering
            SetStyle(ControlStyles.AllPaintingInWmPaint |
              ControlStyles.OptimizedDoubleBuffer |
              ControlStyles.UserPaint, true);
            //]]

            this.Lookup = false;
            this.Mandatory = false;
            this.Enabled = true;
            this.ReadOnly = false;
            this.ReadOnly = false;
        }
        public void SelectAllItems()
        {
            SetSelectionStatus(true);
        }
        public void DeselectAllItems()
        {
            SetSelectionStatus(false);
        }
        public void SetSelected(int index, bool isSelected)
        {
            this.lstBox.SetSelected(index, true);
        }
        public void SetSelected(object item, bool isSelected)
        {
            if(this.lstBox.Items.Contains(item))
            {
                this.SetSelected(this.lstBox.Items.IndexOf(item), isSelected);
            }
            else
            {
                throw new Exception("Specified item does not exist in the items collection of this listbox");
            }
        }
        public void InvertSelection()
        {
            if (this.lstBox.Items == null)
            {
                return;
            }
            for (int i = 0; i < this.lstBox.Items.Count; i++)
            {
                this.lstBox.SetSelected(i, !this.lstBox.GetSelected(i));
            }
        }
        private void SetSelectionStatus(bool selectionStatus)
        {
            if (this.lstBox.Items == null)
            {
                return;
            }
            for (int i = 0; i < this.lstBox.Items.Count; i++)
            {
                this.lstBox.SetSelected(i, selectionStatus);
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies Columns of this Lookup"), Editor(typeof(TableCreator), typeof(UITypeEditor))]
        public virtual string LookupColumns
        {
            get { return lookupColumns; }
            set { lookupColumns = value; }
        }




        [Category("DCC.UMB.CDF.UIControls")]
        public string CallingScreenType
        {
            get;
            set;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public string CalledScreenTypeName
        {
            get;
            set;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public string CalledScreenApplicationId
        {
            get;
            set;
        }


        [Category("DCC.UMB.CDF.UIControls")]
        public LookupDialogSizes LookupDialogSize
        {
            get { return this.lookupDialogSize; }
            set { this.lookupDialogSize = value; }
        }


        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It indicates the text of the DCCTextField's Label.")]
        public virtual string Title
        {
            get { return title; }
            set
            {
                try
                {
                    if (value.IndexOf('&') > 0)
                    {
                        this.mnemonic = value.ToCharArray()[value.IndexOf('&') + 1];
                    }
                }
                catch
                {
                    //Do nothing.
                }
                title = value;
                AdjustPaddingAndColors();
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It indicates whether the lookup button is needed or not.")]
        public virtual bool Lookup
        {
            get { return isLookupLabelVisible; }
            set
            {
                isLookupLabelVisible = value;
                AdjustPaddingAndColors();

            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It indicates whether the field is mandatory or not.")]
        public virtual bool Mandatory
        {
            get { return isMandatory; }
            set
            {
                isMandatory = value;
                AdjustPaddingAndColors();
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Controls whether the text in the edit control can be changed or not.")]
        public virtual bool ReadOnly
        {
            get { return !this.lstBox.Enabled; }
            set
            {
                this.lstBox.Enabled = !value;
                AdjustPaddingAndColors();

            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Indicates whether the control is enabled.")]
        public new bool Enabled
        {
            get { return isEnable; }
            set
            {
                isEnable = value;
                this.lstBox.Enabled = value;
            }
        }

        /// <summary>
        /// Gets the lookup result object, if lookup is enabled on this field
        /// and user has selected a valid lookup record.
        /// </summary>
        public LookupResult LookupResult
        {
            get { return lookupResult; }
            internal set
            {
                if (value != null)
                {
                    SetListItems(value);
                }
                lookupResult = value;
            }
        }

        /// <summary>
        /// Sets the datasource of this list from a DataTableObject
        /// </summary>
        /// <param name="dataSourceTable">A Datatable whose rows will be used as items in this list.</param>
        /// <param name="displayMemberName">Name of a specific column, whose contents will be used as the display text for the list items</param>
        /// <param name="valueMemberName">Name of a specific column, whose contents will be used as the value for the list items</param>
        public void SetDataSource(DataTable dataSourceTable, string displayMemberName, string valueMemberName)
        {
            List<DropDownItem> items = DropDownItem.GenerateDropDownItems(dataSourceTable, displayMemberName,
                                                                          valueMemberName);
            this.lstBox.ValueMember = "ValueMember";
            this.lstBox.DisplayMember = "DisplayMember";
            this.lstBox.DataSource = items;
        }
        /// <summary>
        /// Sets the datasource of this list from a collection of objects
        /// </summary>
        /// <param name="dataSourceCollection">A Collection of objects whose members will be used as items in this list.</param>
        /// <param name="displayMemberName">Name of a specific public property of the underlying member of the datasource which will be used as the display text for the list items</param>
        /// <param name="valueMemberName">Name of a specific public property of the underlying member of the datasource which will be used as the value for the list items</param>
        public void SetDataSource(ICollection dataSourceCollection, string displayMemberName, string valueMemberName)
        {
            List<DropDownItem> items = DropDownItem.GenerateDropDownItems(dataSourceCollection, displayMemberName,
                                                                          valueMemberName);
            this.lstBox.ValueMember = "ValueMember";
            this.lstBox.DisplayMember = "DisplayMember";
            this.lstBox.DataSource = items;

        }
        private void SetListItems(LookupResult result)
        {
            try
            {
                List<DropDownItem> lstDropDownItems = DropDownItem.GenerateDropDownItems(result.SelectedRecords.ToTable(), result.DisplayMemberColumnName,
                                                            result.ValueMemberColumnName, false);

                if (result.AppendResults && (this.lstBox.DataSource != null))
                {
                    List<DropDownItem> existingItems = (List<DropDownItem>)this.lstBox.DataSource;
                    lstDropDownItems.InsertRange(0, existingItems);
                }
                BindDataSouceToList(lstDropDownItems);
            }
            finally
            {
                UIManager.ClearMessageBar();//As user has edited the contents of the list box, i.e. he/she is working on the screen and we can safely clear the message bar
            }
        }

        private void BindDataSouceToList(List<DropDownItem> lstDropDownItems)
        {
            this.lstBox.DataSource = null;
            this.lstBox.DataSource = lstDropDownItems;
            this.lstBox.DisplayMember = "DisplayMember";
            this.lstBox.ValueMember = "ValueMember";
            this.lstBox.Refresh();
        }

        /// <summary>
        /// This method will return the xml representation of the selected items in the list.
        /// This xml can be used as a parameter to the stored procedure. Please see the 
        /// documentation of the sotred procedures used to parse this xml and to generate 
        /// an in memory table
        /// </summary>
        /// <returns></returns>
        public string GetItemsAsXML(bool selectedOnly)
        {
            List<DropDownItem> lstDropDownItems = GetItems(selectedOnly);
            if (lstDropDownItems.Count == 0 || ((lstDropDownItems.Count == 1) && lstDropDownItems[0].ValueMember == null))
            {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            XmlTextWriter writer = new XmlTextWriter(new System.IO.StringWriter(sb));

            //Example <Root><r id = "11" /><r id = "12" /><r id = "13" /><r id = "14" /><r id = "15" /></Root>
            writer.WriteStartElement("Root");
            foreach (DropDownItem item in lstDropDownItems)
            {
                if (item.ValueMember == null)
                {
                    continue;
                }
                writer.WriteStartElement("r");

                writer.WriteAttributeString("id", item.ValueMember.ToString());
                writer.WriteEndElement();
            }
            writer.WriteEndElement();
            writer.Flush();
            writer.Close();

            return sb.ToString();
        }

        /// <summary>
        /// Returns the list of items in this List box.
        /// </summary>
        /// <param name="selectedOnly">If set to true, this method returns only those itmes, which are highlited by user (using ctrl and mouse click operations)</param>
        /// <returns></returns>
        public List<DropDownItem> GetItems(bool selectedOnly)
        {
            List<DropDownItem> lstDropDownItems = new List<DropDownItem>();
            if (selectedOnly && this.lstBox.SelectedItems != null)
            {
                foreach (DropDownItem item in this.lstBox.SelectedItems)
                {
                    lstDropDownItems.Add(item);
                }
            }
            else
            {
                if (this.lstBox.DataSource != null)
                {
                    lstDropDownItems.AddRange((List<DropDownItem>)this.lstBox.DataSource);
                }
            }
            return lstDropDownItems;
        }


        protected override bool ProcessMnemonic(char charCode)
        {
            if (this.mnemonic == charCode && this.CanSelect)
            {
                this.Focus();
                return true;
            }
            return false;

        }

        private void AdjustPaddingAndColors()
        {
            int bottomPadding = 0;
            int topPadding = 0;
            int leftPadding = 0;
            int rightPadding = 0;
            if (!string.IsNullOrEmpty(this.Title))
            {
                topPadding = PADDING_WIDTH_FOR_TOP_TITLE;
            }



            //[[If lookup is enabled or the control is used as datetime and the control is not being used in grid cell, 
            //then create some space for showing the lookup/date icon on the right hand side.
            if (Lookup)
            {
                topPadding = PADDING_WIDTH_FOR_TOP_TITLE;
            }
            //]]

            this.Padding = new Padding(leftPadding, topPadding, rightPadding, bottomPadding);
            //[[Now adjust the fore and back colors based upon the properties.
            bool isQueryMode = false;
            if (this.DesignMode)
            {
                isQueryMode = false;
            }
            else
            {
                AbstractScreen screen = null;
                screen = UtilityManager.GetContainerScreen(this);
                if (screen != null)
                {
                    if (screen.CurrentUIMode == UIModes.Query)
                    {
                        isQueryMode = true;
                    }
                }
            }
            Color foreColor = Constants.DEFAULT_READWRITE_FORE_COLOR;
            if (this.ReadOnly)
            {
                foreColor = Constants.DEFAULT_READONLY_FORE_COLOR;
            }
            Color backColor = Constants.DEFAULT_NON_MANDATORY_BACK_COLOR;
            if (this.Mandatory && !isQueryMode)
            {
                backColor = Constants.DEFAULT_MANDATORY_BACK_COLOR;
            }
            this.lstBox.ForeColor = foreColor;
            this.lstBox.BackColor = backColor;
            //]]

            this.Invalidate();
        }


        private void DCCTextFieldLight_MouseMove(object sender, MouseEventArgs e)
        {
            try
            {
                if (Lookup)
                {
                    Rectangle lookupIconRectangle = GetLookupIconRectangle();
                    if (lookupIconRectangle.Contains(e.Location))
                    {
                        this.Cursor = Cursors.Hand;
                    }
                    else
                    {
                        this.Cursor = Cursors.Default;
                    }
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
        }

        private Rectangle GetLookupIconRectangle()
        {
            Point startingPointForLookupIcon = new Point(this.Size.Width - PADDING_WIDTH_FOR_RIGHT_SIDE_ICON, 2);
            return new Rectangle(startingPointForLookupIcon,
                                 new Size(PADDING_WIDTH_FOR_RIGHT_SIDE_ICON, PADDING_WIDTH_FOR_TOP_TITLE));
        }

        /// <summary>
        /// Paint method is overridden to paint the asterick symbol, if this
        /// text field is mandatory
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public virtual void DCCTextField_Paint(object sender, PaintEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.Title))
            {
                Font fontForTitle = this.Font;
                StringFormat format = new StringFormat();
                format.HotkeyPrefix = HotkeyPrefix.Show;
                format.Trimming = StringTrimming.EllipsisCharacter;
                format.FormatFlags = StringFormatFlags.NoWrap;
                if (!this.ReadOnly)
                {
                    e.Graphics.DrawString(this.Title, fontForTitle, SystemBrushes.HotTrack, -2, 1, format);
                }
                else
                {
                    e.Graphics.DrawString(this.Title, fontForTitle, Brushes.Maroon, -2, 1, format);
                }

            }
            if (Lookup)
            {
                e.Graphics.DrawImage(Resources.Query12_12, GetLookupIconRectangle().X, GetLookupIconRectangle().Y);//new Point(this.Size.Width - 20, 0));
            }
        }

        /// <summary>
        /// Sets the vlaues in the control in a single shot. 
        /// </summary>
        /// <param name="displayText"></param>
        /// <param name="valueText"></param>
        /// <param name="idText"></param>
        public virtual void SetControlValues(string displayText, string valueText, string idText)
        {
            //this.idText = idText;
            //this.valueText = valueText;
            //this.DisplayText = displayText;
        }

        /// <summary>
        /// This method resets the control in such a way that all the data stored in this control is cleared
        /// This means that properteis like IDText, ValueText, DisplayText and LookupResult will all return null.
        /// And the control will not show any text in the field.
        /// This method should be invoked when we want to clear the control (e.g. when users presses clear button 
        /// in the toolbar)
        /// </summary>
        public virtual void ClearControlValues()
        {
            List<DropDownItem> emptyList = new List<DropDownItem>();

            BindDataSouceToList(emptyList);
        }
        /// <summary>
        /// Gets whether this field is in a valid state or not. This methos will typically
        /// be used in "IsReadyToSave" method of the AbstractScreen implementation.
        /// This method checks if the field is mandatory and is in one of the modes vz. new/insert/browse
        /// and if the user has left the field as blank, then a false value is returned, else true.
        /// </summary>
        /// <returns></returns>
        public virtual bool IsValid(bool showInvalidMessageToUser)
        {
            AbstractScreen containerScreen = UtilityManager.GetContainerScreen(this);
            UIModes containerScreenUIMode = UIModes.None;
            if (containerScreen != null)
            {
                containerScreenUIMode = containerScreen.CurrentUIMode;
            }
            ///If the field is marked mandatory and has lookup, that means the user must select 
            ///atleaset one item from the lookup, if not then return with false
            /////[[
            if (this.Lookup && this.Mandatory &&
                    (
                    containerScreenUIMode == UIModes.New ||
                    containerScreenUIMode == UIModes.Browse ||
                    containerScreenUIMode == UIModes.Insert ||
                    containerScreenUIMode == UIModes.Params
                    )
                )
            {
                if (this.lstBox.Items == null || this.lstBox.Items.Count <= 0)
                {
                    if (showInvalidMessageToUser)
                    {
                        ShowMissingValueMessage();
                    }
                    return false;
                }
            }
            //]]
            else
            {
                if ((containerScreenUIMode == UIModes.New ||
                    containerScreenUIMode == UIModes.Browse ||
                    containerScreenUIMode == UIModes.Insert ||
                    containerScreenUIMode == UIModes.Params))
                {
                    if (this.isMandatory)
                    {
                        if (this.lstBox.SelectedItems == null ||
                            this.lstBox.SelectedItems.Count <= 0)
                        {
                            if (showInvalidMessageToUser)
                            {
                                ShowMissingValueMessage();
                            }
                            return false;
                        }
                    }
                }
            }
            //]]
            //]]

            return true;
        }

        //Defined virtual so that decendant classes could use it.
        protected virtual void DCCTextField_Validating(object sender, CancelEventArgs e)
        {

        }

        private void ShowMissingValueMessage()
        {
            UIManager.ShowMessage(MsgCodes.ValueReqd,
                                  "\"" + DisplayableTitle + "\"",
                                  MessageTypes.Warning);
        }


        /// <summary>
        /// This method will try to get a record and fill it in the lookup field
        /// </summary>
        /// <param name="searchMode"></param>
        private void ShowLookupDialog(LookupSearchModes searchMode)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Preparing lookup...", true, null);
                if (this.ReadOnly)
                {
                    return;
                }
                string lookupSQLString = string.Empty;

                AbstractScreen callingScreen = UtilityManager.GetContainerScreen(this);
                LookupManager.ClearLookupModal();
                List<LookupPropertyColumn> lstExistingColumns =
                    LookupColumnsPropertyEditor.GetPreviousExistingColumns(this.LookupColumns, ref lookupSQLString);

                foreach (LookupPropertyColumn col in lstExistingColumns)
                {
                    LookupManager.AddColumn(col.Caption, col.SqlName, col.AliasName, col.PercentageWidth, col.ToolTipText,
                                            col.IsDisplayMemberColumn, col.IsValueMemberColumn, col.IsCodeMemberColumn,
                                            col.TablePrefix);
                }

                if (string.IsNullOrEmpty(ApplicationIdForDbConnection))
                {
                    LookupManager.DBManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                }
                else
                {
                    LookupManager.DBManager = UtilityManager.CreateDBManagerInstance(this.ApplicationIdForDbConnection);
                }

                this.RaiseLookupShowingEvent(ref lookupSQLString, lstExistingColumns);
                Logger.Debug("Starting Lookup with qry: " + lookupSQLString);


                LookupResult result =
                    LookupManager.ShowLookupDialog(lookupSQLString, string.Empty, searchMode, null,
                                                   this.LookupDialogSize,
                                                   true,
                                                   false, false, false,
                                                   GlobalAppVariables.ObjMDIMain,
                                                   this,
                                                   this.Title);

                if (result == null || result.ReturnMode == LookupReturnModes.None)
                {
                    if (result != null)
                    {
                        Logger.Debug("Lookup retunred with mode: " + result.ReturnMode);
                    }
                    return;
                }
                Logger.Debug("Lookup retunred with mode: " + result.ReturnMode);
                switch (result.ReturnMode)
                {
                    case LookupReturnModes.Select:
                        this.FillLookupResult(result);
                        break;
                    default:
                        break;
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



        public virtual void RaiseLookupShowingEvent(ref string lookupSQLString,
                                                    List<LookupPropertyColumn> lstLookupPropertyColumns)
        {
            LookupEventArgs eventArgs = new LookupEventArgs(lookupSQLString, lstLookupPropertyColumns);
            // Make a temporary copy of the event to avoid possibility of
            // a race condition if the last subscriber unsubscribes
            // immediately after the null check and before the event is raised.
            EventHandler<LookupEventArgs> handler = LookupDialogShowing;

            // Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, eventArgs);
                lookupSQLString = eventArgs.LookupSqlString;
            }

        }
        internal virtual void RaiseLookupResultSetEvent(LookupResult result)
        {
            LookupResultEventArgs args = new LookupResultEventArgs(result);
            EventHandler<LookupResultEventArgs> handler = LookupResultSet;
            if (handler != null)
            {
                handler(this, args);
            }
        }


        private void FillLookupResult(LookupResult result)
        {
            this.LookupResult = result;
        }

        protected virtual void txtField_KeyPress(object sender, KeyPressEventArgs e)
        {
            try
            {
                if (((int)e.KeyChar == (int)Keys.Enter) && this.Lookup)
                {
                    e.Handled = true;
                    this.ShowLookupDialog(LookupSearchModes.Absolute);
                }

            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                UIManager.ClearMessageBar();//As user is typing in the text field
            }
        }




        /// <summary>
        /// Gets whether this field is in a valid state or not. This methos will typically
        /// be used in "IsReadyToSave" method of the AbstractScreen implementation.
        /// This method checks if the field is mandatory and is in one of the modes vz. new/insert/browse
        /// and if the user has left the field as blank, then a false value is returned, else true.
        /// </summary>
        /// <returns></returns>
        public bool IsValid()
        {
            return IsValid(false);
        }





        private void DCCTextField_MouseClick(object sender, MouseEventArgs e)
        {
            try
            {
                if (GetLookupIconRectangle().Contains(e.Location))
                {
                    this.Cursor = Cursors.Hand;
                }
                else
                {
                    this.Cursor = Cursors.Default;
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
        }

        private void DCCTextField_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.Cursor == Cursors.Hand)//as EventArgs e does not have the cursor location, we will depend upon the current cursor, which is set by the mose_move event.
                {
                    PerformRightHandSideIconClickAction(sender, e);
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
        }

        protected virtual void PerformRightHandSideIconClickAction(object sender, EventArgs e)
        {
            this.lstBox.Focus();
            this.ShowLookupDialog(LookupSearchModes.Absolute);
        }

        //End



        /// <summary>
        /// Typically, if this control is being used on a screen which has some lookup functionality
        /// the connections string will automatically be picked up from the current applicaton id from 
        /// application context. However if this control is being used to build a lookupcontrol library 
        /// to be used across multiple applications, and this lookup control must connect to a specific 
        /// database (regardless of the applicaiton screen this control is putin), then the property 
        /// ApplicationIdForDbConnection must be set by programmer. If it is set, a connection string
        /// to the particular databse is created.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specify this property if you want the lookup must connect to the defualt database of a package. If null, the current application context's database is picked up automatically")]
        public virtual string ApplicationIdForDbConnection
        {
            get { return applicationIdForDbConnection; }
            set { applicationIdForDbConnection = value; }
        }


        private void txtField_DoubleClick(object sender, EventArgs e)
        {
            if (this.Lookup)
            {
                ShowLookupDialog(LookupSearchModes.Absolute);
            }
        }


        private string DisplayableTitle
        {
            get
            {
                return string.IsNullOrEmpty(this.Title) ? this.Name : this.Title;
            }
        }

        private void lstBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Modifiers == Keys.Shift && e.KeyCode == Keys.Delete  && this.Lookup)
            {
                RemoveSelectedItemsFromList();
            }
        }

        private void RemoveSelectedItemsFromList()
        {
            try
            {
                if (this.lstBox.DataSource != null && this.lstBox.SelectedItems.Count > 0)
                {
                    List<DropDownItem> existingItems = (List<DropDownItem>)this.lstBox.DataSource;
                    foreach (DropDownItem item in this.lstBox.SelectedItems)
                    {
                        existingItems.Remove(item);
                    }
                    BindDataSouceToList(existingItems);
                }
            }
            finally
            {
                UIManager.ClearMessageBar();//As user has edited the contents of the list box, i.e. he/she is working on the screen and we can safely clear the message bar
            }
        }

        /// <summary>
        /// This property returns the basic list box embedded in this control for any further event handling or direct behavior modifications.
        /// </summary>
        public ListBox EmbeddedListBox
        {
            get { return this.lstBox; }
        }

        #region IDCCDataBinder Members

        /// <summary>
        /// Gets or sets the name of the column or public property of the data source 
        /// which is bound to the IDText property of this field.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Gets or sets the name of the column or public property of the data source which is bound to the IDText property of this field.")]
        public string IdTextBindingKey
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the column or public property of the data source 
        /// which is bound to the DisplayText property of this field.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Gets or sets the name of the column or public property of the data source which is bound to the DisplayText property of this field.")]
        public string DisplayTextBindingKey
        {
            get;
            set;
        }

        #endregion
    }



}