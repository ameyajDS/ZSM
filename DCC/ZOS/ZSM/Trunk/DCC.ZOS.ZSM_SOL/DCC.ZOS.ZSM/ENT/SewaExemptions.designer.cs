namespace DCC.ZOS.ZSM.ENT
{
    partial class SewaExemptions
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SewaExemptions));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.grdApplicableSewas = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.grd_sewa_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.grd_old_sewa_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.exemption_days = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn();
            this.dtmEffectiveRange = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.tlpContainer = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.intID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.cmbSewaExemptionType = new DCC.ZOS.ZSM.Controls.DropDown.SewaExemptionTypeCombo();
            this.txtName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.chkIsComputed = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkSewaApplicability = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewa_exemption_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewa_exemption_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_exemption_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_applicability = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.is_computed = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
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
            ((System.ComponentModel.ISupportInitialize)(this.grdApplicableSewas)).BeginInit();
            this.dtmEffectiveRange.SuspendLayout();
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
            this.scListOrBrowse.Margin = new System.Windows.Forms.Padding(4);
            this.scListOrBrowse.Name = "scListOrBrowse";
            // 
            // scListOrBrowse.Panel1
            // 
            this.scListOrBrowse.Panel1.Controls.Add(this.tableLayoutPanel1);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Size = new System.Drawing.Size(1275, 630);
            this.scListOrBrowse.SplitterDistance = 1235;
            this.scListOrBrowse.SplitterWidth = 5;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 6;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.00056F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 18.66235F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.59223F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.07335F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.03236F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 21.4671F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 27F));
            this.tableLayoutPanel1.Controls.Add(this.grdApplicableSewas, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.dtmEffectiveRange, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.intID, 4, 1);
            this.tableLayoutPanel1.Controls.Add(this.cmbSewaExemptionType, 3, 1);
            this.tableLayoutPanel1.Controls.Add(this.txtName, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.chkIsComputed, 2, 2);
            this.tableLayoutPanel1.Controls.Add(this.chkSewaApplicability, 1, 2);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(4);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 19.63744F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.228236F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5.767648F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 44.02638F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.18951F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.15079F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1235, 630);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // grdApplicableSewas
            // 
            this.grdApplicableSewas.AllowRowSorting = false;
            this.grdApplicableSewas.AllowUserToAddRows = false;
            this.grdApplicableSewas.AutoAddNewRowForUser = false;
            this.grdApplicableSewas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdApplicableSewas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.grd_sewa_id,
            this.grd_old_sewa_id,
            this.exemption_days});
            this.tableLayoutPanel1.SetColumnSpan(this.grdApplicableSewas, 4);
            this.grdApplicableSewas.DeleteRowMenuEnabled = true;
            this.grdApplicableSewas.DeleteVisible = true;
            this.grdApplicableSewas.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdApplicableSewas.ExportToExcelVisible = true;
            this.grdApplicableSewas.InsertAfterVisible = true;
            this.grdApplicableSewas.InsertBeforeVisible = true;
            this.grdApplicableSewas.InsertLastVisible = true;
            this.grdApplicableSewas.InsertRowsMenuItemsEnabled = true;
            this.grdApplicableSewas.Location = new System.Drawing.Point(251, 221);
            this.grdApplicableSewas.Mandatory = false;
            this.grdApplicableSewas.Margin = new System.Windows.Forms.Padding(4);
            this.grdApplicableSewas.MoveDownVisible = false;
            this.grdApplicableSewas.MoveUpVisible = false;
            this.grdApplicableSewas.MultiSelect = false;
            this.grdApplicableSewas.Name = "grdApplicableSewas";
            this.grdApplicableSewas.RowHeadersWidth = 15;
            this.grdApplicableSewas.RowTemplate.Height = 24;
            this.grdApplicableSewas.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdApplicableSewas.ShowCommandStrip = false;
            this.grdApplicableSewas.Size = new System.Drawing.Size(712, 269);
            this.grdApplicableSewas.TabIndex = 5;
            this.grdApplicableSewas.Title = null;
            this.grdApplicableSewas.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdApplicableSewas.VirtualMode = true;
            // 
            // grd_sewa_id
            // 
            this.grd_sewa_id.BindingKey = "sewa_id";
            this.grd_sewa_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.grd_sewa_id.HeaderText = "Sewa";
            this.grd_sewa_id.Lookup = true;
            this.grd_sewa_id.LookupColumns = resources.GetString("grd_sewa_id.LookupColumns");
            this.grd_sewa_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.grd_sewa_id.Mandatory = false;
            this.grd_sewa_id.MaxCharacterLength = 2147483647;
            this.grd_sewa_id.Name = "grd_sewa_id";
            this.grd_sewa_id.PercentageWidth = 70;
            this.grd_sewa_id.RegularExpressionValidator = "";
            this.grd_sewa_id.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.grd_sewa_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.grd_sewa_id.ToolTipLookupField = "information";
            this.grd_sewa_id.Width = 487;
            // 
            // grd_old_sewa_id
            // 
            this.grd_old_sewa_id.BindingKey = "old_sewa_id";
            this.grd_old_sewa_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.grd_old_sewa_id.DefaultCellStyle = dataGridViewCellStyle1;
            this.grd_old_sewa_id.HeaderText = "grd_old_sewa_id";
            this.grd_old_sewa_id.Lookup = false;
            this.grd_old_sewa_id.LookupColumns = "";
            this.grd_old_sewa_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.grd_old_sewa_id.Mandatory = false;
            this.grd_old_sewa_id.MaxValue = ((long)(9223372036854775807));
            this.grd_old_sewa_id.MinValue = ((long)(-9223372036854775808));
            this.grd_old_sewa_id.Name = "grd_old_sewa_id";
            this.grd_old_sewa_id.PercentageWidth = 25;
            this.grd_old_sewa_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.grd_old_sewa_id.ToolTipLookupField = "information";
            this.grd_old_sewa_id.Visible = false;
            // 
            // exemption_days
            // 
            this.exemption_days.BindingKey = "exemption_days";
            this.exemption_days.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.exemption_days.DefaultCellStyle = dataGridViewCellStyle2;
            this.exemption_days.HeaderText = "Exemption Days";
            this.exemption_days.Lookup = false;
            this.exemption_days.LookupColumns = "";
            this.exemption_days.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.exemption_days.Mandatory = false;
            this.exemption_days.MaxValue = 1.7976931348623157E+308D;
            this.exemption_days.MinValue = -1.7976931348623157E+308D;
            this.exemption_days.Name = "exemption_days";
            this.exemption_days.PercentageWidth = 30;
            this.exemption_days.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.exemption_days.ToolTipLookupField = "information";
            this.exemption_days.Width = 209;
            // 
            // dtmEffectiveRange
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.dtmEffectiveRange, 4);
            this.dtmEffectiveRange.Controls.Add(this.tlpContainer);
            this.dtmEffectiveRange.DiscreteInQueryMode = true;
            this.dtmEffectiveRange.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmEffectiveRange.FillDefailtValuesInInsertMode = true;
            this.dtmEffectiveRange.FromDate = null;
            this.dtmEffectiveRange.FromDateFieldBindingKey = "effective_from";
            this.dtmEffectiveRange.FromDateMandatory = true;
            this.dtmEffectiveRange.FromDateTitle = "Effective From";
            this.dtmEffectiveRange.Location = new System.Drawing.Point(380, 498);
            this.dtmEffectiveRange.Margin = new System.Windows.Forms.Padding(133, 4, 133, 4);
            this.dtmEffectiveRange.Name = "dtmEffectiveRange";
            this.dtmEffectiveRange.ReadOnly = false;
            this.dtmEffectiveRange.Size = new System.Drawing.Size(454, 56);
            this.dtmEffectiveRange.TabIndex = 6;
            this.dtmEffectiveRange.TitleInQueryMode = "Effective On";
            this.dtmEffectiveRange.ToDate = null;
            this.dtmEffectiveRange.ToDateFieldBindingKey = "effective_till";
            this.dtmEffectiveRange.ToDateMandatory = true;
            this.dtmEffectiveRange.ToDateTitle = "Effective Till";
            // 
            // tlpContainer
            // 
            this.tlpContainer.ColumnCount = 2;
            this.tlpContainer.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpContainer.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpContainer.Location = new System.Drawing.Point(0, 0);
            this.tlpContainer.MaximumSize = new System.Drawing.Size(2000, 45);
            this.tlpContainer.Name = "tlpContainer";
            this.tlpContainer.RowCount = 1;
            this.tlpContainer.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpContainer.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 45F));
            this.tlpContainer.Size = new System.Drawing.Size(454, 45);
            this.tlpContainer.TabIndex = 2;
            // 
            // intID
            // 
            this.intID.AllowsNew = false;
            this.intID.AllowsReference = false;
            this.intID.AllowsUpdate = false;
            this.intID.ApplicationIdForDbConnection = null;
            this.intID.BackColor = System.Drawing.Color.Transparent;
            this.intID.CalledScreenApplicationId = null;
            this.intID.CalledScreenTypeName = null;
            this.intID.CallingScreenType = null;
            this.intID.DisplayText = "";
            this.intID.DisplayTextBindingKey = "sewa_exemption_id";
            this.intID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intID.EditingControlDataGridView = null;
            this.intID.EditingControlFormattedValue = "";
            this.intID.EditingControlRowIndex = 0;
            this.intID.EditingControlValueChanged = false;
            this.intID.EnableToolTip = false;
            this.intID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intID.IdText = null;
            this.intID.IdTextBindingKey = "sewa_exemption_id";
            this.intID.Location = new System.Drawing.Point(848, 127);
            this.intID.Lookup = false;
            this.intID.LookupColumns = null;
            this.intID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intID.LookupResult = null;
            this.intID.Mandatory = false;
            this.intID.Margin = new System.Windows.Forms.Padding(5, 4, 13, 4);
            this.intID.MaxCharacterLength = 2;
            this.intID.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intID.MaxValue = ((long)(9223372036854775807));
            this.intID.MinCharactersForQuery = 0;
            this.intID.MinimumSize = new System.Drawing.Size(13, 27);
            this.intID.MinValue = ((long)(-9223372036854775808));
            this.intID.Name = "intID";
            this.intID.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intID.PascalCase = false;
            this.intID.RangeInQueryMode = false;
            this.intID.ReadOnly = true;
            this.intID.RegularExpressionValidator = null;
            this.intID.Size = new System.Drawing.Size(106, 50);
            this.intID.TabIndex = 2;
            this.intID.TabStop = false;
            this.intID.Title = "ID";
            this.intID.ToolTipLookupField = null;
            this.intID.ValueText = null;
            // 
            // cmbSewaExemptionType
            // 
            this.cmbSewaExemptionType.ApplicationIdForDbConnection = null;
            this.cmbSewaExemptionType.BackColor = System.Drawing.Color.Transparent;
            this.cmbSewaExemptionType.DisplayText = ".......";
            this.cmbSewaExemptionType.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbSewaExemptionType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSewaExemptionType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSewaExemptionType.Location = new System.Drawing.Point(650, 127);
            this.cmbSewaExemptionType.Mandatory = true;
            this.cmbSewaExemptionType.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbSewaExemptionType.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbSewaExemptionType.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbSewaExemptionType.Name = "cmbSewaExemptionType";
            this.cmbSewaExemptionType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbSewaExemptionType.ReadOnly = false;
            this.cmbSewaExemptionType.SelectedIndex = 0;
            this.cmbSewaExemptionType.SelectedText = ".......";
            this.cmbSewaExemptionType.SelectedValue = null;
            this.cmbSewaExemptionType.SelectedValueBindingKey = "sewa_exemption_type";
            this.cmbSewaExemptionType.Size = new System.Drawing.Size(188, 50);
            this.cmbSewaExemptionType.TabIndex = 1;
            this.cmbSewaExemptionType.Title = "Sewa Exemption Type";
            this.cmbSewaExemptionType.ValueText = null;
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
            this.txtName.DisplayTextBindingKey = "sewa_exemption_nm";
            this.txtName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtName.EditingControlDataGridView = null;
            this.txtName.EditingControlFormattedValue = "";
            this.txtName.EditingControlRowIndex = 0;
            this.txtName.EditingControlValueChanged = false;
            this.txtName.EnableToolTip = false;
            this.txtName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.IdText = null;
            this.txtName.IdTextBindingKey = null;
            this.txtName.Location = new System.Drawing.Point(252, 127);
            this.txtName.Lookup = false;
            this.txtName.LookupColumns = null;
            this.txtName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtName.LookupResult = null;
            this.txtName.Mandatory = true;
            this.txtName.Margin = new System.Windows.Forms.Padding(5, 4, 4, 4);
            this.txtName.MaxCharacterLength = 30;
            this.txtName.MaximumSize = new System.Drawing.Size(1733, 54);
            this.txtName.MinCharactersForQuery = 0;
            this.txtName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtName.Name = "txtName";
            this.txtName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtName.PascalCase = false;
            this.txtName.RangeInQueryMode = false;
            this.txtName.ReadOnly = false;
            this.txtName.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtName.Size = new System.Drawing.Size(389, 50);
            this.txtName.TabIndex = 0;
            this.txtName.Title = "Name";
            this.txtName.ToolTipLookupField = "information";
            this.txtName.ValueText = null;
            // 
            // chkIsComputed
            // 
            this.chkIsComputed.AutoSize = true;
            this.chkIsComputed.BackColor = System.Drawing.Color.Transparent;
            this.chkIsComputed.BindingKey = "is_computed";
            this.chkIsComputed.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIsComputed.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkIsComputed.Location = new System.Drawing.Point(481, 185);
            this.chkIsComputed.Margin = new System.Windows.Forms.Padding(4);
            this.chkIsComputed.Name = "chkIsComputed";
            this.chkIsComputed.Size = new System.Drawing.Size(160, 28);
            this.chkIsComputed.TabIndex = 4;
            this.chkIsComputed.Text = "Is Computed";
            this.chkIsComputed.UseVisualStyleBackColor = true;
            // 
            // chkSewaApplicability
            // 
            this.chkSewaApplicability.AutoSize = true;
            this.chkSewaApplicability.BackColor = System.Drawing.Color.Transparent;
            this.chkSewaApplicability.BindingKey = "sewa_applicability";
            this.chkSewaApplicability.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkSewaApplicability.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkSewaApplicability.Location = new System.Drawing.Point(251, 185);
            this.chkSewaApplicability.Margin = new System.Windows.Forms.Padding(4);
            this.chkSewaApplicability.Name = "chkSewaApplicability";
            this.chkSewaApplicability.Size = new System.Drawing.Size(222, 28);
            this.chkSewaApplicability.TabIndex = 3;
            this.chkSewaApplicability.Text = "Sewa Applicability";
            this.chkSewaApplicability.UseVisualStyleBackColor = true;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewa_exemption_id,
            this.sewa_exemption_nm,
            this.sewa_exemption_type,
            this.sewa_applicability,
            this.is_computed,
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
            this.grdList.Margin = new System.Windows.Forms.Padding(4);
            this.grdList.MoveDownVisible = false;
            this.grdList.MoveUpVisible = false;
            this.grdList.MultiSelect = false;
            this.grdList.Name = "grdList";
            this.grdList.ReadOnly = true;
            this.grdList.RowHeadersWidth = 15;
            this.grdList.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(35, 630);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // sewa_exemption_id
            // 
            this.sewa_exemption_id.BindingKey = "sewa_exemption_id";
            this.sewa_exemption_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewa_exemption_id.DefaultCellStyle = dataGridViewCellStyle4;
            this.sewa_exemption_id.HeaderText = "Id";
            this.sewa_exemption_id.Lookup = false;
            this.sewa_exemption_id.LookupColumns = "";
            this.sewa_exemption_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_exemption_id.Mandatory = true;
            this.sewa_exemption_id.MaxValue = ((long)(9223372036854775807));
            this.sewa_exemption_id.MinValue = ((long)(-9223372036854775808));
            this.sewa_exemption_id.Name = "sewa_exemption_id";
            this.sewa_exemption_id.PercentageWidth = 5;
            this.sewa_exemption_id.ReadOnly = true;
            this.sewa_exemption_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_exemption_id.ToolTipLookupField = "information";
            this.sewa_exemption_id.Width = 5;
            // 
            // sewa_exemption_nm
            // 
            this.sewa_exemption_nm.BindingKey = "sewa_exemption_nm";
            this.sewa_exemption_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_exemption_nm.HeaderText = "Exemption Name";
            this.sewa_exemption_nm.Lookup = false;
            this.sewa_exemption_nm.LookupColumns = "";
            this.sewa_exemption_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_exemption_nm.Mandatory = false;
            this.sewa_exemption_nm.MaxCharacterLength = 2147483647;
            this.sewa_exemption_nm.Name = "sewa_exemption_nm";
            this.sewa_exemption_nm.PercentageWidth = 30;
            this.sewa_exemption_nm.ReadOnly = true;
            this.sewa_exemption_nm.RegularExpressionValidator = "";
            this.sewa_exemption_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_exemption_nm.ToolTipLookupField = "information";
            this.sewa_exemption_nm.Width = 6;
            // 
            // sewa_exemption_type
            // 
            this.sewa_exemption_type.BindingKey = "sewa_exemption_type";
            this.sewa_exemption_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_exemption_type.HeaderText = "Exemption Type";
            this.sewa_exemption_type.Lookup = false;
            this.sewa_exemption_type.LookupColumns = "";
            this.sewa_exemption_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_exemption_type.Mandatory = false;
            this.sewa_exemption_type.MaxCharacterLength = 2147483647;
            this.sewa_exemption_type.Name = "sewa_exemption_type";
            this.sewa_exemption_type.PercentageWidth = 10;
            this.sewa_exemption_type.ReadOnly = true;
            this.sewa_exemption_type.RegularExpressionValidator = "";
            this.sewa_exemption_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_exemption_type.ToolTipLookupField = "information";
            this.sewa_exemption_type.Width = 5;
            // 
            // sewa_applicability
            // 
            this.sewa_applicability.BindingKey = "sewa_applicability";
            this.sewa_applicability.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_applicability.HeaderText = "Sewa Applicability";
            this.sewa_applicability.Lookup = false;
            this.sewa_applicability.LookupColumns = "";
            this.sewa_applicability.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_applicability.Mandatory = false;
            this.sewa_applicability.MaxCharacterLength = 2147483647;
            this.sewa_applicability.Name = "sewa_applicability";
            this.sewa_applicability.PercentageWidth = 10;
            this.sewa_applicability.ReadOnly = true;
            this.sewa_applicability.RegularExpressionValidator = "";
            this.sewa_applicability.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_applicability.ToolTipLookupField = "information";
            this.sewa_applicability.Width = 5;
            // 
            // is_computed
            // 
            this.is_computed.BindingKey = "is_computed";
            this.is_computed.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.is_computed.HeaderText = "Is Computed";
            this.is_computed.Lookup = false;
            this.is_computed.LookupColumns = "";
            this.is_computed.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_computed.Mandatory = false;
            this.is_computed.MaxCharacterLength = 2147483647;
            this.is_computed.Name = "is_computed";
            this.is_computed.PercentageWidth = 10;
            this.is_computed.ReadOnly = true;
            this.is_computed.RegularExpressionValidator = "";
            this.is_computed.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_computed.ToolTipLookupField = "information";
            this.is_computed.Width = 5;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_From.DefaultCellStyle = dataGridViewCellStyle5;
            this.Effective_From.HeaderText = "Effective From";
            this.Effective_From.Lookup = false;
            this.Effective_From.LookupColumns = "";
            this.Effective_From.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_From.Mandatory = false;
            this.Effective_From.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_From.MinValue = new System.DateTime(((long)(0)));
            this.Effective_From.Name = "Effective_From";
            this.Effective_From.PercentageWidth = 10;
            this.Effective_From.ReadOnly = true;
            this.Effective_From.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Effective_From.ToolTipLookupField = "information";
            this.Effective_From.Width = 5;
            // 
            // Effective_Till
            // 
            this.Effective_Till.BindingKey = "effective_till";
            this.Effective_Till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_Till.DefaultCellStyle = dataGridViewCellStyle6;
            this.Effective_Till.HeaderText = "Effective Till";
            this.Effective_Till.Lookup = false;
            this.Effective_Till.LookupColumns = "";
            this.Effective_Till.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_Till.Mandatory = false;
            this.Effective_Till.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_Till.MinValue = new System.DateTime(((long)(0)));
            this.Effective_Till.Name = "Effective_Till";
            this.Effective_Till.PercentageWidth = 10;
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
            this.dccTextField1.MinCharactersForQuery = 0;
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
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dccGrid1.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle7;
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
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn1.DefaultCellStyle = dataGridViewCellStyle8;
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
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn2.DefaultCellStyle = dataGridViewCellStyle9;
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
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn3.DefaultCellStyle = dataGridViewCellStyle10;
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
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn4.DefaultCellStyle = dataGridViewCellStyle11;
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
            // SewaExemptions
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1275, 630);
            this.Controls.Add(this.scListOrBrowse);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "SewaExemptions";
            this.Text = "Zonal Sewadar Management - [SEWA EXEMPTION]";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdApplicableSewas)).EndInit();
            this.dtmEffectiveRange.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.tableLayoutPanel2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
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
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intID;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtName;
        private DCC.UMB.CDF.UIControls.TextControls.DateRangePair dtmEffectiveRange;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpContainer;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdApplicableSewas;
        private DCC.ZOS.ZSM.Controls.DropDown.SewaExemptionTypeCombo cmbSewaExemptionType;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkSewaApplicability;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewa_exemption_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_exemption_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_exemption_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_applicability;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn is_computed;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkIsComputed;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn grd_sewa_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn grd_old_sewa_id;
        private UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn exemption_days;
    }
}