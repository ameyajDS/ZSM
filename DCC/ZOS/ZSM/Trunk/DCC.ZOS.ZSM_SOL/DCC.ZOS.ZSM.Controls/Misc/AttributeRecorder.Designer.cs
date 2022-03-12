namespace DCC.SSM.ZMS.Controls.Misc
{
    partial class AttributeRecorder
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
            this.tlpBasePanel = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtStringValue = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.lblAttributeName = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.chkBooleanValue = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.txtDateValue = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.txtIntegerValue = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtNumericValue = new DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField();
            this.cmbListValue = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.pnlEffectiveFrom = new System.Windows.Forms.Panel();
            this.txtEffectiveFrom = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.pnlEffectiveTill = new System.Windows.Forms.Panel();
            this.txtEffectiveTill = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.tlpBasePanel.SuspendLayout();
            this.pnlEffectiveFrom.SuspendLayout();
            this.pnlEffectiveTill.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBasePanel
            // 
            this.tlpBasePanel.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tlpBasePanel.ColumnCount = 10;
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 1F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 1F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 1F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 1F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 11F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 11F));
            this.tlpBasePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 21F));
            this.tlpBasePanel.Controls.Add(this.txtStringValue, 3, 0);
            this.tlpBasePanel.Controls.Add(this.lblAttributeName, 0, 0);
            this.tlpBasePanel.Controls.Add(this.chkBooleanValue, 1, 0);
            this.tlpBasePanel.Controls.Add(this.txtDateValue, 2, 0);
            this.tlpBasePanel.Controls.Add(this.txtIntegerValue, 4, 0);
            this.tlpBasePanel.Controls.Add(this.txtNumericValue, 5, 0);
            this.tlpBasePanel.Controls.Add(this.cmbListValue, 6, 0);
            this.tlpBasePanel.Controls.Add(this.txtRemarks, 9, 0);
            this.tlpBasePanel.Controls.Add(this.pnlEffectiveFrom, 7, 0);
            this.tlpBasePanel.Controls.Add(this.pnlEffectiveTill, 8, 0);
            this.tlpBasePanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBasePanel.Location = new System.Drawing.Point(0, 0);
            this.tlpBasePanel.Margin = new System.Windows.Forms.Padding(0);
            this.tlpBasePanel.Name = "tlpBasePanel";
            this.tlpBasePanel.RowCount = 1;
            this.tlpBasePanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpBasePanel.Size = new System.Drawing.Size(918, 23);
            this.tlpBasePanel.TabIndex = 0;
            // 
            // txtStringValue
            // 
            this.txtStringValue.AllowsNew = false;
            this.txtStringValue.AllowsReference = false;
            this.txtStringValue.AllowsUpdate = false;
            this.txtStringValue.ApplicationIdForDbConnection = null;
            this.txtStringValue.BackColor = System.Drawing.Color.Transparent;
            this.txtStringValue.CalledScreenApplicationId = null;
            this.txtStringValue.CalledScreenTypeName = null;
            this.txtStringValue.CallingScreenType = null;
            this.txtStringValue.DisplayText = "";
            this.txtStringValue.DisplayTextBindingKey = null;
            this.txtStringValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtStringValue.EditingControlDataGridView = null;
            this.txtStringValue.EditingControlFormattedValue = "";
            this.txtStringValue.EditingControlRowIndex = 0;
            this.txtStringValue.EditingControlValueChanged = false;
            this.txtStringValue.EnableToolTip = false;
            this.txtStringValue.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStringValue.IdText = null;
            this.txtStringValue.IdTextBindingKey = null;
            this.txtStringValue.Location = new System.Drawing.Point(517, 1);
            this.txtStringValue.Lookup = false;
            this.txtStringValue.LookupColumns = null;
            this.txtStringValue.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtStringValue.LookupResult = null;
            this.txtStringValue.LookupTitle = "";
            this.txtStringValue.Mandatory = false;
            this.txtStringValue.Margin = new System.Windows.Forms.Padding(0);
            this.txtStringValue.MaxCharacterLength = 32767;
            this.txtStringValue.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtStringValue.MinCharactersForQuery = 0;
            this.txtStringValue.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtStringValue.Name = "txtStringValue";
            this.txtStringValue.PascalCase = false;
            this.txtStringValue.RangeInQueryMode = false;
            this.txtStringValue.ReadOnly = false;
            this.txtStringValue.RegularExpressionValidator = null;
            this.txtStringValue.Size = new System.Drawing.Size(10, 22);
            this.txtStringValue.TabIndex = 4;
            this.txtStringValue.Title = "";
            this.txtStringValue.ToolTipLookupField = "information";
            this.txtStringValue.ValueText = null;
            // 
            // lblAttributeName
            // 
            this.lblAttributeName.AutoSize = true;
            this.lblAttributeName.BackColor = System.Drawing.Color.Transparent;
            this.lblAttributeName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblAttributeName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAttributeName.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblAttributeName.Location = new System.Drawing.Point(4, 1);
            this.lblAttributeName.Name = "lblAttributeName";
            this.lblAttributeName.Size = new System.Drawing.Size(219, 21);
            this.lblAttributeName.TabIndex = 0;
            this.lblAttributeName.Text = "Name";
            this.lblAttributeName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // chkBooleanValue
            // 
            this.chkBooleanValue.AutoSize = true;
            this.chkBooleanValue.BackColor = System.Drawing.Color.Transparent;
            this.chkBooleanValue.BindingKey = null;
            this.chkBooleanValue.CheckAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.chkBooleanValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkBooleanValue.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkBooleanValue.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkBooleanValue.Location = new System.Drawing.Point(230, 1);
            this.chkBooleanValue.Margin = new System.Windows.Forms.Padding(3, 0, 0, 0);
            this.chkBooleanValue.Name = "chkBooleanValue";
            this.chkBooleanValue.Size = new System.Drawing.Size(141, 21);
            this.chkBooleanValue.TabIndex = 1;
            this.chkBooleanValue.UseVisualStyleBackColor = true;
            // 
            // txtDateValue
            // 
            this.txtDateValue.AllowFutureDate = true;
            this.txtDateValue.AllowsNew = false;
            this.txtDateValue.AllowsReference = false;
            this.txtDateValue.AllowsUpdate = false;
            this.txtDateValue.ApplicationIdForDbConnection = null;
            this.txtDateValue.BackColor = System.Drawing.Color.Transparent;
            this.txtDateValue.CalledScreenApplicationId = null;
            this.txtDateValue.CalledScreenTypeName = null;
            this.txtDateValue.CallingScreenType = null;
            this.txtDateValue.DisplayText = null;
            this.txtDateValue.DisplayTextAsDateTime = null;
            this.txtDateValue.DisplayTextBindingKey = null;
            this.txtDateValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDateValue.EditingControlDataGridView = null;
            this.txtDateValue.EditingControlFormattedValue = null;
            this.txtDateValue.EditingControlRowIndex = 0;
            this.txtDateValue.EditingControlValueChanged = false;
            this.txtDateValue.EnableToolTip = false;
            this.txtDateValue.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDateValue.IdText = "";
            this.txtDateValue.IdTextBindingKey = null;
            this.txtDateValue.Location = new System.Drawing.Point(372, 1);
            this.txtDateValue.Lookup = true;
            this.txtDateValue.LookupColumns = null;
            this.txtDateValue.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtDateValue.LookupResult = null;
            this.txtDateValue.LookupTitle = "";
            this.txtDateValue.Mandatory = false;
            this.txtDateValue.Margin = new System.Windows.Forms.Padding(0);
            this.txtDateValue.MaxCharacterLength = 11;
            this.txtDateValue.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtDateValue.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.txtDateValue.MinCharactersForQuery = 0;
            this.txtDateValue.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtDateValue.MinValue = new System.DateTime(((long)(0)));
            this.txtDateValue.Name = "txtDateValue";
            this.txtDateValue.Padding = new System.Windows.Forms.Padding(0, 0, 14, 0);
            this.txtDateValue.PascalCase = false;
            this.txtDateValue.RangeInQueryMode = false;
            this.txtDateValue.ReadOnly = false;
            this.txtDateValue.RegularExpressionValidator = null;
            this.txtDateValue.ShowTime = false;
            this.txtDateValue.Size = new System.Drawing.Size(144, 22);
            this.txtDateValue.TabIndex = 2;
            this.txtDateValue.Title = "";
            this.txtDateValue.ToolTipLookupField = "information";
            this.txtDateValue.ValueText = "";
            // 
            // txtIntegerValue
            // 
            this.txtIntegerValue.AllowsNew = false;
            this.txtIntegerValue.AllowsReference = false;
            this.txtIntegerValue.AllowsUpdate = false;
            this.txtIntegerValue.ApplicationIdForDbConnection = null;
            this.txtIntegerValue.BackColor = System.Drawing.Color.Transparent;
            this.txtIntegerValue.CalledScreenApplicationId = null;
            this.txtIntegerValue.CalledScreenTypeName = null;
            this.txtIntegerValue.CallingScreenType = null;
            this.txtIntegerValue.DisplayText = "";
            this.txtIntegerValue.DisplayTextBindingKey = null;
            this.txtIntegerValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtIntegerValue.EditingControlDataGridView = null;
            this.txtIntegerValue.EditingControlFormattedValue = "";
            this.txtIntegerValue.EditingControlRowIndex = 0;
            this.txtIntegerValue.EditingControlValueChanged = false;
            this.txtIntegerValue.EnableToolTip = false;
            this.txtIntegerValue.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtIntegerValue.IdText = null;
            this.txtIntegerValue.IdTextBindingKey = null;
            this.txtIntegerValue.Location = new System.Drawing.Point(519, 1);
            this.txtIntegerValue.Lookup = false;
            this.txtIntegerValue.LookupColumns = null;
            this.txtIntegerValue.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtIntegerValue.LookupResult = null;
            this.txtIntegerValue.LookupTitle = "";
            this.txtIntegerValue.Mandatory = false;
            this.txtIntegerValue.Margin = new System.Windows.Forms.Padding(0);
            this.txtIntegerValue.MaxCharacterLength = 32767;
            this.txtIntegerValue.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtIntegerValue.MaxValue = ((long)(9223372036854775807));
            this.txtIntegerValue.MinCharactersForQuery = 0;
            this.txtIntegerValue.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtIntegerValue.MinValue = ((long)(-9223372036854775808));
            this.txtIntegerValue.Name = "txtIntegerValue";
            this.txtIntegerValue.PascalCase = false;
            this.txtIntegerValue.RangeInQueryMode = false;
            this.txtIntegerValue.ReadOnly = false;
            this.txtIntegerValue.RegularExpressionValidator = null;
            this.txtIntegerValue.Size = new System.Drawing.Size(10, 22);
            this.txtIntegerValue.TabIndex = 5;
            this.txtIntegerValue.Title = "";
            this.txtIntegerValue.ToolTipLookupField = "information";
            this.txtIntegerValue.ValueText = null;
            // 
            // txtNumericValue
            // 
            this.txtNumericValue.AllowsNew = false;
            this.txtNumericValue.AllowsReference = false;
            this.txtNumericValue.AllowsUpdate = false;
            this.txtNumericValue.ApplicationIdForDbConnection = null;
            this.txtNumericValue.BackColor = System.Drawing.Color.Transparent;
            this.txtNumericValue.CalledScreenApplicationId = null;
            this.txtNumericValue.CalledScreenTypeName = null;
            this.txtNumericValue.CallingScreenType = null;
            this.txtNumericValue.DisplayText = "";
            this.txtNumericValue.DisplayTextBindingKey = null;
            this.txtNumericValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtNumericValue.EditingControlDataGridView = null;
            this.txtNumericValue.EditingControlFormattedValue = "";
            this.txtNumericValue.EditingControlRowIndex = 0;
            this.txtNumericValue.EditingControlValueChanged = false;
            this.txtNumericValue.EnableToolTip = false;
            this.txtNumericValue.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNumericValue.IdText = null;
            this.txtNumericValue.IdTextBindingKey = null;
            this.txtNumericValue.Location = new System.Drawing.Point(521, 1);
            this.txtNumericValue.Lookup = false;
            this.txtNumericValue.LookupColumns = null;
            this.txtNumericValue.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtNumericValue.LookupResult = null;
            this.txtNumericValue.LookupTitle = "";
            this.txtNumericValue.Mandatory = false;
            this.txtNumericValue.Margin = new System.Windows.Forms.Padding(0);
            this.txtNumericValue.MaxCharacterLength = 32767;
            this.txtNumericValue.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtNumericValue.MaxValue = 1.7976931348623157E+308D;
            this.txtNumericValue.MinCharactersForQuery = 0;
            this.txtNumericValue.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtNumericValue.MinValue = -1.7976931348623157E+308D;
            this.txtNumericValue.Name = "txtNumericValue";
            this.txtNumericValue.PascalCase = false;
            this.txtNumericValue.RangeInQueryMode = false;
            this.txtNumericValue.ReadOnly = false;
            this.txtNumericValue.RegularExpressionValidator = null;
            this.txtNumericValue.Size = new System.Drawing.Size(10, 22);
            this.txtNumericValue.TabIndex = 6;
            this.txtNumericValue.Title = "";
            this.txtNumericValue.ToolTipLookupField = "information";
            this.txtNumericValue.ValueText = null;
            // 
            // cmbListValue
            // 
            this.cmbListValue.ApplicationIdForDbConnection = null;
            this.cmbListValue.BackColor = System.Drawing.Color.Transparent;
            this.cmbListValue.DisplayText = "";
            this.cmbListValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbListValue.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbListValue.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbListValue.Location = new System.Drawing.Point(523, 1);
            this.cmbListValue.Mandatory = false;
            this.cmbListValue.Margin = new System.Windows.Forms.Padding(0);
            this.cmbListValue.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbListValue.MinimumSize = new System.Drawing.Size(10, 22);
            this.cmbListValue.Name = "cmbListValue";
            this.cmbListValue.ReadOnly = false;
            this.cmbListValue.SelectedIndex = -1;
            this.cmbListValue.SelectedItem = null;
            this.cmbListValue.SelectedText = "";
            this.cmbListValue.SelectedValue = null;
            this.cmbListValue.SelectedValueBindingKey = null;
            this.cmbListValue.Size = new System.Drawing.Size(10, 22);
            this.cmbListValue.TabIndex = 7;
            this.cmbListValue.Title = "";
            this.cmbListValue.ValueText = null;
            // 
            // txtRemarks
            // 
            this.txtRemarks.AllowsNew = false;
            this.txtRemarks.AllowsReference = false;
            this.txtRemarks.AllowsUpdate = false;
            this.txtRemarks.ApplicationIdForDbConnection = null;
            this.txtRemarks.BackColor = System.Drawing.Color.Transparent;
            this.txtRemarks.CalledScreenApplicationId = null;
            this.txtRemarks.CalledScreenTypeName = null;
            this.txtRemarks.CallingScreenType = null;
            this.txtRemarks.DisplayText = "";
            this.txtRemarks.DisplayTextBindingKey = null;
            this.txtRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRemarks.EditingControlDataGridView = null;
            this.txtRemarks.EditingControlFormattedValue = "";
            this.txtRemarks.EditingControlRowIndex = 0;
            this.txtRemarks.EditingControlValueChanged = false;
            this.txtRemarks.EnableToolTip = false;
            this.txtRemarks.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRemarks.IdText = null;
            this.txtRemarks.IdTextBindingKey = null;
            this.txtRemarks.Location = new System.Drawing.Point(725, 1);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.LookupTitle = "";
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(0);
            this.txtRemarks.MaxCharacterLength = 32767;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtRemarks.MinCharactersForQuery = 0;
            this.txtRemarks.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.RegularExpressionValidator = null;
            this.txtRemarks.Size = new System.Drawing.Size(192, 22);
            this.txtRemarks.TabIndex = 10;
            this.txtRemarks.Title = "";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
            // 
            // pnlEffectiveFrom
            // 
            this.pnlEffectiveFrom.Controls.Add(this.txtEffectiveFrom);
            this.pnlEffectiveFrom.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlEffectiveFrom.Location = new System.Drawing.Point(525, 1);
            this.pnlEffectiveFrom.Margin = new System.Windows.Forms.Padding(0);
            this.pnlEffectiveFrom.Name = "pnlEffectiveFrom";
            this.pnlEffectiveFrom.Size = new System.Drawing.Size(99, 21);
            this.pnlEffectiveFrom.TabIndex = 11;
            // 
            // txtEffectiveFrom
            // 
            this.txtEffectiveFrom.AllowFutureDate = true;
            this.txtEffectiveFrom.AllowsNew = false;
            this.txtEffectiveFrom.AllowsReference = false;
            this.txtEffectiveFrom.AllowsUpdate = false;
            this.txtEffectiveFrom.ApplicationIdForDbConnection = null;
            this.txtEffectiveFrom.BackColor = System.Drawing.Color.Transparent;
            this.txtEffectiveFrom.CalledScreenApplicationId = null;
            this.txtEffectiveFrom.CalledScreenTypeName = null;
            this.txtEffectiveFrom.CallingScreenType = null;
            this.txtEffectiveFrom.DisplayText = null;
            this.txtEffectiveFrom.DisplayTextAsDateTime = null;
            this.txtEffectiveFrom.DisplayTextBindingKey = null;
            this.txtEffectiveFrom.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtEffectiveFrom.EditingControlDataGridView = null;
            this.txtEffectiveFrom.EditingControlFormattedValue = null;
            this.txtEffectiveFrom.EditingControlRowIndex = 0;
            this.txtEffectiveFrom.EditingControlValueChanged = false;
            this.txtEffectiveFrom.EnableToolTip = false;
            this.txtEffectiveFrom.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEffectiveFrom.IdText = "";
            this.txtEffectiveFrom.IdTextBindingKey = null;
            this.txtEffectiveFrom.Location = new System.Drawing.Point(0, 0);
            this.txtEffectiveFrom.Lookup = true;
            this.txtEffectiveFrom.LookupColumns = null;
            this.txtEffectiveFrom.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtEffectiveFrom.LookupResult = null;
            this.txtEffectiveFrom.LookupTitle = "";
            this.txtEffectiveFrom.Mandatory = false;
            this.txtEffectiveFrom.Margin = new System.Windows.Forms.Padding(0);
            this.txtEffectiveFrom.MaxCharacterLength = 11;
            this.txtEffectiveFrom.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtEffectiveFrom.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.txtEffectiveFrom.MinCharactersForQuery = 0;
            this.txtEffectiveFrom.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtEffectiveFrom.MinValue = new System.DateTime(((long)(0)));
            this.txtEffectiveFrom.Name = "txtEffectiveFrom";
            this.txtEffectiveFrom.Padding = new System.Windows.Forms.Padding(0, 0, 14, 0);
            this.txtEffectiveFrom.PascalCase = false;
            this.txtEffectiveFrom.RangeInQueryMode = false;
            this.txtEffectiveFrom.ReadOnly = false;
            this.txtEffectiveFrom.RegularExpressionValidator = null;
            this.txtEffectiveFrom.ShowTime = false;
            this.txtEffectiveFrom.Size = new System.Drawing.Size(99, 22);
            this.txtEffectiveFrom.TabIndex = 8;
            this.txtEffectiveFrom.Title = "";
            this.txtEffectiveFrom.ToolTipLookupField = "information";
            this.txtEffectiveFrom.ValueText = "";
            // 
            // pnlEffectiveTill
            // 
            this.pnlEffectiveTill.Controls.Add(this.txtEffectiveTill);
            this.pnlEffectiveTill.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlEffectiveTill.Location = new System.Drawing.Point(625, 1);
            this.pnlEffectiveTill.Margin = new System.Windows.Forms.Padding(0);
            this.pnlEffectiveTill.Name = "pnlEffectiveTill";
            this.pnlEffectiveTill.Size = new System.Drawing.Size(99, 21);
            this.pnlEffectiveTill.TabIndex = 12;
            // 
            // txtEffectiveTill
            // 
            this.txtEffectiveTill.AllowFutureDate = true;
            this.txtEffectiveTill.AllowsNew = false;
            this.txtEffectiveTill.AllowsReference = false;
            this.txtEffectiveTill.AllowsUpdate = false;
            this.txtEffectiveTill.ApplicationIdForDbConnection = null;
            this.txtEffectiveTill.BackColor = System.Drawing.Color.Transparent;
            this.txtEffectiveTill.CalledScreenApplicationId = null;
            this.txtEffectiveTill.CalledScreenTypeName = null;
            this.txtEffectiveTill.CallingScreenType = null;
            this.txtEffectiveTill.DisplayText = null;
            this.txtEffectiveTill.DisplayTextAsDateTime = null;
            this.txtEffectiveTill.DisplayTextBindingKey = null;
            this.txtEffectiveTill.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtEffectiveTill.EditingControlDataGridView = null;
            this.txtEffectiveTill.EditingControlFormattedValue = null;
            this.txtEffectiveTill.EditingControlRowIndex = 0;
            this.txtEffectiveTill.EditingControlValueChanged = false;
            this.txtEffectiveTill.EnableToolTip = false;
            this.txtEffectiveTill.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEffectiveTill.IdText = "";
            this.txtEffectiveTill.IdTextBindingKey = null;
            this.txtEffectiveTill.Location = new System.Drawing.Point(0, 0);
            this.txtEffectiveTill.Lookup = true;
            this.txtEffectiveTill.LookupColumns = null;
            this.txtEffectiveTill.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtEffectiveTill.LookupResult = null;
            this.txtEffectiveTill.LookupTitle = "";
            this.txtEffectiveTill.Mandatory = false;
            this.txtEffectiveTill.Margin = new System.Windows.Forms.Padding(1, 0, 0, 0);
            this.txtEffectiveTill.MaxCharacterLength = 11;
            this.txtEffectiveTill.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtEffectiveTill.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.txtEffectiveTill.MinCharactersForQuery = 0;
            this.txtEffectiveTill.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtEffectiveTill.MinValue = new System.DateTime(((long)(0)));
            this.txtEffectiveTill.Name = "txtEffectiveTill";
            this.txtEffectiveTill.Padding = new System.Windows.Forms.Padding(0, 0, 14, 0);
            this.txtEffectiveTill.PascalCase = false;
            this.txtEffectiveTill.RangeInQueryMode = false;
            this.txtEffectiveTill.ReadOnly = false;
            this.txtEffectiveTill.RegularExpressionValidator = null;
            this.txtEffectiveTill.ShowTime = false;
            this.txtEffectiveTill.Size = new System.Drawing.Size(99, 22);
            this.txtEffectiveTill.TabIndex = 9;
            this.txtEffectiveTill.Title = "";
            this.txtEffectiveTill.ToolTipLookupField = "information";
            this.txtEffectiveTill.ValueText = "";
            // 
            // AttributeRecorder
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tlpBasePanel);
            this.Margin = new System.Windows.Forms.Padding(0);
            this.MaximumSize = new System.Drawing.Size(20000, 22);
            this.MinimumSize = new System.Drawing.Size(0, 23);
            this.Name = "AttributeRecorder";
            this.Size = new System.Drawing.Size(918, 23);
            this.tlpBasePanel.ResumeLayout(false);
            this.tlpBasePanel.PerformLayout();
            this.pnlEffectiveFrom.ResumeLayout(false);
            this.pnlEffectiveTill.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBasePanel;
        private DCC.UMB.CDF.UIControls.DCCLabel lblAttributeName;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkBooleanValue;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtDateValue;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtStringValue;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField txtIntegerValue;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField txtNumericValue;
        private DCC.UMB.CDF.UIControls.TextControls.DCCComboBox cmbListValue;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtEffectiveTill;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtEffectiveFrom;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtRemarks;
        private System.Windows.Forms.Panel pnlEffectiveFrom;
        private System.Windows.Forms.Panel pnlEffectiveTill;
    }
}
