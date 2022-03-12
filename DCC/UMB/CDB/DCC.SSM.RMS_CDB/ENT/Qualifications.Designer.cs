namespace DCC.UMB.CDB2.ENT
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Qualifications));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.cmbType = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.txtCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtDescription = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.grpSubjects = new System.Windows.Forms.GroupBox();
            this.grdSubjects = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.SubjectID = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Subject_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.effectiveFrom = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.OldEffectiveFrom = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.OldEffectiveTill = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.effectiveTill = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextArea();
            this.txtEffectiveTill = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.txtEffectiveFrom = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.qualificationid = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.qualification_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.qualification_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.qualification_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.qualification_remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Effective_From = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.Effective_Till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.grpSubjects.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSubjects)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.tableLayoutPanel1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.grdList);
            this.splitContainer1.Size = new System.Drawing.Size(956, 512);
            this.splitContainer1.SplitterDistance = 927;
            this.splitContainer1.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.cmbType, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtCode, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtDescription, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.grpSubjects, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtRemarks, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.txtEffectiveTill, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtEffectiveFrom, 0, 4);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.570313F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.375F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.39063F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.203125F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.74219F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.32813F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(927, 512);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // cmbType
            // 
            this.cmbType.ApplicationIdForDbConnection = null;
            this.cmbType.BackColor = System.Drawing.Color.Transparent;
            this.cmbType.DisplayText = "";
            this.cmbType.Dock = System.Windows.Forms.DockStyle.Left;
            this.cmbType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbType.Location = new System.Drawing.Point(467, 3);
            this.cmbType.Mandatory = true;
            this.cmbType.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbType.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbType.MinimumSize = new System.Drawing.Size(10, 22);
            this.cmbType.Name = "cmbType";
            this.cmbType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbType.ReadOnly = false;
            this.cmbType.SelectedIndex = -1;
            this.cmbType.SelectedItem = null;
            this.cmbType.SelectedText = "";
            this.cmbType.SelectedValue = null;
            this.cmbType.SelectedValueBindingKey = null;
            this.cmbType.Size = new System.Drawing.Size(138, 43);
            this.cmbType.TabIndex = 1;
            this.cmbType.Title = "Type";
            this.cmbType.ValueText = null;
            this.cmbType.Load += new System.EventHandler(this.Qualifications_Load);
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
            this.txtCode.DisplayTextBindingKey = null;
            this.txtCode.Dock = System.Windows.Forms.DockStyle.Right;
            this.txtCode.EditingControlDataGridView = null;
            this.txtCode.EditingControlFormattedValue = "";
            this.txtCode.EditingControlRowIndex = 0;
            this.txtCode.EditingControlValueChanged = false;
            this.txtCode.EnableToolTip = false;
            this.txtCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCode.IdText = null;
            this.txtCode.IdTextBindingKey = null;
            this.txtCode.Location = new System.Drawing.Point(334, 3);
            this.txtCode.Lookup = false;
            this.txtCode.LookupColumns = null;
            this.txtCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCode.LookupResult = null;
            this.txtCode.Mandatory = true;
            this.txtCode.Margin = new System.Windows.Forms.Padding(150, 3, 50, 3);
            this.txtCode.MaxCharacterLength = 8;
            this.txtCode.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtCode.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtCode.Name = "txtCode";
            this.txtCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtCode.PascalCase = false;
            this.txtCode.RangeInQueryMode = false;
            this.txtCode.ReadOnly = false;
            this.txtCode.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtCode.Size = new System.Drawing.Size(79, 43);
            this.txtCode.TabIndex = 0;
            this.txtCode.Title = "Code";
            this.txtCode.ToolTipLookupField = "information";
            this.txtCode.ValueText = null;
            // 
            // txtDescription
            // 
            this.txtDescription.AllowsNew = false;
            this.txtDescription.AllowsReference = false;
            this.txtDescription.AllowsUpdate = false;
            this.txtDescription.ApplicationIdForDbConnection = null;
            this.txtDescription.BackColor = System.Drawing.Color.Transparent;
            this.txtDescription.CalledScreenApplicationId = null;
            this.txtDescription.CalledScreenTypeName = null;
            this.txtDescription.CallingScreenType = null;
            this.tableLayoutPanel1.SetColumnSpan(this.txtDescription, 2);
            this.txtDescription.DisplayText = "";
            this.txtDescription.DisplayTextBindingKey = null;
            this.txtDescription.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDescription.EditingControlDataGridView = null;
            this.txtDescription.EditingControlFormattedValue = "";
            this.txtDescription.EditingControlRowIndex = 0;
            this.txtDescription.EditingControlValueChanged = false;
            this.txtDescription.EnableToolTip = false;
            this.txtDescription.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDescription.IdText = null;
            this.txtDescription.IdTextBindingKey = null;
            this.txtDescription.Location = new System.Drawing.Point(200, 52);
            this.txtDescription.Lookup = false;
            this.txtDescription.LookupColumns = null;
            this.txtDescription.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtDescription.LookupResult = null;
            this.txtDescription.Mandatory = true;
            this.txtDescription.Margin = new System.Windows.Forms.Padding(200, 3, 200, 3);
            this.txtDescription.MaxCharacterLength = 30;
            this.txtDescription.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtDescription.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtDescription.Name = "txtDescription";
            this.txtDescription.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtDescription.PascalCase = false;
            this.txtDescription.RangeInQueryMode = false;
            this.txtDescription.ReadOnly = false;
            this.txtDescription.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtDescription.Size = new System.Drawing.Size(527, 42);
            this.txtDescription.TabIndex = 2;
            this.txtDescription.Title = "Description";
            this.txtDescription.ToolTipLookupField = "information";
            this.txtDescription.ValueText = null;
            // 
            // grpSubjects
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.grpSubjects, 2);
            this.grpSubjects.Controls.Add(this.grdSubjects);
            this.grpSubjects.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpSubjects.Location = new System.Drawing.Point(200, 100);
            this.grpSubjects.Margin = new System.Windows.Forms.Padding(200, 3, 200, 3);
            this.grpSubjects.Name = "grpSubjects";
            this.grpSubjects.Size = new System.Drawing.Size(527, 253);
            this.grpSubjects.TabIndex = 3;
            this.grpSubjects.TabStop = false;
            this.grpSubjects.Text = "Subjects";
            // 
            // grdSubjects
            // 
            this.grdSubjects.AllowRowSorting = false;
            this.grdSubjects.AllowUserToAddRows = false;
            this.grdSubjects.AutoAddNewRowForUser = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdSubjects.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdSubjects.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSubjects.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.SubjectID,
            this.Subject_nm,
            this.effectiveFrom,
            this.OldEffectiveFrom,
            this.OldEffectiveTill,
            this.effectiveTill});
            this.grdSubjects.DeleteRowMenuEnabled = true;
            this.grdSubjects.DeleteVisible = true;
            this.grdSubjects.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSubjects.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdSubjects.ExportToExcelVisible = true;
            this.grdSubjects.InsertAfterVisible = true;
            this.grdSubjects.InsertBeforeVisible = true;
            this.grdSubjects.InsertLastVisible = true;
            this.grdSubjects.InsertRowsMenuItemsEnabled = true;
            this.grdSubjects.Location = new System.Drawing.Point(3, 16);
            this.grdSubjects.Mandatory = false;
            this.grdSubjects.MoveDownVisible = false;
            this.grdSubjects.MoveUpVisible = false;
            this.grdSubjects.MultiSelect = false;
            this.grdSubjects.Name = "grdSubjects";
            this.grdSubjects.RowHeadersWidth = 15;
            this.grdSubjects.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdSubjects.ShowCommandStrip = false;
            this.grdSubjects.Size = new System.Drawing.Size(521, 234);
            this.grdSubjects.TabIndex = 3;
            this.grdSubjects.Title = null;
            this.grdSubjects.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdSubjects.VirtualMode = true;
            this.grdSubjects.ValidateRow += new System.EventHandler<DCC.UMB.CDF.UIControls.Grid.ValidateRowEventArgs>(this.grdSubjects_ValidateRow);
            this.grdSubjects.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.grdSubjects_LookupResultSet);
            // 
            // SubjectID
            // 
            this.SubjectID.BindingKey = "qlfctn_subject_id";
            this.SubjectID.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.SubjectID.HeaderText = "SubjectID";
            this.SubjectID.Lookup = false;
            this.SubjectID.LookupColumns = "";
            this.SubjectID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.SubjectID.Mandatory = false;
            this.SubjectID.MaxCharacterLength = 2147483647;
            this.SubjectID.Name = "SubjectID";
            this.SubjectID.PercentageWidth = 5;
            this.SubjectID.RegularExpressionValidator = "";
            this.SubjectID.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.SubjectID.ToolTipLookupField = "information";
            this.SubjectID.Visible = false;
            this.SubjectID.Width = 25;
            // 
            // Subject_nm
            // 
            this.Subject_nm.BindingKey = "qlfctn_subject_nm";
            this.Subject_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.Subject_nm.HeaderText = "Subject";
            this.Subject_nm.Lookup = true;
            this.Subject_nm.LookupColumns = resources.GetString("Subject_nm.LookupColumns");
            this.Subject_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Subject_nm.Mandatory = true;
            this.Subject_nm.MaxCharacterLength = 2147483647;
            this.Subject_nm.Name = "Subject_nm";
            this.Subject_nm.PercentageWidth = 50;
            this.Subject_nm.RegularExpressionValidator = "";
            this.Subject_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Subject_nm.ToolTipLookupField = "information";
            this.Subject_nm.Width = 253;
            // 
            // effectiveFrom
            // 
            this.effectiveFrom.BindingKey = "effective_from";
            this.effectiveFrom.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.effectiveFrom.DefaultCellStyle = dataGridViewCellStyle2;
            this.effectiveFrom.HeaderText = "Effective From";
            this.effectiveFrom.Lookup = false;
            this.effectiveFrom.LookupColumns = "";
            this.effectiveFrom.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.effectiveFrom.Mandatory = false;
            this.effectiveFrom.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effectiveFrom.MinValue = new System.DateTime(((long)(0)));
            this.effectiveFrom.Name = "effectiveFrom";
            this.effectiveFrom.PercentageWidth = 25;
            this.effectiveFrom.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.effectiveFrom.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effectiveFrom.ToolTipLookupField = "information";
            this.effectiveFrom.Width = 126;
            // 
            // OldEffectiveFrom
            // 
            this.OldEffectiveFrom.BindingKey = "effective_from";
            this.OldEffectiveFrom.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.OldEffectiveFrom.DefaultCellStyle = dataGridViewCellStyle3;
            this.OldEffectiveFrom.HeaderText = "OldEffectiveFrom";
            this.OldEffectiveFrom.Lookup = false;
            this.OldEffectiveFrom.LookupColumns = "";
            this.OldEffectiveFrom.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.OldEffectiveFrom.Mandatory = false;
            this.OldEffectiveFrom.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.OldEffectiveFrom.MinValue = new System.DateTime(((long)(0)));
            this.OldEffectiveFrom.Name = "OldEffectiveFrom";
            this.OldEffectiveFrom.PercentageWidth = 25;
            this.OldEffectiveFrom.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.OldEffectiveFrom.ToolTipLookupField = "information";
            this.OldEffectiveFrom.Visible = false;
            this.OldEffectiveFrom.Width = 126;
            // 
            // OldEffectiveTill
            // 
            this.OldEffectiveTill.BindingKey = "effective_till";
            this.OldEffectiveTill.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.OldEffectiveTill.DefaultCellStyle = dataGridViewCellStyle4;
            this.OldEffectiveTill.HeaderText = "OldEffectiveTill";
            this.OldEffectiveTill.Lookup = false;
            this.OldEffectiveTill.LookupColumns = "";
            this.OldEffectiveTill.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.OldEffectiveTill.Mandatory = false;
            this.OldEffectiveTill.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.OldEffectiveTill.MinValue = new System.DateTime(((long)(0)));
            this.OldEffectiveTill.Name = "OldEffectiveTill";
            this.OldEffectiveTill.PercentageWidth = 25;
            this.OldEffectiveTill.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.OldEffectiveTill.ToolTipLookupField = "information";
            this.OldEffectiveTill.Visible = false;
            this.OldEffectiveTill.Width = 126;
            // 
            // effectiveTill
            // 
            this.effectiveTill.BindingKey = "effective_till";
            this.effectiveTill.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.effectiveTill.DefaultCellStyle = dataGridViewCellStyle5;
            this.effectiveTill.HeaderText = "Effective Till";
            this.effectiveTill.Lookup = false;
            this.effectiveTill.LookupColumns = "";
            this.effectiveTill.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.effectiveTill.Mandatory = false;
            this.effectiveTill.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effectiveTill.MinValue = new System.DateTime(((long)(0)));
            this.effectiveTill.Name = "effectiveTill";
            this.effectiveTill.PercentageWidth = 25;
            this.effectiveTill.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.effectiveTill.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effectiveTill.ToolTipLookupField = "information";
            this.effectiveTill.Width = 126;
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
            this.tableLayoutPanel1.SetColumnSpan(this.txtRemarks, 2);
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
            this.txtRemarks.Location = new System.Drawing.Point(200, 359);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(200, 3, 200, 3);
            this.txtRemarks.MaxCharacterLength = 200;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 2000);
            this.txtRemarks.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.RegularExpressionValidator = "";
            this.txtRemarks.Size = new System.Drawing.Size(527, 36);
            this.txtRemarks.TabIndex = 4;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
            // 
            // txtEffectiveTill
            // 
            this.txtEffectiveTill.AllowsNew = false;
            this.txtEffectiveTill.AllowsReference = false;
            this.txtEffectiveTill.AllowsUpdate = false;
            this.txtEffectiveTill.ApplicationIdForDbConnection = null;
            this.txtEffectiveTill.BackColor = System.Drawing.Color.Transparent;
            this.txtEffectiveTill.CalledScreenApplicationId = null;
            this.txtEffectiveTill.CalledScreenTypeName = null;
            this.txtEffectiveTill.CallingScreenType = null;
            this.txtEffectiveTill.DisplayText = null;
            this.txtEffectiveTill.DisplayTextAsDateTime = null;
            this.txtEffectiveTill.DisplayTextBindingKey = null;
            this.txtEffectiveTill.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtEffectiveTill.EditingControlDataGridView = null;
            this.txtEffectiveTill.EditingControlFormattedValue = null;
            this.txtEffectiveTill.EditingControlRowIndex = 0;
            this.txtEffectiveTill.EditingControlValueChanged = true;
            this.txtEffectiveTill.EnableToolTip = false;
            this.txtEffectiveTill.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEffectiveTill.IdText = "";
            this.txtEffectiveTill.IdTextBindingKey = null;
            this.txtEffectiveTill.Location = new System.Drawing.Point(467, 401);
            this.txtEffectiveTill.Lookup = true;
            this.txtEffectiveTill.LookupColumns = null;
            this.txtEffectiveTill.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtEffectiveTill.LookupResult = null;
            this.txtEffectiveTill.Mandatory = true;
            this.txtEffectiveTill.Margin = new System.Windows.Forms.Padding(4, 3, 250, 3);
            this.txtEffectiveTill.MaxCharacterLength = 32767;
            this.txtEffectiveTill.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtEffectiveTill.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.txtEffectiveTill.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtEffectiveTill.MinValue = new System.DateTime(((long)(0)));
            this.txtEffectiveTill.Name = "txtEffectiveTill";
            this.txtEffectiveTill.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtEffectiveTill.PascalCase = false;
            this.txtEffectiveTill.RangeInQueryMode = false;
            this.txtEffectiveTill.ReadOnly = false;
            this.txtEffectiveTill.RegularExpressionValidator = "";
            this.txtEffectiveTill.ShowTime = false;
            this.txtEffectiveTill.Size = new System.Drawing.Size(210, 44);
            this.txtEffectiveTill.TabIndex = 6;
            this.txtEffectiveTill.Title = "Effective Till";
            this.txtEffectiveTill.ToolTipLookupField = "information";
            this.txtEffectiveTill.ValueText = "";
            // 
            // txtEffectiveFrom
            // 
            this.txtEffectiveFrom.AllowsNew = false;
            this.txtEffectiveFrom.AllowsReference = false;
            this.txtEffectiveFrom.AllowsUpdate = false;
            this.txtEffectiveFrom.ApplicationIdForDbConnection = null;
            this.txtEffectiveFrom.BackColor = System.Drawing.Color.Transparent;
            this.txtEffectiveFrom.CalledScreenApplicationId = null;
            this.txtEffectiveFrom.CalledScreenTypeName = null;
            this.txtEffectiveFrom.CallingScreenType = null;
            this.txtEffectiveFrom.DisplayText = null;
            this.txtEffectiveFrom.DisplayTextAsDateTime = null;
            this.txtEffectiveFrom.DisplayTextBindingKey = null;
            this.txtEffectiveFrom.Dock = System.Windows.Forms.DockStyle.Right;
            this.txtEffectiveFrom.EditingControlDataGridView = null;
            this.txtEffectiveFrom.EditingControlFormattedValue = null;
            this.txtEffectiveFrom.EditingControlRowIndex = 0;
            this.txtEffectiveFrom.EditingControlValueChanged = false;
            this.txtEffectiveFrom.EnableToolTip = false;
            this.txtEffectiveFrom.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEffectiveFrom.IdText = "";
            this.txtEffectiveFrom.IdTextBindingKey = null;
            this.txtEffectiveFrom.Location = new System.Drawing.Point(288, 401);
            this.txtEffectiveFrom.Lookup = true;
            this.txtEffectiveFrom.LookupColumns = null;
            this.txtEffectiveFrom.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtEffectiveFrom.LookupResult = null;
            this.txtEffectiveFrom.Mandatory = true;
            this.txtEffectiveFrom.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtEffectiveFrom.MaxCharacterLength = 32767;
            this.txtEffectiveFrom.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtEffectiveFrom.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.txtEffectiveFrom.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtEffectiveFrom.MinValue = new System.DateTime(((long)(0)));
            this.txtEffectiveFrom.Name = "txtEffectiveFrom";
            this.txtEffectiveFrom.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtEffectiveFrom.PascalCase = false;
            this.txtEffectiveFrom.RangeInQueryMode = false;
            this.txtEffectiveFrom.ReadOnly = false;
            this.txtEffectiveFrom.RegularExpressionValidator = "";
            this.txtEffectiveFrom.ShowTime = false;
            this.txtEffectiveFrom.Size = new System.Drawing.Size(171, 45);
            this.txtEffectiveFrom.TabIndex = 5;
            this.txtEffectiveFrom.Title = "Effective From";
            this.txtEffectiveFrom.ToolTipLookupField = "information";
            this.txtEffectiveFrom.ValueText = "";
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle6.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle6.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle6.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle6.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle6.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle6;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.qualificationid,
            this.qualification_type,
            this.qualification_cd,
            this.qualification_nm,
            this.qualification_remarks,
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
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(25, 512);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // qualificationid
            // 
            this.qualificationid.BindingKey = "qualification_id";
            this.qualificationid.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.qualificationid.DefaultCellStyle = dataGridViewCellStyle7;
            this.qualificationid.HeaderText = "Id";
            this.qualificationid.Lookup = false;
            this.qualificationid.LookupColumns = "";
            this.qualificationid.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qualificationid.Mandatory = false;
            this.qualificationid.MaxValue = ((long)(9223372036854775807));
            this.qualificationid.MinValue = ((long)(-9223372036854775808));
            this.qualificationid.Name = "qualificationid";
            this.qualificationid.PercentageWidth = 25;
            this.qualificationid.ReadOnly = true;
            this.qualificationid.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qualificationid.ToolTipLookupField = "information";
            this.qualificationid.Visible = false;
            this.qualificationid.Width = 5;
            // 
            // qualification_type
            // 
            this.qualification_type.BindingKey = "qualification_type";
            this.qualification_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.qualification_type.HeaderText = "Type";
            this.qualification_type.Lookup = false;
            this.qualification_type.LookupColumns = "";
            this.qualification_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qualification_type.Mandatory = false;
            this.qualification_type.MaxCharacterLength = 2147483647;
            this.qualification_type.Name = "qualification_type";
            this.qualification_type.PercentageWidth = 25;
            this.qualification_type.ReadOnly = true;
            this.qualification_type.RegularExpressionValidator = "";
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
            this.qualification_cd.Mandatory = false;
            this.qualification_cd.MaxCharacterLength = 2147483647;
            this.qualification_cd.Name = "qualification_cd";
            this.qualification_cd.PercentageWidth = 25;
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
            this.qualification_nm.Mandatory = false;
            this.qualification_nm.MaxCharacterLength = 2147483647;
            this.qualification_nm.Name = "qualification_nm";
            this.qualification_nm.PercentageWidth = 25;
            this.qualification_nm.ReadOnly = true;
            this.qualification_nm.RegularExpressionValidator = "";
            this.qualification_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qualification_nm.ToolTipLookupField = "information";
            this.qualification_nm.Width = 5;
            // 
            // qualification_remarks
            // 
            this.qualification_remarks.BindingKey = "Remarks";
            this.qualification_remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.qualification_remarks.HeaderText = "Remarks";
            this.qualification_remarks.Lookup = false;
            this.qualification_remarks.LookupColumns = "";
            this.qualification_remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.qualification_remarks.Mandatory = false;
            this.qualification_remarks.MaxCharacterLength = 2147483647;
            this.qualification_remarks.Name = "qualification_remarks";
            this.qualification_remarks.PercentageWidth = 25;
            this.qualification_remarks.ReadOnly = true;
            this.qualification_remarks.RegularExpressionValidator = "";
            this.qualification_remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qualification_remarks.ToolTipLookupField = "information";
            this.qualification_remarks.Width = 5;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_From.DefaultCellStyle = dataGridViewCellStyle8;
            this.Effective_From.HeaderText = "Effective_From";
            this.Effective_From.Lookup = false;
            this.Effective_From.LookupColumns = "";
            this.Effective_From.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_From.Mandatory = false;
            this.Effective_From.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_From.MinValue = new System.DateTime(((long)(0)));
            this.Effective_From.Name = "Effective_From";
            this.Effective_From.PercentageWidth = 25;
            this.Effective_From.ReadOnly = true;
            this.Effective_From.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Effective_From.ToolTipLookupField = "information";
            this.Effective_From.Width = 5;
            // 
            // Effective_Till
            // 
            this.Effective_Till.BindingKey = "effective_till";
            this.Effective_Till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_Till.DefaultCellStyle = dataGridViewCellStyle9;
            this.Effective_Till.HeaderText = "Effective_Till";
            this.Effective_Till.Lookup = false;
            this.Effective_Till.LookupColumns = "";
            this.Effective_Till.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_Till.Mandatory = false;
            this.Effective_Till.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_Till.MinValue = new System.DateTime(((long)(0)));
            this.Effective_Till.Name = "Effective_Till";
            this.Effective_Till.PercentageWidth = 25;
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
            // Qualifications
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(956, 512);
            this.Controls.Add(this.splitContainer1);
            this.Name = "Qualifications";
            this.Text = "Residents Management System - [QUALIFICATIONS]";
            this.Load += new System.EventHandler(this.Qualifications_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.grpSubjects.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSubjects)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtCode;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtDescription;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextArea txtRemarks;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtEffectiveTill;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.TextControls.DCCComboBox cmbType;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtEffectiveFrom;
        private System.Windows.Forms.GroupBox grpSubjects;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSubjects;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn qualificationid;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qualification_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qualification_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qualification_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qualification_remarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn SubjectID;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn Subject_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effectiveFrom;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn OldEffectiveFrom;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn OldEffectiveTill;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effectiveTill;
    }
}