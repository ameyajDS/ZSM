namespace DCC.ZOS.ZSM.ATT
{
    partial class BadgeScan
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
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dtControlingDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.lkpSubJobName = new DCC.ZOS.ZSM.Controls.ZSMLookups.SubJobNameLookup();
            this.lkpJobName = new DCC.ZOS.ZSM.Controls.ZSMLookups.JobNameLookup();
            this.chkRemoveScan = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.dtJobStartFinish = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.tlpContainer = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpButton = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnStartStopScan = new System.Windows.Forms.Button();
            this.tlpScannedSewadarDetails = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.ImgSewadarPhoto = new DCC.UMB.CDF.UIControls.TextControls.DCCImageBox();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtHiddenScannedGrNo = new System.Windows.Forms.TextBox();
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.object_72b337f8_2727_4e41_8114_15815e302030 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtGRNo = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtFirstName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtLastName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtGender = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtDepartment = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpSubDeptAge = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtSubDepartment = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtAge = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpAge = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtTotalSewadarCount = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtSewadarAttendanceCount = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtSatsangCentreId = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtSatsangCentreName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpBase.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.dtJobStartFinish.SuspendLayout();
            this.tlpButton.SuspendLayout();
            this.tlpScannedSewadarDetails.SuspendLayout();
            this.ImgSewadarPhoto.SuspendLayout();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.tlpSubDeptAge.SuspendLayout();
            this.tlpAge.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 5;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.12953F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 74.87047F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 153F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 149F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 318F));
            this.tlpBase.Controls.Add(this.tlpTop, 1, 1);
            this.tlpBase.Controls.Add(this.chkRemoveScan, 1, 2);
            this.tlpBase.Controls.Add(this.dtJobStartFinish, 1, 3);
            this.tlpBase.Controls.Add(this.tlpButton, 2, 4);
            this.tlpBase.Controls.Add(this.tlpScannedSewadarDetails, 0, 5);
            this.tlpBase.Controls.Add(this.txtSatsangCentreId, 3, 0);
            this.tlpBase.Controls.Add(this.txtSatsangCentreName, 1, 0);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Margin = new System.Windows.Forms.Padding(4);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.Padding = new System.Windows.Forms.Padding(4);
            this.tlpBase.RowCount = 7;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.626719F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.59136F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.823183F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.59136F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.858546F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.79175F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15.52063F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tlpBase.Size = new System.Drawing.Size(1284, 634);
            this.tlpBase.TabIndex = 4;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 3;
            this.tlpBase.SetColumnSpan(this.tlpTop, 3);
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 19.03662F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.03854F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.03854F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 26.5494F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.61976F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.717149F));
            this.tlpTop.Controls.Add(this.dtControlingDate, 1, 1);
            this.tlpTop.Controls.Add(this.lkpSubJobName, 2, 1);
            this.tlpTop.Controls.Add(this.lkpJobName, 0, 1);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(172, 68);
            this.tlpTop.Margin = new System.Windows.Forms.Padding(4);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 3;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 90F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tlpTop.Size = new System.Drawing.Size(785, 64);
            this.tlpTop.TabIndex = 47;
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
            this.dtControlingDate.Location = new System.Drawing.Point(257, 7);
            this.dtControlingDate.Lookup = true;
            this.dtControlingDate.LookupColumns = null;
            this.dtControlingDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtControlingDate.LookupResult = null;
            this.dtControlingDate.LookupTitle = "Controlling  Date";
            this.dtControlingDate.Mandatory = false;
            this.dtControlingDate.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtControlingDate.MaxCharacterLength = 11;
            this.dtControlingDate.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtControlingDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtControlingDate.MinCharactersForQuery = 0;
            this.dtControlingDate.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtControlingDate.MinValue = new System.DateTime(((long)(0)));
            this.dtControlingDate.Name = "dtControlingDate";
            this.dtControlingDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtControlingDate.PascalCase = false;
            this.dtControlingDate.RangeInQueryMode = false;
            this.dtControlingDate.ReadOnly = true;
            this.dtControlingDate.RegularExpressionValidator = null;
            this.tlpTop.SetRowSpan(this.dtControlingDate, 2);
            this.dtControlingDate.ShowTime = false;
            this.dtControlingDate.Size = new System.Drawing.Size(256, 53);
            this.dtControlingDate.TabIndex = 59;
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
            this.lkpSubJobName.Location = new System.Drawing.Point(523, 7);
            this.lkpSubJobName.Lookup = true;
            this.lkpSubJobName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpSubJobName.LookupResult = null;
            this.lkpSubJobName.LookupTitle = "Sub Job Name";
            this.lkpSubJobName.Mandatory = false;
            this.lkpSubJobName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lkpSubJobName.MaxCharacterLength = 32767;
            this.lkpSubJobName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lkpSubJobName.MinCharactersForQuery = 0;
            this.lkpSubJobName.MinimumSize = new System.Drawing.Size(13, 27);
            this.lkpSubJobName.Name = "lkpSubJobName";
            this.lkpSubJobName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lkpSubJobName.PascalCase = false;
            this.lkpSubJobName.RangeInQueryMode = false;
            this.lkpSubJobName.ReadOnly = false;
            this.lkpSubJobName.RegularExpressionValidator = null;
            this.lkpSubJobName.Size = new System.Drawing.Size(257, 49);
            this.lkpSubJobName.TabIndex = 61;
            this.lkpSubJobName.Title = "Sub Job Name";
            this.lkpSubJobName.ToolTipLookupField = "information";
            this.lkpSubJobName.ValueText = "";
            this.lkpSubJobName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lkpSubJobName_LookupDialogShowing);
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
            this.lkpJobName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpJobName.EditingControlDataGridView = null;
            this.lkpJobName.EditingControlFormattedValue = null;
            this.lkpJobName.EditingControlRowIndex = 0;
            this.lkpJobName.EditingControlValueChanged = true;
            this.lkpJobName.EnableToolTip = false;
            this.lkpJobName.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lkpJobName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpJobName.IdText = "";
            this.lkpJobName.IdTextBindingKey = "JobId";
            this.lkpJobName.Location = new System.Drawing.Point(5, 7);
            this.lkpJobName.Lookup = true;
            this.lkpJobName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpJobName.LookupResult = null;
            this.lkpJobName.LookupTitle = "Job Name";
            this.lkpJobName.Mandatory = false;
            this.lkpJobName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lkpJobName.MaxCharacterLength = 32767;
            this.lkpJobName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lkpJobName.MinCharactersForQuery = 0;
            this.lkpJobName.MinimumSize = new System.Drawing.Size(13, 27);
            this.lkpJobName.Name = "lkpJobName";
            this.lkpJobName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lkpJobName.PascalCase = false;
            this.lkpJobName.RangeInQueryMode = false;
            this.lkpJobName.ReadOnly = false;
            this.lkpJobName.RegularExpressionValidator = null;
            this.lkpJobName.Size = new System.Drawing.Size(242, 49);
            this.lkpJobName.TabIndex = 62;
            this.lkpJobName.Title = "Job Name";
            this.lkpJobName.ToolTipLookupField = "information";
            this.lkpJobName.ValueText = "";
            this.lkpJobName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lkpJobName_LookupDialogShowing);
            this.lkpJobName.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.lkpJobName_LookupResultSet);
            // 
            // chkRemoveScan
            // 
            this.chkRemoveScan.AutoSize = true;
            this.chkRemoveScan.BackColor = System.Drawing.Color.Transparent;
            this.chkRemoveScan.BindingKey = null;
            this.chkRemoveScan.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkRemoveScan.Enabled = false;
            this.chkRemoveScan.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkRemoveScan.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkRemoveScan.Location = new System.Drawing.Point(172, 140);
            this.chkRemoveScan.Margin = new System.Windows.Forms.Padding(4);
            this.chkRemoveScan.Name = "chkRemoveScan";
            this.chkRemoveScan.Size = new System.Drawing.Size(483, 53);
            this.chkRemoveScan.TabIndex = 2;
            this.chkRemoveScan.Text = "Remove Scanned Record";
            this.chkRemoveScan.UseVisualStyleBackColor = true;
            // 
            // dtJobStartFinish
            // 
            this.tlpBase.SetColumnSpan(this.dtJobStartFinish, 3);
            this.dtJobStartFinish.Controls.Add(this.tlpContainer);
            this.dtJobStartFinish.DiscreteInQueryMode = false;
            this.dtJobStartFinish.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtJobStartFinish.FillDefailtValuesInInsertMode = false;
            this.dtJobStartFinish.FromDate = null;
            this.dtJobStartFinish.FromDateFieldBindingKey = "";
            this.dtJobStartFinish.FromDateMandatory = false;
            this.dtJobStartFinish.FromDateTitle = "Job Start Date";
            this.dtJobStartFinish.Location = new System.Drawing.Point(173, 202);
            this.dtJobStartFinish.Mandatory = false;
            this.dtJobStartFinish.Margin = new System.Windows.Forms.Padding(5);
            this.dtJobStartFinish.Name = "dtJobStartFinish";
            this.dtJobStartFinish.ReadOnly = true;
            this.dtJobStartFinish.Size = new System.Drawing.Size(783, 62);
            this.dtJobStartFinish.TabIndex = 31;
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
            this.tlpContainer.MaximumSize = new System.Drawing.Size(2000, 45);
            this.tlpContainer.Name = "tlpContainer";
            this.tlpContainer.RowCount = 1;
            this.tlpContainer.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpContainer.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 45F));
            this.tlpContainer.Size = new System.Drawing.Size(783, 45);
            this.tlpContainer.TabIndex = 2;
            // 
            // tlpButton
            // 
            this.tlpButton.ColumnCount = 2;
            this.tlpBase.SetColumnSpan(this.tlpButton, 2);
            this.tlpButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 63.60544F));
            this.tlpButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 36.39456F));
            this.tlpButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 27F));
            this.tlpButton.Controls.Add(this.btnStartStopScan, 1, 0);
            this.tlpButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpButton.Location = new System.Drawing.Point(663, 273);
            this.tlpButton.Margin = new System.Windows.Forms.Padding(4);
            this.tlpButton.Name = "tlpButton";
            this.tlpButton.RowCount = 1;
            this.tlpButton.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 56.57895F));
            this.tlpButton.Size = new System.Drawing.Size(294, 41);
            this.tlpButton.TabIndex = 7;
            // 
            // btnStartStopScan
            // 
            this.btnStartStopScan.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.btnStartStopScan.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnStartStopScan.Enabled = false;
            this.btnStartStopScan.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnStartStopScan.Location = new System.Drawing.Point(190, 4);
            this.btnStartStopScan.Margin = new System.Windows.Forms.Padding(4);
            this.btnStartStopScan.Name = "btnStartStopScan";
            this.btnStartStopScan.Size = new System.Drawing.Size(100, 33);
            this.btnStartStopScan.TabIndex = 6;
            this.btnStartStopScan.Text = "Start Scan";
            this.btnStartStopScan.UseVisualStyleBackColor = false;
            this.btnStartStopScan.Click += new System.EventHandler(this.btnStartStopScan_Click);
            // 
            // tlpScannedSewadarDetails
            // 
            this.tlpScannedSewadarDetails.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Inset;
            this.tlpScannedSewadarDetails.ColumnCount = 5;
            this.tlpBase.SetColumnSpan(this.tlpScannedSewadarDetails, 5);
            this.tlpScannedSewadarDetails.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpScannedSewadarDetails.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpScannedSewadarDetails.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpScannedSewadarDetails.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30F));
            this.tlpScannedSewadarDetails.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpScannedSewadarDetails.Controls.Add(this.ImgSewadarPhoto, 0, 0);
            this.tlpScannedSewadarDetails.Controls.Add(this.txtGRNo, 1, 0);
            this.tlpScannedSewadarDetails.Controls.Add(this.txtFirstName, 2, 0);
            this.tlpScannedSewadarDetails.Controls.Add(this.txtLastName, 3, 0);
            this.tlpScannedSewadarDetails.Controls.Add(this.txtGender, 4, 0);
            this.tlpScannedSewadarDetails.Controls.Add(this.txtSewadarStatus, 1, 1);
            this.tlpScannedSewadarDetails.Controls.Add(this.txtDepartment, 2, 1);
            this.tlpScannedSewadarDetails.Controls.Add(this.tlpSubDeptAge, 3, 1);
            this.tlpScannedSewadarDetails.Controls.Add(this.tlpAge, 3, 2);
            this.tlpScannedSewadarDetails.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpScannedSewadarDetails.Location = new System.Drawing.Point(8, 322);
            this.tlpScannedSewadarDetails.Margin = new System.Windows.Forms.Padding(4);
            this.tlpScannedSewadarDetails.Name = "tlpScannedSewadarDetails";
            this.tlpScannedSewadarDetails.RowCount = 3;
            this.tlpScannedSewadarDetails.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 52.03252F));
            this.tlpScannedSewadarDetails.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 47.96748F));
            this.tlpScannedSewadarDetails.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 73F));
            this.tlpScannedSewadarDetails.Size = new System.Drawing.Size(1268, 203);
            this.tlpScannedSewadarDetails.TabIndex = 8;
            this.tlpScannedSewadarDetails.Paint += new System.Windows.Forms.PaintEventHandler(this.tlpScannedSewadarDetails_Paint);
            // 
            // ImgSewadarPhoto
            // 
            this.ImgSewadarPhoto.BackColor = System.Drawing.Color.Transparent;
            this.ImgSewadarPhoto.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.ImgSewadarPhoto.Controls.Add(this.dccTableLayoutPanel1);
            this.ImgSewadarPhoto.Controls.Add(this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a);
            this.ImgSewadarPhoto.Controls.Add(this.object_72b337f8_2727_4e41_8114_15815e302030);
            this.ImgSewadarPhoto.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ImgSewadarPhoto.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ImgSewadarPhoto.ImageInByteArray = null;
            this.ImgSewadarPhoto.Location = new System.Drawing.Point(7, 6);
            this.ImgSewadarPhoto.Mandatory = false;
            this.ImgSewadarPhoto.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.ImgSewadarPhoto.MaximumSize = new System.Drawing.Size(6666, 6153);
            this.ImgSewadarPhoto.MinimumSize = new System.Drawing.Size(13, 27);
            this.ImgSewadarPhoto.Name = "ImgSewadarPhoto";
            this.ImgSewadarPhoto.ReadOnly = false;
            this.tlpScannedSewadarDetails.SetRowSpan(this.ImgSewadarPhoto, 3);
            this.ImgSewadarPhoto.Size = new System.Drawing.Size(178, 191);
            this.ImgSewadarPhoto.TabIndex = 26;
            this.ImgSewadarPhoto.Title = "";
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 3;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.14285F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 54.28572F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.57143F));
            this.dccTableLayoutPanel1.Controls.Add(this.txtHiddenScannedGrNo, 1, 0);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Margin = new System.Windows.Forms.Padding(1);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 2;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(176, 189);
            this.dccTableLayoutPanel1.TabIndex = 5;
            // 
            // txtHiddenScannedGrNo
            // 
            this.txtHiddenScannedGrNo.Location = new System.Drawing.Point(62, 4);
            this.txtHiddenScannedGrNo.Margin = new System.Windows.Forms.Padding(4);
            this.txtHiddenScannedGrNo.Name = "txtHiddenScannedGrNo";
            this.txtHiddenScannedGrNo.Size = new System.Drawing.Size(0, 26);
            this.txtHiddenScannedGrNo.TabIndex = 41;
            this.txtHiddenScannedGrNo.TextChanged += new System.EventHandler(this.txtHiddenScannedGrNo_TextChanged);
            // 
            // object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a
            // 
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.ColumnCount = 3;
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.14285F));
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 54.28572F));
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.57143F));
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.Dock = System.Windows.Forms.DockStyle.Fill;
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.Location = new System.Drawing.Point(0, 0);
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.Margin = new System.Windows.Forms.Padding(1);
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.Name = "object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a";
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.RowCount = 2;
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.Size = new System.Drawing.Size(176, 189);
            this.object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a.TabIndex = 5;
            // 
            // object_72b337f8_2727_4e41_8114_15815e302030
            // 
            this.object_72b337f8_2727_4e41_8114_15815e302030.ColumnCount = 3;
            this.object_72b337f8_2727_4e41_8114_15815e302030.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.14285F));
            this.object_72b337f8_2727_4e41_8114_15815e302030.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 54.28572F));
            this.object_72b337f8_2727_4e41_8114_15815e302030.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.57143F));
            this.object_72b337f8_2727_4e41_8114_15815e302030.Dock = System.Windows.Forms.DockStyle.Fill;
            this.object_72b337f8_2727_4e41_8114_15815e302030.Location = new System.Drawing.Point(0, 0);
            this.object_72b337f8_2727_4e41_8114_15815e302030.Margin = new System.Windows.Forms.Padding(1);
            this.object_72b337f8_2727_4e41_8114_15815e302030.Name = "object_72b337f8_2727_4e41_8114_15815e302030";
            this.object_72b337f8_2727_4e41_8114_15815e302030.RowCount = 2;
            this.object_72b337f8_2727_4e41_8114_15815e302030.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.object_72b337f8_2727_4e41_8114_15815e302030.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.object_72b337f8_2727_4e41_8114_15815e302030.Size = new System.Drawing.Size(176, 189);
            this.object_72b337f8_2727_4e41_8114_15815e302030.TabIndex = 5;
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
            this.txtGRNo.DisplayTextBindingKey = "";
            this.txtGRNo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtGRNo.EditingControlDataGridView = null;
            this.txtGRNo.EditingControlFormattedValue = "";
            this.txtGRNo.EditingControlRowIndex = 0;
            this.txtGRNo.EditingControlValueChanged = false;
            this.txtGRNo.EnableToolTip = false;
            this.txtGRNo.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGRNo.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtGRNo.IdText = null;
            this.txtGRNo.IdTextBindingKey = null;
            this.txtGRNo.Location = new System.Drawing.Point(197, 6);
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
            this.txtGRNo.Size = new System.Drawing.Size(178, 55);
            this.txtGRNo.TabIndex = 27;
            this.txtGRNo.TabStop = false;
            this.txtGRNo.Title = "GR No.";
            this.txtGRNo.ToolTipLookupField = "information";
            this.txtGRNo.ValueText = null;
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
            this.txtFirstName.DisplayText = "";
            this.txtFirstName.DisplayTextBindingKey = "";
            this.txtFirstName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtFirstName.EditingControlDataGridView = null;
            this.txtFirstName.EditingControlFormattedValue = "";
            this.txtFirstName.EditingControlRowIndex = 0;
            this.txtFirstName.EditingControlValueChanged = false;
            this.txtFirstName.EnableToolTip = false;
            this.txtFirstName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFirstName.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtFirstName.IdText = null;
            this.txtFirstName.IdTextBindingKey = null;
            this.txtFirstName.Location = new System.Drawing.Point(387, 6);
            this.txtFirstName.Lookup = false;
            this.txtFirstName.LookupColumns = null;
            this.txtFirstName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtFirstName.LookupResult = null;
            this.txtFirstName.LookupTitle = "First Name";
            this.txtFirstName.Mandatory = false;
            this.txtFirstName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtFirstName.MaxCharacterLength = 32767;
            this.txtFirstName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtFirstName.MinCharactersForQuery = 0;
            this.txtFirstName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtFirstName.Name = "txtFirstName";
            this.txtFirstName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtFirstName.PascalCase = false;
            this.txtFirstName.RangeInQueryMode = false;
            this.txtFirstName.ReadOnly = true;
            this.txtFirstName.RegularExpressionValidator = null;
            this.txtFirstName.Size = new System.Drawing.Size(304, 55);
            this.txtFirstName.TabIndex = 38;
            this.txtFirstName.TabStop = false;
            this.txtFirstName.Title = "First Name";
            this.txtFirstName.ToolTipLookupField = "information";
            this.txtFirstName.ValueText = null;
            // 
            // txtLastName
            // 
            this.txtLastName.AllowsNew = false;
            this.txtLastName.AllowsReference = false;
            this.txtLastName.AllowsUpdate = false;
            this.txtLastName.ApplicationIdForDbConnection = null;
            this.txtLastName.BackColor = System.Drawing.Color.Transparent;
            this.txtLastName.CalledScreenApplicationId = null;
            this.txtLastName.CalledScreenTypeName = null;
            this.txtLastName.CallingScreenType = null;
            this.txtLastName.DisplayText = "";
            this.txtLastName.DisplayTextBindingKey = "";
            this.txtLastName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtLastName.EditingControlDataGridView = null;
            this.txtLastName.EditingControlFormattedValue = "";
            this.txtLastName.EditingControlRowIndex = 0;
            this.txtLastName.EditingControlValueChanged = false;
            this.txtLastName.EnableToolTip = false;
            this.txtLastName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLastName.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtLastName.IdText = null;
            this.txtLastName.IdTextBindingKey = null;
            this.txtLastName.Location = new System.Drawing.Point(703, 6);
            this.txtLastName.Lookup = false;
            this.txtLastName.LookupColumns = null;
            this.txtLastName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtLastName.LookupResult = null;
            this.txtLastName.LookupTitle = "Last Name";
            this.txtLastName.Mandatory = false;
            this.txtLastName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtLastName.MaxCharacterLength = 32767;
            this.txtLastName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtLastName.MinCharactersForQuery = 0;
            this.txtLastName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtLastName.Name = "txtLastName";
            this.txtLastName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtLastName.PascalCase = false;
            this.txtLastName.RangeInQueryMode = false;
            this.txtLastName.ReadOnly = true;
            this.txtLastName.RegularExpressionValidator = null;
            this.txtLastName.Size = new System.Drawing.Size(366, 55);
            this.txtLastName.TabIndex = 39;
            this.txtLastName.TabStop = false;
            this.txtLastName.Title = "Last Name";
            this.txtLastName.ToolTipLookupField = "information";
            this.txtLastName.ValueText = null;
            // 
            // txtGender
            // 
            this.txtGender.AllowsNew = false;
            this.txtGender.AllowsReference = false;
            this.txtGender.AllowsUpdate = false;
            this.txtGender.ApplicationIdForDbConnection = null;
            this.txtGender.BackColor = System.Drawing.Color.Transparent;
            this.txtGender.CalledScreenApplicationId = null;
            this.txtGender.CalledScreenTypeName = null;
            this.txtGender.CallingScreenType = null;
            this.txtGender.DisplayText = "";
            this.txtGender.DisplayTextBindingKey = "";
            this.txtGender.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtGender.EditingControlDataGridView = null;
            this.txtGender.EditingControlFormattedValue = "";
            this.txtGender.EditingControlRowIndex = 0;
            this.txtGender.EditingControlValueChanged = false;
            this.txtGender.EnableToolTip = false;
            this.txtGender.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGender.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtGender.IdText = null;
            this.txtGender.IdTextBindingKey = null;
            this.txtGender.Location = new System.Drawing.Point(1081, 6);
            this.txtGender.Lookup = false;
            this.txtGender.LookupColumns = null;
            this.txtGender.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtGender.LookupResult = null;
            this.txtGender.LookupTitle = "Gender";
            this.txtGender.Mandatory = false;
            this.txtGender.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtGender.MaxCharacterLength = 32767;
            this.txtGender.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtGender.MinCharactersForQuery = 0;
            this.txtGender.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtGender.Name = "txtGender";
            this.txtGender.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtGender.PascalCase = false;
            this.txtGender.RangeInQueryMode = false;
            this.txtGender.ReadOnly = true;
            this.txtGender.RegularExpressionValidator = null;
            this.txtGender.Size = new System.Drawing.Size(180, 55);
            this.txtGender.TabIndex = 36;
            this.txtGender.TabStop = false;
            this.txtGender.Title = "Gender";
            this.txtGender.ToolTipLookupField = "information";
            this.txtGender.ValueText = null;
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
            this.txtSewadarStatus.DisplayText = "";
            this.txtSewadarStatus.DisplayTextBindingKey = "";
            this.txtSewadarStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSewadarStatus.EditingControlDataGridView = null;
            this.txtSewadarStatus.EditingControlFormattedValue = "";
            this.txtSewadarStatus.EditingControlRowIndex = 0;
            this.txtSewadarStatus.EditingControlValueChanged = false;
            this.txtSewadarStatus.EnableToolTip = false;
            this.txtSewadarStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSewadarStatus.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtSewadarStatus.IdText = null;
            this.txtSewadarStatus.IdTextBindingKey = null;
            this.txtSewadarStatus.Location = new System.Drawing.Point(197, 71);
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
            this.txtSewadarStatus.Size = new System.Drawing.Size(178, 50);
            this.txtSewadarStatus.TabIndex = 31;
            this.txtSewadarStatus.TabStop = false;
            this.txtSewadarStatus.Title = "Status";
            this.txtSewadarStatus.ToolTipLookupField = "information";
            this.txtSewadarStatus.ValueText = null;
            // 
            // txtDepartment
            // 
            this.txtDepartment.AllowsNew = false;
            this.txtDepartment.AllowsReference = false;
            this.txtDepartment.AllowsUpdate = false;
            this.txtDepartment.ApplicationIdForDbConnection = null;
            this.txtDepartment.BackColor = System.Drawing.Color.Transparent;
            this.txtDepartment.CalledScreenApplicationId = null;
            this.txtDepartment.CalledScreenTypeName = null;
            this.txtDepartment.CallingScreenType = null;
            this.txtDepartment.DisplayText = "";
            this.txtDepartment.DisplayTextBindingKey = "";
            this.txtDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDepartment.EditingControlDataGridView = null;
            this.txtDepartment.EditingControlFormattedValue = "";
            this.txtDepartment.EditingControlRowIndex = 0;
            this.txtDepartment.EditingControlValueChanged = false;
            this.txtDepartment.EnableToolTip = false;
            this.txtDepartment.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDepartment.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtDepartment.IdText = null;
            this.txtDepartment.IdTextBindingKey = null;
            this.txtDepartment.Location = new System.Drawing.Point(387, 71);
            this.txtDepartment.Lookup = false;
            this.txtDepartment.LookupColumns = null;
            this.txtDepartment.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtDepartment.LookupResult = null;
            this.txtDepartment.LookupTitle = "Department";
            this.txtDepartment.Mandatory = false;
            this.txtDepartment.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtDepartment.MaxCharacterLength = 32767;
            this.txtDepartment.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtDepartment.MinCharactersForQuery = 0;
            this.txtDepartment.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtDepartment.Name = "txtDepartment";
            this.txtDepartment.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtDepartment.PascalCase = false;
            this.txtDepartment.RangeInQueryMode = false;
            this.txtDepartment.ReadOnly = true;
            this.txtDepartment.RegularExpressionValidator = null;
            this.txtDepartment.Size = new System.Drawing.Size(304, 50);
            this.txtDepartment.TabIndex = 32;
            this.txtDepartment.TabStop = false;
            this.txtDepartment.Title = "Department";
            this.txtDepartment.ToolTipLookupField = "information";
            this.txtDepartment.ValueText = null;
            // 
            // tlpSubDeptAge
            // 
            this.tlpSubDeptAge.ColumnCount = 2;
            this.tlpScannedSewadarDetails.SetColumnSpan(this.tlpSubDeptAge, 2);
            this.tlpSubDeptAge.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 73.04964F));
            this.tlpSubDeptAge.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 26.95036F));
            this.tlpSubDeptAge.Controls.Add(this.txtSubDepartment, 0, 0);
            this.tlpSubDeptAge.Controls.Add(this.txtAge, 1, 0);
            this.tlpSubDeptAge.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpSubDeptAge.Location = new System.Drawing.Point(702, 71);
            this.tlpSubDeptAge.Margin = new System.Windows.Forms.Padding(4);
            this.tlpSubDeptAge.Name = "tlpSubDeptAge";
            this.tlpSubDeptAge.RowCount = 1;
            this.tlpSubDeptAge.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpSubDeptAge.Size = new System.Drawing.Size(560, 50);
            this.tlpSubDeptAge.TabIndex = 37;
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
            this.txtSubDepartment.DisplayText = "";
            this.txtSubDepartment.DisplayTextBindingKey = "";
            this.txtSubDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSubDepartment.EditingControlDataGridView = null;
            this.txtSubDepartment.EditingControlFormattedValue = "";
            this.txtSubDepartment.EditingControlRowIndex = 0;
            this.txtSubDepartment.EditingControlValueChanged = false;
            this.txtSubDepartment.EnableToolTip = false;
            this.txtSubDepartment.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSubDepartment.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtSubDepartment.IdText = null;
            this.txtSubDepartment.IdTextBindingKey = null;
            this.txtSubDepartment.Location = new System.Drawing.Point(5, 4);
            this.txtSubDepartment.Lookup = false;
            this.txtSubDepartment.LookupColumns = null;
            this.txtSubDepartment.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSubDepartment.LookupResult = null;
            this.txtSubDepartment.LookupTitle = "Sub Department";
            this.txtSubDepartment.Mandatory = false;
            this.txtSubDepartment.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSubDepartment.MaxCharacterLength = 32767;
            this.txtSubDepartment.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSubDepartment.MinCharactersForQuery = 0;
            this.txtSubDepartment.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSubDepartment.Name = "txtSubDepartment";
            this.txtSubDepartment.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSubDepartment.PascalCase = false;
            this.txtSubDepartment.RangeInQueryMode = false;
            this.txtSubDepartment.ReadOnly = true;
            this.txtSubDepartment.RegularExpressionValidator = null;
            this.txtSubDepartment.Size = new System.Drawing.Size(399, 42);
            this.txtSubDepartment.TabIndex = 33;
            this.txtSubDepartment.TabStop = false;
            this.txtSubDepartment.Title = "Sub Department";
            this.txtSubDepartment.ToolTipLookupField = "information";
            this.txtSubDepartment.ValueText = null;
            // 
            // txtAge
            // 
            this.txtAge.AllowsNew = false;
            this.txtAge.AllowsReference = false;
            this.txtAge.AllowsUpdate = false;
            this.txtAge.ApplicationIdForDbConnection = null;
            this.txtAge.BackColor = System.Drawing.Color.Transparent;
            this.txtAge.CalledScreenApplicationId = null;
            this.txtAge.CalledScreenTypeName = null;
            this.txtAge.CallingScreenType = null;
            this.txtAge.DisplayText = "";
            this.txtAge.DisplayTextBindingKey = "";
            this.txtAge.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtAge.EditingControlDataGridView = null;
            this.txtAge.EditingControlFormattedValue = "";
            this.txtAge.EditingControlRowIndex = 0;
            this.txtAge.EditingControlValueChanged = false;
            this.txtAge.EnableToolTip = false;
            this.txtAge.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAge.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtAge.IdText = null;
            this.txtAge.IdTextBindingKey = null;
            this.txtAge.Location = new System.Drawing.Point(414, 4);
            this.txtAge.Lookup = false;
            this.txtAge.LookupColumns = null;
            this.txtAge.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtAge.LookupResult = null;
            this.txtAge.LookupTitle = "Age";
            this.txtAge.Mandatory = false;
            this.txtAge.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtAge.MaxCharacterLength = 32767;
            this.txtAge.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtAge.MinCharactersForQuery = 0;
            this.txtAge.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtAge.Name = "txtAge";
            this.txtAge.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtAge.PascalCase = false;
            this.txtAge.RangeInQueryMode = false;
            this.txtAge.ReadOnly = true;
            this.txtAge.RegularExpressionValidator = null;
            this.txtAge.Size = new System.Drawing.Size(141, 42);
            this.txtAge.TabIndex = 35;
            this.txtAge.TabStop = false;
            this.txtAge.Title = "Age";
            this.txtAge.ToolTipLookupField = "information";
            this.txtAge.ValueText = null;
            // 
            // tlpAge
            // 
            this.tlpAge.ColumnCount = 2;
            this.tlpScannedSewadarDetails.SetColumnSpan(this.tlpAge, 2);
            this.tlpAge.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 43.26241F));
            this.tlpAge.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 56.73759F));
            this.tlpAge.Controls.Add(this.txtTotalSewadarCount, 0, 0);
            this.tlpAge.Controls.Add(this.txtSewadarAttendanceCount, 0, 0);
            this.tlpAge.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpAge.Location = new System.Drawing.Point(702, 131);
            this.tlpAge.Margin = new System.Windows.Forms.Padding(4);
            this.tlpAge.Name = "tlpAge";
            this.tlpAge.RowCount = 1;
            this.tlpAge.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpAge.Size = new System.Drawing.Size(560, 66);
            this.tlpAge.TabIndex = 40;
            // 
            // txtTotalSewadarCount
            // 
            this.txtTotalSewadarCount.AllowsNew = false;
            this.txtTotalSewadarCount.AllowsReference = false;
            this.txtTotalSewadarCount.AllowsUpdate = false;
            this.txtTotalSewadarCount.ApplicationIdForDbConnection = null;
            this.txtTotalSewadarCount.BackColor = System.Drawing.Color.Transparent;
            this.txtTotalSewadarCount.CalledScreenApplicationId = null;
            this.txtTotalSewadarCount.CalledScreenTypeName = null;
            this.txtTotalSewadarCount.CallingScreenType = null;
            this.txtTotalSewadarCount.DisplayText = "";
            this.txtTotalSewadarCount.DisplayTextBindingKey = "";
            this.txtTotalSewadarCount.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtTotalSewadarCount.EditingControlDataGridView = null;
            this.txtTotalSewadarCount.EditingControlFormattedValue = "";
            this.txtTotalSewadarCount.EditingControlRowIndex = 0;
            this.txtTotalSewadarCount.EditingControlValueChanged = false;
            this.txtTotalSewadarCount.EnableToolTip = false;
            this.txtTotalSewadarCount.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalSewadarCount.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtTotalSewadarCount.IdText = null;
            this.txtTotalSewadarCount.IdTextBindingKey = null;
            this.txtTotalSewadarCount.Location = new System.Drawing.Point(247, 4);
            this.txtTotalSewadarCount.Lookup = false;
            this.txtTotalSewadarCount.LookupColumns = null;
            this.txtTotalSewadarCount.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtTotalSewadarCount.LookupResult = null;
            this.txtTotalSewadarCount.LookupTitle = "Total Sewadar Count";
            this.txtTotalSewadarCount.Mandatory = false;
            this.txtTotalSewadarCount.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtTotalSewadarCount.MaxCharacterLength = 32767;
            this.txtTotalSewadarCount.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtTotalSewadarCount.MinCharactersForQuery = 0;
            this.txtTotalSewadarCount.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtTotalSewadarCount.Name = "txtTotalSewadarCount";
            this.txtTotalSewadarCount.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtTotalSewadarCount.PascalCase = false;
            this.txtTotalSewadarCount.RangeInQueryMode = false;
            this.txtTotalSewadarCount.ReadOnly = true;
            this.txtTotalSewadarCount.RegularExpressionValidator = null;
            this.txtTotalSewadarCount.Size = new System.Drawing.Size(308, 55);
            this.txtTotalSewadarCount.TabIndex = 35;
            this.txtTotalSewadarCount.TabStop = false;
            this.txtTotalSewadarCount.Title = "Total Sewadar Count";
            this.txtTotalSewadarCount.ToolTipLookupField = "information";
            this.txtTotalSewadarCount.ValueText = null;
            this.txtTotalSewadarCount.Visible = false;
            // 
            // txtSewadarAttendanceCount
            // 
            this.txtSewadarAttendanceCount.AllowsNew = false;
            this.txtSewadarAttendanceCount.AllowsReference = false;
            this.txtSewadarAttendanceCount.AllowsUpdate = false;
            this.txtSewadarAttendanceCount.ApplicationIdForDbConnection = null;
            this.txtSewadarAttendanceCount.BackColor = System.Drawing.Color.Transparent;
            this.txtSewadarAttendanceCount.CalledScreenApplicationId = null;
            this.txtSewadarAttendanceCount.CalledScreenTypeName = null;
            this.txtSewadarAttendanceCount.CallingScreenType = null;
            this.txtSewadarAttendanceCount.DisplayText = "";
            this.txtSewadarAttendanceCount.DisplayTextBindingKey = "";
            this.txtSewadarAttendanceCount.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSewadarAttendanceCount.EditingControlDataGridView = null;
            this.txtSewadarAttendanceCount.EditingControlFormattedValue = "";
            this.txtSewadarAttendanceCount.EditingControlRowIndex = 0;
            this.txtSewadarAttendanceCount.EditingControlValueChanged = false;
            this.txtSewadarAttendanceCount.EnableToolTip = false;
            this.txtSewadarAttendanceCount.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSewadarAttendanceCount.ForeColor = System.Drawing.SystemColors.ControlText;
            this.txtSewadarAttendanceCount.IdText = null;
            this.txtSewadarAttendanceCount.IdTextBindingKey = null;
            this.txtSewadarAttendanceCount.Location = new System.Drawing.Point(5, 4);
            this.txtSewadarAttendanceCount.Lookup = false;
            this.txtSewadarAttendanceCount.LookupColumns = null;
            this.txtSewadarAttendanceCount.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSewadarAttendanceCount.LookupResult = null;
            this.txtSewadarAttendanceCount.LookupTitle = "Sewadar Attendance Count";
            this.txtSewadarAttendanceCount.Mandatory = false;
            this.txtSewadarAttendanceCount.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSewadarAttendanceCount.MaxCharacterLength = 32767;
            this.txtSewadarAttendanceCount.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSewadarAttendanceCount.MinCharactersForQuery = 0;
            this.txtSewadarAttendanceCount.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSewadarAttendanceCount.Name = "txtSewadarAttendanceCount";
            this.txtSewadarAttendanceCount.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSewadarAttendanceCount.PascalCase = false;
            this.txtSewadarAttendanceCount.RangeInQueryMode = false;
            this.txtSewadarAttendanceCount.ReadOnly = true;
            this.txtSewadarAttendanceCount.RegularExpressionValidator = null;
            this.txtSewadarAttendanceCount.Size = new System.Drawing.Size(232, 55);
            this.txtSewadarAttendanceCount.TabIndex = 34;
            this.txtSewadarAttendanceCount.TabStop = false;
            this.txtSewadarAttendanceCount.Title = "Sewadar Attendance Count";
            this.txtSewadarAttendanceCount.ToolTipLookupField = "information";
            this.txtSewadarAttendanceCount.ValueText = null;
            this.txtSewadarAttendanceCount.Visible = false;
            // 
            // txtSatsangCentreId
            // 
            this.txtSatsangCentreId.AllowsNew = false;
            this.txtSatsangCentreId.AllowsReference = false;
            this.txtSatsangCentreId.AllowsUpdate = false;
            this.txtSatsangCentreId.ApplicationIdForDbConnection = null;
            this.txtSatsangCentreId.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangCentreId.CalledScreenApplicationId = null;
            this.txtSatsangCentreId.CalledScreenTypeName = null;
            this.txtSatsangCentreId.CallingScreenType = null;
            this.txtSatsangCentreId.DisplayText = "";
            this.txtSatsangCentreId.DisplayTextBindingKey = null;
            this.txtSatsangCentreId.EditingControlDataGridView = null;
            this.txtSatsangCentreId.EditingControlFormattedValue = "";
            this.txtSatsangCentreId.EditingControlRowIndex = 0;
            this.txtSatsangCentreId.EditingControlValueChanged = false;
            this.txtSatsangCentreId.EnableToolTip = false;
            this.txtSatsangCentreId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentreId.IdText = null;
            this.txtSatsangCentreId.IdTextBindingKey = null;
            this.txtSatsangCentreId.Location = new System.Drawing.Point(817, 8);
            this.txtSatsangCentreId.Lookup = false;
            this.txtSatsangCentreId.LookupColumns = null;
            this.txtSatsangCentreId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentreId.LookupResult = null;
            this.txtSatsangCentreId.LookupTitle = "Id";
            this.txtSatsangCentreId.Mandatory = false;
            this.txtSatsangCentreId.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSatsangCentreId.MaxCharacterLength = 32767;
            this.txtSatsangCentreId.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSatsangCentreId.MaxValue = ((long)(9223372036854775807));
            this.txtSatsangCentreId.MinCharactersForQuery = 0;
            this.txtSatsangCentreId.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSatsangCentreId.MinValue = ((long)(-9223372036854775808));
            this.txtSatsangCentreId.Name = "txtSatsangCentreId";
            this.txtSatsangCentreId.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCentreId.PascalCase = false;
            this.txtSatsangCentreId.RangeInQueryMode = false;
            this.txtSatsangCentreId.ReadOnly = false;
            this.txtSatsangCentreId.RegularExpressionValidator = null;
            this.txtSatsangCentreId.Size = new System.Drawing.Size(93, 47);
            this.txtSatsangCentreId.TabIndex = 50;
            this.txtSatsangCentreId.Title = "Id";
            this.txtSatsangCentreId.ToolTipLookupField = "information";
            this.txtSatsangCentreId.ValueText = null;
            this.txtSatsangCentreId.Visible = false;
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
            this.txtSatsangCentreName.Dock = System.Windows.Forms.DockStyle.Right;
            this.txtSatsangCentreName.EditingControlDataGridView = null;
            this.txtSatsangCentreName.EditingControlFormattedValue = "";
            this.txtSatsangCentreName.EditingControlRowIndex = 0;
            this.txtSatsangCentreName.EditingControlValueChanged = false;
            this.txtSatsangCentreName.EnableToolTip = false;
            this.txtSatsangCentreName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentreName.IdText = null;
            this.txtSatsangCentreName.IdTextBindingKey = null;
            this.txtSatsangCentreName.Location = new System.Drawing.Point(361, 8);
            this.txtSatsangCentreName.Lookup = false;
            this.txtSatsangCentreName.LookupColumns = null;
            this.txtSatsangCentreName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentreName.LookupResult = null;
            this.txtSatsangCentreName.LookupTitle = "Satsang Centre Name";
            this.txtSatsangCentreName.Mandatory = false;
            this.txtSatsangCentreName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSatsangCentreName.MaxCharacterLength = 32767;
            this.txtSatsangCentreName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSatsangCentreName.MinCharactersForQuery = 0;
            this.txtSatsangCentreName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSatsangCentreName.Name = "txtSatsangCentreName";
            this.txtSatsangCentreName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCentreName.PascalCase = false;
            this.txtSatsangCentreName.RangeInQueryMode = false;
            this.txtSatsangCentreName.ReadOnly = true;
            this.txtSatsangCentreName.RegularExpressionValidator = null;
            this.txtSatsangCentreName.Size = new System.Drawing.Size(293, 52);
            this.txtSatsangCentreName.TabIndex = 49;
            this.txtSatsangCentreName.TabStop = false;
            this.txtSatsangCentreName.Title = "Satsang Centre Name";
            this.txtSatsangCentreName.ToolTipLookupField = "information";
            this.txtSatsangCentreName.ValueText = null;
            // 
            // BadgeScan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1284, 634);
            this.Controls.Add(this.tlpBase);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "BadgeScan";
            this.Text = "BadgeScan";
            this.tlpBase.ResumeLayout(false);
            this.tlpBase.PerformLayout();
            this.tlpTop.ResumeLayout(false);
            this.dtJobStartFinish.ResumeLayout(false);
            this.tlpButton.ResumeLayout(false);
            this.tlpScannedSewadarDetails.ResumeLayout(false);
            this.ImgSewadarPhoto.ResumeLayout(false);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.dccTableLayoutPanel1.PerformLayout();
            this.tlpSubDeptAge.ResumeLayout(false);
            this.tlpAge.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkRemoveScan;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpButton;
        private System.Windows.Forms.Button btnStartStopScan;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpScannedSewadarDetails;
        private DCC.UMB.CDF.UIControls.TextControls.DCCImageBox ImgSewadarPhoto;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel object_cc73fdca_c03c_4aab_84ea_5c3ce6c9fa2a;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel object_72b337f8_2727_4e41_8114_15815e302030;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtGRNo;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtFirstName;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtLastName;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtGender;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSewadarStatus;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtDepartment;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpSubDeptAge;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSubDepartment;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtAge;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpAge;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSewadarAttendanceCount;
        private DCC.UMB.CDF.UIControls.TextControls.DateRangePair dtJobStartFinish;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpContainer;
        private System.Windows.Forms.TextBox txtHiddenScannedGrNo;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentreName;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtTotalSewadarCount;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtControlingDate;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField txtSatsangCentreId;
        private Controls.ZSMLookups.SubJobNameLookup lkpSubJobName;
        private Controls.ZSMLookups.JobNameLookup lkpJobName;



    }
}