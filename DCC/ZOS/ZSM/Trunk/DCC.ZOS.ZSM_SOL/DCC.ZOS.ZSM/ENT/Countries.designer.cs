namespace DCC.ZOS.ZSM.ENT
{
    partial class Countries
    {
        /// <summary>
        /// Required designer variable
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Countries));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.txtCountryCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtmEffectiveRange = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.intCountryID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtGMTDiff = new DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField();
            this.txtISDCode = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.dccTextField1 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dccGrid1 = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.dccTextFieldGridColumn1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.dccTextFieldGridColumn2 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.dccDateGridColumn1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn2 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn3 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn4 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.country_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.country_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.country_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.isd_code = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.gmt_diff = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Effective_From = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.Effective_Till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.tableLayoutPanel2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).BeginInit();
            this.SuspendLayout();
            // 
            // scListOrBrowse
            // 
            this.scListOrBrowse.Dock = System.Windows.Forms.DockStyle.Fill;
            this.scListOrBrowse.Location = new System.Drawing.Point(0, 0);
            this.scListOrBrowse.Name = "scListOrBrowse";
            // 
            // scListOrBrowse.Panel1
            // 
            this.scListOrBrowse.Panel1.Controls.Add(this.tableLayoutPanel1);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(956, 512);
            this.scListOrBrowse.SplitterDistance = 927;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 6;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 21.05832F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.49892F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15.44277F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15.87473F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 11.66307F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 22.4622F));
            this.tableLayoutPanel1.Controls.Add(this.txtCountryCode, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.txtName, 2, 1);
            this.tableLayoutPanel1.Controls.Add(this.dtmEffectiveRange, 2, 3);
            this.tableLayoutPanel1.Controls.Add(this.intCountryID, 4, 1);
            this.tableLayoutPanel1.Controls.Add(this.txtGMTDiff, 3, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtISDCode, 2, 2);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 4;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 18.75F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.984375F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.179688F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 63.08594F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(956, 512);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // txtCountryCode
            // 
            this.txtCountryCode.AllowsNew = false;
            this.txtCountryCode.AllowsReference = false;
            this.txtCountryCode.AllowsUpdate = false;
            this.txtCountryCode.ApplicationIdForDbConnection = null;
            this.txtCountryCode.BackColor = System.Drawing.Color.Transparent;
            this.txtCountryCode.CalledScreenApplicationId = null;
            this.txtCountryCode.CalledScreenTypeName = null;
            this.txtCountryCode.CallingScreenType = null;
            this.txtCountryCode.DisplayText = "";
            this.txtCountryCode.DisplayTextBindingKey = "country_cd";
            this.txtCountryCode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCountryCode.EditingControlDataGridView = null;
            this.txtCountryCode.EditingControlFormattedValue = "";
            this.txtCountryCode.EditingControlRowIndex = 0;
            this.txtCountryCode.EditingControlValueChanged = false;
            this.txtCountryCode.EnableToolTip = false;
            this.txtCountryCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCountryCode.IdText = null;
            this.txtCountryCode.IdTextBindingKey = "";
            this.txtCountryCode.Location = new System.Drawing.Point(205, 99);
            this.txtCountryCode.Lookup = false;
            this.txtCountryCode.LookupColumns = null;
            this.txtCountryCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCountryCode.LookupResult = null;
            this.txtCountryCode.Mandatory = true;
            this.txtCountryCode.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtCountryCode.MaxCharacterLength = 5;
            this.txtCountryCode.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtCountryCode.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtCountryCode.Name = "txtCountryCode";
            this.txtCountryCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtCountryCode.PascalCase = false;
            this.txtCountryCode.RangeInQueryMode = false;
            this.txtCountryCode.ReadOnly = false;
            this.txtCountryCode.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtCountryCode.Size = new System.Drawing.Size(121, 40);
            this.txtCountryCode.TabIndex = 0;
            this.txtCountryCode.Title = "Country Code";
            this.txtCountryCode.ToolTipLookupField = "information";
            this.txtCountryCode.ValueText = null;
            // 
            // txtName
            // 
            this.txtName.AllowsNew = false;
            this.txtName.AllowsReference = false;
            this.txtName.AllowsUpdate = false;
            this.txtName.ApplicationIdForDbConnection = null;
            this.txtName.BackColor = System.Drawing.Color.Transparent;
            this.txtName.CalledScreenApplicationId = null;
            this.txtName.CalledScreenTypeName = null;
            this.txtName.CallingScreenType = null;
            this.tableLayoutPanel1.SetColumnSpan(this.txtName, 2);
            this.txtName.DisplayText = "";
            this.txtName.DisplayTextBindingKey = "country_nm";
            this.txtName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtName.EditingControlDataGridView = null;
            this.txtName.EditingControlFormattedValue = "";
            this.txtName.EditingControlRowIndex = 0;
            this.txtName.EditingControlValueChanged = false;
            this.txtName.EnableToolTip = false;
            this.txtName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.IdText = null;
            this.txtName.IdTextBindingKey = null;
            this.txtName.Location = new System.Drawing.Point(334, 99);
            this.txtName.Lookup = false;
            this.txtName.LookupColumns = null;
            this.txtName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtName.LookupResult = null;
            this.txtName.Mandatory = true;
            this.txtName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtName.MaxCharacterLength = 55;
            this.txtName.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtName.Name = "txtName";
            this.txtName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtName.PascalCase = false;
            this.txtName.RangeInQueryMode = false;
            this.txtName.ReadOnly = false;
            this.txtName.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtName.Size = new System.Drawing.Size(290, 40);
            this.txtName.TabIndex = 1;
            this.txtName.Title = "Country Name";
            this.txtName.ToolTipLookupField = "information";
            this.txtName.ValueText = null;
            // 
            // dtmEffectiveRange
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.dtmEffectiveRange, 2);
            this.dtmEffectiveRange.DiscreteInQueryMode = true;
            this.dtmEffectiveRange.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmEffectiveRange.FillDefailtValuesInInsertMode = true;
            this.dtmEffectiveRange.FromDate = null;
            this.dtmEffectiveRange.FromDateFieldBindingKey = "effective_from";
            this.dtmEffectiveRange.FromDateMandatory = true;
            this.dtmEffectiveRange.FromDateTitle = "Effective From";
            this.dtmEffectiveRange.Location = new System.Drawing.Point(333, 192);
            this.dtmEffectiveRange.Name = "dtmEffectiveRange";
            this.dtmEffectiveRange.ReadOnly = false;
            this.dtmEffectiveRange.Size = new System.Drawing.Size(292, 317);
            this.dtmEffectiveRange.TabIndex = 5;
            this.dtmEffectiveRange.TitleInQueryMode = "Effective On";
            this.dtmEffectiveRange.ToDate = null;
            this.dtmEffectiveRange.ToDateFieldBindingKey = "effective_till";
            this.dtmEffectiveRange.ToDateMandatory = true;
            this.dtmEffectiveRange.ToDateTitle = "Effective Till";
            // 
            // intCountryID
            // 
            this.intCountryID.AllowsNew = false;
            this.intCountryID.AllowsReference = false;
            this.intCountryID.AllowsUpdate = false;
            this.intCountryID.ApplicationIdForDbConnection = null;
            this.intCountryID.BackColor = System.Drawing.Color.Transparent;
            this.intCountryID.CalledScreenApplicationId = null;
            this.intCountryID.CalledScreenTypeName = null;
            this.intCountryID.CallingScreenType = null;
            this.intCountryID.DisplayText = "";
            this.intCountryID.DisplayTextBindingKey = "country_id";
            this.intCountryID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intCountryID.EditingControlDataGridView = null;
            this.intCountryID.EditingControlFormattedValue = "";
            this.intCountryID.EditingControlRowIndex = 0;
            this.intCountryID.EditingControlValueChanged = false;
            this.intCountryID.EnableToolTip = false;
            this.intCountryID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intCountryID.IdText = null;
            this.intCountryID.IdTextBindingKey = "country_id";
            this.intCountryID.Location = new System.Drawing.Point(632, 99);
            this.intCountryID.Lookup = false;
            this.intCountryID.LookupColumns = null;
            this.intCountryID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intCountryID.LookupResult = null;
            this.intCountryID.Mandatory = false;
            this.intCountryID.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intCountryID.MaxCharacterLength = 32767;
            this.intCountryID.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intCountryID.MaxValue = ((long)(9223372036854775807));
            this.intCountryID.MinimumSize = new System.Drawing.Size(10, 22);
            this.intCountryID.MinValue = ((long)(-9223372036854775808));
            this.intCountryID.Name = "intCountryID";
            this.intCountryID.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intCountryID.PascalCase = false;
            this.intCountryID.RangeInQueryMode = false;
            this.intCountryID.ReadOnly = true;
            this.intCountryID.RegularExpressionValidator = null;
            this.intCountryID.Size = new System.Drawing.Size(103, 40);
            this.intCountryID.TabIndex = 2;
            this.intCountryID.TabStop = false;
            this.intCountryID.Title = "Country ID";
            this.intCountryID.ToolTipLookupField = null;
            this.intCountryID.ValueText = null;
            // 
            // txtGMTDiff
            // 
            this.txtGMTDiff.AllowsNew = false;
            this.txtGMTDiff.AllowsReference = false;
            this.txtGMTDiff.AllowsUpdate = false;
            this.txtGMTDiff.ApplicationIdForDbConnection = null;
            this.txtGMTDiff.BackColor = System.Drawing.Color.Transparent;
            this.txtGMTDiff.CalledScreenApplicationId = null;
            this.txtGMTDiff.CalledScreenTypeName = null;
            this.txtGMTDiff.CallingScreenType = null;
            this.txtGMTDiff.DisplayText = "0.00";
            this.txtGMTDiff.DisplayTextBindingKey = "gmt_diff";
            this.txtGMTDiff.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtGMTDiff.EditingControlDataGridView = null;
            this.txtGMTDiff.EditingControlFormattedValue = "0.00";
            this.txtGMTDiff.EditingControlRowIndex = 0;
            this.txtGMTDiff.EditingControlValueChanged = true;
            this.txtGMTDiff.EnableToolTip = false;
            this.txtGMTDiff.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGMTDiff.IdText = null;
            this.txtGMTDiff.IdTextBindingKey = null;
            this.txtGMTDiff.Location = new System.Drawing.Point(481, 145);
            this.txtGMTDiff.Lookup = false;
            this.txtGMTDiff.LookupColumns = null;
            this.txtGMTDiff.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtGMTDiff.LookupResult = null;
            this.txtGMTDiff.Mandatory = true;
            this.txtGMTDiff.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtGMTDiff.MaxCharacterLength = 4;
            this.txtGMTDiff.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtGMTDiff.MaxValue = 23.5;
            this.txtGMTDiff.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtGMTDiff.MinValue = -23.5;
            this.txtGMTDiff.Name = "txtGMTDiff";
            this.txtGMTDiff.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtGMTDiff.PascalCase = false;
            this.txtGMTDiff.RangeInQueryMode = false;
            this.txtGMTDiff.ReadOnly = false;
            this.txtGMTDiff.RegularExpressionValidator = null;
            this.txtGMTDiff.Size = new System.Drawing.Size(143, 41);
            this.txtGMTDiff.TabIndex = 4;
            this.txtGMTDiff.Title = "GMT Diff";
            this.txtGMTDiff.ToolTipLookupField = "information";
            this.txtGMTDiff.ValueText = "";
            // 
            // txtISDCode
            // 
            this.txtISDCode.AllowsNew = false;
            this.txtISDCode.AllowsReference = false;
            this.txtISDCode.AllowsUpdate = false;
            this.txtISDCode.ApplicationIdForDbConnection = null;
            this.txtISDCode.BackColor = System.Drawing.Color.Transparent;
            this.txtISDCode.CalledScreenApplicationId = null;
            this.txtISDCode.CalledScreenTypeName = null;
            this.txtISDCode.CallingScreenType = null;
            this.txtISDCode.DisplayText = "";
            this.txtISDCode.DisplayTextBindingKey = "isd_code";
            this.txtISDCode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtISDCode.EditingControlDataGridView = null;
            this.txtISDCode.EditingControlFormattedValue = "";
            this.txtISDCode.EditingControlRowIndex = 0;
            this.txtISDCode.EditingControlValueChanged = false;
            this.txtISDCode.EnableToolTip = false;
            this.txtISDCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtISDCode.IdText = null;
            this.txtISDCode.IdTextBindingKey = "isd_code";
            this.txtISDCode.Location = new System.Drawing.Point(334, 145);
            this.txtISDCode.Lookup = false;
            this.txtISDCode.LookupColumns = null;
            this.txtISDCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtISDCode.LookupResult = null;
            this.txtISDCode.Mandatory = false;
            this.txtISDCode.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtISDCode.MaxCharacterLength = 10;
            this.txtISDCode.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtISDCode.MaxValue = ((long)(9223372036854775807));
            this.txtISDCode.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtISDCode.MinValue = ((long)(-9223372036854775808));
            this.txtISDCode.Name = "txtISDCode";
            this.txtISDCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtISDCode.PascalCase = false;
            this.txtISDCode.RangeInQueryMode = false;
            this.txtISDCode.ReadOnly = false;
            this.txtISDCode.RegularExpressionValidator = null;
            this.txtISDCode.Size = new System.Drawing.Size(139, 41);
            this.txtISDCode.TabIndex = 3;
            this.txtISDCode.Title = "ISD Code";
            this.txtISDCode.ToolTipLookupField = null;
            this.txtISDCode.ValueText = null;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.country_nm,
            this.country_id,
            this.country_cd,
            this.isd_code,
            this.gmt_diff,
            this.Effective_From,
            this.Effective_Till,
            this.txn_ts});
            this.grdList.DeleteRowMenuEnabled = true;
            this.grdList.DeleteVisible = true;
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdList.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdList.ExportToExcelVisible = true;
            this.grdList.InsertAfterVisible = true;
            this.grdList.InsertBeforeVisible = true;
            this.grdList.InsertLastVisible = true;
            this.grdList.InsertRowsMenuItemsEnabled = true;
            this.grdList.Location = new System.Drawing.Point(0, 0);
            this.grdList.Mandatory = false;
            this.grdList.MoveDownVisible = false;
            this.grdList.MoveUpVisible = false;
            this.grdList.MultiSelect = false;
            this.grdList.Name = "grdList";
            this.grdList.ReadOnly = true;
            this.grdList.RowHeadersWidth = 15;
            this.grdList.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(25, 512);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 3;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.Controls.Add(this.dccTextField1, 0, 0);
            this.tableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 1;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(200, 100);
            this.tableLayoutPanel2.TabIndex = 0;
            // 
            // dccTextField1
            // 
            this.dccTextField1.AllowsNew = false;
            this.dccTextField1.AllowsReference = false;
            this.dccTextField1.AllowsUpdate = false;
            this.dccTextField1.ApplicationIdForDbConnection = null;
            this.dccTextField1.BackColor = System.Drawing.Color.Transparent;
            this.dccTextField1.CalledScreenApplicationId = null;
            this.dccTextField1.CalledScreenTypeName = null;
            this.dccTextField1.CallingScreenType = null;
            this.dccTextField1.DisplayText = "";
            this.dccTextField1.DisplayTextBindingKey = null;
            this.dccTextField1.Dock = System.Windows.Forms.DockStyle.Right;
            this.dccTextField1.EditingControlDataGridView = null;
            this.dccTextField1.EditingControlFormattedValue = "";
            this.dccTextField1.EditingControlRowIndex = 0;
            this.dccTextField1.EditingControlValueChanged = false;
            this.dccTextField1.EnableToolTip = false;
            this.dccTextField1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccTextField1.IdText = null;
            this.dccTextField1.IdTextBindingKey = null;
            this.dccTextField1.Location = new System.Drawing.Point(150, 3);
            this.dccTextField1.Lookup = false;
            this.dccTextField1.LookupColumns = null;
            this.dccTextField1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextField1.LookupResult = null;
            this.dccTextField1.Mandatory = true;
            this.dccTextField1.Margin = new System.Windows.Forms.Padding(150, 3, 50, 3);
            this.dccTextField1.MaxCharacterLength = 8;
            this.dccTextField1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.dccTextField1.MinimumSize = new System.Drawing.Size(10, 22);
            this.dccTextField1.Name = "dccTextField1";
            this.dccTextField1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.dccTextField1.PascalCase = false;
            this.dccTextField1.RangeInQueryMode = false;
            this.dccTextField1.ReadOnly = false;
            this.dccTextField1.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.dccTextField1.Size = new System.Drawing.Size(10, 44);
            this.dccTextField1.TabIndex = 0;
            this.dccTextField1.Title = "Country Code";
            this.dccTextField1.ToolTipLookupField = "information";
            this.dccTextField1.ValueText = null;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dccGrid1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(200, 52);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(200, 3, 200, 3);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1, 253);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Subjects";
            // 
            // dccGrid1
            // 
            this.dccGrid1.AllowRowSorting = false;
            this.dccGrid1.AllowUserToAddRows = false;
            this.dccGrid1.AutoAddNewRowForUser = false;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle6.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle6.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle6.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle6.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle6.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dccGrid1.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle6;
            this.dccGrid1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dccGrid1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dccTextFieldGridColumn1,
            this.dccTextFieldGridColumn2,
            this.dccDateGridColumn1,
            this.dccDateGridColumn2,
            this.dccDateGridColumn3,
            this.dccDateGridColumn4});
            this.dccGrid1.DeleteRowMenuEnabled = true;
            this.dccGrid1.DeleteVisible = true;
            this.dccGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccGrid1.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dccGrid1.ExportToExcelVisible = true;
            this.dccGrid1.InsertAfterVisible = true;
            this.dccGrid1.InsertBeforeVisible = true;
            this.dccGrid1.InsertLastVisible = true;
            this.dccGrid1.InsertRowsMenuItemsEnabled = true;
            this.dccGrid1.Location = new System.Drawing.Point(3, 16);
            this.dccGrid1.Mandatory = false;
            this.dccGrid1.MoveDownVisible = false;
            this.dccGrid1.MoveUpVisible = false;
            this.dccGrid1.MultiSelect = false;
            this.dccGrid1.Name = "dccGrid1";
            this.dccGrid1.RowHeadersWidth = 15;
            this.dccGrid1.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.dccGrid1.ShowCommandStrip = false;
            this.dccGrid1.Size = new System.Drawing.Size(0, 234);
            this.dccGrid1.TabIndex = 3;
            this.dccGrid1.Title = null;
            this.dccGrid1.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.dccGrid1.VirtualMode = true;
            // 
            // dccTextFieldGridColumn1
            // 
            this.dccTextFieldGridColumn1.BindingKey = "qlfctn_subject_id";
            this.dccTextFieldGridColumn1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.dccTextFieldGridColumn1.HeaderText = "SubjectID";
            this.dccTextFieldGridColumn1.Lookup = false;
            this.dccTextFieldGridColumn1.LookupColumns = "";
            this.dccTextFieldGridColumn1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextFieldGridColumn1.Mandatory = false;
            this.dccTextFieldGridColumn1.MaxCharacterLength = 2147483647;
            this.dccTextFieldGridColumn1.Name = "dccTextFieldGridColumn1";
            this.dccTextFieldGridColumn1.PercentageWidth = 5;
            this.dccTextFieldGridColumn1.RegularExpressionValidator = "";
            this.dccTextFieldGridColumn1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccTextFieldGridColumn1.ToolTipLookupField = "information";
            this.dccTextFieldGridColumn1.Visible = false;
            this.dccTextFieldGridColumn1.Width = 25;
            // 
            // dccTextFieldGridColumn2
            // 
            this.dccTextFieldGridColumn2.BindingKey = "qlfctn_subject_nm";
            this.dccTextFieldGridColumn2.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.dccTextFieldGridColumn2.HeaderText = "Subject";
            this.dccTextFieldGridColumn2.Lookup = true;
            this.dccTextFieldGridColumn2.LookupColumns = resources.GetString("dccTextFieldGridColumn2.LookupColumns");
            this.dccTextFieldGridColumn2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextFieldGridColumn2.Mandatory = true;
            this.dccTextFieldGridColumn2.MaxCharacterLength = 2147483647;
            this.dccTextFieldGridColumn2.Name = "dccTextFieldGridColumn2";
            this.dccTextFieldGridColumn2.PercentageWidth = 50;
            this.dccTextFieldGridColumn2.RegularExpressionValidator = "";
            this.dccTextFieldGridColumn2.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccTextFieldGridColumn2.ToolTipLookupField = "information";
            this.dccTextFieldGridColumn2.Width = 5;
            // 
            // dccDateGridColumn1
            // 
            this.dccDateGridColumn1.BindingKey = "effective_from";
            this.dccDateGridColumn1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn1.DefaultCellStyle = dataGridViewCellStyle7;
            this.dccDateGridColumn1.HeaderText = "Effective From";
            this.dccDateGridColumn1.Lookup = false;
            this.dccDateGridColumn1.LookupColumns = "";
            this.dccDateGridColumn1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn1.Mandatory = false;
            this.dccDateGridColumn1.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn1.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn1.Name = "dccDateGridColumn1";
            this.dccDateGridColumn1.PercentageWidth = 25;
            this.dccDateGridColumn1.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dccDateGridColumn1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn1.ToolTipLookupField = "information";
            this.dccDateGridColumn1.Width = 5;
            // 
            // dccDateGridColumn2
            // 
            this.dccDateGridColumn2.BindingKey = "effective_from";
            this.dccDateGridColumn2.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn2.DefaultCellStyle = dataGridViewCellStyle8;
            this.dccDateGridColumn2.HeaderText = "OldEffectiveFrom";
            this.dccDateGridColumn2.Lookup = false;
            this.dccDateGridColumn2.LookupColumns = "";
            this.dccDateGridColumn2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn2.Mandatory = false;
            this.dccDateGridColumn2.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn2.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn2.Name = "dccDateGridColumn2";
            this.dccDateGridColumn2.PercentageWidth = 25;
            this.dccDateGridColumn2.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn2.ToolTipLookupField = "information";
            this.dccDateGridColumn2.Visible = false;
            this.dccDateGridColumn2.Width = 126;
            // 
            // dccDateGridColumn3
            // 
            this.dccDateGridColumn3.BindingKey = "effective_till";
            this.dccDateGridColumn3.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn3.DefaultCellStyle = dataGridViewCellStyle9;
            this.dccDateGridColumn3.HeaderText = "OldEffectiveTill";
            this.dccDateGridColumn3.Lookup = false;
            this.dccDateGridColumn3.LookupColumns = "";
            this.dccDateGridColumn3.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn3.Mandatory = false;
            this.dccDateGridColumn3.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn3.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn3.Name = "dccDateGridColumn3";
            this.dccDateGridColumn3.PercentageWidth = 25;
            this.dccDateGridColumn3.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn3.ToolTipLookupField = "information";
            this.dccDateGridColumn3.Visible = false;
            this.dccDateGridColumn3.Width = 126;
            // 
            // dccDateGridColumn4
            // 
            this.dccDateGridColumn4.BindingKey = "effective_till";
            this.dccDateGridColumn4.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn4.DefaultCellStyle = dataGridViewCellStyle10;
            this.dccDateGridColumn4.HeaderText = "Effective Till";
            this.dccDateGridColumn4.Lookup = false;
            this.dccDateGridColumn4.LookupColumns = "";
            this.dccDateGridColumn4.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn4.Mandatory = false;
            this.dccDateGridColumn4.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn4.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn4.Name = "dccDateGridColumn4";
            this.dccDateGridColumn4.PercentageWidth = 25;
            this.dccDateGridColumn4.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dccDateGridColumn4.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn4.ToolTipLookupField = "information";
            this.dccDateGridColumn4.Width = 5;
            // 
            // country_nm
            // 
            this.country_nm.BindingKey = "country_nm";
            this.country_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.country_nm.HeaderText = "Name";
            this.country_nm.Lookup = false;
            this.country_nm.LookupColumns = "";
            this.country_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.country_nm.Mandatory = true;
            this.country_nm.MaxCharacterLength = 2147483647;
            this.country_nm.Name = "country_nm";
            this.country_nm.PercentageWidth = 30;
            this.country_nm.ReadOnly = true;
            this.country_nm.RegularExpressionValidator = "";
            this.country_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.country_nm.ToolTipLookupField = "information";
            this.country_nm.Width = 5;
            // 
            // country_id
            // 
            this.country_id.BindingKey = "country_id";
            this.country_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.country_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.country_id.HeaderText = "Id";
            this.country_id.Lookup = false;
            this.country_id.LookupColumns = "";
            this.country_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.country_id.Mandatory = true;
            this.country_id.MaxValue = ((long)(9223372036854775807));
            this.country_id.MinValue = ((long)(-9223372036854775808));
            this.country_id.Name = "country_id";
            this.country_id.PercentageWidth = 15;
            this.country_id.ReadOnly = true;
            this.country_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.country_id.ToolTipLookupField = "information";
            this.country_id.Width = 5;
            // 
            // country_cd
            // 
            this.country_cd.BindingKey = "country_cd";
            this.country_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.country_cd.HeaderText = "Code";
            this.country_cd.Lookup = false;
            this.country_cd.LookupColumns = "";
            this.country_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.country_cd.Mandatory = true;
            this.country_cd.MaxCharacterLength = 2147483647;
            this.country_cd.Name = "country_cd";
            this.country_cd.PercentageWidth = 11;
            this.country_cd.ReadOnly = true;
            this.country_cd.RegularExpressionValidator = "";
            this.country_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.country_cd.ToolTipLookupField = "information";
            this.country_cd.Width = 5;
            // 
            // isd_code
            // 
            this.isd_code.BindingKey = "isd_code";
            this.isd_code.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.isd_code.DefaultCellStyle = dataGridViewCellStyle3;
            this.isd_code.HeaderText = "ISD Code";
            this.isd_code.Lookup = false;
            this.isd_code.LookupColumns = "";
            this.isd_code.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.isd_code.Mandatory = false;
            this.isd_code.MaxValue = ((long)(9223372036854775807));
            this.isd_code.MinValue = ((long)(-9223372036854775808));
            this.isd_code.Name = "isd_code";
            this.isd_code.PercentageWidth = 10;
            this.isd_code.ReadOnly = true;
            this.isd_code.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.isd_code.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.isd_code.ToolTipLookupField = "information";
            this.isd_code.Width = 5;
            // 
            // gmt_diff
            // 
            this.gmt_diff.BindingKey = "gmt_diff";
            this.gmt_diff.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.gmt_diff.HeaderText = "GMT Diff";
            this.gmt_diff.Lookup = false;
            this.gmt_diff.LookupColumns = "";
            this.gmt_diff.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.gmt_diff.Mandatory = false;
            this.gmt_diff.MaxCharacterLength = 2147483647;
            this.gmt_diff.Name = "gmt_diff";
            this.gmt_diff.PercentageWidth = 10;
            this.gmt_diff.ReadOnly = true;
            this.gmt_diff.RegularExpressionValidator = "";
            this.gmt_diff.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gmt_diff.ToolTipLookupField = "information";
            this.gmt_diff.Width = 5;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_From.DefaultCellStyle = dataGridViewCellStyle4;
            this.Effective_From.HeaderText = "Effective_From";
            this.Effective_From.Lookup = false;
            this.Effective_From.LookupColumns = "";
            this.Effective_From.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_From.Mandatory = false;
            this.Effective_From.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_From.MinValue = new System.DateTime(((long)(0)));
            this.Effective_From.Name = "Effective_From";
            this.Effective_From.PercentageWidth = 12;
            this.Effective_From.ReadOnly = true;
            this.Effective_From.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Effective_From.ToolTipLookupField = "information";
            this.Effective_From.Width = 5;
            // 
            // Effective_Till
            // 
            this.Effective_Till.BindingKey = "effective_till";
            this.Effective_Till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_Till.DefaultCellStyle = dataGridViewCellStyle5;
            this.Effective_Till.HeaderText = "Effective_Till";
            this.Effective_Till.Lookup = false;
            this.Effective_Till.LookupColumns = "";
            this.Effective_Till.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_Till.Mandatory = false;
            this.Effective_Till.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_Till.MinValue = new System.DateTime(((long)(0)));
            this.Effective_Till.Name = "Effective_Till";
            this.Effective_Till.PercentageWidth = 12;
            this.Effective_Till.ReadOnly = true;
            this.Effective_Till.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Effective_Till.ToolTipLookupField = "information";
            this.Effective_Till.Width = 5;
            // 
            // txn_ts
            // 
            this.txn_ts.BindingKey = "txn_ts";
            this.txn_ts.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Object;
            this.txn_ts.HeaderText = "txn_ts";
            this.txn_ts.Lookup = false;
            this.txn_ts.LookupColumns = "";
            this.txn_ts.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txn_ts.Mandatory = false;
            this.txn_ts.Name = "txn_ts";
            this.txn_ts.PercentageWidth = 25;
            this.txn_ts.ReadOnly = true;
            this.txn_ts.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txn_ts.ToolTipLookupField = "information";
            this.txn_ts.Visible = false;
            this.txn_ts.Width = 5;
            // 
            // Countries
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(956, 512);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "Countries";
            this.Text = "Zonal Sewadar Management - COUNTRIES]";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.tableLayoutPanel2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtCountryCode;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtName;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField dccTextField1;
        private System.Windows.Forms.GroupBox groupBox1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid dccGrid1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn dccTextFieldGridColumn1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn dccTextFieldGridColumn2;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn2;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn3;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn4;
        private DCC.UMB.CDF.UIControls.TextControls.DateRangePair dtmEffectiveRange;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intCountryID;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField txtGMTDiff;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField txtISDCode;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn country_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn country_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn country_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn isd_code;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gmt_diff;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
    }
}