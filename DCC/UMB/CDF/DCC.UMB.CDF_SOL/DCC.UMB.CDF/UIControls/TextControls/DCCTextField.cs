using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Drawing.Design;
using System.Drawing.Text;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.Lookup;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.Properties;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Utils;
using Constants = DCC.UMB.CDF.Configuration.Constants;
using DCC.UMB.CDF.UIControls.UIAutomation;
using System.Reflection;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCTextField.bmp")]
    public partial class DCCTextField : UserControl, IDataGridViewEditingControl, IUIAutomationCodeProvider, IDCCDataBinder, ICloneable, IDCCControl
    {
        private bool isEnable = true;
        private bool isMandatory = false;
        private bool isLookupLabelVisible = false;
        private string lookupTitle = null;
        protected string title = "Title";
        private string valueText = null;
        private string idText = null;
        private string lookupColumns;
        private bool pascalCase = false;
        //private char mnemonic;


        private LookupDialogSizes lookupDialogSize = LookupDialogSizes.Normal;
        private Timer typingTimer = new Timer();
        private DateTime lastSearchStringModifiedAt = DateTime.Now;
        const int WIAT_MILLISCONDS = 400;



        private LookupResult lookupResult = null;
        private bool isDateTime = false;
        private string applicationIdForDbConnection;

        protected const int PADDING_WIDTH_FOR_RIGHT_SIDE_ICON = 14;
        protected const int PADDING_WIDTH_FOR_TOP_TITLE = 17;

        //[[This field will be used to host the range supplement control
        private DCCTextField rangeSupplement = null;
        //]]

        ///[[fields as a Implementor of IDataGridViewEditingControl
        protected int rowIndex;
        protected DCCGrid dataGridView;
        protected bool valueChanged = false;
        //]]

        ///[[Declare the event using EventHandler<T> for specifying an event just before the looup dialog is shown
        public event EventHandler<LookupEventArgs> LookupDialogShowing;
        //]]

        ///[[Declare the event using EventHandler<T> for specifying an event just after the lookup dialog has set the values into this text field
        public event EventHandler<LookupResultEventArgs> LookupResultSet;
        /// ]]

        public event EventHandler<EventArgs> FocusLost;

        public event EventHandler<EventArgs> DblClick;

        public event EventHandler<KeyEventArgs> KeyUp;

        ///[[This will enable a multiline tooltip 
        private ToolTip tp;
        private bool enableToolTip = false;
        private string toolTipLookupField = "information";

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("This title will be shown in lookup window")]
        public virtual string LookupTitle
        {
            get
            {
                return lookupTitle == null ? title : lookupTitle;
            }
            set { lookupTitle = value; }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("It enables the tooltip for the control")]
        public virtual bool EnableToolTip
        {
            get { return enableToolTip; }
            set { enableToolTip = value; }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("If this field is having lookup enabled, then which field of lookup result should be used as tooltip value.")]
        [Browsable(false)]
        public virtual string ToolTipLookupField
        {
            get { return toolTipLookupField; }
            set
            {
                this.toolTipLookupField = value == null ? value : value.Trim();
            }
        }
        //]]

        [Browsable(false)]
        [ReadOnly(true)]
        public DCCTextField RangeSupplement
        {
            get { return this.rangeSupplement; }
        }
        internal bool IsDateTime
        {
            get { return isDateTime; }
            set
            {
                isDateTime = value;
                AdjustPaddingAndColors();
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
        [Description("Specifies How many minimum characters are required to fetch the results from database")]
        public int MinCharactersForQuery { get; set; }


        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies whether or not this control should convert itself to a range capturing control in query mode."), Editor(typeof(TableCreator), typeof(UITypeEditor))]
        public bool RangeInQueryMode
        {
            get;
            set;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies whether or not the contnets of this text field will automatically be modified to match Pascal notations")]
        public bool PascalCase
        {
            get { return pascalCase; }
            set
            {
                if (value && Lookup)//If Pascal Case is set to true, then lookup cann't be true
                {
                    MessageBox.Show("If PascalCase is set to True, Lookup cant be applied & vice versa");
                    return;
                }
                pascalCase = value;
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual bool AllowsNew
        {
            get;
            set;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual bool AllowsUpdate
        {
            get;
            set;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual bool AllowsReference
        {
            get;
            set;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual string CallingScreenType
        {
            get;
            set;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual string CalledScreenTypeName
        {
            get;
            set;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual string CalledScreenApplicationId
        {
            get;
            set;
        }


        [Category("DCC.UMB.CDF.UIControls")]
        public virtual LookupDialogSizes LookupDialogSize
        {
            get { return this.lookupDialogSize; }
            set { this.lookupDialogSize = value; }
        }

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
        [Description("It indicates the text in the DCCTextField's TextBox.")]
        public virtual string DisplayText
        {
            get { return this.txtField.Text; }
            set { this.txtField.Text = value; }
        }

        /// <summary>
        /// Returns the starting point of the text selected in  the DCCTextField's TextBox.
        /// </summary>
        public int TextSelectionStartIndex
        {
            get { return this.txtField.SelectionStart; }
        }


        /// <summary>
        /// Returns the length of the text selected in  the DCCTextField's TextBox.
        /// </summary>
        public int TextSelectionLength
        {
            get { return this.txtField.SelectionLength; }
        }
        public TextBox EmbeddedTextField
        {
            get
            {
                return this.txtField;
            }
        }
        /// <summary>
        /// Gets or sets the ID Text of this field. This is normally the database key to which this foreign key lookup binding control has bindings.
        /// E.g. department_id or item_id etc
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        public virtual string IdText
        {
            get { return idText; }
            set { idText = value; }
        }

        public short? IdTextAsShort
        {
            get
            {
                short result = -1;
                short? returnValue = null;
                bool parseResult = short.TryParse(idText, out result);
                if (parseResult)
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }

        public int? IdTextAsInteger
        {
            get
            {
                int result = -1;
                int? returnValue = null;
                bool parseResult = int.TryParse(idText, out result);
                if (parseResult)
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }

        public byte? IdTextAsByte
        {
            get
            {
                byte result = 0;
                byte? returnValue = null;
                bool parseResult = byte.TryParse(idText, out result);
                if (parseResult)
                {
                    returnValue = result;
                }
                return returnValue;
            }
        }

        public new string Name
        {
            get { return base.Name; }
            set
            {
                base.Name = value;
                this.txtField.Name = value;
            }
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
                    //if (value.IndexOf('&') >= 0)
                    //{
                    //    this.mnemonic = value.ToCharArray()[value.IndexOf('&') + 1];
                    //}
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
                if (value && PascalCase)//If Pascal Case is set to true, then lookup cann't be true
                {
                    MessageBox.Show("If PascalCase is set to True, Lookup cant be applied & vice versa");
                    return;
                }
                isLookupLabelVisible = value;
                AdjustPaddingAndColors();
                this.typingTimer.Enabled = value;
                this.typingTimer.Stop();

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
            get { return this.txtField.ReadOnly; }
            set
            {
                this.txtField.ReadOnly = value;
                this.TabStop = !value;
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
                this.txtField.Enabled = value;
                //this.lblLookup.Enabled = value;
            }
        }

        /// <summary>
        /// Gets the lookup result object, if lookup is enabled on this field
        /// and user has selected a valid lookup record.
        /// </summary>
        public LookupResult LookupResult
        {
            get { return lookupResult; }
            set
            {
                if (value != null)
                {
                    if (value.DisplayMember == null)
                    {
                        throw new Exception("DisplayMember can't evaluate to null in lookup result");
                    }
                    this.DisplayText = value.DisplayMember.ToString();
                    this.ValueText = value.DisplayMember.ToString();
                    if (value.ValueMember == null)
                    {
                        throw new Exception("ValueMember can't evaluate to null in lookup result");
                    }
                    this.IdText = value.ValueMember.ToString();
                }
                lookupResult = value;
            }
        }

        public DCCTextField()
        {
            InitializeComponent();
            ///[[This is required to avoid flickering
            //SetStyle(ControlStyles.AllPaintingInWmPaint |
            //  ControlStyles.OptimizedDoubleBuffer |
            //  ControlStyles.UserPaint, true);
            //]]
            this.DoubleBuffered = true;

            //[[initialize the tooltip
            tp = new ToolTip();
            tp.InitialDelay = 3000;
            tp.ReshowDelay = 1500;
            tp.AutoPopDelay = 3000;
            tp.Active = true;
            //]]

            this.Lookup = false;
            this.Mandatory = false;
            this.Enabled = true;
            this.ReadOnly = false;
            this.txtField.MouseDown += new MouseEventHandler(txtField_MouseDown);

            //[[Initialize the typingTimer, for suggestions
            this.typingTimer.Interval = 500;
            this.typingTimer.Enabled = true;
            this.typingTimer.Stop();
            this.typingTimer.Tick += new EventHandler(typingTimer_Tick);
            //]]
            this.mnuSuggestions.KeyDown += new KeyEventHandler(mnuSuggestions_KeyDown);
            this.txtField.LostFocus += new EventHandler(txtField_LostFocus);
            this.txtField.KeyUp += new KeyEventHandler(txtField_KeyUp);
        }

        void txtField_KeyUp(object sender, KeyEventArgs e)
        {
            EventHandler<KeyEventArgs> handler = KeyUp;
            // Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, e);
            }
        }

        void txtField_LostFocus(object sender, EventArgs e)
        {
            EventHandler<EventArgs> handler = FocusLost;

            // Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, e);
            }
        }



        void mnuSuggestions_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Back)
            {
                this.txtField.Focus();
                if (this.txtField.Text.Length > 0)
                {
                    this.txtField.Text = this.txtField.Text.Substring(0, this.txtField.Text.Length - 1);
                }
                this.txtField.SelectionStart = this.txtField.Text.Length;
                this.txtField.SelectionLength = 0;
            }
        }

        void txtField_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                if (this.txtField.ContextMenuStrip != null)
                {
                    this.txtField.ContextMenuStrip.Enabled = true;
                    this.txtField.ContextMenuStrip.Show();
                }
            }
        }

        /// <summary>
        /// Returns if this instance is being used as a grid cell editor.
        /// </summary>
        /// <returns></returns>
        internal bool IsGridViewCellEditor
        {
            get { return this.dataGridView != null; }
        }
        /// <summary>
        /// If this field is used as a cell editor for dccgrid instance, then returns
        /// the instance of the grid else returns null
        /// </summary>
        /// <returns></returns>
        internal DCCGrid ParentGridView
        {
            get { return this.dataGridView; }
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

                //[[If lookup is enabled or the control is used as datetime and the control is not being used in grid cell, 
                //then create some space for showing the lookup/date icon on the right hand side.
                if (RenderRightSideIcon())
                {
                    rightPadding = GetPaddingWidthForRightSideIcon();
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
                    AbstractScreen screen = GetContainerScreenOfMine();
                    if (screen != null)
                    {
                        if (screen.CurrentUIMode == UIModes.Query)
                        {
                            isQueryMode = true;
                        }
                        if (screen.CurrentUIMode == UIModes.Query && this.RangeInQueryMode)
                        {
                            ShowRangeControl(true);
                        }
                        else
                        {
                            ShowRangeControl(false);
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
                this.txtField.ForeColor = foreColor;
                this.txtField.BackColor = backColor;
                //]]
            }
            finally
            {
                this.Invalidate();
            }
        }

        //[[This property holds the already evaluated containerScreen on which this instance of textfields is placed.
        private AbstractScreen containerScreenOfMine = null;
        private AbstractScreen GetContainerScreenOfMine()
        {
            if (containerScreenOfMine == null)
            {
                containerScreenOfMine = UtilityManager.GetContainerScreen(this);
            }
            return containerScreenOfMine;
        }
        //]]

        protected virtual int GetPaddingWidthForRightSideIcon()
        {
            return PADDING_WIDTH_FOR_RIGHT_SIDE_ICON;
        }

        protected virtual bool RenderRightSideIcon()
        {
            if ((this.Lookup || this.IsDateTime) && this.dataGridView == null)
            {
                return true;
            }
            return false;
        }
        private void txtField_MouseEnter(object sender, EventArgs e)
        {
            if (enableToolTip)
            {
                //[[if tooltiplookup field is not defined, then display text is the tooltip itself.
                if (string.IsNullOrEmpty(toolTipLookupField))
                {
                    tp.SetToolTip(this.txtField, this.txtField.Text);
                }
                else
                {
                    if (this.lookupResult != null)
                    {
                        if (this.lookupResult.SelectedRecords.Table.Columns.Contains(this.toolTipLookupField))
                        {
                            tp.SetToolTip(this.txtField, this.lookupResult.SelectedRecords[0][this.toolTipLookupField].ToString());
                        }
                        else
                        {
                            tp.SetToolTip(this.txtField, this.txtField.Text);
                        }
                    }
                }

            }
        }

        private void DCCTextField_MouseMove(object sender, MouseEventArgs e)
        {
            try
            {
                if (this.RenderRightSideIcon())
                {
                    Rectangle rightHandSidePaddingRectangle = GetLookupIconRectangle();
                    if (rightHandSidePaddingRectangle.Contains(e.Location))
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


        /// <summary>
        /// Paint method is overridden to paint the asterick symbol, if this
        /// text field is mandatory
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public virtual void DCCTextField_Paint(object sender, PaintEventArgs e)
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
            if (RenderRightSideIcon())
            {
                Bitmap icon = Resources.Query12_12;
                if (this.Lookup && !this.isDateTime)
                {
                    icon = Resources.Query12_12;
                }
                else if (this.Lookup && this.IsDateTime)
                {
                    icon = Resources.Calendar12_12;
                }
                e.Graphics.DrawImage(icon, GetLookupIconRectangle().X,
                                         GetLookupIconRectangle().Y);
            }
            if (rangeSupplement != null)
            {
                Font font = new Font("Verdana", 14F, FontStyle.Bold);

                e.Graphics.DrawString("-", font, Brushes.Maroon,
                                        this.txtField.Width - 6,
                                        this.txtField.Parent.Location.Y + this.txtField.Height / 2 - 12, new StringFormat());
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
            this.idText = idText;
            this.valueText = valueText;
            this.DisplayText = displayText;
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
            this.idText = string.Empty;
            this.valueText = string.Empty;
            this.DisplayText = string.Empty;
            this.LookupResult = null;
            if (this.RangeSupplement != null)
            {
                this.RangeSupplement.ClearControlValues();
            }
        }
        public string UserFriendlyName
        {
            get
            {
                return string.IsNullOrEmpty(this.Title) ? this.Name : this.Title;
            }
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
            ///[[First check if the mode is insert/new/browse, and the field is marked as 
            //mandatory and the text in the field is blank, then return false.
            AbstractScreen containerScreen = UtilityManager.GetContainerScreen(this);
            UIModes containerScreenUIMode = UIModes.None;
            if (containerScreen != null)
            {
                containerScreenUIMode = containerScreen.CurrentUIMode;
            }
            if ((containerScreenUIMode == UIModes.New ||
                containerScreenUIMode == UIModes.Browse ||
                containerScreenUIMode == UIModes.Insert ||
                containerScreenUIMode == UIModes.Params
                ))
            {
                if (this.isMandatory)
                {
                    if (string.IsNullOrEmpty(this.DisplayText))
                    {
                        if (showInvalidMessageToUser)
                        {
                            ShowMissingValueMessage();
                        }
                        return false;
                    }
                }
            }
            //]]


            ///[[Now check if there is a text, but the displaytext and value text does not match then return false
            string strDisplayText = string.IsNullOrEmpty(this.DisplayText) ? string.Empty : this.DisplayText;
            string strValueText = string.IsNullOrEmpty(this.ValueText) ? string.Empty : this.ValueText;

            //[[If the user has not selected a valid value form lookup, 
            //or has cancelled the lookup, or in logical mode no unique record 
            //was found,or there is no record in the database.
            if (this.Lookup && !IsDateTime && (strDisplayText != strValueText))
            {
                UIManager.ShowMessage(MsgCodes.LookupMatchNotFound, DisplayableTitle, MessageTypes.Error);
                return false;
            }
            //]]

            //[[Now check against Regular expression
            if (!string.IsNullOrEmpty(this.DisplayText) && !IsValidAgainstRegularExpression())
            {
                return false;
            }
            //]]
            //[[Now check for valid range, invoke virtual method
            //CheckForValidRange(). This method is overridden by
            //DCCLongIntegerField, DCCDoubleFloatField & DCCDateTimeField 
            //Classes.
            if (!CheckForValidRange())
            {
                return false;
            }
            //]]
            //[[If this is an instnace of DateTimeField then check for the format and if user has specified future date.
            if (IsDateTime)
            {
                if (!((DCCDateTimeField)this).CheckForValidFormat())
                {
                    return false;
                }
                if (!((DCCDateTimeField)this).CheckForFutureDate())
                {
                    return false;
                }
            }
            //]]
            return true;
        }

        protected virtual void DCCTextField_Validating(object sender, CancelEventArgs e)
        {
            try
            {
                StopShowSuggestions();

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
                     containerScreen.CurrentUIMode == UIModes.Insert ||
                     containerScreen.CurrentUIMode == UIModes.Update ||
                     containerScreen.CurrentUIMode == UIModes.Tabular))
                {
                    if (string.IsNullOrEmpty(this.DisplayText))
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
                    else
                    {
                        //[[Check against the invalid lookup value
                        if (this.Lookup && !this.IsDateTime)
                        {
                            if (this.DisplayText != this.ValueText)
                            {
                                this.ShowLookupDialog(LookupSearchModes.Logical);
                            }
                            if (this.DisplayText != this.ValueText)
                            //meaning the user has not selected a valid value form lookup, or has cancelled the lookup, or in logical mode no unique record was found,or there is no record in the database.
                            {
                                if (this.dataGridView != null) //Check
                                {
                                    this.DisplayText = null;
                                }
                                this.ValueText = string.Empty;
                                this.IdText = string.Empty;
                                this.LookupResult = null;

                                if (e != null)
                                {
                                    e.Cancel = true;
                                }
                            }
                        }
                        //]]

                        //[[Now check if PascalCase is set to ture, then change the contents of the text box 
                        //to pascal notations
                        if (PascalCase)
                        {
                            this.txtField.Text = UtilityManager.ConvertContentsToPascalCase(this.txtField.Text); ;
                        }
                        //]]

                        //[[Check against the specified regular expression. 
                        //However Let user go ahead, even if this expression 
                        //evaluates false as this will be handled in IsValid() method.
                        IsValidAgainstRegularExpression();
                        //]]
                    }
                }
                //]]
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
        }

        private void StopShowSuggestions()
        {
            //[[If the context menu (suggestion menu) is displayed, just close it, also stop the typing timer
            this.typingTimer.Stop();
            this.mnuSuggestions.Close();
            //]]
        }


        /// <summary>
        /// This method check for valid ranges of the current value.
        /// As the base class is a free form text field, so there is no
        /// check made, however the inheriting classes must override this
        /// in case they want to validate the range of the user entered
        /// value.
        /// </summary>
        /// <returns></returns>
        protected virtual bool CheckForValidRange()
        {
            return true;
        }
        private bool IsValidAgainstRegularExpression()
        {
            //[[Check against the specified regular expression
            bool result = true;
            if (!string.IsNullOrEmpty(this.RegularExpressionValidator))
            {
                result = UtilityManager.ValidateStringAgainstRegx(this.RegularExpressionValidator, this.DisplayText);
                if (!result)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, "Value|\"" + DisplayableTitle + "\"",
                        MessageTypes.Warning);

                }
            }
            //]]
            return result;
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
        public LookupResult ShowLookupDialog(LookupSearchModes searchMode)
        {
            StopShowSuggestions();
            this.Cursor = Cursors.WaitCursor;
            try
            {
                if (this.ReadOnly)
                {
                    return null;
                }
                string lookupSQLString = string.Empty;
                string lookupTitle = string.Empty;

                this.PrepareForLookupAndRaiseShowingEvent(ref lookupSQLString, ref lookupTitle);
                LookupResult result =
                    LookupManager.ShowLookupDialog(lookupSQLString, this.DisplayText, searchMode, null,
                                                   this.LookupDialogSize,
                                                   false,
                                                   this.AllowsNew,
                                                   this.AllowsUpdate,
                                                   this.AllowsReference,
                                                   GlobalAppVariables.ObjMDIMain,
                                                   lookupTitle, this, this.MinCharactersForQuery);

                string appId = !string.IsNullOrEmpty(ApplicationIdForDbConnection) ? ApplicationIdForDbConnection : GlobalAppVariables.AppContext.ApplicationId;

                //[[Set the properties of the lookup result, in case this lookup result is used to pass on to the called screen (in new, update or reference mode)
                result.SetLookupResultChainFlowProperties(lookupSQLString, lookupColumns, appId);
                //]]
                this.DoneWithLookup(result);
                return result;
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
                return null;
            }
            finally
            {
                this.Cursor = Cursors.Arrow;
            }
        }

        internal void DoneWithLookup(LookupResult result)
        {
            AbstractScreen callingScreen = UtilityManager.GetContainerScreen(this);
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
                    //[[Now after filling the lookup results in the text field which invoked lookup dialog
                    //tell the screen which invoked lookup about the LookupResult. This would allow screen
                    //to fill-in data in other controls (dependent controls etc)
                    if (callingScreen != null)//incase the lookup control is embedded in a modal dialog.
                    {
                        ((ILink)callingScreen).SetLookupResult(result, this);
                    }
                    //]]

                    //[[If dataGridView is not null, then push this value into the model
                    if (this.dataGridView != null)
                    {
                        this.dataGridView.SetCellValue(this.dataGridView.CurrentColumnIndex,
                                                       this.dataGridView.CurrentRowIndex, result);
                    }
                    //]]
                    NotifyDataGridViewOfValueChange();
                    break;
                case LookupReturnModes.New:
                    ILink calledUpdateScreen = (ILink)UIManager.OpenForm(Type.GetType(this.CalledScreenTypeName), UIModes.New, this.CalledScreenApplicationId, null, callingScreen, this);
                    calledUpdateScreen.SetLookupResult(result, this);
                    break;
                case LookupReturnModes.Update:
                    ILink calledNewScreen =
                        (ILink)
                        UIManager.OpenForm(Type.GetType(this.CalledScreenTypeName), UIModes.Update, this.CalledScreenApplicationId, null, callingScreen,
                                           this);
                    calledNewScreen.SetLookupResult(result, this);
                    break;
                case LookupReturnModes.Reference:
                    //Type.GetType()
                    ILink calledReferenceScreen =
                        (ILink)UIManager.OpenForm(Type.GetType(this.CalledScreenTypeName), UIModes.Reference, this.CalledScreenApplicationId, null);
                    calledReferenceScreen.SetLookupResult(result, this);
                    break;
                default:
                    break;
            }
        }

        private void PrepareForLookupAndRaiseShowingEvent(ref string lookupSQLString, ref string lookupTitle)
        {
            LookupManager.ClearLookupModal();
            List<LookupPropertyColumn> lstExistingColumns =
                LookupColumnsPropertyEditor.GetPreviousExistingColumns(this.LookupColumns, ref lookupSQLString);

            foreach (LookupPropertyColumn col in lstExistingColumns)
            {
                LookupManager.AddColumn(col.Caption, col.SqlName, col.AliasName, col.PercentageWidth, col.ToolTipText,
                                        col.IsDisplayMemberColumn, col.IsValueMemberColumn, col.IsCodeMemberColumn,
                                        col.TablePrefix);
            }
            string appId = !string.IsNullOrEmpty(ApplicationIdForDbConnection) ? ApplicationIdForDbConnection : GlobalAppVariables.AppContext.ApplicationId;
            LookupManager.DBManager = UtilityManager.CreateDBManagerInstance(appId);

            this.RaiseLookupShowingEvent(ref lookupSQLString, lstExistingColumns);
            Logger.Debug("Starting Lookup with qry: " + lookupSQLString);


            if (!this.IsGridViewCellEditor)
            {
                lookupTitle = this.lookupTitle;
            }
            else
            {
                lookupTitle = this.dataGridView.Columns[this.dataGridView.CurrentColumnIndex].HeaderText;
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

        protected virtual void txtField_KeyPress(object sender, KeyPressEventArgs e)
        {
            try
            {
                if (((int)e.KeyChar == (int)Keys.Enter) && this.Lookup && !this.IsDateTime)
                {
                    e.Handled = true;
                    this.ShowLookupDialog(LookupSearchModes.Absolute);
                }
                else if ((int)e.KeyChar == (int)Keys.Escape)
                {
                    this.ContextMenuStrip.Close();
                }
                else
                {
                    NotifyTypingStarted();
                }

            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                //[[if this textfield is being used as editor of the grid cell, and the "ESC" is fired by "SendKeys", in that case
                //keep the message intact
                if ((int)e.KeyChar != (int)Keys.Escape)
                {
                    UIManager.ClearMessageBar();//As user is typing in the text field
                }
                //]]
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
            return IsValid(true);
        }

        protected virtual Rectangle GetLookupIconRectangle()
        {
            return new Rectangle(this.txtField.Location.X + this.txtField.Width + 2, this.txtField.Location.Y + 4, GetPaddingWidthForRightSideIcon(), this.txtField.Height);
        }

        private void DCCTextField_MouseClick(object sender, MouseEventArgs e)
        {
            try
            {
                Rectangle rightHandSidePaddingRectangle = GetLookupIconRectangle();
                if (rightHandSidePaddingRectangle.Contains(e.Location))
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
                //as EventArgs e does not have the cursor location, we will depend upon the current cursor, which is set by the mose_move event.
                //if (this.Cursor == Cursors.Hand)
                Rectangle rect = GetLookupIconRectangle();// new Rectangle(this.Size.Width - 20, 2, this.Size.Width, 14);
                if (rect.Contains((e as System.Windows.Forms.MouseEventArgs).Location))
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
            this.txtField.Focus();
            this.ShowLookupDialog(LookupSearchModes.Absolute);
        }

        //End

        #region IDataGridViewEditingControl Members

        public void ApplyCellStyleToEditingControl(DataGridViewCellStyle dataGridViewCellStyle)
        {
            this.Font = dataGridViewCellStyle.Font;
            this.ForeColor = dataGridViewCellStyle.ForeColor;
            this.BackColor = dataGridViewCellStyle.BackColor;
            this.txtField.TextAlign = TranslateAlignment(dataGridViewCellStyle.Alignment);
        }

        public DataGridView EditingControlDataGridView
        {
            get { return this.dataGridView; }
            set
            {
                this.dataGridView = (DCCGrid)value;
                if (value != null)
                {
                    this.txtField.ContextMenuStrip = this.dataGridView.DCCGridContextMenu;
                }
            }
        }

        /// <summary>
        /// Making this method virtual, as it will be overridden in classes like DCCDateTimeField
        /// </summary>
        public virtual object EditingControlFormattedValue
        {
            set
            {
                //throw new Exception(
                //    "The control has come in setting the formatted value of editing control for textfield");
                this.DisplayText = value != null ? value.ToString() : string.Empty;
                if (value is LookupResult)
                {
                    this.LookupResult = (LookupResult)value;
                }
            }
            get
            {
                if (this.Lookup && !this.IsDateTime)
                {
                    if (this.txtField.Text == string.Empty)
                    {
                        this.ClearControlValues();
                    }
                    return this.LookupResult;
                }
                else
                {
                    return this.DisplayText;
                }
            }
        }

        //   Get the value of the editing control for formatting.
        public object GetEditingControlFormattedValue(DataGridViewDataErrorContexts context)
        {
            return EditingControlFormattedValue;
        }

        //  Indicates the row index of this cell.  This is often -1 for the
        //  template cell, but for other cells, might actually have a value
        //  greater than or equal to zero.
        public int EditingControlRowIndex
        {
            get { return this.rowIndex; }
            set { this.rowIndex = value; }
        }


        //  Gets or sets our flag indicating whether the value has changed.
        public bool EditingControlValueChanged
        {
            get { return valueChanged; }
            set { this.valueChanged = value; }
        }

        //  Process input key and determine if the key should be used for the editing control
        //  or allowed to be processed by the grid. Handle cursor movement keys for the MaskedTextBox
        //  control; otherwise if the DataGridView doesn't want the input key then let the editing control handle it.
        public bool EditingControlWantsInputKey(Keys keyData, bool dataGridViewWantsInputKey)
        {
            switch (keyData & Keys.KeyCode)
            {
                case Keys.Right:
                    //
                    // If the end of the selection is at the end of the string
                    // let the DataGridView treat the key message
                    //
                    if (!(this.txtField.SelectionLength == 0
                          && this.txtField.SelectionStart == this.txtField.Text.Length))
                    {
                        return true;
                    }
                    break;

                case Keys.Left:
                    //
                    // If the end of the selection is at the begining of the
                    // string or if the entire text is selected send this character 
                    // to the dataGridView; else process the key event.
                    //
                    if (!(this.txtField.SelectionLength == 0
                          && this.txtField.SelectionStart == 0))
                    {
                        return true;
                    }
                    break;

                case Keys.Home:
                case Keys.End:
                    if (this.txtField.SelectionLength != this.txtField.Text.Length)
                    {
                        return true;
                    }
                    break;

                case Keys.Prior:
                case Keys.Next:
                    if (this.valueChanged)
                    {
                        return true;
                    }
                    break;

                case Keys.Delete:
                    if (this.txtField.SelectionLength > 0 || (DisplayText != null && this.txtField.SelectionStart < this.DisplayText.Length))
                    {
                        return true;
                    }
                    break;
                //case Keys.Enter:
                //    return true;
                //    break;
            }

            //
            // defer to the DataGridView and see if it wants it.
            //
            return !dataGridViewWantsInputKey;
        }

        public Cursor EditingPanelCursor
        {
            get { return Cursors.IBeam; }
        }


        //  Prepare the editing control for edit.
        public void PrepareEditingControlForEdit(bool selectAll)
        {
            if (selectAll)
            {
                this.txtField.SelectAll();
            }
            else
            {
                //
                // Do not select all the text, but position the caret at the 
                // end of the text.
                //
                this.txtField.SelectionStart = this.DisplayText.Length;
            }
        }

        //  Indicates whether or not the parent DataGridView control should
        //  reposition the editing control every time value change is indicated.
        //  There is no need to do this for the MaskedTextBox.
        public bool RepositionEditingControlOnValueChange
        {
            get { return false; }
        }
        #endregion

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
            get;
            set;
        }

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

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies the number of characters that this text box can accomodate")]
        public int MaxCharacterLength
        {
            get { return this.txtField.MaxLength; }
            set
            {
                this.txtField.MaxLength = value;
            }
        }


        [Category("DCC.UMB.CDF.UIControls")]
        [Description("A regular expression string used during validation of the control. For more information on building regular expressions visit http://www.regular-expressions.info/quickstart.html")]
        public string RegularExpressionValidator
        {
            get;
            set;
        }

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


        private void txtField_Validated(object sender, EventArgs e)
        {
            NotifyDataGridViewOfValueChange();
        }

        private void txtField_TextChanged(object sender, EventArgs e)
        {
            NotifyDataGridViewOfValueChange();
            if (this.txtField.Text.Length == 0)
            {
                this.ContextMenuStrip.Close();
                ClearControlValues();
            }
        }
        private void NotifyTypingStarted()
        {
            lastSearchStringModifiedAt = DateTime.Now;
            typingTimer.Stop();
            typingTimer.Start();
        }
        private void typingTimer_Tick(object sender, EventArgs e)
        {
            try
            {
                typingTimer.Stop();
                TimeSpan span = DateTime.Now.Subtract(lastSearchStringModifiedAt);
                if (span.TotalMilliseconds > WIAT_MILLISCONDS)
                {
                    ShowSuggestionsToUser();
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
        }

        private void ShowSuggestionsToUser()
        {
           if (this.txtField.Text.Length < this.MinCharactersForQuery) return;
            //[[Return if the field is readonly or is not of type lookup or the current screen is in query mode.
            this.mnuSuggestions.Items.Clear();
            AbstractScreen callingScreen = UtilityManager.GetContainerScreen(this);
            if (this.ReadOnly ||
                !this.Lookup ||
                GlobalAppVariables.AppContext.IsWebDBEnabled)
            {
                return;
            }
            //]]

            //[[If there is no text in the text field, just return
            if (string.IsNullOrEmpty(this.DisplayText))
            {
                this.ContextMenuStrip.Close();
                return;
            }
            //]]

            if (UtilityManager.IsTAFEnvironment())
            {
                return;
            }
            string lookupSQLString = string.Empty;
            string lookupTitle = string.Empty;

            this.PrepareForLookupAndRaiseShowingEvent(ref lookupSQLString, ref lookupTitle);

            ///[[Now get the connection string to be passed to lookup manager.
            /// typically, if this control is being used on a screen which has some lookup functionality
            /// the connections string will automatically be picked up from the current applicaton id from 
            /// application context. However if this control is being used to build a lookupcontrol library 
            /// to be used across multiple applications, and this lookup control must connect to a specific 
            /// database (regardless of the applicaiton screen this control is putin), then the property 
            /// ApplicationIdForDbConnection must be set by programmer. If it is set, a connection string
            /// to the particular databse is created.
            //string connectionString;
            //if (string.IsNullOrEmpty(ApplicationIdForDbConnection))
            //{
            //    connectionString =
            //        DbConnectionFactory.GetConnectionStringForApplication(GlobalAppVariables.AppContext.ApplicationId);
            //}
            //else
            //{
            //    connectionString =
            //        DbConnectionFactory.GetConnectionStringForApplication(this.ApplicationIdForDbConnection);
            //}
            //LookupManager.ConnectionString = connectionString;

            if (string.IsNullOrEmpty(ApplicationIdForDbConnection))
            {
                LookupManager.DBManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
            }
            else
            {
                LookupManager.DBManager = UtilityManager.CreateDBManagerInstance(this.ApplicationIdForDbConnection);
            }

            List<LookupResult> lstSuggestions = LookupManager.GetLookupSuggestions(lookupSQLString, this.DisplayText);
            foreach (LookupResult result in lstSuggestions)
            {
                DCCSuggestionToolStripItem suggestion = new DCCSuggestionToolStripItem(result, this.mnuSuggestions, this);
                suggestion.Width = this.mnuSuggestions.MinimumSize.Width;
                this.mnuSuggestions.Items.Add(suggestion);
            }
            if (this.ContextMenuStrip.Items.Count > 0)
            {
                this.ContextMenuStrip.Show(this, 0, this.Height);
            }
            else
            {
                this.ContextMenuStrip.Close();
            }
            //]]
        }

        private void txtField_DoubleClick(object sender, EventArgs e)
        {
            if (this.Lookup && !this.isDateTime)
            {
                ShowLookupDialog(LookupSearchModes.Absolute);
                return;
            }
            //[[See if the DblClick (which is custom event is handled), if yes, then invoke it.
            EventHandler<EventArgs> handler = DblClick;

            // Event will be null if there are no subscribers
            if (handler != null)
            {
                handler(this, e);
            }

        }


        private string DisplayableTitle
        {
            get
            {
                return string.IsNullOrEmpty(this.Title) ? this.Name : this.Title;
            }
        }

        private void txtField_KeyDown(object sender, KeyEventArgs e)
        {
            if (this.IsGridViewCellEditor)
            {
                this.ParentGridView.HandleKeyDownEvent(e);
            }
            if (e.KeyCode == Keys.Down)
            {
                if (this.mnuSuggestions.Visible)
                {
                    this.mnuSuggestions.Focus();
                    if (this.mnuSuggestions.Items.Count > 0)
                    {
                        this.mnuSuggestions.Items[0].Select();
                    }
                }
            }
        }
        public void ShowRangeControl(bool showRange)
        {
            //[[If the property RangeInQuerymode is set to false, that means the range control has not been initialized even
            //so just exit without doing anything
            if (!this.RangeInQueryMode)
            {
                return;
            }
            //]]

            this.SuspendLayout();
            //if (this.rangeSupplement != null)
            //{
            //    this.rangeSupplement.Dispose();
            //    this.rangeSupplement = null;
            //}
            //[[Remove the rangeSupplement first, if it is present
            if (this.rangeSupplement != null)
            {
                this.Controls.RemoveAt(0);
                this.Controls.Add(this.txtField);
                this.txtField.Dock = DockStyle.Fill;
                if (this.rangeSupplement != null)
                {
                    this.rangeSupplement.Dispose();
                    this.rangeSupplement = null;
                }
            }
            //]]
            if (showRange)
            {
                this.rangeSupplement = (DCCTextField)this.Clone();
                rangeSupplement.Title = null;
                this.txtField.Parent.Controls.Remove(this.txtField);

                TableLayoutPanel panel = new TableLayoutPanel();
                panel.RowCount = 1;
                panel.ColumnCount = 2;
                panel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
                panel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));

                panel.Controls.Add(txtField, 0, 0);
                panel.Controls.Add(rangeSupplement, 1, 0);
                this.Controls.Add(panel);

                panel.Dock = DockStyle.Fill;
                rangeSupplement.Dock = DockStyle.Fill;
                txtField.Dock = DockStyle.Fill;
                this.rangeSupplement.Margin = new Padding(5, 0, 0, 0);
            }

            this.ResumeLayout();
            this.Refresh();
        }

        // Summary:
        //     Creates a new object that is a copy of the current instance.
        //
        // Returns:
        //     A new object that is a copy of this instance.
        public virtual object Clone()
        {
            DCCTextField clonedTextField = (DCCTextField)Activator.CreateInstance(this.GetType());
            CloneAllDCCProperties(this, clonedTextField);
            clonedTextField.RangeInQueryMode = false;
            clonedTextField.Mandatory = false;
            return clonedTextField;
        }

        protected void CloneAllDCCProperties(Control sourceControl, Control targetControl)
        {
            PropertyInfo[] arrPropertiesInfo = sourceControl.GetType().GetProperties();
            foreach (PropertyInfo info in arrPropertiesInfo)
            {
                try
                {
                    var allAttributes = info.Attributes;
                    object[] categoryAttributes = info.GetCustomAttributes(typeof(CategoryAttribute), false);
                    if (categoryAttributes.Length > 0 &&
                        ((CategoryAttribute)categoryAttributes[0]).Category == "DCC.UMB.CDF.UIControls")
                    {
                        object propertyValue = info.GetGetMethod(false).Invoke(sourceControl, null);
                        SetTargetControlProperty(targetControl, info.MetadataToken, propertyValue);
                    }
                }
                catch (Exception ex)
                {
                    throw;
                }

            }

        }

        private void SetTargetControlProperty(Control targetControl, int metaTokan, object propertyValue)
        {
            PropertyInfo[] arrPropertiesInfo = targetControl.GetType().GetProperties();
            foreach (PropertyInfo info in arrPropertiesInfo)
            {
                var allAttributes = info.Attributes;
                if (info.MetadataToken == metaTokan)
                {
                    info.GetSetMethod().Invoke(targetControl, new object[] { propertyValue });
                    return;
                }

            }
        }
        //[[This overridden method takes care of the flickering
        //protected override CreateParams CreateParams
        //{
        //    get
        //    {
        //        CreateParams cp = base.CreateParams;
        //        cp.ExStyle &= ~0x02000000;  // Turns OFF WS_CLIPCHILDREN
        //        return cp;
        //    }
        //}
        //]]
        #region IUIAutomationCodeProvider Members

        public string GetAutomationCode()
        {
            string template = "public TAFTextField uiAutomationId{get{return this.GetTextField(\"uiAutomationId\");}}";
            return template.Replace("uiAutomationId", this.txtField.Name);
        }

        #endregion


    }


}
