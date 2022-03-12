namespace DCC.UMB.CDF.UIControls.TextControls
{
    partial class DateRangePair
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.txtFromDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.tlpContainer = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtToDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.tlpContainer.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtFromDate
            // 
            this.txtFromDate.AllowsNew = false;
            this.txtFromDate.AllowsReference = false;
            this.txtFromDate.AllowsUpdate = false;
            this.txtFromDate.ApplicationIdForDbConnection = null;
            this.txtFromDate.BackColor = System.Drawing.Color.Transparent;
            this.txtFromDate.CalledScreenApplicationId = null;
            this.txtFromDate.CalledScreenTypeName = null;
            this.txtFromDate.CallingScreenType = null;
            this.txtFromDate.DisplayText = null;
            this.txtFromDate.DisplayTextAsDateTime = null;
            this.txtFromDate.DisplayTextBindingKey = "effective_from_dt";
            this.txtFromDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtFromDate.EditingControlDataGridView = null;
            this.txtFromDate.EditingControlFormattedValue = null;
            this.txtFromDate.EditingControlRowIndex = 0;
            this.txtFromDate.EditingControlValueChanged = false;
            this.txtFromDate.EnableToolTip = false;
            this.txtFromDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFromDate.IdText = "";
            this.txtFromDate.IdTextBindingKey = "from_date";
            this.txtFromDate.Location = new System.Drawing.Point(4, 3);
            this.txtFromDate.Lookup = true;
            this.txtFromDate.LookupColumns = null;
            this.txtFromDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtFromDate.LookupResult = null;
            this.txtFromDate.Mandatory = false;
            this.txtFromDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtFromDate.MaxCharacterLength = 32767;
            this.txtFromDate.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtFromDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.txtFromDate.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtFromDate.MinValue = new System.DateTime(((long)(0)));
            this.txtFromDate.Name = "txtFromDate";
            this.txtFromDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtFromDate.PascalCase = false;
            this.txtFromDate.RangeInQueryMode = false;
            this.txtFromDate.ReadOnly = false;
            this.txtFromDate.RegularExpressionValidator = null;
            this.txtFromDate.Size = new System.Drawing.Size(180, 39);
            this.txtFromDate.TabIndex = 0;
            this.txtFromDate.Title = "Effective From Date";
            this.txtFromDate.ValueText = "";
            this.txtFromDate.Validating += new System.ComponentModel.CancelEventHandler(this.txtFromDate_Validating);
            // 
            // tlpContainer
            // 
            this.tlpContainer.ColumnCount = 2;
            this.tlpContainer.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpContainer.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpContainer.Controls.Add(this.txtToDate, 1, 0);
            this.tlpContainer.Controls.Add(this.txtFromDate, 0, 0);
            this.tlpContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpContainer.Location = new System.Drawing.Point(0, 0);
            this.tlpContainer.MaximumSize = new System.Drawing.Size(2000, 45);
            this.tlpContainer.Name = "tlpContainer";
            this.tlpContainer.RowCount = 1;
            this.tlpContainer.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpContainer.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpContainer.Size = new System.Drawing.Size(376, 45);
            this.tlpContainer.TabIndex = 2;
            // 
            // txtToDate
            // 
            this.txtToDate.AllowsNew = false;
            this.txtToDate.AllowsReference = false;
            this.txtToDate.AllowsUpdate = false;
            this.txtToDate.ApplicationIdForDbConnection = null;
            this.txtToDate.BackColor = System.Drawing.Color.Transparent;
            this.txtToDate.CalledScreenApplicationId = null;
            this.txtToDate.CalledScreenTypeName = null;
            this.txtToDate.CallingScreenType = null;
            this.txtToDate.DisplayText = null;
            this.txtToDate.DisplayTextAsDateTime = null;
            this.txtToDate.DisplayTextBindingKey = "effective_till_dt";
            this.txtToDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtToDate.EditingControlDataGridView = null;
            this.txtToDate.EditingControlFormattedValue = null;
            this.txtToDate.EditingControlRowIndex = 0;
            this.txtToDate.EditingControlValueChanged = false;
            this.txtToDate.EnableToolTip = false;
            this.txtToDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtToDate.IdText = "";
            this.txtToDate.IdTextBindingKey = "to_date";
            this.txtToDate.Location = new System.Drawing.Point(192, 3);
            this.txtToDate.Lookup = true;
            this.txtToDate.LookupColumns = null;
            this.txtToDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtToDate.LookupResult = null;
            this.txtToDate.Mandatory = false;
            this.txtToDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtToDate.MaxCharacterLength = 32767;
            this.txtToDate.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtToDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.txtToDate.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtToDate.MinValue = new System.DateTime(((long)(0)));
            this.txtToDate.Name = "txtToDate";
            this.txtToDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtToDate.PascalCase = false;
            this.txtToDate.RangeInQueryMode = false;
            this.txtToDate.ReadOnly = false;
            this.txtToDate.RegularExpressionValidator = null;
            this.txtToDate.Size = new System.Drawing.Size(180, 39);
            this.txtToDate.TabIndex = 1;
            this.txtToDate.Title = "Effective Till Date";
            this.txtToDate.ValueText = "";
            this.txtToDate.Validating += new System.ComponentModel.CancelEventHandler(this.txtToDate_Validating);
            // 
            // DateRangePair
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tlpContainer);
            this.Name = "DateRangePair";
            this.Size = new System.Drawing.Size(376, 45);
            this.tlpContainer.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtFromDate;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpContainer;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtToDate;
    }
}
