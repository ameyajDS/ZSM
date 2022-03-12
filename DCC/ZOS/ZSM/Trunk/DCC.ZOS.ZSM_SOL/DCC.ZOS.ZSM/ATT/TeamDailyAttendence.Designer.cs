namespace DCC.ZOS.ZSM.ATT
{
    partial class TeamDailyAttendence
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(TeamDailyAttendence));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle13 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle14 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle15 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle16 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle17 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtSatsangCentreNm = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.sewaLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.dccTableLayoutPanel2 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dtStart = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtFinish = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.sewaTeamsLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup();
            this.tlpSewaSamiti = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewadarHeader1 = new DCC.ZOS.ZSM.Controls.Misc.SewadarHeader();
            this.tblButton = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.chkPresentAll = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkAtendeanceAll = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.grdTeamWiseDailyAttendance = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.attendance_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.sewa_team_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.attendance_p = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.sewa_team_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.attendance_e = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.attendance_l = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.attendance_a = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.sewa_exemption_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_exemption_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_attendance_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.serial_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.old_serial_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.v_serial_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.v_sewa_team_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewa_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.enable = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.start_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.finish_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.v_sewa_team_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpBase.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.dccTableLayoutPanel2.SuspendLayout();
            this.tlpSewaSamiti.SuspendLayout();
            this.tblButton.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdTeamWiseDailyAttendance)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.SuspendLayout();
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
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 3;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 29.39914F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.47639F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 37.07317F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 27F));
            this.tlpBase.Controls.Add(this.tlpTop, 0, 1);
            this.tlpBase.Controls.Add(this.grdTeamWiseDailyAttendance, 0, 2);
            this.tlpBase.Controls.Add(this.dccTableLayoutPanel1, 0, 3);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Margin = new System.Windows.Forms.Padding(4);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 4;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 2F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 35F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 60F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 3F));
            this.tlpBase.Size = new System.Drawing.Size(1243, 740);
            this.tlpBase.TabIndex = 0;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 5;
            this.tlpBase.SetColumnSpan(this.tlpTop, 3);
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 11.22302F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 2.699784F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 28.18575F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 24.946F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.26134F));
            this.tlpTop.Controls.Add(this.txtSatsangCentreNm, 0, 0);
            this.tlpTop.Controls.Add(this.sewaLookup1, 2, 0);
            this.tlpTop.Controls.Add(this.dccTableLayoutPanel2, 3, 0);
            this.tlpTop.Controls.Add(this.sewaTeamsLookup1, 4, 0);
            this.tlpTop.Controls.Add(this.tlpSewaSamiti, 0, 1);
            this.tlpTop.Controls.Add(this.tblButton, 3, 2);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(4, 18);
            this.tlpTop.Margin = new System.Windows.Forms.Padding(4);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 3;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 30F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 55F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpTop.Size = new System.Drawing.Size(1235, 251);
            this.tlpTop.TabIndex = 0;
            // 
            // txtSatsangCentreNm
            // 
            this.txtSatsangCentreNm.AllowsNew = false;
            this.txtSatsangCentreNm.AllowsReference = false;
            this.txtSatsangCentreNm.AllowsUpdate = false;
            this.txtSatsangCentreNm.ApplicationIdForDbConnection = null;
            this.txtSatsangCentreNm.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangCentreNm.CalledScreenApplicationId = null;
            this.txtSatsangCentreNm.CalledScreenTypeName = null;
            this.txtSatsangCentreNm.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.txtSatsangCentreNm, 2);
            this.txtSatsangCentreNm.DisplayText = "";
            this.txtSatsangCentreNm.DisplayTextBindingKey = "centre_nm";
            this.txtSatsangCentreNm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentreNm.EditingControlDataGridView = null;
            this.txtSatsangCentreNm.EditingControlFormattedValue = "";
            this.txtSatsangCentreNm.EditingControlRowIndex = 0;
            this.txtSatsangCentreNm.EditingControlValueChanged = false;
            this.txtSatsangCentreNm.EnableToolTip = false;
            this.txtSatsangCentreNm.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentreNm.IdText = null;
            this.txtSatsangCentreNm.IdTextBindingKey = null;
            this.txtSatsangCentreNm.Location = new System.Drawing.Point(5, 4);
            this.txtSatsangCentreNm.Lookup = false;
            this.txtSatsangCentreNm.LookupColumns = null;
            this.txtSatsangCentreNm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentreNm.LookupResult = null;
            this.txtSatsangCentreNm.Mandatory = false;
            this.txtSatsangCentreNm.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSatsangCentreNm.MaxCharacterLength = 32767;
            this.txtSatsangCentreNm.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSatsangCentreNm.MinCharactersForQuery = 0;
            this.txtSatsangCentreNm.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSatsangCentreNm.Name = "txtSatsangCentreNm";
            this.txtSatsangCentreNm.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCentreNm.PascalCase = false;
            this.txtSatsangCentreNm.RangeInQueryMode = false;
            this.txtSatsangCentreNm.ReadOnly = true;
            this.txtSatsangCentreNm.RegularExpressionValidator = null;
            this.txtSatsangCentreNm.Size = new System.Drawing.Size(161, 55);
            this.txtSatsangCentreNm.TabIndex = 87;
            this.txtSatsangCentreNm.TabStop = false;
            this.txtSatsangCentreNm.Title = "Satsang Centre";
            this.txtSatsangCentreNm.ToolTipLookupField = "information";
            this.txtSatsangCentreNm.ValueText = null;
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
            this.sewaLookup1.Location = new System.Drawing.Point(176, 4);
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
            this.sewaLookup1.Size = new System.Drawing.Size(336, 55);
            this.sewaLookup1.TabIndex = 0;
            this.sewaLookup1.Title = "Sewa";
            this.sewaLookup1.ToolTipLookupField = "information";
            this.sewaLookup1.ValueText = null;
            this.sewaLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookup1_LookupDialogShowing);
            this.sewaLookup1.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.sewaLookup1_LookupResultSet);
            // 
            // dccTableLayoutPanel2
            // 
            this.dccTableLayoutPanel2.ColumnCount = 2;
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 49.78541F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.21459F));
            this.dccTableLayoutPanel2.Controls.Add(this.dtStart, 0, 0);
            this.dccTableLayoutPanel2.Controls.Add(this.dtFinish, 1, 0);
            this.dccTableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel2.Location = new System.Drawing.Point(521, 4);
            this.dccTableLayoutPanel2.Margin = new System.Windows.Forms.Padding(4);
            this.dccTableLayoutPanel2.Name = "dccTableLayoutPanel2";
            this.dccTableLayoutPanel2.RowCount = 1;
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel2.Size = new System.Drawing.Size(299, 67);
            this.dccTableLayoutPanel2.TabIndex = 88;
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
            this.dtStart.Size = new System.Drawing.Size(138, 55);
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
            this.dtFinish.Location = new System.Drawing.Point(153, 4);
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
            this.dtFinish.Size = new System.Drawing.Size(141, 55);
            this.dtFinish.TabIndex = 1;
            this.dtFinish.TabStop = false;
            this.dtFinish.Title = "End Date";
            this.dtFinish.ToolTipLookupField = "information";
            this.dtFinish.ValueText = "";
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
            this.sewaTeamsLookup1.DisplayText = "";
            this.sewaTeamsLookup1.DisplayTextBindingKey = "v_sewa_team_nm";
            this.sewaTeamsLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaTeamsLookup1.EditingControlDataGridView = null;
            this.sewaTeamsLookup1.EditingControlFormattedValue = null;
            this.sewaTeamsLookup1.EditingControlRowIndex = 0;
            this.sewaTeamsLookup1.EditingControlValueChanged = true;
            this.sewaTeamsLookup1.EnableToolTip = false;
            this.sewaTeamsLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaTeamsLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaTeamsLookup1.IdText = null;
            this.sewaTeamsLookup1.IdTextBindingKey = "v_sewa_team_id";
            this.sewaTeamsLookup1.Location = new System.Drawing.Point(829, 4);
            this.sewaTeamsLookup1.Lookup = true;
            this.sewaTeamsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewaTeamsLookup1.LookupResult = null;
            this.sewaTeamsLookup1.Mandatory = false;
            this.sewaTeamsLookup1.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.sewaTeamsLookup1.MaxCharacterLength = 32767;
            this.sewaTeamsLookup1.MaximumSize = new System.Drawing.Size(1733, 55);
            this.sewaTeamsLookup1.MinCharactersForQuery = 0;
            this.sewaTeamsLookup1.MinimumSize = new System.Drawing.Size(13, 27);
            this.sewaTeamsLookup1.Name = "sewaTeamsLookup1";
            this.sewaTeamsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaTeamsLookup1.PascalCase = false;
            this.sewaTeamsLookup1.RangeInQueryMode = false;
            this.sewaTeamsLookup1.ReadOnly = true;
            this.sewaTeamsLookup1.RegularExpressionValidator = null;
            this.sewaTeamsLookup1.Size = new System.Drawing.Size(401, 55);
            this.sewaTeamsLookup1.TabIndex = 89;
            this.sewaTeamsLookup1.TabStop = false;
            this.sewaTeamsLookup1.Title = "Sewa Team";
            this.sewaTeamsLookup1.ToolTipLookupField = "information";
            this.sewaTeamsLookup1.ValueText = null;
            this.sewaTeamsLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaTeamsLookup1_LookupDialogShowing);
            // 
            // tlpSewaSamiti
            // 
            this.tlpSewaSamiti.ColumnCount = 5;
            this.tlpTop.SetColumnSpan(this.tlpSewaSamiti, 9);
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 8.60077F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 1.026958F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 35.94352F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23.7484F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30.49645F));
            this.tlpSewaSamiti.Controls.Add(this.sewadarHeader1, 0, 0);
            this.tlpSewaSamiti.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpSewaSamiti.Location = new System.Drawing.Point(4, 79);
            this.tlpSewaSamiti.Margin = new System.Windows.Forms.Padding(4);
            this.tlpSewaSamiti.Name = "tlpSewaSamiti";
            this.tlpSewaSamiti.RowCount = 1;
            this.tlpSewaSamiti.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpSewaSamiti.Size = new System.Drawing.Size(1227, 130);
            this.tlpSewaSamiti.TabIndex = 1;
            this.tlpSewaSamiti.TabStop = true;
            // 
            // sewadarHeader1
            // 
            this.tlpSewaSamiti.SetColumnSpan(this.sewadarHeader1, 5);
            this.sewadarHeader1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarHeader1.Location = new System.Drawing.Point(4, 4);
            this.sewadarHeader1.Margin = new System.Windows.Forms.Padding(4);
            this.sewadarHeader1.Name = "sewadarHeader1";
            this.sewadarHeader1.SatsangCentreId = 6015;
            this.sewadarHeader1.Size = new System.Drawing.Size(1219, 122);
            this.sewadarHeader1.SttsCode = null;
            this.sewadarHeader1.TabIndex = 0;
            this.sewadarHeader1.UseFocusLostEvent = false;
            this.sewadarHeader1.SewadarSelectionChanged += new System.EventHandler<DCC.ZOS.ZSM.Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs>(this.sewadarHeader1_SewadarSelectionChanged);
            this.sewadarHeader1.SewadarLookupDailogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewadarHeader1_SewadarLookupDailogShowing);
            // 
            // tblButton
            // 
            this.tblButton.ColumnCount = 4;
            this.tlpTop.SetColumnSpan(this.tblButton, 2);
            this.tblButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23.26454F));
            this.tblButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 19.88743F));
            this.tblButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 31.5197F));
            this.tblButton.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblButton.Controls.Add(this.chkPresentAll, 1, 0);
            this.tblButton.Controls.Add(this.chkAtendeanceAll, 2, 0);
            this.tblButton.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblButton.Location = new System.Drawing.Point(521, 217);
            this.tblButton.Margin = new System.Windows.Forms.Padding(4);
            this.tblButton.Name = "tblButton";
            this.tblButton.RowCount = 1;
            this.tblButton.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tblButton.Size = new System.Drawing.Size(710, 30);
            this.tblButton.TabIndex = 2;
            this.tblButton.TabStop = true;
            // 
            // chkPresentAll
            // 
            this.chkPresentAll.AutoSize = true;
            this.chkPresentAll.BackColor = System.Drawing.Color.Transparent;
            this.chkPresentAll.BindingKey = null;
            this.chkPresentAll.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkPresentAll.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkPresentAll.Location = new System.Drawing.Point(169, 4);
            this.chkPresentAll.Margin = new System.Windows.Forms.Padding(4);
            this.chkPresentAll.Name = "chkPresentAll";
            this.chkPresentAll.Size = new System.Drawing.Size(133, 22);
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
            this.chkAtendeanceAll.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkAtendeanceAll.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkAtendeanceAll.Location = new System.Drawing.Point(310, 4);
            this.chkAtendeanceAll.Margin = new System.Windows.Forms.Padding(4);
            this.chkAtendeanceAll.Name = "chkAtendeanceAll";
            this.chkAtendeanceAll.Size = new System.Drawing.Size(216, 22);
            this.chkAtendeanceAll.TabIndex = 1;
            this.chkAtendeanceAll.Text = "Mark A";
            this.chkAtendeanceAll.UseVisualStyleBackColor = true;
            this.chkAtendeanceAll.CheckStateChanged += new System.EventHandler(this.chkAtendeanceAll_CheckStateChanged);
            // 
            // grdTeamWiseDailyAttendance
            // 
            this.grdTeamWiseDailyAttendance.AllowRowSorting = false;
            this.grdTeamWiseDailyAttendance.AllowUserToAddRows = false;
            this.grdTeamWiseDailyAttendance.AutoAddNewRowForUser = false;
            this.grdTeamWiseDailyAttendance.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdTeamWiseDailyAttendance.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.attendance_dt,
            this.sewa_team_nm,
            this.attendance_p,
            this.sewa_team_id,
            this.attendance_e,
            this.attendance_l,
            this.attendance_a,
            this.sewa_exemption_id,
            this.sewa_exemption_nm,
            this.old_attendance_dt,
            this.serial_id,
            this.old_serial_id});
            this.tlpBase.SetColumnSpan(this.grdTeamWiseDailyAttendance, 3);
            this.grdTeamWiseDailyAttendance.DeleteRowMenuEnabled = true;
            this.grdTeamWiseDailyAttendance.DeleteVisible = true;
            this.grdTeamWiseDailyAttendance.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdTeamWiseDailyAttendance.ExportToExcelVisible = true;
            this.grdTeamWiseDailyAttendance.InsertAfterVisible = true;
            this.grdTeamWiseDailyAttendance.InsertBeforeVisible = true;
            this.grdTeamWiseDailyAttendance.InsertLastVisible = true;
            this.grdTeamWiseDailyAttendance.InsertRowsMenuItemsEnabled = true;
            this.grdTeamWiseDailyAttendance.Location = new System.Drawing.Point(4, 277);
            this.grdTeamWiseDailyAttendance.Mandatory = false;
            this.grdTeamWiseDailyAttendance.Margin = new System.Windows.Forms.Padding(4);
            this.grdTeamWiseDailyAttendance.MoveDownVisible = false;
            this.grdTeamWiseDailyAttendance.MoveUpVisible = false;
            this.grdTeamWiseDailyAttendance.MultiSelect = false;
            this.grdTeamWiseDailyAttendance.Name = "grdTeamWiseDailyAttendance";
            this.grdTeamWiseDailyAttendance.RowHeadersWidth = 15;
            this.grdTeamWiseDailyAttendance.RowTemplate.Height = 24;
            this.grdTeamWiseDailyAttendance.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdTeamWiseDailyAttendance.ShowCommandStrip = false;
            this.grdTeamWiseDailyAttendance.Size = new System.Drawing.Size(1235, 436);
            this.grdTeamWiseDailyAttendance.TabIndex = 3;
            this.grdTeamWiseDailyAttendance.Title = null;
            this.grdTeamWiseDailyAttendance.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdTeamWiseDailyAttendance.VirtualMode = true;
            this.grdTeamWiseDailyAttendance.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.grdTeamWiseDailyAttendance_CellBeginEdit);
            this.grdTeamWiseDailyAttendance.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdTeamWiseDailyAttendance_CellClick);
            this.grdTeamWiseDailyAttendance.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdTeamWiseDailyAttendance_CellEndEdit);
            this.grdTeamWiseDailyAttendance.CurrentCellChanged += new System.EventHandler(this.grdTeamWiseDailyAttendance_CurrentCellChanged);
            this.grdTeamWiseDailyAttendance.RowValidating += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.grdTeamWiseDailyAttendance_RowValidating);
            // 
            // attendance_dt
            // 
            this.attendance_dt.BindingKey = "attendance_dt";
            this.attendance_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_dt.DefaultCellStyle = dataGridViewCellStyle1;
            this.attendance_dt.HeaderText = "Attend. Date";
            this.attendance_dt.Lookup = false;
            this.attendance_dt.LookupColumns = "";
            this.attendance_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attendance_dt.Mandatory = false;
            this.attendance_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.attendance_dt.MinValue = new System.DateTime(((long)(0)));
            this.attendance_dt.Name = "attendance_dt";
            this.attendance_dt.PercentageWidth = 12;
            this.attendance_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attendance_dt.ToolTipLookupField = "information";
            this.attendance_dt.Width = 146;
            // 
            // sewa_team_nm
            // 
            this.sewa_team_nm.BindingKey = "sewa_team_nm";
            this.sewa_team_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_team_nm.HeaderText = "Team";
            this.sewa_team_nm.Lookup = false;
            this.sewa_team_nm.LookupColumns = "";
            this.sewa_team_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_team_nm.Mandatory = false;
            this.sewa_team_nm.MaxCharacterLength = 2147483647;
            this.sewa_team_nm.Name = "sewa_team_nm";
            this.sewa_team_nm.PercentageWidth = 42;
            this.sewa_team_nm.RegularExpressionValidator = "";
            this.sewa_team_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_team_nm.ToolTipLookupField = "information";
            this.sewa_team_nm.Width = 512;
            // 
            // attendance_p
            // 
            this.attendance_p.BindingKey = "is_p";
            this.attendance_p.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_p.DefaultCellStyle = dataGridViewCellStyle2;
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
            // sewa_team_id
            // 
            this.sewa_team_id.BindingKey = "sewa_team_id";
            this.sewa_team_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewa_team_id.DefaultCellStyle = dataGridViewCellStyle3;
            this.sewa_team_id.HeaderText = "sewa_team_id";
            this.sewa_team_id.Lookup = false;
            this.sewa_team_id.LookupColumns = "";
            this.sewa_team_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_team_id.Mandatory = false;
            this.sewa_team_id.MaxValue = ((long)(9223372036854775807));
            this.sewa_team_id.MinValue = ((long)(-9223372036854775808));
            this.sewa_team_id.Name = "sewa_team_id";
            this.sewa_team_id.PercentageWidth = 25;
            this.sewa_team_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_team_id.ToolTipLookupField = "information";
            this.sewa_team_id.Visible = false;
            // 
            // attendance_e
            // 
            this.attendance_e.BindingKey = "is_e";
            this.attendance_e.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_e.DefaultCellStyle = dataGridViewCellStyle4;
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
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_l.DefaultCellStyle = dataGridViewCellStyle5;
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
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_a.DefaultCellStyle = dataGridViewCellStyle6;
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
            this.sewa_exemption_id.PercentageWidth = 30;
            this.sewa_exemption_id.RegularExpressionValidator = "";
            this.sewa_exemption_id.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.sewa_exemption_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_exemption_id.ToolTipLookupField = "information";
            this.sewa_exemption_id.Width = 366;
            // 
            // sewa_exemption_nm
            // 
            this.sewa_exemption_nm.BindingKey = null;
            this.sewa_exemption_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_exemption_nm.HeaderText = "sewa_exemption_nm";
            this.sewa_exemption_nm.Lookup = false;
            this.sewa_exemption_nm.LookupColumns = "";
            this.sewa_exemption_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_exemption_nm.Mandatory = false;
            this.sewa_exemption_nm.MaxCharacterLength = 2147483647;
            this.sewa_exemption_nm.Name = "sewa_exemption_nm";
            this.sewa_exemption_nm.PercentageWidth = 25;
            this.sewa_exemption_nm.RegularExpressionValidator = "";
            this.sewa_exemption_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_exemption_nm.ToolTipLookupField = "information";
            this.sewa_exemption_nm.Visible = false;
            // 
            // old_attendance_dt
            // 
            this.old_attendance_dt.BindingKey = "old_attendance_dt";
            this.old_attendance_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.old_attendance_dt.DefaultCellStyle = dataGridViewCellStyle7;
            this.old_attendance_dt.HeaderText = "old_attendance_dt";
            this.old_attendance_dt.Lookup = false;
            this.old_attendance_dt.LookupColumns = "";
            this.old_attendance_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_attendance_dt.Mandatory = false;
            this.old_attendance_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.old_attendance_dt.MinValue = new System.DateTime(((long)(0)));
            this.old_attendance_dt.Name = "old_attendance_dt";
            this.old_attendance_dt.PercentageWidth = 25;
            this.old_attendance_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_attendance_dt.ToolTipLookupField = "information";
            this.old_attendance_dt.Visible = false;
            // 
            // serial_id
            // 
            this.serial_id.BindingKey = "serial_id";
            this.serial_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.serial_id.DefaultCellStyle = dataGridViewCellStyle8;
            this.serial_id.HeaderText = "serial_id";
            this.serial_id.Lookup = false;
            this.serial_id.LookupColumns = "";
            this.serial_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.serial_id.Mandatory = false;
            this.serial_id.MaxValue = ((long)(9223372036854775807));
            this.serial_id.MinValue = ((long)(-9223372036854775808));
            this.serial_id.Name = "serial_id";
            this.serial_id.PercentageWidth = 25;
            this.serial_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.serial_id.ToolTipLookupField = "information";
            this.serial_id.Visible = false;
            this.serial_id.Width = 199;
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
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(4, 721);
            this.dccTableLayoutPanel1.Margin = new System.Windows.Forms.Padding(4);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 1;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(1235, 15);
            this.dccTableLayoutPanel1.TabIndex = 2;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.v_serial_id,
            this.v_sewa_team_nm,
            this.satsang_centre_id,
            this.sewa_id,
            this.sewadar_id,
            this.sewadar_grno,
            this.full_nm,
            this.centre_nm,
            this.sewa_nm,
            this.txn_ts,
            this.enable,
            this.start_dt,
            this.finish_dt,
            this.v_sewa_team_id});
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
            this.grdList.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(96, 100);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // v_serial_id
            // 
            this.v_serial_id.BindingKey = "serial_id";
            this.v_serial_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.v_serial_id.DefaultCellStyle = dataGridViewCellStyle10;
            this.v_serial_id.HeaderText = "SR ID";
            this.v_serial_id.Lookup = false;
            this.v_serial_id.LookupColumns = "";
            this.v_serial_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.v_serial_id.Mandatory = false;
            this.v_serial_id.MaxValue = ((long)(9223372036854775807));
            this.v_serial_id.MinValue = ((long)(-9223372036854775808));
            this.v_serial_id.Name = "v_serial_id";
            this.v_serial_id.PercentageWidth = 5;
            this.v_serial_id.ReadOnly = true;
            this.v_serial_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.v_serial_id.ToolTipLookupField = "information";
            this.v_serial_id.Width = 5;
            // 
            // v_sewa_team_nm
            // 
            this.v_sewa_team_nm.BindingKey = "sewa_team_nm";
            this.v_sewa_team_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.v_sewa_team_nm.HeaderText = "Sewa Team";
            this.v_sewa_team_nm.Lookup = false;
            this.v_sewa_team_nm.LookupColumns = "";
            this.v_sewa_team_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.v_sewa_team_nm.Mandatory = false;
            this.v_sewa_team_nm.MaxCharacterLength = 2147483647;
            this.v_sewa_team_nm.Name = "v_sewa_team_nm";
            this.v_sewa_team_nm.PercentageWidth = 35;
            this.v_sewa_team_nm.ReadOnly = true;
            this.v_sewa_team_nm.RegularExpressionValidator = "";
            this.v_sewa_team_nm.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.v_sewa_team_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.v_sewa_team_nm.ToolTipLookupField = "information";
            this.v_sewa_team_nm.Width = 28;
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
            this.satsang_centre_id.Width = 20;
            // 
            // sewa_id
            // 
            this.sewa_id.BindingKey = "sewa_id";
            this.sewa_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewa_id.DefaultCellStyle = dataGridViewCellStyle12;
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
            this.sewa_id.Width = 20;
            // 
            // sewadar_id
            // 
            this.sewadar_id.BindingKey = "sewadar_id";
            this.sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle13.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewadar_id.DefaultCellStyle = dataGridViewCellStyle13;
            this.sewadar_id.HeaderText = "SWD ID";
            this.sewadar_id.Lookup = false;
            this.sewadar_id.LookupColumns = "";
            this.sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_id.Mandatory = false;
            this.sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.sewadar_id.Name = "sewadar_id";
            this.sewadar_id.PercentageWidth = 5;
            this.sewadar_id.ReadOnly = true;
            this.sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_id.ToolTipLookupField = "information";
            this.sewadar_id.Width = 5;
            // 
            // sewadar_grno
            // 
            this.sewadar_grno.BindingKey = "sewadar_grno";
            this.sewadar_grno.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_grno.HeaderText = "GR No.";
            this.sewadar_grno.Lookup = false;
            this.sewadar_grno.LookupColumns = "";
            this.sewadar_grno.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_grno.Mandatory = false;
            this.sewadar_grno.MaxCharacterLength = 2147483647;
            this.sewadar_grno.Name = "sewadar_grno";
            this.sewadar_grno.PercentageWidth = 8;
            this.sewadar_grno.ReadOnly = true;
            this.sewadar_grno.RegularExpressionValidator = "";
            this.sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno.ToolTipLookupField = "information";
            this.sewadar_grno.Width = 6;
            // 
            // full_nm
            // 
            this.full_nm.BindingKey = "full_nm";
            this.full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.full_nm.HeaderText = "Full Name";
            this.full_nm.Lookup = false;
            this.full_nm.LookupColumns = "";
            this.full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.full_nm.Mandatory = false;
            this.full_nm.MaxCharacterLength = 2147483647;
            this.full_nm.Name = "full_nm";
            this.full_nm.PercentageWidth = 22;
            this.full_nm.ReadOnly = true;
            this.full_nm.RegularExpressionValidator = "";
            this.full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.full_nm.ToolTipLookupField = "information";
            this.full_nm.Width = 17;
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
            this.centre_nm.Width = 20;
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
            this.sewa_nm.PercentageWidth = 23;
            this.sewa_nm.ReadOnly = true;
            this.sewa_nm.RegularExpressionValidator = "";
            this.sewa_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_nm.ToolTipLookupField = "information";
            this.sewa_nm.Width = 18;
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
            // 
            // enable
            // 
            this.enable.BindingKey = "enable";
            this.enable.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle14.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.enable.DefaultCellStyle = dataGridViewCellStyle14;
            this.enable.HeaderText = "enable";
            this.enable.Lookup = false;
            this.enable.LookupColumns = "";
            this.enable.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.enable.Mandatory = false;
            this.enable.Name = "enable";
            this.enable.PercentageWidth = 25;
            this.enable.ReadOnly = true;
            this.enable.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.enable.ToolTipLookupField = "information";
            this.enable.Visible = false;
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
            // finish_dt
            // 
            this.finish_dt.BindingKey = "finish_dt";
            this.finish_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle16.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.finish_dt.DefaultCellStyle = dataGridViewCellStyle16;
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
            // v_sewa_team_id
            // 
            this.v_sewa_team_id.BindingKey = "sewa_team_id";
            this.v_sewa_team_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle17.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.v_sewa_team_id.DefaultCellStyle = dataGridViewCellStyle17;
            this.v_sewa_team_id.HeaderText = "v_sewa_team_id";
            this.v_sewa_team_id.Lookup = false;
            this.v_sewa_team_id.LookupColumns = "";
            this.v_sewa_team_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.v_sewa_team_id.Mandatory = false;
            this.v_sewa_team_id.MaxValue = ((long)(9223372036854775807));
            this.v_sewa_team_id.MinValue = ((long)(-9223372036854775808));
            this.v_sewa_team_id.Name = "v_sewa_team_id";
            this.v_sewa_team_id.PercentageWidth = 25;
            this.v_sewa_team_id.ReadOnly = true;
            this.v_sewa_team_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.v_sewa_team_id.ToolTipLookupField = "information";
            this.v_sewa_team_id.Visible = false;
            // 
            // TeamDailyAttendence
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1243, 740);
            this.Controls.Add(this.scListOrBrowse);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "TeamDailyAttendence";
            this.Text = "SewaTeamAttendence";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpBase.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            this.dccTableLayoutPanel2.ResumeLayout(false);
            this.tlpSewaSamiti.ResumeLayout(false);
            this.tblButton.ResumeLayout(false);
            this.tblButton.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdTeamWiseDailyAttendance)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup sewaLookup1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdTeamWiseDailyAttendance;
        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tblButton;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkPresentAll;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkAtendeanceAll;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpSewaSamiti;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentreNm;
        private DCC.ZOS.ZSM.Controls.Misc.SewadarHeader sewadarHeader1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel2;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtStart;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtFinish;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup sewaTeamsLookup1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn attendance_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_team_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn attendance_p;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewa_team_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn attendance_e;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn attendance_l;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn attendance_a;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_exemption_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_exemption_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn old_attendance_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn serial_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn old_serial_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn v_serial_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn v_sewa_team_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewa_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewadar_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn full_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn centre_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn enable;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn start_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn finish_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn v_sewa_team_id;

    }
}