namespace DCC.ZOS.ZSM.RPT
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
            this.chkSummarised = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.intSessionId = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.dateRangePair1 = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.dtGnc2 = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.intCount1 = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.intCount2 = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.chkGncBoolean = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.sewaLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.weeklySewaLocationLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.WeeklySewaLocationLookup();
            this.countriesListBox1 = new DCC.UMB.CDBControls.Lists.CountriesListBox();
            this.statesListBox1 = new DCC.UMB.CDBControls.Lists.StatesListBox();
            this.districtOrCitiesListBox1 = new DCC.UMB.CDBControls.Lists.DistrictOrCitiesListBox();
            this.creditSpecificationsLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.CreditSpecificationsLookup();
            this.attributesLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.AttributesLookup();
            this.sewaTeamsLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup();
            this.postOfficeOrCityListBox1 = new DCC.ZOS.ZSM.Controls.Lists.PostOfficeOrCityListBox();
            this.statusListBox1 = new DCC.ZOS.ZSM.Controls.Lists.StatusListBox();
            this.txtReportFooter = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.departmentChooser1 = new DCC.ZOS.ZSM.Controls.Misc.DepartmentChooser();
            this.tblDept = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.departmentListBox1 = new DCC.ZOS.ZSM.Controls.Lists.DepartmentListBox();
            this.subDepartmentListBox1 = new DCC.ZOS.ZSM.Controls.Lists.SubDepartmentListBox();
            this.skillsLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SkillsLookup();
            this.qualificationTypesLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.QualificationTypesLookup();
            this.splitSatsangCentre = new System.Windows.Forms.SplitContainer();
            this.satsangCentresListBox1 = new DCC.UMB.CDBControls.Lists.SatsangCentresListBox();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtSatsangCentreNm = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.lookupArea = new DCC.ZOS.ZSM.Controls.ZSMLookups.ZSMSatsangCentresLookup();
            this.sewadarListLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup();
            this.tblSwdLst = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtSewadarListNm = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.chkSewadarList = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.dtGnc1 = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.chkRegerenrateRpt = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.outstationSewadarCombo1 = new DCC.ZOS.ZSM.Controls.DropDown.OutstationSewadarCombo();
            this.chkEject = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.genderCombo1 = new DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo();
            this.sewaShitsLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaShitsLookup();
            this.txtReportName = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.badgeTemplateCombo1 = new DCC.ZOS.ZSM.Controls.Combos.BadgeTemplateCombo();
            this.cmbRemarksType = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.cmbSewadarType = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.tlpBase.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.tblDept.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitSatsangCentre)).BeginInit();
            this.splitSatsangCentre.Panel1.SuspendLayout();
            this.splitSatsangCentre.Panel2.SuspendLayout();
            this.splitSatsangCentre.SuspendLayout();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.tblSwdLst.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 8;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.50015F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 14.91658F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.00981F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.50016F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.49891F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.50016F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.8371F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.07066F));
            this.tlpBase.Controls.Add(this.chkSummarised, 6, 0);
            this.tlpBase.Controls.Add(this.intSessionId, 7, 0);
            this.tlpBase.Controls.Add(this.dateRangePair1, 0, 3);
            this.tlpBase.Controls.Add(this.dtGnc2, 1, 7);
            this.tlpBase.Controls.Add(this.intCount1, 3, 6);
            this.tlpBase.Controls.Add(this.intCount2, 4, 6);
            this.tlpBase.Controls.Add(this.chkGncBoolean, 5, 6);
            this.tlpBase.Controls.Add(this.sewaLookup1, 4, 3);
            this.tlpBase.Controls.Add(this.weeklySewaLocationLookup1, 6, 2);
            this.tlpBase.Controls.Add(this.countriesListBox1, 0, 4);
            this.tlpBase.Controls.Add(this.statesListBox1, 2, 4);
            this.tlpBase.Controls.Add(this.districtOrCitiesListBox1, 4, 4);
            this.tlpBase.Controls.Add(this.creditSpecificationsLookup1, 0, 5);
            this.tlpBase.Controls.Add(this.attributesLookup1, 1, 6);
            this.tlpBase.Controls.Add(this.sewaTeamsLookup1, 6, 3);
            this.tlpBase.Controls.Add(this.postOfficeOrCityListBox1, 6, 4);
            this.tlpBase.Controls.Add(this.statusListBox1, 2, 2);
            this.tlpBase.Controls.Add(this.txtReportFooter, 2, 7);
            this.tlpBase.Controls.Add(this.splitContainer1, 0, 1);
            this.tlpBase.Controls.Add(this.skillsLookup1, 2, 5);
            this.tlpBase.Controls.Add(this.qualificationTypesLookup1, 4, 5);
            this.tlpBase.Controls.Add(this.splitSatsangCentre, 4, 0);
            this.tlpBase.Controls.Add(this.sewadarListLookup1, 6, 1);
            this.tlpBase.Controls.Add(this.tblSwdLst, 6, 5);
            this.tlpBase.Controls.Add(this.dtGnc1, 0, 7);
            this.tlpBase.Controls.Add(this.chkRegerenrateRpt, 7, 7);
            this.tlpBase.Controls.Add(this.outstationSewadarCombo1, 0, 6);
            this.tlpBase.Controls.Add(this.chkEject, 7, 6);
            this.tlpBase.Controls.Add(this.genderCombo1, 0, 2);
            this.tlpBase.Controls.Add(this.sewaShitsLookup1, 7, 3);
            this.tlpBase.Controls.Add(this.txtReportName, 0, 0);
            this.tlpBase.Controls.Add(this.badgeTemplateCombo1, 4, 2);
            this.tlpBase.Controls.Add(this.cmbRemarksType, 6, 6);
            this.tlpBase.Controls.Add(this.cmbSewadarType, 1, 2);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 8;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 22.22222F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.11111F));
            this.tlpBase.Size = new System.Drawing.Size(963, 535);
            this.tlpBase.TabIndex = 2;
            // 
            // chkSummarised
            // 
            this.chkSummarised.AutoSize = true;
            this.chkSummarised.BackColor = System.Drawing.Color.Transparent;
            this.chkSummarised.BindingKey = null;
            this.chkSummarised.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkSummarised.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkSummarised.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkSummarised.Location = new System.Drawing.Point(716, 3);
            this.chkSummarised.Name = "chkSummarised";
            this.chkSummarised.Size = new System.Drawing.Size(126, 53);
            this.chkSummarised.TabIndex = 1;
            this.chkSummarised.Text = "Summarised";
            this.chkSummarised.UseVisualStyleBackColor = true;
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
            this.intSessionId.EditingControlFormattedValue = null;
            this.intSessionId.EditingControlRowIndex = 0;
            this.intSessionId.EditingControlValueChanged = false;
            this.intSessionId.EnableToolTip = false;
            this.intSessionId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSessionId.IdText = "";
            this.intSessionId.IdTextBindingKey = null;
            this.intSessionId.Location = new System.Drawing.Point(849, 3);
            this.intSessionId.Lookup = true;
            this.intSessionId.LookupColumns = resources.GetString("intSessionId.LookupColumns");
            this.intSessionId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intSessionId.LookupResult = null;
            this.intSessionId.LookupTitle = "Session Id";
            this.intSessionId.Mandatory = false;
            this.intSessionId.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intSessionId.MaxCharacterLength = 32767;
            this.intSessionId.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intSessionId.MaxValue = ((long)(9223372036854775807));
            this.intSessionId.MinCharactersForQuery = 0;
            this.intSessionId.MinimumSize = new System.Drawing.Size(10, 22);
            this.intSessionId.MinValue = ((long)(-9223372036854775808));
            this.intSessionId.Name = "intSessionId";
            this.intSessionId.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.intSessionId.PascalCase = false;
            this.intSessionId.RangeInQueryMode = false;
            this.intSessionId.ReadOnly = false;
            this.intSessionId.RegularExpressionValidator = null;
            this.intSessionId.Size = new System.Drawing.Size(110, 45);
            this.intSessionId.TabIndex = 2;
            this.intSessionId.Title = "Session Id";
            this.intSessionId.ToolTipLookupField = "information";
            this.intSessionId.ValueText = "";
            // 
            // dateRangePair1
            // 
            this.tlpBase.SetColumnSpan(this.dateRangePair1, 2);
            this.dateRangePair1.DiscreteInQueryMode = false;
            this.dateRangePair1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dateRangePair1.FillDefailtValuesInInsertMode = false;
            this.dateRangePair1.FromDate = null;
            this.dateRangePair1.FromDateFieldBindingKey = "effective_from_dt";
            this.dateRangePair1.FromDateMandatory = false;
            this.dateRangePair1.FromDateTitle = "Start Date";
            this.dateRangePair1.Location = new System.Drawing.Point(4, 181);
            this.dateRangePair1.Mandatory = false;
            this.dateRangePair1.Margin = new System.Windows.Forms.Padding(4);
            this.dateRangePair1.Name = "dateRangePair1";
            this.dateRangePair1.ReadOnly = false;
            this.dateRangePair1.Size = new System.Drawing.Size(253, 51);
            this.dateRangePair1.TabIndex = 8;
            this.dateRangePair1.TitleInQueryMode = "Start Date";
            this.dateRangePair1.ToDate = null;
            this.dateRangePair1.ToDateFieldBindingKey = "effective_till_dt";
            this.dateRangePair1.ToDateMandatory = false;
            this.dateRangePair1.ToDateTitle = "End Date";
            // 
            // dtGnc2
            // 
            this.dtGnc2.AllowFutureDate = true;
            this.dtGnc2.AllowsNew = false;
            this.dtGnc2.AllowsReference = false;
            this.dtGnc2.AllowsUpdate = false;
            this.dtGnc2.ApplicationIdForDbConnection = null;
            this.dtGnc2.BackColor = System.Drawing.Color.Transparent;
            this.dtGnc2.CalledScreenApplicationId = null;
            this.dtGnc2.CalledScreenTypeName = null;
            this.dtGnc2.CallingScreenType = null;
            this.dtGnc2.DisplayText = null;
            this.dtGnc2.DisplayTextAsDateTime = null;
            this.dtGnc2.DisplayTextBindingKey = null;
            this.dtGnc2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtGnc2.EditingControlDataGridView = null;
            this.dtGnc2.EditingControlFormattedValue = null;
            this.dtGnc2.EditingControlRowIndex = 0;
            this.dtGnc2.EditingControlValueChanged = false;
            this.dtGnc2.EnableToolTip = false;
            this.dtGnc2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtGnc2.IdText = "";
            this.dtGnc2.IdTextBindingKey = null;
            this.dtGnc2.Location = new System.Drawing.Point(123, 475);
            this.dtGnc2.Lookup = true;
            this.dtGnc2.LookupColumns = null;
            this.dtGnc2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtGnc2.LookupResult = null;
            this.dtGnc2.LookupTitle = "Gnc2";
            this.dtGnc2.Mandatory = false;
            this.dtGnc2.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtGnc2.MaxCharacterLength = 11;
            this.dtGnc2.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtGnc2.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtGnc2.MinCharactersForQuery = 0;
            this.dtGnc2.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtGnc2.MinValue = new System.DateTime(((long)(0)));
            this.dtGnc2.Name = "dtGnc2";
            this.dtGnc2.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtGnc2.PascalCase = false;
            this.dtGnc2.RangeInQueryMode = false;
            this.dtGnc2.ReadOnly = false;
            this.dtGnc2.RegularExpressionValidator = null;
            this.dtGnc2.ShowTime = false;
            this.dtGnc2.Size = new System.Drawing.Size(134, 45);
            this.dtGnc2.TabIndex = 12;
            this.dtGnc2.Title = "Gnc2";
            this.dtGnc2.ToolTipLookupField = "information";
            this.dtGnc2.ValueText = "";
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
            this.intCount1.Location = new System.Drawing.Point(360, 416);
            this.intCount1.Lookup = false;
            this.intCount1.LookupColumns = null;
            this.intCount1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intCount1.LookupResult = null;
            this.intCount1.LookupTitle = "Count 1";
            this.intCount1.Mandatory = false;
            this.intCount1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intCount1.MaxCharacterLength = 32767;
            this.intCount1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intCount1.MaxValue = ((long)(9223372036854775807));
            this.intCount1.MinCharactersForQuery = 0;
            this.intCount1.MinimumSize = new System.Drawing.Size(10, 22);
            this.intCount1.MinValue = ((long)(-9223372036854775808));
            this.intCount1.Name = "intCount1";
            this.intCount1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intCount1.PascalCase = false;
            this.intCount1.RangeInQueryMode = false;
            this.intCount1.ReadOnly = false;
            this.intCount1.RegularExpressionValidator = null;
            this.intCount1.Size = new System.Drawing.Size(111, 45);
            this.intCount1.TabIndex = 13;
            this.intCount1.Title = "Count 1";
            this.intCount1.ToolTipLookupField = "information";
            this.intCount1.ValueText = null;
            this.intCount1.Validating += new System.ComponentModel.CancelEventHandler(this.intCount1_Validating);
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
            this.intCount2.Location = new System.Drawing.Point(479, 416);
            this.intCount2.Lookup = false;
            this.intCount2.LookupColumns = null;
            this.intCount2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intCount2.LookupResult = null;
            this.intCount2.LookupTitle = "Count 2";
            this.intCount2.Mandatory = false;
            this.intCount2.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intCount2.MaxCharacterLength = 32767;
            this.intCount2.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intCount2.MaxValue = ((long)(9223372036854775807));
            this.intCount2.MinCharactersForQuery = 0;
            this.intCount2.MinimumSize = new System.Drawing.Size(10, 22);
            this.intCount2.MinValue = ((long)(-9223372036854775808));
            this.intCount2.Name = "intCount2";
            this.intCount2.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intCount2.PascalCase = false;
            this.intCount2.RangeInQueryMode = false;
            this.intCount2.ReadOnly = false;
            this.intCount2.RegularExpressionValidator = null;
            this.intCount2.Size = new System.Drawing.Size(111, 45);
            this.intCount2.TabIndex = 14;
            this.intCount2.Title = "Count 2";
            this.intCount2.ToolTipLookupField = "information";
            this.intCount2.ValueText = null;
            this.intCount2.Validating += new System.ComponentModel.CancelEventHandler(this.intCount2_Validating);
            // 
            // chkGncBoolean
            // 
            this.chkGncBoolean.AutoSize = true;
            this.chkGncBoolean.BackColor = System.Drawing.Color.Transparent;
            this.chkGncBoolean.BindingKey = null;
            this.chkGncBoolean.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkGncBoolean.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkGncBoolean.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkGncBoolean.Location = new System.Drawing.Point(597, 416);
            this.chkGncBoolean.Name = "chkGncBoolean";
            this.chkGncBoolean.Size = new System.Drawing.Size(113, 53);
            this.chkGncBoolean.TabIndex = 15;
            this.chkGncBoolean.Text = "Gnc Boolean";
            this.chkGncBoolean.UseVisualStyleBackColor = true;
            // 
            // sewaLookup1
            // 
            this.sewaLookup1.AllowsNew = false;
            this.sewaLookup1.AllowsReference = false;
            this.sewaLookup1.AllowsUpdate = false;
            this.sewaLookup1.ApplicationIdForDbConnection = null;
            this.sewaLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewaLookup1.CalledScreenApplicationId = null;
            this.sewaLookup1.CalledScreenTypeName = null;
            this.sewaLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.sewaLookup1, 2);
            this.sewaLookup1.DisplayText = "";
            this.sewaLookup1.DisplayTextBindingKey = null;
            this.sewaLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaLookup1.EditingControlDataGridView = null;
            this.sewaLookup1.EditingControlFormattedValue = null;
            this.sewaLookup1.EditingControlRowIndex = 0;
            this.sewaLookup1.EditingControlValueChanged = true;
            this.sewaLookup1.EnableToolTip = false;
            this.sewaLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaLookup1.IdText = "";
            this.sewaLookup1.IdTextBindingKey = null;
            this.sewaLookup1.Location = new System.Drawing.Point(479, 180);
            this.sewaLookup1.Lookup = true;
            this.sewaLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewaLookup1.LookupResult = null;
            this.sewaLookup1.LookupTitle = "Sewa";
            this.sewaLookup1.Mandatory = false;
            this.sewaLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaLookup1.MaxCharacterLength = 32767;
            this.sewaLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaLookup1.MinCharactersForQuery = 0;
            this.sewaLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaLookup1.Name = "sewaLookup1";
            this.sewaLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaLookup1.PascalCase = false;
            this.sewaLookup1.RangeInQueryMode = false;
            this.sewaLookup1.ReadOnly = false;
            this.sewaLookup1.RegularExpressionValidator = null;
            this.sewaLookup1.Size = new System.Drawing.Size(230, 45);
            this.sewaLookup1.TabIndex = 20;
            this.sewaLookup1.Title = "Sewa";
            this.sewaLookup1.ToolTipLookupField = "information";
            this.sewaLookup1.ValueText = "";
            this.sewaLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookup1_LookupDialogShowing);
            // 
            // weeklySewaLocationLookup1
            // 
            this.weeklySewaLocationLookup1.AllowsNew = false;
            this.weeklySewaLocationLookup1.AllowsReference = false;
            this.weeklySewaLocationLookup1.AllowsUpdate = false;
            this.weeklySewaLocationLookup1.ApplicationIdForDbConnection = null;
            this.weeklySewaLocationLookup1.BackColor = System.Drawing.Color.Transparent;
            this.weeklySewaLocationLookup1.CalledScreenApplicationId = null;
            this.weeklySewaLocationLookup1.CalledScreenTypeName = null;
            this.weeklySewaLocationLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.weeklySewaLocationLookup1, 2);
            this.weeklySewaLocationLookup1.DisplayText = "";
            this.weeklySewaLocationLookup1.DisplayTextBindingKey = null;
            this.weeklySewaLocationLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.weeklySewaLocationLookup1.EditingControlDataGridView = null;
            this.weeklySewaLocationLookup1.EditingControlFormattedValue = null;
            this.weeklySewaLocationLookup1.EditingControlRowIndex = 0;
            this.weeklySewaLocationLookup1.EditingControlValueChanged = true;
            this.weeklySewaLocationLookup1.EnableToolTip = false;
            this.weeklySewaLocationLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.weeklySewaLocationLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.weeklySewaLocationLookup1.IdText = "";
            this.weeklySewaLocationLookup1.IdTextBindingKey = null;
            this.weeklySewaLocationLookup1.Location = new System.Drawing.Point(717, 121);
            this.weeklySewaLocationLookup1.Lookup = true;
            this.weeklySewaLocationLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.weeklySewaLocationLookup1.LookupResult = null;
            this.weeklySewaLocationLookup1.LookupTitle = "Weekly Location";
            this.weeklySewaLocationLookup1.Mandatory = false;
            this.weeklySewaLocationLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.weeklySewaLocationLookup1.MaxCharacterLength = 32767;
            this.weeklySewaLocationLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.weeklySewaLocationLookup1.MinCharactersForQuery = 0;
            this.weeklySewaLocationLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.weeklySewaLocationLookup1.Name = "weeklySewaLocationLookup1";
            this.weeklySewaLocationLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.weeklySewaLocationLookup1.PascalCase = false;
            this.weeklySewaLocationLookup1.RangeInQueryMode = false;
            this.weeklySewaLocationLookup1.ReadOnly = false;
            this.weeklySewaLocationLookup1.RegularExpressionValidator = null;
            this.weeklySewaLocationLookup1.Size = new System.Drawing.Size(242, 45);
            this.weeklySewaLocationLookup1.TabIndex = 22;
            this.weeklySewaLocationLookup1.Title = "Weekly Location";
            this.weeklySewaLocationLookup1.ToolTipLookupField = "information";
            this.weeklySewaLocationLookup1.ValueText = "";
            // 
            // countriesListBox1
            // 
            this.countriesListBox1.ApplicationIdForDbConnection = "CDB_APP";
            this.countriesListBox1.BackColor = System.Drawing.Color.Transparent;
            this.countriesListBox1.CalledScreenApplicationId = null;
            this.countriesListBox1.CalledScreenTypeName = null;
            this.countriesListBox1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.countriesListBox1, 2);
            this.countriesListBox1.DisplayTextBindingKey = null;
            this.countriesListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.countriesListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.countriesListBox1.IdTextBindingKey = "countries_ids_xml";
            this.countriesListBox1.Location = new System.Drawing.Point(4, 239);
            this.countriesListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.countriesListBox1.Mandatory = false;
            this.countriesListBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.countriesListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.countriesListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.countriesListBox1.Name = "countriesListBox1";
            this.countriesListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.countriesListBox1.ReadOnly = false;
            this.countriesListBox1.Size = new System.Drawing.Size(253, 112);
            this.countriesListBox1.TabIndex = 26;
            this.countriesListBox1.Title = "Country (s)";
            // 
            // statesListBox1
            // 
            this.statesListBox1.ApplicationIdForDbConnection = "CDB_APP";
            this.statesListBox1.BackColor = System.Drawing.Color.Transparent;
            this.statesListBox1.CalledScreenApplicationId = null;
            this.statesListBox1.CalledScreenTypeName = null;
            this.statesListBox1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.statesListBox1, 2);
            this.statesListBox1.DisplayTextBindingKey = null;
            this.statesListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.statesListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.statesListBox1.IdTextBindingKey = "states_ids_xml";
            this.statesListBox1.Location = new System.Drawing.Point(265, 239);
            this.statesListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.statesListBox1.Mandatory = false;
            this.statesListBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.statesListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.statesListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.statesListBox1.Name = "statesListBox1";
            this.statesListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.statesListBox1.ReadOnly = false;
            this.statesListBox1.Size = new System.Drawing.Size(206, 112);
            this.statesListBox1.TabIndex = 27;
            this.statesListBox1.Title = "State(s)";
            this.statesListBox1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.statesListBox1_LookupDialogShowing);
            // 
            // districtOrCitiesListBox1
            // 
            this.districtOrCitiesListBox1.ApplicationIdForDbConnection = "CDB_APP";
            this.districtOrCitiesListBox1.BackColor = System.Drawing.Color.Transparent;
            this.districtOrCitiesListBox1.CalledScreenApplicationId = "CDB_APP";
            this.districtOrCitiesListBox1.CalledScreenTypeName = null;
            this.districtOrCitiesListBox1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.districtOrCitiesListBox1, 2);
            this.districtOrCitiesListBox1.DisplayTextBindingKey = null;
            this.districtOrCitiesListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.districtOrCitiesListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.districtOrCitiesListBox1.IdTextBindingKey = "districtorcities_ids_xml";
            this.districtOrCitiesListBox1.Location = new System.Drawing.Point(479, 239);
            this.districtOrCitiesListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.districtOrCitiesListBox1.Mandatory = false;
            this.districtOrCitiesListBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.districtOrCitiesListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.districtOrCitiesListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.districtOrCitiesListBox1.Name = "districtOrCitiesListBox1";
            this.districtOrCitiesListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.districtOrCitiesListBox1.ReadOnly = false;
            this.districtOrCitiesListBox1.Size = new System.Drawing.Size(230, 112);
            this.districtOrCitiesListBox1.TabIndex = 28;
            this.districtOrCitiesListBox1.Title = "District(s) Or City(s)";
            this.districtOrCitiesListBox1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.districtOrCitiesListBox1_LookupDialogShowing);
            // 
            // creditSpecificationsLookup1
            // 
            this.creditSpecificationsLookup1.AllowsNew = false;
            this.creditSpecificationsLookup1.AllowsReference = false;
            this.creditSpecificationsLookup1.AllowsUpdate = false;
            this.creditSpecificationsLookup1.ApplicationIdForDbConnection = null;
            this.creditSpecificationsLookup1.BackColor = System.Drawing.Color.Transparent;
            this.creditSpecificationsLookup1.CalledScreenApplicationId = null;
            this.creditSpecificationsLookup1.CalledScreenTypeName = null;
            this.creditSpecificationsLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.creditSpecificationsLookup1, 2);
            this.creditSpecificationsLookup1.DisplayText = "";
            this.creditSpecificationsLookup1.DisplayTextBindingKey = "credit_specification_nm";
            this.creditSpecificationsLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.creditSpecificationsLookup1.EditingControlDataGridView = null;
            this.creditSpecificationsLookup1.EditingControlFormattedValue = null;
            this.creditSpecificationsLookup1.EditingControlRowIndex = 0;
            this.creditSpecificationsLookup1.EditingControlValueChanged = true;
            this.creditSpecificationsLookup1.EnableToolTip = false;
            this.creditSpecificationsLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.creditSpecificationsLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.creditSpecificationsLookup1.IdText = "";
            this.creditSpecificationsLookup1.IdTextBindingKey = "credit_specification_id";
            this.creditSpecificationsLookup1.Location = new System.Drawing.Point(4, 357);
            this.creditSpecificationsLookup1.Lookup = true;
            this.creditSpecificationsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.creditSpecificationsLookup1.LookupResult = null;
            this.creditSpecificationsLookup1.LookupTitle = "Credit Specifications";
            this.creditSpecificationsLookup1.Mandatory = false;
            this.creditSpecificationsLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.creditSpecificationsLookup1.MaxCharacterLength = 32767;
            this.creditSpecificationsLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.creditSpecificationsLookup1.MinCharactersForQuery = 0;
            this.creditSpecificationsLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.creditSpecificationsLookup1.Name = "creditSpecificationsLookup1";
            this.creditSpecificationsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.creditSpecificationsLookup1.PascalCase = false;
            this.creditSpecificationsLookup1.RangeInQueryMode = false;
            this.creditSpecificationsLookup1.ReadOnly = false;
            this.creditSpecificationsLookup1.RegularExpressionValidator = null;
            this.creditSpecificationsLookup1.Size = new System.Drawing.Size(253, 45);
            this.creditSpecificationsLookup1.TabIndex = 30;
            this.creditSpecificationsLookup1.Title = "Credit Specifications";
            this.creditSpecificationsLookup1.ToolTipLookupField = "information";
            this.creditSpecificationsLookup1.ValueText = "";
            this.creditSpecificationsLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.creditSpecificationsLookup1_LookupDialogShowing);
            // 
            // attributesLookup1
            // 
            this.attributesLookup1.AllowsNew = false;
            this.attributesLookup1.AllowsReference = false;
            this.attributesLookup1.AllowsUpdate = false;
            this.attributesLookup1.ApplicationIdForDbConnection = null;
            this.attributesLookup1.BackColor = System.Drawing.Color.Transparent;
            this.attributesLookup1.CalledScreenApplicationId = null;
            this.attributesLookup1.CalledScreenTypeName = null;
            this.attributesLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.attributesLookup1, 2);
            this.attributesLookup1.DisplayText = "";
            this.attributesLookup1.DisplayTextBindingKey = "attribute_nm";
            this.attributesLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.attributesLookup1.EditingControlDataGridView = null;
            this.attributesLookup1.EditingControlFormattedValue = null;
            this.attributesLookup1.EditingControlRowIndex = 0;
            this.attributesLookup1.EditingControlValueChanged = true;
            this.attributesLookup1.EnableToolTip = false;
            this.attributesLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.attributesLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.attributesLookup1.IdText = "";
            this.attributesLookup1.IdTextBindingKey = "attribute_id";
            this.attributesLookup1.Location = new System.Drawing.Point(123, 416);
            this.attributesLookup1.Lookup = true;
            this.attributesLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attributesLookup1.LookupResult = null;
            this.attributesLookup1.LookupTitle = "Attributes";
            this.attributesLookup1.Mandatory = false;
            this.attributesLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.attributesLookup1.MaxCharacterLength = 32767;
            this.attributesLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.attributesLookup1.MinCharactersForQuery = 0;
            this.attributesLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.attributesLookup1.Name = "attributesLookup1";
            this.attributesLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.attributesLookup1.PascalCase = false;
            this.attributesLookup1.RangeInQueryMode = false;
            this.attributesLookup1.ReadOnly = false;
            this.attributesLookup1.RegularExpressionValidator = null;
            this.attributesLookup1.Size = new System.Drawing.Size(229, 45);
            this.attributesLookup1.TabIndex = 31;
            this.attributesLookup1.Title = "Attributes";
            this.attributesLookup1.ToolTipLookupField = "information";
            this.attributesLookup1.ValueText = "";
            this.attributesLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.attributesLookup1_LookupDialogShowing);
            // 
            // sewaTeamsLookup1
            // 
            this.sewaTeamsLookup1.AllowsNew = false;
            this.sewaTeamsLookup1.AllowsReference = false;
            this.sewaTeamsLookup1.AllowsUpdate = false;
            this.sewaTeamsLookup1.ApplicationIdForDbConnection = null;
            this.sewaTeamsLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewaTeamsLookup1.CalledScreenApplicationId = null;
            this.sewaTeamsLookup1.CalledScreenTypeName = null;
            this.sewaTeamsLookup1.CallingScreenType = null;
            this.sewaTeamsLookup1.DisplayText = "";
            this.sewaTeamsLookup1.DisplayTextBindingKey = "sewa_team_nm";
            this.sewaTeamsLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaTeamsLookup1.EditingControlDataGridView = null;
            this.sewaTeamsLookup1.EditingControlFormattedValue = null;
            this.sewaTeamsLookup1.EditingControlRowIndex = 0;
            this.sewaTeamsLookup1.EditingControlValueChanged = true;
            this.sewaTeamsLookup1.EnableToolTip = false;
            this.sewaTeamsLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaTeamsLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaTeamsLookup1.IdText = "";
            this.sewaTeamsLookup1.IdTextBindingKey = "sewa_team_id";
            this.sewaTeamsLookup1.Location = new System.Drawing.Point(717, 180);
            this.sewaTeamsLookup1.Lookup = true;
            this.sewaTeamsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewaTeamsLookup1.LookupResult = null;
            this.sewaTeamsLookup1.LookupTitle = "Sewa Team";
            this.sewaTeamsLookup1.Mandatory = false;
            this.sewaTeamsLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaTeamsLookup1.MaxCharacterLength = 32767;
            this.sewaTeamsLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaTeamsLookup1.MinCharactersForQuery = 0;
            this.sewaTeamsLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaTeamsLookup1.Name = "sewaTeamsLookup1";
            this.sewaTeamsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaTeamsLookup1.PascalCase = false;
            this.sewaTeamsLookup1.RangeInQueryMode = false;
            this.sewaTeamsLookup1.ReadOnly = false;
            this.sewaTeamsLookup1.RegularExpressionValidator = null;
            this.sewaTeamsLookup1.Size = new System.Drawing.Size(124, 45);
            this.sewaTeamsLookup1.TabIndex = 32;
            this.sewaTeamsLookup1.Title = "Sewa Team";
            this.sewaTeamsLookup1.ToolTipLookupField = "information";
            this.sewaTeamsLookup1.ValueText = "";
            this.sewaTeamsLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaTeamsLookup1_LookupDialogShowing);
            // 
            // postOfficeOrCityListBox1
            // 
            this.postOfficeOrCityListBox1.ApplicationIdForDbConnection = null;
            this.postOfficeOrCityListBox1.BackColor = System.Drawing.Color.Transparent;
            this.postOfficeOrCityListBox1.CalledScreenApplicationId = null;
            this.postOfficeOrCityListBox1.CalledScreenTypeName = null;
            this.postOfficeOrCityListBox1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.postOfficeOrCityListBox1, 2);
            this.postOfficeOrCityListBox1.DisplayTextBindingKey = null;
            this.postOfficeOrCityListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.postOfficeOrCityListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.postOfficeOrCityListBox1.IdTextBindingKey = "post_office_or_city_ids_xml";
            this.postOfficeOrCityListBox1.Location = new System.Drawing.Point(717, 239);
            this.postOfficeOrCityListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.postOfficeOrCityListBox1.Mandatory = false;
            this.postOfficeOrCityListBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.postOfficeOrCityListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.postOfficeOrCityListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.postOfficeOrCityListBox1.Name = "postOfficeOrCityListBox1";
            this.postOfficeOrCityListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.postOfficeOrCityListBox1.ReadOnly = false;
            this.postOfficeOrCityListBox1.Size = new System.Drawing.Size(242, 112);
            this.postOfficeOrCityListBox1.TabIndex = 33;
            this.postOfficeOrCityListBox1.Title = "Post Office/City (s)";
            this.postOfficeOrCityListBox1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.postOfficeOrCityListBox1_LookupDialogShowing);
            // 
            // statusListBox1
            // 
            this.statusListBox1.ApplicationIdForDbConnection = null;
            this.statusListBox1.BackColor = System.Drawing.Color.Transparent;
            this.statusListBox1.CalledScreenApplicationId = null;
            this.statusListBox1.CalledScreenTypeName = null;
            this.statusListBox1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.statusListBox1, 2);
            this.statusListBox1.DisplayTextBindingKey = null;
            this.statusListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.statusListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.statusListBox1.IdTextBindingKey = "status_ids_xml";
            this.statusListBox1.IsGlobal = false;
            this.statusListBox1.Location = new System.Drawing.Point(265, 121);
            this.statusListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.statusListBox1.Mandatory = false;
            this.statusListBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.statusListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.statusListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.statusListBox1.Name = "statusListBox1";
            this.statusListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.statusListBox1.ReadOnly = false;
            this.tlpBase.SetRowSpan(this.statusListBox1, 2);
            this.statusListBox1.Size = new System.Drawing.Size(206, 112);
            this.statusListBox1.TabIndex = 36;
            this.statusListBox1.Title = "Status(s)";
            // 
            // txtReportFooter
            // 
            this.txtReportFooter.AllowsNew = false;
            this.txtReportFooter.AllowsReference = false;
            this.txtReportFooter.AllowsUpdate = false;
            this.txtReportFooter.ApplicationIdForDbConnection = null;
            this.txtReportFooter.BackColor = System.Drawing.Color.Transparent;
            this.txtReportFooter.CalledScreenApplicationId = null;
            this.txtReportFooter.CalledScreenTypeName = null;
            this.txtReportFooter.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.txtReportFooter, 5);
            this.txtReportFooter.DisplayText = "";
            this.txtReportFooter.DisplayTextBindingKey = null;
            this.txtReportFooter.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtReportFooter.EditingControlDataGridView = null;
            this.txtReportFooter.EditingControlFormattedValue = "";
            this.txtReportFooter.EditingControlRowIndex = 0;
            this.txtReportFooter.EditingControlValueChanged = false;
            this.txtReportFooter.EnableToolTip = false;
            this.txtReportFooter.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtReportFooter.IdText = null;
            this.txtReportFooter.IdTextBindingKey = null;
            this.txtReportFooter.Location = new System.Drawing.Point(265, 475);
            this.txtReportFooter.Lookup = false;
            this.txtReportFooter.LookupColumns = null;
            this.txtReportFooter.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtReportFooter.LookupResult = null;
            this.txtReportFooter.LookupTitle = "Report Footer";
            this.txtReportFooter.Mandatory = false;
            this.txtReportFooter.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtReportFooter.MaxCharacterLength = 32767;
            this.txtReportFooter.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtReportFooter.MinCharactersForQuery = 0;
            this.txtReportFooter.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtReportFooter.Name = "txtReportFooter";
            this.txtReportFooter.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtReportFooter.PascalCase = false;
            this.txtReportFooter.RangeInQueryMode = false;
            this.txtReportFooter.ReadOnly = false;
            this.txtReportFooter.RegularExpressionValidator = null;
            this.txtReportFooter.Size = new System.Drawing.Size(576, 45);
            this.txtReportFooter.TabIndex = 37;
            this.txtReportFooter.Title = "Report Footer";
            this.txtReportFooter.ToolTipLookupField = "information";
            this.txtReportFooter.ValueText = null;
            // 
            // splitContainer1
            // 
            this.tlpBase.SetColumnSpan(this.splitContainer1, 4);
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(3, 62);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.departmentChooser1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.tblDept);
            this.splitContainer1.Size = new System.Drawing.Size(469, 53);
            this.splitContainer1.SplitterDistance = 155;
            this.splitContainer1.TabIndex = 38;
            // 
            // departmentChooser1
            // 
            this.departmentChooser1.DepartmentBindingKey = "department_nm";
            this.departmentChooser1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentChooser1.Location = new System.Drawing.Point(0, 0);
            this.departmentChooser1.Manadatory = false;
            this.departmentChooser1.Margin = new System.Windows.Forms.Padding(4);
            this.departmentChooser1.Name = "departmentChooser1";
            this.departmentChooser1.ReadOnly = false;
            this.departmentChooser1.SatsangCentreId = null;
            this.departmentChooser1.SelectedDepartment = null;
            this.departmentChooser1.SelectedDepartmentName = "";
            this.departmentChooser1.SelectedSubDepartment = null;
            this.departmentChooser1.SelectedSubDepartmentName = "";
            this.departmentChooser1.Size = new System.Drawing.Size(155, 53);
            this.departmentChooser1.SubDepartmentBindingKey = "sub_department_nm";
            this.departmentChooser1.TabIndex = 24;
            // 
            // tblDept
            // 
            this.tblDept.ColumnCount = 2;
            this.tblDept.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblDept.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblDept.Controls.Add(this.departmentListBox1, 0, 0);
            this.tblDept.Controls.Add(this.subDepartmentListBox1, 1, 0);
            this.tblDept.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblDept.Location = new System.Drawing.Point(0, 0);
            this.tblDept.Name = "tblDept";
            this.tblDept.RowCount = 1;
            this.tblDept.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblDept.Size = new System.Drawing.Size(310, 53);
            this.tblDept.TabIndex = 0;
            // 
            // departmentListBox1
            // 
            this.departmentListBox1.ApplicationIdForDbConnection = null;
            this.departmentListBox1.BackColor = System.Drawing.Color.Transparent;
            this.departmentListBox1.CalledScreenApplicationId = null;
            this.departmentListBox1.CalledScreenTypeName = null;
            this.departmentListBox1.CallingScreenType = null;
            this.departmentListBox1.DisplayTextBindingKey = null;
            this.departmentListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.departmentListBox1.IdTextBindingKey = "departments_ids_xml";
            this.departmentListBox1.Location = new System.Drawing.Point(4, 3);
            this.departmentListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.departmentListBox1.Mandatory = false;
            this.departmentListBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.departmentListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.departmentListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.departmentListBox1.Name = "departmentListBox1";
            this.departmentListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.departmentListBox1.ReadOnly = false;
            this.departmentListBox1.Size = new System.Drawing.Size(147, 47);
            this.departmentListBox1.TabIndex = 39;
            this.departmentListBox1.Title = "Department(s)";
            this.departmentListBox1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.departmentListBox1_LookupDialogShowing);
            // 
            // subDepartmentListBox1
            // 
            this.subDepartmentListBox1.ApplicationIdForDbConnection = null;
            this.subDepartmentListBox1.BackColor = System.Drawing.Color.Transparent;
            this.subDepartmentListBox1.CalledScreenApplicationId = null;
            this.subDepartmentListBox1.CalledScreenTypeName = null;
            this.subDepartmentListBox1.CallingScreenType = null;
            this.subDepartmentListBox1.DisplayTextBindingKey = null;
            this.subDepartmentListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.subDepartmentListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.subDepartmentListBox1.IdTextBindingKey = "sub_departments_ids_xml";
            this.subDepartmentListBox1.Location = new System.Drawing.Point(159, 3);
            this.subDepartmentListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.subDepartmentListBox1.Mandatory = false;
            this.subDepartmentListBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.subDepartmentListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.subDepartmentListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.subDepartmentListBox1.Name = "subDepartmentListBox1";
            this.subDepartmentListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.subDepartmentListBox1.ReadOnly = true;
            this.subDepartmentListBox1.Size = new System.Drawing.Size(147, 47);
            this.subDepartmentListBox1.TabIndex = 40;
            this.subDepartmentListBox1.Title = "Sub Department(s)";
            this.subDepartmentListBox1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.subDepartmentListBox1_LookupDialogShowing);
            // 
            // skillsLookup1
            // 
            this.skillsLookup1.AllowsNew = false;
            this.skillsLookup1.AllowsReference = false;
            this.skillsLookup1.AllowsUpdate = false;
            this.skillsLookup1.ApplicationIdForDbConnection = null;
            this.skillsLookup1.BackColor = System.Drawing.Color.Transparent;
            this.skillsLookup1.CalledScreenApplicationId = null;
            this.skillsLookup1.CalledScreenTypeName = null;
            this.skillsLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.skillsLookup1, 2);
            this.skillsLookup1.DisplayText = "";
            this.skillsLookup1.DisplayTextBindingKey = "skill_nm";
            this.skillsLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.skillsLookup1.EditingControlDataGridView = null;
            this.skillsLookup1.EditingControlFormattedValue = null;
            this.skillsLookup1.EditingControlRowIndex = 0;
            this.skillsLookup1.EditingControlValueChanged = true;
            this.skillsLookup1.EnableToolTip = false;
            this.skillsLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.skillsLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.skillsLookup1.IdText = "";
            this.skillsLookup1.IdTextBindingKey = "skill_id";
            this.skillsLookup1.Location = new System.Drawing.Point(265, 357);
            this.skillsLookup1.Lookup = true;
            this.skillsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.skillsLookup1.LookupResult = null;
            this.skillsLookup1.LookupTitle = "Specialisation";
            this.skillsLookup1.Mandatory = false;
            this.skillsLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.skillsLookup1.MaxCharacterLength = 32767;
            this.skillsLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.skillsLookup1.MinCharactersForQuery = 0;
            this.skillsLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.skillsLookup1.Name = "skillsLookup1";
            this.skillsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.skillsLookup1.PascalCase = false;
            this.skillsLookup1.RangeInQueryMode = false;
            this.skillsLookup1.ReadOnly = false;
            this.skillsLookup1.RegularExpressionValidator = null;
            this.skillsLookup1.Size = new System.Drawing.Size(206, 45);
            this.skillsLookup1.TabIndex = 34;
            this.skillsLookup1.Title = "Specialisation";
            this.skillsLookup1.ToolTipLookupField = "information";
            this.skillsLookup1.ValueText = "";
            // 
            // qualificationTypesLookup1
            // 
            this.qualificationTypesLookup1.AllowsNew = false;
            this.qualificationTypesLookup1.AllowsReference = false;
            this.qualificationTypesLookup1.AllowsUpdate = false;
            this.qualificationTypesLookup1.ApplicationIdForDbConnection = null;
            this.qualificationTypesLookup1.BackColor = System.Drawing.Color.Transparent;
            this.qualificationTypesLookup1.CalledScreenApplicationId = null;
            this.qualificationTypesLookup1.CalledScreenTypeName = null;
            this.qualificationTypesLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.qualificationTypesLookup1, 2);
            this.qualificationTypesLookup1.DisplayText = "";
            this.qualificationTypesLookup1.DisplayTextBindingKey = null;
            this.qualificationTypesLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.qualificationTypesLookup1.EditingControlDataGridView = null;
            this.qualificationTypesLookup1.EditingControlFormattedValue = null;
            this.qualificationTypesLookup1.EditingControlRowIndex = 0;
            this.qualificationTypesLookup1.EditingControlValueChanged = true;
            this.qualificationTypesLookup1.EnableToolTip = false;
            this.qualificationTypesLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.qualificationTypesLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.qualificationTypesLookup1.IdText = "";
            this.qualificationTypesLookup1.IdTextBindingKey = null;
            this.qualificationTypesLookup1.Location = new System.Drawing.Point(479, 357);
            this.qualificationTypesLookup1.Lookup = true;
            this.qualificationTypesLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qualificationTypesLookup1.LookupResult = null;
            this.qualificationTypesLookup1.LookupTitle = "Qualification Types";
            this.qualificationTypesLookup1.Mandatory = false;
            this.qualificationTypesLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.qualificationTypesLookup1.MaxCharacterLength = 32767;
            this.qualificationTypesLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.qualificationTypesLookup1.MinCharactersForQuery = 0;
            this.qualificationTypesLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.qualificationTypesLookup1.Name = "qualificationTypesLookup1";
            this.qualificationTypesLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.qualificationTypesLookup1.PascalCase = false;
            this.qualificationTypesLookup1.RangeInQueryMode = false;
            this.qualificationTypesLookup1.ReadOnly = false;
            this.qualificationTypesLookup1.RegularExpressionValidator = null;
            this.qualificationTypesLookup1.Size = new System.Drawing.Size(230, 45);
            this.qualificationTypesLookup1.TabIndex = 21;
            this.qualificationTypesLookup1.Title = "Qualification Types";
            this.qualificationTypesLookup1.ToolTipLookupField = "information";
            this.qualificationTypesLookup1.ValueText = "";
            // 
            // splitSatsangCentre
            // 
            this.tlpBase.SetColumnSpan(this.splitSatsangCentre, 2);
            this.splitSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitSatsangCentre.Location = new System.Drawing.Point(478, 3);
            this.splitSatsangCentre.Name = "splitSatsangCentre";
            // 
            // splitSatsangCentre.Panel1
            // 
            this.splitSatsangCentre.Panel1.Controls.Add(this.satsangCentresListBox1);
            // 
            // splitSatsangCentre.Panel2
            // 
            this.splitSatsangCentre.Panel2.Controls.Add(this.dccTableLayoutPanel1);
            this.tlpBase.SetRowSpan(this.splitSatsangCentre, 2);
            this.splitSatsangCentre.Size = new System.Drawing.Size(232, 112);
            this.splitSatsangCentre.SplitterDistance = 77;
            this.splitSatsangCentre.TabIndex = 42;
            // 
            // satsangCentresListBox1
            // 
            this.satsangCentresListBox1.ApplicationIdForDbConnection = "CDB_APP";
            this.satsangCentresListBox1.BackColor = System.Drawing.Color.Transparent;
            this.satsangCentresListBox1.CalledScreenApplicationId = "CDB_APP";
            this.satsangCentresListBox1.CalledScreenTypeName = null;
            this.satsangCentresListBox1.CallingScreenType = null;
            this.satsangCentresListBox1.DisplayTextBindingKey = null;
            this.satsangCentresListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.satsangCentresListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.satsangCentresListBox1.IdTextBindingKey = "satsang_centres_ids_xml";
            this.satsangCentresListBox1.Location = new System.Drawing.Point(0, 0);
            this.satsangCentresListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.satsangCentresListBox1.Mandatory = false;
            this.satsangCentresListBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.satsangCentresListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.satsangCentresListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.satsangCentresListBox1.Name = "satsangCentresListBox1";
            this.satsangCentresListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.satsangCentresListBox1.ReadOnly = false;
            this.satsangCentresListBox1.Size = new System.Drawing.Size(77, 112);
            this.satsangCentresListBox1.TabIndex = 29;
            this.satsangCentresListBox1.Title = "Satsang Centre(s)";
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 1;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Controls.Add(this.txtSatsangCentreNm, 0, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.lookupArea, 0, 1);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 2;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(151, 112);
            this.dccTableLayoutPanel1.TabIndex = 0;
            // 
            // txtSatsangCentreNm
            // 
            this.txtSatsangCentreNm.AllowsNew = false;
            this.txtSatsangCentreNm.AllowsReference = false;
            this.txtSatsangCentreNm.AllowsUpdate = false;
            this.txtSatsangCentreNm.ApplicationIdForDbConnection = null;
            this.txtSatsangCentreNm.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangCentreNm.CalledScreenApplicationId = null;
            this.txtSatsangCentreNm.CalledScreenTypeName = null;
            this.txtSatsangCentreNm.CallingScreenType = null;
            this.txtSatsangCentreNm.DisplayText = "";
            this.txtSatsangCentreNm.DisplayTextBindingKey = null;
            this.txtSatsangCentreNm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentreNm.EditingControlDataGridView = null;
            this.txtSatsangCentreNm.EditingControlFormattedValue = "";
            this.txtSatsangCentreNm.EditingControlRowIndex = 0;
            this.txtSatsangCentreNm.EditingControlValueChanged = false;
            this.txtSatsangCentreNm.EnableToolTip = false;
            this.txtSatsangCentreNm.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentreNm.IdText = null;
            this.txtSatsangCentreNm.IdTextBindingKey = null;
            this.txtSatsangCentreNm.Location = new System.Drawing.Point(4, 3);
            this.txtSatsangCentreNm.Lookup = false;
            this.txtSatsangCentreNm.LookupColumns = null;
            this.txtSatsangCentreNm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentreNm.LookupResult = null;
            this.txtSatsangCentreNm.LookupTitle = "Satsang Centre";
            this.txtSatsangCentreNm.Mandatory = false;
            this.txtSatsangCentreNm.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSatsangCentreNm.MaxCharacterLength = 32767;
            this.txtSatsangCentreNm.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSatsangCentreNm.MinCharactersForQuery = 0;
            this.txtSatsangCentreNm.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSatsangCentreNm.Name = "txtSatsangCentreNm";
            this.txtSatsangCentreNm.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCentreNm.PascalCase = false;
            this.txtSatsangCentreNm.RangeInQueryMode = false;
            this.txtSatsangCentreNm.ReadOnly = true;
            this.txtSatsangCentreNm.RegularExpressionValidator = null;
            this.txtSatsangCentreNm.Size = new System.Drawing.Size(143, 45);
            this.txtSatsangCentreNm.TabIndex = 0;
            this.txtSatsangCentreNm.TabStop = false;
            this.txtSatsangCentreNm.Title = "Satsang Centre";
            this.txtSatsangCentreNm.ToolTipLookupField = "information";
            this.txtSatsangCentreNm.ValueText = null;
            // 
            // lookupArea
            // 
            this.lookupArea.AllowsNew = false;
            this.lookupArea.AllowsReference = false;
            this.lookupArea.AllowsUpdate = false;
            this.lookupArea.ApplicationIdForDbConnection = null;
            this.lookupArea.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.lookupArea.BackColor = System.Drawing.Color.Transparent;
            this.lookupArea.CalledScreenApplicationId = null;
            this.lookupArea.CalledScreenTypeName = null;
            this.lookupArea.CallingScreenType = null;
            this.lookupArea.DisplayText = "";
            this.lookupArea.DisplayTextBindingKey = null;
            this.lookupArea.EditingControlDataGridView = null;
            this.lookupArea.EditingControlFormattedValue = null;
            this.lookupArea.EditingControlRowIndex = 0;
            this.lookupArea.EditingControlValueChanged = true;
            this.lookupArea.EnableToolTip = false;
            this.lookupArea.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lookupArea.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lookupArea.IdText = "";
            this.lookupArea.IdTextBindingKey = null;
            this.lookupArea.Location = new System.Drawing.Point(4, 59);
            this.lookupArea.Lookup = true;
            this.lookupArea.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lookupArea.LookupResult = null;
            this.lookupArea.LookupTitle = "Area";
            this.lookupArea.Mandatory = false;
            this.lookupArea.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.lookupArea.MaxCharacterLength = 32767;
            this.lookupArea.MaximumSize = new System.Drawing.Size(1300, 45);
            this.lookupArea.MinCharactersForQuery = 0;
            this.lookupArea.MinimumSize = new System.Drawing.Size(10, 22);
            this.lookupArea.Name = "lookupArea";
            this.lookupArea.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lookupArea.PascalCase = false;
            this.lookupArea.RangeInQueryMode = false;
            this.lookupArea.ReadOnly = false;
            this.lookupArea.RegularExpressionValidator = null;
            this.lookupArea.ShowNonMainCentres = true;
            this.lookupArea.Size = new System.Drawing.Size(143, 38);
            this.lookupArea.TabIndex = 1;
            this.lookupArea.Title = "Area";
            this.lookupArea.ToolTipLookupField = "information";
            this.lookupArea.ValueText = "";
            this.lookupArea.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lookupArea_LookupDialogShowing);
            // 
            // sewadarListLookup1
            // 
            this.sewadarListLookup1.AllowsNew = false;
            this.sewadarListLookup1.AllowsReference = false;
            this.sewadarListLookup1.AllowsUpdate = false;
            this.sewadarListLookup1.ApplicationIdForDbConnection = null;
            this.sewadarListLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewadarListLookup1.CalledScreenApplicationId = null;
            this.sewadarListLookup1.CalledScreenTypeName = null;
            this.sewadarListLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.sewadarListLookup1, 2);
            this.sewadarListLookup1.DisplayText = "";
            this.sewadarListLookup1.DisplayTextBindingKey = null;
            this.sewadarListLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarListLookup1.EditingControlDataGridView = null;
            this.sewadarListLookup1.EditingControlFormattedValue = null;
            this.sewadarListLookup1.EditingControlRowIndex = 0;
            this.sewadarListLookup1.EditingControlValueChanged = true;
            this.sewadarListLookup1.EnableToolTip = false;
            this.sewadarListLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewadarListLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewadarListLookup1.IdText = "";
            this.sewadarListLookup1.IdTextBindingKey = null;
            this.sewadarListLookup1.Location = new System.Drawing.Point(717, 62);
            this.sewadarListLookup1.Lookup = true;
            this.sewadarListLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadarListLookup1.LookupResult = null;
            this.sewadarListLookup1.LookupTitle = "Sewadar List";
            this.sewadarListLookup1.Mandatory = false;
            this.sewadarListLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewadarListLookup1.MaxCharacterLength = 32767;
            this.sewadarListLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewadarListLookup1.MinCharactersForQuery = 0;
            this.sewadarListLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewadarListLookup1.Name = "sewadarListLookup1";
            this.sewadarListLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewadarListLookup1.PascalCase = false;
            this.sewadarListLookup1.RangeInQueryMode = false;
            this.sewadarListLookup1.ReadOnly = false;
            this.sewadarListLookup1.RegularExpressionValidator = null;
            this.sewadarListLookup1.Size = new System.Drawing.Size(242, 45);
            this.sewadarListLookup1.TabIndex = 43;
            this.sewadarListLookup1.Title = "Sewadar List";
            this.sewadarListLookup1.ToolTipLookupField = "information";
            this.sewadarListLookup1.ValueText = "";
            // 
            // tblSwdLst
            // 
            this.tblSwdLst.ColumnCount = 2;
            this.tlpBase.SetColumnSpan(this.tblSwdLst, 2);
            this.tblSwdLst.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 70.15504F));
            this.tblSwdLst.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 29.84496F));
            this.tblSwdLst.Controls.Add(this.txtSewadarListNm, 0, 0);
            this.tblSwdLst.Controls.Add(this.chkSewadarList, 1, 0);
            this.tblSwdLst.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblSwdLst.Location = new System.Drawing.Point(716, 357);
            this.tblSwdLst.Name = "tblSwdLst";
            this.tblSwdLst.RowCount = 1;
            this.tblSwdLst.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblSwdLst.Size = new System.Drawing.Size(244, 53);
            this.tblSwdLst.TabIndex = 44;
            // 
            // txtSewadarListNm
            // 
            this.txtSewadarListNm.AllowsNew = false;
            this.txtSewadarListNm.AllowsReference = false;
            this.txtSewadarListNm.AllowsUpdate = false;
            this.txtSewadarListNm.ApplicationIdForDbConnection = null;
            this.txtSewadarListNm.BackColor = System.Drawing.Color.Transparent;
            this.txtSewadarListNm.CalledScreenApplicationId = null;
            this.txtSewadarListNm.CalledScreenTypeName = null;
            this.txtSewadarListNm.CallingScreenType = null;
            this.txtSewadarListNm.DisplayText = "";
            this.txtSewadarListNm.DisplayTextBindingKey = null;
            this.txtSewadarListNm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSewadarListNm.EditingControlDataGridView = null;
            this.txtSewadarListNm.EditingControlFormattedValue = "";
            this.txtSewadarListNm.EditingControlRowIndex = 0;
            this.txtSewadarListNm.EditingControlValueChanged = false;
            this.txtSewadarListNm.EnableToolTip = false;
            this.txtSewadarListNm.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSewadarListNm.IdText = null;
            this.txtSewadarListNm.IdTextBindingKey = null;
            this.txtSewadarListNm.Location = new System.Drawing.Point(4, 3);
            this.txtSewadarListNm.Lookup = false;
            this.txtSewadarListNm.LookupColumns = null;
            this.txtSewadarListNm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSewadarListNm.LookupResult = null;
            this.txtSewadarListNm.LookupTitle = "Sewadar List";
            this.txtSewadarListNm.Mandatory = false;
            this.txtSewadarListNm.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSewadarListNm.MaxCharacterLength = 32767;
            this.txtSewadarListNm.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSewadarListNm.MinCharactersForQuery = 0;
            this.txtSewadarListNm.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSewadarListNm.Name = "txtSewadarListNm";
            this.txtSewadarListNm.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSewadarListNm.PascalCase = false;
            this.txtSewadarListNm.RangeInQueryMode = false;
            this.txtSewadarListNm.ReadOnly = false;
            this.txtSewadarListNm.RegularExpressionValidator = null;
            this.txtSewadarListNm.Size = new System.Drawing.Size(163, 45);
            this.txtSewadarListNm.TabIndex = 40;
            this.txtSewadarListNm.Title = "Sewadar List";
            this.txtSewadarListNm.ToolTipLookupField = "information";
            this.txtSewadarListNm.ValueText = null;
            // 
            // chkSewadarList
            // 
            this.chkSewadarList.AutoSize = true;
            this.chkSewadarList.BackColor = System.Drawing.Color.Transparent;
            this.chkSewadarList.BindingKey = null;
            this.chkSewadarList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkSewadarList.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkSewadarList.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkSewadarList.Location = new System.Drawing.Point(174, 3);
            this.chkSewadarList.Name = "chkSewadarList";
            this.chkSewadarList.Size = new System.Drawing.Size(67, 47);
            this.chkSewadarList.TabIndex = 41;
            this.chkSewadarList.Text = "Save Result?";
            this.chkSewadarList.UseVisualStyleBackColor = true;
            this.chkSewadarList.CheckStateChanged += new System.EventHandler(this.chkSewadarList_CheckStateChanged);
            // 
            // dtGnc1
            // 
            this.dtGnc1.AllowFutureDate = true;
            this.dtGnc1.AllowsNew = false;
            this.dtGnc1.AllowsReference = false;
            this.dtGnc1.AllowsUpdate = false;
            this.dtGnc1.ApplicationIdForDbConnection = null;
            this.dtGnc1.BackColor = System.Drawing.Color.Transparent;
            this.dtGnc1.CalledScreenApplicationId = null;
            this.dtGnc1.CalledScreenTypeName = null;
            this.dtGnc1.CallingScreenType = null;
            this.dtGnc1.DisplayText = null;
            this.dtGnc1.DisplayTextAsDateTime = null;
            this.dtGnc1.DisplayTextBindingKey = null;
            this.dtGnc1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtGnc1.EditingControlDataGridView = null;
            this.dtGnc1.EditingControlFormattedValue = null;
            this.dtGnc1.EditingControlRowIndex = 0;
            this.dtGnc1.EditingControlValueChanged = false;
            this.dtGnc1.EnableToolTip = false;
            this.dtGnc1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtGnc1.IdText = "";
            this.dtGnc1.IdTextBindingKey = null;
            this.dtGnc1.Location = new System.Drawing.Point(4, 475);
            this.dtGnc1.Lookup = true;
            this.dtGnc1.LookupColumns = null;
            this.dtGnc1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtGnc1.LookupResult = null;
            this.dtGnc1.LookupTitle = "Gnc1";
            this.dtGnc1.Mandatory = false;
            this.dtGnc1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtGnc1.MaxCharacterLength = 11;
            this.dtGnc1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtGnc1.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtGnc1.MinCharactersForQuery = 0;
            this.dtGnc1.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtGnc1.MinValue = new System.DateTime(((long)(0)));
            this.dtGnc1.Name = "dtGnc1";
            this.dtGnc1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtGnc1.PascalCase = false;
            this.dtGnc1.RangeInQueryMode = false;
            this.dtGnc1.ReadOnly = false;
            this.dtGnc1.RegularExpressionValidator = null;
            this.dtGnc1.ShowTime = false;
            this.dtGnc1.Size = new System.Drawing.Size(111, 45);
            this.dtGnc1.TabIndex = 46;
            this.dtGnc1.Title = "Gnc1";
            this.dtGnc1.ToolTipLookupField = "information";
            this.dtGnc1.ValueText = "";
            // 
            // chkRegerenrateRpt
            // 
            this.chkRegerenrateRpt.AutoSize = true;
            this.chkRegerenrateRpt.BackColor = System.Drawing.Color.Transparent;
            this.chkRegerenrateRpt.BindingKey = null;
            this.chkRegerenrateRpt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkRegerenrateRpt.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkRegerenrateRpt.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkRegerenrateRpt.Location = new System.Drawing.Point(848, 475);
            this.chkRegerenrateRpt.Name = "chkRegerenrateRpt";
            this.chkRegerenrateRpt.Size = new System.Drawing.Size(112, 57);
            this.chkRegerenrateRpt.TabIndex = 17;
            this.chkRegerenrateRpt.Text = "Regenerate Report";
            this.chkRegerenrateRpt.UseVisualStyleBackColor = true;
            // 
            // outstationSewadarCombo1
            // 
            this.outstationSewadarCombo1.ApplicationIdForDbConnection = null;
            this.outstationSewadarCombo1.BackColor = System.Drawing.Color.Transparent;
            this.outstationSewadarCombo1.DisplayText = ".......";
            this.outstationSewadarCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.outstationSewadarCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.outstationSewadarCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.outstationSewadarCombo1.Location = new System.Drawing.Point(4, 416);
            this.outstationSewadarCombo1.Mandatory = false;
            this.outstationSewadarCombo1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.outstationSewadarCombo1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.outstationSewadarCombo1.MinimumSize = new System.Drawing.Size(10, 22);
            this.outstationSewadarCombo1.Name = "outstationSewadarCombo1";
            this.outstationSewadarCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.outstationSewadarCombo1.ReadOnly = false;
            this.outstationSewadarCombo1.SelectedIndex = 0;
            this.outstationSewadarCombo1.SelectedText = ".......";
            this.outstationSewadarCombo1.SelectedValue = null;
            this.outstationSewadarCombo1.SelectedValueBindingKey = "is_outstation_sewadar";
            this.outstationSewadarCombo1.Size = new System.Drawing.Size(111, 44);
            this.outstationSewadarCombo1.TabIndex = 45;
            this.outstationSewadarCombo1.Title = "Outstation Sewadar?";
            this.outstationSewadarCombo1.ValueText = null;
            // 
            // chkEject
            // 
            this.chkEject.AutoSize = true;
            this.chkEject.BackColor = System.Drawing.Color.Transparent;
            this.chkEject.BindingKey = null;
            this.chkEject.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkEject.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkEject.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkEject.Location = new System.Drawing.Point(848, 416);
            this.chkEject.Name = "chkEject";
            this.chkEject.Size = new System.Drawing.Size(112, 53);
            this.chkEject.TabIndex = 16;
            this.chkEject.Text = "Eject";
            this.chkEject.UseVisualStyleBackColor = true;
            // 
            // genderCombo1
            // 
            this.genderCombo1.ApplicationIdForDbConnection = null;
            this.genderCombo1.BackColor = System.Drawing.Color.Transparent;
            this.genderCombo1.DisplayText = ".......";
            this.genderCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.genderCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.genderCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.genderCombo1.Location = new System.Drawing.Point(4, 121);
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
            this.genderCombo1.SelectedValueBindingKey = "gender";
            this.genderCombo1.Size = new System.Drawing.Size(111, 44);
            this.genderCombo1.TabIndex = 47;
            this.genderCombo1.Title = "Gender";
            this.genderCombo1.ValueText = null;
            // 
            // sewaShitsLookup1
            // 
            this.sewaShitsLookup1.AllowsNew = false;
            this.sewaShitsLookup1.AllowsReference = false;
            this.sewaShitsLookup1.AllowsUpdate = false;
            this.sewaShitsLookup1.ApplicationIdForDbConnection = null;
            this.sewaShitsLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewaShitsLookup1.CalledScreenApplicationId = null;
            this.sewaShitsLookup1.CalledScreenTypeName = null;
            this.sewaShitsLookup1.CallingScreenType = null;
            this.sewaShitsLookup1.DisplayText = "";
            this.sewaShitsLookup1.DisplayTextBindingKey = null;
            this.sewaShitsLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaShitsLookup1.EditingControlDataGridView = null;
            this.sewaShitsLookup1.EditingControlFormattedValue = null;
            this.sewaShitsLookup1.EditingControlRowIndex = 0;
            this.sewaShitsLookup1.EditingControlValueChanged = true;
            this.sewaShitsLookup1.EnableToolTip = false;
            this.sewaShitsLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaShitsLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaShitsLookup1.IdText = "";
            this.sewaShitsLookup1.IdTextBindingKey = null;
            this.sewaShitsLookup1.Location = new System.Drawing.Point(849, 180);
            this.sewaShitsLookup1.Lookup = true;
            this.sewaShitsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewaShitsLookup1.LookupResult = null;
            this.sewaShitsLookup1.LookupTitle = "Sewa Shift";
            this.sewaShitsLookup1.Mandatory = false;
            this.sewaShitsLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaShitsLookup1.MaxCharacterLength = 32767;
            this.sewaShitsLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaShitsLookup1.MinCharactersForQuery = 0;
            this.sewaShitsLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaShitsLookup1.Name = "sewaShitsLookup1";
            this.sewaShitsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaShitsLookup1.PascalCase = false;
            this.sewaShitsLookup1.RangeInQueryMode = false;
            this.sewaShitsLookup1.ReadOnly = false;
            this.sewaShitsLookup1.RegularExpressionValidator = null;
            this.sewaShitsLookup1.Size = new System.Drawing.Size(110, 45);
            this.sewaShitsLookup1.TabIndex = 48;
            this.sewaShitsLookup1.Title = "Sewa Shift";
            this.sewaShitsLookup1.ToolTipLookupField = "information";
            this.sewaShitsLookup1.ValueText = "";
            this.sewaShitsLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaShitsLookup1_LookupDialogShowing);
            // 
            // txtReportName
            // 
            this.txtReportName.ApplicationIdForDbConnection = null;
            this.txtReportName.BackColor = System.Drawing.Color.Transparent;
            this.tlpBase.SetColumnSpan(this.txtReportName, 4);
            this.txtReportName.DisplayText = "";
            this.txtReportName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtReportName.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.txtReportName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtReportName.Location = new System.Drawing.Point(4, 3);
            this.txtReportName.Mandatory = false;
            this.txtReportName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtReportName.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtReportName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtReportName.Name = "txtReportName";
            this.txtReportName.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtReportName.ReadOnly = false;
            this.txtReportName.SelectedIndex = -1;
            this.txtReportName.SelectedItem = null;
            this.txtReportName.SelectedText = "";
            this.txtReportName.SelectedValue = null;
            this.txtReportName.SelectedValueBindingKey = "report_nm";
            this.txtReportName.Size = new System.Drawing.Size(467, 44);
            this.txtReportName.TabIndex = 49;
            this.txtReportName.Title = "Report Name";
            this.txtReportName.ValueText = null;
            this.txtReportName.SelectedValueChanged += new System.EventHandler<System.EventArgs>(this.txtReportName_SelectedValueChanged);
            // 
            // badgeTemplateCombo1
            // 
            this.badgeTemplateCombo1.ApplicationIdForDbConnection = null;
            this.badgeTemplateCombo1.BackColor = System.Drawing.Color.Transparent;
            this.tlpBase.SetColumnSpan(this.badgeTemplateCombo1, 2);
            this.badgeTemplateCombo1.DisplayText = "";
            this.badgeTemplateCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.badgeTemplateCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.badgeTemplateCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.badgeTemplateCombo1.isGlobal = false;
            this.badgeTemplateCombo1.Location = new System.Drawing.Point(479, 121);
            this.badgeTemplateCombo1.Mandatory = false;
            this.badgeTemplateCombo1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.badgeTemplateCombo1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.badgeTemplateCombo1.MinimumSize = new System.Drawing.Size(10, 22);
            this.badgeTemplateCombo1.Name = "badgeTemplateCombo1";
            this.badgeTemplateCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.badgeTemplateCombo1.ReadOnly = false;
            this.badgeTemplateCombo1.SelectedIndex = -1;
            this.badgeTemplateCombo1.SelectedItem = null;
            this.badgeTemplateCombo1.SelectedText = "";
            this.badgeTemplateCombo1.SelectedValue = null;
            this.badgeTemplateCombo1.SelectedValueBindingKey = "badge_template_id";
            this.badgeTemplateCombo1.Size = new System.Drawing.Size(230, 44);
            this.badgeTemplateCombo1.TabIndex = 50;
            this.badgeTemplateCombo1.Title = "Badge Template";
            this.badgeTemplateCombo1.ValueText = null;
            // 
            // cmbRemarksType
            // 
            this.cmbRemarksType.ApplicationIdForDbConnection = null;
            this.cmbRemarksType.BackColor = System.Drawing.Color.Transparent;
            this.cmbRemarksType.DisplayText = "";
            this.cmbRemarksType.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbRemarksType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbRemarksType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbRemarksType.Location = new System.Drawing.Point(716, 415);
            this.cmbRemarksType.Mandatory = false;
            this.cmbRemarksType.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cmbRemarksType.MaximumSize = new System.Drawing.Size(975, 36);
            this.cmbRemarksType.MinimumSize = new System.Drawing.Size(8, 18);
            this.cmbRemarksType.Name = "cmbRemarksType";
            this.cmbRemarksType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbRemarksType.ReadOnly = false;
            this.cmbRemarksType.SelectedIndex = -1;
            this.cmbRemarksType.SelectedItem = null;
            this.cmbRemarksType.SelectedText = "";
            this.cmbRemarksType.SelectedValue = null;
            this.cmbRemarksType.SelectedValueBindingKey = null;
            this.cmbRemarksType.Size = new System.Drawing.Size(126, 36);
            this.cmbRemarksType.TabIndex = 51;
            this.cmbRemarksType.Title = "Remarks Type";
            this.cmbRemarksType.ValueText = null;
            // 
            // cmbSewadarType
            // 
            this.cmbSewadarType.ApplicationIdForDbConnection = null;
            this.cmbSewadarType.BackColor = System.Drawing.Color.Transparent;
            this.cmbSewadarType.DisplayText = "";
            this.cmbSewadarType.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbSewadarType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSewadarType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSewadarType.Location = new System.Drawing.Point(122, 120);
            this.cmbSewadarType.Mandatory = false;
            this.cmbSewadarType.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cmbSewadarType.MaximumSize = new System.Drawing.Size(975, 36);
            this.cmbSewadarType.MinimumSize = new System.Drawing.Size(8, 18);
            this.cmbSewadarType.Name = "cmbSewadarType";
            this.cmbSewadarType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbSewadarType.ReadOnly = false;
            this.cmbSewadarType.SelectedIndex = -1;
            this.cmbSewadarType.SelectedItem = null;
            this.cmbSewadarType.SelectedText = "";
            this.cmbSewadarType.SelectedValue = null;
            this.cmbSewadarType.SelectedValueBindingKey = "";
            this.cmbSewadarType.Size = new System.Drawing.Size(136, 36);
            this.cmbSewadarType.TabIndex = 52;
            this.cmbSewadarType.Title = "Sewadar Type";
            this.cmbSewadarType.ValueText = null;
            // 
            // GenericReports
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(963, 535);
            this.Controls.Add(this.tlpBase);
            this.Name = "GenericReports";
            this.Text = "Generic Reports";
            this.ChildClosing += new System.EventHandler<DCC.UMB.CDF.UIControls.Windows.ChildClosingEventArgs>(this.GenericReports_ChildClosing);
            this.tlpBase.ResumeLayout(false);
            this.tlpBase.PerformLayout();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.tblDept.ResumeLayout(false);
            this.splitSatsangCentre.Panel1.ResumeLayout(false);
            this.splitSatsangCentre.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitSatsangCentre)).EndInit();
            this.splitSatsangCentre.ResumeLayout(false);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.tblSwdLst.ResumeLayout(false);
            this.tblSwdLst.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkSummarised;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intSessionId;
        private DCC.UMB.CDF.UIControls.TextControls.DateRangePair dateRangePair1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtGnc2;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intCount1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intCount2;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkGncBoolean;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkEject;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkRegerenrateRpt;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup sewaLookup1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.QualificationTypesLookup qualificationTypesLookup1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.WeeklySewaLocationLookup weeklySewaLocationLookup1;
        private DCC.ZOS.ZSM.Controls.Misc.DepartmentChooser departmentChooser1;
        private DCC.UMB.CDBControls.Lists.CountriesListBox countriesListBox1;
        private DCC.UMB.CDBControls.Lists.StatesListBox statesListBox1;
        private DCC.UMB.CDBControls.Lists.DistrictOrCitiesListBox districtOrCitiesListBox1;
        private DCC.UMB.CDBControls.Lists.SatsangCentresListBox satsangCentresListBox1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.CreditSpecificationsLookup creditSpecificationsLookup1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.AttributesLookup attributesLookup1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup sewaTeamsLookup1;
        private DCC.ZOS.ZSM.Controls.Lists.PostOfficeOrCityListBox postOfficeOrCityListBox1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SkillsLookup skillsLookup1;
        private DCC.ZOS.ZSM.Controls.Lists.StatusListBox statusListBox1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtReportFooter;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private DCC.ZOS.ZSM.Controls.Lists.DepartmentListBox departmentListBox1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSewadarListNm;
        private System.Windows.Forms.SplitContainer splitSatsangCentre;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentreNm;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tblDept;
        private DCC.ZOS.ZSM.Controls.Lists.SubDepartmentListBox subDepartmentListBox1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup sewadarListLookup1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tblSwdLst;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkSewadarList;
        private DCC.ZOS.ZSM.Controls.DropDown.OutstationSewadarCombo outstationSewadarCombo1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtGnc1;
        private DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo genderCombo1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaShitsLookup sewaShitsLookup1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCComboBox txtReportName;
        private DCC.ZOS.ZSM.Controls.Combos.BadgeTemplateCombo badgeTemplateCombo1;
        private UMB.CDF.UIControls.TextControls.DCCComboBox cmbRemarksType;
        private UMB.CDF.UIControls.TextControls.DCCComboBox cmbSewadarType;
        private Controls.ZSMLookups.ZSMSatsangCentresLookup lookupArea;

    }
}