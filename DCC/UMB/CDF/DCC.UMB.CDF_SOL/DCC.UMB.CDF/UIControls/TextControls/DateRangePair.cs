using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Utils;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    public partial class DateRangePair : UserControl, IDCCControl
    {
        //private string oldValueOfFromDateTitle = null;        
        public DateRangePair()
        {
            InitializeComponent();
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public string FromDateTitle
        {
            get;
            set;
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public string ToDateTitle
        {
            get { return this.txtToDate.Title; }
            set { this.txtToDate.Title = value; }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public DateTime? FromDate
        {
            get { return this.txtFromDate.DisplayTextAsDateTime; }
            set { this.txtFromDate.DisplayTextAsDateTime = value; }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public DateTime? ToDate
        {
            get { return this.txtToDate.DisplayTextAsDateTime; }
            set { this.txtToDate.DisplayTextAsDateTime = value; }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public bool FromDateMandatory
        {
            get { return this.txtFromDate.Mandatory; }
            set { this.txtFromDate.Mandatory = value; }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public bool ToDateMandatory
        {
            get { return this.txtToDate.Mandatory; }
            set { this.txtToDate.Mandatory = value; }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public bool DiscreteInQueryMode
        {
            get;
            set;
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public bool ReadOnly
        {
            get { return this.txtFromDate.ReadOnly; }
            set
            {
                this.txtFromDate.ReadOnly = value;
                this.txtToDate.ReadOnly = value;
            }
        }
        [Browsable(false)]
        public bool Mandatory {
            get { return this.ToDateMandatory && this.FromDateMandatory; }
            set { this.ToDateMandatory = value; this.FromDateMandatory = value; }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public string TitleInQueryMode
        {
            get;
            set;
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public bool FillDefailtValuesInInsertMode { get; set; }
        private enum ValidateWhat
        {
            To,
            From,
            Both
        }
        public string UserFriendlyName
        {
            get
            {
                return string.IsNullOrEmpty(this.FromDateTitle) ? this.Name : this.FromDateTitle;
            }
        }
        private void txtToDate_Validating(object sender, CancelEventArgs e)
        {
            IsValid(ValidateWhat.To);
        }

        public bool IsValid()
        {
            return IsValid(ValidateWhat.Both);
        }
        private bool IsValid(ValidateWhat validateWhat)
        {
            DateTime? fromDate = this.FromDate;
            DateTime? toDate = this.ToDate;

            if (validateWhat == ValidateWhat.From || validateWhat == ValidateWhat.Both)
            {
                if (this.FromDateMandatory && !fromDate.HasValue)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "'" + this.txtFromDate.Title + "'", MessageTypes.Warning);
                    return false;
                }
            }
            if (validateWhat == ValidateWhat.To || validateWhat == ValidateWhat.Both)
            {
                if (this.ToDateMandatory && !toDate.HasValue)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "'" + this.txtToDate.Title + "'", MessageTypes.Warning);
                    return false;
                }
            }

            if (fromDate.HasValue && toDate.HasValue)
            {
                if (toDate.Value < fromDate.Value)
                {
                    UIManager.ShowMessage(MsgCodes.GreaterOrEqualValueReqd, string.Format("'{0}'|'{1}'", this.txtToDate.Title, this.txtFromDate.Title), MessageTypes.Warning);
                    return false;
                }
            }
            return true;
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public string FromDateFieldBindingKey
        {
            get { return this.txtFromDate.DisplayTextBindingKey; }
            set { this.txtFromDate.DisplayTextBindingKey = value; }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        public string ToDateFieldBindingKey
        {
            get { return this.txtToDate.DisplayTextBindingKey; }
            set { this.txtToDate.DisplayTextBindingKey = value; }
        }
        public DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField TxtToDate
        {
            get { return txtToDate; }
            set { txtToDate = value; }
        }
        public DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField TxtFromDate
        {
            get { return txtFromDate; }
            set { txtFromDate = value; }
        }
        private void txtFromDate_Validating(object sender, CancelEventArgs e)
        {
            IsValid(ValidateWhat.From);
        }

        public DateTime? GetDateTimeForBindingKey(string bindingKey)
        {
            return bindingKey == this.FromDateFieldBindingKey ? this.FromDate : this.ToDate;
        }
        public void ClearControlValues()
        {
            AbstractScreen screen = null;
            screen = UtilityManager.GetContainerScreen(this);
            this.txtToDate.ClearControlValues();
            this.txtFromDate.ClearControlValues();
            if (screen != null)
            {                
                if (screen.CurrentUIMode == UIModes.Insert && this.FillDefailtValuesInInsertMode)
                {
                    this.txtFromDate.DisplayTextAsDateTime = DateTime.Now;
                    this.txtToDate.DisplayTextAsDateTime = DateTime.MaxValue.Subtract(new TimeSpan(23,59,59));
                }
            }
        }
        internal void AdjustPaddingAndColors()
        {
            this.txtToDate.Visible = true;
            AbstractScreen screen = null;
            screen = UtilityManager.GetContainerScreen(this);
            if (screen != null)
            {
                if (screen.CurrentUIMode == UIModes.Query &&
                    this.DiscreteInQueryMode)
                {
                    this.txtToDate.Visible = false;
                    this.txtFromDate.Title = this.TitleInQueryMode;
                }
                else
                {
                    this.txtFromDate.Title = this.FromDateTitle;
                }
                //if (screen.CurrentUIMode == UIModes.Insert && this.FillDefailtValuesInInsertMode)
                //{
                //    if (string.IsNullOrEmpty(this.txtFromDate.DisplayText) && string.IsNullOrEmpty(this.txtToDate.DisplayText))
                //    {
                //        this.txtFromDate.DisplayTextAsDateTime = DateTime.Now;
                //        this.txtToDate.DisplayTextAsDateTime = DateTime.MaxValue;
                //    }
                //}
            }
        }
    }
}
