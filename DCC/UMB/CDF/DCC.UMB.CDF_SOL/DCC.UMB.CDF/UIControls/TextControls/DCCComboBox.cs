using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Reflection;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.UIAutomation;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Utils;
using Constants = DCC.UMB.CDF.Configuration.Constants;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCComboBox.bmp")]
    public partial class DCCComboBox : UserControl, IUIAutomationCodeProvider, IDCCDataBinder, IDCCControl
    {
        //[[cache section, we will be storing the list of drop down items agains each fullyqualifiedname of the dropdown class        
        public static Hashtable CacheTable = new Hashtable();//will have key as Type object and value as List<DropDownItem>
        public bool TryLoadingFromCache()
        {
            //return false;
            object items = CacheTable[this.GetType()];
            if (items == null) return false;
            this.SetDataSourceFromDropDownItemList((List<DropDownItem>)items);
            return true;
        }
        //]]
        public string UserFriendlyName
        {
            get
            {
                return string.IsNullOrEmpty(this.Title) ? this.Name : this.Title;
            }
        }
        private bool isMandatory = false;
        protected string title = "Title";
        private string valueText = null;




        ///[[fields as a Implementor of IDataGridViewEditingControl
        protected int rowIndex;
        protected DCCGrid dataGridView;
        protected bool valueChanged = false;

        //]]
        private const int PADDING_WIDTH_FOR_TOP_TITLE = 16;

        ///[[Declare the event using EventHandler<T> for specifying an event for selected index changed.
        public event EventHandler<EventArgs> SelectedIndexChanged;
        //]]

        ///[[Declare the event using EventHandler<T> for specifying an event for selected value changed.
        public event EventHandler<EventArgs> SelectedValueChanged;
        //]]

        private string applicationIdForDbConnection;


        public DCCComboBox()
        {
            InitializeComponent();
            ///[[This is required to avoid flickering
            SetStyle(ControlStyles.AllPaintingInWmPaint |
              ControlStyles.OptimizedDoubleBuffer |
              ControlStyles.UserPaint, true);
            //]]
            this.Mandatory = false;
            this.Enabled = true;
            this.cmbField.DropDownStyle = ComboBoxStyle.DropDownList;
            this.cmbField.SelectedIndexChanged += new EventHandler(cmbField_SelectedIndexChanged);
            this.cmbField.SelectedValueChanged += new EventHandler(cmbField_SelectedValueChanged);
        }

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

        /// <summary>
        /// Gets or sets the name of the column or public property of the data source 
        /// which is bound to the SelectedValue property of this field.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Gets or sets the name of the column or public property of the data source which is bound to the SelectedValue of this combobox")]
        public string SelectedValueBindingKey
        {
            get;
            set;
        }

        /// <summary>
        /// Gets or sets the name of the column or public property of the data source 
        /// which is bound to the IDText property of this field.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Gets or sets the name of the column or public property of the data source which is bound to the IDText property of this field.")]
        [Browsable(false)]
        [ReadOnly(true)]
        public string IdTextBindingKey
        {
            get
            {
                return this.SelectedValueBindingKey;
            }
            set
            {
                this.SelectedValueBindingKey = value;
            }
        }

        /// <summary>
        /// Gets or sets the name of the column or public property of the data source 
        /// which is bound to the DisplayText property of this field.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Gets or sets the name of the column or public property of the data source which is bound to the DisplayText property of this field.")]
        [Browsable(false)]
        [ReadOnly(true)]
        public string DisplayTextBindingKey
        {
            get
            {
                return this.SelectedValueBindingKey;
            }
            set
            {
                this.SelectedValueBindingKey = value;
            }
        }

        void cmbField_SelectedValueChanged(object sender, EventArgs e)
        {
            EventHandler<EventArgs> handler = SelectedValueChanged;
            // Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, e);
            }
        }

        void cmbField_SelectedIndexChanged(object sender, EventArgs e)
        {
            EventHandler<EventArgs> handler = SelectedIndexChanged;
            // Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, e);
            }
        }



        //End

        /// <summary>
        /// This is the value of the foreign key record in database to which this foreign key lookup control has bindings.
        /// e.g. department_nm or item_nm
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        public virtual string ValueText
        {
            get { return valueText; }
            set { valueText = value; }
        }

        /// <summary>
        /// This is the text which we show to the user on the face of the control. In normal conditions when the value has been
        /// selected by the lookup dialog (user picking a valid value from the dialog) the valueText and DisplayText properties
        /// will be equal. 
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It indicates the text in the DCCComboBox's SeletedValue.")]
        public virtual string DisplayText
        {
            get { return this.cmbField.Text; }
            set
            {
                //[[temporary change the readonly property to false and set this item
                bool previousReadOnlyValue = this.ReadOnly;
                this.ReadOnly = false;
                //]]
                try
                {
                    this.cmbField.Text = value;
                }
                finally
                {
                    this.ReadOnly = previousReadOnlyValue;
                }
            }
        }

        public new string Name
        {
            get { return base.Name; }
            set
            {
                base.Name = value;
                this.cmbField.Name = value;
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It indicates the text of the DCCTextField's Label.")]
        public virtual string Title
        {
            get { return title; }
            set
            {
                title = value;
                AdjustPaddingAndColors();
            }
        }




        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It indicates whether the field is mandatory or not.")]
        public virtual bool Mandatory
        {
            get
            {
                return isMandatory;
            }
            set
            {
                isMandatory = value;
                this.AdjustPaddingAndColors();
            }
        }


        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Indicates whether the control is enabled.")]
        public new bool Enabled
        {
            get { return base.Enabled; }
            set
            {
                base.Enabled = value;
            }
        }

        /// <summary>
        /// This method nullifies the data source of the encapsulated combobox.
        /// </summary>
        public void NullifyDataSource()
        {
            this.cmbField.DataSource = null;
        }

        /// <summary>
        /// Sets the datasource of this combobox from a DataTableObject
        /// </summary>
        /// <param name="dataSourceTable">A Datatable whose rows will be used as items in this Combobox.</param>
        /// <param name="displayMemberName">Name of a specific column, whose contents will be used as the display text for the list items of this combobox</param>
        /// <param name="valueMemberName">Name of a specific column, whose contents will be used as the value for the list items of this combobox</param>
        public void SetDataSource(DataTable dataSourceTable, string displayMemberName, string valueMemberName)
        {
            SetDataSource(dataSourceTable, displayMemberName, valueMemberName, true);
        }
        /// <summary>
        /// Sets the datasource of this combobox from a DataTableObject
        /// </summary>
        /// <param name="dataSourceTable">A Datatable whose rows will be used as items in this Combobox.</param>
        /// <param name="displayMemberName">Name of a specific column, whose contents will be used as the display text for the list items of this combobox</param>
        /// <param name="valueMemberName">Name of a specific column, whose contents will be used as the value for the list items of this combobox</param>
        /// <param name="createNullItem">Specifies whether or not to create a default item which evalutes to null. Such an item has "..." as display text in the combobox</param>
        public void SetDataSource(DataTable dataSourceTable, string displayMemberName, string valueMemberName, bool createNullItem)
        {
            List<DropDownItem> items = DropDownItem.GenerateDropDownItems(dataSourceTable, displayMemberName,
                                                                          valueMemberName, createNullItem);
            SetDataSourceFromDropDownItemList(items);
        }

        /// <summary>
        /// Sets the datasource of this combobox from a collection of objects
        /// </summary>
        /// <param name="dataSourceCollection">A Collection of objects whose members will be used as items in this combobox</param>
        /// <param name="displayMemberName">Name of a specific public property of the underlying member of the datasource which will be used as the display text for the list items of this combobox</param>
        /// <param name="valueMemberName">Name of a specific public property of the underlying member of the datasource which will be used as the value for the list items of this combobox</param>
        public void SetDataSource(ICollection dataSourceCollection, string displayMemberName, string valueMemberName)
        {
            SetDataSource(dataSourceCollection, displayMemberName, valueMemberName, true);
        }
        /// <summary>
        /// Sets the datasource of this combobox from a collection of objects
        /// </summary>
        /// <param name="dataSourceCollection">A Collection of objects whose members will be used as items in this combobox</param>
        /// <param name="displayMemberName">Name of a specific public property of the underlying member of the datasource which will be used as the display text for the list items of this combobox</param>
        /// <param name="valueMemberName">Name of a specific public property of the underlying member of the datasource which will be used as the value for the list items of this combobox</param>
        /// <param name="createNullItem">/// <param name="createNullItem">Specifies whether or not to create a default item which evalutes to null. Such an item has "..." as display text in the combobox</param>
        public void SetDataSource(ICollection dataSourceCollection, string displayMemberName, string valueMemberName, bool createNullItem)
        {
            List<DropDownItem> items = DropDownItem.GenerateDropDownItems(dataSourceCollection, displayMemberName,
                                                                          valueMemberName, createNullItem);
            SetDataSourceFromDropDownItemList(items);
        }

        private void SetDataSourceFromDropDownItemList(List<DropDownItem> items)
        {
            //[[see if cache table contains this, if yes, replace it with latest cache
            if (CacheTable.Contains(this.GetType()))
            {
                CacheTable.Remove(this.GetType());
            }
            if (this.GetType().FullName != typeof(DCCComboBox).FullName)
            {
                CacheTable.Add(this.GetType(), items);
            }
            //]]
            this.cmbField.ValueMember = "ValueMember";
            this.cmbField.DisplayMember = "DisplayMember";
            bool previousReadOnlyStatus = this.ReadOnly;
            //[[Before changing the datasource, make the combo non-ReadOnly, as changing the datasouce
            //will cause the problem in setting the new value (as new indexes might be changed)
            this.ReadOnly = false;
            this.cmbField.DataSource = items;
            this.ReadOnly = previousReadOnlyStatus;
            //]]
            SetDefaultValue();
        }

        private void SetDefaultValue()
        {
            AbstractScreen screen = UtilityManager.GetContainerScreen(this);
            if (screen == null ||
                (screen.CurrentUIMode != UIModes.Insert &&
                screen.CurrentUIMode != UIModes.New)
                )
            {
                return;
            }
            if (this.cmbField.DataSource == null) return;
            List<DropDownItem> items = (List<DropDownItem>)(this.cmbField.DataSource);
            if (this.Mandatory &&
               !this.ReadOnly &&
               items != null)
            {
                if (items[0].ValueMember == null && items.Count == 2)
                {
                    this.SelectedItem = items[1];
                }
                if ((items[0].ValueMember != null && items.Count == 1))
                {
                    this.SelectedItem = items[0];
                }

            }
        }

        public ComboBoxStyle DropDownStyle
        {
            get { return this.cmbField.DropDownStyle; }
            set { this.cmbField.DropDownStyle = value; }
        }

        /// <summary>
        /// Returns the string representation of the selected value. If the selected value is null then an empty string is returned.
        /// </summary>
        public string SelectedValueAsStr
        {
            get { return this.cmbField.SelectedValue == null ? string.Empty : this.cmbField.SelectedValue.ToString(); }
        }
        /// <summary>
        /// Gets and Sets the selected value in the combobox. Please be noted that the selected value is specified by the ValueMember property of the data source.
        /// </summary>
        public object SelectedValue
        {
            get { return this.cmbField.SelectedValue; }
            set
            {
                //[[temporary change the readonly property to false and set this item
                bool previousReadOnlyValue = this.ReadOnly;
                this.ReadOnly = false;
                //]]
                try
                {
                    if (value == null || (value.GetType() == typeof(string) && string.IsNullOrEmpty(value.ToString())))
                    {
                        if (!(this.cmbField.Items == null || this.cmbField.Items.Count <= 0))
                        {
                            this.cmbField.SelectedIndex = 0;
                        }
                    }
                    else
                    {
                        //[[Try to cast the passed in value to the type of the ValueMember of the DropDownItem
                        try
                        {
                            Type typeOfValueMemberInDropDownItem = null;
                            if (this.cmbField.DataSource != null)
                            {
                                List<DropDownItem> lstDropDownItems = (List<DropDownItem>)this.cmbField.DataSource;
                                if (lstDropDownItems.Count > 0)
                                {
                                    typeOfValueMemberInDropDownItem = lstDropDownItems[lstDropDownItems.Count - 1].ValueMember.GetType();
                                    value = Convert.ChangeType(value, typeOfValueMemberInDropDownItem);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            throw new DCCException(null, MsgCodes.InvalidValue, "data type|drop down value");
                        }
                        //]]
                        this.cmbField.SelectedValue = value;

                    }
                }
                finally
                {
                    this.ReadOnly = previousReadOnlyValue;
                }
            }
        }

        /// <summary>
        /// Gets and sets the selected text in teh combobox. This is the text of the selected Item and corresponds to the the "DisplayMember" property of the datasource.
        /// </summary>
        public string SelectedText
        {
            get { return this.DisplayText; }
            set
            {
                this.DisplayText = value;
                ////[[temporary change the readonly property to false and set this item
                //bool previousReadOnlyValue = this.ReadOnly;
                //this.ReadOnly = false;
                ////]]
                //try
                //{

                //    if (value == null || (value.GetType() == typeof(string) && string.IsNullOrEmpty(value.ToString())))
                //    {
                //        if (!(this.cmbField.Items == null || this.cmbField.Items.Count <= 0))
                //        {
                //            this.cmbField.SelectedIndex = 0;
                //        }
                //    }
                //    else
                //    {
                //        this.cmbField.Text = value;
                //    }
                //}
                //finally
                //{
                //    this.ReadOnly = previousReadOnlyValue;
                //}

            }
        }

        /// <summary>
        /// Gets and sets the selected item in the combobox.
        /// </summary>
        public object SelectedItem
        {
            get { return this.cmbField.SelectedItem; }
            set
            {
                try
                {
                    //[[temporary change the readonly property to false and set this item
                    bool previousReadOnlyValue = this.ReadOnly;
                    this.ReadOnly = false;

                    try
                    {
                        object objEncapsulatingDropDownItem = null;
                        if (this.cmbField.Items == null || this.cmbField.Items.Count <= 0)
                        {
                            return;
                        }
                        foreach (object objDropDownItem in this.cmbField.Items)
                        {
                            if (objDropDownItem.Equals(value) ||
                                (
                                    value == null && ((DropDownItem)objDropDownItem).Item == null
                                ) ||
                                (
                                    (((DropDownItem)objDropDownItem).Item != null)
                                    &&
                                    (((DropDownItem)objDropDownItem).Item.Equals(value)))
                                )
                            {
                                objEncapsulatingDropDownItem = objDropDownItem;
                                break;
                            }
                        }

                        if (objEncapsulatingDropDownItem == null)
                        {
                            throw new DCCException(new Exception("The specified item is not found in the datasource list"),
                                                   MsgCodes.UnknownError, "");
                        }

                        this.cmbField.SelectedItem = objEncapsulatingDropDownItem;
                    }
                    finally
                    {
                        this.ReadOnly = previousReadOnlyValue;
                    }
                    //]]
                }
                catch (Exception ex)
                {
                    throw ex;
                }

            }
        }

        public int SelectedIndex
        {
            get { return this.cmbField.SelectedIndex; }
            set
            {
                //[[temporary change the readonly property to false and set this item
                bool previousReadOnlyValue = this.ReadOnly;
                this.ReadOnly = false;
                //]]
                try
                {
                    if (cmbField.Items != null && cmbField.Items.Count > 0)
                    {
                        this.cmbField.SelectedIndex = value;
                    }
                }
                finally
                {
                    SetDefaultValue();
                    this.ReadOnly = previousReadOnlyValue;
                }
            }
        }

        public byte? SelectedValueAsByte
        {
            get
            {
                byte result = 0;
                byte? returnValue = null;
                bool parseResult = byte.TryParse("" + SelectedValue, out result);
                if (parseResult)
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }

        public int? SelectedValueAsInteger
        {
            get
            {
                int result = -1;
                int? returnValue = null;
                bool parseResult = int.TryParse("" + SelectedValue, out result);
                if (parseResult)
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }

        public short? SelectedValueAsShort
        {
            get
            {
                short result = -1;
                short? returnValue = null;
                bool parseResult = short.TryParse("" + SelectedValue, out result);
                if (parseResult)
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }


        protected override bool ProcessMnemonic(char charCode)
        {
            if (IsMnemonic(charCode, this.Title) && CanSelect)
            {
                this.Focus();
                return true;
            }
            return false;
        }

        /// <summary>
        /// This method resets the control in such a way that all the data stored in this control is cleared
        /// This means that properteis like IDText, ValueText, DisplayText and LookupResult will all return null.
        /// And the control will not show any text in the field.
        /// This method should be invoked when we want to clear the control (e.g. when users presses clear button 
        /// in the toolbar)
        /// </summary>
        public void ClearControlValues()
        {
            this.SelectedIndex = 0;
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
            return IsValid(true);
        }

        /// <summary>
        /// Gets whether this field is in a valid state or not. This methos will typically
        /// be used in "IsReadyToSave" method of the AbstractScreen implementation.
        /// This method checks if the field is mandatory and is in one of the modes vz. new/insert/browse
        /// and if the user has left the field as blank, then a false value is returned, else true.
        /// </summary>
        /// <returns></returns>
        public bool IsValid(bool showInvalidMessageToUser)
        {
            ///[[First check if the mode is insert/new/browse, and the field is marked as 
            //mandatory and the text in the field is blank, then return false.
            AbstractScreen containerScreen = UtilityManager.GetContainerScreen(this);
            UIModes formMode = UIModes.None;
            if (containerScreen != null)
            {
                formMode = containerScreen.CurrentUIMode;
            }
            if ((formMode == UIModes.New ||
                formMode == UIModes.Browse ||
                formMode == UIModes.Insert ||
                formMode == UIModes.Params
                ))
            {
                if (this.isMandatory)
                {
                    if (((DropDownItem)this.cmbField.SelectedItem).ValueMember == null)
                    {
                        ShowMissingValueMessage();
                        return false;
                    }
                }
            }
            //]]
            return true;
        }
        private void ShowMissingValueMessage()
        {
            UIManager.ShowMessage(MsgCodes.ValueReqd,
                                  "\"" + (string.IsNullOrEmpty(this.Title) ? this.Name : this.Title) + "\"",
                                  MessageTypes.Warning);
        }

        private void DCCTextField_MouseClick(object sender, MouseEventArgs e)
        {
            //Console.WriteLine("Got clicked focus");
            //this.cmbField.Focus();
        }

        private void DCCTextField_Click(object sender, EventArgs e)
        {
            Console.WriteLine("Got clicked focus");
            this.cmbField.Focus();
        }

        //End



        ///   Routine to translate between DataGridView
        ///   content alignments and text box horizontal alignments.
        private static HorizontalAlignment TranslateAlignment(DataGridViewContentAlignment align)
        {
            switch (align)
            {
                case DataGridViewContentAlignment.TopLeft:
                case DataGridViewContentAlignment.MiddleLeft:
                case DataGridViewContentAlignment.BottomLeft:
                    return HorizontalAlignment.Left;

                case DataGridViewContentAlignment.TopCenter:
                case DataGridViewContentAlignment.MiddleCenter:
                case DataGridViewContentAlignment.BottomCenter:
                    return HorizontalAlignment.Center;

                case DataGridViewContentAlignment.TopRight:
                case DataGridViewContentAlignment.MiddleRight:
                case DataGridViewContentAlignment.BottomRight:
                    return HorizontalAlignment.Right;
            }

            throw new ArgumentException("Error: Invalid Content Alignment!");
        }

        //  Notify DataGridView that the value has changed.
        protected virtual void NotifyDataGridViewOfValueChange()
        {
            this.valueChanged = true;
            if (this.dataGridView != null)
            {
                this.dataGridView.NotifyCurrentCellDirty(true);
            }
        }


        internal void AdjustPaddingAndColors()
        {
            try
            {
                int bottomPadding = 0;
                int topPadding = 0;
                int leftPadding = 0;
                int rightPadding = 0;
                if (!string.IsNullOrEmpty(this.Title))
                {
                    topPadding = PADDING_WIDTH_FOR_TOP_TITLE;
                }

                this.Padding = new Padding(leftPadding, topPadding, rightPadding, bottomPadding);
                this.Height = this.cmbField.Height + topPadding + bottomPadding;
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
                this.cmbField.ForeColor = foreColor;
                this.cmbField.BackColor = backColor;
                //]]
            }
            finally
            {
                this.Invalidate();
            }
        }

        /// <summary>
        /// Specifies whether or not this combobox is readonly or not.
        /// </summary>
        public bool ReadOnly
        {
            get { return this.cmbField.ReadOnly; }
            set
            {
                this.cmbField.ReadOnly = value;
                this.AdjustPaddingAndColors();
            }
        }


        /// <summary>
        /// Paint method is overridden to paint the asterick symbol, if this
        /// text field is mandatory
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public virtual void DCCComboBox_Paint(object sender, PaintEventArgs e)
        {
            /////[[Check if the gridcontrol is not null
            ////i.e. this control instance is currently being used to render/edit 
            ////a cell in a grid. In that case the asterick is shown on the header 
            ////of the grid column and not in the field. So simply return and dont draw
            if (this.dataGridView != null) return;
            ////]]


            if (!string.IsNullOrEmpty(this.Title))
            {
                Font fontForTitle = this.Font;
                StringFormat format = new StringFormat();
                format.HotkeyPrefix = System.Drawing.Text.HotkeyPrefix.Show;
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


        }

        private void DCCComboBox_Validating(object sender, CancelEventArgs e)
        {
            //[[User is typing in the text field. Clear the message bar
            UIManager.ClearMessageBar();
            //]]

            ///[[If the validation event is caused because of the container form is closing
            //then dont do anyting, simply return from here
            AbstractScreen containerScreen = UtilityManager.GetContainerScreen(this);

            if (containerScreen == null || containerScreen.IsFormClosing)
            {
                return; //simply return
            }
            //]]
            ///[[If the mode of the form is new/browse/insert, where in the information needs 
            //to be always correct (as the form can be saved), validate the control.
            if ((containerScreen.CurrentUIMode == UIModes.New ||
                 containerScreen.CurrentUIMode == UIModes.Browse ||
                 containerScreen.CurrentUIMode == UIModes.Insert))
            {
                if (this.SelectedItem == null || ((DropDownItem)this.SelectedItem).ValueMember == null)
                {
                    ClearControlValues(); //clear the control and let user go ahead
                    if (this.isMandatory == true) //Show the warning
                    {
                        if (this.dataGridView != null)
                        {
                            return;//This is done in cell leave
                        }
                        else
                        {
                            ShowMissingValueMessage();
                        }
                    }
                }
            }
            //]]

        }
        #region IUIAutomationCodeProvider Members

        public new string GetAutomationCode()
        {
            string template = "public TAFComboBox uiAutomationId{get{return this.GetComboBox(\"uiAutomationId\");}}";
            return template.Replace("uiAutomationId", this.cmbField.Name);
        }

        #endregion
    }

    public class ReadOnlyCombo : System.Windows.Forms.ComboBox
    {
        private bool readOnly;

        [Description("DropDownList can open, but selection can't be changed.")]
        [Category("Behavior")]
        [DefaultValue(false)]
        public bool ReadOnly
        {
            get { return readOnly; }
            set
            {
                readOnly = value;
                if (readOnly)
                {
                    this.ForeColor = Constants.DEFAULT_READONLY_FORE_COLOR;
                }
                else
                {
                    this.ForeColor = Constants.DEFAULT_READWRITE_FORE_COLOR;
                }
            }
        }

        private int selectedIndex;

        protected override void OnSelectedIndexChanged(System.EventArgs e)
        {
            if (this.ReadOnly)
            {
                SelectedIndex = selectedIndex;
            }
            else
            {
                base.OnSelectedIndexChanged(e);
                selectedIndex = SelectedIndex;
            }
        }

    }

}
