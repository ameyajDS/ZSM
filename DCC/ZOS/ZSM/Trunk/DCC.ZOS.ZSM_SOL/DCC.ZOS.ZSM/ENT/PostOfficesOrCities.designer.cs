namespace DCC.ZOS.ZSM.ENT
{
    partial class PostOfficesOrCities
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PostOfficesOrCities));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.txtName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtmEffectiveRange = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.txtSTDCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.lookupStates = new DCC.UMB.CDBLookups.StatesLookup();
            this.lookupDistrictorCities = new DCC.UMB.CDBLookups.DistrictorCitiesLookup();
            this.lookupCountries = new DCC.UMB.CDBLookups.CountriesLookup();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.post_office_or_city_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.post_office_or_city_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.post_office_or_city_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.std_code = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.country_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.country_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.state_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.state_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.district_or_city_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.district_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
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
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(1275, 630);
            this.scListOrBrowse.SplitterDistance = 927;
            this.scListOrBrowse.SplitterWidth = 5;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 8;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.07335F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.492989F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.580367F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 29.44984F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.98274F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.472492F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.24811F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.48436F));
            this.tableLayoutPanel1.Controls.Add(this.txtName, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.intID, 6, 1);
            this.tableLayoutPanel1.Controls.Add(this.txtCode, 4, 1);
            this.tableLayoutPanel1.Controls.Add(this.dtmEffectiveRange, 3, 5);
            this.tableLayoutPanel1.Controls.Add(this.txtSTDCode, 4, 5);
            this.tableLayoutPanel1.Controls.Add(this.lookupStates, 2, 3);
            this.tableLayoutPanel1.Controls.Add(this.lookupDistrictorCities, 2, 4);
            this.tableLayoutPanel1.Controls.Add(this.lookupCountries, 2, 2);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(4);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 35.24229F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 21.46342F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 21.46342F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 21.46342F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 57F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 319F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1275, 630);
            this.tableLayoutPanel1.TabIndex = 0;
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
            this.tableLayoutPanel1.SetColumnSpan(this.txtName, 3);
            this.txtName.DisplayText = "";
            this.txtName.DisplayTextBindingKey = "post_office_or_city_nm";
            this.txtName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtName.EditingControlDataGridView = null;
            this.txtName.EditingControlFormattedValue = "";
            this.txtName.EditingControlRowIndex = 0;
            this.txtName.EditingControlValueChanged = false;
            this.txtName.EnableToolTip = false;
            this.txtName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.IdText = "post_office_or_city_nm";
            this.txtName.IdTextBindingKey = null;
            this.txtName.Location = new System.Drawing.Point(209, 93);
            this.txtName.Lookup = false;
            this.txtName.LookupColumns = null;
            this.txtName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtName.LookupResult = null;
            this.txtName.Mandatory = true;
            this.txtName.Margin = new System.Windows.Forms.Padding(4, 4, 5, 4);
            this.txtName.MaxCharacterLength = 30;
            this.txtName.MaximumSize = new System.Drawing.Size(1733, 54);
            this.txtName.MinCharactersForQuery = 0;
            this.txtName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtName.Name = "txtName";
            this.txtName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtName.PascalCase = false;
            this.txtName.RangeInQueryMode = false;
            this.txtName.ReadOnly = false;
            this.txtName.RegularExpressionValidator = "^[0-9a-zA-Z() .]+$";
            this.txtName.Size = new System.Drawing.Size(572, 46);
            this.txtName.TabIndex = 1;
            this.txtName.Title = "Name";
            this.txtName.ToolTipLookupField = "information";
            this.txtName.ValueText = null;
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
            this.intID.DisplayTextBindingKey = "post_office_or_city_id";
            this.intID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intID.EditingControlDataGridView = null;
            this.intID.EditingControlFormattedValue = "";
            this.intID.EditingControlRowIndex = 0;
            this.intID.EditingControlValueChanged = false;
            this.intID.EnableToolTip = false;
            this.intID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intID.IdText = null;
            this.intID.IdTextBindingKey = "post_office_or_city_id";
            this.intID.Location = new System.Drawing.Point(975, 93);
            this.intID.Lookup = false;
            this.intID.LookupColumns = null;
            this.intID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intID.LookupResult = null;
            this.intID.Mandatory = false;
            this.intID.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intID.MaxCharacterLength = 32767;
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
            this.intID.Size = new System.Drawing.Size(120, 46);
            this.intID.TabIndex = 2;
            this.intID.TabStop = false;
            this.intID.Title = "ID";
            this.intID.ToolTipLookupField = null;
            this.intID.ValueText = null;
            // 
            // txtCode
            // 
            this.txtCode.AllowsNew = false;
            this.txtCode.AllowsReference = false;
            this.txtCode.AllowsUpdate = false;
            this.txtCode.ApplicationIdForDbConnection = null;
            this.txtCode.BackColor = System.Drawing.Color.Transparent;
            this.txtCode.CalledScreenApplicationId = null;
            this.txtCode.CalledScreenTypeName = null;
            this.txtCode.CallingScreenType = null;
            this.tableLayoutPanel1.SetColumnSpan(this.txtCode, 2);
            this.txtCode.DisplayText = "";
            this.txtCode.DisplayTextBindingKey = "post_office_or_city_cd";
            this.txtCode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCode.EditingControlDataGridView = null;
            this.txtCode.EditingControlFormattedValue = "";
            this.txtCode.EditingControlRowIndex = 0;
            this.txtCode.EditingControlValueChanged = false;
            this.txtCode.EnableToolTip = false;
            this.txtCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCode.IdText = null;
            this.txtCode.IdTextBindingKey = "post_office_or_city_cd";
            this.txtCode.Location = new System.Drawing.Point(793, 93);
            this.txtCode.Lookup = false;
            this.txtCode.LookupColumns = null;
            this.txtCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCode.LookupResult = null;
            this.txtCode.Mandatory = true;
            this.txtCode.Margin = new System.Windows.Forms.Padding(7, 4, 5, 4);
            this.txtCode.MaxCharacterLength = 10;
            this.txtCode.MaximumSize = new System.Drawing.Size(1733, 54);
            this.txtCode.MinCharactersForQuery = 0;
            this.txtCode.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtCode.Name = "txtCode";
            this.txtCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtCode.PascalCase = false;
            this.txtCode.RangeInQueryMode = false;
            this.txtCode.ReadOnly = false;
            this.txtCode.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtCode.Size = new System.Drawing.Size(172, 46);
            this.txtCode.TabIndex = 0;
            this.txtCode.Title = "Code";
            this.txtCode.ToolTipLookupField = "information";
            this.txtCode.ValueText = null;
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
            this.dtmEffectiveRange.Location = new System.Drawing.Point(415, 312);
            this.dtmEffectiveRange.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtmEffectiveRange.Name = "dtmEffectiveRange";
            this.dtmEffectiveRange.ReadOnly = false;
            this.dtmEffectiveRange.Size = new System.Drawing.Size(366, 314);
            this.dtmEffectiveRange.TabIndex = 6;
            this.dtmEffectiveRange.TitleInQueryMode = "Effective On";
            this.dtmEffectiveRange.ToDate = null;
            this.dtmEffectiveRange.ToDateFieldBindingKey = "effective_till";
            this.dtmEffectiveRange.ToDateMandatory = true;
            this.dtmEffectiveRange.ToDateTitle = "Effective Till";
            // 
            // txtSTDCode
            // 
            this.txtSTDCode.AllowsNew = false;
            this.txtSTDCode.AllowsReference = false;
            this.txtSTDCode.AllowsUpdate = false;
            this.txtSTDCode.ApplicationIdForDbConnection = null;
            this.txtSTDCode.BackColor = System.Drawing.Color.Transparent;
            this.txtSTDCode.CalledScreenApplicationId = null;
            this.txtSTDCode.CalledScreenTypeName = null;
            this.txtSTDCode.CallingScreenType = null;
            this.txtSTDCode.DisplayText = "";
            this.txtSTDCode.DisplayTextBindingKey = "std_code";
            this.txtSTDCode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSTDCode.EditingControlDataGridView = null;
            this.txtSTDCode.EditingControlFormattedValue = "";
            this.txtSTDCode.EditingControlRowIndex = 0;
            this.txtSTDCode.EditingControlValueChanged = false;
            this.txtSTDCode.EnableToolTip = false;
            this.txtSTDCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSTDCode.IdText = null;
            this.txtSTDCode.IdTextBindingKey = "std_code";
            this.txtSTDCode.Location = new System.Drawing.Point(791, 312);
            this.txtSTDCode.Lookup = false;
            this.txtSTDCode.LookupColumns = null;
            this.txtSTDCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSTDCode.LookupResult = null;
            this.txtSTDCode.Mandatory = false;
            this.txtSTDCode.Margin = new System.Windows.Forms.Padding(5, 4, 4, 4);
            this.txtSTDCode.MaxCharacterLength = 10;
            this.txtSTDCode.MaximumSize = new System.Drawing.Size(1733, 54);
            this.txtSTDCode.MinCharactersForQuery = 0;
            this.txtSTDCode.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSTDCode.Name = "txtSTDCode";
            this.txtSTDCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSTDCode.PascalCase = false;
            this.txtSTDCode.RangeInQueryMode = false;
            this.txtSTDCode.ReadOnly = false;
            this.txtSTDCode.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtSTDCode.Size = new System.Drawing.Size(93, 54);
            this.txtSTDCode.TabIndex = 7;
            this.txtSTDCode.Title = "STD Code";
            this.txtSTDCode.ToolTipLookupField = "information";
            this.txtSTDCode.ValueText = null;
            // 
            // lookupStates
            // 
            this.lookupStates.AllowsNew = false;
            this.lookupStates.AllowsReference = false;
            this.lookupStates.AllowsUpdate = false;
            this.lookupStates.BackColor = System.Drawing.Color.Transparent;
            this.lookupStates.CalledScreenApplicationId = null;
            this.lookupStates.CalledScreenTypeName = null;
            this.lookupStates.CallingScreenType = null;
            this.tableLayoutPanel1.SetColumnSpan(this.lookupStates, 4);
            this.lookupStates.CountryCode = 0;
            this.lookupStates.DisplayText = "";
            this.lookupStates.DisplayTextBindingKey = "state_nm";
            this.lookupStates.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lookupStates.EditingControlDataGridView = null;
            this.lookupStates.EditingControlFormattedValue = null;
            this.lookupStates.EditingControlRowIndex = 0;
            this.lookupStates.EditingControlValueChanged = true;
            this.lookupStates.EnableToolTip = false;
            this.lookupStates.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lookupStates.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lookupStates.IdText = null;
            this.lookupStates.IdTextBindingKey = "state_id";
            this.lookupStates.Location = new System.Drawing.Point(331, 201);
            this.lookupStates.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lookupStates.LookupResult = null;
            this.lookupStates.Mandatory = true;
            this.lookupStates.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lookupStates.MaxCharacterLength = 32767;
            this.lookupStates.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lookupStates.MinCharactersForQuery = 0;
            this.lookupStates.MinimumSize = new System.Drawing.Size(13, 27);
            this.lookupStates.Name = "lookupStates";
            this.lookupStates.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lookupStates.PascalCase = false;
            this.lookupStates.RangeInQueryMode = false;
            this.lookupStates.ReadOnly = false;
            this.lookupStates.RegularExpressionValidator = null;
            this.lookupStates.Size = new System.Drawing.Size(634, 46);
            this.lookupStates.TabIndex = 4;
            this.lookupStates.Title = "State";
            this.lookupStates.ToolTipLookupField = "information";
            this.lookupStates.ValueText = null;
            this.lookupStates.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.lookupStates_LookupResultSet);
            // 
            // lookupDistrictorCities
            // 
            this.lookupDistrictorCities.AllowsNew = false;
            this.lookupDistrictorCities.AllowsReference = false;
            this.lookupDistrictorCities.AllowsUpdate = false;
            this.lookupDistrictorCities.BackColor = System.Drawing.Color.Transparent;
            this.lookupDistrictorCities.CalledScreenApplicationId = null;
            this.lookupDistrictorCities.CalledScreenTypeName = null;
            this.lookupDistrictorCities.CallingScreenType = null;
            this.tableLayoutPanel1.SetColumnSpan(this.lookupDistrictorCities, 4);
            this.lookupDistrictorCities.DisplayText = "";
            this.lookupDistrictorCities.DisplayTextBindingKey = "district_nm";
            this.lookupDistrictorCities.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lookupDistrictorCities.EditingControlDataGridView = null;
            this.lookupDistrictorCities.EditingControlFormattedValue = null;
            this.lookupDistrictorCities.EditingControlRowIndex = 0;
            this.lookupDistrictorCities.EditingControlValueChanged = true;
            this.lookupDistrictorCities.EnableToolTip = false;
            this.lookupDistrictorCities.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lookupDistrictorCities.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lookupDistrictorCities.IdText = "";
            this.lookupDistrictorCities.IdTextBindingKey = "district_or_city_id";
            this.lookupDistrictorCities.Location = new System.Drawing.Point(331, 255);
            this.lookupDistrictorCities.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lookupDistrictorCities.LookupResult = null;
            this.lookupDistrictorCities.Mandatory = true;
            this.lookupDistrictorCities.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lookupDistrictorCities.MaxCharacterLength = 32767;
            this.lookupDistrictorCities.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lookupDistrictorCities.MinCharactersForQuery = 0;
            this.lookupDistrictorCities.MinimumSize = new System.Drawing.Size(13, 27);
            this.lookupDistrictorCities.Name = "lookupDistrictorCities";
            this.lookupDistrictorCities.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lookupDistrictorCities.PascalCase = false;
            this.lookupDistrictorCities.RangeInQueryMode = false;
            this.lookupDistrictorCities.ReadOnly = false;
            this.lookupDistrictorCities.RegularExpressionValidator = null;
            this.lookupDistrictorCities.Size = new System.Drawing.Size(634, 49);
            this.lookupDistrictorCities.StateCode = 0;
            this.lookupDistrictorCities.TabIndex = 5;
            this.lookupDistrictorCities.Title = "DistrictorCities";
            this.lookupDistrictorCities.ToolTipLookupField = "information";
            this.lookupDistrictorCities.ValueText = null;
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
            this.tableLayoutPanel1.SetColumnSpan(this.lookupCountries, 4);
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
            this.lookupCountries.Location = new System.Drawing.Point(331, 147);
            this.lookupCountries.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lookupCountries.LookupResult = null;
            this.lookupCountries.Mandatory = true;
            this.lookupCountries.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lookupCountries.MaxCharacterLength = 32767;
            this.lookupCountries.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lookupCountries.MinCharactersForQuery = 0;
            this.lookupCountries.MinimumSize = new System.Drawing.Size(13, 27);
            this.lookupCountries.Name = "lookupCountries";
            this.lookupCountries.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lookupCountries.PascalCase = false;
            this.lookupCountries.RangeInQueryMode = false;
            this.lookupCountries.ReadOnly = false;
            this.lookupCountries.RegularExpressionValidator = null;
            this.lookupCountries.Size = new System.Drawing.Size(634, 46);
            this.lookupCountries.TabIndex = 3;
            this.lookupCountries.Title = "Country";
            this.lookupCountries.ToolTipLookupField = "information";
            this.lookupCountries.ValueText = null;
            this.lookupCountries.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.lookupCountries_LookupResultSet);
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
            this.post_office_or_city_nm,
            this.post_office_or_city_cd,
            this.post_office_or_city_id,
            this.std_code,
            this.country_id,
            this.country_nm,
            this.state_id,
            this.state_nm,
            this.district_or_city_id,
            this.district_nm,
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
            this.grdList.Size = new System.Drawing.Size(96, 100);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // post_office_or_city_nm
            // 
            this.post_office_or_city_nm.BindingKey = "post_office_or_city_nm";
            this.post_office_or_city_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.post_office_or_city_nm.HeaderText = "Name";
            this.post_office_or_city_nm.Lookup = false;
            this.post_office_or_city_nm.LookupColumns = "";
            this.post_office_or_city_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.post_office_or_city_nm.Mandatory = true;
            this.post_office_or_city_nm.MaxCharacterLength = 2147483647;
            this.post_office_or_city_nm.Name = "post_office_or_city_nm";
            this.post_office_or_city_nm.PercentageWidth = 25;
            this.post_office_or_city_nm.ReadOnly = true;
            this.post_office_or_city_nm.RegularExpressionValidator = "";
            this.post_office_or_city_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.post_office_or_city_nm.ToolTipLookupField = "information";
            this.post_office_or_city_nm.Width = 15;
            // 
            // post_office_or_city_cd
            // 
            this.post_office_or_city_cd.BindingKey = "post_office_or_city_cd";
            this.post_office_or_city_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.post_office_or_city_cd.HeaderText = "Code";
            this.post_office_or_city_cd.Lookup = false;
            this.post_office_or_city_cd.LookupColumns = "";
            this.post_office_or_city_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.post_office_or_city_cd.Mandatory = false;
            this.post_office_or_city_cd.MaxCharacterLength = 2147483647;
            this.post_office_or_city_cd.Name = "post_office_or_city_cd";
            this.post_office_or_city_cd.PercentageWidth = 10;
            this.post_office_or_city_cd.ReadOnly = true;
            this.post_office_or_city_cd.RegularExpressionValidator = "";
            this.post_office_or_city_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.post_office_or_city_cd.ToolTipLookupField = "information";
            this.post_office_or_city_cd.Width = 6;
            // 
            // post_office_or_city_id
            // 
            this.post_office_or_city_id.BindingKey = "post_office_or_city_id";
            this.post_office_or_city_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.post_office_or_city_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.post_office_or_city_id.HeaderText = "Id";
            this.post_office_or_city_id.Lookup = false;
            this.post_office_or_city_id.LookupColumns = "";
            this.post_office_or_city_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.post_office_or_city_id.Mandatory = true;
            this.post_office_or_city_id.MaxValue = ((long)(9223372036854775807));
            this.post_office_or_city_id.MinValue = ((long)(-9223372036854775808));
            this.post_office_or_city_id.Name = "post_office_or_city_id";
            this.post_office_or_city_id.PercentageWidth = 5;
            this.post_office_or_city_id.ReadOnly = true;
            this.post_office_or_city_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.post_office_or_city_id.ToolTipLookupField = "information";
            this.post_office_or_city_id.Width = 5;
            // 
            // std_code
            // 
            this.std_code.BindingKey = "std_code";
            this.std_code.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.std_code.HeaderText = "STD code";
            this.std_code.Lookup = false;
            this.std_code.LookupColumns = "";
            this.std_code.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.std_code.Mandatory = false;
            this.std_code.MaxCharacterLength = 2147483647;
            this.std_code.Name = "std_code";
            this.std_code.PercentageWidth = 15;
            this.std_code.ReadOnly = true;
            this.std_code.RegularExpressionValidator = "";
            this.std_code.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.std_code.ToolTipLookupField = "information";
            this.std_code.Width = 9;
            // 
            // country_id
            // 
            this.country_id.BindingKey = "country_id";
            this.country_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.country_id.DefaultCellStyle = dataGridViewCellStyle3;
            this.country_id.HeaderText = "country_id";
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
            this.country_nm.HeaderText = "country_nm";
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
            this.country_nm.Visible = false;
            // 
            // state_id
            // 
            this.state_id.BindingKey = "state_id";
            this.state_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.state_id.DefaultCellStyle = dataGridViewCellStyle4;
            this.state_id.HeaderText = "state_id";
            this.state_id.Lookup = false;
            this.state_id.LookupColumns = "";
            this.state_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.state_id.Mandatory = false;
            this.state_id.MaxValue = ((long)(9223372036854775807));
            this.state_id.MinValue = ((long)(-9223372036854775808));
            this.state_id.Name = "state_id";
            this.state_id.PercentageWidth = 0;
            this.state_id.ReadOnly = true;
            this.state_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.state_id.ToolTipLookupField = "information";
            this.state_id.Visible = false;
            // 
            // state_nm
            // 
            this.state_nm.BindingKey = "state_nm";
            this.state_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.state_nm.HeaderText = "state_nm";
            this.state_nm.Lookup = false;
            this.state_nm.LookupColumns = "";
            this.state_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.state_nm.Mandatory = false;
            this.state_nm.MaxCharacterLength = 2147483647;
            this.state_nm.Name = "state_nm";
            this.state_nm.PercentageWidth = 25;
            this.state_nm.ReadOnly = true;
            this.state_nm.RegularExpressionValidator = "";
            this.state_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.state_nm.ToolTipLookupField = "information";
            this.state_nm.Visible = false;
            // 
            // district_or_city_id
            // 
            this.district_or_city_id.BindingKey = "district_or_city_id";
            this.district_or_city_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.district_or_city_id.DefaultCellStyle = dataGridViewCellStyle5;
            this.district_or_city_id.HeaderText = "district_id";
            this.district_or_city_id.Lookup = false;
            this.district_or_city_id.LookupColumns = "";
            this.district_or_city_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.district_or_city_id.Mandatory = false;
            this.district_or_city_id.MaxValue = ((long)(9223372036854775807));
            this.district_or_city_id.MinValue = ((long)(-9223372036854775808));
            this.district_or_city_id.Name = "district_or_city_id";
            this.district_or_city_id.PercentageWidth = 25;
            this.district_or_city_id.ReadOnly = true;
            this.district_or_city_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.district_or_city_id.ToolTipLookupField = "information";
            this.district_or_city_id.Visible = false;
            // 
            // district_nm
            // 
            this.district_nm.BindingKey = "district_nm";
            this.district_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.district_nm.HeaderText = "District";
            this.district_nm.Lookup = false;
            this.district_nm.LookupColumns = "";
            this.district_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.district_nm.Mandatory = false;
            this.district_nm.MaxCharacterLength = 2147483647;
            this.district_nm.Name = "district_nm";
            this.district_nm.PercentageWidth = 15;
            this.district_nm.ReadOnly = true;
            this.district_nm.RegularExpressionValidator = "";
            this.district_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.district_nm.ToolTipLookupField = "information";
            this.district_nm.Width = 9;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_From.DefaultCellStyle = dataGridViewCellStyle6;
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
            this.Effective_From.Width = 9;
            // 
            // Effective_Till
            // 
            this.Effective_Till.BindingKey = "effective_till";
            this.Effective_Till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_Till.DefaultCellStyle = dataGridViewCellStyle7;
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
            this.Effective_Till.Width = 9;
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
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dccGrid1.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle8;
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
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn1.DefaultCellStyle = dataGridViewCellStyle9;
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
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn2.DefaultCellStyle = dataGridViewCellStyle10;
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
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn3.DefaultCellStyle = dataGridViewCellStyle11;
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
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn4.DefaultCellStyle = dataGridViewCellStyle12;
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
            // PostOfficesOrCities
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1275, 630);
            this.Controls.Add(this.scListOrBrowse);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "PostOfficesOrCities";
            this.Text = "Zonal Sewadar Management - [POSTOFFICESORCITIES]";
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
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intID;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtCode;
        private DCC.UMB.CDBLookups.DistrictorCitiesLookup lookupDistrictorCities;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSTDCode;
        private DCC.UMB.CDBLookups.StatesLookup lookupStates;
        private DCC.UMB.CDBLookups.CountriesLookup lookupCountries;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn post_office_or_city_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn post_office_or_city_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn post_office_or_city_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn std_code;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn country_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn country_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn state_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn state_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn district_or_city_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn district_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
    }
}