namespace DCC.ZOS.ZSM.ACT
{
    partial class ImportScannedBadgesForJob
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ImportScannedBadgesForJob));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dtControlingDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.lkpSubJobName = new DCC.ZOS.ZSM.Controls.ZSMLookups.SubJobNameLookup();
            this.txtExcelLoc = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dccTableLayoutPanel2 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnExcelLoc = new System.Windows.Forms.Button();
            this.btn_import = new System.Windows.Forms.Button();
            this.chkSpecifyFormat = new System.Windows.Forms.CheckBox();
            this.cboDateFormat = new System.Windows.Forms.ComboBox();
            this.txtSatsangCentreName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.grdScannedBadges = new System.Windows.Forms.DataGridView();
            this.table_count = new System.Windows.Forms.Label();
            this.dtJobStartFinish = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.tlpContainer = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccTableLayoutPanel3 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnProcess = new System.Windows.Forms.Button();
            this.lkpJobName = new DCC.ZOS.ZSM.Controls.ZSMLookups.JobNameLookup();
            this.dccTableLayoutPanel4 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btn_OK = new System.Windows.Forms.Button();
            this.btn_Reset = new System.Windows.Forms.Button();
            this.btnViewLogs = new System.Windows.Forms.Button();
            this.txtFolderLocation = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dccTableLayoutPanel5 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnFolderLocation = new System.Windows.Forms.Button();
            this.btnImportFolder = new System.Windows.Forms.Button();
            this.dccTableLayoutPanel6 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.chkImportFormat = new System.Windows.Forms.CheckBox();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.dccTableLayoutPanel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdScannedBadges)).BeginInit();
            this.dtJobStartFinish.SuspendLayout();
            this.dccTableLayoutPanel4.SuspendLayout();
            this.dccTableLayoutPanel5.SuspendLayout();
            this.dccTableLayoutPanel6.SuspendLayout();
            this.SuspendLayout();
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 3;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 28.57143F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 71.42857F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 261F));
            this.dccTableLayoutPanel1.Controls.Add(this.dtControlingDate, 0, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.lkpSubJobName, 2, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.txtExcelLoc, 0, 3);
            this.dccTableLayoutPanel1.Controls.Add(this.dccTableLayoutPanel2, 2, 3);
            this.dccTableLayoutPanel1.Controls.Add(this.txtSatsangCentreName, 1, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.grdScannedBadges, 0, 5);
            this.dccTableLayoutPanel1.Controls.Add(this.table_count, 0, 7);
            this.dccTableLayoutPanel1.Controls.Add(this.dtJobStartFinish, 0, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.btnProcess, 1, 8);
            this.dccTableLayoutPanel1.Controls.Add(this.lkpJobName, 1, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.dccTableLayoutPanel4, 1, 7);
            this.dccTableLayoutPanel1.Controls.Add(this.btnViewLogs, 2, 7);
            this.dccTableLayoutPanel1.Controls.Add(this.txtFolderLocation, 0, 4);
            this.dccTableLayoutPanel1.Controls.Add(this.dccTableLayoutPanel5, 2, 4);
            this.dccTableLayoutPanel1.Controls.Add(this.dccTableLayoutPanel6, 2, 2);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Left;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 9;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 45F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 45F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 59F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 54F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 47F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 154F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 14F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 42F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 16F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 16F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 16F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(644, 509);
            this.dccTableLayoutPanel1.TabIndex = 0;
            this.dccTableLayoutPanel1.Paint += new System.Windows.Forms.PaintEventHandler(this.dccTableLayoutPanel1_Paint);
            // 
            // dtControlingDate
            // 
            this.dtControlingDate.AllowFutureDate = true;
            this.dtControlingDate.AllowsNew = false;
            this.dtControlingDate.AllowsReference = false;
            this.dtControlingDate.AllowsUpdate = false;
            this.dtControlingDate.ApplicationIdForDbConnection = null;
            this.dtControlingDate.BackColor = System.Drawing.Color.Transparent;
            this.dtControlingDate.CalledScreenApplicationId = null;
            this.dtControlingDate.CalledScreenTypeName = null;
            this.dtControlingDate.CallingScreenType = null;
            this.dtControlingDate.DisplayText = null;
            this.dtControlingDate.DisplayTextAsDateTime = null;
            this.dtControlingDate.DisplayTextBindingKey = "controlling_dt";
            this.dtControlingDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtControlingDate.EditingControlDataGridView = null;
            this.dtControlingDate.EditingControlFormattedValue = null;
            this.dtControlingDate.EditingControlRowIndex = 0;
            this.dtControlingDate.EditingControlValueChanged = false;
            this.dtControlingDate.EnableToolTip = false;
            this.dtControlingDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtControlingDate.IdText = "";
            this.dtControlingDate.IdTextBindingKey = "controlling_dt";
            this.dtControlingDate.Location = new System.Drawing.Point(4, 48);
            this.dtControlingDate.Lookup = true;
            this.dtControlingDate.LookupColumns = null;
            this.dtControlingDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtControlingDate.LookupResult = null;
            this.dtControlingDate.LookupTitle = "Controlling  Date";
            this.dtControlingDate.Mandatory = false;
            this.dtControlingDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtControlingDate.MaxCharacterLength = 11;
            this.dtControlingDate.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtControlingDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtControlingDate.MinCharactersForQuery = 0;
            this.dtControlingDate.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtControlingDate.MinValue = new System.DateTime(((long)(0)));
            this.dtControlingDate.Name = "dtControlingDate";
            this.dtControlingDate.Padding = new System.Windows.Forms.Padding(0, 14, 10, 0);
            this.dtControlingDate.PascalCase = false;
            this.dtControlingDate.RangeInQueryMode = false;
            this.dtControlingDate.ReadOnly = true;
            this.dtControlingDate.RegularExpressionValidator = null;
            this.dtControlingDate.ShowTime = false;
            this.dtControlingDate.Size = new System.Drawing.Size(101, 39);
            this.dtControlingDate.TabIndex = 83;
            this.dtControlingDate.TabStop = false;
            this.dtControlingDate.Title = "Controlling  Date";
            this.dtControlingDate.ToolTipLookupField = "information";
            this.dtControlingDate.ValueText = "";
            // 
            // lkpSubJobName
            // 
            this.lkpSubJobName.AllowsNew = false;
            this.lkpSubJobName.AllowsReference = false;
            this.lkpSubJobName.AllowsUpdate = false;
            this.lkpSubJobName.ApplicationIdForDbConnection = null;
            this.lkpSubJobName.BackColor = System.Drawing.Color.Transparent;
            this.lkpSubJobName.CalledScreenApplicationId = null;
            this.lkpSubJobName.CalledScreenTypeName = null;
            this.lkpSubJobName.CallingScreenType = null;
            this.lkpSubJobName.DisplayText = "";
            this.lkpSubJobName.DisplayTextBindingKey = "SubJobName";
            this.lkpSubJobName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpSubJobName.EditingControlDataGridView = null;
            this.lkpSubJobName.EditingControlFormattedValue = null;
            this.lkpSubJobName.EditingControlRowIndex = 0;
            this.lkpSubJobName.EditingControlValueChanged = true;
            this.lkpSubJobName.EnableToolTip = false;
            this.lkpSubJobName.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lkpSubJobName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpSubJobName.IdText = "";
            this.lkpSubJobName.IdTextBindingKey = "SubJobId";
            this.lkpSubJobName.Location = new System.Drawing.Point(386, 48);
            this.lkpSubJobName.Lookup = true;
            this.lkpSubJobName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpSubJobName.LookupResult = null;
            this.lkpSubJobName.LookupTitle = "Sub Job Name";
            this.lkpSubJobName.Mandatory = false;
            this.lkpSubJobName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.lkpSubJobName.MaxCharacterLength = 32767;
            this.lkpSubJobName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.lkpSubJobName.MinCharactersForQuery = 0;
            this.lkpSubJobName.MinimumSize = new System.Drawing.Size(10, 22);
            this.lkpSubJobName.Name = "lkpSubJobName";
            this.lkpSubJobName.Padding = new System.Windows.Forms.Padding(0, 14, 10, 0);
            this.lkpSubJobName.PascalCase = false;
            this.lkpSubJobName.RangeInQueryMode = false;
            this.lkpSubJobName.ReadOnly = false;
            this.lkpSubJobName.RegularExpressionValidator = null;
            this.lkpSubJobName.Size = new System.Drawing.Size(254, 39);
            this.lkpSubJobName.TabIndex = 86;
            this.lkpSubJobName.Title = "Sub Job Name";
            this.lkpSubJobName.ToolTipLookupField = "information";
            this.lkpSubJobName.ValueText = "";
            // 
            // txtExcelLoc
            // 
            this.txtExcelLoc.AllowsNew = false;
            this.txtExcelLoc.AllowsReference = false;
            this.txtExcelLoc.AllowsUpdate = false;
            this.txtExcelLoc.ApplicationIdForDbConnection = null;
            this.txtExcelLoc.BackColor = System.Drawing.Color.Transparent;
            this.txtExcelLoc.CalledScreenApplicationId = null;
            this.txtExcelLoc.CalledScreenTypeName = null;
            this.txtExcelLoc.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.txtExcelLoc, 2);
            this.txtExcelLoc.DisplayText = "";
            this.txtExcelLoc.DisplayTextBindingKey = null;
            this.txtExcelLoc.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtExcelLoc.EditingControlDataGridView = null;
            this.txtExcelLoc.EditingControlFormattedValue = "";
            this.txtExcelLoc.EditingControlRowIndex = 0;
            this.txtExcelLoc.EditingControlValueChanged = false;
            this.txtExcelLoc.EnableToolTip = false;
            this.txtExcelLoc.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtExcelLoc.IdText = null;
            this.txtExcelLoc.IdTextBindingKey = null;
            this.txtExcelLoc.Location = new System.Drawing.Point(4, 152);
            this.txtExcelLoc.Lookup = false;
            this.txtExcelLoc.LookupColumns = null;
            this.txtExcelLoc.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtExcelLoc.LookupResult = null;
            this.txtExcelLoc.LookupTitle = "CSV Location";
            this.txtExcelLoc.Mandatory = true;
            this.txtExcelLoc.Margin = new System.Windows.Forms.Padding(4, 3, 0, 3);
            this.txtExcelLoc.MaxCharacterLength = 32767;
            this.txtExcelLoc.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtExcelLoc.MinCharactersForQuery = 0;
            this.txtExcelLoc.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtExcelLoc.Name = "txtExcelLoc";
            this.txtExcelLoc.Padding = new System.Windows.Forms.Padding(0, 14, 0, 0);
            this.txtExcelLoc.PascalCase = false;
            this.txtExcelLoc.RangeInQueryMode = false;
            this.txtExcelLoc.ReadOnly = true;
            this.txtExcelLoc.RegularExpressionValidator = null;
            this.txtExcelLoc.Size = new System.Drawing.Size(378, 45);
            this.txtExcelLoc.TabIndex = 89;
            this.txtExcelLoc.TabStop = false;
            this.txtExcelLoc.Title = "CSV Location";
            this.txtExcelLoc.ToolTipLookupField = "information";
            this.txtExcelLoc.ValueText = null;
            // 
            // dccTableLayoutPanel2
            // 
            this.dccTableLayoutPanel2.ColumnCount = 3;
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 14.97006F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 85.02994F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 133F));
            this.dccTableLayoutPanel2.Controls.Add(this.btnExcelLoc, 0, 0);
            this.dccTableLayoutPanel2.Controls.Add(this.btn_import, 2, 0);
            this.dccTableLayoutPanel2.Controls.Add(this.chkSpecifyFormat, 1, 0);
            this.dccTableLayoutPanel2.Controls.Add(this.cboDateFormat, 1, 1);
            this.dccTableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel2.Location = new System.Drawing.Point(384, 151);
            this.dccTableLayoutPanel2.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dccTableLayoutPanel2.Name = "dccTableLayoutPanel2";
            this.dccTableLayoutPanel2.RowCount = 2;
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 27F));
            this.dccTableLayoutPanel2.Size = new System.Drawing.Size(258, 50);
            this.dccTableLayoutPanel2.TabIndex = 91;
            // 
            // btnExcelLoc
            // 
            this.btnExcelLoc.Image = ((System.Drawing.Image)(resources.GetObject("btnExcelLoc.Image")));
            this.btnExcelLoc.Location = new System.Drawing.Point(0, 20);
            this.btnExcelLoc.Margin = new System.Windows.Forms.Padding(0, 20, 4, 3);
            this.btnExcelLoc.MaximumSize = new System.Drawing.Size(25, 25);
            this.btnExcelLoc.Name = "btnExcelLoc";
            this.dccTableLayoutPanel2.SetRowSpan(this.btnExcelLoc, 2);
            this.btnExcelLoc.Size = new System.Drawing.Size(14, 17);
            this.btnExcelLoc.TabIndex = 90;
            this.btnExcelLoc.UseVisualStyleBackColor = true;
            this.btnExcelLoc.Click += new System.EventHandler(this.btnExcelLoc_Click);
            // 
            // btn_import
            // 
            this.btn_import.Location = new System.Drawing.Point(127, 3);
            this.btn_import.Name = "btn_import";
            this.dccTableLayoutPanel2.SetRowSpan(this.btn_import, 2);
            this.btn_import.Size = new System.Drawing.Size(75, 34);
            this.btn_import.TabIndex = 74;
            this.btn_import.Text = "Import";
            this.btn_import.UseVisualStyleBackColor = true;
            this.btn_import.Click += new System.EventHandler(this.btn_import_Click);
            // 
            // chkSpecifyFormat
            // 
            this.chkSpecifyFormat.AutoSize = true;
            this.chkSpecifyFormat.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkSpecifyFormat.Location = new System.Drawing.Point(21, 3);
            this.chkSpecifyFormat.Name = "chkSpecifyFormat";
            this.chkSpecifyFormat.Size = new System.Drawing.Size(100, 17);
            this.chkSpecifyFormat.TabIndex = 94;
            this.chkSpecifyFormat.Text = "Specify Date Format";
            this.chkSpecifyFormat.UseVisualStyleBackColor = true;
            this.chkSpecifyFormat.CheckedChanged += new System.EventHandler(this.chkSpecifyFormat_CheckedChanged);
            // 
            // cboDateFormat
            // 
            this.cboDateFormat.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cboDateFormat.FormattingEnabled = true;
            this.cboDateFormat.Location = new System.Drawing.Point(21, 26);
            this.cboDateFormat.Name = "cboDateFormat";
            this.cboDateFormat.Size = new System.Drawing.Size(100, 21);
            this.cboDateFormat.TabIndex = 100;
            this.cboDateFormat.Visible = false;
            // 
            // txtSatsangCentreName
            // 
            this.txtSatsangCentreName.AllowsNew = false;
            this.txtSatsangCentreName.AllowsReference = false;
            this.txtSatsangCentreName.AllowsUpdate = false;
            this.txtSatsangCentreName.ApplicationIdForDbConnection = null;
            this.txtSatsangCentreName.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangCentreName.CalledScreenApplicationId = null;
            this.txtSatsangCentreName.CalledScreenTypeName = null;
            this.txtSatsangCentreName.CallingScreenType = null;
            this.txtSatsangCentreName.DisplayText = "";
            this.txtSatsangCentreName.DisplayTextBindingKey = "first_nm";
            this.txtSatsangCentreName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentreName.EditingControlDataGridView = null;
            this.txtSatsangCentreName.EditingControlFormattedValue = "";
            this.txtSatsangCentreName.EditingControlRowIndex = 0;
            this.txtSatsangCentreName.EditingControlValueChanged = false;
            this.txtSatsangCentreName.EnableToolTip = false;
            this.txtSatsangCentreName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentreName.IdText = null;
            this.txtSatsangCentreName.IdTextBindingKey = null;
            this.txtSatsangCentreName.Location = new System.Drawing.Point(113, 3);
            this.txtSatsangCentreName.Lookup = false;
            this.txtSatsangCentreName.LookupColumns = null;
            this.txtSatsangCentreName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentreName.LookupResult = null;
            this.txtSatsangCentreName.LookupTitle = "Satsang Centre Name";
            this.txtSatsangCentreName.Mandatory = false;
            this.txtSatsangCentreName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSatsangCentreName.MaxCharacterLength = 32767;
            this.txtSatsangCentreName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSatsangCentreName.MinCharactersForQuery = 0;
            this.txtSatsangCentreName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSatsangCentreName.Name = "txtSatsangCentreName";
            this.txtSatsangCentreName.Padding = new System.Windows.Forms.Padding(0, 14, 0, 0);
            this.txtSatsangCentreName.PascalCase = false;
            this.txtSatsangCentreName.RangeInQueryMode = false;
            this.txtSatsangCentreName.ReadOnly = true;
            this.txtSatsangCentreName.RegularExpressionValidator = null;
            this.txtSatsangCentreName.Size = new System.Drawing.Size(265, 39);
            this.txtSatsangCentreName.TabIndex = 93;
            this.txtSatsangCentreName.TabStop = false;
            this.txtSatsangCentreName.Title = "Satsang Centre Name";
            this.txtSatsangCentreName.ToolTipLookupField = "information";
            this.txtSatsangCentreName.ValueText = null;
            // 
            // grdScannedBadges
            // 
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdScannedBadges.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdScannedBadges.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dccTableLayoutPanel1.SetColumnSpan(this.grdScannedBadges, 2);
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.grdScannedBadges.DefaultCellStyle = dataGridViewCellStyle2;
            this.grdScannedBadges.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdScannedBadges.Location = new System.Drawing.Point(3, 253);
            this.grdScannedBadges.Name = "grdScannedBadges";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdScannedBadges.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.grdScannedBadges.RowHeadersWidth = 51;
            this.grdScannedBadges.Size = new System.Drawing.Size(376, 148);
            this.grdScannedBadges.TabIndex = 94;
            // 
            // table_count
            // 
            this.table_count.AutoSize = true;
            this.table_count.Dock = System.Windows.Forms.DockStyle.Fill;
            this.table_count.Location = new System.Drawing.Point(2, 418);
            this.table_count.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.table_count.Name = "table_count";
            this.table_count.Size = new System.Drawing.Size(105, 42);
            this.table_count.TabIndex = 96;
            this.table_count.Text = "table count";
            // 
            // dtJobStartFinish
            // 
            this.dccTableLayoutPanel1.SetColumnSpan(this.dtJobStartFinish, 2);
            this.dtJobStartFinish.Controls.Add(this.tlpContainer);
            this.dtJobStartFinish.Controls.Add(this.dccTableLayoutPanel3);
            this.dtJobStartFinish.DiscreteInQueryMode = false;
            this.dtJobStartFinish.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtJobStartFinish.FillDefailtValuesInInsertMode = false;
            this.dtJobStartFinish.FromDate = null;
            this.dtJobStartFinish.FromDateFieldBindingKey = "";
            this.dtJobStartFinish.FromDateMandatory = false;
            this.dtJobStartFinish.FromDateTitle = "Job Start Date";
            this.dtJobStartFinish.Location = new System.Drawing.Point(4, 94);
            this.dtJobStartFinish.Mandatory = false;
            this.dtJobStartFinish.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dtJobStartFinish.Name = "dtJobStartFinish";
            this.dtJobStartFinish.ReadOnly = true;
            this.dtJobStartFinish.Size = new System.Drawing.Size(374, 51);
            this.dtJobStartFinish.TabIndex = 97;
            this.dtJobStartFinish.TitleInQueryMode = null;
            this.dtJobStartFinish.ToDate = null;
            this.dtJobStartFinish.ToDateFieldBindingKey = "";
            this.dtJobStartFinish.ToDateMandatory = false;
            this.dtJobStartFinish.ToDateTitle = "Effective Till Date";
            // 
            // tlpContainer
            // 
            this.tlpContainer.ColumnCount = 2;
            this.tlpContainer.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpContainer.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpContainer.Location = new System.Drawing.Point(0, 0);
            this.tlpContainer.Margin = new System.Windows.Forms.Padding(4);
            this.tlpContainer.MaximumSize = new System.Drawing.Size(2667, 55);
            this.tlpContainer.Name = "tlpContainer";
            this.tlpContainer.RowCount = 1;
            this.tlpContainer.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpContainer.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 55F));
            this.tlpContainer.Size = new System.Drawing.Size(374, 51);
            this.tlpContainer.TabIndex = 2;
            // 
            // dccTableLayoutPanel3
            // 
            this.dccTableLayoutPanel3.ColumnCount = 2;
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel3.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel3.MaximumSize = new System.Drawing.Size(2000, 45);
            this.dccTableLayoutPanel3.Name = "dccTableLayoutPanel3";
            this.dccTableLayoutPanel3.RowCount = 1;
            this.dccTableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 45F));
            this.dccTableLayoutPanel3.Size = new System.Drawing.Size(374, 45);
            this.dccTableLayoutPanel3.TabIndex = 2;
            // 
            // btnProcess
            // 
            this.btnProcess.Location = new System.Drawing.Point(112, 463);
            this.btnProcess.Name = "btnProcess";
            this.btnProcess.Size = new System.Drawing.Size(194, 34);
            this.btnProcess.TabIndex = 98;
            this.btnProcess.Text = "Process";
            this.btnProcess.UseVisualStyleBackColor = true;
            this.btnProcess.Visible = false;
            this.btnProcess.Click += new System.EventHandler(this.btnProcess_Click);
            // 
            // lkpJobName
            // 
            this.lkpJobName.AllowsNew = false;
            this.lkpJobName.AllowsReference = false;
            this.lkpJobName.AllowsUpdate = false;
            this.lkpJobName.ApplicationIdForDbConnection = null;
            this.lkpJobName.BackColor = System.Drawing.Color.Transparent;
            this.lkpJobName.CalledScreenApplicationId = null;
            this.lkpJobName.CalledScreenTypeName = null;
            this.lkpJobName.CallingScreenType = null;
            this.lkpJobName.DisplayText = "";
            this.lkpJobName.DisplayTextBindingKey = "JobName";
            this.lkpJobName.Dock = System.Windows.Forms.DockStyle.Top;
            this.lkpJobName.EditingControlDataGridView = null;
            this.lkpJobName.EditingControlFormattedValue = null;
            this.lkpJobName.EditingControlRowIndex = 0;
            this.lkpJobName.EditingControlValueChanged = true;
            this.lkpJobName.EnableToolTip = false;
            this.lkpJobName.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lkpJobName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpJobName.IdText = "";
            this.lkpJobName.IdTextBindingKey = "JobId";
            this.lkpJobName.Location = new System.Drawing.Point(113, 48);
            this.lkpJobName.Lookup = true;
            this.lkpJobName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpJobName.LookupResult = null;
            this.lkpJobName.LookupTitle = "Job Name";
            this.lkpJobName.Mandatory = false;
            this.lkpJobName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.lkpJobName.MaxCharacterLength = 32767;
            this.lkpJobName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.lkpJobName.MinCharactersForQuery = 0;
            this.lkpJobName.MinimumSize = new System.Drawing.Size(10, 22);
            this.lkpJobName.Name = "lkpJobName";
            this.lkpJobName.Padding = new System.Windows.Forms.Padding(0, 14, 10, 0);
            this.lkpJobName.PascalCase = false;
            this.lkpJobName.RangeInQueryMode = false;
            this.lkpJobName.ReadOnly = false;
            this.lkpJobName.RegularExpressionValidator = null;
            this.lkpJobName.Size = new System.Drawing.Size(265, 38);
            this.lkpJobName.TabIndex = 99;
            this.lkpJobName.Title = "Job Name";
            this.lkpJobName.ToolTipLookupField = "information";
            this.lkpJobName.ValueText = "";
            this.lkpJobName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lkpJobName_LookupDialogShowing);
            this.lkpJobName.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.lkpJobName_LookupResultSet);
            // 
            // dccTableLayoutPanel4
            // 
            this.dccTableLayoutPanel4.ColumnCount = 2;
            this.dccTableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel4.Controls.Add(this.btn_OK, 0, 0);
            this.dccTableLayoutPanel4.Controls.Add(this.btn_Reset, 1, 0);
            this.dccTableLayoutPanel4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel4.Location = new System.Drawing.Point(112, 421);
            this.dccTableLayoutPanel4.Name = "dccTableLayoutPanel4";
            this.dccTableLayoutPanel4.RowCount = 1;
            this.dccTableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel4.Size = new System.Drawing.Size(267, 36);
            this.dccTableLayoutPanel4.TabIndex = 100;
            // 
            // btn_OK
            // 
            this.btn_OK.Location = new System.Drawing.Point(3, 3);
            this.btn_OK.Name = "btn_OK";
            this.btn_OK.Size = new System.Drawing.Size(75, 23);
            this.btn_OK.TabIndex = 76;
            this.btn_OK.Text = "OK";
            this.btn_OK.UseVisualStyleBackColor = true;
            this.btn_OK.Click += new System.EventHandler(this.btn_OK_Click);
            // 
            // btn_Reset
            // 
            this.btn_Reset.Location = new System.Drawing.Point(135, 2);
            this.btn_Reset.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_Reset.Name = "btn_Reset";
            this.btn_Reset.Size = new System.Drawing.Size(88, 25);
            this.btn_Reset.TabIndex = 77;
            this.btn_Reset.Text = "Reset";
            this.btn_Reset.UseVisualStyleBackColor = true;
            this.btn_Reset.Click += new System.EventHandler(this.btn_Reset_Click);
            // 
            // btnViewLogs
            // 
            this.btnViewLogs.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnViewLogs.Location = new System.Drawing.Point(385, 421);
            this.btnViewLogs.Name = "btnViewLogs";
            this.btnViewLogs.Size = new System.Drawing.Size(138, 36);
            this.btnViewLogs.TabIndex = 101;
            this.btnViewLogs.Text = "View Import Logs";
            this.btnViewLogs.UseVisualStyleBackColor = true;
            this.btnViewLogs.Click += new System.EventHandler(this.btnViewLogs_Click);
            // 
            // txtFolderLocation
            // 
            this.txtFolderLocation.AllowsNew = false;
            this.txtFolderLocation.AllowsReference = false;
            this.txtFolderLocation.AllowsUpdate = false;
            this.txtFolderLocation.ApplicationIdForDbConnection = null;
            this.txtFolderLocation.BackColor = System.Drawing.Color.Transparent;
            this.txtFolderLocation.CalledScreenApplicationId = null;
            this.txtFolderLocation.CalledScreenTypeName = null;
            this.txtFolderLocation.CallingScreenType = null;
            this.dccTableLayoutPanel1.SetColumnSpan(this.txtFolderLocation, 2);
            this.txtFolderLocation.DisplayText = "";
            this.txtFolderLocation.DisplayTextBindingKey = null;
            this.txtFolderLocation.EditingControlDataGridView = null;
            this.txtFolderLocation.EditingControlFormattedValue = "";
            this.txtFolderLocation.EditingControlRowIndex = 0;
            this.txtFolderLocation.EditingControlValueChanged = false;
            this.txtFolderLocation.EnableToolTip = false;
            this.txtFolderLocation.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFolderLocation.IdText = null;
            this.txtFolderLocation.IdTextBindingKey = null;
            this.txtFolderLocation.Location = new System.Drawing.Point(4, 206);
            this.txtFolderLocation.Lookup = false;
            this.txtFolderLocation.LookupColumns = null;
            this.txtFolderLocation.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtFolderLocation.LookupResult = null;
            this.txtFolderLocation.LookupTitle = "Bulk import folder location";
            this.txtFolderLocation.Mandatory = true;
            this.txtFolderLocation.Margin = new System.Windows.Forms.Padding(4, 3, 0, 3);
            this.txtFolderLocation.MaxCharacterLength = 32767;
            this.txtFolderLocation.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtFolderLocation.MinCharactersForQuery = 0;
            this.txtFolderLocation.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtFolderLocation.Name = "txtFolderLocation";
            this.txtFolderLocation.Padding = new System.Windows.Forms.Padding(0, 14, 0, 0);
            this.txtFolderLocation.PascalCase = false;
            this.txtFolderLocation.RangeInQueryMode = false;
            this.txtFolderLocation.ReadOnly = true;
            this.txtFolderLocation.RegularExpressionValidator = null;
            this.txtFolderLocation.Size = new System.Drawing.Size(378, 41);
            this.txtFolderLocation.TabIndex = 103;
            this.txtFolderLocation.TabStop = false;
            this.txtFolderLocation.Title = "Bulk import folder location";
            this.txtFolderLocation.ToolTipLookupField = "information";
            this.txtFolderLocation.ValueText = null;
            // 
            // dccTableLayoutPanel5
            // 
            this.dccTableLayoutPanel5.ColumnCount = 2;
            this.dccTableLayoutPanel5.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 14.97006F));
            this.dccTableLayoutPanel5.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 85.02994F));
            this.dccTableLayoutPanel5.Controls.Add(this.btnFolderLocation, 0, 0);
            this.dccTableLayoutPanel5.Controls.Add(this.btnImportFolder, 1, 0);
            this.dccTableLayoutPanel5.Location = new System.Drawing.Point(384, 205);
            this.dccTableLayoutPanel5.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dccTableLayoutPanel5.Name = "dccTableLayoutPanel5";
            this.dccTableLayoutPanel5.RowCount = 1;
            this.dccTableLayoutPanel5.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel5.Size = new System.Drawing.Size(255, 43);
            this.dccTableLayoutPanel5.TabIndex = 104;
            // 
            // btnFolderLocation
            // 
            this.btnFolderLocation.Image = ((System.Drawing.Image)(resources.GetObject("btnFolderLocation.Image")));
            this.btnFolderLocation.Location = new System.Drawing.Point(0, 20);
            this.btnFolderLocation.Margin = new System.Windows.Forms.Padding(0, 20, 4, 3);
            this.btnFolderLocation.MaximumSize = new System.Drawing.Size(25, 25);
            this.btnFolderLocation.Name = "btnFolderLocation";
            this.btnFolderLocation.Size = new System.Drawing.Size(18, 17);
            this.btnFolderLocation.TabIndex = 90;
            this.btnFolderLocation.UseVisualStyleBackColor = true;
            this.btnFolderLocation.Click += new System.EventHandler(this.btnFolderLocation_Click);
            // 
            // btnImportFolder
            // 
            this.btnImportFolder.Enabled = false;
            this.btnImportFolder.Location = new System.Drawing.Point(41, 3);
            this.btnImportFolder.Name = "btnImportFolder";
            this.btnImportFolder.Size = new System.Drawing.Size(146, 34);
            this.btnImportFolder.TabIndex = 102;
            this.btnImportFolder.Text = "Import Folder";
            this.btnImportFolder.UseVisualStyleBackColor = true;
            this.btnImportFolder.Click += new System.EventHandler(this.btnImportFolder_Click);
            // 
            // dccTableLayoutPanel6
            // 
            this.dccTableLayoutPanel6.ColumnCount = 2;
            this.dccTableLayoutPanel6.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel6.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 234F));
            this.dccTableLayoutPanel6.Controls.Add(this.chkImportFormat, 1, 1);
            this.dccTableLayoutPanel6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel6.Location = new System.Drawing.Point(385, 93);
            this.dccTableLayoutPanel6.Name = "dccTableLayoutPanel6";
            this.dccTableLayoutPanel6.RowCount = 2;
            this.dccTableLayoutPanel6.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel6.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 23F));
            this.dccTableLayoutPanel6.Size = new System.Drawing.Size(256, 53);
            this.dccTableLayoutPanel6.TabIndex = 105;
            // 
            // chkImportFormat
            // 
            this.chkImportFormat.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.chkImportFormat.AutoSize = true;
            this.chkImportFormat.Location = new System.Drawing.Point(25, 33);
            this.chkImportFormat.Name = "chkImportFormat";
            this.chkImportFormat.Size = new System.Drawing.Size(228, 17);
            this.chkImportFormat.TabIndex = 0;
            this.chkImportFormat.Text = "Old File Format";
            this.chkImportFormat.UseVisualStyleBackColor = true;
            this.chkImportFormat.CheckedChanged += new System.EventHandler(this.chkImportFormat_CheckedChanged);
            // 
            // ImportScannedBadgesForJob
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(652, 509);
            this.Controls.Add(this.dccTableLayoutPanel1);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "ImportScannedBadgesForJob";
            this.Text = "Import Scanned Badges For Job";
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.dccTableLayoutPanel1.PerformLayout();
            this.dccTableLayoutPanel2.ResumeLayout(false);
            this.dccTableLayoutPanel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdScannedBadges)).EndInit();
            this.dtJobStartFinish.ResumeLayout(false);
            this.dccTableLayoutPanel4.ResumeLayout(false);
            this.dccTableLayoutPanel5.ResumeLayout(false);
            this.dccTableLayoutPanel6.ResumeLayout(false);
            this.dccTableLayoutPanel6.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private System.Windows.Forms.Button btn_import;
        private System.Windows.Forms.Button btn_Reset;
        private System.Windows.Forms.Button btn_OK;
        private UMB.CDF.UIControls.TextControls.DCCDateTimeField dtControlingDate;
        private Controls.ZSMLookups.SubJobNameLookup lkpSubJobName;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtExcelLoc;
        private System.Windows.Forms.Button btnExcelLoc;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel2;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentreName;
        private System.Windows.Forms.DataGridView grdScannedBadges;
        private System.Windows.Forms.Label table_count;
        private UMB.CDF.UIControls.TextControls.DateRangePair dtJobStartFinish;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpContainer;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel3;
        private System.Windows.Forms.Button btnProcess;
        private Controls.ZSMLookups.JobNameLookup lkpJobName;
        private System.Windows.Forms.CheckBox chkSpecifyFormat;
        private System.Windows.Forms.ComboBox cboDateFormat;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel4;
        private System.Windows.Forms.Button btnViewLogs;
        private System.Windows.Forms.Button btnImportFolder;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtFolderLocation;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel5;
        private System.Windows.Forms.Button btnFolderLocation;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel6;
        private System.Windows.Forms.CheckBox chkImportFormat;

    }
}