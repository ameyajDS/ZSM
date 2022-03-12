namespace DCC.ZOS.ZSM.ACT
{
    partial class Sewadars
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Sewadars));
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle13 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle14 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.intSewadarId = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtFirstName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtMiddleName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtSurName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.chkMarried = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.intAge = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.sewadarStatusCombo1 = new DCC.ZOS.ZSM.Controls.Combos.SewadarStatusCombo();
            this.dtInitiation = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.initiationPlacesLookup1 = new DCC.UMB.CDBLookups.InitiationPlacesLookup();
            this.patronCombo1 = new DCC.UMB.CDBControls.DropDown.PatronCombo();
            this.txtSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtmSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.txtCurrentDepartment = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtDepJoiningDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtAppDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.grdRemarks = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.remarks_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn();
            this.remarks_sq = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txtGRNo = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtGlobalStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.zsmGenderCombo1 = new DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo();
            this.zsmSatsangCentresLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.ZSMMainSatsangCentresLookup();
            this.tlpSewadarPhoto = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dtPhotoDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.ImgSewadarPhoto = new DCC.UMB.CDF.UIControls.TextControls.DCCImageBox();
            this.dtmBirthDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.cmbRemarksType = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.first_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.middle_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.last_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.gender = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.birth_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.age = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.is_married = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.initiation_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.initiation_place_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.place_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.initiation_by = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.global_sewadar_status_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.global_sewadar_status_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_status_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_status_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.department_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.appointment_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.photo_date = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            ((System.ComponentModel.ISupportInitialize)(this.scListOrBrowse)).BeginInit();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpBase.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdRemarks)).BeginInit();
            this.tlpSewadarPhoto.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.SuspendLayout();
            // 
            // scListOrBrowse
            // 
            this.scListOrBrowse.Dock = System.Windows.Forms.DockStyle.Fill;
            this.scListOrBrowse.Location = new System.Drawing.Point(0, 0);
            this.scListOrBrowse.Margin = new System.Windows.Forms.Padding(13, 4, 13, 4);
            this.scListOrBrowse.Name = "scListOrBrowse";
            // 
            // scListOrBrowse.Panel1
            // 
            this.scListOrBrowse.Panel1.Controls.Add(this.tlpBase);
            this.scListOrBrowse.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(1284, 658);
            this.scListOrBrowse.SplitterDistance = 938;
            this.scListOrBrowse.SplitterWidth = 1;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 12;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 11.57998F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.262022F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.262022F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 8.145241F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4.906771F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.299313F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.56133F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.73896F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.163886F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.948969F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.163886F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.677578F));
            this.tlpBase.Controls.Add(this.intSewadarId, 0, 0);
            this.tlpBase.Controls.Add(this.txtFirstName, 1, 0);
            this.tlpBase.Controls.Add(this.txtMiddleName, 4, 0);
            this.tlpBase.Controls.Add(this.txtSurName, 7, 0);
            this.tlpBase.Controls.Add(this.chkMarried, 0, 1);
            this.tlpBase.Controls.Add(this.intAge, 4, 1);
            this.tlpBase.Controls.Add(this.sewadarStatusCombo1, 5, 1);
            this.tlpBase.Controls.Add(this.dtInitiation, 0, 2);
            this.tlpBase.Controls.Add(this.initiationPlacesLookup1, 1, 2);
            this.tlpBase.Controls.Add(this.patronCombo1, 4, 2);
            this.tlpBase.Controls.Add(this.txtSewadarStatus, 8, 3);
            this.tlpBase.Controls.Add(this.dtmSewadarStatus, 10, 3);
            this.tlpBase.Controls.Add(this.txtCurrentDepartment, 3, 3);
            this.tlpBase.Controls.Add(this.dtDepJoiningDate, 6, 3);
            this.tlpBase.Controls.Add(this.dtAppDate, 7, 3);
            this.tlpBase.Controls.Add(this.grdRemarks, 0, 5);
            this.tlpBase.Controls.Add(this.txtGRNo, 1, 3);
            this.tlpBase.Controls.Add(this.dtGlobalStatus, 7, 1);
            this.tlpBase.Controls.Add(this.zsmGenderCombo1, 8, 0);
            this.tlpBase.Controls.Add(this.zsmSatsangCentresLookup1, 0, 3);
            this.tlpBase.Controls.Add(this.tlpSewadarPhoto, 10, 0);
            this.tlpBase.Controls.Add(this.dtmBirthDate, 1, 1);
            this.tlpBase.Controls.Add(this.txtRemarks, 8, 2);
            this.tlpBase.Controls.Add(this.cmbRemarksType, 7, 2);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Margin = new System.Windows.Forms.Padding(13, 4, 13, 4);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 3;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.84902F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 18.59956F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 17.28665F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.7221F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 6.564551F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 17.94311F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.10443F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 66F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tlpBase.Size = new System.Drawing.Size(1284, 658);
            this.tlpBase.TabIndex = 1;
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
            this.intSewadarId.EditingControlFormattedValue = "";
            this.intSewadarId.EditingControlRowIndex = 0;
            this.intSewadarId.EditingControlValueChanged = false;
            this.intSewadarId.EnableToolTip = false;
            this.intSewadarId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSewadarId.IdText = null;
            this.intSewadarId.IdTextBindingKey = null;
            this.intSewadarId.Location = new System.Drawing.Point(5, 4);
            this.intSewadarId.Lookup = false;
            this.intSewadarId.LookupColumns = null;
            this.intSewadarId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intSewadarId.LookupResult = null;
            this.intSewadarId.LookupTitle = "Sewadar ID";
            this.intSewadarId.Mandatory = false;
            this.intSewadarId.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intSewadarId.MaxCharacterLength = 32767;
            this.intSewadarId.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intSewadarId.MaxValue = ((long)(9223372036854775807));
            this.intSewadarId.MinCharactersForQuery = 0;
            this.intSewadarId.MinimumSize = new System.Drawing.Size(13, 27);
            this.intSewadarId.MinValue = ((long)(-9223372036854775808));
            this.intSewadarId.Name = "intSewadarId";
            this.intSewadarId.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intSewadarId.PascalCase = false;
            this.intSewadarId.RangeInQueryMode = false;
            this.intSewadarId.ReadOnly = true;
            this.intSewadarId.RegularExpressionValidator = null;
            this.intSewadarId.Size = new System.Drawing.Size(139, 55);
            this.intSewadarId.TabIndex = 2;
            this.intSewadarId.TabStop = false;
            this.intSewadarId.Title = "Sewadar ID";
            this.intSewadarId.ToolTipLookupField = "information";
            this.intSewadarId.ValueText = null;
            // 
            // txtFirstName
            // 
            this.txtFirstName.AllowsNew = false;
            this.txtFirstName.AllowsReference = false;
            this.txtFirstName.AllowsUpdate = false;
            this.txtFirstName.ApplicationIdForDbConnection = null;
            this.txtFirstName.BackColor = System.Drawing.Color.Transparent;
            this.txtFirstName.CalledScreenApplicationId = null;
            this.txtFirstName.CalledScreenTypeName = null;
            this.txtFirstName.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.txtFirstName, 3);
            this.txtFirstName.DisplayText = "";
            this.txtFirstName.DisplayTextBindingKey = "first_nm";
            this.txtFirstName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtFirstName.EditingControlDataGridView = null;
            this.txtFirstName.EditingControlFormattedValue = "";
            this.txtFirstName.EditingControlRowIndex = 0;
            this.txtFirstName.EditingControlValueChanged = false;
            this.txtFirstName.EnableToolTip = false;
            this.txtFirstName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFirstName.IdText = null;
            this.txtFirstName.IdTextBindingKey = null;
            this.txtFirstName.Location = new System.Drawing.Point(154, 4);
            this.txtFirstName.Lookup = false;
            this.txtFirstName.LookupColumns = null;
            this.txtFirstName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtFirstName.LookupResult = null;
            this.txtFirstName.LookupTitle = "First Name";
            this.txtFirstName.Mandatory = true;
            this.txtFirstName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtFirstName.MaxCharacterLength = 32767;
            this.txtFirstName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtFirstName.MinCharactersForQuery = 0;
            this.txtFirstName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtFirstName.Name = "txtFirstName";
            this.txtFirstName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtFirstName.PascalCase = false;
            this.txtFirstName.RangeInQueryMode = false;
            this.txtFirstName.ReadOnly = false;
            this.txtFirstName.RegularExpressionValidator = null;
            this.txtFirstName.Size = new System.Drawing.Size(280, 55);
            this.txtFirstName.TabIndex = 3;
            this.txtFirstName.Title = "First Name";
            this.txtFirstName.ToolTipLookupField = "information";
            this.txtFirstName.ValueText = null;
            // 
            // txtMiddleName
            // 
            this.txtMiddleName.AllowsNew = false;
            this.txtMiddleName.AllowsReference = false;
            this.txtMiddleName.AllowsUpdate = false;
            this.txtMiddleName.ApplicationIdForDbConnection = null;
            this.txtMiddleName.BackColor = System.Drawing.Color.Transparent;
            this.txtMiddleName.CalledScreenApplicationId = null;
            this.txtMiddleName.CalledScreenTypeName = null;
            this.txtMiddleName.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.txtMiddleName, 3);
            this.txtMiddleName.DisplayText = "";
            this.txtMiddleName.DisplayTextBindingKey = "middle_nm";
            this.txtMiddleName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtMiddleName.EditingControlDataGridView = null;
            this.txtMiddleName.EditingControlFormattedValue = "";
            this.txtMiddleName.EditingControlRowIndex = 0;
            this.txtMiddleName.EditingControlValueChanged = false;
            this.txtMiddleName.EnableToolTip = false;
            this.txtMiddleName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMiddleName.IdText = null;
            this.txtMiddleName.IdTextBindingKey = null;
            this.txtMiddleName.Location = new System.Drawing.Point(444, 4);
            this.txtMiddleName.Lookup = false;
            this.txtMiddleName.LookupColumns = null;
            this.txtMiddleName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtMiddleName.LookupResult = null;
            this.txtMiddleName.LookupTitle = "Middle Name";
            this.txtMiddleName.Mandatory = true;
            this.txtMiddleName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtMiddleName.MaxCharacterLength = 32767;
            this.txtMiddleName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtMiddleName.MinCharactersForQuery = 0;
            this.txtMiddleName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtMiddleName.Name = "txtMiddleName";
            this.txtMiddleName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtMiddleName.PascalCase = false;
            this.txtMiddleName.RangeInQueryMode = false;
            this.txtMiddleName.ReadOnly = false;
            this.txtMiddleName.RegularExpressionValidator = null;
            this.txtMiddleName.Size = new System.Drawing.Size(282, 55);
            this.txtMiddleName.TabIndex = 4;
            this.txtMiddleName.Title = "Middle Name";
            this.txtMiddleName.ToolTipLookupField = "information";
            this.txtMiddleName.ValueText = null;
            // 
            // txtSurName
            // 
            this.txtSurName.AllowsNew = false;
            this.txtSurName.AllowsReference = false;
            this.txtSurName.AllowsUpdate = false;
            this.txtSurName.ApplicationIdForDbConnection = null;
            this.txtSurName.BackColor = System.Drawing.Color.Transparent;
            this.txtSurName.CalledScreenApplicationId = null;
            this.txtSurName.CalledScreenTypeName = null;
            this.txtSurName.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.txtSurName, 2);
            this.txtSurName.DisplayText = "";
            this.txtSurName.DisplayTextBindingKey = "last_nm";
            this.txtSurName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSurName.EditingControlDataGridView = null;
            this.txtSurName.EditingControlFormattedValue = "";
            this.txtSurName.EditingControlRowIndex = 0;
            this.txtSurName.EditingControlValueChanged = false;
            this.txtSurName.EnableToolTip = false;
            this.txtSurName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSurName.IdText = null;
            this.txtSurName.IdTextBindingKey = null;
            this.txtSurName.Location = new System.Drawing.Point(736, 4);
            this.txtSurName.Lookup = false;
            this.txtSurName.LookupColumns = null;
            this.txtSurName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSurName.LookupResult = null;
            this.txtSurName.LookupTitle = "Surname";
            this.txtSurName.Mandatory = true;
            this.txtSurName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSurName.MaxCharacterLength = 32767;
            this.txtSurName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSurName.MinCharactersForQuery = 0;
            this.txtSurName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSurName.Name = "txtSurName";
            this.txtSurName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSurName.PascalCase = false;
            this.txtSurName.RangeInQueryMode = false;
            this.txtSurName.ReadOnly = false;
            this.txtSurName.RegularExpressionValidator = null;
            this.txtSurName.Size = new System.Drawing.Size(258, 55);
            this.txtSurName.TabIndex = 5;
            this.txtSurName.Title = "Surname";
            this.txtSurName.ToolTipLookupField = "information";
            this.txtSurName.ValueText = null;
            // 
            // chkMarried
            // 
            this.chkMarried.AutoSize = true;
            this.chkMarried.BackColor = System.Drawing.Color.Transparent;
            this.chkMarried.BindingKey = "is_married";
            this.chkMarried.Dock = System.Windows.Forms.DockStyle.Top;
            this.chkMarried.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkMarried.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkMarried.Location = new System.Drawing.Point(4, 99);
            this.chkMarried.Margin = new System.Windows.Forms.Padding(4);
            this.chkMarried.Name = "chkMarried";
            this.chkMarried.Size = new System.Drawing.Size(141, 23);
            this.chkMarried.TabIndex = 7;
            this.chkMarried.Text = "Married?";
            this.chkMarried.UseVisualStyleBackColor = true;
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
            this.intAge.Location = new System.Drawing.Point(444, 99);
            this.intAge.Lookup = false;
            this.intAge.LookupColumns = null;
            this.intAge.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intAge.LookupResult = null;
            this.intAge.LookupTitle = "Age";
            this.intAge.Mandatory = false;
            this.intAge.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intAge.MaxCharacterLength = 32767;
            this.intAge.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intAge.MaxValue = ((long)(9223372036854775807));
            this.intAge.MinCharactersForQuery = 0;
            this.intAge.MinimumSize = new System.Drawing.Size(13, 27);
            this.intAge.MinValue = ((long)(-9223372036854775808));
            this.intAge.Name = "intAge";
            this.intAge.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intAge.PascalCase = false;
            this.intAge.RangeInQueryMode = false;
            this.intAge.ReadOnly = true;
            this.intAge.RegularExpressionValidator = null;
            this.intAge.Size = new System.Drawing.Size(53, 55);
            this.intAge.TabIndex = 9;
            this.intAge.TabStop = false;
            this.intAge.Title = "Age";
            this.intAge.ToolTipLookupField = "information";
            this.intAge.ValueText = null;
            // 
            // sewadarStatusCombo1
            // 
            this.sewadarStatusCombo1.ApplicationIdForDbConnection = null;
            this.sewadarStatusCombo1.BackColor = System.Drawing.Color.Transparent;
            this.tlpBase.SetColumnSpan(this.sewadarStatusCombo1, 2);
            this.sewadarStatusCombo1.DisplayText = "";
            this.sewadarStatusCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarStatusCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.sewadarStatusCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewadarStatusCombo1.isGlobal = false;
            this.sewadarStatusCombo1.Location = new System.Drawing.Point(507, 99);
            this.sewadarStatusCombo1.Mandatory = false;
            this.sewadarStatusCombo1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.sewadarStatusCombo1.MaximumSize = new System.Drawing.Size(1733, 54);
            this.sewadarStatusCombo1.MinimumSize = new System.Drawing.Size(13, 27);
            this.sewadarStatusCombo1.Name = "sewadarStatusCombo1";
            this.sewadarStatusCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.sewadarStatusCombo1.ReadOnly = false;
            this.sewadarStatusCombo1.SelectedIndex = -1;
            this.sewadarStatusCombo1.SelectedItem = null;
            this.sewadarStatusCombo1.SelectedText = "";
            this.sewadarStatusCombo1.SelectedValue = null;
            this.sewadarStatusCombo1.SelectedValueBindingKey = "global_sewadar_status_cd";
            this.sewadarStatusCombo1.Size = new System.Drawing.Size(219, 54);
            this.sewadarStatusCombo1.StatusSystemInfoCode = DCC.ZOS.ZSM.Controls.Configuration.SewadarStatusSysInfoCode.All;
            this.sewadarStatusCombo1.TabIndex = 10;
            this.sewadarStatusCombo1.Title = "Global Status";
            this.sewadarStatusCombo1.ValueText = null;
            this.sewadarStatusCombo1.SelectedValueChanged += new System.EventHandler<System.EventArgs>(this.sewadarStatusCombo1_SelectedValueChanged);
            // 
            // dtInitiation
            // 
            this.dtInitiation.AllowFutureDate = true;
            this.dtInitiation.AllowsNew = false;
            this.dtInitiation.AllowsReference = false;
            this.dtInitiation.AllowsUpdate = false;
            this.dtInitiation.ApplicationIdForDbConnection = null;
            this.dtInitiation.BackColor = System.Drawing.Color.Transparent;
            this.dtInitiation.CalledScreenApplicationId = null;
            this.dtInitiation.CalledScreenTypeName = null;
            this.dtInitiation.CallingScreenType = null;
            this.dtInitiation.DisplayText = null;
            this.dtInitiation.DisplayTextAsDateTime = null;
            this.dtInitiation.DisplayTextBindingKey = "initiation_dt";
            this.dtInitiation.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtInitiation.EditingControlDataGridView = null;
            this.dtInitiation.EditingControlFormattedValue = null;
            this.dtInitiation.EditingControlRowIndex = 0;
            this.dtInitiation.EditingControlValueChanged = false;
            this.dtInitiation.EnableToolTip = false;
            this.dtInitiation.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtInitiation.IdText = "";
            this.dtInitiation.IdTextBindingKey = null;
            this.dtInitiation.Location = new System.Drawing.Point(5, 204);
            this.dtInitiation.Lookup = true;
            this.dtInitiation.LookupColumns = null;
            this.dtInitiation.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtInitiation.LookupResult = null;
            this.dtInitiation.LookupTitle = "Initiation Date";
            this.dtInitiation.Mandatory = false;
            this.dtInitiation.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtInitiation.MaxCharacterLength = 11;
            this.dtInitiation.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtInitiation.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtInitiation.MinCharactersForQuery = 0;
            this.dtInitiation.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtInitiation.MinValue = new System.DateTime(((long)(0)));
            this.dtInitiation.Name = "dtInitiation";
            this.dtInitiation.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtInitiation.PascalCase = false;
            this.dtInitiation.RangeInQueryMode = false;
            this.dtInitiation.ReadOnly = false;
            this.dtInitiation.RegularExpressionValidator = null;
            this.dtInitiation.ShowTime = false;
            this.dtInitiation.Size = new System.Drawing.Size(139, 55);
            this.dtInitiation.TabIndex = 12;
            this.dtInitiation.Title = "Initiation Date";
            this.dtInitiation.ToolTipLookupField = "information";
            this.dtInitiation.ValueText = "";
            this.dtInitiation.Validating += new System.ComponentModel.CancelEventHandler(this.dtInitiation_Validating);
            this.dtInitiation.Validated += new System.EventHandler(this.dtInitiation_Validated);
            // 
            // initiationPlacesLookup1
            // 
            this.initiationPlacesLookup1.AllowsNew = false;
            this.initiationPlacesLookup1.AllowsReference = false;
            this.initiationPlacesLookup1.AllowsUpdate = false;
            this.initiationPlacesLookup1.BackColor = System.Drawing.Color.Transparent;
            this.initiationPlacesLookup1.CalledScreenApplicationId = null;
            this.initiationPlacesLookup1.CalledScreenTypeName = null;
            this.initiationPlacesLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.initiationPlacesLookup1, 3);
            this.initiationPlacesLookup1.DisplayText = "";
            this.initiationPlacesLookup1.DisplayTextBindingKey = "place_nm";
            this.initiationPlacesLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.initiationPlacesLookup1.EditingControlDataGridView = null;
            this.initiationPlacesLookup1.EditingControlFormattedValue = null;
            this.initiationPlacesLookup1.EditingControlRowIndex = 0;
            this.initiationPlacesLookup1.EditingControlValueChanged = true;
            this.initiationPlacesLookup1.EnableToolTip = false;
            this.initiationPlacesLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Both;
            this.initiationPlacesLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.initiationPlacesLookup1.IdText = "";
            this.initiationPlacesLookup1.IdTextBindingKey = "initiation_place_id";
            this.initiationPlacesLookup1.Location = new System.Drawing.Point(154, 204);
            this.initiationPlacesLookup1.LookupColumns = resources.GetString("initiationPlacesLookup1.LookupColumns");
            this.initiationPlacesLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.initiationPlacesLookup1.LookupResult = null;
            this.initiationPlacesLookup1.LookupTitle = "Initiation Place";
            this.initiationPlacesLookup1.Mandatory = false;
            this.initiationPlacesLookup1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.initiationPlacesLookup1.MaxCharacterLength = 32767;
            this.initiationPlacesLookup1.MaximumSize = new System.Drawing.Size(1733, 55);
            this.initiationPlacesLookup1.MinCharactersForQuery = 0;
            this.initiationPlacesLookup1.MinimumSize = new System.Drawing.Size(13, 27);
            this.initiationPlacesLookup1.Name = "initiationPlacesLookup1";
            this.initiationPlacesLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.initiationPlacesLookup1.PascalCase = false;
            this.initiationPlacesLookup1.RangeInQueryMode = false;
            this.initiationPlacesLookup1.ReadOnly = false;
            this.initiationPlacesLookup1.RegularExpressionValidator = null;
            this.initiationPlacesLookup1.Size = new System.Drawing.Size(280, 55);
            this.initiationPlacesLookup1.TabIndex = 13;
            this.initiationPlacesLookup1.Title = "Initiation Place";
            this.initiationPlacesLookup1.ToolTipLookupField = "information";
            this.initiationPlacesLookup1.ValueText = "";
            // 
            // patronCombo1
            // 
            this.patronCombo1.BackColor = System.Drawing.Color.Transparent;
            this.tlpBase.SetColumnSpan(this.patronCombo1, 3);
            this.patronCombo1.DisplayText = "";
            this.patronCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.patronCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.patronCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.patronCombo1.Location = new System.Drawing.Point(444, 204);
            this.patronCombo1.Mandatory = false;
            this.patronCombo1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.patronCombo1.MaximumSize = new System.Drawing.Size(1733, 54);
            this.patronCombo1.MinimumSize = new System.Drawing.Size(13, 27);
            this.patronCombo1.Name = "patronCombo1";
            this.patronCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.patronCombo1.ReadOnly = false;
            this.patronCombo1.SelectedIndex = -1;
            this.patronCombo1.SelectedItem = null;
            this.patronCombo1.SelectedText = "";
            this.patronCombo1.SelectedValue = null;
            this.patronCombo1.SelectedValueBindingKey = "initiation_by";
            this.patronCombo1.Size = new System.Drawing.Size(282, 54);
            this.patronCombo1.TabIndex = 14;
            this.patronCombo1.Title = "Initiated By";
            this.patronCombo1.ValueText = null;
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
            this.tlpBase.SetColumnSpan(this.txtSewadarStatus, 2);
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
            this.txtSewadarStatus.Location = new System.Drawing.Point(912, 301);
            this.txtSewadarStatus.Lookup = false;
            this.txtSewadarStatus.LookupColumns = null;
            this.txtSewadarStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSewadarStatus.LookupResult = null;
            this.txtSewadarStatus.LookupTitle = "Status";
            this.txtSewadarStatus.Mandatory = false;
            this.txtSewadarStatus.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSewadarStatus.MaxCharacterLength = 32767;
            this.txtSewadarStatus.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSewadarStatus.MinCharactersForQuery = 0;
            this.txtSewadarStatus.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSewadarStatus.Name = "txtSewadarStatus";
            this.txtSewadarStatus.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSewadarStatus.PascalCase = false;
            this.txtSewadarStatus.RangeInQueryMode = false;
            this.txtSewadarStatus.ReadOnly = true;
            this.txtSewadarStatus.RegularExpressionValidator = null;
            this.txtSewadarStatus.Size = new System.Drawing.Size(184, 52);
            this.txtSewadarStatus.TabIndex = 20;
            this.txtSewadarStatus.TabStop = false;
            this.txtSewadarStatus.Title = "Status";
            this.txtSewadarStatus.ToolTipLookupField = "information";
            this.txtSewadarStatus.ValueText = null;
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
            this.tlpBase.SetColumnSpan(this.dtmSewadarStatus, 2);
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
            this.dtmSewadarStatus.Location = new System.Drawing.Point(1106, 301);
            this.dtmSewadarStatus.Lookup = true;
            this.dtmSewadarStatus.LookupColumns = null;
            this.dtmSewadarStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtmSewadarStatus.LookupResult = null;
            this.dtmSewadarStatus.LookupTitle = "Status Date";
            this.dtmSewadarStatus.Mandatory = false;
            this.dtmSewadarStatus.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtmSewadarStatus.MaxCharacterLength = 11;
            this.dtmSewadarStatus.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtmSewadarStatus.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtmSewadarStatus.MinCharactersForQuery = 0;
            this.dtmSewadarStatus.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtmSewadarStatus.MinValue = new System.DateTime(((long)(0)));
            this.dtmSewadarStatus.Name = "dtmSewadarStatus";
            this.dtmSewadarStatus.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtmSewadarStatus.PascalCase = false;
            this.dtmSewadarStatus.RangeInQueryMode = false;
            this.dtmSewadarStatus.ReadOnly = true;
            this.dtmSewadarStatus.RegularExpressionValidator = null;
            this.dtmSewadarStatus.ShowTime = false;
            this.dtmSewadarStatus.Size = new System.Drawing.Size(173, 52);
            this.dtmSewadarStatus.TabIndex = 21;
            this.dtmSewadarStatus.TabStop = false;
            this.dtmSewadarStatus.Title = "Status Date";
            this.dtmSewadarStatus.ToolTipLookupField = "information";
            this.dtmSewadarStatus.ValueText = "";
            // 
            // txtCurrentDepartment
            // 
            this.txtCurrentDepartment.AllowsNew = false;
            this.txtCurrentDepartment.AllowsReference = false;
            this.txtCurrentDepartment.AllowsUpdate = false;
            this.txtCurrentDepartment.ApplicationIdForDbConnection = null;
            this.txtCurrentDepartment.BackColor = System.Drawing.Color.Transparent;
            this.txtCurrentDepartment.CalledScreenApplicationId = null;
            this.txtCurrentDepartment.CalledScreenTypeName = null;
            this.txtCurrentDepartment.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.txtCurrentDepartment, 3);
            this.txtCurrentDepartment.DisplayText = "";
            this.txtCurrentDepartment.DisplayTextBindingKey = "department_nm";
            this.txtCurrentDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCurrentDepartment.EditingControlDataGridView = null;
            this.txtCurrentDepartment.EditingControlFormattedValue = "";
            this.txtCurrentDepartment.EditingControlRowIndex = 0;
            this.txtCurrentDepartment.EditingControlValueChanged = false;
            this.txtCurrentDepartment.EnableToolTip = false;
            this.txtCurrentDepartment.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCurrentDepartment.IdText = null;
            this.txtCurrentDepartment.IdTextBindingKey = null;
            this.txtCurrentDepartment.Location = new System.Drawing.Point(340, 301);
            this.txtCurrentDepartment.Lookup = false;
            this.txtCurrentDepartment.LookupColumns = null;
            this.txtCurrentDepartment.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCurrentDepartment.LookupResult = null;
            this.txtCurrentDepartment.LookupTitle = "Department";
            this.txtCurrentDepartment.Mandatory = false;
            this.txtCurrentDepartment.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtCurrentDepartment.MaxCharacterLength = 32767;
            this.txtCurrentDepartment.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtCurrentDepartment.MinCharactersForQuery = 0;
            this.txtCurrentDepartment.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtCurrentDepartment.Name = "txtCurrentDepartment";
            this.txtCurrentDepartment.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtCurrentDepartment.PascalCase = false;
            this.txtCurrentDepartment.RangeInQueryMode = false;
            this.txtCurrentDepartment.ReadOnly = true;
            this.txtCurrentDepartment.RegularExpressionValidator = null;
            this.txtCurrentDepartment.Size = new System.Drawing.Size(225, 52);
            this.txtCurrentDepartment.TabIndex = 17;
            this.txtCurrentDepartment.TabStop = false;
            this.txtCurrentDepartment.Title = "Department";
            this.txtCurrentDepartment.ToolTipLookupField = "information";
            this.txtCurrentDepartment.ValueText = null;
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
            this.dtDepJoiningDate.Location = new System.Drawing.Point(575, 301);
            this.dtDepJoiningDate.Lookup = true;
            this.dtDepJoiningDate.LookupColumns = null;
            this.dtDepJoiningDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtDepJoiningDate.LookupResult = null;
            this.dtDepJoiningDate.LookupTitle = "Dept. Joining Date";
            this.dtDepJoiningDate.Mandatory = false;
            this.dtDepJoiningDate.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtDepJoiningDate.MaxCharacterLength = 11;
            this.dtDepJoiningDate.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtDepJoiningDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtDepJoiningDate.MinCharactersForQuery = 0;
            this.dtDepJoiningDate.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtDepJoiningDate.MinValue = new System.DateTime(((long)(0)));
            this.dtDepJoiningDate.Name = "dtDepJoiningDate";
            this.dtDepJoiningDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtDepJoiningDate.PascalCase = false;
            this.dtDepJoiningDate.RangeInQueryMode = false;
            this.dtDepJoiningDate.ReadOnly = true;
            this.dtDepJoiningDate.RegularExpressionValidator = null;
            this.dtDepJoiningDate.ShowTime = false;
            this.dtDepJoiningDate.Size = new System.Drawing.Size(151, 52);
            this.dtDepJoiningDate.TabIndex = 18;
            this.dtDepJoiningDate.TabStop = false;
            this.dtDepJoiningDate.Title = "Dept. Joining Date";
            this.dtDepJoiningDate.ToolTipLookupField = "information";
            this.dtDepJoiningDate.ValueText = "";
            // 
            // dtAppDate
            // 
            this.dtAppDate.AllowFutureDate = true;
            this.dtAppDate.AllowsNew = false;
            this.dtAppDate.AllowsReference = false;
            this.dtAppDate.AllowsUpdate = false;
            this.dtAppDate.ApplicationIdForDbConnection = null;
            this.dtAppDate.BackColor = System.Drawing.Color.Transparent;
            this.dtAppDate.CalledScreenApplicationId = null;
            this.dtAppDate.CalledScreenTypeName = null;
            this.dtAppDate.CallingScreenType = null;
            this.dtAppDate.DisplayText = null;
            this.dtAppDate.DisplayTextAsDateTime = null;
            this.dtAppDate.DisplayTextBindingKey = "appointment_dt";
            this.dtAppDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtAppDate.EditingControlDataGridView = null;
            this.dtAppDate.EditingControlFormattedValue = null;
            this.dtAppDate.EditingControlRowIndex = 0;
            this.dtAppDate.EditingControlValueChanged = false;
            this.dtAppDate.EnableToolTip = false;
            this.dtAppDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtAppDate.IdText = "";
            this.dtAppDate.IdTextBindingKey = null;
            this.dtAppDate.Location = new System.Drawing.Point(736, 301);
            this.dtAppDate.Lookup = true;
            this.dtAppDate.LookupColumns = null;
            this.dtAppDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtAppDate.LookupResult = null;
            this.dtAppDate.LookupTitle = "Appointment Date";
            this.dtAppDate.Mandatory = false;
            this.dtAppDate.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtAppDate.MaxCharacterLength = 11;
            this.dtAppDate.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtAppDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtAppDate.MinCharactersForQuery = 0;
            this.dtAppDate.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtAppDate.MinValue = new System.DateTime(((long)(0)));
            this.dtAppDate.Name = "dtAppDate";
            this.dtAppDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtAppDate.PascalCase = false;
            this.dtAppDate.RangeInQueryMode = true;
            this.dtAppDate.ReadOnly = true;
            this.dtAppDate.RegularExpressionValidator = null;
            this.dtAppDate.ShowTime = false;
            this.dtAppDate.Size = new System.Drawing.Size(166, 52);
            this.dtAppDate.TabIndex = 19;
            this.dtAppDate.TabStop = false;
            this.dtAppDate.Title = "Appointment Date";
            this.dtAppDate.ToolTipLookupField = "information";
            this.dtAppDate.ValueText = "";
            // 
            // grdRemarks
            // 
            this.grdRemarks.AllowRowSorting = false;
            this.grdRemarks.AllowUserToAddRows = false;
            this.grdRemarks.AutoAddNewRowForUser = false;
            this.grdRemarks.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdRemarks.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.remarks_type,
            this.remarks_sq,
            this.remarks});
            this.tlpBase.SetColumnSpan(this.grdRemarks, 12);
            this.grdRemarks.DeleteRowMenuEnabled = true;
            this.grdRemarks.DeleteVisible = true;
            this.grdRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdRemarks.ExportToExcelVisible = true;
            this.grdRemarks.InsertAfterVisible = true;
            this.grdRemarks.InsertBeforeVisible = true;
            this.grdRemarks.InsertLastVisible = true;
            this.grdRemarks.InsertRowsMenuItemsEnabled = true;
            this.grdRemarks.Location = new System.Drawing.Point(4, 398);
            this.grdRemarks.Mandatory = false;
            this.grdRemarks.Margin = new System.Windows.Forms.Padding(4);
            this.grdRemarks.MoveDownVisible = false;
            this.grdRemarks.MoveUpVisible = false;
            this.grdRemarks.MultiSelect = false;
            this.grdRemarks.Name = "grdRemarks";
            this.grdRemarks.RowHeadersWidth = 15;
            this.tlpBase.SetRowSpan(this.grdRemarks, 4);
            this.grdRemarks.RowTemplate.Height = 24;
            this.grdRemarks.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdRemarks.ShowCommandStrip = true;
            this.grdRemarks.Size = new System.Drawing.Size(1276, 256);
            this.grdRemarks.TabIndex = 25;
            this.grdRemarks.Title = null;
            this.grdRemarks.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdRemarks.VirtualMode = true;
            // 
            // remarks_type
            // 
            this.remarks_type.BindingKey = "remarks_type";
            this.remarks_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Combobox;
            this.remarks_type.HeaderText = "Type";
            this.remarks_type.Lookup = false;
            this.remarks_type.LookupColumns = "";
            this.remarks_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.remarks_type.Mandatory = false;
            this.remarks_type.MinimumWidth = 6;
            this.remarks_type.Name = "remarks_type";
            this.remarks_type.PercentageWidth = 15F;
            this.remarks_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks_type.ToolTipLookupField = "information";
            this.remarks_type.Width = 189;
            // 
            // remarks_sq
            // 
            this.remarks_sq.BindingKey = "remarks_sq";
            this.remarks_sq.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.remarks_sq.DefaultCellStyle = dataGridViewCellStyle1;
            this.remarks_sq.HeaderText = "remarks_sq";
            this.remarks_sq.Lookup = false;
            this.remarks_sq.LookupColumns = "";
            this.remarks_sq.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.remarks_sq.Mandatory = false;
            this.remarks_sq.MaxValue = ((long)(9223372036854775807));
            this.remarks_sq.MinimumWidth = 6;
            this.remarks_sq.MinValue = ((long)(-9223372036854775808));
            this.remarks_sq.Name = "remarks_sq";
            this.remarks_sq.PercentageWidth = 25F;
            this.remarks_sq.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks_sq.ToolTipLookupField = "information";
            this.remarks_sq.Visible = false;
            this.remarks_sq.Width = 125;
            // 
            // remarks
            // 
            this.remarks.BindingKey = "remarks";
            this.remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.remarks.HeaderText = "Remarks";
            this.remarks.Lookup = false;
            this.remarks.LookupColumns = "";
            this.remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.remarks.Mandatory = false;
            this.remarks.MaxCharacterLength = 2147483647;
            this.remarks.MinimumWidth = 6;
            this.remarks.Name = "remarks";
            this.remarks.PercentageWidth = 85F;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Width = 1071;
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
            this.txtGRNo.EditingControlFormattedValue = "";
            this.txtGRNo.EditingControlRowIndex = 0;
            this.txtGRNo.EditingControlValueChanged = false;
            this.txtGRNo.EnableToolTip = false;
            this.txtGRNo.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGRNo.IdText = null;
            this.txtGRNo.IdTextBindingKey = null;
            this.txtGRNo.Location = new System.Drawing.Point(247, 301);
            this.txtGRNo.Lookup = false;
            this.txtGRNo.LookupColumns = null;
            this.txtGRNo.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtGRNo.LookupResult = null;
            this.txtGRNo.LookupTitle = "GR No.";
            this.txtGRNo.Mandatory = false;
            this.txtGRNo.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtGRNo.MaxCharacterLength = 32767;
            this.txtGRNo.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtGRNo.MinCharactersForQuery = 0;
            this.txtGRNo.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtGRNo.Name = "txtGRNo";
            this.txtGRNo.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtGRNo.PascalCase = false;
            this.txtGRNo.RangeInQueryMode = false;
            this.txtGRNo.ReadOnly = true;
            this.txtGRNo.RegularExpressionValidator = null;
            this.txtGRNo.Size = new System.Drawing.Size(83, 52);
            this.txtGRNo.TabIndex = 16;
            this.txtGRNo.TabStop = false;
            this.txtGRNo.Title = "GR No.";
            this.txtGRNo.ToolTipLookupField = "information";
            this.txtGRNo.ValueText = null;
            // 
            // dtGlobalStatus
            // 
            this.dtGlobalStatus.AllowFutureDate = true;
            this.dtGlobalStatus.AllowsNew = false;
            this.dtGlobalStatus.AllowsReference = false;
            this.dtGlobalStatus.AllowsUpdate = false;
            this.dtGlobalStatus.ApplicationIdForDbConnection = null;
            this.dtGlobalStatus.BackColor = System.Drawing.Color.Transparent;
            this.dtGlobalStatus.CalledScreenApplicationId = null;
            this.dtGlobalStatus.CalledScreenTypeName = null;
            this.dtGlobalStatus.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.dtGlobalStatus, 2);
            this.dtGlobalStatus.DisplayText = null;
            this.dtGlobalStatus.DisplayTextAsDateTime = null;
            this.dtGlobalStatus.DisplayTextBindingKey = "global_sewadar_status_dt";
            this.dtGlobalStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtGlobalStatus.EditingControlDataGridView = null;
            this.dtGlobalStatus.EditingControlFormattedValue = null;
            this.dtGlobalStatus.EditingControlRowIndex = 0;
            this.dtGlobalStatus.EditingControlValueChanged = false;
            this.dtGlobalStatus.EnableToolTip = false;
            this.dtGlobalStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtGlobalStatus.IdText = "";
            this.dtGlobalStatus.IdTextBindingKey = null;
            this.dtGlobalStatus.Location = new System.Drawing.Point(736, 99);
            this.dtGlobalStatus.Lookup = true;
            this.dtGlobalStatus.LookupColumns = null;
            this.dtGlobalStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtGlobalStatus.LookupResult = null;
            this.dtGlobalStatus.LookupTitle = "Status Date";
            this.dtGlobalStatus.Mandatory = false;
            this.dtGlobalStatus.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtGlobalStatus.MaxCharacterLength = 11;
            this.dtGlobalStatus.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtGlobalStatus.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtGlobalStatus.MinCharactersForQuery = 0;
            this.dtGlobalStatus.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtGlobalStatus.MinValue = new System.DateTime(((long)(0)));
            this.dtGlobalStatus.Name = "dtGlobalStatus";
            this.dtGlobalStatus.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtGlobalStatus.PascalCase = false;
            this.dtGlobalStatus.RangeInQueryMode = true;
            this.dtGlobalStatus.ReadOnly = false;
            this.dtGlobalStatus.RegularExpressionValidator = null;
            this.dtGlobalStatus.ShowTime = false;
            this.dtGlobalStatus.Size = new System.Drawing.Size(258, 55);
            this.dtGlobalStatus.TabIndex = 11;
            this.dtGlobalStatus.Title = "Status Date";
            this.dtGlobalStatus.ToolTipLookupField = "information";
            this.dtGlobalStatus.ValueText = "";
            // 
            // zsmGenderCombo1
            // 
            this.zsmGenderCombo1.ApplicationIdForDbConnection = null;
            this.zsmGenderCombo1.BackColor = System.Drawing.Color.Transparent;
            this.zsmGenderCombo1.DisplayText = ".......";
            this.zsmGenderCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.zsmGenderCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.zsmGenderCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.zsmGenderCombo1.Location = new System.Drawing.Point(1004, 4);
            this.zsmGenderCombo1.Mandatory = true;
            this.zsmGenderCombo1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.zsmGenderCombo1.MaximumSize = new System.Drawing.Size(1733, 54);
            this.zsmGenderCombo1.MinimumSize = new System.Drawing.Size(13, 27);
            this.zsmGenderCombo1.Name = "zsmGenderCombo1";
            this.zsmGenderCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.zsmGenderCombo1.ReadOnly = false;
            this.zsmGenderCombo1.SelectedIndex = 0;
            this.zsmGenderCombo1.SelectedText = ".......";
            this.zsmGenderCombo1.SelectedValue = null;
            this.zsmGenderCombo1.SelectedValueBindingKey = "gender";
            this.zsmGenderCombo1.Size = new System.Drawing.Size(92, 54);
            this.zsmGenderCombo1.TabIndex = 6;
            this.zsmGenderCombo1.Title = "Gender";
            this.zsmGenderCombo1.ValueText = null;
            // 
            // zsmSatsangCentresLookup1
            // 
            this.zsmSatsangCentresLookup1.AllowsNew = false;
            this.zsmSatsangCentresLookup1.AllowsReference = false;
            this.zsmSatsangCentresLookup1.AllowsUpdate = false;
            this.zsmSatsangCentresLookup1.ApplicationIdForDbConnection = null;
            this.zsmSatsangCentresLookup1.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.zsmSatsangCentresLookup1.BackColor = System.Drawing.Color.Transparent;
            this.zsmSatsangCentresLookup1.CalledScreenApplicationId = null;
            this.zsmSatsangCentresLookup1.CalledScreenTypeName = null;
            this.zsmSatsangCentresLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.zsmSatsangCentresLookup1, 2);
            this.zsmSatsangCentresLookup1.DisplayText = "";
            this.zsmSatsangCentresLookup1.DisplayTextBindingKey = "centre_nm";
            this.zsmSatsangCentresLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.zsmSatsangCentresLookup1.EditingControlDataGridView = null;
            this.zsmSatsangCentresLookup1.EditingControlFormattedValue = null;
            this.zsmSatsangCentresLookup1.EditingControlRowIndex = 0;
            this.zsmSatsangCentresLookup1.EditingControlValueChanged = true;
            this.zsmSatsangCentresLookup1.EnableToolTip = false;
            this.zsmSatsangCentresLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.zsmSatsangCentresLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.zsmSatsangCentresLookup1.IdText = "";
            this.zsmSatsangCentresLookup1.IdTextBindingKey = "satsang_centre_id";
            this.zsmSatsangCentresLookup1.Location = new System.Drawing.Point(5, 301);
            this.zsmSatsangCentresLookup1.Lookup = true;
            this.zsmSatsangCentresLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.zsmSatsangCentresLookup1.LookupResult = null;
            this.zsmSatsangCentresLookup1.LookupTitle = "Satsang Centre";
            this.zsmSatsangCentresLookup1.Mandatory = false;
            this.zsmSatsangCentresLookup1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.zsmSatsangCentresLookup1.MaxCharacterLength = 32767;
            this.zsmSatsangCentresLookup1.MaximumSize = new System.Drawing.Size(1733, 55);
            this.zsmSatsangCentresLookup1.MinCharactersForQuery = 0;
            this.zsmSatsangCentresLookup1.MinimumSize = new System.Drawing.Size(13, 27);
            this.zsmSatsangCentresLookup1.Name = "zsmSatsangCentresLookup1";
            this.zsmSatsangCentresLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.zsmSatsangCentresLookup1.PascalCase = false;
            this.zsmSatsangCentresLookup1.RangeInQueryMode = false;
            this.zsmSatsangCentresLookup1.ReadOnly = true;
            this.zsmSatsangCentresLookup1.RegularExpressionValidator = null;
            this.zsmSatsangCentresLookup1.ShowOnlyMainCentres = false;
            this.zsmSatsangCentresLookup1.Size = new System.Drawing.Size(232, 52);
            this.zsmSatsangCentresLookup1.TabIndex = 15;
            this.zsmSatsangCentresLookup1.TabStop = false;
            this.zsmSatsangCentresLookup1.Title = "Satsang Centre";
            this.zsmSatsangCentresLookup1.ToolTipLookupField = "information";
            this.zsmSatsangCentresLookup1.ValueText = "";
            // 
            // tlpSewadarPhoto
            // 
            this.tlpSewadarPhoto.ColumnCount = 1;
            this.tlpBase.SetColumnSpan(this.tlpSewadarPhoto, 2);
            this.tlpSewadarPhoto.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpSewadarPhoto.Controls.Add(this.dtPhotoDate, 0, 1);
            this.tlpSewadarPhoto.Controls.Add(this.ImgSewadarPhoto, 0, 0);
            this.tlpSewadarPhoto.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpSewadarPhoto.Location = new System.Drawing.Point(1105, 4);
            this.tlpSewadarPhoto.Margin = new System.Windows.Forms.Padding(4);
            this.tlpSewadarPhoto.Name = "tlpSewadarPhoto";
            this.tlpSewadarPhoto.RowCount = 1;
            this.tlpBase.SetRowSpan(this.tlpSewadarPhoto, 3);
            this.tlpSewadarPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.60229F));
            this.tlpSewadarPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 79.39771F));
            this.tlpSewadarPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 58F));
            this.tlpSewadarPhoto.Size = new System.Drawing.Size(175, 289);
            this.tlpSewadarPhoto.TabIndex = 50;
            // 
            // dtPhotoDate
            // 
            this.dtPhotoDate.AllowFutureDate = true;
            this.dtPhotoDate.AllowsNew = false;
            this.dtPhotoDate.AllowsReference = false;
            this.dtPhotoDate.AllowsUpdate = false;
            this.dtPhotoDate.ApplicationIdForDbConnection = null;
            this.dtPhotoDate.BackColor = System.Drawing.Color.Transparent;
            this.dtPhotoDate.CalledScreenApplicationId = null;
            this.dtPhotoDate.CalledScreenTypeName = null;
            this.dtPhotoDate.CallingScreenType = null;
            this.dtPhotoDate.DisplayText = null;
            this.dtPhotoDate.DisplayTextAsDateTime = null;
            this.dtPhotoDate.DisplayTextBindingKey = "photo_date";
            this.dtPhotoDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtPhotoDate.EditingControlDataGridView = null;
            this.dtPhotoDate.EditingControlFormattedValue = null;
            this.dtPhotoDate.EditingControlRowIndex = 0;
            this.dtPhotoDate.EditingControlValueChanged = false;
            this.dtPhotoDate.EnableToolTip = false;
            this.dtPhotoDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtPhotoDate.IdText = "";
            this.dtPhotoDate.IdTextBindingKey = null;
            this.dtPhotoDate.Location = new System.Drawing.Point(5, 234);
            this.dtPhotoDate.Lookup = true;
            this.dtPhotoDate.LookupColumns = null;
            this.dtPhotoDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtPhotoDate.LookupResult = null;
            this.dtPhotoDate.LookupTitle = "";
            this.dtPhotoDate.Mandatory = false;
            this.dtPhotoDate.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtPhotoDate.MaxCharacterLength = 11;
            this.dtPhotoDate.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtPhotoDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtPhotoDate.MinCharactersForQuery = 0;
            this.dtPhotoDate.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtPhotoDate.MinValue = new System.DateTime(((long)(0)));
            this.dtPhotoDate.Name = "dtPhotoDate";
            this.dtPhotoDate.Padding = new System.Windows.Forms.Padding(0, 0, 14, 0);
            this.dtPhotoDate.PascalCase = false;
            this.dtPhotoDate.RangeInQueryMode = false;
            this.dtPhotoDate.ReadOnly = false;
            this.dtPhotoDate.RegularExpressionValidator = null;
            this.dtPhotoDate.ShowTime = false;
            this.dtPhotoDate.Size = new System.Drawing.Size(165, 51);
            this.dtPhotoDate.TabIndex = 15;
            this.dtPhotoDate.Title = "";
            this.dtPhotoDate.ToolTipLookupField = "information";
            this.dtPhotoDate.ValueText = "";
            this.dtPhotoDate.Validating += new System.ComponentModel.CancelEventHandler(this.dtPhotoDate_Validating);
            // 
            // ImgSewadarPhoto
            // 
            this.ImgSewadarPhoto.BackColor = System.Drawing.Color.Transparent;
            this.ImgSewadarPhoto.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.ImgSewadarPhoto.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ImgSewadarPhoto.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ImgSewadarPhoto.ImageInByteArray = null;
            this.ImgSewadarPhoto.Location = new System.Drawing.Point(5, 4);
            this.ImgSewadarPhoto.Mandatory = false;
            this.ImgSewadarPhoto.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.ImgSewadarPhoto.MaximumSize = new System.Drawing.Size(6666, 6153);
            this.ImgSewadarPhoto.MinimumSize = new System.Drawing.Size(13, 27);
            this.ImgSewadarPhoto.Name = "ImgSewadarPhoto";
            this.ImgSewadarPhoto.ReadOnly = false;
            this.tlpSewadarPhoto.SetRowSpan(this.ImgSewadarPhoto, 2);
            this.ImgSewadarPhoto.Size = new System.Drawing.Size(165, 222);
            this.ImgSewadarPhoto.TabIndex = 51;
            this.ImgSewadarPhoto.TabStop = false;
            this.ImgSewadarPhoto.Title = "";
            this.ImgSewadarPhoto.ImageChanged += new System.EventHandler<System.EventArgs>(this.ImgSewadarPhoto_ImageChanged);
            // 
            // dtmBirthDate
            // 
            this.dtmBirthDate.AllowFutureDate = true;
            this.dtmBirthDate.AllowsNew = false;
            this.dtmBirthDate.AllowsReference = false;
            this.dtmBirthDate.AllowsUpdate = false;
            this.dtmBirthDate.ApplicationIdForDbConnection = null;
            this.dtmBirthDate.BackColor = System.Drawing.Color.Transparent;
            this.dtmBirthDate.CalledScreenApplicationId = null;
            this.dtmBirthDate.CalledScreenTypeName = null;
            this.dtmBirthDate.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.dtmBirthDate, 3);
            this.dtmBirthDate.DisplayText = null;
            this.dtmBirthDate.DisplayTextAsDateTime = null;
            this.dtmBirthDate.DisplayTextBindingKey = "birth_dtm";
            this.dtmBirthDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmBirthDate.EditingControlDataGridView = null;
            this.dtmBirthDate.EditingControlFormattedValue = null;
            this.dtmBirthDate.EditingControlRowIndex = 0;
            this.dtmBirthDate.EditingControlValueChanged = false;
            this.dtmBirthDate.EnableToolTip = false;
            this.dtmBirthDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtmBirthDate.IdText = "";
            this.dtmBirthDate.IdTextBindingKey = null;
            this.dtmBirthDate.Location = new System.Drawing.Point(154, 99);
            this.dtmBirthDate.Lookup = true;
            this.dtmBirthDate.LookupColumns = null;
            this.dtmBirthDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtmBirthDate.LookupResult = null;
            this.dtmBirthDate.LookupTitle = "Birth Date";
            this.dtmBirthDate.Mandatory = true;
            this.dtmBirthDate.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtmBirthDate.MaxCharacterLength = 20;
            this.dtmBirthDate.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtmBirthDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtmBirthDate.MinCharactersForQuery = 0;
            this.dtmBirthDate.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtmBirthDate.MinValue = new System.DateTime(((long)(0)));
            this.dtmBirthDate.Name = "dtmBirthDate";
            this.dtmBirthDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtmBirthDate.PascalCase = false;
            this.dtmBirthDate.RangeInQueryMode = true;
            this.dtmBirthDate.ReadOnly = false;
            this.dtmBirthDate.RegularExpressionValidator = null;
            this.dtmBirthDate.ShowTime = true;
            this.dtmBirthDate.Size = new System.Drawing.Size(280, 55);
            this.dtmBirthDate.TabIndex = 8;
            this.dtmBirthDate.Title = "Birth Date";
            this.dtmBirthDate.ToolTipLookupField = "information";
            this.dtmBirthDate.ValueText = "";
            this.dtmBirthDate.Validating += new System.ComponentModel.CancelEventHandler(this.dtmBirthDate_Validating);
            this.dtmBirthDate.Validated += new System.EventHandler(this.dtmBirthDate_Validated);
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
            this.tlpBase.SetColumnSpan(this.txtRemarks, 2);
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
            this.txtRemarks.Location = new System.Drawing.Point(911, 202);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.LookupTitle = "Remarks";
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.txtRemarks.MaxCharacterLength = 32767;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 46);
            this.txtRemarks.MinCharactersForQuery = 0;
            this.txtRemarks.MinimumSize = new System.Drawing.Size(11, 22);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.RegularExpressionValidator = null;
            this.txtRemarks.Size = new System.Drawing.Size(186, 46);
            this.txtRemarks.TabIndex = 51;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
            // 
            // cmbRemarksType
            // 
            this.cmbRemarksType.ApplicationIdForDbConnection = null;
            this.cmbRemarksType.BackColor = System.Drawing.Color.Transparent;
            this.cmbRemarksType.DisplayText = "";
            this.cmbRemarksType.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbRemarksType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbRemarksType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbRemarksType.Location = new System.Drawing.Point(735, 202);
            this.cmbRemarksType.Mandatory = false;
            this.cmbRemarksType.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.cmbRemarksType.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbRemarksType.MinimumSize = new System.Drawing.Size(11, 22);
            this.cmbRemarksType.Name = "cmbRemarksType";
            this.cmbRemarksType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbRemarksType.ReadOnly = false;
            this.cmbRemarksType.SelectedIndex = -1;
            this.cmbRemarksType.SelectedItem = null;
            this.cmbRemarksType.SelectedText = "";
            this.cmbRemarksType.SelectedValue = null;
            this.cmbRemarksType.SelectedValueBindingKey = null;
            this.cmbRemarksType.Size = new System.Drawing.Size(168, 44);
            this.cmbRemarksType.TabIndex = 52;
            this.cmbRemarksType.Title = "Remarks Type";
            this.cmbRemarksType.ValueText = null;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewadar_id,
            this.first_nm,
            this.middle_nm,
            this.last_nm,
            this.gender,
            this.birth_dtm,
            this.age,
            this.is_married,
            this.initiation_dt,
            this.initiation_place_id,
            this.place_nm,
            this.initiation_by,
            this.satsang_centre_id,
            this.global_sewadar_status_cd,
            this.global_sewadar_status_dt,
            this.sewadar_grno,
            this.sewadar_status_nm,
            this.sewadar_status_dtm,
            this.centre_nm,
            this.department_nm,
            this.department_dt,
            this.appointment_dt,
            this.txn_ts,
            this.photo_date});
            this.grdList.DeleteRowMenuEnabled = true;
            this.grdList.DeleteVisible = true;
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
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
            this.grdList.Size = new System.Drawing.Size(345, 658);
            this.grdList.TabIndex = 25;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // sewadar_id
            // 
            this.sewadar_id.BindingKey = "sewadar_id";
            this.sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewadar_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.sewadar_id.HeaderText = "ID";
            this.sewadar_id.Lookup = false;
            this.sewadar_id.LookupColumns = "";
            this.sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_id.Mandatory = false;
            this.sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.sewadar_id.MinimumWidth = 6;
            this.sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.sewadar_id.Name = "sewadar_id";
            this.sewadar_id.PercentageWidth = 10F;
            this.sewadar_id.ReadOnly = true;
            this.sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_id.ToolTipLookupField = "information";
            this.sewadar_id.Width = 33;
            // 
            // first_nm
            // 
            this.first_nm.BindingKey = "first_nm";
            this.first_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.first_nm.HeaderText = "First Name";
            this.first_nm.Lookup = false;
            this.first_nm.LookupColumns = "";
            this.first_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.first_nm.Mandatory = false;
            this.first_nm.MaxCharacterLength = 2147483647;
            this.first_nm.MinimumWidth = 6;
            this.first_nm.Name = "first_nm";
            this.first_nm.PercentageWidth = 10F;
            this.first_nm.ReadOnly = true;
            this.first_nm.RegularExpressionValidator = "";
            this.first_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.first_nm.ToolTipLookupField = "information";
            this.first_nm.Width = 33;
            // 
            // middle_nm
            // 
            this.middle_nm.BindingKey = "middle_nm";
            this.middle_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.middle_nm.HeaderText = "middle_nm";
            this.middle_nm.Lookup = false;
            this.middle_nm.LookupColumns = "";
            this.middle_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.middle_nm.Mandatory = false;
            this.middle_nm.MaxCharacterLength = 2147483647;
            this.middle_nm.MinimumWidth = 6;
            this.middle_nm.Name = "middle_nm";
            this.middle_nm.PercentageWidth = 25F;
            this.middle_nm.ReadOnly = true;
            this.middle_nm.RegularExpressionValidator = "";
            this.middle_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.middle_nm.ToolTipLookupField = "information";
            this.middle_nm.Visible = false;
            this.middle_nm.Width = 125;
            // 
            // last_nm
            // 
            this.last_nm.BindingKey = "last_nm";
            this.last_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.last_nm.HeaderText = "Last Name";
            this.last_nm.Lookup = false;
            this.last_nm.LookupColumns = "";
            this.last_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.last_nm.Mandatory = false;
            this.last_nm.MaxCharacterLength = 2147483647;
            this.last_nm.MinimumWidth = 6;
            this.last_nm.Name = "last_nm";
            this.last_nm.PercentageWidth = 10F;
            this.last_nm.ReadOnly = true;
            this.last_nm.RegularExpressionValidator = "";
            this.last_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.last_nm.ToolTipLookupField = "information";
            this.last_nm.Width = 33;
            // 
            // gender
            // 
            this.gender.BindingKey = "gender";
            this.gender.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.gender.HeaderText = "Gender";
            this.gender.Lookup = false;
            this.gender.LookupColumns = "";
            this.gender.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.gender.Mandatory = false;
            this.gender.MaxCharacterLength = 2147483647;
            this.gender.MinimumWidth = 6;
            this.gender.Name = "gender";
            this.gender.PercentageWidth = 10F;
            this.gender.ReadOnly = true;
            this.gender.RegularExpressionValidator = "";
            this.gender.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gender.ToolTipLookupField = "information";
            this.gender.Width = 33;
            // 
            // birth_dtm
            // 
            this.birth_dtm.BindingKey = "birth_dtm";
            this.birth_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.birth_dtm.DefaultCellStyle = dataGridViewCellStyle3;
            this.birth_dtm.HeaderText = "birth_dtm";
            this.birth_dtm.Lookup = false;
            this.birth_dtm.LookupColumns = "";
            this.birth_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.birth_dtm.Mandatory = false;
            this.birth_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.birth_dtm.MinimumWidth = 6;
            this.birth_dtm.MinValue = new System.DateTime(((long)(0)));
            this.birth_dtm.Name = "birth_dtm";
            this.birth_dtm.PercentageWidth = 25F;
            this.birth_dtm.ReadOnly = true;
            this.birth_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.birth_dtm.ToolTipLookupField = "information";
            this.birth_dtm.Visible = false;
            this.birth_dtm.Width = 125;
            // 
            // age
            // 
            this.age.BindingKey = "age";
            this.age.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.age.DefaultCellStyle = dataGridViewCellStyle4;
            this.age.HeaderText = "Age";
            this.age.Lookup = false;
            this.age.LookupColumns = "";
            this.age.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.age.Mandatory = false;
            this.age.MaxValue = ((long)(9223372036854775807));
            this.age.MinimumWidth = 6;
            this.age.MinValue = ((long)(-9223372036854775808));
            this.age.Name = "age";
            this.age.PercentageWidth = 8F;
            this.age.ReadOnly = true;
            this.age.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.age.ToolTipLookupField = "information";
            this.age.Width = 26;
            // 
            // is_married
            // 
            this.is_married.BindingKey = "is_married";
            this.is_married.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_married.DefaultCellStyle = dataGridViewCellStyle5;
            this.is_married.HeaderText = "Married?";
            this.is_married.Lookup = false;
            this.is_married.LookupColumns = "";
            this.is_married.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_married.Mandatory = false;
            this.is_married.MinimumWidth = 6;
            this.is_married.Name = "is_married";
            this.is_married.PercentageWidth = 7F;
            this.is_married.ReadOnly = true;
            this.is_married.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_married.ToolTipLookupField = "information";
            this.is_married.Width = 23;
            // 
            // initiation_dt
            // 
            this.initiation_dt.BindingKey = "initiation_dt";
            this.initiation_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.initiation_dt.DefaultCellStyle = dataGridViewCellStyle6;
            this.initiation_dt.HeaderText = "initiation_dt";
            this.initiation_dt.Lookup = false;
            this.initiation_dt.LookupColumns = "";
            this.initiation_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.initiation_dt.Mandatory = false;
            this.initiation_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.initiation_dt.MinimumWidth = 6;
            this.initiation_dt.MinValue = new System.DateTime(((long)(0)));
            this.initiation_dt.Name = "initiation_dt";
            this.initiation_dt.PercentageWidth = 25F;
            this.initiation_dt.ReadOnly = true;
            this.initiation_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.initiation_dt.ToolTipLookupField = "information";
            this.initiation_dt.Visible = false;
            this.initiation_dt.Width = 125;
            // 
            // initiation_place_id
            // 
            this.initiation_place_id.BindingKey = "initiation_place_id";
            this.initiation_place_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.initiation_place_id.DefaultCellStyle = dataGridViewCellStyle7;
            this.initiation_place_id.HeaderText = "initiation_place_id";
            this.initiation_place_id.Lookup = false;
            this.initiation_place_id.LookupColumns = "";
            this.initiation_place_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.initiation_place_id.Mandatory = false;
            this.initiation_place_id.MaxValue = ((long)(9223372036854775807));
            this.initiation_place_id.MinimumWidth = 6;
            this.initiation_place_id.MinValue = ((long)(-9223372036854775808));
            this.initiation_place_id.Name = "initiation_place_id";
            this.initiation_place_id.PercentageWidth = 25F;
            this.initiation_place_id.ReadOnly = true;
            this.initiation_place_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.initiation_place_id.ToolTipLookupField = "information";
            this.initiation_place_id.Visible = false;
            this.initiation_place_id.Width = 125;
            // 
            // place_nm
            // 
            this.place_nm.BindingKey = "place_nm";
            this.place_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.place_nm.HeaderText = "place_nm";
            this.place_nm.Lookup = false;
            this.place_nm.LookupColumns = "";
            this.place_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.place_nm.Mandatory = false;
            this.place_nm.MaxCharacterLength = 2147483647;
            this.place_nm.MinimumWidth = 6;
            this.place_nm.Name = "place_nm";
            this.place_nm.PercentageWidth = 25F;
            this.place_nm.ReadOnly = true;
            this.place_nm.RegularExpressionValidator = "";
            this.place_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.place_nm.ToolTipLookupField = "information";
            this.place_nm.Visible = false;
            this.place_nm.Width = 125;
            // 
            // initiation_by
            // 
            this.initiation_by.BindingKey = "initiation_by";
            this.initiation_by.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.initiation_by.DefaultCellStyle = dataGridViewCellStyle8;
            this.initiation_by.HeaderText = "initiation_by";
            this.initiation_by.Lookup = false;
            this.initiation_by.LookupColumns = "";
            this.initiation_by.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.initiation_by.Mandatory = false;
            this.initiation_by.MaxValue = ((long)(9223372036854775807));
            this.initiation_by.MinimumWidth = 6;
            this.initiation_by.MinValue = ((long)(-9223372036854775808));
            this.initiation_by.Name = "initiation_by";
            this.initiation_by.PercentageWidth = 25F;
            this.initiation_by.ReadOnly = true;
            this.initiation_by.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.initiation_by.ToolTipLookupField = "information";
            this.initiation_by.Visible = false;
            this.initiation_by.Width = 125;
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = "satsang_centre_id";
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle9;
            this.satsang_centre_id.HeaderText = "satsang_centre_id";
            this.satsang_centre_id.Lookup = false;
            this.satsang_centre_id.LookupColumns = "";
            this.satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.satsang_centre_id.Mandatory = false;
            this.satsang_centre_id.MaxValue = ((long)(9223372036854775807));
            this.satsang_centre_id.MinimumWidth = 6;
            this.satsang_centre_id.MinValue = ((long)(-9223372036854775808));
            this.satsang_centre_id.Name = "satsang_centre_id";
            this.satsang_centre_id.PercentageWidth = 25F;
            this.satsang_centre_id.ReadOnly = true;
            this.satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.satsang_centre_id.ToolTipLookupField = "information";
            this.satsang_centre_id.Visible = false;
            this.satsang_centre_id.Width = 125;
            // 
            // global_sewadar_status_cd
            // 
            this.global_sewadar_status_cd.BindingKey = "global_sewadar_status_cd";
            this.global_sewadar_status_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.global_sewadar_status_cd.HeaderText = "global_sewadar_status_cd";
            this.global_sewadar_status_cd.Lookup = false;
            this.global_sewadar_status_cd.LookupColumns = "";
            this.global_sewadar_status_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.global_sewadar_status_cd.Mandatory = false;
            this.global_sewadar_status_cd.MaxCharacterLength = 2147483647;
            this.global_sewadar_status_cd.MinimumWidth = 6;
            this.global_sewadar_status_cd.Name = "global_sewadar_status_cd";
            this.global_sewadar_status_cd.PercentageWidth = 25F;
            this.global_sewadar_status_cd.ReadOnly = true;
            this.global_sewadar_status_cd.RegularExpressionValidator = "";
            this.global_sewadar_status_cd.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.global_sewadar_status_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.global_sewadar_status_cd.ToolTipLookupField = "information";
            this.global_sewadar_status_cd.Visible = false;
            this.global_sewadar_status_cd.Width = 125;
            // 
            // global_sewadar_status_dt
            // 
            this.global_sewadar_status_dt.BindingKey = "global_sewadar_status_dt";
            this.global_sewadar_status_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.global_sewadar_status_dt.DefaultCellStyle = dataGridViewCellStyle10;
            this.global_sewadar_status_dt.HeaderText = "global_sewadar_status_dt";
            this.global_sewadar_status_dt.Lookup = false;
            this.global_sewadar_status_dt.LookupColumns = "";
            this.global_sewadar_status_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.global_sewadar_status_dt.Mandatory = false;
            this.global_sewadar_status_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.global_sewadar_status_dt.MinimumWidth = 6;
            this.global_sewadar_status_dt.MinValue = new System.DateTime(((long)(0)));
            this.global_sewadar_status_dt.Name = "global_sewadar_status_dt";
            this.global_sewadar_status_dt.PercentageWidth = 25F;
            this.global_sewadar_status_dt.ReadOnly = true;
            this.global_sewadar_status_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.global_sewadar_status_dt.ToolTipLookupField = "information";
            this.global_sewadar_status_dt.Visible = false;
            this.global_sewadar_status_dt.Width = 125;
            // 
            // sewadar_grno
            // 
            this.sewadar_grno.BindingKey = "sewadar_grno";
            this.sewadar_grno.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_grno.HeaderText = "sewadar_grno";
            this.sewadar_grno.Lookup = false;
            this.sewadar_grno.LookupColumns = "";
            this.sewadar_grno.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_grno.Mandatory = false;
            this.sewadar_grno.MaxCharacterLength = 2147483647;
            this.sewadar_grno.MinimumWidth = 6;
            this.sewadar_grno.Name = "sewadar_grno";
            this.sewadar_grno.PercentageWidth = 25F;
            this.sewadar_grno.ReadOnly = true;
            this.sewadar_grno.RegularExpressionValidator = "";
            this.sewadar_grno.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno.ToolTipLookupField = "information";
            this.sewadar_grno.Visible = false;
            this.sewadar_grno.Width = 125;
            // 
            // sewadar_status_nm
            // 
            this.sewadar_status_nm.BindingKey = "sewadar_status_nm";
            this.sewadar_status_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_status_nm.HeaderText = "sewadar_status_nm";
            this.sewadar_status_nm.Lookup = false;
            this.sewadar_status_nm.LookupColumns = "";
            this.sewadar_status_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_nm.Mandatory = false;
            this.sewadar_status_nm.MaxCharacterLength = 2147483647;
            this.sewadar_status_nm.MinimumWidth = 6;
            this.sewadar_status_nm.Name = "sewadar_status_nm";
            this.sewadar_status_nm.PercentageWidth = 25F;
            this.sewadar_status_nm.ReadOnly = true;
            this.sewadar_status_nm.RegularExpressionValidator = "";
            this.sewadar_status_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_nm.ToolTipLookupField = "information";
            this.sewadar_status_nm.Visible = false;
            this.sewadar_status_nm.Width = 125;
            // 
            // sewadar_status_dtm
            // 
            this.sewadar_status_dtm.BindingKey = "sewadar_status_dtm";
            this.sewadar_status_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.sewadar_status_dtm.DefaultCellStyle = dataGridViewCellStyle11;
            this.sewadar_status_dtm.HeaderText = "sewadar_status_dtm";
            this.sewadar_status_dtm.Lookup = false;
            this.sewadar_status_dtm.LookupColumns = "";
            this.sewadar_status_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_dtm.Mandatory = false;
            this.sewadar_status_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.sewadar_status_dtm.MinimumWidth = 6;
            this.sewadar_status_dtm.MinValue = new System.DateTime(((long)(0)));
            this.sewadar_status_dtm.Name = "sewadar_status_dtm";
            this.sewadar_status_dtm.PercentageWidth = 25F;
            this.sewadar_status_dtm.ReadOnly = true;
            this.sewadar_status_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_dtm.ToolTipLookupField = "information";
            this.sewadar_status_dtm.Visible = false;
            this.sewadar_status_dtm.Width = 125;
            // 
            // centre_nm
            // 
            this.centre_nm.BindingKey = "centre_nm";
            this.centre_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.centre_nm.HeaderText = "Centre";
            this.centre_nm.Lookup = false;
            this.centre_nm.LookupColumns = "";
            this.centre_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.centre_nm.Mandatory = false;
            this.centre_nm.MaxCharacterLength = 2147483647;
            this.centre_nm.MinimumWidth = 6;
            this.centre_nm.Name = "centre_nm";
            this.centre_nm.PercentageWidth = 20F;
            this.centre_nm.ReadOnly = true;
            this.centre_nm.RegularExpressionValidator = "";
            this.centre_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.centre_nm.ToolTipLookupField = "information";
            this.centre_nm.Width = 66;
            // 
            // department_nm
            // 
            this.department_nm.BindingKey = "department_nm";
            this.department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.department_nm.HeaderText = "Department";
            this.department_nm.Lookup = false;
            this.department_nm.LookupColumns = "";
            this.department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_nm.Mandatory = false;
            this.department_nm.MaxCharacterLength = 2147483647;
            this.department_nm.MinimumWidth = 6;
            this.department_nm.Name = "department_nm";
            this.department_nm.PercentageWidth = 15F;
            this.department_nm.ReadOnly = true;
            this.department_nm.RegularExpressionValidator = "";
            this.department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_nm.ToolTipLookupField = "information";
            this.department_nm.Width = 49;
            // 
            // department_dt
            // 
            this.department_dt.BindingKey = "department_dt";
            this.department_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.department_dt.DefaultCellStyle = dataGridViewCellStyle12;
            this.department_dt.HeaderText = "department_dt";
            this.department_dt.Lookup = false;
            this.department_dt.LookupColumns = "";
            this.department_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_dt.Mandatory = false;
            this.department_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.department_dt.MinimumWidth = 6;
            this.department_dt.MinValue = new System.DateTime(((long)(0)));
            this.department_dt.Name = "department_dt";
            this.department_dt.PercentageWidth = 25F;
            this.department_dt.ReadOnly = true;
            this.department_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_dt.ToolTipLookupField = "information";
            this.department_dt.Visible = false;
            this.department_dt.Width = 125;
            // 
            // appointment_dt
            // 
            this.appointment_dt.BindingKey = "appointment_dt";
            this.appointment_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle13.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.appointment_dt.DefaultCellStyle = dataGridViewCellStyle13;
            this.appointment_dt.HeaderText = "Appointment Date";
            this.appointment_dt.Lookup = false;
            this.appointment_dt.LookupColumns = "";
            this.appointment_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.appointment_dt.Mandatory = false;
            this.appointment_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.appointment_dt.MinimumWidth = 6;
            this.appointment_dt.MinValue = new System.DateTime(((long)(0)));
            this.appointment_dt.Name = "appointment_dt";
            this.appointment_dt.PercentageWidth = 10F;
            this.appointment_dt.ReadOnly = true;
            this.appointment_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.appointment_dt.ToolTipLookupField = "information";
            this.appointment_dt.Width = 33;
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
            this.txn_ts.MinimumWidth = 6;
            this.txn_ts.Name = "txn_ts";
            this.txn_ts.PercentageWidth = 25F;
            this.txn_ts.ReadOnly = true;
            this.txn_ts.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txn_ts.ToolTipLookupField = "information";
            this.txn_ts.Visible = false;
            this.txn_ts.Width = 125;
            // 
            // photo_date
            // 
            this.photo_date.BindingKey = "photo_dt";
            this.photo_date.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle14.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.photo_date.DefaultCellStyle = dataGridViewCellStyle14;
            this.photo_date.HeaderText = "Column1";
            this.photo_date.Lookup = false;
            this.photo_date.LookupColumns = "";
            this.photo_date.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.photo_date.Mandatory = false;
            this.photo_date.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.photo_date.MinimumWidth = 6;
            this.photo_date.MinValue = new System.DateTime(((long)(0)));
            this.photo_date.Name = "photo_date";
            this.photo_date.PercentageWidth = 25F;
            this.photo_date.ReadOnly = true;
            this.photo_date.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.photo_date.ToolTipLookupField = "information";
            this.photo_date.Visible = false;
            this.photo_date.Width = 125;
            // 
            // Sewadars
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1284, 658);
            this.Controls.Add(this.scListOrBrowse);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Sewadars";
            this.Text = "Sewadars";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.scListOrBrowse)).EndInit();
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpBase.ResumeLayout(false);
            this.tlpBase.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdRemarks)).EndInit();
            this.tlpSewadarPhoto.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intSewadarId;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtFirstName;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtMiddleName;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSurName;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkMarried;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtmBirthDate;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intAge;
        private DCC.ZOS.ZSM.Controls.Combos.SewadarStatusCombo sewadarStatusCombo1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtInitiation;
        private DCC.UMB.CDBLookups.InitiationPlacesLookup initiationPlacesLookup1;
        private DCC.UMB.CDBControls.DropDown.PatronCombo patronCombo1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSewadarStatus;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtmSewadarStatus;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtCurrentDepartment;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtDepJoiningDate;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtAppDate;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdRemarks;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpSewadarPhoto;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtGRNo;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtGlobalStatus;
        private DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo zsmGenderCombo1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.ZSMMainSatsangCentresLookup zsmSatsangCentresLookup1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtPhotoDate;
        private DCC.UMB.CDF.UIControls.TextControls.DCCImageBox ImgSewadarPhoto;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn remarks_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn remarks_sq;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewadar_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn first_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn middle_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn last_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gender;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn birth_dtm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn age;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_married;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn initiation_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn initiation_place_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn place_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn initiation_by;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn global_sewadar_status_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn global_sewadar_status_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn sewadar_status_dtm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn centre_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn department_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn appointment_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn photo_date;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtRemarks;
        private UMB.CDF.UIControls.TextControls.DCCComboBox cmbRemarksType;


    }
}
