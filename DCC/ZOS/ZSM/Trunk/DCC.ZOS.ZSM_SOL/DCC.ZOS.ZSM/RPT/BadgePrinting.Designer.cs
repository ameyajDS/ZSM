namespace DCC.ZOS.ZSM.RPT
{
    partial class BadgePrinting
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BadgePrinting));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.InnerSplitPanel = new System.Windows.Forms.SplitContainer();
            this.grdSewadars = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.department = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.expiry_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.printing_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.sewadar_status_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.photo_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.weekly_sewa_location_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.department_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccLabel1 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.txtFromValue = new System.Windows.Forms.TextBox();
            this.dccLabel2 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.txtToValue = new System.Windows.Forms.TextBox();
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtSatsangCentre = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intBadgeExpiryYear = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.lblRetirementAge = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.intGents = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.intLadies = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.sewadarListLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup();
            this.badgeTemplateCombo1 = new DCC.ZOS.ZSM.Controls.Combos.BadgeTemplateCombo();
            this.txtDefaultRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tblFrontBack = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.chkFront = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkBack = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.tlpBase.SuspendLayout();
            this.InnerSplitPanel.Panel1.SuspendLayout();
            this.InnerSplitPanel.Panel2.SuspendLayout();
            this.InnerSplitPanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSewadars)).BeginInit();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.tblFrontBack.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 1;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 31.58537F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 31.34146F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 37.07318F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.Controls.Add(this.InnerSplitPanel, 0, 2);
            this.tlpBase.Controls.Add(this.tlpTop, 0, 1);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 3;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 1.858108F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.10135F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 78.04054F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8F));
            this.tlpBase.Size = new System.Drawing.Size(932, 601);
            this.tlpBase.TabIndex = 0;
            // 
            // InnerSplitPanel
            // 
            this.InnerSplitPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.InnerSplitPanel.Location = new System.Drawing.Point(3, 134);
            this.InnerSplitPanel.Name = "InnerSplitPanel";
            // 
            // InnerSplitPanel.Panel1
            // 
            this.InnerSplitPanel.Panel1.Controls.Add(this.grdSewadars);
            // 
            // InnerSplitPanel.Panel2
            // 
            this.InnerSplitPanel.Panel2.Controls.Add(this.dccTableLayoutPanel1);
            this.InnerSplitPanel.Panel2Collapsed = true;
            this.InnerSplitPanel.Size = new System.Drawing.Size(926, 464);
            this.InnerSplitPanel.SplitterDistance = 308;
            this.InnerSplitPanel.TabIndex = 10;
            // 
            // grdSewadars
            // 
            this.grdSewadars.AllowRowSorting = false;
            this.grdSewadars.AllowUserToAddRows = false;
            this.grdSewadars.AutoAddNewRowForUser = false;
            this.grdSewadars.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSewadars.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewadar_grno,
            this.full_nm,
            this.department,
            this.expiry_dt,
            this.printing_dtm,
            this.sewadar_status_nm,
            this.photo_dt,
            this.remarks,
            this.weekly_sewa_location_id,
            this.department_id});
            this.grdSewadars.DeleteRowMenuEnabled = true;
            this.grdSewadars.DeleteVisible = true;
            this.grdSewadars.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSewadars.ExportToExcelVisible = true;
            this.grdSewadars.InsertAfterVisible = true;
            this.grdSewadars.InsertBeforeVisible = true;
            this.grdSewadars.InsertLastVisible = true;
            this.grdSewadars.InsertRowsMenuItemsEnabled = true;
            this.grdSewadars.Location = new System.Drawing.Point(0, 0);
            this.grdSewadars.Mandatory = false;
            this.grdSewadars.MoveDownVisible = false;
            this.grdSewadars.MoveUpVisible = false;
            this.grdSewadars.MultiSelect = false;
            this.grdSewadars.Name = "grdSewadars";
            this.grdSewadars.RowHeadersWidth = 15;
            this.grdSewadars.RowTemplate.Height = 24;
            this.grdSewadars.ShowCommandStrip = true;
            this.grdSewadars.Size = new System.Drawing.Size(926, 464);
            this.grdSewadars.TabIndex = 4;
            this.grdSewadars.Title = null;
            this.grdSewadars.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdSewadars.VirtualMode = true;
            this.grdSewadars.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.grdSewadars_LookupDialogShowing);
            this.grdSewadars.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.grdTeamWiseDailyAttendance_LookupResultSet);
            this.grdSewadars.RowValidating += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.grdSewadars_RowValidating);
            // 
            // sewadar_grno
            // 
            this.sewadar_grno.BindingKey = "sewadar_grno";
            this.sewadar_grno.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_grno.HeaderText = "GR No.";
            this.sewadar_grno.Lookup = true;
            this.sewadar_grno.LookupColumns = resources.GetString("sewadar_grno.LookupColumns");
            this.sewadar_grno.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_grno.Mandatory = true;
            this.sewadar_grno.MaxCharacterLength = 2147483647;
            this.sewadar_grno.Name = "sewadar_grno";
            this.sewadar_grno.PercentageWidth = 8F;
            this.sewadar_grno.RegularExpressionValidator = "";
            this.sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno.ToolTipLookupField = "information";
            this.sewadar_grno.Width = 72;
            // 
            // full_nm
            // 
            this.full_nm.BindingKey = "full_nm";
            this.full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.full_nm.HeaderText = "Name";
            this.full_nm.Lookup = true;
            this.full_nm.LookupColumns = resources.GetString("full_nm.LookupColumns");
            this.full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.full_nm.Mandatory = false;
            this.full_nm.MaxCharacterLength = 2147483647;
            this.full_nm.Name = "full_nm";
            this.full_nm.PercentageWidth = 20F;
            this.full_nm.RegularExpressionValidator = "";
            this.full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.full_nm.ToolTipLookupField = "information";
            this.full_nm.Width = 58;
            // 
            // department
            // 
            this.department.BindingKey = "full_department_nm";
            this.department.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.department.HeaderText = "Department";
            this.department.Lookup = false;
            this.department.LookupColumns = "";
            this.department.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department.Mandatory = false;
            this.department.MaxCharacterLength = 2147483647;
            this.department.Name = "department";
            this.department.PercentageWidth = 15F;
            this.department.ReadOnly = true;
            this.department.RegularExpressionValidator = "";
            this.department.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department.ToolTipLookupField = "information";
            this.department.Width = 43;
            // 
            // expiry_dt
            // 
            this.expiry_dt.BindingKey = "expiry_dt";
            this.expiry_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.expiry_dt.HeaderText = "Badge Expiry Date";
            this.expiry_dt.Lookup = false;
            this.expiry_dt.LookupColumns = "";
            this.expiry_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.expiry_dt.Mandatory = false;
            this.expiry_dt.MaxCharacterLength = 2147483647;
            this.expiry_dt.Name = "expiry_dt";
            this.expiry_dt.PercentageWidth = 10F;
            this.expiry_dt.ReadOnly = true;
            this.expiry_dt.RegularExpressionValidator = "";
            this.expiry_dt.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.expiry_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.expiry_dt.ToolTipLookupField = "information";
            this.expiry_dt.Width = 29;
            // 
            // printing_dtm
            // 
            this.printing_dtm.BindingKey = "printing_dtm";
            this.printing_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.printing_dtm.DefaultCellStyle = dataGridViewCellStyle5;
            this.printing_dtm.HeaderText = "Last Printed";
            this.printing_dtm.Lookup = false;
            this.printing_dtm.LookupColumns = "";
            this.printing_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.printing_dtm.Mandatory = false;
            this.printing_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.printing_dtm.MinValue = new System.DateTime(((long)(0)));
            this.printing_dtm.Name = "printing_dtm";
            this.printing_dtm.PercentageWidth = 10F;
            this.printing_dtm.ReadOnly = true;
            this.printing_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.printing_dtm.ToolTipLookupField = "information";
            this.printing_dtm.Width = 91;
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
            this.sewadar_status_nm.PercentageWidth = 15F;
            this.sewadar_status_nm.ReadOnly = true;
            this.sewadar_status_nm.RegularExpressionValidator = "";
            this.sewadar_status_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_nm.ToolTipLookupField = "information";
            this.sewadar_status_nm.Width = 43;
            // 
            // photo_dt
            // 
            this.photo_dt.BindingKey = "photo_dt";
            this.photo_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.photo_dt.DefaultCellStyle = dataGridViewCellStyle6;
            this.photo_dt.HeaderText = "Photo Date";
            this.photo_dt.Lookup = false;
            this.photo_dt.LookupColumns = "";
            this.photo_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.photo_dt.Mandatory = false;
            this.photo_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.photo_dt.MinValue = new System.DateTime(((long)(0)));
            this.photo_dt.Name = "photo_dt";
            this.photo_dt.PercentageWidth = 10F;
            this.photo_dt.ReadOnly = true;
            this.photo_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.photo_dt.ToolTipLookupField = "information";
            this.photo_dt.Width = 91;
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
            this.remarks.PercentageWidth = 15F;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Width = 43;
            // 
            // weekly_sewa_location_id
            // 
            this.weekly_sewa_location_id.BindingKey = "weekly_sewa_location_id";
            this.weekly_sewa_location_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.weekly_sewa_location_id.DefaultCellStyle = dataGridViewCellStyle7;
            this.weekly_sewa_location_id.HeaderText = "weekly_sewa_location_id";
            this.weekly_sewa_location_id.Lookup = false;
            this.weekly_sewa_location_id.LookupColumns = "";
            this.weekly_sewa_location_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.weekly_sewa_location_id.Mandatory = false;
            this.weekly_sewa_location_id.MaxValue = ((long)(9223372036854775807));
            this.weekly_sewa_location_id.MinValue = ((long)(-9223372036854775808));
            this.weekly_sewa_location_id.Name = "weekly_sewa_location_id";
            this.weekly_sewa_location_id.PercentageWidth = 25F;
            this.weekly_sewa_location_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.weekly_sewa_location_id.ToolTipLookupField = "information";
            this.weekly_sewa_location_id.Visible = false;
            // 
            // department_id
            // 
            this.department_id.BindingKey = "department_id";
            this.department_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.department_id.DefaultCellStyle = dataGridViewCellStyle8;
            this.department_id.HeaderText = "department_id";
            this.department_id.Lookup = false;
            this.department_id.LookupColumns = "";
            this.department_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_id.Mandatory = false;
            this.department_id.MaxValue = ((long)(9223372036854775807));
            this.department_id.MinValue = ((long)(-9223372036854775808));
            this.department_id.Name = "department_id";
            this.department_id.PercentageWidth = 25F;
            this.department_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_id.ToolTipLookupField = "information";
            this.department_id.Visible = false;
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 4;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 130F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 76F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 34F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 686F));
            this.dccTableLayoutPanel1.Controls.Add(this.dccLabel1, 0, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.txtFromValue, 1, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.dccLabel2, 2, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.txtToValue, 3, 0);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 2;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 6.465518F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 93.53448F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(614, 464);
            this.dccTableLayoutPanel1.TabIndex = 0;
            // 
            // dccLabel1
            // 
            this.dccLabel1.AutoSize = true;
            this.dccLabel1.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel1.Location = new System.Drawing.Point(3, 0);
            this.dccLabel1.Name = "dccLabel1";
            this.dccLabel1.Size = new System.Drawing.Size(124, 30);
            this.dccLabel1.TabIndex = 0;
            this.dccLabel1.Text = "Generate Range From:";
            this.dccLabel1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtFromValue
            // 
            this.txtFromValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtFromValue.Location = new System.Drawing.Point(133, 3);
            this.txtFromValue.Name = "txtFromValue";
            this.txtFromValue.Size = new System.Drawing.Size(70, 20);
            this.txtFromValue.TabIndex = 1;
            // 
            // dccLabel2
            // 
            this.dccLabel2.AutoSize = true;
            this.dccLabel2.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel2.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel2.Location = new System.Drawing.Point(209, 0);
            this.dccLabel2.Name = "dccLabel2";
            this.dccLabel2.Size = new System.Drawing.Size(28, 30);
            this.dccLabel2.TabIndex = 2;
            this.dccLabel2.Text = "To";
            this.dccLabel2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // txtToValue
            // 
            this.txtToValue.Location = new System.Drawing.Point(243, 3);
            this.txtToValue.Name = "txtToValue";
            this.txtToValue.Size = new System.Drawing.Size(74, 20);
            this.txtToValue.TabIndex = 3;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 6;
            this.tlpBase.SetColumnSpan(this.tlpTop, 3);
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 29.89395F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.0429F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 11.98704F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.935205F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.58315F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 24.40605F));
            this.tlpTop.Controls.Add(this.txtSatsangCentre, 0, 0);
            this.tlpTop.Controls.Add(this.intBadgeExpiryYear, 1, 0);
            this.tlpTop.Controls.Add(this.lblRetirementAge, 2, 0);
            this.tlpTop.Controls.Add(this.intGents, 3, 0);
            this.tlpTop.Controls.Add(this.intLadies, 4, 0);
            this.tlpTop.Controls.Add(this.sewadarListLookup1, 1, 1);
            this.tlpTop.Controls.Add(this.badgeTemplateCombo1, 0, 1);
            this.tlpTop.Controls.Add(this.txtDefaultRemarks, 3, 1);
            this.tlpTop.Controls.Add(this.tblFrontBack, 5, 0);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(3, 14);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 3;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.Size = new System.Drawing.Size(926, 114);
            this.tlpTop.TabIndex = 0;
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
            this.txtSatsangCentre.DisplayText = "";
            this.txtSatsangCentre.DisplayTextBindingKey = null;
            this.txtSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentre.EditingControlDataGridView = null;
            this.txtSatsangCentre.EditingControlFormattedValue = "";
            this.txtSatsangCentre.EditingControlRowIndex = 0;
            this.txtSatsangCentre.EditingControlValueChanged = false;
            this.txtSatsangCentre.EnableToolTip = false;
            this.txtSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentre.IdText = null;
            this.txtSatsangCentre.IdTextBindingKey = null;
            this.txtSatsangCentre.Location = new System.Drawing.Point(4, 3);
            this.txtSatsangCentre.Lookup = false;
            this.txtSatsangCentre.LookupColumns = null;
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
            this.txtSatsangCentre.Size = new System.Drawing.Size(269, 41);
            this.txtSatsangCentre.TabIndex = 0;
            this.txtSatsangCentre.TabStop = false;
            this.txtSatsangCentre.Title = "Satsang Centre";
            this.txtSatsangCentre.ToolTipLookupField = "information";
            this.txtSatsangCentre.ValueText = null;
            // 
            // intBadgeExpiryYear
            // 
            this.intBadgeExpiryYear.AllowsNew = false;
            this.intBadgeExpiryYear.AllowsReference = false;
            this.intBadgeExpiryYear.AllowsUpdate = false;
            this.intBadgeExpiryYear.ApplicationIdForDbConnection = null;
            this.intBadgeExpiryYear.BackColor = System.Drawing.Color.Transparent;
            this.intBadgeExpiryYear.CalledScreenApplicationId = null;
            this.intBadgeExpiryYear.CalledScreenTypeName = null;
            this.intBadgeExpiryYear.CallingScreenType = null;
            this.intBadgeExpiryYear.DisplayText = "";
            this.intBadgeExpiryYear.DisplayTextBindingKey = null;
            this.intBadgeExpiryYear.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intBadgeExpiryYear.EditingControlDataGridView = null;
            this.intBadgeExpiryYear.EditingControlFormattedValue = "";
            this.intBadgeExpiryYear.EditingControlRowIndex = 0;
            this.intBadgeExpiryYear.EditingControlValueChanged = false;
            this.intBadgeExpiryYear.EnableToolTip = false;
            this.intBadgeExpiryYear.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intBadgeExpiryYear.IdText = null;
            this.intBadgeExpiryYear.IdTextBindingKey = null;
            this.intBadgeExpiryYear.Location = new System.Drawing.Point(281, 3);
            this.intBadgeExpiryYear.Lookup = false;
            this.intBadgeExpiryYear.LookupColumns = null;
            this.intBadgeExpiryYear.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intBadgeExpiryYear.LookupResult = null;
            this.intBadgeExpiryYear.LookupTitle = "Badge Expiry Year";
            this.intBadgeExpiryYear.Mandatory = false;
            this.intBadgeExpiryYear.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intBadgeExpiryYear.MaxCharacterLength = 32767;
            this.intBadgeExpiryYear.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intBadgeExpiryYear.MaxValue = ((long)(9223372036854775807));
            this.intBadgeExpiryYear.MinCharactersForQuery = 0;
            this.intBadgeExpiryYear.MinimumSize = new System.Drawing.Size(10, 22);
            this.intBadgeExpiryYear.MinValue = ((long)(-9223372036854775808));
            this.intBadgeExpiryYear.Name = "intBadgeExpiryYear";
            this.intBadgeExpiryYear.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intBadgeExpiryYear.PascalCase = false;
            this.intBadgeExpiryYear.RangeInQueryMode = false;
            this.intBadgeExpiryYear.ReadOnly = false;
            this.intBadgeExpiryYear.RegularExpressionValidator = null;
            this.intBadgeExpiryYear.Size = new System.Drawing.Size(112, 41);
            this.intBadgeExpiryYear.TabIndex = 2;
            this.intBadgeExpiryYear.Title = "Badge Expiry Year";
            this.intBadgeExpiryYear.ToolTipLookupField = "information";
            this.intBadgeExpiryYear.ValueText = null;
            // 
            // lblRetirementAge
            // 
            this.lblRetirementAge.AutoSize = true;
            this.lblRetirementAge.BackColor = System.Drawing.Color.Transparent;
            this.lblRetirementAge.Dock = System.Windows.Forms.DockStyle.Right;
            this.lblRetirementAge.Font = new System.Drawing.Font("Verdana", 9F);
            this.lblRetirementAge.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblRetirementAge.Location = new System.Drawing.Point(401, 0);
            this.lblRetirementAge.Name = "lblRetirementAge";
            this.lblRetirementAge.Size = new System.Drawing.Size(104, 47);
            this.lblRetirementAge.TabIndex = 3;
            this.lblRetirementAge.Text = "Retirement Age";
            // 
            // intGents
            // 
            this.intGents.AllowsNew = false;
            this.intGents.AllowsReference = false;
            this.intGents.AllowsUpdate = false;
            this.intGents.ApplicationIdForDbConnection = null;
            this.intGents.BackColor = System.Drawing.Color.Transparent;
            this.intGents.CalledScreenApplicationId = null;
            this.intGents.CalledScreenTypeName = null;
            this.intGents.CallingScreenType = null;
            this.intGents.DisplayText = "";
            this.intGents.DisplayTextBindingKey = null;
            this.intGents.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intGents.EditingControlDataGridView = null;
            this.intGents.EditingControlFormattedValue = "";
            this.intGents.EditingControlRowIndex = 0;
            this.intGents.EditingControlValueChanged = false;
            this.intGents.EnableToolTip = false;
            this.intGents.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intGents.IdText = null;
            this.intGents.IdTextBindingKey = null;
            this.intGents.Location = new System.Drawing.Point(512, 3);
            this.intGents.Lookup = false;
            this.intGents.LookupColumns = null;
            this.intGents.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intGents.LookupResult = null;
            this.intGents.LookupTitle = "Gents";
            this.intGents.Mandatory = false;
            this.intGents.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intGents.MaxCharacterLength = 32767;
            this.intGents.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intGents.MaxValue = ((long)(9223372036854775807));
            this.intGents.MinCharactersForQuery = 0;
            this.intGents.MinimumSize = new System.Drawing.Size(10, 22);
            this.intGents.MinValue = ((long)(-9223372036854775808));
            this.intGents.Name = "intGents";
            this.intGents.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intGents.PascalCase = false;
            this.intGents.RangeInQueryMode = false;
            this.intGents.ReadOnly = false;
            this.intGents.RegularExpressionValidator = null;
            this.intGents.Size = new System.Drawing.Size(84, 41);
            this.intGents.TabIndex = 4;
            this.intGents.Title = "Gents";
            this.intGents.ToolTipLookupField = "information";
            this.intGents.ValueText = null;
            // 
            // intLadies
            // 
            this.intLadies.AllowsNew = false;
            this.intLadies.AllowsReference = false;
            this.intLadies.AllowsUpdate = false;
            this.intLadies.ApplicationIdForDbConnection = null;
            this.intLadies.BackColor = System.Drawing.Color.Transparent;
            this.intLadies.CalledScreenApplicationId = null;
            this.intLadies.CalledScreenTypeName = null;
            this.intLadies.CallingScreenType = null;
            this.intLadies.DisplayText = "";
            this.intLadies.DisplayTextBindingKey = null;
            this.intLadies.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intLadies.EditingControlDataGridView = null;
            this.intLadies.EditingControlFormattedValue = "";
            this.intLadies.EditingControlRowIndex = 0;
            this.intLadies.EditingControlValueChanged = false;
            this.intLadies.EnableToolTip = false;
            this.intLadies.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intLadies.IdText = null;
            this.intLadies.IdTextBindingKey = null;
            this.intLadies.Location = new System.Drawing.Point(604, 3);
            this.intLadies.Lookup = false;
            this.intLadies.LookupColumns = null;
            this.intLadies.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intLadies.LookupResult = null;
            this.intLadies.LookupTitle = "Ladies";
            this.intLadies.Mandatory = false;
            this.intLadies.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intLadies.MaxCharacterLength = 32767;
            this.intLadies.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intLadies.MaxValue = ((long)(9223372036854775807));
            this.intLadies.MinCharactersForQuery = 0;
            this.intLadies.MinimumSize = new System.Drawing.Size(10, 22);
            this.intLadies.MinValue = ((long)(-9223372036854775808));
            this.intLadies.Name = "intLadies";
            this.intLadies.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intLadies.PascalCase = false;
            this.intLadies.RangeInQueryMode = false;
            this.intLadies.ReadOnly = false;
            this.intLadies.RegularExpressionValidator = null;
            this.intLadies.Size = new System.Drawing.Size(90, 41);
            this.intLadies.TabIndex = 5;
            this.intLadies.Title = "Ladies";
            this.intLadies.ToolTipLookupField = "information";
            this.intLadies.ValueText = null;
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
            this.tlpTop.SetColumnSpan(this.sewadarListLookup1, 2);
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
            this.sewadarListLookup1.Location = new System.Drawing.Point(281, 50);
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
            this.sewadarListLookup1.Size = new System.Drawing.Size(223, 41);
            this.sewadarListLookup1.TabIndex = 7;
            this.sewadarListLookup1.Title = "Sewadar List";
            this.sewadarListLookup1.ToolTipLookupField = "information";
            this.sewadarListLookup1.ValueText = "";
            this.sewadarListLookup1.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.sewadarListLookup1_LookupResultSet);
            // 
            // badgeTemplateCombo1
            // 
            this.badgeTemplateCombo1.ApplicationIdForDbConnection = null;
            this.badgeTemplateCombo1.BackColor = System.Drawing.Color.Transparent;
            this.badgeTemplateCombo1.DisplayText = "";
            this.badgeTemplateCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.badgeTemplateCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.badgeTemplateCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.badgeTemplateCombo1.isGlobal = false;
            this.badgeTemplateCombo1.Location = new System.Drawing.Point(4, 50);
            this.badgeTemplateCombo1.Mandatory = true;
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
            this.badgeTemplateCombo1.Size = new System.Drawing.Size(269, 41);
            this.badgeTemplateCombo1.TabIndex = 6;
            this.badgeTemplateCombo1.Title = "Badge Template";
            this.badgeTemplateCombo1.ValueText = null;
            this.badgeTemplateCombo1.SelectedValueChanged += new System.EventHandler<System.EventArgs>(this.badgeTemplateCombo1_SelectedValueChanged);
            // 
            // txtDefaultRemarks
            // 
            this.txtDefaultRemarks.AllowsNew = false;
            this.txtDefaultRemarks.AllowsReference = false;
            this.txtDefaultRemarks.AllowsUpdate = false;
            this.txtDefaultRemarks.ApplicationIdForDbConnection = null;
            this.txtDefaultRemarks.BackColor = System.Drawing.Color.Transparent;
            this.txtDefaultRemarks.CalledScreenApplicationId = null;
            this.txtDefaultRemarks.CalledScreenTypeName = null;
            this.txtDefaultRemarks.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.txtDefaultRemarks, 3);
            this.txtDefaultRemarks.DisplayText = "";
            this.txtDefaultRemarks.DisplayTextBindingKey = null;
            this.txtDefaultRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDefaultRemarks.EditingControlDataGridView = null;
            this.txtDefaultRemarks.EditingControlFormattedValue = "";
            this.txtDefaultRemarks.EditingControlRowIndex = 0;
            this.txtDefaultRemarks.EditingControlValueChanged = false;
            this.txtDefaultRemarks.EnableToolTip = false;
            this.txtDefaultRemarks.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDefaultRemarks.IdText = null;
            this.txtDefaultRemarks.IdTextBindingKey = null;
            this.txtDefaultRemarks.Location = new System.Drawing.Point(512, 50);
            this.txtDefaultRemarks.Lookup = false;
            this.txtDefaultRemarks.LookupColumns = null;
            this.txtDefaultRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtDefaultRemarks.LookupResult = null;
            this.txtDefaultRemarks.LookupTitle = "Default Remarks";
            this.txtDefaultRemarks.Mandatory = false;
            this.txtDefaultRemarks.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtDefaultRemarks.MaxCharacterLength = 32767;
            this.txtDefaultRemarks.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtDefaultRemarks.MinCharactersForQuery = 0;
            this.txtDefaultRemarks.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtDefaultRemarks.Name = "txtDefaultRemarks";
            this.txtDefaultRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtDefaultRemarks.PascalCase = false;
            this.txtDefaultRemarks.RangeInQueryMode = false;
            this.txtDefaultRemarks.ReadOnly = false;
            this.txtDefaultRemarks.RegularExpressionValidator = null;
            this.txtDefaultRemarks.Size = new System.Drawing.Size(410, 41);
            this.txtDefaultRemarks.TabIndex = 8;
            this.txtDefaultRemarks.Title = "Default Remarks";
            this.txtDefaultRemarks.ToolTipLookupField = "information";
            this.txtDefaultRemarks.ValueText = null;
            // 
            // tblFrontBack
            // 
            this.tblFrontBack.ColumnCount = 3;
            this.tblFrontBack.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 36.93694F));
            this.tblFrontBack.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 34.68468F));
            this.tblFrontBack.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 28.82883F));
            this.tblFrontBack.Controls.Add(this.chkFront, 0, 0);
            this.tblFrontBack.Controls.Add(this.chkBack, 1, 0);
            this.tblFrontBack.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblFrontBack.Location = new System.Drawing.Point(701, 3);
            this.tblFrontBack.Name = "tblFrontBack";
            this.tblFrontBack.RowCount = 1;
            this.tblFrontBack.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tblFrontBack.Size = new System.Drawing.Size(222, 41);
            this.tblFrontBack.TabIndex = 9;
            // 
            // chkFront
            // 
            this.chkFront.AutoSize = true;
            this.chkFront.BackColor = System.Drawing.Color.Transparent;
            this.chkFront.BindingKey = null;
            this.chkFront.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkFront.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkFront.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkFront.Location = new System.Drawing.Point(3, 3);
            this.chkFront.Name = "chkFront";
            this.chkFront.Size = new System.Drawing.Size(75, 35);
            this.chkFront.TabIndex = 0;
            this.chkFront.Text = "Front ?";
            this.chkFront.UseVisualStyleBackColor = true;
            // 
            // chkBack
            // 
            this.chkBack.AutoSize = true;
            this.chkBack.BackColor = System.Drawing.Color.Transparent;
            this.chkBack.BindingKey = null;
            this.chkBack.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkBack.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkBack.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkBack.Location = new System.Drawing.Point(84, 3);
            this.chkBack.Name = "chkBack";
            this.chkBack.Size = new System.Drawing.Size(70, 35);
            this.chkBack.TabIndex = 1;
            this.chkBack.Text = "Back ?";
            this.chkBack.UseVisualStyleBackColor = true;
            // 
            // BadgePrinting
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(932, 601);
            this.Controls.Add(this.tlpBase);
            this.Name = "BadgePrinting";
            this.Text = "Badge Printing";
            this.tlpBase.ResumeLayout(false);
            this.InnerSplitPanel.Panel1.ResumeLayout(false);
            this.InnerSplitPanel.Panel2.ResumeLayout(false);
            this.InnerSplitPanel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSewadars)).EndInit();
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.dccTableLayoutPanel1.PerformLayout();
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
            this.tblFrontBack.ResumeLayout(false);
            this.tblFrontBack.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private UMB.CDF.UIControls.Grid.DCCGrid grdSewadars;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn full_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn department;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn expiry_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn printing_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn photo_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn weekly_sewa_location_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn department_id;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentre;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField intBadgeExpiryYear;
        private UMB.CDF.UIControls.DCCLabel lblRetirementAge;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField intGents;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField intLadies;
        private Controls.ZSMLookups.SewadarListLookup sewadarListLookup1;
        private Controls.Combos.BadgeTemplateCombo badgeTemplateCombo1;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtDefaultRemarks;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tblFrontBack;
        private UMB.CDF.UIControls.DCCCheckBox chkFront;
        private UMB.CDF.UIControls.DCCCheckBox chkBack;
        private System.Windows.Forms.SplitContainer InnerSplitPanel;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private UMB.CDF.UIControls.DCCLabel dccLabel1;
        private System.Windows.Forms.TextBox txtFromValue;
        private UMB.CDF.UIControls.DCCLabel dccLabel2;
        private System.Windows.Forms.TextBox txtToValue;

    }
}
