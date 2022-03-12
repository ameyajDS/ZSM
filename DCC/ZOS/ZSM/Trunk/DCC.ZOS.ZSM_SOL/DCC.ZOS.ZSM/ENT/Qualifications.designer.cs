namespace DCC.ZOS.ZSM.ENT
{
    partial class Qualifications
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Qualifications));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.txtCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intQualID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.lookupQualificationTypes = new DCC.ZOS.ZSM.Controls.ZSMLookups.QualificationTypesLookup();
            this.txtQualName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtmEffectiveRange = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.tlpContainer = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.grdSubjects = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.dccLabel1 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.qualification_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.qualification_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.qualification_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.qualification_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Effective_From = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.Effective_Till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
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
            this.qlfctn_subject_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.effective_from_subject = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.effective_till_subject = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.old_qlfctn_subject_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.dtmEffectiveRange.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSubjects)).BeginInit();
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
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 29.26566F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 45.24838F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.48596F));
            this.tableLayoutPanel1.Controls.Add(this.txtCode, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.intQualID, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.lookupQualificationTypes, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtQualName, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.dtmEffectiveRange, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.txtRemarks, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.grdSubjects, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.dccLabel1, 1, 2);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 55F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(927, 512);
            this.tableLayoutPanel1.TabIndex = 0;
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
            this.txtCode.DisplayText = "";
            this.txtCode.DisplayTextBindingKey = "qualification_cd";
            this.txtCode.Dock = System.Windows.Forms.DockStyle.Right;
            this.txtCode.EditingControlDataGridView = null;
            this.txtCode.EditingControlFormattedValue = "";
            this.txtCode.EditingControlRowIndex = 0;
            this.txtCode.EditingControlValueChanged = false;
            this.txtCode.EnableToolTip = false;
            this.txtCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCode.IdText = null;
            this.txtCode.IdTextBindingKey = null;
            this.txtCode.Location = new System.Drawing.Point(168, 3);
            this.txtCode.Lookup = false;
            this.txtCode.LookupColumns = null;
            this.txtCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCode.LookupResult = null;
            this.txtCode.Mandatory = true;
            this.txtCode.Margin = new System.Windows.Forms.Padding(140, 3, 3, 3);
            this.txtCode.MaxCharacterLength = 8;
            this.txtCode.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtCode.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtCode.Name = "txtCode";
            this.txtCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtCode.PascalCase = false;
            this.txtCode.RangeInQueryMode = false;
            this.txtCode.ReadOnly = false;
            this.txtCode.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtCode.Size = new System.Drawing.Size(100, 44);
            this.txtCode.TabIndex = 0;
            this.txtCode.Title = "Code";
            this.txtCode.ToolTipLookupField = "information";
            this.txtCode.ValueText = null;
            // 
            // intQualID
            // 
            this.intQualID.AllowsNew = false;
            this.intQualID.AllowsReference = false;
            this.intQualID.AllowsUpdate = false;
            this.intQualID.ApplicationIdForDbConnection = null;
            this.intQualID.BackColor = System.Drawing.Color.Transparent;
            this.intQualID.CalledScreenApplicationId = null;
            this.intQualID.CalledScreenTypeName = null;
            this.intQualID.CallingScreenType = null;
            this.intQualID.DisplayText = "";
            this.intQualID.DisplayTextBindingKey = "qualification_id";
            this.intQualID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intQualID.EditingControlDataGridView = null;
            this.intQualID.EditingControlFormattedValue = "";
            this.intQualID.EditingControlRowIndex = 0;
            this.intQualID.EditingControlValueChanged = false;
            this.intQualID.EnableToolTip = false;
            this.intQualID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intQualID.IdText = null;
            this.intQualID.IdTextBindingKey = "qualification_id";
            this.intQualID.Location = new System.Drawing.Point(694, 3);
            this.intQualID.Lookup = false;
            this.intQualID.LookupColumns = null;
            this.intQualID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intQualID.LookupResult = null;
            this.intQualID.Mandatory = false;
            this.intQualID.Margin = new System.Windows.Forms.Padding(4, 3, 150, 3);
            this.intQualID.MaxCharacterLength = 32767;
            this.intQualID.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intQualID.MaxValue = ((long)(9223372036854775807));
            this.intQualID.MinimumSize = new System.Drawing.Size(10, 22);
            this.intQualID.MinValue = ((long)(-9223372036854775808));
            this.intQualID.Name = "intQualID";
            this.intQualID.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intQualID.PascalCase = false;
            this.intQualID.RangeInQueryMode = false;
            this.intQualID.ReadOnly = true;
            this.intQualID.RegularExpressionValidator = null;
            this.intQualID.Size = new System.Drawing.Size(83, 45);
            this.intQualID.TabIndex = 2;
            this.intQualID.TabStop = false;
            this.intQualID.Title = "ID";
            this.intQualID.ToolTipLookupField = null;
            this.intQualID.ValueText = null;
            // 
            // lookupQualificationTypes
            // 
            this.lookupQualificationTypes.AllowsNew = false;
            this.lookupQualificationTypes.AllowsReference = false;
            this.lookupQualificationTypes.AllowsUpdate = false;
            this.lookupQualificationTypes.BackColor = System.Drawing.Color.Transparent;
            this.lookupQualificationTypes.CalledScreenApplicationId = null;
            this.lookupQualificationTypes.CalledScreenTypeName = null;
            this.lookupQualificationTypes.CallingScreenType = null;
            this.lookupQualificationTypes.DisplayText = "";
            this.lookupQualificationTypes.DisplayTextBindingKey = "qualification_type";
            this.lookupQualificationTypes.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lookupQualificationTypes.EditingControlDataGridView = null;
            this.lookupQualificationTypes.EditingControlFormattedValue = null;
            this.lookupQualificationTypes.EditingControlRowIndex = 0;
            this.lookupQualificationTypes.EditingControlValueChanged = true;
            this.lookupQualificationTypes.EnableToolTip = false;
            this.lookupQualificationTypes.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lookupQualificationTypes.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lookupQualificationTypes.IdText = null;
            this.lookupQualificationTypes.IdTextBindingKey = "qualification_type";
            this.lookupQualificationTypes.Location = new System.Drawing.Point(275, 3);
            this.lookupQualificationTypes.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lookupQualificationTypes.LookupResult = null;
            this.lookupQualificationTypes.Mandatory = true;
            this.lookupQualificationTypes.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.lookupQualificationTypes.MaxCharacterLength = 32767;
            this.lookupQualificationTypes.MaximumSize = new System.Drawing.Size(1300, 45);
            this.lookupQualificationTypes.MinimumSize = new System.Drawing.Size(10, 22);
            this.lookupQualificationTypes.Name = "lookupQualificationTypes";
            this.lookupQualificationTypes.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lookupQualificationTypes.PascalCase = false;
            this.lookupQualificationTypes.RangeInQueryMode = false;
            this.lookupQualificationTypes.ReadOnly = false;
            this.lookupQualificationTypes.RegularExpressionValidator = null;
            this.lookupQualificationTypes.Size = new System.Drawing.Size(411, 45);
            this.lookupQualificationTypes.TabIndex = 1;
            this.lookupQualificationTypes.Title = "Qualification Type";
            this.lookupQualificationTypes.ToolTipLookupField = "information";
            this.lookupQualificationTypes.ValueText = null;
            // 
            // txtQualName
            // 
            this.txtQualName.AllowsNew = false;
            this.txtQualName.AllowsReference = false;
            this.txtQualName.AllowsUpdate = false;
            this.txtQualName.ApplicationIdForDbConnection = null;
            this.txtQualName.BackColor = System.Drawing.Color.Transparent;
            this.txtQualName.CalledScreenApplicationId = null;
            this.txtQualName.CalledScreenTypeName = null;
            this.txtQualName.CallingScreenType = null;
            this.txtQualName.DisplayText = "";
            this.txtQualName.DisplayTextBindingKey = "qualification_nm";
            this.txtQualName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtQualName.EditingControlDataGridView = null;
            this.txtQualName.EditingControlFormattedValue = "";
            this.txtQualName.EditingControlRowIndex = 0;
            this.txtQualName.EditingControlValueChanged = false;
            this.txtQualName.EnableToolTip = false;
            this.txtQualName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtQualName.IdText = null;
            this.txtQualName.IdTextBindingKey = "qualification_nm";
            this.txtQualName.Location = new System.Drawing.Point(275, 54);
            this.txtQualName.Lookup = false;
            this.txtQualName.LookupColumns = null;
            this.txtQualName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtQualName.LookupResult = null;
            this.txtQualName.Mandatory = true;
            this.txtQualName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtQualName.MaxCharacterLength = 35;
            this.txtQualName.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtQualName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtQualName.Name = "txtQualName";
            this.txtQualName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtQualName.PascalCase = false;
            this.txtQualName.RangeInQueryMode = false;
            this.txtQualName.ReadOnly = false;
            this.txtQualName.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtQualName.Size = new System.Drawing.Size(411, 44);
            this.txtQualName.TabIndex = 3;
            this.txtQualName.Title = "Qualification Name";
            this.txtQualName.ToolTipLookupField = "information";
            this.txtQualName.ValueText = null;
            // 
            // dtmEffectiveRange
            // 
            this.dtmEffectiveRange.Controls.Add(this.tlpContainer);
            this.dtmEffectiveRange.DiscreteInQueryMode = true;
            this.dtmEffectiveRange.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmEffectiveRange.FillDefailtValuesInInsertMode = true;
            this.dtmEffectiveRange.FromDate = null;
            this.dtmEffectiveRange.FromDateFieldBindingKey = "effective_from";
            this.dtmEffectiveRange.FromDateMandatory = true;
            this.dtmEffectiveRange.FromDateTitle = "Effective From";
            this.dtmEffectiveRange.Location = new System.Drawing.Point(274, 462);
            this.dtmEffectiveRange.Name = "dtmEffectiveRange";
            this.dtmEffectiveRange.ReadOnly = false;
            this.dtmEffectiveRange.Size = new System.Drawing.Size(413, 47);
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
            this.tlpContainer.Size = new System.Drawing.Size(413, 45);
            this.tlpContainer.TabIndex = 2;
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
            this.tableLayoutPanel1.SetColumnSpan(this.txtRemarks, 3);
            this.txtRemarks.DisplayText = "";
            this.txtRemarks.DisplayTextBindingKey = "remarks";
            this.txtRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRemarks.EditingControlDataGridView = null;
            this.txtRemarks.EditingControlFormattedValue = "";
            this.txtRemarks.EditingControlRowIndex = 0;
            this.txtRemarks.EditingControlValueChanged = false;
            this.txtRemarks.EnableToolTip = false;
            this.txtRemarks.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRemarks.IdText = null;
            this.txtRemarks.IdTextBindingKey = null;
            this.txtRemarks.Location = new System.Drawing.Point(140, 411);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(140, 3, 140, 3);
            this.txtRemarks.MaxCharacterLength = 200;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtRemarks.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtRemarks.Size = new System.Drawing.Size(647, 44);
            this.txtRemarks.TabIndex = 5;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
            // 
            // grdSubjects
            // 
            this.grdSubjects.AllowRowSorting = false;
            this.grdSubjects.AllowUserToAddRows = false;
            this.grdSubjects.AutoAddNewRowForUser = false;
            this.grdSubjects.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSubjects.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.qlfctn_subject_id,
            this.effective_from_subject,
            this.effective_till_subject,
            this.old_qlfctn_subject_id});
            this.grdSubjects.DeleteRowMenuEnabled = true;
            this.grdSubjects.DeleteVisible = true;
            this.grdSubjects.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSubjects.ExportToExcelVisible = true;
            this.grdSubjects.InsertAfterVisible = true;
            this.grdSubjects.InsertBeforeVisible = true;
            this.grdSubjects.InsertLastVisible = true;
            this.grdSubjects.InsertRowsMenuItemsEnabled = true;
            this.grdSubjects.Location = new System.Drawing.Point(274, 130);
            this.grdSubjects.Mandatory = false;
            this.grdSubjects.MoveDownVisible = false;
            this.grdSubjects.MoveUpVisible = false;
            this.grdSubjects.MultiSelect = false;
            this.grdSubjects.Name = "grdSubjects";
            this.grdSubjects.RowHeadersWidth = 15;
            this.grdSubjects.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdSubjects.ShowCommandStrip = false;
            this.grdSubjects.Size = new System.Drawing.Size(413, 275);
            this.grdSubjects.TabIndex = 4;
            this.grdSubjects.Title = null;
            this.grdSubjects.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdSubjects.VirtualMode = true;
            this.grdSubjects.FillDefaultCellValues += new System.EventHandler<DCC.UMB.CDF.UIControls.Grid.FillDefaultCellValuesEventArgs>(this.grdSubjects_FillDefaultCellValues);
            this.grdSubjects.ValidateRow += new System.EventHandler<DCC.UMB.CDF.UIControls.Grid.ValidateRowEventArgs>(this.grdSubjects_ValidateRow);
            // 
            // dccLabel1
            // 
            this.dccLabel1.AutoSize = true;
            this.dccLabel1.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dccLabel1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel1.Location = new System.Drawing.Point(274, 113);
            this.dccLabel1.Name = "dccLabel1";
            this.dccLabel1.Size = new System.Drawing.Size(413, 14);
            this.dccLabel1.TabIndex = 12;
            this.dccLabel1.Text = "Subjects";
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle4;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.qualification_id,
            this.qualification_type,
            this.qualification_cd,
            this.qualification_nm,
            this.Effective_From,
            this.Effective_Till,
            this.txn_ts,
            this.remarks});
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
            // qualification_id
            // 
            this.qualification_id.BindingKey = "qualification_id";
            this.qualification_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.qualification_id.DefaultCellStyle = dataGridViewCellStyle5;
            this.qualification_id.HeaderText = "Id";
            this.qualification_id.Lookup = false;
            this.qualification_id.LookupColumns = "";
            this.qualification_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qualification_id.Mandatory = true;
            this.qualification_id.MaxValue = ((long)(9223372036854775807));
            this.qualification_id.MinValue = ((long)(-9223372036854775808));
            this.qualification_id.Name = "qualification_id";
            this.qualification_id.PercentageWidth = 5;
            this.qualification_id.ReadOnly = true;
            this.qualification_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qualification_id.ToolTipLookupField = "information";
            this.qualification_id.Width = 5;
            // 
            // qualification_type
            // 
            this.qualification_type.BindingKey = "qualification_type";
            this.qualification_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.qualification_type.HeaderText = "Qualification Type";
            this.qualification_type.Lookup = false;
            this.qualification_type.LookupColumns = "";
            this.qualification_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qualification_type.Mandatory = false;
            this.qualification_type.MaxCharacterLength = 2147483647;
            this.qualification_type.Name = "qualification_type";
            this.qualification_type.PercentageWidth = 15;
            this.qualification_type.ReadOnly = true;
            this.qualification_type.RegularExpressionValidator = "";
            this.qualification_type.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.qualification_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qualification_type.ToolTipLookupField = "information";
            this.qualification_type.Width = 5;
            // 
            // qualification_cd
            // 
            this.qualification_cd.BindingKey = "qualification_cd";
            this.qualification_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.qualification_cd.HeaderText = "Code";
            this.qualification_cd.Lookup = false;
            this.qualification_cd.LookupColumns = "";
            this.qualification_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qualification_cd.Mandatory = true;
            this.qualification_cd.MaxCharacterLength = 2147483647;
            this.qualification_cd.Name = "qualification_cd";
            this.qualification_cd.PercentageWidth = 10;
            this.qualification_cd.ReadOnly = true;
            this.qualification_cd.RegularExpressionValidator = "";
            this.qualification_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qualification_cd.ToolTipLookupField = "information";
            this.qualification_cd.Width = 5;
            // 
            // qualification_nm
            // 
            this.qualification_nm.BindingKey = "qualification_nm";
            this.qualification_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.qualification_nm.HeaderText = "Name";
            this.qualification_nm.Lookup = false;
            this.qualification_nm.LookupColumns = "";
            this.qualification_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qualification_nm.Mandatory = true;
            this.qualification_nm.MaxCharacterLength = 2147483647;
            this.qualification_nm.Name = "qualification_nm";
            this.qualification_nm.PercentageWidth = 20;
            this.qualification_nm.ReadOnly = true;
            this.qualification_nm.RegularExpressionValidator = "";
            this.qualification_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qualification_nm.ToolTipLookupField = "information";
            this.qualification_nm.Width = 5;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_From.DefaultCellStyle = dataGridViewCellStyle6;
            this.Effective_From.HeaderText = "Effective_From";
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
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_Till.DefaultCellStyle = dataGridViewCellStyle7;
            this.Effective_Till.HeaderText = "Effective_Till";
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
            // remarks
            // 
            this.remarks.BindingKey = "remarks";
            this.remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.remarks.HeaderText = "remarks";
            this.remarks.Lookup = false;
            this.remarks.LookupColumns = "";
            this.remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.remarks.Mandatory = false;
            this.remarks.MaxCharacterLength = 2147483647;
            this.remarks.Name = "remarks";
            this.remarks.PercentageWidth = 30;
            this.remarks.ReadOnly = true;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Width = 5;
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
            // qlfctn_subject_id
            // 
            this.qlfctn_subject_id.BindingKey = "qlfctn_subject_id";
            this.qlfctn_subject_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.qlfctn_subject_id.HeaderText = "Subject";
            this.qlfctn_subject_id.Lookup = true;
            this.qlfctn_subject_id.LookupColumns = resources.GetString("qlfctn_subject_id.LookupColumns");
            this.qlfctn_subject_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qlfctn_subject_id.Mandatory = true;
            this.qlfctn_subject_id.MaxCharacterLength = 2147483647;
            this.qlfctn_subject_id.Name = "qlfctn_subject_id";
            this.qlfctn_subject_id.PercentageWidth = 45;
            this.qlfctn_subject_id.RegularExpressionValidator = "";
            this.qlfctn_subject_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qlfctn_subject_id.ToolTipLookupField = "information";
            this.qlfctn_subject_id.Width = 179;
            // 
            // effective_from_subject
            // 
            this.effective_from_subject.BindingKey = "effective_from_subject";
            this.effective_from_subject.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.effective_from_subject.DefaultCellStyle = dataGridViewCellStyle1;
            this.effective_from_subject.HeaderText = "Effective From";
            this.effective_from_subject.Lookup = false;
            this.effective_from_subject.LookupColumns = "";
            this.effective_from_subject.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.effective_from_subject.Mandatory = true;
            this.effective_from_subject.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effective_from_subject.MinValue = new System.DateTime(((long)(0)));
            this.effective_from_subject.Name = "effective_from_subject";
            this.effective_from_subject.PercentageWidth = 30;
            this.effective_from_subject.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.effective_from_subject.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effective_from_subject.ToolTipLookupField = "information";
            this.effective_from_subject.Width = 119;
            // 
            // effective_till_subject
            // 
            this.effective_till_subject.BindingKey = "effective_till_subject";
            this.effective_till_subject.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.effective_till_subject.DefaultCellStyle = dataGridViewCellStyle2;
            this.effective_till_subject.HeaderText = "Effective Till";
            this.effective_till_subject.Lookup = false;
            this.effective_till_subject.LookupColumns = "";
            this.effective_till_subject.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.effective_till_subject.Mandatory = true;
            this.effective_till_subject.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effective_till_subject.MinValue = new System.DateTime(((long)(0)));
            this.effective_till_subject.Name = "effective_till_subject";
            this.effective_till_subject.PercentageWidth = 25;
            this.effective_till_subject.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.effective_till_subject.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effective_till_subject.ToolTipLookupField = "information";
            this.effective_till_subject.Width = 99;
            // 
            // old_qlfctn_subject_id
            // 
            this.old_qlfctn_subject_id.BindingKey = "old_qlfctn_subject_id";
            this.old_qlfctn_subject_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.old_qlfctn_subject_id.DefaultCellStyle = dataGridViewCellStyle3;
            this.old_qlfctn_subject_id.HeaderText = "old_qlfctn_subject_id";
            this.old_qlfctn_subject_id.Lookup = false;
            this.old_qlfctn_subject_id.LookupColumns = "";
            this.old_qlfctn_subject_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_qlfctn_subject_id.Mandatory = false;
            this.old_qlfctn_subject_id.MaxValue = ((long)(9223372036854775807));
            this.old_qlfctn_subject_id.MinValue = ((long)(-9223372036854775808));
            this.old_qlfctn_subject_id.Name = "old_qlfctn_subject_id";
            this.old_qlfctn_subject_id.PercentageWidth = 25;
            this.old_qlfctn_subject_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_qlfctn_subject_id.ToolTipLookupField = "information";
            this.old_qlfctn_subject_id.Visible = false;
            // 
            // Qualifications
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(956, 512);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "Qualifications";
            this.Text = "Zonal Sewadar Management - [QUALIFICATION]";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.dtmEffectiveRange.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSubjects)).EndInit();
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
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intQualID;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.QualificationTypesLookup lookupQualificationTypes;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtCode;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtQualName;
        private DCC.UMB.CDF.UIControls.TextControls.DateRangePair dtmEffectiveRange;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpContainer;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSubjects;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtRemarks;
        private DCC.UMB.CDF.UIControls.DCCLabel dccLabel1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn qualification_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qualification_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qualification_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qualification_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qlfctn_subject_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_from_subject;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_till_subject;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn old_qlfctn_subject_id;
    }
}