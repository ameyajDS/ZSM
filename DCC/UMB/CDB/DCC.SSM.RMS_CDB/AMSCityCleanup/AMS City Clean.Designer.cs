namespace DCC.UMB.CDB2.ENT
{
    partial class AMSCityClean
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle29 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle30 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle31 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AMSCityClean));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle32 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle33 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle34 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle35 = new System.Windows.Forms.DataGridViewCellStyle();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.grdCityDetails = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.selectCity = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.City = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.State = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.StateID = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.totalCount = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.grdVisitorDetails = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.txtCDBCountryName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtCDBStateName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtCDBDisttName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtCDBCityName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.btnUpdateCityDetails = new System.Windows.Forms.Button();
            this.btnShowVisitorDetails = new System.Windows.Forms.Button();
            this.btnUpdateVisitorDetails = new System.Windows.Forms.Button();
            this.cmbSelectCity = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnSearchAMSCity = new System.Windows.Forms.Button();
            this.txtCityName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.selectvisitor = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.visitorID = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.VisitorName = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.age = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.gender = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.address = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.vstCity = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.vstState = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.vstStateID = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdCityDetails)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdVisitorDetails)).BeginInit();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 6;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 2.482279F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 121F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 24.25876F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 29.6496F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 17.07098F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 26.38259F));
            this.tableLayoutPanel1.Controls.Add(this.grdCityDetails, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.grdVisitorDetails, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.txtCDBCountryName, 5, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtCDBStateName, 5, 1);
            this.tableLayoutPanel1.Controls.Add(this.txtCDBDisttName, 5, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtCDBCityName, 5, 3);
            this.tableLayoutPanel1.Controls.Add(this.btnUpdateCityDetails, 4, 1);
            this.tableLayoutPanel1.Controls.Add(this.btnShowVisitorDetails, 4, 3);
            this.tableLayoutPanel1.Controls.Add(this.btnUpdateVisitorDetails, 5, 4);
            this.tableLayoutPanel1.Controls.Add(this.cmbSelectCity, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.dccTableLayoutPanel1, 3, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtCityName, 2, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(4);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 7;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.86957F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 21.30435F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.43478F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 21.30435F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.01732F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 335F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 73F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1234, 641);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // grdCityDetails
            // 
            this.grdCityDetails.AllowRowSorting = false;
            this.grdCityDetails.AllowUserToAddRows = false;
            this.grdCityDetails.AutoAddNewRowForUser = false;
            this.grdCityDetails.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdCityDetails.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.selectCity,
            this.City,
            this.State,
            this.StateID,
            this.totalCount});
            this.tableLayoutPanel1.SetColumnSpan(this.grdCityDetails, 3);
            this.grdCityDetails.DeleteRowMenuEnabled = true;
            this.grdCityDetails.DeleteVisible = false;
            this.grdCityDetails.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdCityDetails.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdCityDetails.ExportToExcelVisible = true;
            this.grdCityDetails.InsertAfterVisible = false;
            this.grdCityDetails.InsertBeforeVisible = false;
            this.grdCityDetails.InsertLastVisible = false;
            this.grdCityDetails.InsertRowsMenuItemsEnabled = true;
            this.grdCityDetails.Location = new System.Drawing.Point(30, 50);
            this.grdCityDetails.Mandatory = false;
            this.grdCityDetails.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.grdCityDetails.MoveDownVisible = false;
            this.grdCityDetails.MoveUpVisible = false;
            this.grdCityDetails.MultiSelect = false;
            this.grdCityDetails.Name = "grdCityDetails";
            this.grdCityDetails.RowHeadersWidth = 15;
            this.tableLayoutPanel1.SetRowSpan(this.grdCityDetails, 3);
            this.grdCityDetails.RowTemplate.Height = 24;
            this.grdCityDetails.ShowCommandStrip = true;
            this.grdCityDetails.Size = new System.Drawing.Size(715, 141);
            this.grdCityDetails.TabIndex = 1;
            this.grdCityDetails.Title = null;
            this.grdCityDetails.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdCityDetails.VirtualMode = true;
            // 
            // selectCity
            // 
            this.selectCity.BindingKey = null;
            this.selectCity.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle29.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.selectCity.DefaultCellStyle = dataGridViewCellStyle29;
            this.selectCity.HeaderText = "Select";
            this.selectCity.Lookup = false;
            this.selectCity.LookupColumns = "";
            this.selectCity.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.selectCity.Mandatory = false;
            this.selectCity.Name = "selectCity";
            this.selectCity.PercentageWidth = 8F;
            this.selectCity.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.selectCity.ToolTipLookupField = "information";
            this.selectCity.Width = 56;
            // 
            // City
            // 
            this.City.BindingKey = "Vst_City";
            this.City.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.City.HeaderText = "City Name";
            this.City.Lookup = false;
            this.City.LookupColumns = "";
            this.City.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.City.Mandatory = false;
            this.City.MaxCharacterLength = 2147483647;
            this.City.Name = "City";
            this.City.PercentageWidth = 45F;
            this.City.ReadOnly = true;
            this.City.RegularExpressionValidator = "";
            this.City.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.City.ToolTipLookupField = "information";
            this.City.Width = 315;
            // 
            // State
            // 
            this.State.BindingKey = "STA_Name";
            this.State.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.State.HeaderText = "State Name";
            this.State.Lookup = false;
            this.State.LookupColumns = "";
            this.State.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.State.Mandatory = false;
            this.State.MaxCharacterLength = 2147483647;
            this.State.Name = "State";
            this.State.PercentageWidth = 30F;
            this.State.ReadOnly = true;
            this.State.RegularExpressionValidator = "";
            this.State.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.State.ToolTipLookupField = "information";
            this.State.Width = 210;
            // 
            // StateID
            // 
            this.StateID.BindingKey = "STA_ID";
            this.StateID.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle30.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.StateID.DefaultCellStyle = dataGridViewCellStyle30;
            this.StateID.HeaderText = "StateId";
            this.StateID.Lookup = false;
            this.StateID.LookupColumns = "";
            this.StateID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.StateID.Mandatory = false;
            this.StateID.MaxValue = ((long)(9223372036854775807));
            this.StateID.MinValue = ((long)(-9223372036854775808));
            this.StateID.Name = "StateID";
            this.StateID.PercentageWidth = 25F;
            this.StateID.ReadOnly = true;
            this.StateID.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.StateID.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.StateID.ToolTipLookupField = "information";
            this.StateID.Visible = false;
            // 
            // totalCount
            // 
            this.totalCount.BindingKey = "visitor";
            this.totalCount.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle31.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.totalCount.DefaultCellStyle = dataGridViewCellStyle31;
            this.totalCount.HeaderText = "Count";
            this.totalCount.Lookup = false;
            this.totalCount.LookupColumns = "";
            this.totalCount.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.totalCount.Mandatory = false;
            this.totalCount.MaxValue = ((long)(9223372036854775807));
            this.totalCount.MinValue = ((long)(-9223372036854775808));
            this.totalCount.Name = "totalCount";
            this.totalCount.PercentageWidth = 14F;
            this.totalCount.ReadOnly = true;
            this.totalCount.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.totalCount.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.totalCount.ToolTipLookupField = "information";
            this.totalCount.Width = 98;
            // 
            // grdVisitorDetails
            // 
            this.grdVisitorDetails.AllowRowSorting = false;
            this.grdVisitorDetails.AllowUserToAddRows = false;
            this.grdVisitorDetails.AutoAddNewRowForUser = false;
            this.grdVisitorDetails.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdVisitorDetails.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.selectvisitor,
            this.visitorID,
            this.VisitorName,
            this.age,
            this.gender,
            this.address,
            this.vstCity,
            this.vstState,
            this.vstStateID});
            this.tableLayoutPanel1.SetColumnSpan(this.grdVisitorDetails, 5);
            this.grdVisitorDetails.DeleteRowMenuEnabled = true;
            this.grdVisitorDetails.DeleteVisible = false;
            this.grdVisitorDetails.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdVisitorDetails.ExportToExcelVisible = true;
            this.grdVisitorDetails.InsertAfterVisible = false;
            this.grdVisitorDetails.InsertBeforeVisible = false;
            this.grdVisitorDetails.InsertLastVisible = false;
            this.grdVisitorDetails.InsertRowsMenuItemsEnabled = true;
            this.grdVisitorDetails.Location = new System.Drawing.Point(30, 232);
            this.grdVisitorDetails.Mandatory = false;
            this.grdVisitorDetails.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.grdVisitorDetails.MoveDownVisible = false;
            this.grdVisitorDetails.MoveUpVisible = false;
            this.grdVisitorDetails.MultiSelect = false;
            this.grdVisitorDetails.Name = "grdVisitorDetails";
            this.grdVisitorDetails.RowHeadersWidth = 15;
            this.tableLayoutPanel1.SetRowSpan(this.grdVisitorDetails, 2);
            this.grdVisitorDetails.RowTemplate.Height = 24;
            this.grdVisitorDetails.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdVisitorDetails.ShowCommandStrip = true;
            this.grdVisitorDetails.Size = new System.Drawing.Size(1201, 407);
            this.grdVisitorDetails.TabIndex = 2;
            this.grdVisitorDetails.Title = null;
            this.grdVisitorDetails.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdVisitorDetails.VirtualMode = true;
            // 
            // txtCDBCountryName
            // 
            this.txtCDBCountryName.AllowsNew = false;
            this.txtCDBCountryName.AllowsReference = false;
            this.txtCDBCountryName.AllowsUpdate = false;
            this.txtCDBCountryName.ApplicationIdForDbConnection = null;
            this.txtCDBCountryName.BackColor = System.Drawing.Color.Transparent;
            this.txtCDBCountryName.CalledScreenApplicationId = null;
            this.txtCDBCountryName.CalledScreenTypeName = null;
            this.txtCDBCountryName.CallingScreenType = null;
            this.txtCDBCountryName.DisplayText = "";
            this.txtCDBCountryName.DisplayTextBindingKey = null;
            this.txtCDBCountryName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCDBCountryName.EditingControlDataGridView = null;
            this.txtCDBCountryName.EditingControlFormattedValue = null;
            this.txtCDBCountryName.EditingControlRowIndex = 0;
            this.txtCDBCountryName.EditingControlValueChanged = true;
            this.txtCDBCountryName.EnableToolTip = false;
            this.txtCDBCountryName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCDBCountryName.IdText = "";
            this.txtCDBCountryName.IdTextBindingKey = null;
            this.txtCDBCountryName.Location = new System.Drawing.Point(942, 2);
            this.txtCDBCountryName.Lookup = true;
            this.txtCDBCountryName.LookupColumns = resources.GetString("txtCDBCountryName.LookupColumns");
            this.txtCDBCountryName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCDBCountryName.LookupResult = null;
            this.txtCDBCountryName.LookupTitle = "Country Name";
            this.txtCDBCountryName.Mandatory = false;
            this.txtCDBCountryName.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.txtCDBCountryName.MaxCharacterLength = 32767;
            this.txtCDBCountryName.MaximumSize = new System.Drawing.Size(1300, 46);
            this.txtCDBCountryName.MinCharactersForQuery = 0;
            this.txtCDBCountryName.MinimumSize = new System.Drawing.Size(11, 22);
            this.txtCDBCountryName.Name = "txtCDBCountryName";
            this.txtCDBCountryName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtCDBCountryName.PascalCase = false;
            this.txtCDBCountryName.RangeInQueryMode = false;
            this.txtCDBCountryName.ReadOnly = false;
            this.txtCDBCountryName.RegularExpressionValidator = null;
            this.txtCDBCountryName.Size = new System.Drawing.Size(288, 44);
            this.txtCDBCountryName.TabIndex = 5;
            this.txtCDBCountryName.Title = "Country Name";
            this.txtCDBCountryName.ToolTipLookupField = "information";
            this.txtCDBCountryName.ValueText = "";
            // 
            // txtCDBStateName
            // 
            this.txtCDBStateName.AllowsNew = false;
            this.txtCDBStateName.AllowsReference = false;
            this.txtCDBStateName.AllowsUpdate = false;
            this.txtCDBStateName.ApplicationIdForDbConnection = null;
            this.txtCDBStateName.BackColor = System.Drawing.Color.Transparent;
            this.txtCDBStateName.CalledScreenApplicationId = null;
            this.txtCDBStateName.CalledScreenTypeName = null;
            this.txtCDBStateName.CallingScreenType = null;
            this.txtCDBStateName.DisplayText = "";
            this.txtCDBStateName.DisplayTextBindingKey = null;
            this.txtCDBStateName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCDBStateName.EditingControlDataGridView = null;
            this.txtCDBStateName.EditingControlFormattedValue = null;
            this.txtCDBStateName.EditingControlRowIndex = 0;
            this.txtCDBStateName.EditingControlValueChanged = false;
            this.txtCDBStateName.EnableToolTip = false;
            this.txtCDBStateName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCDBStateName.IdText = "";
            this.txtCDBStateName.IdTextBindingKey = null;
            this.txtCDBStateName.Location = new System.Drawing.Point(942, 50);
            this.txtCDBStateName.Lookup = true;
            this.txtCDBStateName.LookupColumns = resources.GetString("txtCDBStateName.LookupColumns");
            this.txtCDBStateName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCDBStateName.LookupResult = null;
            this.txtCDBStateName.LookupTitle = "State Name";
            this.txtCDBStateName.Mandatory = false;
            this.txtCDBStateName.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.txtCDBStateName.MaxCharacterLength = 32767;
            this.txtCDBStateName.MaximumSize = new System.Drawing.Size(1300, 46);
            this.txtCDBStateName.MinCharactersForQuery = 0;
            this.txtCDBStateName.MinimumSize = new System.Drawing.Size(11, 22);
            this.txtCDBStateName.Name = "txtCDBStateName";
            this.txtCDBStateName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtCDBStateName.PascalCase = false;
            this.txtCDBStateName.RangeInQueryMode = false;
            this.txtCDBStateName.ReadOnly = false;
            this.txtCDBStateName.RegularExpressionValidator = null;
            this.txtCDBStateName.Size = new System.Drawing.Size(288, 45);
            this.txtCDBStateName.TabIndex = 6;
            this.txtCDBStateName.Title = "State Name";
            this.txtCDBStateName.ToolTipLookupField = "information";
            this.txtCDBStateName.ValueText = "";
            this.txtCDBStateName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.txtCDBStateName_LookupDialogShowing);
            // 
            // txtCDBDisttName
            // 
            this.txtCDBDisttName.AllowsNew = false;
            this.txtCDBDisttName.AllowsReference = false;
            this.txtCDBDisttName.AllowsUpdate = false;
            this.txtCDBDisttName.ApplicationIdForDbConnection = null;
            this.txtCDBDisttName.BackColor = System.Drawing.Color.Transparent;
            this.txtCDBDisttName.CalledScreenApplicationId = null;
            this.txtCDBDisttName.CalledScreenTypeName = null;
            this.txtCDBDisttName.CallingScreenType = null;
            this.txtCDBDisttName.DisplayText = "";
            this.txtCDBDisttName.DisplayTextBindingKey = null;
            this.txtCDBDisttName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCDBDisttName.EditingControlDataGridView = null;
            this.txtCDBDisttName.EditingControlFormattedValue = null;
            this.txtCDBDisttName.EditingControlRowIndex = 0;
            this.txtCDBDisttName.EditingControlValueChanged = false;
            this.txtCDBDisttName.EnableToolTip = false;
            this.txtCDBDisttName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCDBDisttName.IdText = "";
            this.txtCDBDisttName.IdTextBindingKey = null;
            this.txtCDBDisttName.Location = new System.Drawing.Point(942, 99);
            this.txtCDBDisttName.Lookup = true;
            this.txtCDBDisttName.LookupColumns = resources.GetString("txtCDBDisttName.LookupColumns");
            this.txtCDBDisttName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCDBDisttName.LookupResult = null;
            this.txtCDBDisttName.LookupTitle = "CDB District Name";
            this.txtCDBDisttName.Mandatory = false;
            this.txtCDBDisttName.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.txtCDBDisttName.MaxCharacterLength = 32767;
            this.txtCDBDisttName.MaximumSize = new System.Drawing.Size(1300, 46);
            this.txtCDBDisttName.MinCharactersForQuery = 0;
            this.txtCDBDisttName.MinimumSize = new System.Drawing.Size(11, 22);
            this.txtCDBDisttName.Name = "txtCDBDisttName";
            this.txtCDBDisttName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtCDBDisttName.PascalCase = false;
            this.txtCDBDisttName.RangeInQueryMode = false;
            this.txtCDBDisttName.ReadOnly = false;
            this.txtCDBDisttName.RegularExpressionValidator = null;
            this.txtCDBDisttName.Size = new System.Drawing.Size(288, 43);
            this.txtCDBDisttName.TabIndex = 7;
            this.txtCDBDisttName.Title = "District Name";
            this.txtCDBDisttName.ToolTipLookupField = "information";
            this.txtCDBDisttName.ValueText = "";
            this.txtCDBDisttName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.txtCDBDisttName_LookupDialogShowing);
            // 
            // txtCDBCityName
            // 
            this.txtCDBCityName.AllowsNew = false;
            this.txtCDBCityName.AllowsReference = false;
            this.txtCDBCityName.AllowsUpdate = false;
            this.txtCDBCityName.ApplicationIdForDbConnection = null;
            this.txtCDBCityName.BackColor = System.Drawing.Color.Transparent;
            this.txtCDBCityName.CalledScreenApplicationId = null;
            this.txtCDBCityName.CalledScreenTypeName = null;
            this.txtCDBCityName.CallingScreenType = null;
            this.txtCDBCityName.DisplayText = "";
            this.txtCDBCityName.DisplayTextBindingKey = null;
            this.txtCDBCityName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCDBCityName.EditingControlDataGridView = null;
            this.txtCDBCityName.EditingControlFormattedValue = null;
            this.txtCDBCityName.EditingControlRowIndex = 0;
            this.txtCDBCityName.EditingControlValueChanged = false;
            this.txtCDBCityName.EnableToolTip = false;
            this.txtCDBCityName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCDBCityName.IdText = "";
            this.txtCDBCityName.IdTextBindingKey = null;
            this.txtCDBCityName.Location = new System.Drawing.Point(942, 146);
            this.txtCDBCityName.Lookup = true;
            this.txtCDBCityName.LookupColumns = resources.GetString("txtCDBCityName.LookupColumns");
            this.txtCDBCityName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCDBCityName.LookupResult = null;
            this.txtCDBCityName.LookupTitle = "CDB City Name";
            this.txtCDBCityName.Mandatory = true;
            this.txtCDBCityName.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.txtCDBCityName.MaxCharacterLength = 32767;
            this.txtCDBCityName.MaximumSize = new System.Drawing.Size(1300, 46);
            this.txtCDBCityName.MinCharactersForQuery = 0;
            this.txtCDBCityName.MinimumSize = new System.Drawing.Size(11, 22);
            this.txtCDBCityName.Name = "txtCDBCityName";
            this.txtCDBCityName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtCDBCityName.PascalCase = false;
            this.txtCDBCityName.RangeInQueryMode = false;
            this.txtCDBCityName.ReadOnly = false;
            this.txtCDBCityName.RegularExpressionValidator = null;
            this.txtCDBCityName.Size = new System.Drawing.Size(288, 45);
            this.txtCDBCityName.TabIndex = 8;
            this.txtCDBCityName.Title = "City Name";
            this.txtCDBCityName.ToolTipLookupField = "information";
            this.txtCDBCityName.ValueText = "";
            this.txtCDBCityName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.txtCDBCityName_LookupDialogShowing);
            // 
            // btnUpdateCityDetails
            // 
            this.btnUpdateCityDetails.Font = new System.Drawing.Font("Calibri", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdateCityDetails.Location = new System.Drawing.Point(751, 50);
            this.btnUpdateCityDetails.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnUpdateCityDetails.Name = "btnUpdateCityDetails";
            this.btnUpdateCityDetails.Size = new System.Drawing.Size(184, 32);
            this.btnUpdateCityDetails.TabIndex = 9;
            this.btnUpdateCityDetails.Text = "Update City Records";
            this.btnUpdateCityDetails.UseVisualStyleBackColor = true;
            this.btnUpdateCityDetails.Click += new System.EventHandler(this.btnUpdateCityDetails_Click);
            // 
            // btnShowVisitorDetails
            // 
            this.btnShowVisitorDetails.Font = new System.Drawing.Font("Calibri", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnShowVisitorDetails.Location = new System.Drawing.Point(751, 146);
            this.btnShowVisitorDetails.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnShowVisitorDetails.Name = "btnShowVisitorDetails";
            this.btnShowVisitorDetails.Size = new System.Drawing.Size(178, 32);
            this.btnShowVisitorDetails.TabIndex = 12;
            this.btnShowVisitorDetails.Text = "Show Visitor(s)";
            this.btnShowVisitorDetails.UseVisualStyleBackColor = true;
            this.btnShowVisitorDetails.Click += new System.EventHandler(this.btnShowVisitorDetails_Click);
            // 
            // btnUpdateVisitorDetails
            // 
            this.btnUpdateVisitorDetails.Font = new System.Drawing.Font("Calibri", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdateVisitorDetails.Location = new System.Drawing.Point(941, 195);
            this.btnUpdateVisitorDetails.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnUpdateVisitorDetails.Name = "btnUpdateVisitorDetails";
            this.btnUpdateVisitorDetails.Size = new System.Drawing.Size(261, 33);
            this.btnUpdateVisitorDetails.TabIndex = 13;
            this.btnUpdateVisitorDetails.Text = "Update Visitor Records";
            this.btnUpdateVisitorDetails.UseVisualStyleBackColor = true;
            this.btnUpdateVisitorDetails.Click += new System.EventHandler(this.btnUpdateVisitorDetails_Click);
            // 
            // cmbSelectCity
            // 
            this.cmbSelectCity.ApplicationIdForDbConnection = null;
            this.cmbSelectCity.BackColor = System.Drawing.Color.Transparent;
            this.cmbSelectCity.DisplayText = "";
            this.cmbSelectCity.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSelectCity.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSelectCity.Location = new System.Drawing.Point(31, 3);
            this.cmbSelectCity.Mandatory = false;
            this.cmbSelectCity.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbSelectCity.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbSelectCity.MinimumSize = new System.Drawing.Size(10, 22);
            this.cmbSelectCity.Name = "cmbSelectCity";
            this.cmbSelectCity.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbSelectCity.ReadOnly = false;
            this.cmbSelectCity.SelectedIndex = -1;
            this.cmbSelectCity.SelectedItem = null;
            this.cmbSelectCity.SelectedText = "";
            this.cmbSelectCity.SelectedValue = null;
            this.cmbSelectCity.SelectedValueBindingKey = null;
            this.cmbSelectCity.Size = new System.Drawing.Size(75, 42);
            this.cmbSelectCity.TabIndex = 14;
            this.cmbSelectCity.Title = "Select All";
            this.cmbSelectCity.ValueText = null;
            this.cmbSelectCity.SelectedValueChanged += new System.EventHandler<System.EventArgs>(this.cmbSelectCity_SelectedValueChanged);
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 1;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Controls.Add(this.btnSearchAMSCity, 0, 1);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(421, 3);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 2;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.54545F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 85.45454F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(324, 42);
            this.dccTableLayoutPanel1.TabIndex = 15;
            // 
            // btnSearchAMSCity
            // 
            this.btnSearchAMSCity.Font = new System.Drawing.Font("Calibri", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSearchAMSCity.Location = new System.Drawing.Point(3, 9);
            this.btnSearchAMSCity.Name = "btnSearchAMSCity";
            this.btnSearchAMSCity.Size = new System.Drawing.Size(191, 30);
            this.btnSearchAMSCity.TabIndex = 11;
            this.btnSearchAMSCity.Text = "Search City";
            this.btnSearchAMSCity.UseVisualStyleBackColor = true;
            this.btnSearchAMSCity.Click += new System.EventHandler(this.btnSearchAMSCity_Click);
            // 
            // txtCityName
            // 
            this.txtCityName.AllowsNew = false;
            this.txtCityName.AllowsReference = false;
            this.txtCityName.AllowsUpdate = false;
            this.txtCityName.ApplicationIdForDbConnection = null;
            this.txtCityName.BackColor = System.Drawing.Color.Transparent;
            this.txtCityName.CalledScreenApplicationId = null;
            this.txtCityName.CalledScreenTypeName = null;
            this.txtCityName.CallingScreenType = null;
            this.txtCityName.Cursor = System.Windows.Forms.Cursors.No;
            this.txtCityName.DisplayText = "";
            this.txtCityName.DisplayTextBindingKey = null;
            this.txtCityName.EditingControlDataGridView = null;
            this.txtCityName.EditingControlFormattedValue = "";
            this.txtCityName.EditingControlRowIndex = 0;
            this.txtCityName.EditingControlValueChanged = false;
            this.txtCityName.EnableToolTip = true;
            this.txtCityName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCityName.IdText = null;
            this.txtCityName.IdTextBindingKey = null;
            this.txtCityName.Location = new System.Drawing.Point(152, 2);
            this.txtCityName.Lookup = false;
            this.txtCityName.LookupColumns = null;
            this.txtCityName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCityName.LookupResult = null;
            this.txtCityName.LookupTitle = "";
            this.txtCityName.Mandatory = true;
            this.txtCityName.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.txtCityName.MaxCharacterLength = 32767;
            this.txtCityName.MaximumSize = new System.Drawing.Size(1300, 46);
            this.txtCityName.MinCharactersForQuery = 0;
            this.txtCityName.MinimumSize = new System.Drawing.Size(11, 22);
            this.txtCityName.Name = "txtCityName";
            this.txtCityName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtCityName.PascalCase = false;
            this.txtCityName.RangeInQueryMode = false;
            this.txtCityName.ReadOnly = false;
            this.txtCityName.RegularExpressionValidator = null;
            this.txtCityName.Size = new System.Drawing.Size(226, 44);
            this.txtCityName.TabIndex = 0;
            this.txtCityName.Title = "AMS City Name";
            this.txtCityName.ToolTipLookupField = "information";
            this.txtCityName.ValueText = null;
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Margin = new System.Windows.Forms.Padding(4);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.tableLayoutPanel1);
            this.splitContainer1.Size = new System.Drawing.Size(1275, 641);
            this.splitContainer1.SplitterDistance = 1234;
            this.splitContainer1.SplitterWidth = 5;
            this.splitContainer1.TabIndex = 0;
            // 
            // selectvisitor
            // 
            this.selectvisitor.BindingKey = null;
            this.selectvisitor.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle32.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.selectvisitor.DefaultCellStyle = dataGridViewCellStyle32;
            this.selectvisitor.HeaderText = "Select";
            this.selectvisitor.Lookup = false;
            this.selectvisitor.LookupColumns = "";
            this.selectvisitor.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.selectvisitor.Mandatory = false;
            this.selectvisitor.Name = "selectvisitor";
            this.selectvisitor.PercentageWidth = 6F;
            this.selectvisitor.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.selectvisitor.ToolTipLookupField = "information";
            this.selectvisitor.Width = 71;
            // 
            // visitorID
            // 
            this.visitorID.BindingKey = "Vst_ID";
            this.visitorID.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle33.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.visitorID.DefaultCellStyle = dataGridViewCellStyle33;
            this.visitorID.HeaderText = "Visitor ID";
            this.visitorID.Lookup = false;
            this.visitorID.LookupColumns = "";
            this.visitorID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.visitorID.Mandatory = false;
            this.visitorID.MaxValue = ((long)(9223372036854775807));
            this.visitorID.MinValue = ((long)(-9223372036854775808));
            this.visitorID.Name = "visitorID";
            this.visitorID.PercentageWidth = 9F;
            this.visitorID.ReadOnly = true;
            this.visitorID.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.visitorID.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.visitorID.ToolTipLookupField = "information";
            this.visitorID.Width = 106;
            // 
            // VisitorName
            // 
            this.VisitorName.BindingKey = "Vst_Name";
            this.VisitorName.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.VisitorName.HeaderText = "Visitor Name";
            this.VisitorName.Lookup = false;
            this.VisitorName.LookupColumns = "";
            this.VisitorName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.VisitorName.Mandatory = false;
            this.VisitorName.MaxCharacterLength = 2147483647;
            this.VisitorName.Name = "VisitorName";
            this.VisitorName.PercentageWidth = 22F;
            this.VisitorName.ReadOnly = true;
            this.VisitorName.RegularExpressionValidator = "";
            this.VisitorName.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.VisitorName.ToolTipLookupField = "information";
            this.VisitorName.Width = 260;
            // 
            // age
            // 
            this.age.BindingKey = "Vst_Age";
            this.age.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle34.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.age.DefaultCellStyle = dataGridViewCellStyle34;
            this.age.HeaderText = "Age";
            this.age.Lookup = false;
            this.age.LookupColumns = "";
            this.age.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.age.Mandatory = false;
            this.age.MaxValue = ((long)(9223372036854775807));
            this.age.MinValue = ((long)(-9223372036854775808));
            this.age.Name = "age";
            this.age.PercentageWidth = 5F;
            this.age.ReadOnly = true;
            this.age.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.age.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.age.ToolTipLookupField = "information";
            this.age.Width = 59;
            // 
            // gender
            // 
            this.gender.BindingKey = "Vst_Sex";
            this.gender.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle35.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.gender.DefaultCellStyle = dataGridViewCellStyle35;
            this.gender.HeaderText = "Gender";
            this.gender.Lookup = false;
            this.gender.LookupColumns = "";
            this.gender.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.gender.Mandatory = false;
            this.gender.MaxCharacterLength = 2147483647;
            this.gender.Name = "gender";
            this.gender.PercentageWidth = 5F;
            this.gender.ReadOnly = true;
            this.gender.RegularExpressionValidator = "";
            this.gender.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gender.ToolTipLookupField = "information";
            this.gender.Width = 59;
            // 
            // address
            // 
            this.address.BindingKey = "Address";
            this.address.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.address.HeaderText = "Address";
            this.address.Lookup = false;
            this.address.LookupColumns = "";
            this.address.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.address.Mandatory = false;
            this.address.MaxCharacterLength = 2147483647;
            this.address.Name = "address";
            this.address.PercentageWidth = 25F;
            this.address.ReadOnly = true;
            this.address.RegularExpressionValidator = "";
            this.address.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.address.ToolTipLookupField = "information";
            this.address.Width = 296;
            // 
            // vstCity
            // 
            this.vstCity.BindingKey = "Vst_City";
            this.vstCity.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.vstCity.HeaderText = "City";
            this.vstCity.Lookup = false;
            this.vstCity.LookupColumns = "";
            this.vstCity.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.vstCity.Mandatory = false;
            this.vstCity.MaxCharacterLength = 2147483647;
            this.vstCity.Name = "vstCity";
            this.vstCity.PercentageWidth = 15F;
            this.vstCity.ReadOnly = true;
            this.vstCity.RegularExpressionValidator = "";
            this.vstCity.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.vstCity.ToolTipLookupField = "information";
            this.vstCity.Width = 177;
            // 
            // vstState
            // 
            this.vstState.BindingKey = "STA_Name";
            this.vstState.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.vstState.HeaderText = "State";
            this.vstState.Lookup = false;
            this.vstState.LookupColumns = "";
            this.vstState.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.vstState.Mandatory = false;
            this.vstState.MaxCharacterLength = 2147483647;
            this.vstState.Name = "vstState";
            this.vstState.PercentageWidth = 13F;
            this.vstState.ReadOnly = true;
            this.vstState.RegularExpressionValidator = "";
            this.vstState.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.vstState.ToolTipLookupField = "information";
            this.vstState.Width = 154;
            // 
            // vstStateID
            // 
            this.vstStateID.BindingKey = "STA_ID";
            this.vstStateID.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.vstStateID.HeaderText = "VisitorStateID";
            this.vstStateID.Lookup = false;
            this.vstStateID.LookupColumns = "";
            this.vstStateID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.vstStateID.Mandatory = false;
            this.vstStateID.MaxCharacterLength = 2147483647;
            this.vstStateID.Name = "vstStateID";
            this.vstStateID.PercentageWidth = 25F;
            this.vstStateID.RegularExpressionValidator = "";
            this.vstStateID.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.vstStateID.ToolTipLookupField = "information";
            this.vstStateID.Visible = false;
            // 
            // AMSCityClean
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1275, 641);
            this.Controls.Add(this.splitContainer1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "AMSCityClean";
            this.Text = "Accommodation Management System - [AMS City Clean]";
            this.Load += new System.EventHandler(this.AMSCityClean_Load);
            this.tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdCityDetails)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdVisitorDetails)).EndInit();
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private CDF.UIControls.TextControls.DCCTextField txtCityName;
        private CDF.UIControls.Grid.DCCGrid grdCityDetails;
        private CDF.UIControls.Grid.DCCGrid grdVisitorDetails;
        private CDF.UIControls.TextControls.DCCTextField txtCDBStateName;
        private CDF.UIControls.TextControls.DCCTextField txtCDBDisttName;
        private CDF.UIControls.TextControls.DCCTextField txtCDBCityName;
        private System.Windows.Forms.Button btnUpdateCityDetails;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private CDF.UIControls.TextControls.DCCTextField txtCDBCountryName;
        private System.Windows.Forms.Button btnShowVisitorDetails;
        private System.Windows.Forms.Button btnUpdateVisitorDetails;
        private CDF.UIControls.TextControls.DCCComboBox cmbSelectCity;
        private CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private System.Windows.Forms.Button btnSearchAMSCity;
        private CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn selectCity;
        private CDF.UIControls.Grid.Column.DCCTextFieldGridColumn City;
        private CDF.UIControls.Grid.Column.DCCTextFieldGridColumn State;
        private CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn StateID;
        private CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn totalCount;
        private CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn selectvisitor;
        private CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn visitorID;
        private CDF.UIControls.Grid.Column.DCCTextFieldGridColumn VisitorName;
        private CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn age;
        private CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gender;
        private CDF.UIControls.Grid.Column.DCCTextFieldGridColumn address;
        private CDF.UIControls.Grid.Column.DCCTextFieldGridColumn vstCity;
        private CDF.UIControls.Grid.Column.DCCTextFieldGridColumn vstState;
        private CDF.UIControls.Grid.Column.DCCTextFieldGridColumn vstStateID;

    }
}