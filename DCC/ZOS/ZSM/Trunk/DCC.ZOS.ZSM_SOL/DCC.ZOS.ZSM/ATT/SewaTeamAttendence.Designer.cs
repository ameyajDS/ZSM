namespace DCC.ZOS.ZSM.ATT
{
    partial class SewaTeamAttendence
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SewaTeamAttendence));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle13 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle14 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle15 = new System.Windows.Forms.DataGridViewCellStyle();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewaLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.tblButton = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.chkPresentAll = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkAtendeanceAll = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.txtSatsangCentre = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tblPeriod = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dtStart = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtFinish = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtAttendence = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.sewaTeamsLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup();
            this.intSewaTeamId = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.grdSewaWiseDailyAttendance = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.serial_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.centre_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.grd_sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.grd_full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Status = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.attendance_p = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.attendance_e = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.attendance_l = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.attendance_a = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.sewa_exemption_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.enable = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.old_serial_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.attendance_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_team_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewa_team_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.finish_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.start_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.tlpBase.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.tblButton.SuspendLayout();
            this.tblPeriod.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSewaWiseDailyAttendance)).BeginInit();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 5;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.203207F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.70053F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.48663F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 32.51337F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.096256F));
            this.tlpBase.Controls.Add(this.tlpTop, 0, 1);
            this.tlpBase.Controls.Add(this.grdSewaWiseDailyAttendance, 0, 2);
            this.tlpBase.Controls.Add(this.dccTableLayoutPanel1, 1, 3);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Margin = new System.Windows.Forms.Padding(4);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 4;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 2F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 70F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 3F));
            this.tlpBase.Size = new System.Drawing.Size(1243, 740);
            this.tlpBase.TabIndex = 0;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 5;
            this.tlpBase.SetColumnSpan(this.tlpTop, 5);
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 64.70588F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 35.29412F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 95F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 305F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 259F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 27F));
            this.tlpTop.Controls.Add(this.sewaLookup1, 1, 0);
            this.tlpTop.Controls.Add(this.tblButton, 3, 2);
            this.tlpTop.Controls.Add(this.txtSatsangCentre, 0, 0);
            this.tlpTop.Controls.Add(this.tblPeriod, 4, 0);
            this.tlpTop.Controls.Add(this.dtAttendence, 3, 1);
            this.tlpTop.Controls.Add(this.sewaTeamsLookup1, 0, 1);
            this.tlpTop.Controls.Add(this.intSewaTeamId, 2, 1);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(4, 18);
            this.tlpTop.Margin = new System.Windows.Forms.Padding(4);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 3;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tlpTop.Size = new System.Drawing.Size(1235, 177);
            this.tlpTop.TabIndex = 0;
            // 
            // sewaLookup1
            // 
            this.sewaLookup1.AllowsNew = false;
            this.sewaLookup1.AllowsReference = false;
            this.sewaLookup1.AllowsUpdate = false;
            this.sewaLookup1.ApplicationIdForDbConnection = null;
            this.sewaLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewaLookup1.CalledScreenApplicationId = null;
            this.sewaLookup1.CalledScreenTypeName = null;
            this.sewaLookup1.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.sewaLookup1, 3);
            this.sewaLookup1.DisplayText = "";
            this.sewaLookup1.DisplayTextBindingKey = "sewa_nm";
            this.sewaLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaLookup1.EditingControlDataGridView = null;
            this.sewaLookup1.EditingControlFormattedValue = null;
            this.sewaLookup1.EditingControlRowIndex = 0;
            this.sewaLookup1.EditingControlValueChanged = true;
            this.sewaLookup1.EnableToolTip = false;
            this.sewaLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaLookup1.IdText = null;
            this.sewaLookup1.IdTextBindingKey = "sewa_id";
            this.sewaLookup1.Location = new System.Drawing.Point(377, 4);
            this.sewaLookup1.Lookup = true;
            this.sewaLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.sewaLookup1.LookupResult = null;
            this.sewaLookup1.Mandatory = true;
            this.sewaLookup1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.sewaLookup1.MaxCharacterLength = 32767;
            this.sewaLookup1.MaximumSize = new System.Drawing.Size(1733, 55);
            this.sewaLookup1.MinCharactersForQuery = 0;
            this.sewaLookup1.MinimumSize = new System.Drawing.Size(13, 27);
            this.sewaLookup1.Name = "sewaLookup1";
            this.sewaLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaLookup1.PascalCase = false;
            this.sewaLookup1.RangeInQueryMode = false;
            this.sewaLookup1.ReadOnly = false;
            this.sewaLookup1.RegularExpressionValidator = null;
            this.sewaLookup1.Size = new System.Drawing.Size(593, 55);
            this.sewaLookup1.TabIndex = 1;
            this.sewaLookup1.Title = "Sewa";
            this.sewaLookup1.ToolTipLookupField = "information";
            this.sewaLookup1.ValueText = null;
            this.sewaLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookup1_LookupDialogShowing);
            this.sewaLookup1.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.sewaLookup1_LookupResultSet);
            // 
            // tblButton
            // 
            this.tblButton.ColumnCount = 4;
            this.tlpTop.SetColumnSpan(this.tblButton, 2);
            this.tblButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23.97094F));
            this.tblButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 21.06537F));
            this.tblButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15.49637F));
            this.tblButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 38.75F));
            this.tblButton.Controls.Add(this.chkPresentAll, 1, 0);
            this.tblButton.Controls.Add(this.chkAtendeanceAll, 2, 0);
            this.tblButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblButton.Location = new System.Drawing.Point(674, 144);
            this.tblButton.Margin = new System.Windows.Forms.Padding(4);
            this.tblButton.Name = "tblButton";
            this.tblButton.RowCount = 1;
            this.tblButton.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tblButton.Size = new System.Drawing.Size(557, 29);
            this.tblButton.TabIndex = 4;
            // 
            // chkPresentAll
            // 
            this.chkPresentAll.AutoSize = true;
            this.chkPresentAll.BackColor = System.Drawing.Color.Transparent;
            this.chkPresentAll.BindingKey = null;
            this.chkPresentAll.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkPresentAll.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkPresentAll.Location = new System.Drawing.Point(138, 4);
            this.chkPresentAll.Margin = new System.Windows.Forms.Padding(4);
            this.chkPresentAll.Name = "chkPresentAll";
            this.chkPresentAll.Size = new System.Drawing.Size(110, 21);
            this.chkPresentAll.TabIndex = 0;
            this.chkPresentAll.Text = "Mark P";
            this.chkPresentAll.UseVisualStyleBackColor = true;
            this.chkPresentAll.CheckStateChanged += new System.EventHandler(this.chkPresentAll_CheckStateChanged);
            // 
            // chkAtendeanceAll
            // 
            this.chkAtendeanceAll.AutoSize = true;
            this.chkAtendeanceAll.BackColor = System.Drawing.Color.Transparent;
            this.chkAtendeanceAll.BindingKey = null;
            this.tblButton.SetColumnSpan(this.chkAtendeanceAll, 2);
            this.chkAtendeanceAll.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkAtendeanceAll.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkAtendeanceAll.Location = new System.Drawing.Point(256, 4);
            this.chkAtendeanceAll.Margin = new System.Windows.Forms.Padding(4);
            this.chkAtendeanceAll.Name = "chkAtendeanceAll";
            this.chkAtendeanceAll.Size = new System.Drawing.Size(297, 21);
            this.chkAtendeanceAll.TabIndex = 1;
            this.chkAtendeanceAll.Text = "Mark A";
            this.chkAtendeanceAll.UseVisualStyleBackColor = true;
            this.chkAtendeanceAll.CheckStateChanged += new System.EventHandler(this.chkAtendeanceAll_CheckStateChanged);
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
            this.txtSatsangCentre.DisplayTextBindingKey = "centre_nm";
            this.txtSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentre.EditingControlDataGridView = null;
            this.txtSatsangCentre.EditingControlFormattedValue = "";
            this.txtSatsangCentre.EditingControlRowIndex = 0;
            this.txtSatsangCentre.EditingControlValueChanged = false;
            this.txtSatsangCentre.EnableToolTip = false;
            this.txtSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentre.IdText = null;
            this.txtSatsangCentre.IdTextBindingKey = null;
            this.txtSatsangCentre.Location = new System.Drawing.Point(5, 4);
            this.txtSatsangCentre.Lookup = false;
            this.txtSatsangCentre.LookupColumns = null;
            this.txtSatsangCentre.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentre.LookupResult = null;
            this.txtSatsangCentre.Mandatory = false;
            this.txtSatsangCentre.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSatsangCentre.MaxCharacterLength = 32767;
            this.txtSatsangCentre.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSatsangCentre.MinCharactersForQuery = 0;
            this.txtSatsangCentre.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSatsangCentre.Name = "txtSatsangCentre";
            this.txtSatsangCentre.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCentre.PascalCase = false;
            this.txtSatsangCentre.RangeInQueryMode = false;
            this.txtSatsangCentre.ReadOnly = true;
            this.txtSatsangCentre.RegularExpressionValidator = null;
            this.txtSatsangCentre.Size = new System.Drawing.Size(362, 55);
            this.txtSatsangCentre.TabIndex = 0;
            this.txtSatsangCentre.TabStop = false;
            this.txtSatsangCentre.Title = "Satsang Centre";
            this.txtSatsangCentre.ToolTipLookupField = "information";
            this.txtSatsangCentre.ValueText = null;
            // 
            // tblPeriod
            // 
            this.tblPeriod.ColumnCount = 1;
            this.tblPeriod.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblPeriod.Controls.Add(this.dtStart, 0, 0);
            this.tblPeriod.Controls.Add(this.dtFinish, 0, 1);
            this.tblPeriod.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblPeriod.Location = new System.Drawing.Point(979, 4);
            this.tblPeriod.Margin = new System.Windows.Forms.Padding(4);
            this.tblPeriod.Name = "tblPeriod";
            this.tblPeriod.RowCount = 2;
            this.tlpTop.SetRowSpan(this.tblPeriod, 2);
            this.tblPeriod.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblPeriod.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblPeriod.Size = new System.Drawing.Size(252, 132);
            this.tblPeriod.TabIndex = 5;
            // 
            // dtStart
            // 
            this.dtStart.AllowFutureDate = true;
            this.dtStart.AllowsNew = false;
            this.dtStart.AllowsReference = false;
            this.dtStart.AllowsUpdate = false;
            this.dtStart.ApplicationIdForDbConnection = null;
            this.dtStart.BackColor = System.Drawing.Color.Transparent;
            this.dtStart.CalledScreenApplicationId = null;
            this.dtStart.CalledScreenTypeName = null;
            this.dtStart.CallingScreenType = null;
            this.dtStart.DisplayText = null;
            this.dtStart.DisplayTextAsDateTime = null;
            this.dtStart.DisplayTextBindingKey = "start_dt";
            this.dtStart.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtStart.EditingControlDataGridView = null;
            this.dtStart.EditingControlFormattedValue = null;
            this.dtStart.EditingControlRowIndex = 0;
            this.dtStart.EditingControlValueChanged = false;
            this.dtStart.EnableToolTip = false;
            this.dtStart.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtStart.IdText = "";
            this.dtStart.IdTextBindingKey = null;
            this.dtStart.Location = new System.Drawing.Point(5, 4);
            this.dtStart.Lookup = true;
            this.dtStart.LookupColumns = null;
            this.dtStart.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtStart.LookupResult = null;
            this.dtStart.Mandatory = false;
            this.dtStart.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtStart.MaxCharacterLength = 11;
            this.dtStart.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtStart.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtStart.MinCharactersForQuery = 0;
            this.dtStart.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtStart.MinValue = new System.DateTime(((long)(0)));
            this.dtStart.Name = "dtStart";
            this.dtStart.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtStart.PascalCase = false;
            this.dtStart.RangeInQueryMode = false;
            this.dtStart.ReadOnly = true;
            this.dtStart.RegularExpressionValidator = null;
            this.dtStart.ShowTime = false;
            this.dtStart.Size = new System.Drawing.Size(242, 55);
            this.dtStart.TabIndex = 0;
            this.dtStart.TabStop = false;
            this.dtStart.Title = "Start Date";
            this.dtStart.ToolTipLookupField = "information";
            this.dtStart.ValueText = "";
            // 
            // dtFinish
            // 
            this.dtFinish.AllowFutureDate = true;
            this.dtFinish.AllowsNew = false;
            this.dtFinish.AllowsReference = false;
            this.dtFinish.AllowsUpdate = false;
            this.dtFinish.ApplicationIdForDbConnection = null;
            this.dtFinish.BackColor = System.Drawing.Color.Transparent;
            this.dtFinish.CalledScreenApplicationId = null;
            this.dtFinish.CalledScreenTypeName = null;
            this.dtFinish.CallingScreenType = null;
            this.dtFinish.DisplayText = null;
            this.dtFinish.DisplayTextAsDateTime = null;
            this.dtFinish.DisplayTextBindingKey = "finish_dt";
            this.dtFinish.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtFinish.EditingControlDataGridView = null;
            this.dtFinish.EditingControlFormattedValue = null;
            this.dtFinish.EditingControlRowIndex = 0;
            this.dtFinish.EditingControlValueChanged = false;
            this.dtFinish.EnableToolTip = false;
            this.dtFinish.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtFinish.IdText = "";
            this.dtFinish.IdTextBindingKey = null;
            this.dtFinish.Location = new System.Drawing.Point(5, 70);
            this.dtFinish.Lookup = true;
            this.dtFinish.LookupColumns = null;
            this.dtFinish.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtFinish.LookupResult = null;
            this.dtFinish.Mandatory = false;
            this.dtFinish.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtFinish.MaxCharacterLength = 11;
            this.dtFinish.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtFinish.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtFinish.MinCharactersForQuery = 0;
            this.dtFinish.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtFinish.MinValue = new System.DateTime(((long)(0)));
            this.dtFinish.Name = "dtFinish";
            this.dtFinish.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtFinish.PascalCase = false;
            this.dtFinish.RangeInQueryMode = false;
            this.dtFinish.ReadOnly = true;
            this.dtFinish.RegularExpressionValidator = null;
            this.dtFinish.ShowTime = false;
            this.dtFinish.Size = new System.Drawing.Size(242, 55);
            this.dtFinish.TabIndex = 1;
            this.dtFinish.TabStop = false;
            this.dtFinish.Title = "Finish Date";
            this.dtFinish.ToolTipLookupField = "information";
            this.dtFinish.ValueText = "";
            // 
            // dtAttendence
            // 
            this.dtAttendence.AllowFutureDate = true;
            this.dtAttendence.AllowsNew = false;
            this.dtAttendence.AllowsReference = false;
            this.dtAttendence.AllowsUpdate = false;
            this.dtAttendence.ApplicationIdForDbConnection = null;
            this.dtAttendence.BackColor = System.Drawing.Color.Transparent;
            this.dtAttendence.CalledScreenApplicationId = null;
            this.dtAttendence.CalledScreenTypeName = null;
            this.dtAttendence.CallingScreenType = null;
            this.dtAttendence.DisplayText = null;
            this.dtAttendence.DisplayTextAsDateTime = null;
            this.dtAttendence.DisplayTextBindingKey = "attendance_dt";
            this.dtAttendence.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtAttendence.EditingControlDataGridView = null;
            this.dtAttendence.EditingControlFormattedValue = null;
            this.dtAttendence.EditingControlRowIndex = 0;
            this.dtAttendence.EditingControlValueChanged = false;
            this.dtAttendence.EnableToolTip = false;
            this.dtAttendence.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtAttendence.IdText = "";
            this.dtAttendence.IdTextBindingKey = null;
            this.dtAttendence.Location = new System.Drawing.Point(675, 74);
            this.dtAttendence.Lookup = true;
            this.dtAttendence.LookupColumns = null;
            this.dtAttendence.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtAttendence.LookupResult = null;
            this.dtAttendence.Mandatory = true;
            this.dtAttendence.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtAttendence.MaxCharacterLength = 11;
            this.dtAttendence.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtAttendence.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtAttendence.MinCharactersForQuery = 0;
            this.dtAttendence.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtAttendence.MinValue = new System.DateTime(((long)(0)));
            this.dtAttendence.Name = "dtAttendence";
            this.dtAttendence.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtAttendence.PascalCase = false;
            this.dtAttendence.RangeInQueryMode = true;
            this.dtAttendence.ReadOnly = false;
            this.dtAttendence.RegularExpressionValidator = null;
            this.dtAttendence.ShowTime = false;
            this.dtAttendence.Size = new System.Drawing.Size(295, 55);
            this.dtAttendence.TabIndex = 3;
            this.dtAttendence.Title = "Date";
            this.dtAttendence.ToolTipLookupField = "information";
            this.dtAttendence.ValueText = "";
            this.dtAttendence.FocusLost += new System.EventHandler<System.EventArgs>(this.dtAttendence_FocusLost);
            // 
            // sewaTeamsLookup1
            // 
            this.sewaTeamsLookup1.AllowsNew = false;
            this.sewaTeamsLookup1.AllowsReference = false;
            this.sewaTeamsLookup1.AllowsUpdate = false;
            this.sewaTeamsLookup1.ApplicationIdForDbConnection = null;
            this.sewaTeamsLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewaTeamsLookup1.CalledScreenApplicationId = null;
            this.sewaTeamsLookup1.CalledScreenTypeName = null;
            this.sewaTeamsLookup1.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.sewaTeamsLookup1, 2);
            this.sewaTeamsLookup1.DisplayText = "";
            this.sewaTeamsLookup1.DisplayTextBindingKey = "sewa_team_nm";
            this.sewaTeamsLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaTeamsLookup1.EditingControlDataGridView = null;
            this.sewaTeamsLookup1.EditingControlFormattedValue = null;
            this.sewaTeamsLookup1.EditingControlRowIndex = 0;
            this.sewaTeamsLookup1.EditingControlValueChanged = true;
            this.sewaTeamsLookup1.EnableToolTip = false;
            this.sewaTeamsLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaTeamsLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaTeamsLookup1.IdText = null;
            this.sewaTeamsLookup1.IdTextBindingKey = "sewa_team_id";
            this.sewaTeamsLookup1.Location = new System.Drawing.Point(5, 74);
            this.sewaTeamsLookup1.Lookup = true;
            this.sewaTeamsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Larger;
            this.sewaTeamsLookup1.LookupResult = null;
            this.sewaTeamsLookup1.Mandatory = true;
            this.sewaTeamsLookup1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.sewaTeamsLookup1.MaxCharacterLength = 32767;
            this.sewaTeamsLookup1.MaximumSize = new System.Drawing.Size(1733, 55);
            this.sewaTeamsLookup1.MinCharactersForQuery = 0;
            this.sewaTeamsLookup1.MinimumSize = new System.Drawing.Size(13, 27);
            this.sewaTeamsLookup1.Name = "sewaTeamsLookup1";
            this.sewaTeamsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaTeamsLookup1.PascalCase = false;
            this.sewaTeamsLookup1.RangeInQueryMode = false;
            this.sewaTeamsLookup1.ReadOnly = false;
            this.sewaTeamsLookup1.RegularExpressionValidator = null;
            this.sewaTeamsLookup1.Size = new System.Drawing.Size(565, 55);
            this.sewaTeamsLookup1.TabIndex = 2;
            this.sewaTeamsLookup1.Title = "Sewa Team";
            this.sewaTeamsLookup1.ToolTipLookupField = "information";
            this.sewaTeamsLookup1.ValueText = null;
            this.sewaTeamsLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaTeamsLookup1_LookupDialogShowing);
            this.sewaTeamsLookup1.FocusLost += new System.EventHandler<System.EventArgs>(this.sewaTeamsLookup1_FocusLost);
            // 
            // intSewaTeamId
            // 
            this.intSewaTeamId.AllowsNew = false;
            this.intSewaTeamId.AllowsReference = false;
            this.intSewaTeamId.AllowsUpdate = false;
            this.intSewaTeamId.ApplicationIdForDbConnection = null;
            this.intSewaTeamId.BackColor = System.Drawing.Color.Transparent;
            this.intSewaTeamId.CalledScreenApplicationId = null;
            this.intSewaTeamId.CalledScreenTypeName = null;
            this.intSewaTeamId.CallingScreenType = null;
            this.intSewaTeamId.DisplayText = "";
            this.intSewaTeamId.DisplayTextBindingKey = "sewa_team_id";
            this.intSewaTeamId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intSewaTeamId.EditingControlDataGridView = null;
            this.intSewaTeamId.EditingControlFormattedValue = "";
            this.intSewaTeamId.EditingControlRowIndex = 0;
            this.intSewaTeamId.EditingControlValueChanged = false;
            this.intSewaTeamId.EnableToolTip = false;
            this.intSewaTeamId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSewaTeamId.IdText = null;
            this.intSewaTeamId.IdTextBindingKey = null;
            this.intSewaTeamId.Location = new System.Drawing.Point(579, 73);
            this.intSewaTeamId.Lookup = false;
            this.intSewaTeamId.LookupColumns = null;
            this.intSewaTeamId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intSewaTeamId.LookupResult = null;
            this.intSewaTeamId.Mandatory = false;
            this.intSewaTeamId.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intSewaTeamId.MaxCharacterLength = 32767;
            this.intSewaTeamId.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intSewaTeamId.MaxValue = ((long)(9223372036854775807));
            this.intSewaTeamId.MinCharactersForQuery = 0;
            this.intSewaTeamId.MinimumSize = new System.Drawing.Size(10, 22);
            this.intSewaTeamId.MinValue = ((long)(-9223372036854775808));
            this.intSewaTeamId.Name = "intSewaTeamId";
            this.intSewaTeamId.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intSewaTeamId.PascalCase = false;
            this.intSewaTeamId.RangeInQueryMode = false;
            this.intSewaTeamId.ReadOnly = true;
            this.intSewaTeamId.RegularExpressionValidator = null;
            this.intSewaTeamId.Size = new System.Drawing.Size(87, 45);
            this.intSewaTeamId.TabIndex = 6;
            this.intSewaTeamId.TabStop = false;
            this.intSewaTeamId.Title = "Team ID";
            this.intSewaTeamId.ToolTipLookupField = "information";
            this.intSewaTeamId.ValueText = null;
            // 
            // grdSewaWiseDailyAttendance
            // 
            this.grdSewaWiseDailyAttendance.AllowRowSorting = false;
            this.grdSewaWiseDailyAttendance.AllowUserToAddRows = false;
            this.grdSewaWiseDailyAttendance.AutoAddNewRowForUser = false;
            this.grdSewaWiseDailyAttendance.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSewaWiseDailyAttendance.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.serial_id,
            this.centre_cd,
            this.grd_sewadar_id,
            this.sewadar_grno,
            this.grd_full_nm,
            this.Status,
            this.attendance_p,
            this.attendance_e,
            this.attendance_l,
            this.attendance_a,
            this.sewa_exemption_id,
            this.enable,
            this.old_serial_id});
            this.tlpBase.SetColumnSpan(this.grdSewaWiseDailyAttendance, 5);
            this.grdSewaWiseDailyAttendance.DeleteRowMenuEnabled = true;
            this.grdSewaWiseDailyAttendance.DeleteVisible = true;
            this.grdSewaWiseDailyAttendance.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSewaWiseDailyAttendance.ExportToExcelVisible = true;
            this.grdSewaWiseDailyAttendance.InsertAfterVisible = true;
            this.grdSewaWiseDailyAttendance.InsertBeforeVisible = true;
            this.grdSewaWiseDailyAttendance.InsertLastVisible = true;
            this.grdSewaWiseDailyAttendance.InsertRowsMenuItemsEnabled = true;
            this.grdSewaWiseDailyAttendance.Location = new System.Drawing.Point(4, 203);
            this.grdSewaWiseDailyAttendance.Mandatory = false;
            this.grdSewaWiseDailyAttendance.Margin = new System.Windows.Forms.Padding(4);
            this.grdSewaWiseDailyAttendance.MoveDownVisible = false;
            this.grdSewaWiseDailyAttendance.MoveUpVisible = false;
            this.grdSewaWiseDailyAttendance.MultiSelect = false;
            this.grdSewaWiseDailyAttendance.Name = "grdSewaWiseDailyAttendance";
            this.grdSewaWiseDailyAttendance.RowHeadersWidth = 15;
            this.grdSewaWiseDailyAttendance.RowTemplate.Height = 24;
            this.grdSewaWiseDailyAttendance.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdSewaWiseDailyAttendance.ShowCommandStrip = false;
            this.grdSewaWiseDailyAttendance.Size = new System.Drawing.Size(1235, 510);
            this.grdSewaWiseDailyAttendance.TabIndex = 4;
            this.grdSewaWiseDailyAttendance.Title = null;
            this.grdSewaWiseDailyAttendance.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdSewaWiseDailyAttendance.VirtualMode = true;
            this.grdSewaWiseDailyAttendance.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.grdSewaWiseDailyAttendance_CellBeginEdit);
            this.grdSewaWiseDailyAttendance.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdSewaWiseDailyAttendance_CellClick);
            this.grdSewaWiseDailyAttendance.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdSewaWiseDailyAttendance_CellEndEdit);
            this.grdSewaWiseDailyAttendance.RowValidating += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.grdSewaWiseDailyAttendance_RowValidating);
            // 
            // serial_id
            // 
            this.serial_id.BindingKey = "serial_id";
            this.serial_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.serial_id.DefaultCellStyle = dataGridViewCellStyle1;
            this.serial_id.HeaderText = "S. No";
            this.serial_id.Lookup = false;
            this.serial_id.LookupColumns = "";
            this.serial_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.serial_id.Mandatory = false;
            this.serial_id.MaxValue = ((long)(9223372036854775807));
            this.serial_id.MinValue = ((long)(-9223372036854775808));
            this.serial_id.Name = "serial_id";
            this.serial_id.PercentageWidth = 7;
            this.serial_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.serial_id.ToolTipLookupField = "information";
            this.serial_id.Width = 85;
            // 
            // centre_cd
            // 
            this.centre_cd.BindingKey = "centre_cd";
            this.centre_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.centre_cd.HeaderText = "Code";
            this.centre_cd.Lookup = false;
            this.centre_cd.LookupColumns = "";
            this.centre_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.centre_cd.Mandatory = false;
            this.centre_cd.MaxCharacterLength = 2147483647;
            this.centre_cd.Name = "centre_cd";
            this.centre_cd.PercentageWidth = 6;
            this.centre_cd.ReadOnly = true;
            this.centre_cd.RegularExpressionValidator = "";
            this.centre_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.centre_cd.ToolTipLookupField = "information";
            this.centre_cd.Width = 73;
            // 
            // grd_sewadar_id
            // 
            this.grd_sewadar_id.BindingKey = "sewadar_id";
            this.grd_sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.grd_sewadar_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.grd_sewadar_id.HeaderText = "ID";
            this.grd_sewadar_id.Lookup = false;
            this.grd_sewadar_id.LookupColumns = "";
            this.grd_sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.grd_sewadar_id.Mandatory = false;
            this.grd_sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.grd_sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.grd_sewadar_id.Name = "grd_sewadar_id";
            this.grd_sewadar_id.PercentageWidth = 7;
            this.grd_sewadar_id.ReadOnly = true;
            this.grd_sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.grd_sewadar_id.ToolTipLookupField = "information";
            this.grd_sewadar_id.Visible = false;
            this.grd_sewadar_id.Width = 53;
            // 
            // sewadar_grno
            // 
            this.sewadar_grno.BindingKey = "sewadar_grno";
            this.sewadar_grno.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.InactiveBorder;
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.Maroon;
            this.sewadar_grno.DefaultCellStyle = dataGridViewCellStyle3;
            this.sewadar_grno.HeaderText = "GR No";
            this.sewadar_grno.Lookup = false;
            this.sewadar_grno.LookupColumns = "";
            this.sewadar_grno.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_grno.Mandatory = false;
            this.sewadar_grno.MaxCharacterLength = 2147483647;
            this.sewadar_grno.Name = "sewadar_grno";
            this.sewadar_grno.PercentageWidth = 7;
            this.sewadar_grno.ReadOnly = true;
            this.sewadar_grno.RegularExpressionValidator = "";
            this.sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno.ToolTipLookupField = "information";
            this.sewadar_grno.Width = 85;
            // 
            // grd_full_nm
            // 
            this.grd_full_nm.BindingKey = "grd_full_nm";
            this.grd_full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.grd_full_nm.HeaderText = "Sewadar";
            this.grd_full_nm.Lookup = false;
            this.grd_full_nm.LookupColumns = "";
            this.grd_full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.grd_full_nm.Mandatory = false;
            this.grd_full_nm.MaxCharacterLength = 2147483647;
            this.grd_full_nm.Name = "grd_full_nm";
            this.grd_full_nm.PercentageWidth = 25;
            this.grd_full_nm.RegularExpressionValidator = "";
            this.grd_full_nm.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.grd_full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.grd_full_nm.ToolTipLookupField = "information";
            this.grd_full_nm.Width = 305;
            // 
            // Status
            // 
            this.Status.BindingKey = "sewadar_status_nm";
            this.Status.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.Status.HeaderText = "Status";
            this.Status.Lookup = false;
            this.Status.LookupColumns = "";
            this.Status.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Status.Mandatory = false;
            this.Status.MaxCharacterLength = 2147483647;
            this.Status.Name = "Status";
            this.Status.PercentageWidth = 11;
            this.Status.ReadOnly = true;
            this.Status.RegularExpressionValidator = "";
            this.Status.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Status.ToolTipLookupField = "information";
            this.Status.Width = 134;
            // 
            // attendance_p
            // 
            this.attendance_p.BindingKey = "is_p";
            this.attendance_p.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_p.DefaultCellStyle = dataGridViewCellStyle4;
            this.attendance_p.HeaderText = "P";
            this.attendance_p.Lookup = false;
            this.attendance_p.LookupColumns = "";
            this.attendance_p.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attendance_p.Mandatory = false;
            this.attendance_p.Name = "attendance_p";
            this.attendance_p.PercentageWidth = 4;
            this.attendance_p.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attendance_p.ToolTipLookupField = "information";
            this.attendance_p.Width = 48;
            // 
            // attendance_e
            // 
            this.attendance_e.BindingKey = "is_e";
            this.attendance_e.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_e.DefaultCellStyle = dataGridViewCellStyle5;
            this.attendance_e.HeaderText = "E";
            this.attendance_e.Lookup = false;
            this.attendance_e.LookupColumns = "";
            this.attendance_e.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attendance_e.Mandatory = false;
            this.attendance_e.Name = "attendance_e";
            this.attendance_e.PercentageWidth = 4;
            this.attendance_e.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attendance_e.ToolTipLookupField = "information";
            this.attendance_e.Width = 48;
            // 
            // attendance_l
            // 
            this.attendance_l.BindingKey = "is_l";
            this.attendance_l.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_l.DefaultCellStyle = dataGridViewCellStyle6;
            this.attendance_l.HeaderText = "L";
            this.attendance_l.Lookup = false;
            this.attendance_l.LookupColumns = "";
            this.attendance_l.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attendance_l.Mandatory = false;
            this.attendance_l.Name = "attendance_l";
            this.attendance_l.PercentageWidth = 4;
            this.attendance_l.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attendance_l.ToolTipLookupField = "information";
            this.attendance_l.Width = 48;
            // 
            // attendance_a
            // 
            this.attendance_a.BindingKey = "is_a";
            this.attendance_a.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_a.DefaultCellStyle = dataGridViewCellStyle7;
            this.attendance_a.HeaderText = "A";
            this.attendance_a.Lookup = false;
            this.attendance_a.LookupColumns = "";
            this.attendance_a.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attendance_a.Mandatory = false;
            this.attendance_a.Name = "attendance_a";
            this.attendance_a.PercentageWidth = 4;
            this.attendance_a.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attendance_a.ToolTipLookupField = "information";
            this.attendance_a.Width = 48;
            // 
            // sewa_exemption_id
            // 
            this.sewa_exemption_id.BindingKey = "sewa_exemption_id";
            this.sewa_exemption_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_exemption_id.HeaderText = "Reason";
            this.sewa_exemption_id.Lookup = true;
            this.sewa_exemption_id.LookupColumns = resources.GetString("sewa_exemption_id.LookupColumns");
            this.sewa_exemption_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_exemption_id.Mandatory = false;
            this.sewa_exemption_id.MaxCharacterLength = 2147483647;
            this.sewa_exemption_id.Name = "sewa_exemption_id";
            this.sewa_exemption_id.PercentageWidth = 27;
            this.sewa_exemption_id.RegularExpressionValidator = "";
            this.sewa_exemption_id.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.sewa_exemption_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_exemption_id.ToolTipLookupField = "information";
            this.sewa_exemption_id.Width = 329;
            // 
            // enable
            // 
            this.enable.BindingKey = "enable";
            this.enable.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.enable.DefaultCellStyle = dataGridViewCellStyle8;
            this.enable.HeaderText = "enable";
            this.enable.Lookup = false;
            this.enable.LookupColumns = "";
            this.enable.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.enable.Mandatory = false;
            this.enable.Name = "enable";
            this.enable.PercentageWidth = 25;
            this.enable.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.enable.ToolTipLookupField = "information";
            this.enable.Visible = false;
            // 
            // old_serial_id
            // 
            this.old_serial_id.BindingKey = "old_serial_id";
            this.old_serial_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.old_serial_id.DefaultCellStyle = dataGridViewCellStyle9;
            this.old_serial_id.HeaderText = "old_serial_id";
            this.old_serial_id.Lookup = false;
            this.old_serial_id.LookupColumns = "";
            this.old_serial_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_serial_id.Mandatory = false;
            this.old_serial_id.MaxValue = ((long)(9223372036854775807));
            this.old_serial_id.MinValue = ((long)(-9223372036854775808));
            this.old_serial_id.Name = "old_serial_id";
            this.old_serial_id.PercentageWidth = 25;
            this.old_serial_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_serial_id.ToolTipLookupField = "information";
            this.old_serial_id.Visible = false;
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 7;
            this.tlpBase.SetColumnSpan(this.dccTableLayoutPanel1, 3);
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 145F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 129F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 125F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 125F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 133F));
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(81, 721);
            this.dccTableLayoutPanel1.Margin = new System.Windows.Forms.Padding(4);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 1;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(1081, 15);
            this.dccTableLayoutPanel1.TabIndex = 2;
            // 
            // scListOrBrowse
            // 
            this.scListOrBrowse.Dock = System.Windows.Forms.DockStyle.Fill;
            this.scListOrBrowse.Location = new System.Drawing.Point(0, 0);
            this.scListOrBrowse.Margin = new System.Windows.Forms.Padding(4);
            this.scListOrBrowse.Name = "scListOrBrowse";
            // 
            // scListOrBrowse.Panel1
            // 
            this.scListOrBrowse.Panel1.Controls.Add(this.tlpBase);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(1243, 740);
            this.scListOrBrowse.SplitterDistance = 903;
            this.scListOrBrowse.SplitterWidth = 5;
            this.scListOrBrowse.TabIndex = 2;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.attendance_dt,
            this.satsang_centre_id,
            this.centre_nm,
            this.sewa_nm,
            this.sewa_team_id,
            this.sewa_team_nm,
            this.sewa_id,
            this.finish_dt,
            this.start_dt,
            this.txn_ts});
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
            this.grdList.RowTemplate.Height = 24;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(96, 100);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // attendance_dt
            // 
            this.attendance_dt.BindingKey = "attendance_dt";
            this.attendance_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_dt.DefaultCellStyle = dataGridViewCellStyle10;
            this.attendance_dt.HeaderText = "Attendance Date";
            this.attendance_dt.Lookup = false;
            this.attendance_dt.LookupColumns = "";
            this.attendance_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attendance_dt.Mandatory = false;
            this.attendance_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.attendance_dt.MinValue = new System.DateTime(((long)(0)));
            this.attendance_dt.Name = "attendance_dt";
            this.attendance_dt.PercentageWidth = 15;
            this.attendance_dt.ReadOnly = true;
            this.attendance_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attendance_dt.ToolTipLookupField = "information";
            this.attendance_dt.Width = 12;
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = "satsang_centre_id";
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle11;
            this.satsang_centre_id.HeaderText = "Satsang Centre Id";
            this.satsang_centre_id.Lookup = false;
            this.satsang_centre_id.LookupColumns = "";
            this.satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.satsang_centre_id.Mandatory = false;
            this.satsang_centre_id.MaxValue = ((long)(9223372036854775807));
            this.satsang_centre_id.MinValue = ((long)(-9223372036854775808));
            this.satsang_centre_id.Name = "satsang_centre_id";
            this.satsang_centre_id.PercentageWidth = 25;
            this.satsang_centre_id.ReadOnly = true;
            this.satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.satsang_centre_id.ToolTipLookupField = "information";
            this.satsang_centre_id.Visible = false;
            this.satsang_centre_id.Width = 5;
            // 
            // centre_nm
            // 
            this.centre_nm.BindingKey = "centre_nm";
            this.centre_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.centre_nm.HeaderText = "Centre Name";
            this.centre_nm.Lookup = false;
            this.centre_nm.LookupColumns = "";
            this.centre_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.centre_nm.Mandatory = false;
            this.centre_nm.MaxCharacterLength = 2147483647;
            this.centre_nm.Name = "centre_nm";
            this.centre_nm.PercentageWidth = 25;
            this.centre_nm.ReadOnly = true;
            this.centre_nm.RegularExpressionValidator = "";
            this.centre_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.centre_nm.ToolTipLookupField = "information";
            this.centre_nm.Visible = false;
            this.centre_nm.Width = 5;
            // 
            // sewa_nm
            // 
            this.sewa_nm.BindingKey = "sewa_nm";
            this.sewa_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_nm.HeaderText = "Sewa Name";
            this.sewa_nm.Lookup = false;
            this.sewa_nm.LookupColumns = "";
            this.sewa_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_nm.Mandatory = false;
            this.sewa_nm.MaxCharacterLength = 2147483647;
            this.sewa_nm.Name = "sewa_nm";
            this.sewa_nm.PercentageWidth = 30;
            this.sewa_nm.ReadOnly = true;
            this.sewa_nm.RegularExpressionValidator = "";
            this.sewa_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_nm.ToolTipLookupField = "information";
            this.sewa_nm.Width = 24;
            // 
            // sewa_team_id
            // 
            this.sewa_team_id.BindingKey = "sewa_team_id";
            this.sewa_team_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewa_team_id.DefaultCellStyle = dataGridViewCellStyle12;
            this.sewa_team_id.HeaderText = "Team Id";
            this.sewa_team_id.Lookup = false;
            this.sewa_team_id.LookupColumns = "";
            this.sewa_team_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_team_id.Mandatory = false;
            this.sewa_team_id.MaxValue = ((long)(9223372036854775807));
            this.sewa_team_id.MinValue = ((long)(-9223372036854775808));
            this.sewa_team_id.Name = "sewa_team_id";
            this.sewa_team_id.PercentageWidth = 10;
            this.sewa_team_id.ReadOnly = true;
            this.sewa_team_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_team_id.ToolTipLookupField = "information";
            this.sewa_team_id.Width = 8;
            // 
            // sewa_team_nm
            // 
            this.sewa_team_nm.BindingKey = "sewa_team_nm";
            this.sewa_team_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_team_nm.HeaderText = "Sewa Team Name";
            this.sewa_team_nm.Lookup = false;
            this.sewa_team_nm.LookupColumns = "";
            this.sewa_team_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_team_nm.Mandatory = false;
            this.sewa_team_nm.MaxCharacterLength = 2147483647;
            this.sewa_team_nm.Name = "sewa_team_nm";
            this.sewa_team_nm.PercentageWidth = 49;
            this.sewa_team_nm.ReadOnly = true;
            this.sewa_team_nm.RegularExpressionValidator = "";
            this.sewa_team_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_team_nm.ToolTipLookupField = "information";
            this.sewa_team_nm.Width = 39;
            // 
            // sewa_id
            // 
            this.sewa_id.BindingKey = "sewa_id";
            this.sewa_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle13.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewa_id.DefaultCellStyle = dataGridViewCellStyle13;
            this.sewa_id.HeaderText = "Sewa Id";
            this.sewa_id.Lookup = false;
            this.sewa_id.LookupColumns = "";
            this.sewa_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_id.Mandatory = false;
            this.sewa_id.MaxValue = ((long)(9223372036854775807));
            this.sewa_id.MinValue = ((long)(-9223372036854775808));
            this.sewa_id.Name = "sewa_id";
            this.sewa_id.PercentageWidth = 25;
            this.sewa_id.ReadOnly = true;
            this.sewa_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_id.ToolTipLookupField = "information";
            this.sewa_id.Visible = false;
            this.sewa_id.Width = 5;
            // 
            // finish_dt
            // 
            this.finish_dt.BindingKey = "finish_dt";
            this.finish_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle14.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.finish_dt.DefaultCellStyle = dataGridViewCellStyle14;
            this.finish_dt.HeaderText = "finish_dt";
            this.finish_dt.Lookup = false;
            this.finish_dt.LookupColumns = "";
            this.finish_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.finish_dt.Mandatory = false;
            this.finish_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.finish_dt.MinValue = new System.DateTime(((long)(0)));
            this.finish_dt.Name = "finish_dt";
            this.finish_dt.PercentageWidth = 25;
            this.finish_dt.ReadOnly = true;
            this.finish_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.finish_dt.ToolTipLookupField = "information";
            this.finish_dt.Visible = false;
            // 
            // start_dt
            // 
            this.start_dt.BindingKey = "start_dt";
            this.start_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle15.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.start_dt.DefaultCellStyle = dataGridViewCellStyle15;
            this.start_dt.HeaderText = "start_dt";
            this.start_dt.Lookup = false;
            this.start_dt.LookupColumns = "";
            this.start_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.start_dt.Mandatory = false;
            this.start_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.start_dt.MinValue = new System.DateTime(((long)(0)));
            this.start_dt.Name = "start_dt";
            this.start_dt.PercentageWidth = 25;
            this.start_dt.ReadOnly = true;
            this.start_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.start_dt.ToolTipLookupField = "information";
            this.start_dt.Visible = false;
            // 
            // txn_ts
            // 
            this.txn_ts.BindingKey = "txn_ts";
            this.txn_ts.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Object;
            this.txn_ts.HeaderText = "Txn Ts";
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
            // SewaTeamAttendence
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1243, 740);
            this.Controls.Add(this.scListOrBrowse);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "SewaTeamAttendence";
            this.Text = "SewaTeamAttendence";
            this.tlpBase.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            this.tblButton.ResumeLayout(false);
            this.tblButton.PerformLayout();
            this.tblPeriod.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSewaWiseDailyAttendance)).EndInit();
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup sewaLookup1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup sewaTeamsLookup1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtAttendence;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSewaWiseDailyAttendance;
        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tblButton;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkPresentAll;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkAtendeanceAll;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentre;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tblPeriod;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtStart;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtFinish;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField intSewaTeamId;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn attendance_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn centre_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewa_team_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_team_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewa_id;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn finish_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn start_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn serial_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn centre_cd;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn grd_sewadar_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn grd_full_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn Status;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn attendance_p;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn attendance_e;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn attendance_l;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn attendance_a;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_exemption_id;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn enable;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn old_serial_id;
    }
}
