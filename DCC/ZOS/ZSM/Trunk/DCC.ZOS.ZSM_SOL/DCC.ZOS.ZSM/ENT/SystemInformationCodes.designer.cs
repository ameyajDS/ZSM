namespace DCC.ZOS.ZSM.ENT
{
    partial class SystemInformationCodes
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SystemInformationCodes));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scBrowseOrList = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.grdSystemInfoValues = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.txtCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.system_info_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.system_info_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_info_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.grd_info_value = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.value_int = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.value_varchar = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.value_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.value_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.scBrowseOrList.Panel1.SuspendLayout();
            this.scBrowseOrList.Panel2.SuspendLayout();
            this.scBrowseOrList.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSystemInfoValues)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.SuspendLayout();
            // 
            // scBrowseOrList
            // 
            this.scBrowseOrList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.scBrowseOrList.Location = new System.Drawing.Point(0, 0);
            this.scBrowseOrList.Name = "scBrowseOrList";
            // 
            // scBrowseOrList.Panel1
            // 
            this.scBrowseOrList.Panel1.Controls.Add(this.tableLayoutPanel1);
            // 
            // scBrowseOrList.Panel2
            // 
            this.scBrowseOrList.Panel2.Controls.Add(this.grdList);
            this.scBrowseOrList.Size = new System.Drawing.Size(956, 512);
            this.scBrowseOrList.SplitterDistance = 927;
            this.scBrowseOrList.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 45.84682F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 54.15318F));
            this.tableLayoutPanel1.Controls.Add(this.grdSystemInfoValues, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.txtCode, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtName, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtRemarks, 0, 2);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 5;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.570313F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.39063F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.203125F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.74219F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.32813F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(927, 512);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // grdSystemInfoValues
            // 
            this.grdSystemInfoValues.AllowRowSorting = false;
            this.grdSystemInfoValues.AllowUserToAddRows = false;
            this.grdSystemInfoValues.AutoAddNewRowForUser = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdSystemInfoValues.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdSystemInfoValues.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSystemInfoValues.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.grd_info_value,
            this.value_int,
            this.value_varchar,
            this.value_dt,
            this.value_dtm});
            this.tableLayoutPanel1.SetColumnSpan(this.grdSystemInfoValues, 2);
            this.grdSystemInfoValues.DeleteRowMenuEnabled = true;
            this.grdSystemInfoValues.DeleteVisible = true;
            this.grdSystemInfoValues.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSystemInfoValues.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdSystemInfoValues.ExportToExcelVisible = true;
            this.grdSystemInfoValues.InsertAfterVisible = true;
            this.grdSystemInfoValues.InsertBeforeVisible = true;
            this.grdSystemInfoValues.InsertLastVisible = true;
            this.grdSystemInfoValues.InsertRowsMenuItemsEnabled = true;
            this.grdSystemInfoValues.Location = new System.Drawing.Point(3, 57);
            this.grdSystemInfoValues.Mandatory = false;
            this.grdSystemInfoValues.MoveDownVisible = false;
            this.grdSystemInfoValues.MoveUpVisible = false;
            this.grdSystemInfoValues.MultiSelect = false;
            this.grdSystemInfoValues.Name = "grdSystemInfoValues";
            this.grdSystemInfoValues.RowHeadersWidth = 15;
            this.grdSystemInfoValues.ShowCommandStrip = false;
            this.grdSystemInfoValues.Size = new System.Drawing.Size(921, 279);
            this.grdSystemInfoValues.TabIndex = 8;
            this.grdSystemInfoValues.Title = null;
            this.grdSystemInfoValues.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdSystemInfoValues.VirtualMode = true;
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
            this.txtCode.DisplayTextBindingKey = "system_info_cd";
            this.txtCode.Dock = System.Windows.Forms.DockStyle.Right;
            this.txtCode.EditingControlDataGridView = null;
            this.txtCode.EditingControlFormattedValue = "";
            this.txtCode.EditingControlRowIndex = 0;
            this.txtCode.EditingControlValueChanged = false;
            this.txtCode.EnableToolTip = false;
            this.txtCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCode.IdText = null;
            this.txtCode.IdTextBindingKey = null;
            this.txtCode.Location = new System.Drawing.Point(245, 3);
            this.txtCode.Lookup = false;
            this.txtCode.LookupColumns = null;
            this.txtCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCode.LookupResult = null;
            this.txtCode.Mandatory = true;
            this.txtCode.Margin = new System.Windows.Forms.Padding(150, 3, 3, 3);
            this.txtCode.MaxCharacterLength = 15;
            this.txtCode.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtCode.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtCode.Name = "txtCode";
            this.txtCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtCode.PascalCase = false;
            this.txtCode.RangeInQueryMode = false;
            this.txtCode.ReadOnly = false;
            this.txtCode.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtCode.Size = new System.Drawing.Size(177, 44);
            this.txtCode.TabIndex = 0;
            this.txtCode.Title = "Code";
            this.txtCode.ToolTipLookupField = "information";
            this.txtCode.ValueText = null;
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
            this.txtName.DisplayText = "";
            this.txtName.DisplayTextBindingKey = "system_info_nm";
            this.txtName.Dock = System.Windows.Forms.DockStyle.Left;
            this.txtName.EditingControlDataGridView = null;
            this.txtName.EditingControlFormattedValue = "";
            this.txtName.EditingControlRowIndex = 0;
            this.txtName.EditingControlValueChanged = false;
            this.txtName.EnableToolTip = false;
            this.txtName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.IdText = null;
            this.txtName.IdTextBindingKey = null;
            this.txtName.Location = new System.Drawing.Point(428, 3);
            this.txtName.Lookup = false;
            this.txtName.LookupColumns = null;
            this.txtName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtName.LookupResult = null;
            this.txtName.Mandatory = true;
            this.txtName.Margin = new System.Windows.Forms.Padding(3, 3, 50, 3);
            this.txtName.MaxCharacterLength = 30;
            this.txtName.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtName.Name = "txtName";
            this.txtName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtName.PascalCase = false;
            this.txtName.RangeInQueryMode = false;
            this.txtName.ReadOnly = false;
            this.txtName.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtName.Size = new System.Drawing.Size(408, 44);
            this.txtName.TabIndex = 7;
            this.txtName.Title = "Name";
            this.txtName.ToolTipLookupField = "information";
            this.txtName.ValueText = null;
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
            this.txtRemarks.DisplayTextBindingKey = "Remarks";
            this.txtRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRemarks.EditingControlDataGridView = null;
            this.txtRemarks.EditingControlFormattedValue = "";
            this.txtRemarks.EditingControlRowIndex = 0;
            this.txtRemarks.EditingControlValueChanged = false;
            this.txtRemarks.EnableToolTip = false;
            this.txtRemarks.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRemarks.IdText = null;
            this.txtRemarks.IdTextBindingKey = null;
            this.txtRemarks.Location = new System.Drawing.Point(120, 342);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(120, 3, 50, 3);
            this.txtRemarks.MaxCharacterLength = 100;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtRemarks.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtRemarks.Size = new System.Drawing.Size(757, 40);
            this.txtRemarks.TabIndex = 9;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle5;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.system_info_cd,
            this.system_info_nm,
            this.old_info_cd,
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
            // system_info_cd
            // 
            this.system_info_cd.BindingKey = "system_info_cd";
            this.system_info_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.system_info_cd.HeaderText = "Code";
            this.system_info_cd.Lookup = false;
            this.system_info_cd.LookupColumns = "";
            this.system_info_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.system_info_cd.Mandatory = false;
            this.system_info_cd.MaxCharacterLength = 2147483647;
            this.system_info_cd.Name = "system_info_cd";
            this.system_info_cd.PercentageWidth = 33;
            this.system_info_cd.ReadOnly = true;
            this.system_info_cd.RegularExpressionValidator = "";
            this.system_info_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.system_info_cd.ToolTipLookupField = "information";
            this.system_info_cd.Width = 5;
            // 
            // system_info_nm
            // 
            this.system_info_nm.BindingKey = "system_info_nm";
            this.system_info_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.system_info_nm.HeaderText = "Name";
            this.system_info_nm.Lookup = false;
            this.system_info_nm.LookupColumns = "";
            this.system_info_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.system_info_nm.Mandatory = false;
            this.system_info_nm.MaxCharacterLength = 2147483647;
            this.system_info_nm.Name = "system_info_nm";
            this.system_info_nm.PercentageWidth = 33;
            this.system_info_nm.ReadOnly = true;
            this.system_info_nm.RegularExpressionValidator = "";
            this.system_info_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.system_info_nm.ToolTipLookupField = "information";
            this.system_info_nm.Width = 5;
            // 
            // old_info_cd
            // 
            this.old_info_cd.BindingKey = "old_info_cd";
            this.old_info_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.old_info_cd.HeaderText = "Old Info Code";
            this.old_info_cd.Lookup = false;
            this.old_info_cd.LookupColumns = "";
            this.old_info_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_info_cd.Mandatory = false;
            this.old_info_cd.MaxCharacterLength = 2147483647;
            this.old_info_cd.Name = "old_info_cd";
            this.old_info_cd.PercentageWidth = 25;
            this.old_info_cd.ReadOnly = true;
            this.old_info_cd.RegularExpressionValidator = "";
            this.old_info_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_info_cd.ToolTipLookupField = "information";
            this.old_info_cd.Visible = false;
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
            this.remarks.PercentageWidth = 34;
            this.remarks.ReadOnly = true;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Width = 5;
            // 
            // grd_info_value
            // 
            this.grd_info_value.BindingKey = "system_info_value";
            this.grd_info_value.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.grd_info_value.HeaderText = "Value";
            this.grd_info_value.Lookup = false;
            this.grd_info_value.LookupColumns = resources.GetString("grd_info_value.LookupColumns");
            this.grd_info_value.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.grd_info_value.Mandatory = false;
            this.grd_info_value.MaxCharacterLength = 2147483647;
            this.grd_info_value.Name = "grd_info_value";
            this.grd_info_value.PercentageWidth = 20;
            this.grd_info_value.ReadOnly = true;
            this.grd_info_value.RegularExpressionValidator = "";
            this.grd_info_value.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.grd_info_value.ToolTipLookupField = "information";
            this.grd_info_value.Width = 181;
            // 
            // value_int
            // 
            this.value_int.BindingKey = "value_int";
            this.value_int.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.value_int.DefaultCellStyle = dataGridViewCellStyle2;
            this.value_int.HeaderText = "Integer";
            this.value_int.Lookup = false;
            this.value_int.LookupColumns = "";
            this.value_int.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.value_int.Mandatory = false;
            this.value_int.MaxValue = ((long)(9223372036854775807));
            this.value_int.MinValue = ((long)(-9223372036854775808));
            this.value_int.Name = "value_int";
            this.value_int.PercentageWidth = 25;
            this.value_int.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.value_int.ToolTipLookupField = "information";
            this.value_int.Width = 226;
            // 
            // value_varchar
            // 
            this.value_varchar.BindingKey = "value_varchar";
            this.value_varchar.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.value_varchar.HeaderText = "Varchar";
            this.value_varchar.Lookup = false;
            this.value_varchar.LookupColumns = "";
            this.value_varchar.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.value_varchar.Mandatory = false;
            this.value_varchar.MaxCharacterLength = 2147483647;
            this.value_varchar.Name = "value_varchar";
            this.value_varchar.PercentageWidth = 25;
            this.value_varchar.RegularExpressionValidator = "";
            this.value_varchar.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.value_varchar.ToolTipLookupField = "information";
            this.value_varchar.Width = 226;
            // 
            // value_dt
            // 
            this.value_dt.BindingKey = "value_dt";
            this.value_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.value_dt.DefaultCellStyle = dataGridViewCellStyle3;
            this.value_dt.HeaderText = "Date";
            this.value_dt.Lookup = false;
            this.value_dt.LookupColumns = "";
            this.value_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.value_dt.Mandatory = false;
            this.value_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.value_dt.MinValue = new System.DateTime(((long)(0)));
            this.value_dt.Name = "value_dt";
            this.value_dt.PercentageWidth = 25;
            this.value_dt.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.value_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.value_dt.ToolTipLookupField = "information";
            this.value_dt.Width = 226;
            // 
            // value_dtm
            // 
            this.value_dtm.BindingKey = "value_dtm";
            this.value_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.value_dtm.DefaultCellStyle = dataGridViewCellStyle4;
            this.value_dtm.HeaderText = "Datetime";
            this.value_dtm.Lookup = false;
            this.value_dtm.LookupColumns = "";
            this.value_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.value_dtm.Mandatory = false;
            this.value_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.value_dtm.MinValue = new System.DateTime(((long)(0)));
            this.value_dtm.Name = "value_dtm";
            this.value_dtm.PercentageWidth = 25;
            this.value_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.value_dtm.ToolTipLookupField = "information";
            this.value_dtm.Width = 226;
            // 
            // SystemInformationCodes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(956, 512);
            this.Controls.Add(this.scBrowseOrList);
            this.Name = "SystemInformationCodes";
            this.Text = "Residents Management System - [SYSTEM INFORMATION CODES]";
            this.scBrowseOrList.Panel1.ResumeLayout(false);
            this.scBrowseOrList.Panel2.ResumeLayout(false);
            this.scBrowseOrList.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSystemInfoValues)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scBrowseOrList;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtCode;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtName;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSystemInfoValues;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtRemarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn system_info_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn system_info_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn old_info_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn grd_info_value;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn value_int;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn value_varchar;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn value_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn value_dtm;
    }
}