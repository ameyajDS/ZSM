namespace DCC.ZOS.ZSM.ENT
{
    partial class States
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(States));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.txtStateCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtStateName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtmEffectiveRange = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.intStateID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.lookupCountries = new DCC.UMB.CDBLookups.CountriesLookup();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.state_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.state_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.state_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.country_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.country_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Effective_From = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.Effective_Till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
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
            this.scListOrBrowse.Size = new System.Drawing.Size(956, 512);
            this.scListOrBrowse.SplitterDistance = 927;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 3;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33334F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33334F));
            this.tableLayoutPanel1.Controls.Add(this.txtStateCode, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtStateName, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.dtmEffectiveRange, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.intStateID, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.lookupCountries, 1, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 3;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 13.08594F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.10938F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 74.80469F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(927, 512);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // txtStateCode
            // 
            this.txtStateCode.AllowsNew = false;
            this.txtStateCode.AllowsReference = false;
            this.txtStateCode.AllowsUpdate = false;
            this.txtStateCode.ApplicationIdForDbConnection = null;
            this.txtStateCode.BackColor = System.Drawing.Color.Transparent;
            this.txtStateCode.CalledScreenApplicationId = null;
            this.txtStateCode.CalledScreenTypeName = null;
            this.txtStateCode.CallingScreenType = null;
            this.txtStateCode.DisplayText = "";
            this.txtStateCode.DisplayTextBindingKey = "state_cd";
            this.txtStateCode.Dock = System.Windows.Forms.DockStyle.Right;
            this.txtStateCode.EditingControlDataGridView = null;
            this.txtStateCode.EditingControlFormattedValue = "";
            this.txtStateCode.EditingControlRowIndex = 0;
            this.txtStateCode.EditingControlValueChanged = false;
            this.txtStateCode.EnableToolTip = false;
            this.txtStateCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStateCode.IdText = null;
            this.txtStateCode.IdTextBindingKey = "";
            this.txtStateCode.Location = new System.Drawing.Point(205, 3);
            this.txtStateCode.Lookup = false;
            this.txtStateCode.LookupColumns = null;
            this.txtStateCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtStateCode.LookupResult = null;
            this.txtStateCode.Mandatory = true;
            this.txtStateCode.Margin = new System.Windows.Forms.Padding(140, 3, 3, 3);
            this.txtStateCode.MaxCharacterLength = 5;
            this.txtStateCode.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtStateCode.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtStateCode.Name = "txtStateCode";
            this.txtStateCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtStateCode.PascalCase = false;
            this.txtStateCode.RangeInQueryMode = false;
            this.txtStateCode.ReadOnly = false;
            this.txtStateCode.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtStateCode.Size = new System.Drawing.Size(100, 44);
            this.txtStateCode.TabIndex = 0;
            this.txtStateCode.Title = "State Code";
            this.txtStateCode.ToolTipLookupField = "information";
            this.txtStateCode.ValueText = null;
            // 
            // txtStateName
            // 
            this.txtStateName.AllowsNew = false;
            this.txtStateName.AllowsReference = false;
            this.txtStateName.AllowsUpdate = false;
            this.txtStateName.ApplicationIdForDbConnection = null;
            this.txtStateName.BackColor = System.Drawing.Color.Transparent;
            this.txtStateName.CalledScreenApplicationId = null;
            this.txtStateName.CalledScreenTypeName = null;
            this.txtStateName.CallingScreenType = null;
            this.txtStateName.DisplayText = "";
            this.txtStateName.DisplayTextBindingKey = "state_nm";
            this.txtStateName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtStateName.EditingControlDataGridView = null;
            this.txtStateName.EditingControlFormattedValue = "";
            this.txtStateName.EditingControlRowIndex = 0;
            this.txtStateName.EditingControlValueChanged = false;
            this.txtStateName.EnableToolTip = false;
            this.txtStateName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStateName.IdText = null;
            this.txtStateName.IdTextBindingKey = null;
            this.txtStateName.Location = new System.Drawing.Point(312, 3);
            this.txtStateName.Lookup = false;
            this.txtStateName.LookupColumns = "";
            this.txtStateName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtStateName.LookupResult = null;
            this.txtStateName.Mandatory = true;
            this.txtStateName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtStateName.MaxCharacterLength = 55;
            this.txtStateName.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtStateName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtStateName.Name = "txtStateName";
            this.txtStateName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtStateName.PascalCase = false;
            this.txtStateName.RangeInQueryMode = false;
            this.txtStateName.ReadOnly = false;
            this.txtStateName.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtStateName.Size = new System.Drawing.Size(301, 44);
            this.txtStateName.TabIndex = 1;
            this.txtStateName.Title = "State Name";
            this.txtStateName.ToolTipLookupField = "information";
            this.txtStateName.ValueText = null;
            // 
            // dtmEffectiveRange
            // 
            this.dtmEffectiveRange.DiscreteInQueryMode = true;
            this.dtmEffectiveRange.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmEffectiveRange.FillDefailtValuesInInsertMode = true;
            this.dtmEffectiveRange.FromDate = null;
            this.dtmEffectiveRange.FromDateFieldBindingKey = "effective_from";
            this.dtmEffectiveRange.FromDateMandatory = true;
            this.dtmEffectiveRange.FromDateTitle = "Effective From";
            this.dtmEffectiveRange.Location = new System.Drawing.Point(311, 132);
            this.dtmEffectiveRange.Name = "dtmEffectiveRange";
            this.dtmEffectiveRange.ReadOnly = false;
            this.dtmEffectiveRange.Size = new System.Drawing.Size(303, 377);
            this.dtmEffectiveRange.TabIndex = 4;
            this.dtmEffectiveRange.TitleInQueryMode = "Effective On";
            this.dtmEffectiveRange.ToDate = null;
            this.dtmEffectiveRange.ToDateFieldBindingKey = "effective_till";
            this.dtmEffectiveRange.ToDateMandatory = true;
            this.dtmEffectiveRange.ToDateTitle = "Effective Till";
            // 
            // intStateID
            // 
            this.intStateID.AllowsNew = false;
            this.intStateID.AllowsReference = false;
            this.intStateID.AllowsUpdate = false;
            this.intStateID.ApplicationIdForDbConnection = null;
            this.intStateID.BackColor = System.Drawing.Color.Transparent;
            this.intStateID.CalledScreenApplicationId = null;
            this.intStateID.CalledScreenTypeName = null;
            this.intStateID.CallingScreenType = null;
            this.intStateID.DisplayText = "";
            this.intStateID.DisplayTextBindingKey = "state_id";
            this.intStateID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intStateID.EditingControlDataGridView = null;
            this.intStateID.EditingControlFormattedValue = "";
            this.intStateID.EditingControlRowIndex = 0;
            this.intStateID.EditingControlValueChanged = false;
            this.intStateID.EnableToolTip = false;
            this.intStateID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intStateID.IdText = null;
            this.intStateID.IdTextBindingKey = "state_id";
            this.intStateID.Location = new System.Drawing.Point(621, 3);
            this.intStateID.Lookup = false;
            this.intStateID.LookupColumns = null;
            this.intStateID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intStateID.LookupResult = null;
            this.intStateID.Mandatory = false;
            this.intStateID.Margin = new System.Windows.Forms.Padding(4, 3, 150, 3);
            this.intStateID.MaxCharacterLength = 32767;
            this.intStateID.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intStateID.MaxValue = ((long)(9223372036854775807));
            this.intStateID.MinimumSize = new System.Drawing.Size(10, 22);
            this.intStateID.MinValue = ((long)(-9223372036854775808));
            this.intStateID.Name = "intStateID";
            this.intStateID.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intStateID.PascalCase = false;
            this.intStateID.RangeInQueryMode = false;
            this.intStateID.ReadOnly = true;
            this.intStateID.RegularExpressionValidator = null;
            this.intStateID.Size = new System.Drawing.Size(156, 45);
            this.intStateID.TabIndex = 2;
            this.intStateID.TabStop = false;
            this.intStateID.Title = "State ID";
            this.intStateID.ToolTipLookupField = null;
            this.intStateID.ValueText = null;
            // 
            // lookupCountries
            // 
            this.lookupCountries.AllowsNew = false;
            this.lookupCountries.AllowsReference = false;
            this.lookupCountries.AllowsUpdate = false;
            this.lookupCountries.BackColor = System.Drawing.Color.Transparent;
            this.lookupCountries.CalledScreenApplicationId = null;
            this.lookupCountries.CalledScreenTypeName = null;
            this.lookupCountries.CallingScreenType = null;
            this.lookupCountries.DisplayText = "";
            this.lookupCountries.DisplayTextBindingKey = "country_nm";
            this.lookupCountries.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lookupCountries.EditingControlDataGridView = null;
            this.lookupCountries.EditingControlFormattedValue = null;
            this.lookupCountries.EditingControlRowIndex = 0;
            this.lookupCountries.EditingControlValueChanged = true;
            this.lookupCountries.EnableToolTip = false;
            this.lookupCountries.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lookupCountries.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lookupCountries.IdText = null;
            this.lookupCountries.IdTextBindingKey = "country_id";
            this.lookupCountries.Location = new System.Drawing.Point(312, 70);
            this.lookupCountries.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lookupCountries.LookupResult = null;
            this.lookupCountries.Mandatory = true;
            this.lookupCountries.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.lookupCountries.MaxCharacterLength = 32767;
            this.lookupCountries.MaximumSize = new System.Drawing.Size(1300, 45);
            this.lookupCountries.MinimumSize = new System.Drawing.Size(10, 22);
            this.lookupCountries.Name = "lookupCountries";
            this.lookupCountries.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lookupCountries.PascalCase = false;
            this.lookupCountries.RangeInQueryMode = false;
            this.lookupCountries.ReadOnly = false;
            this.lookupCountries.RegularExpressionValidator = null;
            this.lookupCountries.Size = new System.Drawing.Size(301, 45);
            this.lookupCountries.TabIndex = 3;
            this.lookupCountries.Title = "Country";
            this.lookupCountries.ToolTipLookupField = "information";
            this.lookupCountries.ValueText = null;
            this.lookupCountries.Load += new System.EventHandler(this.lookupCountries_Load);
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
            this.state_id,
            this.state_cd,
            this.state_nm,
            this.country_id,
            this.country_nm,
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
            // state_id
            // 
            this.state_id.BindingKey = "state_id";
            this.state_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.state_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.state_id.HeaderText = "State Id";
            this.state_id.Lookup = false;
            this.state_id.LookupColumns = "";
            this.state_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.state_id.Mandatory = true;
            this.state_id.MaxValue = ((long)(9223372036854775807));
            this.state_id.MinValue = ((long)(-9223372036854775808));
            this.state_id.Name = "state_id";
            this.state_id.PercentageWidth = 5;
            this.state_id.ReadOnly = true;
            this.state_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.state_id.ToolTipLookupField = "information";
            this.state_id.Width = 5;
            // 
            // state_cd
            // 
            this.state_cd.BindingKey = "state_cd";
            this.state_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.state_cd.HeaderText = "State Code";
            this.state_cd.Lookup = false;
            this.state_cd.LookupColumns = "";
            this.state_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.state_cd.Mandatory = true;
            this.state_cd.MaxCharacterLength = 2147483647;
            this.state_cd.Name = "state_cd";
            this.state_cd.PercentageWidth = 15;
            this.state_cd.ReadOnly = true;
            this.state_cd.RegularExpressionValidator = "";
            this.state_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.state_cd.ToolTipLookupField = "information";
            this.state_cd.Width = 5;
            // 
            // state_nm
            // 
            this.state_nm.BindingKey = "state_nm";
            this.state_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.state_nm.HeaderText = "State Name";
            this.state_nm.Lookup = false;
            this.state_nm.LookupColumns = "";
            this.state_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.state_nm.Mandatory = true;
            this.state_nm.MaxCharacterLength = 2147483647;
            this.state_nm.Name = "state_nm";
            this.state_nm.PercentageWidth = 25;
            this.state_nm.ReadOnly = true;
            this.state_nm.RegularExpressionValidator = "";
            this.state_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.state_nm.ToolTipLookupField = "information";
            this.state_nm.Width = 5;
            // 
            // country_id
            // 
            this.country_id.BindingKey = "country_id";
            this.country_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.country_id.DefaultCellStyle = dataGridViewCellStyle3;
            this.country_id.HeaderText = "Country ID";
            this.country_id.Lookup = false;
            this.country_id.LookupColumns = "";
            this.country_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.country_id.Mandatory = false;
            this.country_id.MaxValue = ((long)(9223372036854775807));
            this.country_id.MinValue = ((long)(-9223372036854775808));
            this.country_id.Name = "country_id";
            this.country_id.PercentageWidth = 25;
            this.country_id.ReadOnly = true;
            this.country_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.country_id.ToolTipLookupField = "information";
            this.country_id.Visible = false;
            // 
            // country_nm
            // 
            this.country_nm.BindingKey = "country_nm";
            this.country_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.country_nm.HeaderText = "Country Name";
            this.country_nm.Lookup = false;
            this.country_nm.LookupColumns = "";
            this.country_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.country_nm.Mandatory = false;
            this.country_nm.MaxCharacterLength = 2147483647;
            this.country_nm.Name = "country_nm";
            this.country_nm.PercentageWidth = 25;
            this.country_nm.ReadOnly = true;
            this.country_nm.RegularExpressionValidator = "";
            this.country_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.country_nm.ToolTipLookupField = "information";
            this.country_nm.Width = 5;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_From.DefaultCellStyle = dataGridViewCellStyle4;
            this.Effective_From.HeaderText = "Effective From";
            this.Effective_From.Lookup = false;
            this.Effective_From.LookupColumns = "";
            this.Effective_From.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_From.Mandatory = false;
            this.Effective_From.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_From.MinValue = new System.DateTime(((long)(0)));
            this.Effective_From.Name = "Effective_From";
            this.Effective_From.PercentageWidth = 15;
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
            this.Effective_Till.HeaderText = "Effective Till";
            this.Effective_Till.Lookup = false;
            this.Effective_Till.LookupColumns = "";
            this.Effective_Till.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_Till.Mandatory = false;
            this.Effective_Till.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_Till.MinValue = new System.DateTime(((long)(0)));
            this.Effective_Till.Name = "Effective_Till";
            this.Effective_Till.PercentageWidth = 15;
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
            // States
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(956, 512);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "States";
            this.Text = "Zonal Sewadar Management - STATES]";
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
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtStateCode;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtStateName;
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
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intStateID;
        private DCC.UMB.CDBLookups.CountriesLookup lookupCountries;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn state_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn state_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn state_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn country_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn country_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
    }
}