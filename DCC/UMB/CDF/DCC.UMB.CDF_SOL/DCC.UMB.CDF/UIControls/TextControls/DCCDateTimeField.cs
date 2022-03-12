using System;
using System.ComponentModel;
using System.Drawing;
using System.Globalization;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCDateTimeField.bmp")]
    public partial class DCCDateTimeField : DCCTextField
    {
        private DateTime? displayTextAsDateTime = null;
        private bool showTime = false;
        string dateTimeFormat = Constants.DATE_FORMAT;

        private DateTime maxValue = DateTime.MaxValue;
        private DateTime minValue = DateTime.MinValue;
        public DCCDateTimeField()
        {
            InitializeComponent();
            this.DisplayText = string.Empty;
            this.Lookup = true;
            this.IsDateTime = true;
            this.ReadOnly = false;
            this.Width = 140;
            this.txtField.KeyDown += new KeyEventHandler(txtField_KeyDown);
            this.txtField.TextChanged += new EventHandler(txtField_TextChanged);
            this.IsDateTime = true;
            this.txtField.TextAlign = HorizontalAlignment.Center;
            this.txtField.Validating += new CancelEventHandler(txtField_Validating);
            this.MaxCharacterLength = 11;
        }
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies whether or not time piece would be visible/editable")]
        public bool ShowTime
        {
            set
            {
                this.showTime = value;
                this.dateTimeFormat = this.showTime ? Constants.DATE_TIME_FORMAT : Constants.DATE_FORMAT;
                this.MaxCharacterLength = this.showTime ? 20 : 11;
            }
            get
            {
                return this.showTime;
            }
        }


        bool allowFutureDate = true;
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("Specifies whether or not this datetime field will allow entering a future date")]
        public bool AllowFutureDate
        {
            set
            {
                this.allowFutureDate = value;
            }
            get
            {
                return this.allowFutureDate;
            }
        }

        void txtField_Validating(object sender, CancelEventArgs e)
        {
            this.DCCTextField_Validating(this, e);
        }


        //[[This is required to clear off the stored datetime value. So if the text is blank,
        //then call the ClearControlValues() which eventually will dispose off the stored datetime.
        void txtField_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtField.Text.Trim()))
            {
                this.ClearControlValues();
            }
        }
        //]]

        protected override bool CheckForValidRange()
        {
            bool result = true;
            if (this.DisplayTextAsDateTime.HasValue)
            {
                result = !(this.DisplayTextAsDateTime < this.MinValue ||
                            this.DisplayTextAsDateTime > this.MaxValue);
                if (!result)
                {
                    UIManager.ShowMessage(MsgCodes.OutOfRange,
                    string.Format("{0}|{1}|{2}",
                    this.UserFriendlyName, this.MaxValue.ToString(),
                    this.MinValue.ToString()),
                    MessageTypes.Warning);
                }
            }
            return result;
        }


        /// <summary>
        /// Gets and Sets the selected DateTime object.
        /// </summary>
        public virtual DateTime? DisplayTextAsDateTime
        {
            get { return displayTextAsDateTime; }
            set
            {
                displayTextAsDateTime = value;
                this.txtField.Text = this.displayTextAsDateTime.HasValue
                                         ? this.displayTextAsDateTime.Value.ToString(this.dateTimeFormat)
                                         : null;
                if (value == null)
                {
                    this.ClearControlValues();
                }
            }
        }
        public override string DisplayText
        {
            get
            {
                return
                    this.displayTextAsDateTime.HasValue
                        ? this.displayTextAsDateTime.Value.ToString(this.dateTimeFormat)
                        : null;
            }
            set
            {
                //This should never be set here. As DisplayText is a derived property from DisplayTextAsDateTime.
            }
        }
        /// <summary>
        /// This method resets the control in such a way that all the data stored in this control is cleared
        /// This means that properteis like IDText, ValueText, DisplayText and LookupResult will all return null.
        /// And the control will not show any text in the field.
        /// This method should be invoked when we want to clear the control (e.g. when users presses clear button 
        /// in the toolbar)
        /// </summary>
        public override void ClearControlValues()
        {
            this.IdText = string.Empty;
            this.ValueText = string.Empty;
            this.LookupResult = null;
            this.displayTextAsDateTime = null;
            this.txtField.Text = this.displayTextAsDateTime.HasValue
                                         ? this.displayTextAsDateTime.Value.ToString(this.dateTimeFormat)
                                         : null;
            if (this.RangeSupplement != null)
            {
                this.RangeSupplement.ClearControlValues();
            }
        }
        protected override void PerformRightHandSideIconClickAction(object sender, EventArgs e)
        {
            try
            {
                if (!this.txtField.Focus()) return;//try to get the focus on this field first.
                //[[If this control is in readonly mode, then we dont need to show calendar
                if (!this.ReadOnly)
                {
                    ShowCalendar();
                }
                //]]
            }
            catch (Exception ex)
            {
                //dont do anyting. 
            }
        }


        void txtField_KeyDown(object sender, KeyEventArgs e)
        {
            if (((int)e.KeyCode == (int)Keys.F4) && !this.ReadOnly)
            {
                this.ShowCalendar();
                e.Handled = true;
            }
        }


        private void ShowCalendar()
        {
            //[[User is typing/editing the date value in the text field. Clear the message bar
            UIManager.ClearMessageBar();
            //]]
            CalendarDialog dialog = new CalendarDialog();
            string calendarDialogTitle = string.Empty;
            if (!this.IsGridViewCellEditor)
            {
                calendarDialogTitle = this.Title;
            }
            else
            {
                calendarDialogTitle = this.dataGridView.Columns[this.dataGridView.CurrentColumnIndex].HeaderText;
            }

            dialog.Text = string.IsNullOrEmpty(calendarDialogTitle) ? "Select Date" : calendarDialogTitle;
            DateTime? selectedDateTime = dialog.ShowDialog(this.DisplayTextAsDateTime, GlobalAppVariables.ObjMDIMain, this);
            this.DisplayTextAsDateTime = selectedDateTime;
        }


        protected override void DCCTextField_Validating(object sender, CancelEventArgs e)
        {
            //[[User is typing in the text field. Clear the message bar
            UIManager.ClearMessageBar();
            //]]
            AbstractScreen containerScreen = UtilityManager.GetContainerScreen(this);
            UIModes containerScreenUIMode = UIModes.None;

            //[[Check for valid format of date
            bool isValidFormat = CheckForValidFormat();
            if (!isValidFormat)
            {
                e.Cancel = true;
                return;
            }
            //]]
            
            //[[show a message to the user that he has specified a future date,
            //then show a message to the user and let him proceed
            if (!CheckForFutureDate())
            {
                e.Cancel = true;
                return;
            }
            //]]

            
            if (containerScreen != null)
            {
                containerScreenUIMode = containerScreen.CurrentUIMode;
            }
            if ((containerScreenUIMode == UIModes.New ||
               containerScreenUIMode == UIModes.Browse ||
               containerScreenUIMode == UIModes.Insert ||
               containerScreenUIMode == UIModes.Update))
            {
                if (string.IsNullOrEmpty(this.txtField.Text.Trim()))
                {
                    ClearControlValues();//clear the control and let user go ahead
                    if (this.Mandatory)//Show the warning
                    {
                        UIManager.ShowMessage(MsgCodes.MandatoryFieldsEmpty,
                                              this.UserFriendlyName,
                                              MessageTypes.Warning);
                    }
                }
                else
                {
                    //[[Check for the range. In case range is invalid, let user
                    //go ahead, as he will be shown warning at this time, but will be
                    //caught in IsValid() method.
                    CheckForValidRange();
                }
                NotifyDataGridViewOfValueChange();
            }
        }

        internal bool CheckForFutureDate()
        {
            if (this.AllowFutureDate) return true;
            AbstractScreen containerScreen = UtilityManager.GetContainerScreen(this);
            if (containerScreen == null) return true;
            UIModes containerScreenUIMode = containerScreen.CurrentUIMode;
            //[[Check if a future date is specified, the above check "CheckForValidFormat()" already has set the DisplayTextAsDateTime property                
            if ((containerScreenUIMode == UIModes.New ||
              containerScreenUIMode == UIModes.Browse ||
              containerScreenUIMode == UIModes.Insert ||
              containerScreenUIMode == UIModes.Update))
            {
                DateTime currentDateTime = DateTime.Parse(DateTime.Now.ToString(Constants.DATE_FORMAT));
                if (this.DisplayTextAsDateTime > currentDateTime)
                {
                    UIManager.ShowMessage(MsgCodes.LesserOrEqualValueReqd, "Date value|current date for "+this.UserFriendlyName, MessageTypes.Warning);
                    return false;
                }
            }
            return true;
            //]]
        }

        internal bool CheckForValidFormat()
        {
            try
            {
                if (this.txtField.Text == string.Empty)
                {
                    this.ClearControlValues();
                    return true;
                }
                DateTime dt = UtilityManager.GetDateFromString(this.txtField.Text);
                this.DisplayTextAsDateTime = dt;
                return true;
            }
            catch (Exception ex)
            {
                //means the user has filled wrong value, show a message to user and select
                //the text in the text field
                UIManager.ShowMessage(MsgCodes.InvalidValue, "Format|Date in "+this.UserFriendlyName,MessageTypes.Warning);
                this.txtField.SelectionStart = 0;
                this.txtField.SelectionLength = this.txtField.Text.Length;
                return false;
            }
            return true;
        }

        private string FixDigits(string date)
        {
            return ((date.Length == 1) ? "0" + date : date);
        }

        public override object EditingControlFormattedValue
        {
            set
            {
                if (string.IsNullOrEmpty(this.txtField.Text.Trim()))
                {
                    ClearControlValues();//clear the control and let user go ahead
                }
                else
                {
                    try
                    {
                        DateTime dt = DateTime.Parse(this.txtField.Text.Trim());
                        this.DisplayTextAsDateTime = dt;
                    }
                    catch (Exception ex)
                    {
                        //means the user has filled wrong value, show a message to user and select
                        //the text in the text field
                        UIManager.ShowMessage(MsgCodes.InvalidValue, "Format|Date in " +this.UserFriendlyName, MessageTypes.Warning);
                        ClearControlValues();
                    }
                }
            }
            get
            {

                ///This getter is invoked in two scenarios. 
                /// 1. Initially when the editor is installed.
                /// 2. When the editor is uninstalling and the value is required by the grid to set it back to the grid model
                /// In the first case value is returned which is initially set in the editing control by the method InitializeEditingControl of the DCCGridCell object.
                /// But in second case the modified value must be returned. So in this case, we have an extra responsibility
                /// to validate the current text and then return it back.
                this.CheckForValidFormat();
                if (this.DisplayTextAsDateTime.HasValue)
                {
                    return this.DisplayTextAsDateTime.Value;
                }
                else
                {
                    return null;
                }
            }
        }

        public DateTime MaxValue
        {
            get { return maxValue; }
            set { maxValue = value; }
        }

        public DateTime MinValue
        {
            get { return minValue; }
            set { minValue = value; }
        }

        public void GoToMaxDate()
        {
            this.DisplayTextAsDateTime = new DateTime(9000, 12, 31);
        }
    }
}
