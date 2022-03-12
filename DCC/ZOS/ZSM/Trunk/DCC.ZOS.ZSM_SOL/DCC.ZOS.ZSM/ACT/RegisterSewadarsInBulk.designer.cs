namespace DCC.ZOS.ZSM.ACT
{
    partial class RegisterSewadarsInBulk
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RegisterSewadarsInBulk));
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpSewaSamiti = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.ssintYearsInSewa = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.ssStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.ssZsmSatsangCentresLookup = new DCC.ZOS.ZSM.Controls.ZSMLookups.ZSMMainSatsangCentresLookup();
            this.lblSewaSamiti = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.ssGrNoLookup = new DCC.ZOS.ZSM.Controls.ZSMLookups.GRNoLookup();
            this.ssSewadarIDLookup = new DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarIDLookup();
            this.ssSewadarLookup = new DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarLookup();
            this.ssResponsibilityCombo = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtPhotosLocation = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.btnPhotoLocation = new System.Windows.Forms.Button();
            this.dtPhotoDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.imageExtensionsListBox1 = new DCC.ZOS.ZSM.Controls.Lists.ImageExtensionsListBox();
            this.txtExcelLoc = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.btnExcelLoc = new System.Windows.Forms.Button();
            this.lblForSatsangCentre = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.lblSatsangCentre = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.tlpBase.SuspendLayout();
            this.tlpSewaSamiti.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 5;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.17985F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.06565F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.51159F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.06565F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.17726F));
            this.tlpBase.Controls.Add(this.tlpSewaSamiti, 0, 9);
            this.tlpBase.Controls.Add(this.txtPhotosLocation, 1, 4);
            this.tlpBase.Controls.Add(this.btnPhotoLocation, 3, 4);
            this.tlpBase.Controls.Add(this.dtPhotoDate, 2, 7);
            this.tlpBase.Controls.Add(this.imageExtensionsListBox1, 2, 5);
            this.tlpBase.Controls.Add(this.txtExcelLoc, 1, 3);
            this.tlpBase.Controls.Add(this.btnExcelLoc, 3, 3);
            this.tlpBase.Controls.Add(this.lblForSatsangCentre, 2, 1);
            this.tlpBase.Controls.Add(this.lblSatsangCentre, 2, 2);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 10;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.910695F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5.00035F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.910695F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.605953F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.631717F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 24.8291F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.797568F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.002764F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.310489F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.00067F));
            this.tlpBase.Size = new System.Drawing.Size(916, 578);
            this.tlpBase.TabIndex = 4;
            // 
            // tlpSewaSamiti
            // 
            this.tlpSewaSamiti.ColumnCount = 8;
            this.tlpBase.SetColumnSpan(this.tlpSewaSamiti, 5);
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.26653F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.52419F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.378085F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.970385F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23.88944F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.16782F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.73445F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.871668F));
            this.tlpSewaSamiti.Controls.Add(this.ssintYearsInSewa, 7, 0);
            this.tlpSewaSamiti.Controls.Add(this.ssStatus, 6, 0);
            this.tlpSewaSamiti.Controls.Add(this.ssZsmSatsangCentresLookup, 1, 0);
            this.tlpSewaSamiti.Controls.Add(this.lblSewaSamiti, 0, 0);
            this.tlpSewaSamiti.Controls.Add(this.ssGrNoLookup, 2, 0);
            this.tlpSewaSamiti.Controls.Add(this.ssSewadarIDLookup, 3, 0);
            this.tlpSewaSamiti.Controls.Add(this.ssSewadarLookup, 4, 0);
            this.tlpSewaSamiti.Controls.Add(this.ssResponsibilityCombo, 5, 0);
            this.tlpSewaSamiti.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpSewaSamiti.Location = new System.Drawing.Point(3, 519);
            this.tlpSewaSamiti.Name = "tlpSewaSamiti";
            this.tlpSewaSamiti.RowCount = 1;
            this.tlpSewaSamiti.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpSewaSamiti.Size = new System.Drawing.Size(910, 56);
            this.tlpSewaSamiti.TabIndex = 40;
            this.tlpSewaSamiti.TabStop = true;
            // 
            // ssintYearsInSewa
            // 
            this.ssintYearsInSewa.AllowsNew = false;
            this.ssintYearsInSewa.AllowsReference = false;
            this.ssintYearsInSewa.AllowsUpdate = false;
            this.ssintYearsInSewa.ApplicationIdForDbConnection = null;
            this.ssintYearsInSewa.BackColor = System.Drawing.Color.Transparent;
            this.ssintYearsInSewa.CalledScreenApplicationId = null;
            this.ssintYearsInSewa.CalledScreenTypeName = null;
            this.ssintYearsInSewa.CallingScreenType = null;
            this.ssintYearsInSewa.DisplayText = "";
            this.ssintYearsInSewa.DisplayTextBindingKey = "ss_years_in_sewa";
            this.ssintYearsInSewa.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ssintYearsInSewa.EditingControlDataGridView = null;
            this.ssintYearsInSewa.EditingControlFormattedValue = "";
            this.ssintYearsInSewa.EditingControlRowIndex = 0;
            this.ssintYearsInSewa.EditingControlValueChanged = false;
            this.ssintYearsInSewa.EnableToolTip = false;
            this.ssintYearsInSewa.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ssintYearsInSewa.IdText = null;
            this.ssintYearsInSewa.IdTextBindingKey = null;
            this.ssintYearsInSewa.Location = new System.Drawing.Point(820, 3);
            this.ssintYearsInSewa.Lookup = false;
            this.ssintYearsInSewa.LookupColumns = null;
            this.ssintYearsInSewa.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.ssintYearsInSewa.LookupResult = null;
            this.ssintYearsInSewa.LookupTitle = "";
            this.ssintYearsInSewa.Mandatory = false;
            this.ssintYearsInSewa.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ssintYearsInSewa.MaxCharacterLength = 32767;
            this.ssintYearsInSewa.MaximumSize = new System.Drawing.Size(1300, 45);
            this.ssintYearsInSewa.MaxValue = ((long)(9223372036854775807));
            this.ssintYearsInSewa.MinCharactersForQuery = 0;
            this.ssintYearsInSewa.MinimumSize = new System.Drawing.Size(10, 22);
            this.ssintYearsInSewa.MinValue = ((long)(-9223372036854775808));
            this.ssintYearsInSewa.Name = "ssintYearsInSewa";
            this.ssintYearsInSewa.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.ssintYearsInSewa.PascalCase = false;
            this.ssintYearsInSewa.RangeInQueryMode = false;
            this.ssintYearsInSewa.ReadOnly = true;
            this.ssintYearsInSewa.RegularExpressionValidator = null;
            this.ssintYearsInSewa.Size = new System.Drawing.Size(86, 45);
            this.ssintYearsInSewa.TabIndex = 71;
            this.ssintYearsInSewa.TabStop = false;
            this.ssintYearsInSewa.Title = "Years in Sewa";
            this.ssintYearsInSewa.ToolTipLookupField = "information";
            this.ssintYearsInSewa.ValueText = null;
            // 
            // ssStatus
            // 
            this.ssStatus.AllowsNew = false;
            this.ssStatus.AllowsReference = false;
            this.ssStatus.AllowsUpdate = false;
            this.ssStatus.ApplicationIdForDbConnection = null;
            this.ssStatus.BackColor = System.Drawing.Color.Transparent;
            this.ssStatus.CalledScreenApplicationId = null;
            this.ssStatus.CalledScreenTypeName = null;
            this.ssStatus.CallingScreenType = null;
            this.ssStatus.DisplayText = "";
            this.ssStatus.DisplayTextBindingKey = "ss_sewadar_status";
            this.ssStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ssStatus.EditingControlDataGridView = null;
            this.ssStatus.EditingControlFormattedValue = "";
            this.ssStatus.EditingControlRowIndex = 0;
            this.ssStatus.EditingControlValueChanged = false;
            this.ssStatus.EnableToolTip = false;
            this.ssStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ssStatus.IdText = null;
            this.ssStatus.IdTextBindingKey = null;
            this.ssStatus.Location = new System.Drawing.Point(704, 3);
            this.ssStatus.Lookup = false;
            this.ssStatus.LookupColumns = null;
            this.ssStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.ssStatus.LookupResult = null;
            this.ssStatus.LookupTitle = "";
            this.ssStatus.Mandatory = false;
            this.ssStatus.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ssStatus.MaxCharacterLength = 32767;
            this.ssStatus.MaximumSize = new System.Drawing.Size(1300, 45);
            this.ssStatus.MinCharactersForQuery = 0;
            this.ssStatus.MinimumSize = new System.Drawing.Size(10, 22);
            this.ssStatus.Name = "ssStatus";
            this.ssStatus.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.ssStatus.PascalCase = false;
            this.ssStatus.RangeInQueryMode = false;
            this.ssStatus.ReadOnly = true;
            this.ssStatus.RegularExpressionValidator = null;
            this.ssStatus.Size = new System.Drawing.Size(108, 45);
            this.ssStatus.TabIndex = 70;
            this.ssStatus.TabStop = false;
            this.ssStatus.Title = "Status";
            this.ssStatus.ToolTipLookupField = "information";
            this.ssStatus.ValueText = null;
            // 
            // ssZsmSatsangCentresLookup
            // 
            this.ssZsmSatsangCentresLookup.AllowsNew = false;
            this.ssZsmSatsangCentresLookup.AllowsReference = false;
            this.ssZsmSatsangCentresLookup.AllowsUpdate = false;
            this.ssZsmSatsangCentresLookup.ApplicationIdForDbConnection = null;
            this.ssZsmSatsangCentresLookup.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.ssZsmSatsangCentresLookup.BackColor = System.Drawing.Color.Transparent;
            this.ssZsmSatsangCentresLookup.CalledScreenApplicationId = null;
            this.ssZsmSatsangCentresLookup.CalledScreenTypeName = null;
            this.ssZsmSatsangCentresLookup.CallingScreenType = null;
            this.ssZsmSatsangCentresLookup.DisplayText = "";
            this.ssZsmSatsangCentresLookup.DisplayTextBindingKey = "ss_centre_nm";
            this.ssZsmSatsangCentresLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ssZsmSatsangCentresLookup.EditingControlDataGridView = null;
            this.ssZsmSatsangCentresLookup.EditingControlFormattedValue = null;
            this.ssZsmSatsangCentresLookup.EditingControlRowIndex = 0;
            this.ssZsmSatsangCentresLookup.EditingControlValueChanged = true;
            this.ssZsmSatsangCentresLookup.EnableToolTip = false;
            this.ssZsmSatsangCentresLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.ssZsmSatsangCentresLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ssZsmSatsangCentresLookup.IdText = "";
            this.ssZsmSatsangCentresLookup.IdTextBindingKey = "ss_centre_id";
            this.ssZsmSatsangCentresLookup.Location = new System.Drawing.Point(97, 3);
            this.ssZsmSatsangCentresLookup.Lookup = true;
            this.ssZsmSatsangCentresLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.ssZsmSatsangCentresLookup.LookupResult = null;
            this.ssZsmSatsangCentresLookup.LookupTitle = "";
            this.ssZsmSatsangCentresLookup.Mandatory = false;
            this.ssZsmSatsangCentresLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ssZsmSatsangCentresLookup.MaxCharacterLength = 32767;
            this.ssZsmSatsangCentresLookup.MaximumSize = new System.Drawing.Size(1300, 45);
            this.ssZsmSatsangCentresLookup.MinCharactersForQuery = 0;
            this.ssZsmSatsangCentresLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.ssZsmSatsangCentresLookup.Name = "ssZsmSatsangCentresLookup";
            this.ssZsmSatsangCentresLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.ssZsmSatsangCentresLookup.PascalCase = false;
            this.ssZsmSatsangCentresLookup.RangeInQueryMode = false;
            this.ssZsmSatsangCentresLookup.ReadOnly = false;
            this.ssZsmSatsangCentresLookup.RegularExpressionValidator = null;
            this.ssZsmSatsangCentresLookup.ShowOnlyMainCentres = false;
            this.ssZsmSatsangCentresLookup.Size = new System.Drawing.Size(115, 45);
            this.ssZsmSatsangCentresLookup.TabIndex = 25;
            this.ssZsmSatsangCentresLookup.TabStop = false;
            this.ssZsmSatsangCentresLookup.Title = "Satsang Centre";
            this.ssZsmSatsangCentresLookup.ToolTipLookupField = "information";
            this.ssZsmSatsangCentresLookup.ValueText = "";
            // 
            // lblSewaSamiti
            // 
            this.lblSewaSamiti.AutoSize = true;
            this.lblSewaSamiti.BackColor = System.Drawing.Color.Transparent;
            this.lblSewaSamiti.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblSewaSamiti.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSewaSamiti.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblSewaSamiti.Location = new System.Drawing.Point(3, 20);
            this.lblSewaSamiti.Margin = new System.Windows.Forms.Padding(3, 20, 3, 0);
            this.lblSewaSamiti.Name = "lblSewaSamiti";
            this.lblSewaSamiti.Size = new System.Drawing.Size(87, 36);
            this.lblSewaSamiti.TabIndex = 58;
            this.lblSewaSamiti.Text = "Sewa Samiti";
            // 
            // ssGrNoLookup
            // 
            this.ssGrNoLookup.AllowsNew = false;
            this.ssGrNoLookup.AllowsReference = false;
            this.ssGrNoLookup.AllowsUpdate = false;
            this.ssGrNoLookup.ApplicationIdForDbConnection = null;
            this.ssGrNoLookup.BackColor = System.Drawing.Color.Transparent;
            this.ssGrNoLookup.CalledScreenApplicationId = null;
            this.ssGrNoLookup.CalledScreenTypeName = null;
            this.ssGrNoLookup.CallingScreenType = null;
            this.ssGrNoLookup.DisplayText = "";
            this.ssGrNoLookup.DisplayTextBindingKey = "ss_sewadar_grno";
            this.ssGrNoLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ssGrNoLookup.EditingControlDataGridView = null;
            this.ssGrNoLookup.EditingControlFormattedValue = null;
            this.ssGrNoLookup.EditingControlRowIndex = 0;
            this.ssGrNoLookup.EditingControlValueChanged = true;
            this.ssGrNoLookup.EnableToolTip = false;
            this.ssGrNoLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.ssGrNoLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ssGrNoLookup.IdText = "";
            this.ssGrNoLookup.IdTextBindingKey = "ss_sewadar_id";
            this.ssGrNoLookup.Location = new System.Drawing.Point(220, 3);
            this.ssGrNoLookup.Lookup = true;
            this.ssGrNoLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.ssGrNoLookup.LookupResult = null;
            this.ssGrNoLookup.LookupTitle = "";
            this.ssGrNoLookup.Mandatory = false;
            this.ssGrNoLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ssGrNoLookup.MaxCharacterLength = 32767;
            this.ssGrNoLookup.MaximumSize = new System.Drawing.Size(1300, 45);
            this.ssGrNoLookup.MinCharactersForQuery = 0;
            this.ssGrNoLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.ssGrNoLookup.Name = "ssGrNoLookup";
            this.ssGrNoLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.ssGrNoLookup.PascalCase = false;
            this.ssGrNoLookup.RangeInQueryMode = false;
            this.ssGrNoLookup.ReadOnly = false;
            this.ssGrNoLookup.RegularExpressionValidator = null;
            this.ssGrNoLookup.Size = new System.Drawing.Size(77, 45);
            this.ssGrNoLookup.SttsCode = null;
            this.ssGrNoLookup.TabIndex = 26;
            this.ssGrNoLookup.Title = "GR No.";
            this.ssGrNoLookup.ToolTipLookupField = "information";
            this.ssGrNoLookup.ValueText = "";
            this.ssGrNoLookup.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.ssGrNoLookup_LookupDialogShowing);
            this.ssGrNoLookup.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.ssGrNoLookup_LookupResultSet);
            // 
            // ssSewadarIDLookup
            // 
            this.ssSewadarIDLookup.AllowsNew = false;
            this.ssSewadarIDLookup.AllowsReference = false;
            this.ssSewadarIDLookup.AllowsUpdate = false;
            this.ssSewadarIDLookup.ApplicationIdForDbConnection = null;
            this.ssSewadarIDLookup.BackColor = System.Drawing.Color.Transparent;
            this.ssSewadarIDLookup.CalledScreenApplicationId = null;
            this.ssSewadarIDLookup.CalledScreenTypeName = null;
            this.ssSewadarIDLookup.CallingScreenType = null;
            this.ssSewadarIDLookup.DisplayText = "";
            this.ssSewadarIDLookup.DisplayTextBindingKey = "ss_sewadar_id";
            this.ssSewadarIDLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ssSewadarIDLookup.EditingControlDataGridView = null;
            this.ssSewadarIDLookup.EditingControlFormattedValue = null;
            this.ssSewadarIDLookup.EditingControlRowIndex = 0;
            this.ssSewadarIDLookup.EditingControlValueChanged = true;
            this.ssSewadarIDLookup.EnableToolTip = false;
            this.ssSewadarIDLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.ssSewadarIDLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ssSewadarIDLookup.IdText = "";
            this.ssSewadarIDLookup.IdTextBindingKey = "ss_sewadar_id";
            this.ssSewadarIDLookup.Location = new System.Drawing.Point(305, 3);
            this.ssSewadarIDLookup.Lookup = true;
            this.ssSewadarIDLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.ssSewadarIDLookup.LookupResult = null;
            this.ssSewadarIDLookup.LookupTitle = "";
            this.ssSewadarIDLookup.Mandatory = false;
            this.ssSewadarIDLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ssSewadarIDLookup.MaxCharacterLength = 32767;
            this.ssSewadarIDLookup.MaximumSize = new System.Drawing.Size(1300, 45);
            this.ssSewadarIDLookup.MinCharactersForQuery = 0;
            this.ssSewadarIDLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.ssSewadarIDLookup.Name = "ssSewadarIDLookup";
            this.ssSewadarIDLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.ssSewadarIDLookup.PascalCase = false;
            this.ssSewadarIDLookup.RangeInQueryMode = false;
            this.ssSewadarIDLookup.ReadOnly = false;
            this.ssSewadarIDLookup.RegularExpressionValidator = null;
            this.ssSewadarIDLookup.Size = new System.Drawing.Size(82, 45);
            this.ssSewadarIDLookup.SttsCode = null;
            this.ssSewadarIDLookup.TabIndex = 27;
            this.ssSewadarIDLookup.Title = "Sewadar ID";
            this.ssSewadarIDLookup.ToolTipLookupField = "information";
            this.ssSewadarIDLookup.ValueText = "";
            this.ssSewadarIDLookup.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.ssSewadarIDLookup_LookupDialogShowing);
            this.ssSewadarIDLookup.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.ssSewadarIDLookup_LookupResultSet);
            // 
            // ssSewadarLookup
            // 
            this.ssSewadarLookup.AllowsNew = false;
            this.ssSewadarLookup.AllowsReference = false;
            this.ssSewadarLookup.AllowsUpdate = false;
            this.ssSewadarLookup.ApplicationIdForDbConnection = null;
            this.ssSewadarLookup.BackColor = System.Drawing.Color.Transparent;
            this.ssSewadarLookup.CalledScreenApplicationId = null;
            this.ssSewadarLookup.CalledScreenTypeName = null;
            this.ssSewadarLookup.CallingScreenType = null;
            this.ssSewadarLookup.DisplayText = "";
            this.ssSewadarLookup.DisplayTextBindingKey = "ss_full_nm";
            this.ssSewadarLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ssSewadarLookup.EditingControlDataGridView = null;
            this.ssSewadarLookup.EditingControlFormattedValue = null;
            this.ssSewadarLookup.EditingControlRowIndex = 0;
            this.ssSewadarLookup.EditingControlValueChanged = true;
            this.ssSewadarLookup.EnableToolTip = false;
            this.ssSewadarLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.ssSewadarLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ssSewadarLookup.IdText = "";
            this.ssSewadarLookup.IdTextBindingKey = "ss_sewadar_id";
            this.ssSewadarLookup.Location = new System.Drawing.Point(395, 3);
            this.ssSewadarLookup.Lookup = true;
            this.ssSewadarLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.ssSewadarLookup.LookupResult = null;
            this.ssSewadarLookup.LookupTitle = "";
            this.ssSewadarLookup.Mandatory = true;
            this.ssSewadarLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ssSewadarLookup.MaxCharacterLength = 32767;
            this.ssSewadarLookup.MaximumSize = new System.Drawing.Size(1300, 45);
            this.ssSewadarLookup.MinCharactersForQuery = 0;
            this.ssSewadarLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.ssSewadarLookup.Name = "ssSewadarLookup";
            this.ssSewadarLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.ssSewadarLookup.PascalCase = false;
            this.ssSewadarLookup.RangeInQueryMode = false;
            this.ssSewadarLookup.ReadOnly = false;
            this.ssSewadarLookup.RegularExpressionValidator = null;
            this.ssSewadarLookup.Size = new System.Drawing.Size(209, 45);
            this.ssSewadarLookup.SttsCode = null;
            this.ssSewadarLookup.TabIndex = 28;
            this.ssSewadarLookup.Title = "Name";
            this.ssSewadarLookup.ToolTipLookupField = "information";
            this.ssSewadarLookup.ValueText = "";
            this.ssSewadarLookup.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.ssSewadarLookup_LookupDialogShowing);
            this.ssSewadarLookup.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.ssSewadarLookup_LookupResultSet);
            // 
            // ssResponsibilityCombo
            // 
            this.ssResponsibilityCombo.AllowsNew = false;
            this.ssResponsibilityCombo.AllowsReference = false;
            this.ssResponsibilityCombo.AllowsUpdate = false;
            this.ssResponsibilityCombo.ApplicationIdForDbConnection = null;
            this.ssResponsibilityCombo.BackColor = System.Drawing.Color.Transparent;
            this.ssResponsibilityCombo.CalledScreenApplicationId = null;
            this.ssResponsibilityCombo.CalledScreenTypeName = null;
            this.ssResponsibilityCombo.CallingScreenType = null;
            this.ssResponsibilityCombo.DisplayText = "";
            this.ssResponsibilityCombo.DisplayTextBindingKey = "ss_responsibility";
            this.ssResponsibilityCombo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ssResponsibilityCombo.EditingControlDataGridView = null;
            this.ssResponsibilityCombo.EditingControlFormattedValue = "";
            this.ssResponsibilityCombo.EditingControlRowIndex = 0;
            this.ssResponsibilityCombo.EditingControlValueChanged = false;
            this.ssResponsibilityCombo.EnableToolTip = false;
            this.ssResponsibilityCombo.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ssResponsibilityCombo.IdText = null;
            this.ssResponsibilityCombo.IdTextBindingKey = null;
            this.ssResponsibilityCombo.Location = new System.Drawing.Point(612, 3);
            this.ssResponsibilityCombo.Lookup = false;
            this.ssResponsibilityCombo.LookupColumns = null;
            this.ssResponsibilityCombo.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.ssResponsibilityCombo.LookupResult = null;
            this.ssResponsibilityCombo.LookupTitle = "";
            this.ssResponsibilityCombo.Mandatory = false;
            this.ssResponsibilityCombo.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ssResponsibilityCombo.MaxCharacterLength = 32767;
            this.ssResponsibilityCombo.MaximumSize = new System.Drawing.Size(1300, 45);
            this.ssResponsibilityCombo.MinCharactersForQuery = 0;
            this.ssResponsibilityCombo.MinimumSize = new System.Drawing.Size(10, 22);
            this.ssResponsibilityCombo.Name = "ssResponsibilityCombo";
            this.ssResponsibilityCombo.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.ssResponsibilityCombo.PascalCase = false;
            this.ssResponsibilityCombo.RangeInQueryMode = false;
            this.ssResponsibilityCombo.ReadOnly = true;
            this.ssResponsibilityCombo.RegularExpressionValidator = null;
            this.ssResponsibilityCombo.Size = new System.Drawing.Size(84, 45);
            this.ssResponsibilityCombo.TabIndex = 72;
            this.ssResponsibilityCombo.TabStop = false;
            this.ssResponsibilityCombo.Title = "Responsibility";
            this.ssResponsibilityCombo.ToolTipLookupField = "information";
            this.ssResponsibilityCombo.ValueText = null;
            // 
            // txtPhotosLocation
            // 
            this.txtPhotosLocation.AllowsNew = false;
            this.txtPhotosLocation.AllowsReference = false;
            this.txtPhotosLocation.AllowsUpdate = false;
            this.txtPhotosLocation.ApplicationIdForDbConnection = null;
            this.txtPhotosLocation.BackColor = System.Drawing.Color.Transparent;
            this.txtPhotosLocation.CalledScreenApplicationId = null;
            this.txtPhotosLocation.CalledScreenTypeName = null;
            this.txtPhotosLocation.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.txtPhotosLocation, 3);
            this.txtPhotosLocation.DisplayText = "";
            this.txtPhotosLocation.DisplayTextBindingKey = null;
            this.txtPhotosLocation.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPhotosLocation.EditingControlDataGridView = null;
            this.txtPhotosLocation.EditingControlFormattedValue = "";
            this.txtPhotosLocation.EditingControlRowIndex = 0;
            this.txtPhotosLocation.EditingControlValueChanged = false;
            this.txtPhotosLocation.EnableToolTip = false;
            this.txtPhotosLocation.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPhotosLocation.IdText = null;
            this.txtPhotosLocation.IdTextBindingKey = null;
            this.txtPhotosLocation.Location = new System.Drawing.Point(252, 194);
            this.txtPhotosLocation.Lookup = false;
            this.txtPhotosLocation.LookupColumns = null;
            this.txtPhotosLocation.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtPhotosLocation.LookupResult = null;
            this.txtPhotosLocation.LookupTitle = "Photos Location";
            this.txtPhotosLocation.Mandatory = true;
            this.txtPhotosLocation.Margin = new System.Windows.Forms.Padding(4, 3, 0, 3);
            this.txtPhotosLocation.MaxCharacterLength = 32767;
            this.txtPhotosLocation.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtPhotosLocation.MinCharactersForQuery = 0;
            this.txtPhotosLocation.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtPhotosLocation.Name = "txtPhotosLocation";
            this.txtPhotosLocation.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtPhotosLocation.PascalCase = false;
            this.txtPhotosLocation.RangeInQueryMode = false;
            this.txtPhotosLocation.ReadOnly = true;
            this.txtPhotosLocation.RegularExpressionValidator = null;
            this.txtPhotosLocation.Size = new System.Drawing.Size(413, 43);
            this.txtPhotosLocation.TabIndex = 3;
            this.txtPhotosLocation.TabStop = false;
            this.txtPhotosLocation.Title = "Photos Location";
            this.txtPhotosLocation.ToolTipLookupField = "information";
            this.txtPhotosLocation.ValueText = null;
            // 
            // btnPhotoLocation
            // 
            this.btnPhotoLocation.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnPhotoLocation.Image = ((System.Drawing.Image)(resources.GetObject("btnPhotoLocation.Image")));
            this.btnPhotoLocation.Location = new System.Drawing.Point(665, 211);
            this.btnPhotoLocation.Margin = new System.Windows.Forms.Padding(0, 20, 4, 3);
            this.btnPhotoLocation.MaximumSize = new System.Drawing.Size(25, 25);
            this.btnPhotoLocation.Name = "btnPhotoLocation";
            this.btnPhotoLocation.Size = new System.Drawing.Size(25, 25);
            this.btnPhotoLocation.TabIndex = 1;
            this.btnPhotoLocation.UseVisualStyleBackColor = true;
            this.btnPhotoLocation.Click += new System.EventHandler(this.btnPhotoLocation_Click);
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
            this.dtPhotoDate.DisplayTextBindingKey = null;
            this.dtPhotoDate.Dock = System.Windows.Forms.DockStyle.Left;
            this.dtPhotoDate.EditingControlDataGridView = null;
            this.dtPhotoDate.EditingControlFormattedValue = null;
            this.dtPhotoDate.EditingControlRowIndex = 0;
            this.dtPhotoDate.EditingControlValueChanged = false;
            this.dtPhotoDate.EnableToolTip = false;
            this.dtPhotoDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtPhotoDate.IdText = "";
            this.dtPhotoDate.IdTextBindingKey = null;
            this.dtPhotoDate.Location = new System.Drawing.Point(344, 431);
            this.dtPhotoDate.Lookup = true;
            this.dtPhotoDate.LookupColumns = null;
            this.dtPhotoDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtPhotoDate.LookupResult = null;
            this.dtPhotoDate.LookupTitle = "Photo Date";
            this.dtPhotoDate.Mandatory = true;
            this.dtPhotoDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtPhotoDate.MaxCharacterLength = 11;
            this.dtPhotoDate.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtPhotoDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtPhotoDate.MinCharactersForQuery = 0;
            this.dtPhotoDate.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtPhotoDate.MinValue = new System.DateTime(((long)(0)));
            this.dtPhotoDate.Name = "dtPhotoDate";
            this.dtPhotoDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtPhotoDate.PascalCase = false;
            this.dtPhotoDate.RangeInQueryMode = false;
            this.dtPhotoDate.ReadOnly = false;
            this.dtPhotoDate.RegularExpressionValidator = null;
            this.dtPhotoDate.ShowTime = false;
            this.dtPhotoDate.Size = new System.Drawing.Size(222, 40);
            this.dtPhotoDate.TabIndex = 3;
            this.dtPhotoDate.Title = "Photo Date";
            this.dtPhotoDate.ToolTipLookupField = "information";
            this.dtPhotoDate.ValueText = "";
            // 
            // imageExtensionsListBox1
            // 
            this.imageExtensionsListBox1.ApplicationIdForDbConnection = null;
            this.imageExtensionsListBox1.BackColor = System.Drawing.Color.Transparent;
            this.imageExtensionsListBox1.CalledScreenApplicationId = null;
            this.imageExtensionsListBox1.CalledScreenTypeName = null;
            this.imageExtensionsListBox1.CallingScreenType = null;
            this.imageExtensionsListBox1.DisplayTextBindingKey = "";
            this.imageExtensionsListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.imageExtensionsListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.imageExtensionsListBox1.IdTextBindingKey = "";
            this.imageExtensionsListBox1.Location = new System.Drawing.Point(345, 243);
            this.imageExtensionsListBox1.Lookup = false;
            this.imageExtensionsListBox1.LookupColumns = null;
            this.imageExtensionsListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.imageExtensionsListBox1.Mandatory = true;
            this.imageExtensionsListBox1.Margin = new System.Windows.Forms.Padding(5, 3, 5, 3);
            this.imageExtensionsListBox1.MaximumSize = new System.Drawing.Size(2667, 2154);
            this.imageExtensionsListBox1.MinimumSize = new System.Drawing.Size(13, 24);
            this.imageExtensionsListBox1.Name = "imageExtensionsListBox1";
            this.imageExtensionsListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.imageExtensionsListBox1.ReadOnly = false;
            this.imageExtensionsListBox1.Size = new System.Drawing.Size(223, 137);
            this.imageExtensionsListBox1.TabIndex = 2;
            this.imageExtensionsListBox1.Title = "Image Extensions";
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
            this.tlpBase.SetColumnSpan(this.txtExcelLoc, 3);
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
            this.txtExcelLoc.Location = new System.Drawing.Point(252, 145);
            this.txtExcelLoc.Lookup = false;
            this.txtExcelLoc.LookupColumns = null;
            this.txtExcelLoc.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtExcelLoc.LookupResult = null;
            this.txtExcelLoc.LookupTitle = "Excel Location";
            this.txtExcelLoc.Mandatory = true;
            this.txtExcelLoc.Margin = new System.Windows.Forms.Padding(4, 3, 0, 3);
            this.txtExcelLoc.MaxCharacterLength = 32767;
            this.txtExcelLoc.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtExcelLoc.MinCharactersForQuery = 0;
            this.txtExcelLoc.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtExcelLoc.Name = "txtExcelLoc";
            this.txtExcelLoc.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtExcelLoc.PascalCase = false;
            this.txtExcelLoc.RangeInQueryMode = false;
            this.txtExcelLoc.ReadOnly = true;
            this.txtExcelLoc.RegularExpressionValidator = null;
            this.txtExcelLoc.Size = new System.Drawing.Size(413, 43);
            this.txtExcelLoc.TabIndex = 6;
            this.txtExcelLoc.TabStop = false;
            this.txtExcelLoc.Title = "CSV Location";
            this.txtExcelLoc.ToolTipLookupField = "information";
            this.txtExcelLoc.ValueText = null;
            // 
            // btnExcelLoc
            // 
            this.btnExcelLoc.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnExcelLoc.Image = ((System.Drawing.Image)(resources.GetObject("btnExcelLoc.Image")));
            this.btnExcelLoc.Location = new System.Drawing.Point(665, 162);
            this.btnExcelLoc.Margin = new System.Windows.Forms.Padding(0, 20, 4, 3);
            this.btnExcelLoc.MaximumSize = new System.Drawing.Size(25, 25);
            this.btnExcelLoc.Name = "btnExcelLoc";
            this.btnExcelLoc.Size = new System.Drawing.Size(25, 25);
            this.btnExcelLoc.TabIndex = 7;
            this.btnExcelLoc.UseVisualStyleBackColor = true;
            this.btnExcelLoc.Click += new System.EventHandler(this.btnExcelLoc_Click);
            // 
            // lblForSatsangCentre
            // 
            this.lblForSatsangCentre.AutoSize = true;
            this.lblForSatsangCentre.BackColor = System.Drawing.Color.Transparent;
            this.lblForSatsangCentre.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblForSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblForSatsangCentre.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblForSatsangCentre.Location = new System.Drawing.Point(343, 71);
            this.lblForSatsangCentre.Name = "lblForSatsangCentre";
            this.lblForSatsangCentre.Size = new System.Drawing.Size(227, 14);
            this.lblForSatsangCentre.TabIndex = 41;
            this.lblForSatsangCentre.Text = " Satsang Centre";
            // 
            // lblSatsangCentre
            // 
            this.lblSatsangCentre.AutoSize = true;
            this.lblSatsangCentre.BackColor = System.Drawing.Color.Transparent;
            this.lblSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblSatsangCentre.Font = new System.Drawing.Font("Verdana", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSatsangCentre.ForeColor = System.Drawing.Color.Red;
            this.lblSatsangCentre.Location = new System.Drawing.Point(343, 85);
            this.lblSatsangCentre.Name = "lblSatsangCentre";
            this.lblSatsangCentre.Size = new System.Drawing.Size(227, 57);
            this.lblSatsangCentre.TabIndex = 42;
            // 
            // RegisterSewadarsInBulk
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(916, 578);
            this.Controls.Add(this.tlpBase);
            this.Name = "RegisterSewadarsInBulk";
            this.Text = "Migrate Sewadars";
            this.tlpBase.ResumeLayout(false);
            this.tlpBase.PerformLayout();
            this.tlpSewaSamiti.ResumeLayout(false);
            this.tlpSewaSamiti.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtPhotosLocation;
        private System.Windows.Forms.Button btnPhotoLocation;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtPhotoDate;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtExcelLoc;
        private System.Windows.Forms.Button btnExcelLoc;
        private Controls.Lists.ImageExtensionsListBox imageExtensionsListBox1;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpSewaSamiti;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField ssintYearsInSewa;
        private UMB.CDF.UIControls.TextControls.DCCTextField ssStatus;
        private Controls.ZSMLookups.ZSMMainSatsangCentresLookup ssZsmSatsangCentresLookup;
        private UMB.CDF.UIControls.DCCLabel lblSewaSamiti;
        private Controls.ZSMLookups.GRNoLookup ssGrNoLookup;
        private Controls.ZSMLookups.RegisteredSewadarIDLookup ssSewadarIDLookup;
        private Controls.ZSMLookups.RegisteredSewadarLookup ssSewadarLookup;
        private UMB.CDF.UIControls.TextControls.DCCTextField ssResponsibilityCombo;
        private UMB.CDF.UIControls.DCCLabel lblForSatsangCentre;
        private UMB.CDF.UIControls.DCCLabel lblSatsangCentre;

    }
}