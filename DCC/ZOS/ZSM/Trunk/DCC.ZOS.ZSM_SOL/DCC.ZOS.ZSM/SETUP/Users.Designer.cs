namespace DCC.ZOS.ZSM.SETUP
{
    partial class Users
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.chkIs_locked = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.intUser_no = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtUser_id = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtUser_nm = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intSewadar_id = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.dtmActivation_dt = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtmDeactivation_dt = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.chkIs_open_sewadar = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.txtEmail_id = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.password = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dccGrid1 = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.application_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.user_role_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.user_no = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.txtPassword = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txtApplication_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txtUser_role_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.user_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.user_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.activation_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.deactivation_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.is_open_sewadar = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.is_locked = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.email_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.application_id1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            ((System.ComponentModel.ISupportInitialize)(this.scListOrBrowse)).BeginInit();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.SuspendLayout();
            // 
            // scListOrBrowse
            // 
            this.scListOrBrowse.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.scListOrBrowse.Location = new System.Drawing.Point(0, 0);
            this.scListOrBrowse.Name = "scListOrBrowse";
            // 
            // scListOrBrowse.Panel1
            // 
            this.scListOrBrowse.Panel1.Controls.Add(this.tableLayoutPanel2);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(867, 539);
            this.scListOrBrowse.SplitterDistance = 548;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 3;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 40.55944F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 59.44056F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 466F));
            this.tableLayoutPanel2.Controls.Add(this.chkIs_locked, 1, 2);
            this.tableLayoutPanel2.Controls.Add(this.intUser_no, 0, 0);
            this.tableLayoutPanel2.Controls.Add(this.txtUser_id, 1, 0);
            this.tableLayoutPanel2.Controls.Add(this.txtUser_nm, 2, 0);
            this.tableLayoutPanel2.Controls.Add(this.intSewadar_id, 0, 1);
            this.tableLayoutPanel2.Controls.Add(this.dtmActivation_dt, 1, 1);
            this.tableLayoutPanel2.Controls.Add(this.dtmDeactivation_dt, 2, 1);
            this.tableLayoutPanel2.Controls.Add(this.chkIs_open_sewadar, 0, 2);
            this.tableLayoutPanel2.Controls.Add(this.txtEmail_id, 2, 2);
            this.tableLayoutPanel2.Controls.Add(this.password, 0, 3);
            this.tableLayoutPanel2.Controls.Add(this.dccGrid1, 0, 4);
            this.tableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 6;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 46F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 72F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 181F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(867, 539);
            this.tableLayoutPanel2.TabIndex = 0;
            this.tableLayoutPanel2.Paint += new System.Windows.Forms.PaintEventHandler(this.tableLayoutPanel2_Paint);
            // 
            // chkIs_locked
            // 
            this.chkIs_locked.AutoSize = true;
            this.chkIs_locked.BackColor = System.Drawing.Color.Transparent;
            this.chkIs_locked.BindingKey = "is_locked";
            this.chkIs_locked.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIs_locked.Font = new System.Drawing.Font("Verdana", 9.75F);
            this.chkIs_locked.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkIs_locked.Location = new System.Drawing.Point(165, 103);
            this.chkIs_locked.Name = "chkIs_locked";
            this.chkIs_locked.Size = new System.Drawing.Size(232, 40);
            this.chkIs_locked.TabIndex = 14;
            this.chkIs_locked.Text = "Is locked";
            this.chkIs_locked.UseVisualStyleBackColor = false;
            // 
            // intUser_no
            // 
            this.intUser_no.AllowsNew = false;
            this.intUser_no.AllowsReference = false;
            this.intUser_no.AllowsUpdate = false;
            this.intUser_no.ApplicationIdForDbConnection = null;
            this.intUser_no.BackColor = System.Drawing.Color.Transparent;
            this.intUser_no.CalledScreenApplicationId = null;
            this.intUser_no.CalledScreenTypeName = null;
            this.intUser_no.CallingScreenType = null;
            this.intUser_no.DisplayText = "";
            this.intUser_no.DisplayTextBindingKey = "user_no";
            this.intUser_no.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intUser_no.EditingControlDataGridView = null;
            this.intUser_no.EditingControlFormattedValue = "";
            this.intUser_no.EditingControlRowIndex = 0;
            this.intUser_no.EditingControlValueChanged = false;
            this.intUser_no.EnableToolTip = false;
            this.intUser_no.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intUser_no.IdText = null;
            this.intUser_no.IdTextBindingKey = "";
            this.intUser_no.Location = new System.Drawing.Point(4, 3);
            this.intUser_no.Lookup = false;
            this.intUser_no.LookupColumns = null;
            this.intUser_no.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intUser_no.LookupResult = null;
            this.intUser_no.LookupTitle = "User No.";
            this.intUser_no.Mandatory = false;
            this.intUser_no.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intUser_no.MaxCharacterLength = 32767;
            this.intUser_no.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intUser_no.MaxValue = ((long)(9223372036854775807));
            this.intUser_no.MinCharactersForQuery = 0;
            this.intUser_no.MinimumSize = new System.Drawing.Size(10, 22);
            this.intUser_no.MinValue = ((long)(-9223372036854775808));
            this.intUser_no.Name = "intUser_no";
            this.intUser_no.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intUser_no.PascalCase = false;
            this.intUser_no.RangeInQueryMode = false;
            this.intUser_no.ReadOnly = false;
            this.intUser_no.RegularExpressionValidator = null;
            this.intUser_no.Size = new System.Drawing.Size(154, 44);
            this.intUser_no.TabIndex = 1;
            this.intUser_no.Title = "User No.";
            this.intUser_no.ToolTipLookupField = "information";
            this.intUser_no.ValueText = null;
            // 
            // txtUser_id
            // 
            this.txtUser_id.AllowsNew = false;
            this.txtUser_id.AllowsReference = false;
            this.txtUser_id.AllowsUpdate = false;
            this.txtUser_id.ApplicationIdForDbConnection = null;
            this.txtUser_id.BackColor = System.Drawing.Color.Transparent;
            this.txtUser_id.CalledScreenApplicationId = null;
            this.txtUser_id.CalledScreenTypeName = null;
            this.txtUser_id.CallingScreenType = null;
            this.txtUser_id.DisplayText = "";
            this.txtUser_id.DisplayTextBindingKey = "user_id";
            this.txtUser_id.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtUser_id.EditingControlDataGridView = null;
            this.txtUser_id.EditingControlFormattedValue = "";
            this.txtUser_id.EditingControlRowIndex = 0;
            this.txtUser_id.EditingControlValueChanged = false;
            this.txtUser_id.EnableToolTip = false;
            this.txtUser_id.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUser_id.IdText = null;
            this.txtUser_id.IdTextBindingKey = "";
            this.txtUser_id.Location = new System.Drawing.Point(166, 3);
            this.txtUser_id.Lookup = false;
            this.txtUser_id.LookupColumns = null;
            this.txtUser_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtUser_id.LookupResult = null;
            this.txtUser_id.LookupTitle = "User Id";
            this.txtUser_id.Mandatory = false;
            this.txtUser_id.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtUser_id.MaxCharacterLength = 32767;
            this.txtUser_id.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtUser_id.MinCharactersForQuery = 0;
            this.txtUser_id.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtUser_id.Name = "txtUser_id";
            this.txtUser_id.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtUser_id.PascalCase = false;
            this.txtUser_id.RangeInQueryMode = false;
            this.txtUser_id.ReadOnly = false;
            this.txtUser_id.RegularExpressionValidator = null;
            this.txtUser_id.Size = new System.Drawing.Size(230, 44);
            this.txtUser_id.TabIndex = 2;
            this.txtUser_id.Title = "User Id";
            this.txtUser_id.ToolTipLookupField = "information";
            this.txtUser_id.ValueText = null;
            // 
            // txtUser_nm
            // 
            this.txtUser_nm.AllowsNew = false;
            this.txtUser_nm.AllowsReference = false;
            this.txtUser_nm.AllowsUpdate = false;
            this.txtUser_nm.ApplicationIdForDbConnection = null;
            this.txtUser_nm.BackColor = System.Drawing.Color.Transparent;
            this.txtUser_nm.CalledScreenApplicationId = null;
            this.txtUser_nm.CalledScreenTypeName = null;
            this.txtUser_nm.CallingScreenType = null;
            this.txtUser_nm.DisplayText = "";
            this.txtUser_nm.DisplayTextBindingKey = "user_nm";
            this.txtUser_nm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtUser_nm.EditingControlDataGridView = null;
            this.txtUser_nm.EditingControlFormattedValue = "";
            this.txtUser_nm.EditingControlRowIndex = 0;
            this.txtUser_nm.EditingControlValueChanged = false;
            this.txtUser_nm.EnableToolTip = false;
            this.txtUser_nm.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUser_nm.IdText = null;
            this.txtUser_nm.IdTextBindingKey = "user_nm";
            this.txtUser_nm.Location = new System.Drawing.Point(404, 3);
            this.txtUser_nm.Lookup = false;
            this.txtUser_nm.LookupColumns = null;
            this.txtUser_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtUser_nm.LookupResult = null;
            this.txtUser_nm.LookupTitle = "User Name";
            this.txtUser_nm.Mandatory = false;
            this.txtUser_nm.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtUser_nm.MaxCharacterLength = 32767;
            this.txtUser_nm.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtUser_nm.MinCharactersForQuery = 0;
            this.txtUser_nm.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtUser_nm.Name = "txtUser_nm";
            this.txtUser_nm.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtUser_nm.PascalCase = false;
            this.txtUser_nm.RangeInQueryMode = false;
            this.txtUser_nm.ReadOnly = false;
            this.txtUser_nm.RegularExpressionValidator = null;
            this.txtUser_nm.Size = new System.Drawing.Size(459, 44);
            this.txtUser_nm.TabIndex = 3;
            this.txtUser_nm.Title = "User Name";
            this.txtUser_nm.ToolTipLookupField = "information";
            this.txtUser_nm.ValueText = null;
            // 
            // intSewadar_id
            // 
            this.intSewadar_id.AllowsNew = false;
            this.intSewadar_id.AllowsReference = false;
            this.intSewadar_id.AllowsUpdate = false;
            this.intSewadar_id.ApplicationIdForDbConnection = null;
            this.intSewadar_id.BackColor = System.Drawing.Color.Transparent;
            this.intSewadar_id.CalledScreenApplicationId = null;
            this.intSewadar_id.CalledScreenTypeName = null;
            this.intSewadar_id.CallingScreenType = null;
            this.intSewadar_id.DisplayText = "";
            this.intSewadar_id.DisplayTextBindingKey = "sewadar_id";
            this.intSewadar_id.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intSewadar_id.EditingControlDataGridView = null;
            this.intSewadar_id.EditingControlFormattedValue = "";
            this.intSewadar_id.EditingControlRowIndex = 0;
            this.intSewadar_id.EditingControlValueChanged = false;
            this.intSewadar_id.EnableToolTip = false;
            this.intSewadar_id.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSewadar_id.IdText = null;
            this.intSewadar_id.IdTextBindingKey = "";
            this.intSewadar_id.Location = new System.Drawing.Point(4, 53);
            this.intSewadar_id.Lookup = false;
            this.intSewadar_id.LookupColumns = null;
            this.intSewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intSewadar_id.LookupResult = null;
            this.intSewadar_id.LookupTitle = "Sewadar Id";
            this.intSewadar_id.Mandatory = false;
            this.intSewadar_id.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intSewadar_id.MaxCharacterLength = 32767;
            this.intSewadar_id.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intSewadar_id.MaxValue = ((long)(9223372036854775807));
            this.intSewadar_id.MinCharactersForQuery = 0;
            this.intSewadar_id.MinimumSize = new System.Drawing.Size(10, 22);
            this.intSewadar_id.MinValue = ((long)(-9223372036854775808));
            this.intSewadar_id.Name = "intSewadar_id";
            this.intSewadar_id.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intSewadar_id.PascalCase = false;
            this.intSewadar_id.RangeInQueryMode = false;
            this.intSewadar_id.ReadOnly = false;
            this.intSewadar_id.RegularExpressionValidator = null;
            this.intSewadar_id.Size = new System.Drawing.Size(154, 44);
            this.intSewadar_id.TabIndex = 8;
            this.intSewadar_id.Title = "Sewadar Id";
            this.intSewadar_id.ToolTipLookupField = "information";
            this.intSewadar_id.ValueText = null;
            // 
            // dtmActivation_dt
            // 
            this.dtmActivation_dt.AllowFutureDate = true;
            this.dtmActivation_dt.AllowsNew = false;
            this.dtmActivation_dt.AllowsReference = false;
            this.dtmActivation_dt.AllowsUpdate = false;
            this.dtmActivation_dt.ApplicationIdForDbConnection = null;
            this.dtmActivation_dt.BackColor = System.Drawing.Color.Transparent;
            this.dtmActivation_dt.CalledScreenApplicationId = null;
            this.dtmActivation_dt.CalledScreenTypeName = null;
            this.dtmActivation_dt.CallingScreenType = null;
            this.dtmActivation_dt.DisplayText = null;
            this.dtmActivation_dt.DisplayTextAsDateTime = null;
            this.dtmActivation_dt.DisplayTextBindingKey = "activation_dt";
            this.dtmActivation_dt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmActivation_dt.EditingControlDataGridView = null;
            this.dtmActivation_dt.EditingControlFormattedValue = null;
            this.dtmActivation_dt.EditingControlRowIndex = 0;
            this.dtmActivation_dt.EditingControlValueChanged = false;
            this.dtmActivation_dt.EnableToolTip = false;
            this.dtmActivation_dt.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtmActivation_dt.IdText = "";
            this.dtmActivation_dt.IdTextBindingKey = "";
            this.dtmActivation_dt.Location = new System.Drawing.Point(166, 53);
            this.dtmActivation_dt.Lookup = true;
            this.dtmActivation_dt.LookupColumns = null;
            this.dtmActivation_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtmActivation_dt.LookupResult = null;
            this.dtmActivation_dt.LookupTitle = "Activation Date";
            this.dtmActivation_dt.Mandatory = false;
            this.dtmActivation_dt.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtmActivation_dt.MaxCharacterLength = 11;
            this.dtmActivation_dt.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtmActivation_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtmActivation_dt.MinCharactersForQuery = 0;
            this.dtmActivation_dt.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtmActivation_dt.MinValue = new System.DateTime(((long)(0)));
            this.dtmActivation_dt.Name = "dtmActivation_dt";
            this.dtmActivation_dt.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtmActivation_dt.PascalCase = false;
            this.dtmActivation_dt.RangeInQueryMode = false;
            this.dtmActivation_dt.ReadOnly = false;
            this.dtmActivation_dt.RegularExpressionValidator = null;
            this.dtmActivation_dt.ShowTime = false;
            this.dtmActivation_dt.Size = new System.Drawing.Size(230, 44);
            this.dtmActivation_dt.TabIndex = 9;
            this.dtmActivation_dt.Title = "Activation Date";
            this.dtmActivation_dt.ToolTipLookupField = "information";
            this.dtmActivation_dt.ValueText = "";
            // 
            // dtmDeactivation_dt
            // 
            this.dtmDeactivation_dt.AllowFutureDate = true;
            this.dtmDeactivation_dt.AllowsNew = false;
            this.dtmDeactivation_dt.AllowsReference = false;
            this.dtmDeactivation_dt.AllowsUpdate = false;
            this.dtmDeactivation_dt.ApplicationIdForDbConnection = null;
            this.dtmDeactivation_dt.BackColor = System.Drawing.Color.Transparent;
            this.dtmDeactivation_dt.CalledScreenApplicationId = null;
            this.dtmDeactivation_dt.CalledScreenTypeName = null;
            this.dtmDeactivation_dt.CallingScreenType = null;
            this.dtmDeactivation_dt.DisplayText = null;
            this.dtmDeactivation_dt.DisplayTextAsDateTime = null;
            this.dtmDeactivation_dt.DisplayTextBindingKey = "deactivation_dt";
            this.dtmDeactivation_dt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmDeactivation_dt.EditingControlDataGridView = null;
            this.dtmDeactivation_dt.EditingControlFormattedValue = null;
            this.dtmDeactivation_dt.EditingControlRowIndex = 0;
            this.dtmDeactivation_dt.EditingControlValueChanged = false;
            this.dtmDeactivation_dt.EnableToolTip = false;
            this.dtmDeactivation_dt.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtmDeactivation_dt.IdText = "";
            this.dtmDeactivation_dt.IdTextBindingKey = "";
            this.dtmDeactivation_dt.Location = new System.Drawing.Point(404, 53);
            this.dtmDeactivation_dt.Lookup = true;
            this.dtmDeactivation_dt.LookupColumns = null;
            this.dtmDeactivation_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtmDeactivation_dt.LookupResult = null;
            this.dtmDeactivation_dt.LookupTitle = "Deactivation Date";
            this.dtmDeactivation_dt.Mandatory = false;
            this.dtmDeactivation_dt.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtmDeactivation_dt.MaxCharacterLength = 11;
            this.dtmDeactivation_dt.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtmDeactivation_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtmDeactivation_dt.MinCharactersForQuery = 0;
            this.dtmDeactivation_dt.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtmDeactivation_dt.MinValue = new System.DateTime(((long)(0)));
            this.dtmDeactivation_dt.Name = "dtmDeactivation_dt";
            this.dtmDeactivation_dt.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtmDeactivation_dt.PascalCase = false;
            this.dtmDeactivation_dt.RangeInQueryMode = false;
            this.dtmDeactivation_dt.ReadOnly = false;
            this.dtmDeactivation_dt.RegularExpressionValidator = null;
            this.dtmDeactivation_dt.ShowTime = false;
            this.dtmDeactivation_dt.Size = new System.Drawing.Size(459, 44);
            this.dtmDeactivation_dt.TabIndex = 10;
            this.dtmDeactivation_dt.Title = "Deactivation Date";
            this.dtmDeactivation_dt.ToolTipLookupField = "information";
            this.dtmDeactivation_dt.ValueText = "";
            // 
            // chkIs_open_sewadar
            // 
            this.chkIs_open_sewadar.AutoSize = true;
            this.chkIs_open_sewadar.BackColor = System.Drawing.Color.Transparent;
            this.chkIs_open_sewadar.BindingKey = "is_open_sewadar";
            this.chkIs_open_sewadar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIs_open_sewadar.Font = new System.Drawing.Font("Verdana", 9.75F);
            this.chkIs_open_sewadar.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkIs_open_sewadar.Location = new System.Drawing.Point(3, 103);
            this.chkIs_open_sewadar.Name = "chkIs_open_sewadar";
            this.chkIs_open_sewadar.Size = new System.Drawing.Size(156, 40);
            this.chkIs_open_sewadar.TabIndex = 11;
            this.chkIs_open_sewadar.Text = "Is open sewadar";
            this.chkIs_open_sewadar.UseVisualStyleBackColor = false;
            // 
            // txtEmail_id
            // 
            this.txtEmail_id.AllowsNew = false;
            this.txtEmail_id.AllowsReference = false;
            this.txtEmail_id.AllowsUpdate = false;
            this.txtEmail_id.ApplicationIdForDbConnection = null;
            this.txtEmail_id.BackColor = System.Drawing.Color.Transparent;
            this.txtEmail_id.CalledScreenApplicationId = null;
            this.txtEmail_id.CalledScreenTypeName = null;
            this.txtEmail_id.CallingScreenType = null;
            this.txtEmail_id.DisplayText = "";
            this.txtEmail_id.DisplayTextBindingKey = "email_id";
            this.txtEmail_id.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtEmail_id.EditingControlDataGridView = null;
            this.txtEmail_id.EditingControlFormattedValue = "";
            this.txtEmail_id.EditingControlRowIndex = 0;
            this.txtEmail_id.EditingControlValueChanged = false;
            this.txtEmail_id.EnableToolTip = false;
            this.txtEmail_id.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEmail_id.IdText = null;
            this.txtEmail_id.IdTextBindingKey = "";
            this.txtEmail_id.Location = new System.Drawing.Point(404, 103);
            this.txtEmail_id.Lookup = false;
            this.txtEmail_id.LookupColumns = null;
            this.txtEmail_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtEmail_id.LookupResult = null;
            this.txtEmail_id.LookupTitle = "Email Id";
            this.txtEmail_id.Mandatory = false;
            this.txtEmail_id.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtEmail_id.MaxCharacterLength = 32767;
            this.txtEmail_id.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtEmail_id.MinCharactersForQuery = 0;
            this.txtEmail_id.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtEmail_id.Name = "txtEmail_id";
            this.txtEmail_id.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtEmail_id.PascalCase = false;
            this.txtEmail_id.RangeInQueryMode = false;
            this.txtEmail_id.ReadOnly = false;
            this.txtEmail_id.RegularExpressionValidator = null;
            this.txtEmail_id.Size = new System.Drawing.Size(459, 40);
            this.txtEmail_id.TabIndex = 15;
            this.txtEmail_id.Title = "Email Id";
            this.txtEmail_id.ToolTipLookupField = "information";
            this.txtEmail_id.ValueText = null;
            // 
            // password
            // 
            this.password.AllowsNew = false;
            this.password.AllowsReference = false;
            this.password.AllowsUpdate = false;
            this.password.ApplicationIdForDbConnection = null;
            this.password.BackColor = System.Drawing.Color.Transparent;
            this.password.CalledScreenApplicationId = null;
            this.password.CalledScreenTypeName = null;
            this.password.CallingScreenType = null;
            this.password.DisplayText = "";
            this.password.DisplayTextBindingKey = "password";
            this.password.Dock = System.Windows.Forms.DockStyle.Fill;
            this.password.EditingControlDataGridView = null;
            this.password.EditingControlFormattedValue = "";
            this.password.EditingControlRowIndex = 0;
            this.password.EditingControlValueChanged = false;
            this.password.EnableToolTip = false;
            this.password.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.password.IdText = null;
            this.password.IdTextBindingKey = null;
            this.password.Location = new System.Drawing.Point(4, 149);
            this.password.Lookup = false;
            this.password.LookupColumns = null;
            this.password.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.password.LookupResult = null;
            this.password.LookupTitle = "password";
            this.password.Mandatory = false;
            this.password.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.password.MaxCharacterLength = 32767;
            this.password.MaximumSize = new System.Drawing.Size(1300, 45);
            this.password.MinCharactersForQuery = 0;
            this.password.MinimumSize = new System.Drawing.Size(10, 22);
            this.password.Name = "password";
            this.password.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.password.PascalCase = false;
            this.password.RangeInQueryMode = false;
            this.password.ReadOnly = false;
            this.password.RegularExpressionValidator = null;
            this.password.Size = new System.Drawing.Size(154, 45);
            this.password.TabIndex = 17;
            this.password.Title = "Password";
            this.password.ToolTipLookupField = "information";
            this.password.ValueText = null;
            // 
            // dccGrid1
            // 
            this.dccGrid1.AllowRowSorting = false;
            this.dccGrid1.AllowUserToAddRows = false;
            this.dccGrid1.AllowUserToOrderColumns = true;
            this.dccGrid1.AutoAddNewRowForUser = false;
            this.dccGrid1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dccGrid1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.application_id,
            this.user_role_id});
            this.tableLayoutPanel2.SetColumnSpan(this.dccGrid1, 2);
            this.dccGrid1.DeleteRowMenuEnabled = true;
            this.dccGrid1.DeleteVisible = true;
            this.dccGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccGrid1.ExportToExcelVisible = true;
            this.dccGrid1.InsertAfterVisible = true;
            this.dccGrid1.InsertBeforeVisible = true;
            this.dccGrid1.InsertLastVisible = true;
            this.dccGrid1.InsertRowsMenuItemsEnabled = true;
            this.dccGrid1.Location = new System.Drawing.Point(3, 221);
            this.dccGrid1.Mandatory = false;
            this.dccGrid1.MoveDownVisible = false;
            this.dccGrid1.MoveUpVisible = false;
            this.dccGrid1.MultiSelect = false;
            this.dccGrid1.Name = "dccGrid1";
            this.dccGrid1.RowHeadersWidth = 15;
            this.dccGrid1.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.dccGrid1.ShowCommandStrip = false;
            this.dccGrid1.Size = new System.Drawing.Size(394, 175);
            this.dccGrid1.TabIndex = 18;
            this.dccGrid1.Title = null;
            this.dccGrid1.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.dccGrid1.VirtualMode = true;
            this.dccGrid1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dccGrid1_CellContentClick_3);
            // 
            // application_id
            // 
            this.application_id.BindingKey = "application_id";
            this.application_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.application_id.HeaderText = "Application ID";
            this.application_id.Lookup = false;
            this.application_id.LookupColumns = "";
            this.application_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.application_id.Mandatory = false;
            this.application_id.MaxCharacterLength = 2147483647;
            this.application_id.Name = "application_id";
            this.application_id.PercentageWidth = 50F;
            this.application_id.RegularExpressionValidator = "";
            this.application_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.application_id.ToolTipLookupField = "information";
            this.application_id.Width = 189;
            // 
            // user_role_id
            // 
            this.user_role_id.BindingKey = "user_role_id";
            this.user_role_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.user_role_id.DefaultCellStyle = dataGridViewCellStyle1;
            this.user_role_id.HeaderText = "User Role ID";
            this.user_role_id.Lookup = false;
            this.user_role_id.LookupColumns = "";
            this.user_role_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.user_role_id.Mandatory = false;
            this.user_role_id.MaxCharacterLength = 2147483647;
            this.user_role_id.Name = "user_role_id";
            this.user_role_id.PercentageWidth = 50F;
            this.user_role_id.RegularExpressionValidator = "";
            this.user_role_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.user_role_id.ToolTipLookupField = "information";
            this.user_role_id.Width = 189;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.user_no,
            this.txtPassword,
            this.txtApplication_id,
            this.txtUser_role_id,
            this.user_id,
            this.user_nm,
            this.sewadar_id,
            this.activation_dt,
            this.deactivation_dt,
            this.is_open_sewadar,
            this.is_locked,
            this.email_id});
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
            this.grdList.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dccGrid1_CellContentClick);
            // 
            // user_no
            // 
            this.user_no.BindingKey = "user_no";
            this.user_no.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.user_no.DefaultCellStyle = dataGridViewCellStyle2;
            this.user_no.HeaderText = "User No";
            this.user_no.Lookup = false;
            this.user_no.LookupColumns = "";
            this.user_no.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.user_no.Mandatory = false;
            this.user_no.MaxValue = ((long)(9223372036854775807));
            this.user_no.MinValue = ((long)(-9223372036854775808));
            this.user_no.Name = "user_no";
            this.user_no.PercentageWidth = 25F;
            this.user_no.ReadOnly = true;
            this.user_no.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.user_no.ToolTipLookupField = "information";
            this.user_no.Width = 20;
            // 
            // txtPassword
            // 
            this.txtPassword.BindingKey = "password";
            this.txtPassword.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.txtPassword.HeaderText = "Password";
            this.txtPassword.Lookup = false;
            this.txtPassword.LookupColumns = "";
            this.txtPassword.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtPassword.Mandatory = false;
            this.txtPassword.MaxCharacterLength = 2147483647;
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PercentageWidth = 25F;
            this.txtPassword.ReadOnly = true;
            this.txtPassword.RegularExpressionValidator = "";
            this.txtPassword.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txtPassword.ToolTipLookupField = "information";
            this.txtPassword.Visible = false;
            // 
            // txtApplication_id
            // 
            this.txtApplication_id.BindingKey = "application_id";
            this.txtApplication_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.txtApplication_id.HeaderText = "Application ID";
            this.txtApplication_id.Lookup = false;
            this.txtApplication_id.LookupColumns = "";
            this.txtApplication_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtApplication_id.Mandatory = false;
            this.txtApplication_id.MaxCharacterLength = 2147483647;
            this.txtApplication_id.Name = "txtApplication_id";
            this.txtApplication_id.PercentageWidth = 25F;
            this.txtApplication_id.ReadOnly = true;
            this.txtApplication_id.RegularExpressionValidator = "";
            this.txtApplication_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txtApplication_id.ToolTipLookupField = "information";
            this.txtApplication_id.Visible = false;
            // 
            // txtUser_role_id
            // 
            this.txtUser_role_id.BindingKey = "user_role_id";
            this.txtUser_role_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.txtUser_role_id.HeaderText = "User Role ID";
            this.txtUser_role_id.Lookup = false;
            this.txtUser_role_id.LookupColumns = "";
            this.txtUser_role_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtUser_role_id.Mandatory = false;
            this.txtUser_role_id.MaxCharacterLength = 2147483647;
            this.txtUser_role_id.Name = "txtUser_role_id";
            this.txtUser_role_id.PercentageWidth = 25F;
            this.txtUser_role_id.ReadOnly = true;
            this.txtUser_role_id.RegularExpressionValidator = "";
            this.txtUser_role_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txtUser_role_id.ToolTipLookupField = "information";
            this.txtUser_role_id.Visible = false;
            // 
            // user_id
            // 
            this.user_id.BindingKey = "user_id";
            this.user_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.user_id.HeaderText = "User Id";
            this.user_id.Lookup = false;
            this.user_id.LookupColumns = "";
            this.user_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.user_id.Mandatory = false;
            this.user_id.MaxCharacterLength = 2147483647;
            this.user_id.Name = "user_id";
            this.user_id.PercentageWidth = 25F;
            this.user_id.ReadOnly = true;
            this.user_id.RegularExpressionValidator = "";
            this.user_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.user_id.ToolTipLookupField = "information";
            this.user_id.Width = 20;
            // 
            // user_nm
            // 
            this.user_nm.BindingKey = "user_nm";
            this.user_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.user_nm.HeaderText = "User Name";
            this.user_nm.Lookup = false;
            this.user_nm.LookupColumns = "";
            this.user_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.user_nm.Mandatory = false;
            this.user_nm.MaxCharacterLength = 2147483647;
            this.user_nm.Name = "user_nm";
            this.user_nm.PercentageWidth = 25F;
            this.user_nm.ReadOnly = true;
            this.user_nm.RegularExpressionValidator = "";
            this.user_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.user_nm.ToolTipLookupField = "information";
            this.user_nm.Width = 20;
            // 
            // sewadar_id
            // 
            this.sewadar_id.BindingKey = "sewadar_id";
            this.sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewadar_id.DefaultCellStyle = dataGridViewCellStyle3;
            this.sewadar_id.HeaderText = "Sewadar_id";
            this.sewadar_id.Lookup = false;
            this.sewadar_id.LookupColumns = "";
            this.sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_id.Mandatory = false;
            this.sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.sewadar_id.Name = "sewadar_id";
            this.sewadar_id.PercentageWidth = 25F;
            this.sewadar_id.ReadOnly = true;
            this.sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_id.ToolTipLookupField = "information";
            this.sewadar_id.Width = 20;
            // 
            // activation_dt
            // 
            this.activation_dt.BindingKey = "activation_dt";
            this.activation_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.activation_dt.DefaultCellStyle = dataGridViewCellStyle4;
            this.activation_dt.HeaderText = "Activation Date";
            this.activation_dt.Lookup = false;
            this.activation_dt.LookupColumns = "";
            this.activation_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.activation_dt.Mandatory = false;
            this.activation_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.activation_dt.MinValue = new System.DateTime(((long)(0)));
            this.activation_dt.Name = "activation_dt";
            this.activation_dt.PercentageWidth = 25F;
            this.activation_dt.ReadOnly = true;
            this.activation_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.activation_dt.ToolTipLookupField = "information";
            this.activation_dt.Width = 20;
            // 
            // deactivation_dt
            // 
            this.deactivation_dt.BindingKey = "deactivation_dt";
            this.deactivation_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.deactivation_dt.DefaultCellStyle = dataGridViewCellStyle5;
            this.deactivation_dt.HeaderText = "Deactivation Date";
            this.deactivation_dt.Lookup = false;
            this.deactivation_dt.LookupColumns = "";
            this.deactivation_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.deactivation_dt.Mandatory = false;
            this.deactivation_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.deactivation_dt.MinValue = new System.DateTime(((long)(0)));
            this.deactivation_dt.Name = "deactivation_dt";
            this.deactivation_dt.PercentageWidth = 25F;
            this.deactivation_dt.ReadOnly = true;
            this.deactivation_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.deactivation_dt.ToolTipLookupField = "information";
            this.deactivation_dt.Width = 20;
            // 
            // is_open_sewadar
            // 
            this.is_open_sewadar.BindingKey = "is_open_sewadar";
            this.is_open_sewadar.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_open_sewadar.DefaultCellStyle = dataGridViewCellStyle6;
            this.is_open_sewadar.HeaderText = "Is Open Sewadar?";
            this.is_open_sewadar.Lookup = false;
            this.is_open_sewadar.LookupColumns = "";
            this.is_open_sewadar.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_open_sewadar.Mandatory = false;
            this.is_open_sewadar.Name = "is_open_sewadar";
            this.is_open_sewadar.PercentageWidth = 25F;
            this.is_open_sewadar.ReadOnly = true;
            this.is_open_sewadar.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_open_sewadar.ToolTipLookupField = "information";
            this.is_open_sewadar.Width = 20;
            // 
            // is_locked
            // 
            this.is_locked.BindingKey = "is_locked";
            this.is_locked.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_locked.DefaultCellStyle = dataGridViewCellStyle7;
            this.is_locked.HeaderText = "Is locked?";
            this.is_locked.Lookup = false;
            this.is_locked.LookupColumns = "";
            this.is_locked.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_locked.Mandatory = false;
            this.is_locked.Name = "is_locked";
            this.is_locked.PercentageWidth = 25F;
            this.is_locked.ReadOnly = true;
            this.is_locked.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_locked.ToolTipLookupField = "information";
            this.is_locked.Width = 20;
            // 
            // email_id
            // 
            this.email_id.BindingKey = "email_id";
            this.email_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.email_id.DefaultCellStyle = dataGridViewCellStyle8;
            this.email_id.HeaderText = "Email Id";
            this.email_id.Lookup = false;
            this.email_id.LookupColumns = "";
            this.email_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.email_id.Mandatory = false;
            this.email_id.Name = "email_id";
            this.email_id.PercentageWidth = 25F;
            this.email_id.ReadOnly = true;
            this.email_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.email_id.ToolTipLookupField = "information";
            this.email_id.Width = 20;
            // 
            // application_id1
            // 
            this.application_id1.BindingKey = null;
            this.application_id1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.application_id1.HeaderText = "Application ID";
            this.application_id1.Lookup = false;
            this.application_id1.LookupColumns = "";
            this.application_id1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.application_id1.Mandatory = false;
            this.application_id1.MaxCharacterLength = 2147483647;
            this.application_id1.Name = "application_id1";
            this.application_id1.PercentageWidth = 25F;
            this.application_id1.RegularExpressionValidator = "";
            this.application_id1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.application_id1.ToolTipLookupField = "information";
            // 
            // Users
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(867, 539);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "Users";
            this.Text = "Zonal Sewadar Management [USERS]";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.scListOrBrowse)).EndInit();
            this.scListOrBrowse.ResumeLayout(false);
            this.tableLayoutPanel2.ResumeLayout(false);
            this.tableLayoutPanel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        private void dccGrid1_CellContentClick(object sender, System.Windows.Forms.DataGridViewCellEventArgs e)
        {
            throw new System.NotImplementedException();
        }

        #endregion
      //  private System.Windows.Forms.SplitContainer scListOrBrowse;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
      //  private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField intUser_no;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtUser_id;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtUser_nm;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField intSewadar_id;
        private UMB.CDF.UIControls.TextControls.DCCDateTimeField dtmActivation_dt;
        private UMB.CDF.UIControls.TextControls.DCCDateTimeField dtmDeactivation_dt;
        private UMB.CDF.UIControls.DCCCheckBox chkIs_open_sewadar;
        private UMB.CDF.UIControls.DCCCheckBox chkIs_locked;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtEmail_id;
        private UMB.CDF.UIControls.Grid.DCCGrid grdList;
        //     private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn user_role_id;
        //    private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn application_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn application_id1;
        private UMB.CDF.UIControls.TextControls.DCCTextField password;
        private UMB.CDF.UIControls.Grid.DCCGrid dccGrid1;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn application_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn user_role_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn user_no;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn txtPassword;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn txtApplication_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn txtUser_role_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn user_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn user_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewadar_id;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn activation_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn deactivation_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_open_sewadar;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_locked;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn email_id;
    }
}