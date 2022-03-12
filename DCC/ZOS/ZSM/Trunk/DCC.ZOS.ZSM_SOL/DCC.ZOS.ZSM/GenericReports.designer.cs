namespace DCC.SSM.RMS.Medical.ENT
{
    partial class GenericReports
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GenericReports));
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.satsangCentresLookup1 = new DCC.UMB.CDBLookups.SatsangCentresLookup();
            this.dccCheckBox1 = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.intSessionId = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.deptGroupsLookup1 = new DCC.UMB.CDBLookups.DeptGroupsLookup();
            this.genderCombo1 = new DCC.UMB.CDBControls.DropDown.GenderCombo();
            this.maritalStatusCombo1 = new DCC.UMB.CDBControls.DropDown.MaritalStatusCombo();
            this.sewadarTypesLookup1 = new DCC.UMB.CDBLookups.SewadarTypesLookup();
            this.dateRangePair1 = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.countriesLookup1 = new DCC.UMB.CDBLookups.CountriesLookup();
            this.statesLookup1 = new DCC.UMB.CDBLookups.StatesLookup();
            this.districtorCitiesLookup1 = new DCC.UMB.CDBLookups.DistrictorCitiesLookup();
            this.dtGnc = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.intCount1 = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.intCount2 = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.chkGncBoolean = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkEject = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkRegerenrateRpt = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.btnReport = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.tlpBase.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 8;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.Controls.Add(this.satsangCentresLookup1, 3, 0);
            this.tlpBase.Controls.Add(this.dccCheckBox1, 5, 0);
            this.tlpBase.Controls.Add(this.intSessionId, 7, 0);
            this.tlpBase.Controls.Add(this.deptGroupsLookup1, 0, 1);
            this.tlpBase.Controls.Add(this.genderCombo1, 0, 2);
            this.tlpBase.Controls.Add(this.maritalStatusCombo1, 2, 2);
            this.tlpBase.Controls.Add(this.sewadarTypesLookup1, 4, 2);
            this.tlpBase.Controls.Add(this.dateRangePair1, 0, 3);
            this.tlpBase.Controls.Add(this.countriesLookup1, 0, 4);
            this.tlpBase.Controls.Add(this.statesLookup1, 2, 4);
            this.tlpBase.Controls.Add(this.districtorCitiesLookup1, 4, 4);
            this.tlpBase.Controls.Add(this.dtGnc, 0, 6);
            this.tlpBase.Controls.Add(this.intCount1, 3, 6);
            this.tlpBase.Controls.Add(this.intCount2, 4, 6);
            this.tlpBase.Controls.Add(this.chkGncBoolean, 5, 6);
            this.tlpBase.Controls.Add(this.chkEject, 7, 6);
            this.tlpBase.Controls.Add(this.chkRegerenrateRpt, 0, 7);
            this.tlpBase.Controls.Add(this.btnReport, 6, 7);
            this.tlpBase.Controls.Add(this.btnClear, 7, 7);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 8;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tlpBase.Size = new System.Drawing.Size(1019, 535);
            this.tlpBase.TabIndex = 2;
            // 
            // satsangCentresLookup1
            // 
            this.satsangCentresLookup1.AllowsNew = false;
            this.satsangCentresLookup1.AllowsReference = false;
            this.satsangCentresLookup1.AllowsUpdate = false;
            this.satsangCentresLookup1.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.satsangCentresLookup1.BackColor = System.Drawing.Color.Transparent;
            this.satsangCentresLookup1.CalledScreenApplicationId = null;
            this.satsangCentresLookup1.CalledScreenTypeName = null;
            this.satsangCentresLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.satsangCentresLookup1, 2);
            this.satsangCentresLookup1.DisplayText = "";
            this.satsangCentresLookup1.DisplayTextBindingKey = null;
            this.satsangCentresLookup1.DistrictOrCityCode = 0;
            this.satsangCentresLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.satsangCentresLookup1.EditingControlDataGridView = null;
            this.satsangCentresLookup1.EditingControlFormattedValue = null;
            this.satsangCentresLookup1.EditingControlRowIndex = 0;
            this.satsangCentresLookup1.EditingControlValueChanged = true;
            this.satsangCentresLookup1.EnableToolTip = false;
            this.satsangCentresLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.satsangCentresLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.satsangCentresLookup1.IdText = null;
            this.satsangCentresLookup1.IdTextBindingKey = null;
            this.satsangCentresLookup1.Location = new System.Drawing.Point(385, 3);
            this.satsangCentresLookup1.LookupColumns = resources.GetString("satsangCentresLookup1.LookupColumns");
            this.satsangCentresLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.satsangCentresLookup1.LookupResult = null;
            this.satsangCentresLookup1.Mandatory = false;
            this.satsangCentresLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.satsangCentresLookup1.MaxCharacterLength = 32767;
            this.satsangCentresLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.satsangCentresLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.satsangCentresLookup1.Name = "satsangCentresLookup1";
            this.satsangCentresLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.satsangCentresLookup1.PascalCase = false;
            this.satsangCentresLookup1.RangeInQueryMode = false;
            this.satsangCentresLookup1.ReadOnly = false;
            this.satsangCentresLookup1.RegularExpressionValidator = null;
            this.satsangCentresLookup1.Size = new System.Drawing.Size(246, 45);
            this.satsangCentresLookup1.TabIndex = 0;
            this.satsangCentresLookup1.Title = "SatsangCentres";
            this.satsangCentresLookup1.ToolTipLookupField = "information";
            this.satsangCentresLookup1.ValueText = null;
            // 
            // dccCheckBox1
            // 
            this.dccCheckBox1.AutoSize = true;
            this.dccCheckBox1.BackColor = System.Drawing.Color.Transparent;
            this.dccCheckBox1.BindingKey = null;
            this.dccCheckBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccCheckBox1.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccCheckBox1.Location = new System.Drawing.Point(638, 3);
            this.dccCheckBox1.Name = "dccCheckBox1";
            this.dccCheckBox1.Size = new System.Drawing.Size(121, 60);
            this.dccCheckBox1.TabIndex = 1;
            this.dccCheckBox1.Text = "Summarised";
            this.dccCheckBox1.UseVisualStyleBackColor = true;
            // 
            // intSessionId
            // 
            this.intSessionId.AllowsNew = false;
            this.intSessionId.AllowsReference = false;
            this.intSessionId.AllowsUpdate = false;
            this.intSessionId.ApplicationIdForDbConnection = null;
            this.intSessionId.BackColor = System.Drawing.Color.Transparent;
            this.intSessionId.CalledScreenApplicationId = null;
            this.intSessionId.CalledScreenTypeName = null;
            this.intSessionId.CallingScreenType = null;
            this.intSessionId.DisplayText = "";
            this.intSessionId.DisplayTextBindingKey = null;
            this.intSessionId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intSessionId.EditingControlDataGridView = null;
            this.intSessionId.EditingControlFormattedValue = "";
            this.intSessionId.EditingControlRowIndex = 0;
            this.intSessionId.EditingControlValueChanged = false;
            this.intSessionId.EnableToolTip = false;
            this.intSessionId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSessionId.IdText = null;
            this.intSessionId.IdTextBindingKey = null;
            this.intSessionId.Location = new System.Drawing.Point(893, 3);
            this.intSessionId.Lookup = false;
            this.intSessionId.LookupColumns = null;
            this.intSessionId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intSessionId.LookupResult = null;
            this.intSessionId.Mandatory = false;
            this.intSessionId.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intSessionId.MaxCharacterLength = 32767;
            this.intSessionId.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intSessionId.MaxValue = ((long)(9223372036854775807));
            this.intSessionId.MinimumSize = new System.Drawing.Size(10, 22);
            this.intSessionId.MinValue = ((long)(-9223372036854775808));
            this.intSessionId.Name = "intSessionId";
            this.intSessionId.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intSessionId.PascalCase = false;
            this.intSessionId.RangeInQueryMode = false;
            this.intSessionId.ReadOnly = true;
            this.intSessionId.RegularExpressionValidator = null;
            this.intSessionId.Size = new System.Drawing.Size(122, 45);
            this.intSessionId.TabIndex = 2;
            this.intSessionId.TabStop = false;
            this.intSessionId.Title = "Session Id";
            this.intSessionId.ToolTipLookupField = "information";
            this.intSessionId.ValueText = null;
            // 
            // deptGroupsLookup1
            // 
            this.deptGroupsLookup1.AllowsNew = false;
            this.deptGroupsLookup1.AllowsReference = false;
            this.deptGroupsLookup1.AllowsUpdate = false;
            this.deptGroupsLookup1.BackColor = System.Drawing.Color.Transparent;
            this.deptGroupsLookup1.CalledScreenApplicationId = null;
            this.deptGroupsLookup1.CalledScreenTypeName = "";
            this.deptGroupsLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.deptGroupsLookup1, 2);
            this.deptGroupsLookup1.DisplayText = "";
            this.deptGroupsLookup1.DisplayTextBindingKey = null;
            this.deptGroupsLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.deptGroupsLookup1.EditingControlDataGridView = null;
            this.deptGroupsLookup1.EditingControlFormattedValue = null;
            this.deptGroupsLookup1.EditingControlRowIndex = 0;
            this.deptGroupsLookup1.EditingControlValueChanged = true;
            this.deptGroupsLookup1.EnableToolTip = false;
            this.deptGroupsLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.deptGroupsLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deptGroupsLookup1.IdText = null;
            this.deptGroupsLookup1.IdTextBindingKey = null;
            this.deptGroupsLookup1.Location = new System.Drawing.Point(4, 69);
            this.deptGroupsLookup1.LookupColumns = resources.GetString("deptGroupsLookup1.LookupColumns");
            this.deptGroupsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.deptGroupsLookup1.LookupResult = null;
            this.deptGroupsLookup1.Mandatory = false;
            this.deptGroupsLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.deptGroupsLookup1.MaxCharacterLength = 32767;
            this.deptGroupsLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.deptGroupsLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.deptGroupsLookup1.Name = "deptGroupsLookup1";
            this.deptGroupsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.deptGroupsLookup1.PascalCase = false;
            this.deptGroupsLookup1.RangeInQueryMode = false;
            this.deptGroupsLookup1.ReadOnly = false;
            this.deptGroupsLookup1.RegularExpressionValidator = null;
            this.deptGroupsLookup1.Size = new System.Drawing.Size(246, 45);
            this.deptGroupsLookup1.TabIndex = 3;
            this.deptGroupsLookup1.Title = "DeptGroups";
            this.deptGroupsLookup1.ToolTipLookupField = "information";
            this.deptGroupsLookup1.ValueText = null;
            // 
            // genderCombo1
            // 
            this.genderCombo1.ApplicationIdForDbConnection = null;
            this.genderCombo1.BackColor = System.Drawing.Color.Transparent;
            this.genderCombo1.DisplayText = ".......";
            this.genderCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.genderCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.genderCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.genderCombo1.Location = new System.Drawing.Point(4, 135);
            this.genderCombo1.Mandatory = false;
            this.genderCombo1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.genderCombo1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.genderCombo1.MinimumSize = new System.Drawing.Size(10, 22);
            this.genderCombo1.Name = "genderCombo1";
            this.genderCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.genderCombo1.ReadOnly = false;
            this.genderCombo1.SelectedIndex = 0;
            this.genderCombo1.SelectedText = ".......";
            this.genderCombo1.SelectedValue = null;
            this.genderCombo1.SelectedValueBindingKey = null;
            this.genderCombo1.Size = new System.Drawing.Size(119, 44);
            this.genderCombo1.TabIndex = 5;
            this.genderCombo1.Title = "Gender";
            this.genderCombo1.ValueText = null;
            // 
            // maritalStatusCombo1
            // 
            this.maritalStatusCombo1.BackColor = System.Drawing.Color.Transparent;
            this.maritalStatusCombo1.DisplayText = "";
            this.maritalStatusCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.maritalStatusCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.maritalStatusCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.maritalStatusCombo1.Location = new System.Drawing.Point(258, 135);
            this.maritalStatusCombo1.Mandatory = false;
            this.maritalStatusCombo1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.maritalStatusCombo1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.maritalStatusCombo1.MinimumSize = new System.Drawing.Size(10, 22);
            this.maritalStatusCombo1.Name = "maritalStatusCombo1";
            this.maritalStatusCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.maritalStatusCombo1.ReadOnly = false;
            this.maritalStatusCombo1.SelectedIndex = -1;
            this.maritalStatusCombo1.SelectedItem = null;
            this.maritalStatusCombo1.SelectedText = "";
            this.maritalStatusCombo1.SelectedValue = null;
            this.maritalStatusCombo1.SelectedValueBindingKey = null;
            this.maritalStatusCombo1.Size = new System.Drawing.Size(119, 44);
            this.maritalStatusCombo1.TabIndex = 6;
            this.maritalStatusCombo1.Title = "Marital Status";
            this.maritalStatusCombo1.ValueText = null;
            // 
            // sewadarTypesLookup1
            // 
            this.sewadarTypesLookup1.AllowsNew = false;
            this.sewadarTypesLookup1.AllowsReference = false;
            this.sewadarTypesLookup1.AllowsUpdate = false;
            this.sewadarTypesLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewadarTypesLookup1.CalledScreenApplicationId = null;
            this.sewadarTypesLookup1.CalledScreenTypeName = null;
            this.sewadarTypesLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.sewadarTypesLookup1, 2);
            this.sewadarTypesLookup1.DisplayText = "";
            this.sewadarTypesLookup1.DisplayTextBindingKey = null;
            this.sewadarTypesLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarTypesLookup1.EditingControlDataGridView = null;
            this.sewadarTypesLookup1.EditingControlFormattedValue = null;
            this.sewadarTypesLookup1.EditingControlRowIndex = 0;
            this.sewadarTypesLookup1.EditingControlValueChanged = true;
            this.sewadarTypesLookup1.EnableToolTip = false;
            this.sewadarTypesLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewadarTypesLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewadarTypesLookup1.IdText = null;
            this.sewadarTypesLookup1.IdTextBindingKey = null;
            this.sewadarTypesLookup1.Location = new System.Drawing.Point(512, 135);
            this.sewadarTypesLookup1.LookupColumns = resources.GetString("sewadarTypesLookup1.LookupColumns");
            this.sewadarTypesLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadarTypesLookup1.LookupResult = null;
            this.sewadarTypesLookup1.Mandatory = false;
            this.sewadarTypesLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewadarTypesLookup1.MaxCharacterLength = 32767;
            this.sewadarTypesLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewadarTypesLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewadarTypesLookup1.Name = "sewadarTypesLookup1";
            this.sewadarTypesLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewadarTypesLookup1.PascalCase = false;
            this.sewadarTypesLookup1.RangeInQueryMode = false;
            this.sewadarTypesLookup1.ReadOnly = false;
            this.sewadarTypesLookup1.RegularExpressionValidator = null;
            this.sewadarTypesLookup1.Size = new System.Drawing.Size(246, 45);
            this.sewadarTypesLookup1.TabIndex = 7;
            this.sewadarTypesLookup1.Title = "SewadarTypes";
            this.sewadarTypesLookup1.ToolTipLookupField = "information";
            this.sewadarTypesLookup1.ValueText = null;
            // 
            // dateRangePair1
            // 
            this.tlpBase.SetColumnSpan(this.dateRangePair1, 3);
            this.dateRangePair1.DiscreteInQueryMode = false;
            this.dateRangePair1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dateRangePair1.FillDefailtValuesInInsertMode = false;
            this.dateRangePair1.FromDate = null;
            this.dateRangePair1.FromDateFieldBindingKey = "effective_from_dt";
            this.dateRangePair1.FromDateMandatory = false;
            this.dateRangePair1.FromDateTitle = "Start Date";
            this.dateRangePair1.Location = new System.Drawing.Point(3, 201);
            this.dateRangePair1.Name = "dateRangePair1";
            this.dateRangePair1.ReadOnly = false;
            this.dateRangePair1.Size = new System.Drawing.Size(375, 60);
            this.dateRangePair1.TabIndex = 8;
            this.dateRangePair1.TitleInQueryMode = "Start Date";
            this.dateRangePair1.ToDate = null;
            this.dateRangePair1.ToDateFieldBindingKey = "effective_till_dt";
            this.dateRangePair1.ToDateMandatory = false;
            this.dateRangePair1.ToDateTitle = "End Date";
            // 
            // countriesLookup1
            // 
            this.countriesLookup1.AllowsNew = false;
            this.countriesLookup1.AllowsReference = false;
            this.countriesLookup1.AllowsUpdate = false;
            this.countriesLookup1.BackColor = System.Drawing.Color.Transparent;
            this.countriesLookup1.CalledScreenApplicationId = null;
            this.countriesLookup1.CalledScreenTypeName = null;
            this.countriesLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.countriesLookup1, 2);
            this.countriesLookup1.DisplayText = "";
            this.countriesLookup1.DisplayTextBindingKey = null;
            this.countriesLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.countriesLookup1.EditingControlDataGridView = null;
            this.countriesLookup1.EditingControlFormattedValue = null;
            this.countriesLookup1.EditingControlRowIndex = 0;
            this.countriesLookup1.EditingControlValueChanged = true;
            this.countriesLookup1.EnableToolTip = false;
            this.countriesLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.countriesLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.countriesLookup1.IdText = null;
            this.countriesLookup1.IdTextBindingKey = null;
            this.countriesLookup1.Location = new System.Drawing.Point(4, 267);
            this.countriesLookup1.LookupColumns = resources.GetString("countriesLookup1.LookupColumns");
            this.countriesLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.countriesLookup1.LookupResult = null;
            this.countriesLookup1.Mandatory = false;
            this.countriesLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.countriesLookup1.MaxCharacterLength = 32767;
            this.countriesLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.countriesLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.countriesLookup1.Name = "countriesLookup1";
            this.countriesLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.countriesLookup1.PascalCase = false;
            this.countriesLookup1.RangeInQueryMode = false;
            this.countriesLookup1.ReadOnly = false;
            this.countriesLookup1.RegularExpressionValidator = null;
            this.countriesLookup1.Size = new System.Drawing.Size(246, 45);
            this.countriesLookup1.TabIndex = 9;
            this.countriesLookup1.Title = "Countries";
            this.countriesLookup1.ToolTipLookupField = "information";
            this.countriesLookup1.ValueText = null;
            // 
            // statesLookup1
            // 
            this.statesLookup1.AllowsNew = false;
            this.statesLookup1.AllowsReference = false;
            this.statesLookup1.AllowsUpdate = false;
            this.statesLookup1.BackColor = System.Drawing.Color.Transparent;
            this.statesLookup1.CalledScreenApplicationId = null;
            this.statesLookup1.CalledScreenTypeName = null;
            this.statesLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.statesLookup1, 2);
            this.statesLookup1.CountryCode = 0;
            this.statesLookup1.DisplayText = "";
            this.statesLookup1.DisplayTextBindingKey = null;
            this.statesLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.statesLookup1.EditingControlDataGridView = null;
            this.statesLookup1.EditingControlFormattedValue = null;
            this.statesLookup1.EditingControlRowIndex = 0;
            this.statesLookup1.EditingControlValueChanged = true;
            this.statesLookup1.EnableToolTip = false;
            this.statesLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.statesLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.statesLookup1.IdText = null;
            this.statesLookup1.IdTextBindingKey = null;
            this.statesLookup1.Location = new System.Drawing.Point(258, 267);
            this.statesLookup1.LookupColumns = resources.GetString("statesLookup1.LookupColumns");
            this.statesLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.statesLookup1.LookupResult = null;
            this.statesLookup1.Mandatory = false;
            this.statesLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.statesLookup1.MaxCharacterLength = 32767;
            this.statesLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.statesLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.statesLookup1.Name = "statesLookup1";
            this.statesLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.statesLookup1.PascalCase = false;
            this.statesLookup1.RangeInQueryMode = false;
            this.statesLookup1.ReadOnly = false;
            this.statesLookup1.RegularExpressionValidator = null;
            this.statesLookup1.Size = new System.Drawing.Size(246, 45);
            this.statesLookup1.TabIndex = 10;
            this.statesLookup1.Title = "States";
            this.statesLookup1.ToolTipLookupField = "information";
            this.statesLookup1.ValueText = null;
            // 
            // districtorCitiesLookup1
            // 
            this.districtorCitiesLookup1.AllowsNew = false;
            this.districtorCitiesLookup1.AllowsReference = false;
            this.districtorCitiesLookup1.AllowsUpdate = false;
            this.districtorCitiesLookup1.BackColor = System.Drawing.Color.Transparent;
            this.districtorCitiesLookup1.CalledScreenApplicationId = null;
            this.districtorCitiesLookup1.CalledScreenTypeName = null;
            this.districtorCitiesLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.districtorCitiesLookup1, 2);
            this.districtorCitiesLookup1.DisplayText = "";
            this.districtorCitiesLookup1.DisplayTextBindingKey = null;
            this.districtorCitiesLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.districtorCitiesLookup1.EditingControlDataGridView = null;
            this.districtorCitiesLookup1.EditingControlFormattedValue = null;
            this.districtorCitiesLookup1.EditingControlRowIndex = 0;
            this.districtorCitiesLookup1.EditingControlValueChanged = true;
            this.districtorCitiesLookup1.EnableToolTip = false;
            this.districtorCitiesLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.districtorCitiesLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.districtorCitiesLookup1.IdText = null;
            this.districtorCitiesLookup1.IdTextBindingKey = null;
            this.districtorCitiesLookup1.Location = new System.Drawing.Point(512, 267);
            this.districtorCitiesLookup1.LookupColumns = resources.GetString("districtorCitiesLookup1.LookupColumns");
            this.districtorCitiesLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.districtorCitiesLookup1.LookupResult = null;
            this.districtorCitiesLookup1.Mandatory = false;
            this.districtorCitiesLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.districtorCitiesLookup1.MaxCharacterLength = 32767;
            this.districtorCitiesLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.districtorCitiesLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.districtorCitiesLookup1.Name = "districtorCitiesLookup1";
            this.districtorCitiesLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.districtorCitiesLookup1.PascalCase = false;
            this.districtorCitiesLookup1.RangeInQueryMode = false;
            this.districtorCitiesLookup1.ReadOnly = false;
            this.districtorCitiesLookup1.RegularExpressionValidator = null;
            this.districtorCitiesLookup1.Size = new System.Drawing.Size(246, 45);
            this.districtorCitiesLookup1.StateCode = 0;
            this.districtorCitiesLookup1.TabIndex = 11;
            this.districtorCitiesLookup1.Title = "DistrictorCities";
            this.districtorCitiesLookup1.ToolTipLookupField = "information";
            this.districtorCitiesLookup1.ValueText = null;
            // 
            // dtGnc
            // 
            this.dtGnc.AllowsNew = false;
            this.dtGnc.AllowsReference = false;
            this.dtGnc.AllowsUpdate = false;
            this.dtGnc.ApplicationIdForDbConnection = null;
            this.dtGnc.BackColor = System.Drawing.Color.Transparent;
            this.dtGnc.CalledScreenApplicationId = null;
            this.dtGnc.CalledScreenTypeName = null;
            this.dtGnc.CallingScreenType = null;
            this.dtGnc.DisplayText = null;
            this.dtGnc.DisplayTextAsDateTime = null;
            this.dtGnc.DisplayTextBindingKey = null;
            this.dtGnc.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtGnc.EditingControlDataGridView = null;
            this.dtGnc.EditingControlFormattedValue = null;
            this.dtGnc.EditingControlRowIndex = 0;
            this.dtGnc.EditingControlValueChanged = false;
            this.dtGnc.EnableToolTip = false;
            this.dtGnc.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtGnc.IdText = "";
            this.dtGnc.IdTextBindingKey = null;
            this.dtGnc.Location = new System.Drawing.Point(4, 399);
            this.dtGnc.Lookup = true;
            this.dtGnc.LookupColumns = null;
            this.dtGnc.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtGnc.LookupResult = null;
            this.dtGnc.Mandatory = false;
            this.dtGnc.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtGnc.MaxCharacterLength = 32767;
            this.dtGnc.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtGnc.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtGnc.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtGnc.MinValue = new System.DateTime(((long)(0)));
            this.dtGnc.Name = "dtGnc";
            this.dtGnc.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtGnc.PascalCase = false;
            this.dtGnc.RangeInQueryMode = false;
            this.dtGnc.ReadOnly = false;
            this.dtGnc.RegularExpressionValidator = null;
            this.dtGnc.Size = new System.Drawing.Size(119, 45);
            this.dtGnc.TabIndex = 12;
            this.dtGnc.Title = "Gnc";
            this.dtGnc.ToolTipLookupField = "information";
            this.dtGnc.ValueText = "";
            // 
            // intCount1
            // 
            this.intCount1.AllowsNew = false;
            this.intCount1.AllowsReference = false;
            this.intCount1.AllowsUpdate = false;
            this.intCount1.ApplicationIdForDbConnection = null;
            this.intCount1.BackColor = System.Drawing.Color.Transparent;
            this.intCount1.CalledScreenApplicationId = null;
            this.intCount1.CalledScreenTypeName = null;
            this.intCount1.CallingScreenType = null;
            this.intCount1.DisplayText = "";
            this.intCount1.DisplayTextBindingKey = null;
            this.intCount1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intCount1.EditingControlDataGridView = null;
            this.intCount1.EditingControlFormattedValue = "";
            this.intCount1.EditingControlRowIndex = 0;
            this.intCount1.EditingControlValueChanged = false;
            this.intCount1.EnableToolTip = false;
            this.intCount1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intCount1.IdText = null;
            this.intCount1.IdTextBindingKey = null;
            this.intCount1.Location = new System.Drawing.Point(385, 399);
            this.intCount1.Lookup = false;
            this.intCount1.LookupColumns = null;
            this.intCount1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intCount1.LookupResult = null;
            this.intCount1.Mandatory = false;
            this.intCount1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intCount1.MaxCharacterLength = 32767;
            this.intCount1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intCount1.MaxValue = ((long)(9223372036854775807));
            this.intCount1.MinimumSize = new System.Drawing.Size(10, 22);
            this.intCount1.MinValue = ((long)(-9223372036854775808));
            this.intCount1.Name = "intCount1";
            this.intCount1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intCount1.PascalCase = false;
            this.intCount1.RangeInQueryMode = false;
            this.intCount1.ReadOnly = false;
            this.intCount1.RegularExpressionValidator = null;
            this.intCount1.Size = new System.Drawing.Size(119, 45);
            this.intCount1.TabIndex = 13;
            this.intCount1.Title = "Count 1";
            this.intCount1.ToolTipLookupField = "information";
            this.intCount1.ValueText = null;
            // 
            // intCount2
            // 
            this.intCount2.AllowsNew = false;
            this.intCount2.AllowsReference = false;
            this.intCount2.AllowsUpdate = false;
            this.intCount2.ApplicationIdForDbConnection = null;
            this.intCount2.BackColor = System.Drawing.Color.Transparent;
            this.intCount2.CalledScreenApplicationId = null;
            this.intCount2.CalledScreenTypeName = null;
            this.intCount2.CallingScreenType = null;
            this.intCount2.DisplayText = "";
            this.intCount2.DisplayTextBindingKey = null;
            this.intCount2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intCount2.EditingControlDataGridView = null;
            this.intCount2.EditingControlFormattedValue = "";
            this.intCount2.EditingControlRowIndex = 0;
            this.intCount2.EditingControlValueChanged = false;
            this.intCount2.EnableToolTip = false;
            this.intCount2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intCount2.IdText = null;
            this.intCount2.IdTextBindingKey = null;
            this.intCount2.Location = new System.Drawing.Point(512, 399);
            this.intCount2.Lookup = false;
            this.intCount2.LookupColumns = null;
            this.intCount2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intCount2.LookupResult = null;
            this.intCount2.Mandatory = false;
            this.intCount2.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intCount2.MaxCharacterLength = 32767;
            this.intCount2.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intCount2.MaxValue = ((long)(9223372036854775807));
            this.intCount2.MinimumSize = new System.Drawing.Size(10, 22);
            this.intCount2.MinValue = ((long)(-9223372036854775808));
            this.intCount2.Name = "intCount2";
            this.intCount2.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intCount2.PascalCase = false;
            this.intCount2.RangeInQueryMode = false;
            this.intCount2.ReadOnly = false;
            this.intCount2.RegularExpressionValidator = null;
            this.intCount2.Size = new System.Drawing.Size(119, 45);
            this.intCount2.TabIndex = 14;
            this.intCount2.Title = "Count 2";
            this.intCount2.ToolTipLookupField = "information";
            this.intCount2.ValueText = null;
            // 
            // chkGncBoolean
            // 
            this.chkGncBoolean.AutoSize = true;
            this.chkGncBoolean.BackColor = System.Drawing.Color.Transparent;
            this.chkGncBoolean.BindingKey = null;
            this.chkGncBoolean.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkGncBoolean.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkGncBoolean.Location = new System.Drawing.Point(638, 399);
            this.chkGncBoolean.Name = "chkGncBoolean";
            this.chkGncBoolean.Size = new System.Drawing.Size(121, 60);
            this.chkGncBoolean.TabIndex = 15;
            this.chkGncBoolean.Text = "Gnc Boolean";
            this.chkGncBoolean.UseVisualStyleBackColor = true;
            // 
            // chkEject
            // 
            this.chkEject.AutoSize = true;
            this.chkEject.BackColor = System.Drawing.Color.Transparent;
            this.chkEject.BindingKey = null;
            this.chkEject.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkEject.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkEject.Location = new System.Drawing.Point(892, 399);
            this.chkEject.Name = "chkEject";
            this.chkEject.Size = new System.Drawing.Size(124, 60);
            this.chkEject.TabIndex = 16;
            this.chkEject.Text = "Eject";
            this.chkEject.UseVisualStyleBackColor = true;
            // 
            // chkRegerenrateRpt
            // 
            this.chkRegerenrateRpt.AutoSize = true;
            this.chkRegerenrateRpt.BackColor = System.Drawing.Color.Transparent;
            this.chkRegerenrateRpt.BindingKey = null;
            this.tlpBase.SetColumnSpan(this.chkRegerenrateRpt, 2);
            this.chkRegerenrateRpt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkRegerenrateRpt.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkRegerenrateRpt.Location = new System.Drawing.Point(3, 465);
            this.chkRegerenrateRpt.Name = "chkRegerenrateRpt";
            this.chkRegerenrateRpt.Size = new System.Drawing.Size(248, 67);
            this.chkRegerenrateRpt.TabIndex = 17;
            this.chkRegerenrateRpt.Text = "Regenerate Report";
            this.chkRegerenrateRpt.UseVisualStyleBackColor = true;
            // 
            // btnReport
            // 
            this.btnReport.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnReport.Location = new System.Drawing.Point(811, 465);
            this.btnReport.Name = "btnReport";
            this.btnReport.Size = new System.Drawing.Size(75, 67);
            this.btnReport.TabIndex = 18;
            this.btnReport.Text = "Report";
            this.btnReport.UseVisualStyleBackColor = true;
            // 
            // btnClear
            // 
            this.btnClear.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnClear.Location = new System.Drawing.Point(892, 465);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(75, 67);
            this.btnClear.TabIndex = 19;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = true;
            // 
            // GenericReports
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1019, 535);
            this.Controls.Add(this.tlpBase);
            this.Name = "GenericReports";
            this.Text = "Generic Reports";
            this.tlpBase.ResumeLayout(false);
            this.tlpBase.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDBLookups.SatsangCentresLookup satsangCentresLookup1;
        private DCC.UMB.CDF.UIControls.DCCCheckBox dccCheckBox1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intSessionId;
        private DCC.UMB.CDBLookups.DeptGroupsLookup deptGroupsLookup1;
        private DCC.UMB.CDBControls.DropDown.GenderCombo genderCombo1;
        private DCC.UMB.CDBControls.DropDown.MaritalStatusCombo maritalStatusCombo1;
        private DCC.UMB.CDBLookups.SewadarTypesLookup sewadarTypesLookup1;
        private DCC.UMB.CDF.UIControls.TextControls.DateRangePair dateRangePair1;
        private DCC.UMB.CDBLookups.CountriesLookup countriesLookup1;
        private DCC.UMB.CDBLookups.StatesLookup statesLookup1;
        private DCC.UMB.CDBLookups.DistrictorCitiesLookup districtorCitiesLookup1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtGnc;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intCount1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intCount2;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkGncBoolean;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkEject;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkRegerenrateRpt;
        private System.Windows.Forms.Button btnReport;
        private System.Windows.Forms.Button btnClear;

    }
}