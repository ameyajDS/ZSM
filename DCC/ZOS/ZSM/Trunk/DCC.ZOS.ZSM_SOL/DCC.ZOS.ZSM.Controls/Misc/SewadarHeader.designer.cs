namespace DCC.ZOS.ZSM.Controls.Misc
{
    partial class SewadarHeader
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SewadarHeader));
            this.txtSubDepartment = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtDepartmentName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtmSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtDepJoiningDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.txtSatsangCentre = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intAge = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtName = new DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarLookup();
            this.cmbGender = new DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo();
            this.intSewadarId = new DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarIDLookup();
            this.txtGRNo = new DCC.ZOS.ZSM.Controls.ZSMLookups.GRNoLookup();
            this.tlpTop.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtSubDepartment
            // 
            this.txtSubDepartment.AllowsNew = false;
            this.txtSubDepartment.AllowsReference = false;
            this.txtSubDepartment.AllowsUpdate = false;
            this.txtSubDepartment.ApplicationIdForDbConnection = null;
            this.txtSubDepartment.BackColor = System.Drawing.Color.Transparent;
            this.txtSubDepartment.CalledScreenApplicationId = null;
            this.txtSubDepartment.CalledScreenTypeName = null;
            this.txtSubDepartment.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.txtSubDepartment, 3);
            this.txtSubDepartment.DisplayText = "";
            this.txtSubDepartment.DisplayTextBindingKey = "sub_department_nm";
            this.txtSubDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSubDepartment.EditingControlDataGridView = null;
            this.txtSubDepartment.EditingControlFormattedValue = "";
            this.txtSubDepartment.EditingControlRowIndex = 0;
            this.txtSubDepartment.EditingControlValueChanged = false;
            this.txtSubDepartment.EnableToolTip = false;
            this.txtSubDepartment.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSubDepartment.IdText = null;
            this.txtSubDepartment.IdTextBindingKey = null;
            this.txtSubDepartment.Location = new System.Drawing.Point(532, 75);
            this.txtSubDepartment.Lookup = false;
            this.txtSubDepartment.LookupColumns = null;
            this.txtSubDepartment.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSubDepartment.LookupResult = null;
            this.txtSubDepartment.LookupTitle = "Sub Department";
            this.txtSubDepartment.Mandatory = false;
            this.txtSubDepartment.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSubDepartment.MaxCharacterLength = 32767;
            this.txtSubDepartment.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSubDepartment.MinCharactersForQuery = 0;
            this.txtSubDepartment.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSubDepartment.Name = "txtSubDepartment";
            this.txtSubDepartment.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSubDepartment.PascalCase = false;
            this.txtSubDepartment.RangeInQueryMode = false;
            this.txtSubDepartment.ReadOnly = true;
            this.txtSubDepartment.RegularExpressionValidator = null;
            this.txtSubDepartment.Size = new System.Drawing.Size(159, 45);
            this.txtSubDepartment.TabIndex = 55;
            this.txtSubDepartment.TabStop = false;
            this.txtSubDepartment.Title = "Sub Department";
            this.txtSubDepartment.ToolTipLookupField = "information";
            this.txtSubDepartment.ValueText = null;
            // 
            // txtDepartmentName
            // 
            this.txtDepartmentName.AllowsNew = false;
            this.txtDepartmentName.AllowsReference = false;
            this.txtDepartmentName.AllowsUpdate = false;
            this.txtDepartmentName.ApplicationIdForDbConnection = null;
            this.txtDepartmentName.BackColor = System.Drawing.Color.Transparent;
            this.txtDepartmentName.CalledScreenApplicationId = null;
            this.txtDepartmentName.CalledScreenTypeName = null;
            this.txtDepartmentName.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.txtDepartmentName, 4);
            this.txtDepartmentName.DisplayText = "";
            this.txtDepartmentName.DisplayTextBindingKey = "department_nm";
            this.txtDepartmentName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDepartmentName.EditingControlDataGridView = null;
            this.txtDepartmentName.EditingControlFormattedValue = "";
            this.txtDepartmentName.EditingControlRowIndex = 0;
            this.txtDepartmentName.EditingControlValueChanged = false;
            this.txtDepartmentName.EnableToolTip = false;
            this.txtDepartmentName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDepartmentName.IdText = null;
            this.txtDepartmentName.IdTextBindingKey = null;
            this.txtDepartmentName.Location = new System.Drawing.Point(315, 75);
            this.txtDepartmentName.Lookup = false;
            this.txtDepartmentName.LookupColumns = null;
            this.txtDepartmentName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtDepartmentName.LookupResult = null;
            this.txtDepartmentName.LookupTitle = "Department";
            this.txtDepartmentName.Mandatory = false;
            this.txtDepartmentName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtDepartmentName.MaxCharacterLength = 32767;
            this.txtDepartmentName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtDepartmentName.MinCharactersForQuery = 0;
            this.txtDepartmentName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtDepartmentName.Name = "txtDepartmentName";
            this.txtDepartmentName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtDepartmentName.PascalCase = false;
            this.txtDepartmentName.RangeInQueryMode = false;
            this.txtDepartmentName.ReadOnly = true;
            this.txtDepartmentName.RegularExpressionValidator = null;
            this.txtDepartmentName.Size = new System.Drawing.Size(209, 45);
            this.txtDepartmentName.TabIndex = 54;
            this.txtDepartmentName.TabStop = false;
            this.txtDepartmentName.Title = "Department";
            this.txtDepartmentName.ToolTipLookupField = "information";
            this.txtDepartmentName.ValueText = null;
            // 
            // dtmSewadarStatus
            // 
            this.dtmSewadarStatus.AllowFutureDate = true;
            this.dtmSewadarStatus.AllowsNew = false;
            this.dtmSewadarStatus.AllowsReference = false;
            this.dtmSewadarStatus.AllowsUpdate = false;
            this.dtmSewadarStatus.ApplicationIdForDbConnection = null;
            this.dtmSewadarStatus.BackColor = System.Drawing.Color.Transparent;
            this.dtmSewadarStatus.CalledScreenApplicationId = null;
            this.dtmSewadarStatus.CalledScreenTypeName = null;
            this.dtmSewadarStatus.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.dtmSewadarStatus, 3);
            this.dtmSewadarStatus.DisplayText = null;
            this.dtmSewadarStatus.DisplayTextAsDateTime = null;
            this.dtmSewadarStatus.DisplayTextBindingKey = "sewadar_status_dtm";
            this.dtmSewadarStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmSewadarStatus.EditingControlDataGridView = null;
            this.dtmSewadarStatus.EditingControlFormattedValue = null;
            this.dtmSewadarStatus.EditingControlRowIndex = 0;
            this.dtmSewadarStatus.EditingControlValueChanged = false;
            this.dtmSewadarStatus.EnableToolTip = false;
            this.dtmSewadarStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtmSewadarStatus.IdText = "";
            this.dtmSewadarStatus.IdTextBindingKey = null;
            this.dtmSewadarStatus.Location = new System.Drawing.Point(143, 75);
            this.dtmSewadarStatus.Lookup = true;
            this.dtmSewadarStatus.LookupColumns = null;
            this.dtmSewadarStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtmSewadarStatus.LookupResult = null;
            this.dtmSewadarStatus.LookupTitle = "Status Date";
            this.dtmSewadarStatus.Mandatory = false;
            this.dtmSewadarStatus.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtmSewadarStatus.MaxCharacterLength = 20;
            this.dtmSewadarStatus.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtmSewadarStatus.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtmSewadarStatus.MinCharactersForQuery = 0;
            this.dtmSewadarStatus.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtmSewadarStatus.MinValue = new System.DateTime(((long)(0)));
            this.dtmSewadarStatus.Name = "dtmSewadarStatus";
            this.dtmSewadarStatus.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtmSewadarStatus.PascalCase = false;
            this.dtmSewadarStatus.RangeInQueryMode = true;
            this.dtmSewadarStatus.ReadOnly = true;
            this.dtmSewadarStatus.RegularExpressionValidator = null;
            this.dtmSewadarStatus.ShowTime = true;
            this.dtmSewadarStatus.Size = new System.Drawing.Size(164, 45);
            this.dtmSewadarStatus.TabIndex = 46;
            this.dtmSewadarStatus.TabStop = false;
            this.dtmSewadarStatus.Title = "Status Date";
            this.dtmSewadarStatus.ToolTipLookupField = "information";
            this.dtmSewadarStatus.ValueText = "";
            // 
            // dtDepJoiningDate
            // 
            this.dtDepJoiningDate.AllowFutureDate = true;
            this.dtDepJoiningDate.AllowsNew = false;
            this.dtDepJoiningDate.AllowsReference = false;
            this.dtDepJoiningDate.AllowsUpdate = false;
            this.dtDepJoiningDate.ApplicationIdForDbConnection = null;
            this.dtDepJoiningDate.BackColor = System.Drawing.Color.Transparent;
            this.dtDepJoiningDate.CalledScreenApplicationId = null;
            this.dtDepJoiningDate.CalledScreenTypeName = null;
            this.dtDepJoiningDate.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.dtDepJoiningDate, 2);
            this.dtDepJoiningDate.DisplayText = null;
            this.dtDepJoiningDate.DisplayTextAsDateTime = null;
            this.dtDepJoiningDate.DisplayTextBindingKey = "department_dt";
            this.dtDepJoiningDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtDepJoiningDate.EditingControlDataGridView = null;
            this.dtDepJoiningDate.EditingControlFormattedValue = null;
            this.dtDepJoiningDate.EditingControlRowIndex = 0;
            this.dtDepJoiningDate.EditingControlValueChanged = false;
            this.dtDepJoiningDate.EnableToolTip = false;
            this.dtDepJoiningDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtDepJoiningDate.IdText = "";
            this.dtDepJoiningDate.IdTextBindingKey = null;
            this.dtDepJoiningDate.Location = new System.Drawing.Point(699, 75);
            this.dtDepJoiningDate.Lookup = true;
            this.dtDepJoiningDate.LookupColumns = null;
            this.dtDepJoiningDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtDepJoiningDate.LookupResult = null;
            this.dtDepJoiningDate.LookupTitle = "Dept. Joining Date";
            this.dtDepJoiningDate.Mandatory = false;
            this.dtDepJoiningDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtDepJoiningDate.MaxCharacterLength = 11;
            this.dtDepJoiningDate.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtDepJoiningDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtDepJoiningDate.MinCharactersForQuery = 0;
            this.dtDepJoiningDate.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtDepJoiningDate.MinValue = new System.DateTime(((long)(0)));
            this.dtDepJoiningDate.Name = "dtDepJoiningDate";
            this.dtDepJoiningDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtDepJoiningDate.PascalCase = false;
            this.dtDepJoiningDate.RangeInQueryMode = true;
            this.dtDepJoiningDate.ReadOnly = true;
            this.dtDepJoiningDate.RegularExpressionValidator = null;
            this.dtDepJoiningDate.ShowTime = false;
            this.dtDepJoiningDate.Size = new System.Drawing.Size(198, 45);
            this.dtDepJoiningDate.TabIndex = 49;
            this.dtDepJoiningDate.TabStop = false;
            this.dtDepJoiningDate.Title = "Dept. Joining Date";
            this.dtDepJoiningDate.ToolTipLookupField = "information";
            this.dtDepJoiningDate.ValueText = "";
            // 
            // txtSatsangCentre
            // 
            this.txtSatsangCentre.AllowsNew = false;
            this.txtSatsangCentre.AllowsReference = false;
            this.txtSatsangCentre.AllowsUpdate = false;
            this.txtSatsangCentre.ApplicationIdForDbConnection = null;
            this.txtSatsangCentre.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangCentre.CalledScreenApplicationId = null;
            this.txtSatsangCentre.CalledScreenTypeName = null;
            this.txtSatsangCentre.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.txtSatsangCentre, 6);
            this.txtSatsangCentre.DisplayText = "";
            this.txtSatsangCentre.DisplayTextBindingKey = "centre_nm";
            this.txtSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentre.EditingControlDataGridView = null;
            this.txtSatsangCentre.EditingControlFormattedValue = "";
            this.txtSatsangCentre.EditingControlRowIndex = 0;
            this.txtSatsangCentre.EditingControlValueChanged = false;
            this.txtSatsangCentre.EnableToolTip = false;
            this.txtSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentre.IdText = null;
            this.txtSatsangCentre.IdTextBindingKey = "";
            this.txtSatsangCentre.Location = new System.Drawing.Point(4, 3);
            this.txtSatsangCentre.Lookup = false;
            this.txtSatsangCentre.LookupColumns = resources.GetString("txtSatsangCentre.LookupColumns");
            this.txtSatsangCentre.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentre.LookupResult = null;
            this.txtSatsangCentre.LookupTitle = "Satsang Centre";
            this.txtSatsangCentre.Mandatory = false;
            this.txtSatsangCentre.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSatsangCentre.MaxCharacterLength = 32767;
            this.txtSatsangCentre.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSatsangCentre.MinCharactersForQuery = 0;
            this.txtSatsangCentre.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSatsangCentre.Name = "txtSatsangCentre";
            this.txtSatsangCentre.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCentre.PascalCase = false;
            this.txtSatsangCentre.RangeInQueryMode = false;
            this.txtSatsangCentre.ReadOnly = true;
            this.txtSatsangCentre.RegularExpressionValidator = null;
            this.txtSatsangCentre.Size = new System.Drawing.Size(189, 45);
            this.txtSatsangCentre.TabIndex = 26;
            this.txtSatsangCentre.TabStop = false;
            this.txtSatsangCentre.Title = "Satsang Centre";
            this.txtSatsangCentre.ToolTipLookupField = "information";
            this.txtSatsangCentre.ValueText = null;
            this.txtSatsangCentre.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.txtSatsangCentre_LookupResultSet);
            // 
            // intAge
            // 
            this.intAge.AllowsNew = false;
            this.intAge.AllowsReference = false;
            this.intAge.AllowsUpdate = false;
            this.intAge.ApplicationIdForDbConnection = null;
            this.intAge.BackColor = System.Drawing.Color.Transparent;
            this.intAge.CalledScreenApplicationId = null;
            this.intAge.CalledScreenTypeName = null;
            this.intAge.CallingScreenType = null;
            this.intAge.DisplayText = "";
            this.intAge.DisplayTextBindingKey = "age";
            this.intAge.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intAge.EditingControlDataGridView = null;
            this.intAge.EditingControlFormattedValue = "";
            this.intAge.EditingControlRowIndex = 0;
            this.intAge.EditingControlValueChanged = false;
            this.intAge.EnableToolTip = false;
            this.intAge.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intAge.IdText = null;
            this.intAge.IdTextBindingKey = null;
            this.intAge.Location = new System.Drawing.Point(627, 3);
            this.intAge.Lookup = false;
            this.intAge.LookupColumns = null;
            this.intAge.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intAge.LookupResult = null;
            this.intAge.LookupTitle = "Age(Yrs)";
            this.intAge.Mandatory = false;
            this.intAge.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intAge.MaxCharacterLength = 3;
            this.intAge.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intAge.MaxValue = ((long)(9223372036854775807));
            this.intAge.MinCharactersForQuery = 0;
            this.intAge.MinimumSize = new System.Drawing.Size(10, 22);
            this.intAge.MinValue = ((long)(-9223372036854775808));
            this.intAge.Name = "intAge";
            this.intAge.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intAge.PascalCase = false;
            this.intAge.RangeInQueryMode = true;
            this.intAge.ReadOnly = true;
            this.intAge.RegularExpressionValidator = "";
            this.intAge.Size = new System.Drawing.Size(64, 45);
            this.intAge.TabIndex = 4;
            this.intAge.TabStop = false;
            this.intAge.Title = "Age(Yrs)";
            this.intAge.ToolTipLookupField = "information";
            this.intAge.ValueText = null;
            // 
            // txtSewadarStatus
            // 
            this.txtSewadarStatus.AllowsNew = false;
            this.txtSewadarStatus.AllowsReference = false;
            this.txtSewadarStatus.AllowsUpdate = false;
            this.txtSewadarStatus.ApplicationIdForDbConnection = null;
            this.txtSewadarStatus.BackColor = System.Drawing.Color.Transparent;
            this.txtSewadarStatus.CalledScreenApplicationId = null;
            this.txtSewadarStatus.CalledScreenTypeName = null;
            this.txtSewadarStatus.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.txtSewadarStatus, 4);
            this.txtSewadarStatus.DisplayText = "";
            this.txtSewadarStatus.DisplayTextBindingKey = "sewadar_status_nm";
            this.txtSewadarStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSewadarStatus.EditingControlDataGridView = null;
            this.txtSewadarStatus.EditingControlFormattedValue = "";
            this.txtSewadarStatus.EditingControlRowIndex = 0;
            this.txtSewadarStatus.EditingControlValueChanged = false;
            this.txtSewadarStatus.EnableToolTip = false;
            this.txtSewadarStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSewadarStatus.IdText = null;
            this.txtSewadarStatus.IdTextBindingKey = null;
            this.txtSewadarStatus.Location = new System.Drawing.Point(4, 75);
            this.txtSewadarStatus.Lookup = false;
            this.txtSewadarStatus.LookupColumns = null;
            this.txtSewadarStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSewadarStatus.LookupResult = null;
            this.txtSewadarStatus.LookupTitle = "Status";
            this.txtSewadarStatus.Mandatory = false;
            this.txtSewadarStatus.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSewadarStatus.MaxCharacterLength = 32767;
            this.txtSewadarStatus.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSewadarStatus.MinCharactersForQuery = 0;
            this.txtSewadarStatus.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSewadarStatus.Name = "txtSewadarStatus";
            this.txtSewadarStatus.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSewadarStatus.PascalCase = false;
            this.txtSewadarStatus.RangeInQueryMode = false;
            this.txtSewadarStatus.ReadOnly = true;
            this.txtSewadarStatus.RegularExpressionValidator = null;
            this.txtSewadarStatus.Size = new System.Drawing.Size(131, 45);
            this.txtSewadarStatus.TabIndex = 45;
            this.txtSewadarStatus.TabStop = false;
            this.txtSewadarStatus.Title = "Status";
            this.txtSewadarStatus.ToolTipLookupField = "information";
            this.txtSewadarStatus.ValueText = null;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 16;
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.473514F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4.347939F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.440622F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 2.219756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4.439512F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 1.99778F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.65261F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.329634F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4.772475F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.45262F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.54495F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4.883463F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.660378F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.991121F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.43285F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.31964F));
            this.tlpTop.Controls.Add(this.txtSewadarStatus, 0, 1);
            this.tlpTop.Controls.Add(this.intAge, 13, 0);
            this.tlpTop.Controls.Add(this.txtSatsangCentre, 0, 0);
            this.tlpTop.Controls.Add(this.txtName, 7, 0);
            this.tlpTop.Controls.Add(this.dtDepJoiningDate, 14, 1);
            this.tlpTop.Controls.Add(this.dtmSewadarStatus, 4, 1);
            this.tlpTop.Controls.Add(this.cmbGender, 14, 0);
            this.tlpTop.Controls.Add(this.intSewadarId, 15, 0);
            this.tlpTop.Controls.Add(this.txtGRNo, 5, 0);
            this.tlpTop.Controls.Add(this.txtDepartmentName, 7, 1);
            this.tlpTop.Controls.Add(this.txtSubDepartment, 10, 1);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(0, 0);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 2;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 49.73662F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.26338F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.Size = new System.Drawing.Size(901, 145);
            this.tlpTop.TabIndex = 1;
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
            this.tlpTop.SetColumnSpan(this.txtName, 6);
            this.txtName.DisplayText = "";
            this.txtName.DisplayTextBindingKey = "full_nm";
            this.txtName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtName.EditingControlDataGridView = null;
            this.txtName.EditingControlFormattedValue = null;
            this.txtName.EditingControlRowIndex = 0;
            this.txtName.EditingControlValueChanged = true;
            this.txtName.EnableToolTip = false;
            this.txtName.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.txtName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.IdText = "";
            this.txtName.IdTextBindingKey = "sewadar_id";
            this.txtName.Location = new System.Drawing.Point(315, 3);
            this.txtName.Lookup = true;
            this.txtName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.txtName.LookupResult = null;
            this.txtName.LookupTitle = "Name";
            this.txtName.Mandatory = true;
            this.txtName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtName.MaxCharacterLength = 32767;
            this.txtName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtName.MinCharactersForQuery = 0;
            this.txtName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtName.Name = "txtName";
            this.txtName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtName.PascalCase = false;
            this.txtName.RangeInQueryMode = false;
            this.txtName.ReadOnly = false;
            this.txtName.RegularExpressionValidator = null;
            this.txtName.Size = new System.Drawing.Size(304, 45);
            this.txtName.SttsCode = null;
            this.txtName.TabIndex = 2;
            this.txtName.Title = "Name";
            this.txtName.ToolTipLookupField = "information";
            this.txtName.ValueText = "";
            this.txtName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.txtName_LookupDialogShowing);
            this.txtName.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.txtName_LookupResultSet);
            this.txtName.FocusLost += new System.EventHandler<System.EventArgs>(this.txtName_FocusLost);
            // 
            // cmbGender
            // 
            this.cmbGender.ApplicationIdForDbConnection = null;
            this.cmbGender.BackColor = System.Drawing.Color.Transparent;
            this.cmbGender.DisplayText = ".......";
            this.cmbGender.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbGender.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbGender.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbGender.Location = new System.Drawing.Point(699, 3);
            this.cmbGender.Mandatory = false;
            this.cmbGender.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbGender.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbGender.MinimumSize = new System.Drawing.Size(10, 22);
            this.cmbGender.Name = "cmbGender";
            this.cmbGender.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbGender.ReadOnly = true;
            this.cmbGender.SelectedIndex = 0;
            this.cmbGender.SelectedText = ".......";
            this.cmbGender.SelectedValue = null;
            this.cmbGender.SelectedValueBindingKey = "gender";
            this.cmbGender.Size = new System.Drawing.Size(86, 44);
            this.cmbGender.TabIndex = 50;
            this.cmbGender.TabStop = false;
            this.cmbGender.Title = "Gender";
            this.cmbGender.ValueText = null;
            // 
            // intSewadarId
            // 
            this.intSewadarId.AllowsNew = false;
            this.intSewadarId.AllowsReference = false;
            this.intSewadarId.AllowsUpdate = false;
            this.intSewadarId.ApplicationIdForDbConnection = null;
            this.intSewadarId.BackColor = System.Drawing.Color.Transparent;
            this.intSewadarId.CalledScreenApplicationId = null;
            this.intSewadarId.CalledScreenTypeName = null;
            this.intSewadarId.CallingScreenType = null;
            this.intSewadarId.DisplayText = "";
            this.intSewadarId.DisplayTextBindingKey = "sewadar_id";
            this.intSewadarId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intSewadarId.EditingControlDataGridView = null;
            this.intSewadarId.EditingControlFormattedValue = null;
            this.intSewadarId.EditingControlRowIndex = 0;
            this.intSewadarId.EditingControlValueChanged = true;
            this.intSewadarId.EnableToolTip = false;
            this.intSewadarId.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.intSewadarId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSewadarId.IdText = "";
            this.intSewadarId.IdTextBindingKey = "sewadar_id";
            this.intSewadarId.Location = new System.Drawing.Point(793, 3);
            this.intSewadarId.Lookup = true;
            this.intSewadarId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.intSewadarId.LookupResult = null;
            this.intSewadarId.LookupTitle = "Sewadar ID";
            this.intSewadarId.Mandatory = true;
            this.intSewadarId.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intSewadarId.MaxCharacterLength = 32767;
            this.intSewadarId.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intSewadarId.MinCharactersForQuery = 0;
            this.intSewadarId.MinimumSize = new System.Drawing.Size(10, 22);
            this.intSewadarId.Name = "intSewadarId";
            this.intSewadarId.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.intSewadarId.PascalCase = false;
            this.intSewadarId.RangeInQueryMode = false;
            this.intSewadarId.ReadOnly = false;
            this.intSewadarId.RegularExpressionValidator = null;
            this.intSewadarId.Size = new System.Drawing.Size(104, 45);
            this.intSewadarId.SttsCode = null;
            this.intSewadarId.TabIndex = 3;
            this.intSewadarId.Title = "Sewadar ID";
            this.intSewadarId.ToolTipLookupField = "information";
            this.intSewadarId.ValueText = "";
            this.intSewadarId.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.intSewadarId_LookupDialogShowing);
            this.intSewadarId.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.intSewadarId_LookupResultSet);
            this.intSewadarId.FocusLost += new System.EventHandler<System.EventArgs>(this.intSewadarId_FocusLost);
            // 
            // txtGRNo
            // 
            this.txtGRNo.AllowsNew = false;
            this.txtGRNo.AllowsReference = false;
            this.txtGRNo.AllowsUpdate = false;
            this.txtGRNo.ApplicationIdForDbConnection = null;
            this.txtGRNo.BackColor = System.Drawing.Color.Transparent;
            this.txtGRNo.CalledScreenApplicationId = null;
            this.txtGRNo.CalledScreenTypeName = null;
            this.txtGRNo.CallingScreenType = null;
            this.txtGRNo.DisplayText = "";
            this.txtGRNo.DisplayTextBindingKey = "sewadar_grno";
            this.txtGRNo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtGRNo.EditingControlDataGridView = null;
            this.txtGRNo.EditingControlFormattedValue = null;
            this.txtGRNo.EditingControlRowIndex = 0;
            this.txtGRNo.EditingControlValueChanged = true;
            this.txtGRNo.EnableToolTip = false;
            this.txtGRNo.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.txtGRNo.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGRNo.IdText = "";
            this.txtGRNo.IdTextBindingKey = "sewadar_grno";
            this.txtGRNo.Location = new System.Drawing.Point(201, 3);
            this.txtGRNo.Lookup = true;
            this.txtGRNo.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.txtGRNo.LookupResult = null;
            this.txtGRNo.LookupTitle = "GR No.";
            this.txtGRNo.Mandatory = true;
            this.txtGRNo.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtGRNo.MaxCharacterLength = 32767;
            this.txtGRNo.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtGRNo.MinCharactersForQuery = 0;
            this.txtGRNo.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtGRNo.Name = "txtGRNo";
            this.txtGRNo.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtGRNo.PascalCase = false;
            this.txtGRNo.RangeInQueryMode = false;
            this.txtGRNo.ReadOnly = false;
            this.txtGRNo.RegularExpressionValidator = null;
            this.txtGRNo.Size = new System.Drawing.Size(106, 45);
            this.txtGRNo.SttsCode = null;
            this.txtGRNo.TabIndex = 1;
            this.txtGRNo.Title = "GR No.";
            this.txtGRNo.ToolTipLookupField = "information";
            this.txtGRNo.ValueText = "";
            this.txtGRNo.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.txtGRNo_LookupDialogShowing);
            this.txtGRNo.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.txtGRNo_LookupResultSet);
            this.txtGRNo.FocusLost += new System.EventHandler<System.EventArgs>(this.txtGRNo_FocusLost);
            // 
            // SewadarHeader
            // 
            this.Controls.Add(this.tlpTop);
            this.Name = "SewadarHeader";
            this.Size = new System.Drawing.Size(901, 145);
            this.Load += new System.EventHandler(this.SewadarHeader_Load);
            this.tlpTop.ResumeLayout(false);
            this.ResumeLayout(false);

        }
        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSewadarStatus;
        public DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intAge;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentre;
        public DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarLookup txtName;
        public DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtDepJoiningDate;
        public DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtmSewadarStatus;
        public DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo cmbGender;
        public DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarIDLookup intSewadarId;
        public DCC.ZOS.ZSM.Controls.ZSMLookups.GRNoLookup txtGRNo;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtDepartmentName;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSubDepartment;

    }
}