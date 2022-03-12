namespace DCC.ZOS.ZSM.ACT
{
    partial class ImportFingerprintAttendance
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle13 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle14 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle15 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle16 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle17 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle18 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle19 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle20 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle21 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle22 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle23 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle24 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.lblAttendanceIncomplete = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.lblAttendanceRecorded = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.grdIncompleteAttendance = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadarID = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewadar_grno_1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_nm_1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.gender_1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.full_department_nm_1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_status_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.scanned_dtm_1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewaLookup = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.grdAttendanceRecorded = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.gender = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.full_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.scanned_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_shift_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txtControllingId = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtShift3 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtShift2 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtpFromTo = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.txtShift1 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtProcessedDtm = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.FilePanel = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.grdFileSelection = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.FilePath = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.btnFileSelect = new System.Windows.Forms.Button();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.controlling_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewa_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewa_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.start_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.end_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.processing_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.shift_1_cnt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.shift_2_cnt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.shift_3_cnt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.dccTableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdIncompleteAttendance)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdAttendanceRecorded)).BeginInit();
            this.FilePanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdFileSelection)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
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
            this.scListOrBrowse.Panel1.Controls.Add(this.dccTableLayoutPanel1);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(730, 490);
            this.scListOrBrowse.SplitterDistance = 243;
            this.scListOrBrowse.TabIndex = 49;
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 4;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 55F));
            this.dccTableLayoutPanel1.Controls.Add(this.lblAttendanceIncomplete, 0, 5);
            this.dccTableLayoutPanel1.Controls.Add(this.lblAttendanceRecorded, 0, 3);
            this.dccTableLayoutPanel1.Controls.Add(this.grdIncompleteAttendance, 0, 6);
            this.dccTableLayoutPanel1.Controls.Add(this.sewaLookup, 1, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.grdAttendanceRecorded, 0, 4);
            this.dccTableLayoutPanel1.Controls.Add(this.txtControllingId, 0, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.txtShift3, 2, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.txtShift2, 1, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.dtpFromTo, 1, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.txtShift1, 0, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.txtProcessedDtm, 0, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.FilePanel, 3, 0);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 7;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 60F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 52.98969F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 47.01031F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(730, 490);
            this.dccTableLayoutPanel1.TabIndex = 0;
            // 
            // lblAttendanceIncomplete
            // 
            this.lblAttendanceIncomplete.AutoSize = true;
            this.lblAttendanceIncomplete.BackColor = System.Drawing.Color.Transparent;
            this.dccTableLayoutPanel1.SetColumnSpan(this.lblAttendanceIncomplete, 4);
            this.lblAttendanceIncomplete.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblAttendanceIncomplete.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAttendanceIncomplete.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblAttendanceIncomplete.Location = new System.Drawing.Point(3, 333);
            this.lblAttendanceIncomplete.Name = "lblAttendanceIncomplete";
            this.lblAttendanceIncomplete.Size = new System.Drawing.Size(724, 20);
            this.lblAttendanceIncomplete.TabIndex = 53;
            this.lblAttendanceIncomplete.Text = "Incomplete attendance records";
            // 
            // lblAttendanceRecorded
            // 
            this.lblAttendanceRecorded.AutoSize = true;
            this.lblAttendanceRecorded.BackColor = System.Drawing.Color.Transparent;
            this.dccTableLayoutPanel1.SetColumnSpan(this.lblAttendanceRecorded, 4);
            this.lblAttendanceRecorded.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblAttendanceRecorded.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAttendanceRecorded.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblAttendanceRecorded.Location = new System.Drawing.Point(3, 160);
            this.lblAttendanceRecorded.Name = "lblAttendanceRecorded";
            this.lblAttendanceRecorded.Size = new System.Drawing.Size(724, 20);
            this.lblAttendanceRecorded.TabIndex = 52;
            this.lblAttendanceRecorded.Text = "Attendance recorded";
            // 
            // grdIncompleteAttendance
            // 
            this.grdIncompleteAttendance.AllowRowSorting = false;
            this.grdIncompleteAttendance.AllowUserToAddRows = false;
            this.grdIncompleteAttendance.AutoAddNewRowForUser = false;
            this.grdIncompleteAttendance.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdIncompleteAttendance.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewadarID,
            this.sewadar_grno_1,
            this.sewadar_nm_1,
            this.gender_1,
            this.full_department_nm_1,
            this.sewadar_status_nm,
            this.scanned_dtm_1,
            this.remarks});
            this.dccTableLayoutPanel1.SetColumnSpan(this.grdIncompleteAttendance, 4);
            this.grdIncompleteAttendance.DeleteRowMenuEnabled = true;
            this.grdIncompleteAttendance.DeleteVisible = false;
            this.grdIncompleteAttendance.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdIncompleteAttendance.ExportToExcelVisible = true;
            this.grdIncompleteAttendance.InsertAfterVisible = false;
            this.grdIncompleteAttendance.InsertBeforeVisible = false;
            this.grdIncompleteAttendance.InsertLastVisible = false;
            this.grdIncompleteAttendance.InsertRowsMenuItemsEnabled = true;
            this.grdIncompleteAttendance.Location = new System.Drawing.Point(10, 363);
            this.grdIncompleteAttendance.Mandatory = false;
            this.grdIncompleteAttendance.Margin = new System.Windows.Forms.Padding(10);
            this.grdIncompleteAttendance.MoveDownVisible = false;
            this.grdIncompleteAttendance.MoveUpVisible = false;
            this.grdIncompleteAttendance.MultiSelect = false;
            this.grdIncompleteAttendance.Name = "grdIncompleteAttendance";
            this.grdIncompleteAttendance.ReadOnly = true;
            this.grdIncompleteAttendance.RowHeadersWidth = 15;
            this.grdIncompleteAttendance.ShowCommandStrip = false;
            this.grdIncompleteAttendance.Size = new System.Drawing.Size(710, 117);
            this.grdIncompleteAttendance.TabIndex = 51;
            this.grdIncompleteAttendance.Title = null;
            this.grdIncompleteAttendance.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdIncompleteAttendance.VirtualMode = true;
            // 
            // sewadarID
            // 
            this.sewadarID.BindingKey = "sewadar_id";
            this.sewadarID.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle13.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewadarID.DefaultCellStyle = dataGridViewCellStyle13;
            this.sewadarID.HeaderText = "Sewadar ID";
            this.sewadarID.Lookup = false;
            this.sewadarID.LookupColumns = "";
            this.sewadarID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadarID.Mandatory = false;
            this.sewadarID.MaxValue = ((long)(9223372036854775807));
            this.sewadarID.MinValue = ((long)(-9223372036854775808));
            this.sewadarID.Name = "sewadarID";
            this.sewadarID.PercentageWidth = 5F;
            this.sewadarID.ReadOnly = true;
            this.sewadarID.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadarID.ToolTipLookupField = "information";
            this.sewadarID.Width = 34;
            // 
            // sewadar_grno_1
            // 
            this.sewadar_grno_1.BindingKey = "sewadar_grno";
            this.sewadar_grno_1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_grno_1.HeaderText = "Sewadar GrNo.";
            this.sewadar_grno_1.Lookup = false;
            this.sewadar_grno_1.LookupColumns = "";
            this.sewadar_grno_1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_grno_1.Mandatory = false;
            this.sewadar_grno_1.MaxCharacterLength = 2147483647;
            this.sewadar_grno_1.Name = "sewadar_grno_1";
            this.sewadar_grno_1.PercentageWidth = 5F;
            this.sewadar_grno_1.ReadOnly = true;
            this.sewadar_grno_1.RegularExpressionValidator = "";
            this.sewadar_grno_1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno_1.ToolTipLookupField = "information";
            this.sewadar_grno_1.Width = 34;
            // 
            // sewadar_nm_1
            // 
            this.sewadar_nm_1.BindingKey = "Name";
            this.sewadar_nm_1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_nm_1.HeaderText = "Sewadar Name";
            this.sewadar_nm_1.Lookup = false;
            this.sewadar_nm_1.LookupColumns = "";
            this.sewadar_nm_1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_nm_1.Mandatory = false;
            this.sewadar_nm_1.MaxCharacterLength = 2147483647;
            this.sewadar_nm_1.Name = "sewadar_nm_1";
            this.sewadar_nm_1.PercentageWidth = 18F;
            this.sewadar_nm_1.ReadOnly = true;
            this.sewadar_nm_1.RegularExpressionValidator = "";
            this.sewadar_nm_1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_nm_1.ToolTipLookupField = "information";
            this.sewadar_nm_1.Width = 125;
            // 
            // gender_1
            // 
            this.gender_1.BindingKey = "gender";
            this.gender_1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.gender_1.HeaderText = "Gender";
            this.gender_1.Lookup = false;
            this.gender_1.LookupColumns = "";
            this.gender_1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.gender_1.Mandatory = false;
            this.gender_1.MaxCharacterLength = 2147483647;
            this.gender_1.Name = "gender_1";
            this.gender_1.PercentageWidth = 5F;
            this.gender_1.ReadOnly = true;
            this.gender_1.RegularExpressionValidator = "";
            this.gender_1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gender_1.ToolTipLookupField = "information";
            this.gender_1.Width = 34;
            // 
            // full_department_nm_1
            // 
            this.full_department_nm_1.BindingKey = "full_department_nm";
            this.full_department_nm_1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.full_department_nm_1.HeaderText = "Department Name";
            this.full_department_nm_1.Lookup = false;
            this.full_department_nm_1.LookupColumns = "";
            this.full_department_nm_1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.full_department_nm_1.Mandatory = false;
            this.full_department_nm_1.MaxCharacterLength = 2147483647;
            this.full_department_nm_1.Name = "full_department_nm_1";
            this.full_department_nm_1.PercentageWidth = 15F;
            this.full_department_nm_1.ReadOnly = true;
            this.full_department_nm_1.RegularExpressionValidator = "";
            this.full_department_nm_1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.full_department_nm_1.ToolTipLookupField = "information";
            this.full_department_nm_1.Width = 104;
            // 
            // sewadar_status_nm
            // 
            this.sewadar_status_nm.BindingKey = "sewadar_status_nm";
            this.sewadar_status_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_status_nm.HeaderText = "Status";
            this.sewadar_status_nm.Lookup = false;
            this.sewadar_status_nm.LookupColumns = "";
            this.sewadar_status_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_nm.Mandatory = false;
            this.sewadar_status_nm.MaxCharacterLength = 2147483647;
            this.sewadar_status_nm.Name = "sewadar_status_nm";
            this.sewadar_status_nm.PercentageWidth = 10F;
            this.sewadar_status_nm.ReadOnly = true;
            this.sewadar_status_nm.RegularExpressionValidator = "";
            this.sewadar_status_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_nm.ToolTipLookupField = "information";
            this.sewadar_status_nm.Width = 69;
            // 
            // scanned_dtm_1
            // 
            this.scanned_dtm_1.BindingKey = "scanned_dtm";
            this.scanned_dtm_1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle14.Format = "dd-MMM-yyyy hh:mm:ss";
            this.scanned_dtm_1.DefaultCellStyle = dataGridViewCellStyle14;
            this.scanned_dtm_1.HeaderText = "Scanned Date Time";
            this.scanned_dtm_1.Lookup = false;
            this.scanned_dtm_1.LookupColumns = "";
            this.scanned_dtm_1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.scanned_dtm_1.Mandatory = false;
            this.scanned_dtm_1.MaxCharacterLength = 2147483647;
            this.scanned_dtm_1.Name = "scanned_dtm_1";
            this.scanned_dtm_1.PercentageWidth = 20F;
            this.scanned_dtm_1.ReadOnly = true;
            this.scanned_dtm_1.RegularExpressionValidator = "";
            this.scanned_dtm_1.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.scanned_dtm_1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.scanned_dtm_1.ToolTipLookupField = "information";
            this.scanned_dtm_1.Width = 139;
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
            this.remarks.Name = "remarks";
            this.remarks.PercentageWidth = 20F;
            this.remarks.ReadOnly = true;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Width = 139;
            // 
            // sewaLookup
            // 
            this.sewaLookup.AllowsNew = false;
            this.sewaLookup.AllowsReference = false;
            this.sewaLookup.AllowsUpdate = false;
            this.sewaLookup.ApplicationIdForDbConnection = null;
            this.sewaLookup.BackColor = System.Drawing.Color.Transparent;
            this.sewaLookup.CalledScreenApplicationId = null;
            this.sewaLookup.CalledScreenTypeName = null;
            this.sewaLookup.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.sewaLookup, 2);
            this.sewaLookup.DisplayText = "";
            this.sewaLookup.DisplayTextBindingKey = "sewa_nm";
            this.sewaLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaLookup.EditingControlDataGridView = null;
            this.sewaLookup.EditingControlFormattedValue = null;
            this.sewaLookup.EditingControlRowIndex = 0;
            this.sewaLookup.EditingControlValueChanged = true;
            this.sewaLookup.EnableToolTip = false;
            this.sewaLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaLookup.IdText = "";
            this.sewaLookup.IdTextBindingKey = "sewa_id";
            this.sewaLookup.Location = new System.Drawing.Point(113, 3);
            this.sewaLookup.Lookup = true;
            this.sewaLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewaLookup.LookupResult = null;
            this.sewaLookup.LookupTitle = "Sewa";
            this.sewaLookup.Mandatory = true;
            this.sewaLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaLookup.MaxCharacterLength = 32767;
            this.sewaLookup.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaLookup.MinCharactersForQuery = 0;
            this.sewaLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaLookup.Name = "sewaLookup";
            this.sewaLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaLookup.PascalCase = false;
            this.sewaLookup.RangeInQueryMode = false;
            this.sewaLookup.ReadOnly = false;
            this.sewaLookup.RegularExpressionValidator = null;
            this.sewaLookup.Size = new System.Drawing.Size(210, 44);
            this.sewaLookup.TabIndex = 44;
            this.sewaLookup.Title = "Sewa";
            this.sewaLookup.ToolTipLookupField = "information";
            this.sewaLookup.ValueText = "";
            // 
            // grdAttendanceRecorded
            // 
            this.grdAttendanceRecorded.AllowRowSorting = false;
            this.grdAttendanceRecorded.AllowUserToAddRows = false;
            this.grdAttendanceRecorded.AutoAddNewRowForUser = false;
            this.grdAttendanceRecorded.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdAttendanceRecorded.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewadar_id,
            this.sewadar_grno,
            this.sewadar_nm,
            this.gender,
            this.full_department_nm,
            this.scanned_dtm,
            this.sewa_shift_nm});
            this.dccTableLayoutPanel1.SetColumnSpan(this.grdAttendanceRecorded, 4);
            this.grdAttendanceRecorded.DeleteRowMenuEnabled = true;
            this.grdAttendanceRecorded.DeleteVisible = false;
            this.grdAttendanceRecorded.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdAttendanceRecorded.ExportToExcelVisible = true;
            this.grdAttendanceRecorded.InsertAfterVisible = false;
            this.grdAttendanceRecorded.InsertBeforeVisible = false;
            this.grdAttendanceRecorded.InsertLastVisible = false;
            this.grdAttendanceRecorded.InsertRowsMenuItemsEnabled = true;
            this.grdAttendanceRecorded.Location = new System.Drawing.Point(10, 190);
            this.grdAttendanceRecorded.Mandatory = false;
            this.grdAttendanceRecorded.Margin = new System.Windows.Forms.Padding(10);
            this.grdAttendanceRecorded.MoveDownVisible = false;
            this.grdAttendanceRecorded.MoveUpVisible = false;
            this.grdAttendanceRecorded.MultiSelect = false;
            this.grdAttendanceRecorded.Name = "grdAttendanceRecorded";
            this.grdAttendanceRecorded.ReadOnly = true;
            this.grdAttendanceRecorded.RowHeadersWidth = 15;
            this.grdAttendanceRecorded.ShowCommandStrip = false;
            this.grdAttendanceRecorded.Size = new System.Drawing.Size(710, 133);
            this.grdAttendanceRecorded.TabIndex = 50;
            this.grdAttendanceRecorded.Title = null;
            this.grdAttendanceRecorded.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdAttendanceRecorded.VirtualMode = true;
            // 
            // sewadar_id
            // 
            this.sewadar_id.BindingKey = "sewadar_id";
            this.sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle15.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewadar_id.DefaultCellStyle = dataGridViewCellStyle15;
            this.sewadar_id.HeaderText = "Sewadar ID";
            this.sewadar_id.Lookup = false;
            this.sewadar_id.LookupColumns = "";
            this.sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_id.Mandatory = false;
            this.sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.sewadar_id.Name = "sewadar_id";
            this.sewadar_id.PercentageWidth = 10F;
            this.sewadar_id.ReadOnly = true;
            this.sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_id.ToolTipLookupField = "information";
            this.sewadar_id.Width = 69;
            // 
            // sewadar_grno
            // 
            this.sewadar_grno.BindingKey = "sewadar_grno";
            this.sewadar_grno.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_grno.HeaderText = "Sewadar GrNo.";
            this.sewadar_grno.Lookup = false;
            this.sewadar_grno.LookupColumns = "";
            this.sewadar_grno.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_grno.Mandatory = false;
            this.sewadar_grno.MaxCharacterLength = 2147483647;
            this.sewadar_grno.Name = "sewadar_grno";
            this.sewadar_grno.PercentageWidth = 10F;
            this.sewadar_grno.ReadOnly = true;
            this.sewadar_grno.RegularExpressionValidator = "";
            this.sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno.ToolTipLookupField = "information";
            this.sewadar_grno.Width = 69;
            // 
            // sewadar_nm
            // 
            this.sewadar_nm.BindingKey = "Name";
            this.sewadar_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_nm.HeaderText = "Sewadar Name";
            this.sewadar_nm.Lookup = false;
            this.sewadar_nm.LookupColumns = "";
            this.sewadar_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_nm.Mandatory = false;
            this.sewadar_nm.MaxCharacterLength = 2147483647;
            this.sewadar_nm.Name = "sewadar_nm";
            this.sewadar_nm.PercentageWidth = 20F;
            this.sewadar_nm.ReadOnly = true;
            this.sewadar_nm.RegularExpressionValidator = "";
            this.sewadar_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_nm.ToolTipLookupField = "information";
            this.sewadar_nm.Width = 139;
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
            this.gender.Name = "gender";
            this.gender.PercentageWidth = 10F;
            this.gender.ReadOnly = true;
            this.gender.RegularExpressionValidator = "";
            this.gender.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gender.ToolTipLookupField = "information";
            this.gender.Width = 69;
            // 
            // full_department_nm
            // 
            this.full_department_nm.BindingKey = "full_department_nm";
            this.full_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.full_department_nm.HeaderText = "Department Name";
            this.full_department_nm.Lookup = false;
            this.full_department_nm.LookupColumns = "";
            this.full_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.full_department_nm.Mandatory = false;
            this.full_department_nm.MaxCharacterLength = 2147483647;
            this.full_department_nm.Name = "full_department_nm";
            this.full_department_nm.PercentageWidth = 20F;
            this.full_department_nm.ReadOnly = true;
            this.full_department_nm.RegularExpressionValidator = "";
            this.full_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.full_department_nm.ToolTipLookupField = "information";
            this.full_department_nm.Width = 139;
            // 
            // scanned_dtm
            // 
            this.scanned_dtm.BindingKey = "scanned_dtm";
            this.scanned_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle16.Format = "dd-MMM-yyyy hh:mm:ss";
            this.scanned_dtm.DefaultCellStyle = dataGridViewCellStyle16;
            this.scanned_dtm.HeaderText = "Scanned Date Time";
            this.scanned_dtm.Lookup = false;
            this.scanned_dtm.LookupColumns = "";
            this.scanned_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.scanned_dtm.Mandatory = false;
            this.scanned_dtm.MaxCharacterLength = 2147483647;
            this.scanned_dtm.Name = "scanned_dtm";
            this.scanned_dtm.PercentageWidth = 19F;
            this.scanned_dtm.ReadOnly = true;
            this.scanned_dtm.RegularExpressionValidator = "";
            this.scanned_dtm.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.scanned_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.scanned_dtm.ToolTipLookupField = "information";
            this.scanned_dtm.Width = 132;
            // 
            // sewa_shift_nm
            // 
            this.sewa_shift_nm.BindingKey = "sewa_shift";
            this.sewa_shift_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_shift_nm.HeaderText = "Sewa Shift";
            this.sewa_shift_nm.Lookup = false;
            this.sewa_shift_nm.LookupColumns = "";
            this.sewa_shift_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_shift_nm.Mandatory = false;
            this.sewa_shift_nm.MaxCharacterLength = 2147483647;
            this.sewa_shift_nm.Name = "sewa_shift_nm";
            this.sewa_shift_nm.PercentageWidth = 10F;
            this.sewa_shift_nm.ReadOnly = true;
            this.sewa_shift_nm.RegularExpressionValidator = "";
            this.sewa_shift_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_shift_nm.ToolTipLookupField = "information";
            this.sewa_shift_nm.Width = 69;
            // 
            // txtControllingId
            // 
            this.txtControllingId.AllowsNew = false;
            this.txtControllingId.AllowsReference = false;
            this.txtControllingId.AllowsUpdate = false;
            this.txtControllingId.ApplicationIdForDbConnection = null;
            this.txtControllingId.BackColor = System.Drawing.Color.Transparent;
            this.txtControllingId.CalledScreenApplicationId = null;
            this.txtControllingId.CalledScreenTypeName = null;
            this.txtControllingId.CallingScreenType = null;
            this.txtControllingId.DisplayText = "";
            this.txtControllingId.DisplayTextBindingKey = "controlling_id";
            this.txtControllingId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtControllingId.EditingControlDataGridView = null;
            this.txtControllingId.EditingControlFormattedValue = "";
            this.txtControllingId.EditingControlRowIndex = 0;
            this.txtControllingId.EditingControlValueChanged = false;
            this.txtControllingId.EnableToolTip = false;
            this.txtControllingId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtControllingId.IdText = null;
            this.txtControllingId.IdTextBindingKey = "controlling_id";
            this.txtControllingId.Location = new System.Drawing.Point(4, 3);
            this.txtControllingId.Lookup = false;
            this.txtControllingId.LookupColumns = null;
            this.txtControllingId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtControllingId.LookupResult = null;
            this.txtControllingId.LookupTitle = "Controlling Id";
            this.txtControllingId.Mandatory = false;
            this.txtControllingId.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtControllingId.MaxCharacterLength = 32767;
            this.txtControllingId.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtControllingId.MinCharactersForQuery = 0;
            this.txtControllingId.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtControllingId.Name = "txtControllingId";
            this.txtControllingId.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtControllingId.PascalCase = false;
            this.txtControllingId.RangeInQueryMode = false;
            this.txtControllingId.ReadOnly = false;
            this.txtControllingId.RegularExpressionValidator = null;
            this.txtControllingId.Size = new System.Drawing.Size(101, 44);
            this.txtControllingId.TabIndex = 54;
            this.txtControllingId.Title = "Controlling Id";
            this.txtControllingId.ToolTipLookupField = "information";
            this.txtControllingId.ValueText = null;
            // 
            // txtShift3
            // 
            this.txtShift3.AllowsNew = false;
            this.txtShift3.AllowsReference = false;
            this.txtShift3.AllowsUpdate = false;
            this.txtShift3.ApplicationIdForDbConnection = null;
            this.txtShift3.BackColor = System.Drawing.Color.Transparent;
            this.txtShift3.CalledScreenApplicationId = null;
            this.txtShift3.CalledScreenTypeName = null;
            this.txtShift3.CallingScreenType = null;
            this.txtShift3.DisplayText = "";
            this.txtShift3.DisplayTextBindingKey = "shift_3_cnt";
            this.txtShift3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtShift3.EditingControlDataGridView = null;
            this.txtShift3.EditingControlFormattedValue = "";
            this.txtShift3.EditingControlRowIndex = 0;
            this.txtShift3.EditingControlValueChanged = false;
            this.txtShift3.EnableToolTip = false;
            this.txtShift3.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtShift3.IdText = null;
            this.txtShift3.IdTextBindingKey = "shift_3_cnt";
            this.txtShift3.Location = new System.Drawing.Point(222, 103);
            this.txtShift3.Lookup = false;
            this.txtShift3.LookupColumns = null;
            this.txtShift3.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtShift3.LookupResult = null;
            this.txtShift3.LookupTitle = "Shift 3 Count";
            this.txtShift3.Mandatory = false;
            this.txtShift3.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtShift3.MaxCharacterLength = 32767;
            this.txtShift3.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtShift3.MinCharactersForQuery = 0;
            this.txtShift3.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtShift3.Name = "txtShift3";
            this.txtShift3.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtShift3.PascalCase = false;
            this.txtShift3.RangeInQueryMode = false;
            this.txtShift3.ReadOnly = true;
            this.txtShift3.RegularExpressionValidator = null;
            this.txtShift3.Size = new System.Drawing.Size(101, 45);
            this.txtShift3.TabIndex = 56;
            this.txtShift3.TabStop = false;
            this.txtShift3.Title = "Shift 3 Count";
            this.txtShift3.ToolTipLookupField = "information";
            this.txtShift3.ValueText = null;
            // 
            // txtShift2
            // 
            this.txtShift2.AllowsNew = false;
            this.txtShift2.AllowsReference = false;
            this.txtShift2.AllowsUpdate = false;
            this.txtShift2.ApplicationIdForDbConnection = null;
            this.txtShift2.BackColor = System.Drawing.Color.Transparent;
            this.txtShift2.CalledScreenApplicationId = null;
            this.txtShift2.CalledScreenTypeName = null;
            this.txtShift2.CallingScreenType = null;
            this.txtShift2.DisplayText = "";
            this.txtShift2.DisplayTextBindingKey = "shift_2_cnt";
            this.txtShift2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtShift2.EditingControlDataGridView = null;
            this.txtShift2.EditingControlFormattedValue = "";
            this.txtShift2.EditingControlRowIndex = 0;
            this.txtShift2.EditingControlValueChanged = false;
            this.txtShift2.EnableToolTip = false;
            this.txtShift2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtShift2.IdText = null;
            this.txtShift2.IdTextBindingKey = "shift_2_cnt";
            this.txtShift2.Location = new System.Drawing.Point(113, 103);
            this.txtShift2.Lookup = false;
            this.txtShift2.LookupColumns = null;
            this.txtShift2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtShift2.LookupResult = null;
            this.txtShift2.LookupTitle = "Shift 2 Count";
            this.txtShift2.Mandatory = false;
            this.txtShift2.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtShift2.MaxCharacterLength = 32767;
            this.txtShift2.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtShift2.MinCharactersForQuery = 0;
            this.txtShift2.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtShift2.Name = "txtShift2";
            this.txtShift2.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtShift2.PascalCase = false;
            this.txtShift2.RangeInQueryMode = false;
            this.txtShift2.ReadOnly = true;
            this.txtShift2.RegularExpressionValidator = null;
            this.txtShift2.Size = new System.Drawing.Size(101, 45);
            this.txtShift2.TabIndex = 1;
            this.txtShift2.TabStop = false;
            this.txtShift2.Title = "Shift 2 Count";
            this.txtShift2.ToolTipLookupField = "information";
            this.txtShift2.ValueText = null;
            // 
            // dtpFromTo
            // 
            this.dccTableLayoutPanel1.SetColumnSpan(this.dtpFromTo, 2);
            this.dtpFromTo.DiscreteInQueryMode = false;
            this.dtpFromTo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtpFromTo.FillDefailtValuesInInsertMode = false;
            this.dtpFromTo.FromDate = null;
            this.dtpFromTo.FromDateFieldBindingKey = "start_dt";
            this.dtpFromTo.FromDateMandatory = true;
            this.dtpFromTo.FromDateTitle = "From Date";
            this.dtpFromTo.Location = new System.Drawing.Point(112, 53);
            this.dtpFromTo.Mandatory = true;
            this.dtpFromTo.Name = "dtpFromTo";
            this.dtpFromTo.ReadOnly = false;
            this.dtpFromTo.Size = new System.Drawing.Size(212, 44);
            this.dtpFromTo.TabIndex = 48;
            this.dtpFromTo.TitleInQueryMode = null;
            this.dtpFromTo.ToDate = null;
            this.dtpFromTo.ToDateFieldBindingKey = "end_dt";
            this.dtpFromTo.ToDateMandatory = true;
            this.dtpFromTo.ToDateTitle = "Till Date";
            // 
            // txtShift1
            // 
            this.txtShift1.AllowsNew = false;
            this.txtShift1.AllowsReference = false;
            this.txtShift1.AllowsUpdate = false;
            this.txtShift1.ApplicationIdForDbConnection = null;
            this.txtShift1.BackColor = System.Drawing.Color.Transparent;
            this.txtShift1.CalledScreenApplicationId = null;
            this.txtShift1.CalledScreenTypeName = null;
            this.txtShift1.CallingScreenType = null;
            this.txtShift1.DisplayText = "";
            this.txtShift1.DisplayTextBindingKey = "shift_1_cnt";
            this.txtShift1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtShift1.EditingControlDataGridView = null;
            this.txtShift1.EditingControlFormattedValue = "";
            this.txtShift1.EditingControlRowIndex = 0;
            this.txtShift1.EditingControlValueChanged = false;
            this.txtShift1.EnableToolTip = false;
            this.txtShift1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtShift1.IdText = null;
            this.txtShift1.IdTextBindingKey = "shift_1_cnt";
            this.txtShift1.Location = new System.Drawing.Point(4, 103);
            this.txtShift1.Lookup = false;
            this.txtShift1.LookupColumns = null;
            this.txtShift1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtShift1.LookupResult = null;
            this.txtShift1.LookupTitle = "Shift 1 Count";
            this.txtShift1.Mandatory = false;
            this.txtShift1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtShift1.MaxCharacterLength = 32767;
            this.txtShift1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtShift1.MinCharactersForQuery = 0;
            this.txtShift1.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtShift1.Name = "txtShift1";
            this.txtShift1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtShift1.PascalCase = false;
            this.txtShift1.RangeInQueryMode = false;
            this.txtShift1.ReadOnly = true;
            this.txtShift1.RegularExpressionValidator = null;
            this.txtShift1.Size = new System.Drawing.Size(101, 45);
            this.txtShift1.TabIndex = 0;
            this.txtShift1.TabStop = false;
            this.txtShift1.Title = "Shift 1 Count";
            this.txtShift1.ToolTipLookupField = "information";
            this.txtShift1.ValueText = null;
            // 
            // txtProcessedDtm
            // 
            this.txtProcessedDtm.AllowsNew = false;
            this.txtProcessedDtm.AllowsReference = false;
            this.txtProcessedDtm.AllowsUpdate = false;
            this.txtProcessedDtm.ApplicationIdForDbConnection = null;
            this.txtProcessedDtm.BackColor = System.Drawing.Color.Transparent;
            this.txtProcessedDtm.CalledScreenApplicationId = null;
            this.txtProcessedDtm.CalledScreenTypeName = null;
            this.txtProcessedDtm.CallingScreenType = null;
            this.txtProcessedDtm.DisplayText = "";
            this.txtProcessedDtm.DisplayTextBindingKey = "processing_dtm";
            this.txtProcessedDtm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtProcessedDtm.EditingControlDataGridView = null;
            this.txtProcessedDtm.EditingControlFormattedValue = "";
            this.txtProcessedDtm.EditingControlRowIndex = 0;
            this.txtProcessedDtm.EditingControlValueChanged = false;
            this.txtProcessedDtm.EnableToolTip = false;
            this.txtProcessedDtm.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtProcessedDtm.IdText = null;
            this.txtProcessedDtm.IdTextBindingKey = "processing_dtm";
            this.txtProcessedDtm.Location = new System.Drawing.Point(4, 53);
            this.txtProcessedDtm.Lookup = false;
            this.txtProcessedDtm.LookupColumns = null;
            this.txtProcessedDtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtProcessedDtm.LookupResult = null;
            this.txtProcessedDtm.LookupTitle = "Processed Date";
            this.txtProcessedDtm.Mandatory = false;
            this.txtProcessedDtm.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtProcessedDtm.MaxCharacterLength = 32767;
            this.txtProcessedDtm.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtProcessedDtm.MinCharactersForQuery = 0;
            this.txtProcessedDtm.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtProcessedDtm.Name = "txtProcessedDtm";
            this.txtProcessedDtm.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtProcessedDtm.PascalCase = false;
            this.txtProcessedDtm.RangeInQueryMode = false;
            this.txtProcessedDtm.ReadOnly = true;
            this.txtProcessedDtm.RegularExpressionValidator = null;
            this.txtProcessedDtm.Size = new System.Drawing.Size(101, 44);
            this.txtProcessedDtm.TabIndex = 49;
            this.txtProcessedDtm.TabStop = false;
            this.txtProcessedDtm.Title = "Processed Date";
            this.txtProcessedDtm.ToolTipLookupField = "information";
            this.txtProcessedDtm.ValueText = null;
            // 
            // FilePanel
            // 
            this.FilePanel.ColumnCount = 1;
            this.FilePanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.FilePanel.Controls.Add(this.grdFileSelection, 0, 0);
            this.FilePanel.Controls.Add(this.btnFileSelect, 0, 1);
            this.FilePanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.FilePanel.Location = new System.Drawing.Point(330, 3);
            this.FilePanel.Name = "FilePanel";
            this.FilePanel.RowCount = 2;
            this.dccTableLayoutPanel1.SetRowSpan(this.FilePanel, 3);
            this.FilePanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 79.22078F));
            this.FilePanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.77922F));
            this.FilePanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.FilePanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.FilePanel.Size = new System.Drawing.Size(397, 154);
            this.FilePanel.TabIndex = 57;
            // 
            // grdFileSelection
            // 
            this.grdFileSelection.AllowRowSorting = false;
            this.grdFileSelection.AllowUserToAddRows = false;
            this.grdFileSelection.AutoAddNewRowForUser = false;
            this.grdFileSelection.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdFileSelection.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.FilePath});
            this.grdFileSelection.DeleteRowMenuEnabled = true;
            this.grdFileSelection.DeleteVisible = true;
            this.grdFileSelection.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdFileSelection.ExportToExcelVisible = true;
            this.grdFileSelection.InsertAfterVisible = true;
            this.grdFileSelection.InsertBeforeVisible = true;
            this.grdFileSelection.InsertLastVisible = true;
            this.grdFileSelection.InsertRowsMenuItemsEnabled = true;
            this.grdFileSelection.Location = new System.Drawing.Point(3, 3);
            this.grdFileSelection.Mandatory = false;
            this.grdFileSelection.MoveDownVisible = false;
            this.grdFileSelection.MoveUpVisible = false;
            this.grdFileSelection.MultiSelect = false;
            this.grdFileSelection.Name = "grdFileSelection";
            this.grdFileSelection.RowHeadersWidth = 15;
            this.grdFileSelection.ShowCommandStrip = true;
            this.grdFileSelection.Size = new System.Drawing.Size(391, 116);
            this.grdFileSelection.TabIndex = 59;
            this.grdFileSelection.Title = null;
            this.grdFileSelection.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdFileSelection.VirtualMode = true;
            // 
            // FilePath
            // 
            this.FilePath.BindingKey = null;
            this.FilePath.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.FilePath.HeaderText = "FilePath";
            this.FilePath.Lookup = false;
            this.FilePath.LookupColumns = "";
            this.FilePath.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.FilePath.Mandatory = false;
            this.FilePath.MaxCharacterLength = 2147483647;
            this.FilePath.Name = "FilePath";
            this.FilePath.PercentageWidth = 98F;
            this.FilePath.RegularExpressionValidator = "";
            this.FilePath.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.FilePath.ToolTipLookupField = "information";
            this.FilePath.Width = 368;
            // 
            // btnFileSelect
            // 
            this.btnFileSelect.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnFileSelect.Location = new System.Drawing.Point(319, 125);
            this.btnFileSelect.Name = "btnFileSelect";
            this.btnFileSelect.Size = new System.Drawing.Size(75, 26);
            this.btnFileSelect.TabIndex = 60;
            this.btnFileSelect.Text = "Select File";
            this.btnFileSelect.UseVisualStyleBackColor = true;
            this.btnFileSelect.Click += new System.EventHandler(this.btnFileSelect_Click);
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.controlling_id,
            this.sewa_id,
            this.sewa_nm,
            this.start_dt,
            this.end_dt,
            this.processing_dtm,
            this.shift_1_cnt,
            this.shift_2_cnt,
            this.shift_3_cnt});
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
            this.grdList.MoveDownVisible = false;
            this.grdList.MoveUpVisible = false;
            this.grdList.MultiSelect = false;
            this.grdList.Name = "grdList";
            this.grdList.ReadOnly = true;
            this.grdList.RowHeadersWidth = 15;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(96, 100);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // controlling_id
            // 
            this.controlling_id.BindingKey = "controlling_id";
            this.controlling_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle17.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.controlling_id.DefaultCellStyle = dataGridViewCellStyle17;
            this.controlling_id.HeaderText = "Controlling Id";
            this.controlling_id.Lookup = false;
            this.controlling_id.LookupColumns = "";
            this.controlling_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.controlling_id.Mandatory = false;
            this.controlling_id.MaxValue = ((long)(9223372036854775807));
            this.controlling_id.MinValue = ((long)(-9223372036854775808));
            this.controlling_id.Name = "controlling_id";
            this.controlling_id.PercentageWidth = 5F;
            this.controlling_id.ReadOnly = true;
            this.controlling_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.controlling_id.ToolTipLookupField = "information";
            this.controlling_id.Width = 5;
            // 
            // sewa_id
            // 
            this.sewa_id.BindingKey = "sewa_id";
            this.sewa_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle18.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewa_id.DefaultCellStyle = dataGridViewCellStyle18;
            this.sewa_id.HeaderText = "Sewa Id";
            this.sewa_id.Lookup = false;
            this.sewa_id.LookupColumns = "";
            this.sewa_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_id.Mandatory = false;
            this.sewa_id.MaxValue = ((long)(9223372036854775807));
            this.sewa_id.MinValue = ((long)(-9223372036854775808));
            this.sewa_id.Name = "sewa_id";
            this.sewa_id.PercentageWidth = 24F;
            this.sewa_id.ReadOnly = true;
            this.sewa_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_id.ToolTipLookupField = "information";
            this.sewa_id.Visible = false;
            this.sewa_id.Width = 171;
            // 
            // sewa_nm
            // 
            this.sewa_nm.BindingKey = "sewa_nm";
            this.sewa_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.sewa_nm.HeaderText = "Sewa Name";
            this.sewa_nm.Lookup = false;
            this.sewa_nm.LookupColumns = "";
            this.sewa_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_nm.Mandatory = false;
            this.sewa_nm.Name = "sewa_nm";
            this.sewa_nm.PercentageWidth = 20F;
            this.sewa_nm.ReadOnly = true;
            this.sewa_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_nm.ToolTipLookupField = "information";
            this.sewa_nm.Width = 16;
            // 
            // start_dt
            // 
            this.start_dt.BindingKey = "start_dt";
            this.start_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle19.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.start_dt.DefaultCellStyle = dataGridViewCellStyle19;
            this.start_dt.HeaderText = "Start Date";
            this.start_dt.Lookup = false;
            this.start_dt.LookupColumns = "";
            this.start_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.start_dt.Mandatory = false;
            this.start_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.start_dt.MinValue = new System.DateTime(((long)(0)));
            this.start_dt.Name = "start_dt";
            this.start_dt.PercentageWidth = 15F;
            this.start_dt.ReadOnly = true;
            this.start_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.start_dt.ToolTipLookupField = "information";
            this.start_dt.Width = 12;
            // 
            // end_dt
            // 
            this.end_dt.BindingKey = "end_dt";
            this.end_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle20.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.end_dt.DefaultCellStyle = dataGridViewCellStyle20;
            this.end_dt.HeaderText = "End Date";
            this.end_dt.Lookup = false;
            this.end_dt.LookupColumns = "";
            this.end_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.end_dt.Mandatory = false;
            this.end_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.end_dt.MinValue = new System.DateTime(((long)(0)));
            this.end_dt.Name = "end_dt";
            this.end_dt.PercentageWidth = 15F;
            this.end_dt.ReadOnly = true;
            this.end_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.end_dt.ToolTipLookupField = "information";
            this.end_dt.Width = 12;
            // 
            // processing_dtm
            // 
            this.processing_dtm.BindingKey = "processing_dtm";
            this.processing_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle21.Format = "dd-MMM-yyyy hh:mm:ss";
            this.processing_dtm.DefaultCellStyle = dataGridViewCellStyle21;
            this.processing_dtm.HeaderText = "Processing Date Time";
            this.processing_dtm.Lookup = false;
            this.processing_dtm.LookupColumns = "";
            this.processing_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.processing_dtm.Mandatory = false;
            this.processing_dtm.MaxCharacterLength = 2147483647;
            this.processing_dtm.Name = "processing_dtm";
            this.processing_dtm.PercentageWidth = 25F;
            this.processing_dtm.ReadOnly = true;
            this.processing_dtm.RegularExpressionValidator = "";
            this.processing_dtm.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.processing_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.processing_dtm.ToolTipLookupField = "information";
            this.processing_dtm.Width = 20;
            // 
            // shift_1_cnt
            // 
            this.shift_1_cnt.BindingKey = "shift_1_cnt";
            this.shift_1_cnt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle22.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.shift_1_cnt.DefaultCellStyle = dataGridViewCellStyle22;
            this.shift_1_cnt.HeaderText = "Shift 1";
            this.shift_1_cnt.Lookup = false;
            this.shift_1_cnt.LookupColumns = "";
            this.shift_1_cnt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.shift_1_cnt.Mandatory = false;
            this.shift_1_cnt.MaxValue = ((long)(9223372036854775807));
            this.shift_1_cnt.MinValue = ((long)(-9223372036854775808));
            this.shift_1_cnt.Name = "shift_1_cnt";
            this.shift_1_cnt.PercentageWidth = 10F;
            this.shift_1_cnt.ReadOnly = true;
            this.shift_1_cnt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.shift_1_cnt.ToolTipLookupField = "information";
            this.shift_1_cnt.Width = 8;
            // 
            // shift_2_cnt
            // 
            this.shift_2_cnt.BindingKey = "shift_2_cnt";
            this.shift_2_cnt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle23.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.shift_2_cnt.DefaultCellStyle = dataGridViewCellStyle23;
            this.shift_2_cnt.HeaderText = "Shift 2";
            this.shift_2_cnt.Lookup = false;
            this.shift_2_cnt.LookupColumns = "";
            this.shift_2_cnt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.shift_2_cnt.Mandatory = false;
            this.shift_2_cnt.MaxValue = ((long)(9223372036854775807));
            this.shift_2_cnt.MinValue = ((long)(-9223372036854775808));
            this.shift_2_cnt.Name = "shift_2_cnt";
            this.shift_2_cnt.PercentageWidth = 10F;
            this.shift_2_cnt.ReadOnly = true;
            this.shift_2_cnt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.shift_2_cnt.ToolTipLookupField = "information";
            this.shift_2_cnt.Width = 8;
            // 
            // shift_3_cnt
            // 
            this.shift_3_cnt.BindingKey = "shift_3_cnt";
            this.shift_3_cnt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle24.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.shift_3_cnt.DefaultCellStyle = dataGridViewCellStyle24;
            this.shift_3_cnt.HeaderText = "Shift 3";
            this.shift_3_cnt.Lookup = false;
            this.shift_3_cnt.LookupColumns = "";
            this.shift_3_cnt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.shift_3_cnt.Mandatory = false;
            this.shift_3_cnt.MaxValue = ((long)(9223372036854775807));
            this.shift_3_cnt.MinValue = ((long)(-9223372036854775808));
            this.shift_3_cnt.Name = "shift_3_cnt";
            this.shift_3_cnt.PercentageWidth = 10F;
            this.shift_3_cnt.ReadOnly = true;
            this.shift_3_cnt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.shift_3_cnt.ToolTipLookupField = "information";
            this.shift_3_cnt.Width = 8;
            // 
            // ImportFingerprintAttendance
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(730, 490);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "ImportFingerprintAttendance";
            this.Text = "Import Fingerprint Attendance";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.dccTableLayoutPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdIncompleteAttendance)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdAttendanceRecorded)).EndInit();
            this.FilePanel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdFileSelection)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private Controls.ZSMLookups.SewaLookup sewaLookup;
        private UMB.CDF.UIControls.TextControls.DateRangePair dtpFromTo;
        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private UMB.CDF.UIControls.DCCLabel lblAttendanceIncomplete;
        private UMB.CDF.UIControls.DCCLabel lblAttendanceRecorded;
        private UMB.CDF.UIControls.Grid.DCCGrid grdIncompleteAttendance;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtProcessedDtm;
        private UMB.CDF.UIControls.Grid.DCCGrid grdAttendanceRecorded;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtControllingId;
        private UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtShift1;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtShift2;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtShift3;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn controlling_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewa_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn sewa_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn start_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn end_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn processing_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn shift_1_cnt;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn shift_2_cnt;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn shift_3_cnt;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewadarID;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno_1;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_nm_1;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gender_1;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn full_department_nm_1;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn scanned_dtm_1;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewadar_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gender;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn full_department_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn scanned_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_shift_nm;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel FilePanel;
        private UMB.CDF.UIControls.Grid.DCCGrid grdFileSelection;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn FilePath;
        private System.Windows.Forms.Button btnFileSelect;
    }
}