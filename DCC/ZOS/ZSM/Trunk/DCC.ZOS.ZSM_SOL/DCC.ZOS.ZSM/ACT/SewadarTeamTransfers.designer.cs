namespace DCC.ZOS.ZSM.ACT
{
    partial class SewadarTeamTransfers
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewadarHeader1 = new DCC.ZOS.ZSM.Controls.Misc.SewadarHeader();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccTableLayoutPanel2 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.departmentChooserFrom = new DCC.ZOS.ZSM.Controls.Misc.DepartmentChooser();
            this.departmentChooserTo = new DCC.ZOS.ZSM.Controls.Misc.DepartmentChooser();
            this.lblOldDep = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.lblNewDep = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.txtCurrentSewaTeam = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.sewaTeamsLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup();
            this.dtTransferOut = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtTransferIn = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtEffective = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_team_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.attendance_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.sewa_team_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewa_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewa_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpBase.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.dccTableLayoutPanel2.SuspendLayout();
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
            this.scListOrBrowse.Panel1.Controls.Add(this.tlpBase);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Size = new System.Drawing.Size(932, 601);
            this.scListOrBrowse.SplitterDistance = 903;
            this.scListOrBrowse.TabIndex = 2;
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 3;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.419712F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 85.49281F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.198228F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.Controls.Add(this.tlpTop, 0, 1);
            this.tlpBase.Controls.Add(this.dccTableLayoutPanel1, 0, 3);
            this.tlpBase.Controls.Add(this.dccTableLayoutPanel2, 1, 2);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 4;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 1.858108F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.10135F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 78.04054F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8F));
            this.tlpBase.Size = new System.Drawing.Size(903, 601);
            this.tlpBase.TabIndex = 0;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 1;
            this.tlpBase.SetColumnSpan(this.tlpTop, 3);
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.Controls.Add(this.sewadarHeader1, 0, 0);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(3, 14);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 1;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 113F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 113F));
            this.tlpTop.Size = new System.Drawing.Size(897, 113);
            this.tlpTop.TabIndex = 0;
            // 
            // sewadarHeader1
            // 
            this.sewadarHeader1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarHeader1.Location = new System.Drawing.Point(3, 3);
            this.sewadarHeader1.Name = "sewadarHeader1";
            this.sewadarHeader1.SatsangCentreId = null;
            this.sewadarHeader1.Size = new System.Drawing.Size(891, 107);
            this.sewadarHeader1.TabIndex = 0;
            this.sewadarHeader1.UseFocusLostEvent = false;
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 7;
            this.tlpBase.SetColumnSpan(this.dccTableLayoutPanel1, 3);
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 109F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 97F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 94F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 94F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 99F));
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(3, 595);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 1;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(897, 3);
            this.dccTableLayoutPanel1.TabIndex = 2;
            // 
            // dccTableLayoutPanel2
            // 
            this.dccTableLayoutPanel2.ColumnCount = 6;
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15.0595F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.83307F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 24.10741F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 22.42905F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.51145F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15.0595F));
            this.dccTableLayoutPanel2.Controls.Add(this.departmentChooserFrom, 0, 1);
            this.dccTableLayoutPanel2.Controls.Add(this.departmentChooserTo, 3, 1);
            this.dccTableLayoutPanel2.Controls.Add(this.lblOldDep, 0, 0);
            this.dccTableLayoutPanel2.Controls.Add(this.lblNewDep, 4, 0);
            this.dccTableLayoutPanel2.Controls.Add(this.txtCurrentSewaTeam, 0, 2);
            this.dccTableLayoutPanel2.Controls.Add(this.sewaTeamsLookup1, 3, 2);
            this.dccTableLayoutPanel2.Controls.Add(this.dtTransferOut, 2, 3);
            this.dccTableLayoutPanel2.Controls.Add(this.dtTransferIn, 3, 3);
            this.dccTableLayoutPanel2.Controls.Add(this.dtEffective, 2, 4);
            this.dccTableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel2.Location = new System.Drawing.Point(69, 133);
            this.dccTableLayoutPanel2.Name = "dccTableLayoutPanel2";
            this.dccTableLayoutPanel2.RowCount = 6;
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.04792F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.04792F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.05173F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.00917F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 53.21101F));
            this.dccTableLayoutPanel2.Size = new System.Drawing.Size(765, 456);
            this.dccTableLayoutPanel2.TabIndex = 3;
            // 
            // departmentChooserFrom
            // 
            this.dccTableLayoutPanel2.SetColumnSpan(this.departmentChooserFrom, 3);
            this.departmentChooserFrom.DepartmentBindingKey = "department_nm";
            this.departmentChooserFrom.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentChooserFrom.Location = new System.Drawing.Point(3, 23);
            this.departmentChooserFrom.Manadatory = false;
            this.departmentChooserFrom.Name = "departmentChooserFrom";
            this.departmentChooserFrom.ReadOnly = true;
            this.departmentChooserFrom.SatsangCentreId = null;
            this.departmentChooserFrom.SelectedDepartment = null;
            this.departmentChooserFrom.SelectedDepartmentName = "";
            this.departmentChooserFrom.SelectedSubDepartment = null;
            this.departmentChooserFrom.SelectedSubDepartmentName = "";
            this.departmentChooserFrom.Size = new System.Drawing.Size(375, 46);
            this.departmentChooserFrom.SubDepartmentBindingKey = "sub_department_nm";
            this.departmentChooserFrom.TabIndex = 0;
            // 
            // departmentChooserTo
            // 
            this.dccTableLayoutPanel2.SetColumnSpan(this.departmentChooserTo, 3);
            this.departmentChooserTo.DepartmentBindingKey = "department_nm";
            this.departmentChooserTo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentChooserTo.Location = new System.Drawing.Point(384, 23);
            this.departmentChooserTo.Manadatory = false;
            this.departmentChooserTo.Name = "departmentChooserTo";
            this.departmentChooserTo.ReadOnly = true;
            this.departmentChooserTo.SatsangCentreId = null;
            this.departmentChooserTo.SelectedDepartment = null;
            this.departmentChooserTo.SelectedDepartmentName = "";
            this.departmentChooserTo.SelectedSubDepartment = null;
            this.departmentChooserTo.SelectedSubDepartmentName = "";
            this.departmentChooserTo.Size = new System.Drawing.Size(378, 46);
            this.departmentChooserTo.SubDepartmentBindingKey = "sub_department_nm";
            this.departmentChooserTo.TabIndex = 1;
            // 
            // lblOldDep
            // 
            this.lblOldDep.AutoSize = true;
            this.lblOldDep.BackColor = System.Drawing.Color.Transparent;
            this.dccTableLayoutPanel2.SetColumnSpan(this.lblOldDep, 2);
            this.lblOldDep.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblOldDep.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOldDep.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblOldDep.Location = new System.Drawing.Point(3, 0);
            this.lblOldDep.Name = "lblOldDep";
            this.lblOldDep.Size = new System.Drawing.Size(191, 20);
            this.lblOldDep.TabIndex = 2;
            this.lblOldDep.Text = "Current Department";
            // 
            // lblNewDep
            // 
            this.lblNewDep.AutoSize = true;
            this.lblNewDep.BackColor = System.Drawing.Color.Transparent;
            this.dccTableLayoutPanel2.SetColumnSpan(this.lblNewDep, 2);
            this.lblNewDep.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblNewDep.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNewDep.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblNewDep.Location = new System.Drawing.Point(555, 0);
            this.lblNewDep.Name = "lblNewDep";
            this.lblNewDep.Size = new System.Drawing.Size(207, 20);
            this.lblNewDep.TabIndex = 3;
            this.lblNewDep.Text = "New Department";
            // 
            // txtCurrentSewaTeam
            // 
            this.txtCurrentSewaTeam.AllowsNew = false;
            this.txtCurrentSewaTeam.AllowsReference = false;
            this.txtCurrentSewaTeam.AllowsUpdate = false;
            this.txtCurrentSewaTeam.ApplicationIdForDbConnection = null;
            this.txtCurrentSewaTeam.BackColor = System.Drawing.Color.Transparent;
            this.txtCurrentSewaTeam.CalledScreenApplicationId = null;
            this.txtCurrentSewaTeam.CalledScreenTypeName = null;
            this.txtCurrentSewaTeam.CallingScreenType = null;
            this.dccTableLayoutPanel2.SetColumnSpan(this.txtCurrentSewaTeam, 3);
            this.txtCurrentSewaTeam.DisplayText = "";
            this.txtCurrentSewaTeam.DisplayTextBindingKey = null;
            this.txtCurrentSewaTeam.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCurrentSewaTeam.EditingControlDataGridView = null;
            this.txtCurrentSewaTeam.EditingControlFormattedValue = "";
            this.txtCurrentSewaTeam.EditingControlRowIndex = 0;
            this.txtCurrentSewaTeam.EditingControlValueChanged = false;
            this.txtCurrentSewaTeam.EnableToolTip = false;
            this.txtCurrentSewaTeam.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCurrentSewaTeam.IdText = null;
            this.txtCurrentSewaTeam.IdTextBindingKey = null;
            this.txtCurrentSewaTeam.Location = new System.Drawing.Point(4, 75);
            this.txtCurrentSewaTeam.Lookup = false;
            this.txtCurrentSewaTeam.LookupColumns = null;
            this.txtCurrentSewaTeam.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtCurrentSewaTeam.LookupResult = null;
            this.txtCurrentSewaTeam.Mandatory = false;
            this.txtCurrentSewaTeam.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtCurrentSewaTeam.MaxCharacterLength = 32767;
            this.txtCurrentSewaTeam.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtCurrentSewaTeam.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtCurrentSewaTeam.Name = "txtCurrentSewaTeam";
            this.txtCurrentSewaTeam.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtCurrentSewaTeam.PascalCase = false;
            this.txtCurrentSewaTeam.RangeInQueryMode = false;
            this.txtCurrentSewaTeam.ReadOnly = true;
            this.txtCurrentSewaTeam.RegularExpressionValidator = null;
            this.txtCurrentSewaTeam.Size = new System.Drawing.Size(373, 45);
            this.txtCurrentSewaTeam.TabIndex = 4;
            this.txtCurrentSewaTeam.TabStop = false;
            this.txtCurrentSewaTeam.Title = "Current Sewa Team";
            this.txtCurrentSewaTeam.ToolTipLookupField = "information";
            this.txtCurrentSewaTeam.ValueText = null;
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
            this.dccTableLayoutPanel2.SetColumnSpan(this.sewaTeamsLookup1, 3);
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
            this.sewaTeamsLookup1.Location = new System.Drawing.Point(385, 75);
            this.sewaTeamsLookup1.Lookup = true;
            this.sewaTeamsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewaTeamsLookup1.LookupResult = null;
            this.sewaTeamsLookup1.Mandatory = true;
            this.sewaTeamsLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaTeamsLookup1.MaxCharacterLength = 32767;
            this.sewaTeamsLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaTeamsLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaTeamsLookup1.Name = "sewaTeamsLookup1";
            this.sewaTeamsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaTeamsLookup1.PascalCase = false;
            this.sewaTeamsLookup1.RangeInQueryMode = false;
            this.sewaTeamsLookup1.ReadOnly = false;
            this.sewaTeamsLookup1.RegularExpressionValidator = null;
            this.sewaTeamsLookup1.Size = new System.Drawing.Size(376, 45);
            this.sewaTeamsLookup1.TabIndex = 5;
            this.sewaTeamsLookup1.Title = "New Sewa Team";
            this.sewaTeamsLookup1.ToolTipLookupField = "information";
            this.sewaTeamsLookup1.ValueText = null;
            this.sewaTeamsLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaTeamsLookup1_LookupDialogShowing);
            // 
            // dtTransferOut
            // 
            this.dtTransferOut.AllowsNew = false;
            this.dtTransferOut.AllowsReference = false;
            this.dtTransferOut.AllowsUpdate = false;
            this.dtTransferOut.ApplicationIdForDbConnection = null;
            this.dtTransferOut.BackColor = System.Drawing.Color.Transparent;
            this.dtTransferOut.CalledScreenApplicationId = null;
            this.dtTransferOut.CalledScreenTypeName = null;
            this.dtTransferOut.CallingScreenType = null;
            this.dtTransferOut.DisplayText = null;
            this.dtTransferOut.DisplayTextAsDateTime = null;
            this.dtTransferOut.DisplayTextBindingKey = "transfer_out_dt";
            this.dtTransferOut.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtTransferOut.EditingControlDataGridView = null;
            this.dtTransferOut.EditingControlFormattedValue = null;
            this.dtTransferOut.EditingControlRowIndex = 0;
            this.dtTransferOut.EditingControlValueChanged = false;
            this.dtTransferOut.EnableToolTip = false;
            this.dtTransferOut.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtTransferOut.IdText = "";
            this.dtTransferOut.IdTextBindingKey = null;
            this.dtTransferOut.Location = new System.Drawing.Point(201, 127);
            this.dtTransferOut.Lookup = true;
            this.dtTransferOut.LookupColumns = null;
            this.dtTransferOut.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtTransferOut.LookupResult = null;
            this.dtTransferOut.Mandatory = false;
            this.dtTransferOut.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtTransferOut.MaxCharacterLength = 11;
            this.dtTransferOut.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtTransferOut.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtTransferOut.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtTransferOut.MinValue = new System.DateTime(((long)(0)));
            this.dtTransferOut.Name = "dtTransferOut";
            this.dtTransferOut.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtTransferOut.PascalCase = false;
            this.dtTransferOut.RangeInQueryMode = false;
            this.dtTransferOut.ReadOnly = true;
            this.dtTransferOut.RegularExpressionValidator = null;
            this.dtTransferOut.ShowTime = false;
            this.dtTransferOut.Size = new System.Drawing.Size(176, 45);
            this.dtTransferOut.TabIndex = 6;
            this.dtTransferOut.TabStop = false;
            this.dtTransferOut.Title = "Transfer Out";
            this.dtTransferOut.ToolTipLookupField = "information";
            this.dtTransferOut.ValueText = "";
            // 
            // dtTransferIn
            // 
            this.dtTransferIn.AllowsNew = false;
            this.dtTransferIn.AllowsReference = false;
            this.dtTransferIn.AllowsUpdate = false;
            this.dtTransferIn.ApplicationIdForDbConnection = null;
            this.dtTransferIn.BackColor = System.Drawing.Color.Transparent;
            this.dtTransferIn.CalledScreenApplicationId = null;
            this.dtTransferIn.CalledScreenTypeName = null;
            this.dtTransferIn.CallingScreenType = null;
            this.dtTransferIn.DisplayText = null;
            this.dtTransferIn.DisplayTextAsDateTime = null;
            this.dtTransferIn.DisplayTextBindingKey = "transfer_in_dt";
            this.dtTransferIn.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtTransferIn.EditingControlDataGridView = null;
            this.dtTransferIn.EditingControlFormattedValue = null;
            this.dtTransferIn.EditingControlRowIndex = 0;
            this.dtTransferIn.EditingControlValueChanged = false;
            this.dtTransferIn.EnableToolTip = false;
            this.dtTransferIn.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtTransferIn.IdText = "";
            this.dtTransferIn.IdTextBindingKey = null;
            this.dtTransferIn.Location = new System.Drawing.Point(385, 127);
            this.dtTransferIn.Lookup = true;
            this.dtTransferIn.LookupColumns = null;
            this.dtTransferIn.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtTransferIn.LookupResult = null;
            this.dtTransferIn.Mandatory = false;
            this.dtTransferIn.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtTransferIn.MaxCharacterLength = 11;
            this.dtTransferIn.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtTransferIn.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtTransferIn.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtTransferIn.MinValue = new System.DateTime(((long)(0)));
            this.dtTransferIn.Name = "dtTransferIn";
            this.dtTransferIn.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtTransferIn.PascalCase = false;
            this.dtTransferIn.RangeInQueryMode = false;
            this.dtTransferIn.ReadOnly = true;
            this.dtTransferIn.RegularExpressionValidator = null;
            this.dtTransferIn.ShowTime = false;
            this.dtTransferIn.Size = new System.Drawing.Size(163, 45);
            this.dtTransferIn.TabIndex = 7;
            this.dtTransferIn.TabStop = false;
            this.dtTransferIn.Title = "Transfer In";
            this.dtTransferIn.ToolTipLookupField = "information";
            this.dtTransferIn.ValueText = "";
            // 
            // dtEffective
            // 
            this.dtEffective.AllowsNew = false;
            this.dtEffective.AllowsReference = false;
            this.dtEffective.AllowsUpdate = false;
            this.dtEffective.ApplicationIdForDbConnection = null;
            this.dtEffective.BackColor = System.Drawing.Color.Transparent;
            this.dtEffective.CalledScreenApplicationId = null;
            this.dtEffective.CalledScreenTypeName = null;
            this.dtEffective.CallingScreenType = null;
            this.dtEffective.DisplayText = null;
            this.dtEffective.DisplayTextAsDateTime = null;
            this.dtEffective.DisplayTextBindingKey = null;
            this.dtEffective.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtEffective.EditingControlDataGridView = null;
            this.dtEffective.EditingControlFormattedValue = null;
            this.dtEffective.EditingControlRowIndex = 0;
            this.dtEffective.EditingControlValueChanged = false;
            this.dtEffective.EnableToolTip = false;
            this.dtEffective.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtEffective.IdText = "";
            this.dtEffective.IdTextBindingKey = null;
            this.dtEffective.Location = new System.Drawing.Point(201, 179);
            this.dtEffective.Lookup = true;
            this.dtEffective.LookupColumns = null;
            this.dtEffective.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtEffective.LookupResult = null;
            this.dtEffective.Mandatory = false;
            this.dtEffective.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtEffective.MaxCharacterLength = 11;
            this.dtEffective.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtEffective.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtEffective.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtEffective.MinValue = new System.DateTime(((long)(0)));
            this.dtEffective.Name = "dtEffective";
            this.dtEffective.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtEffective.PascalCase = false;
            this.dtEffective.RangeInQueryMode = false;
            this.dtEffective.ReadOnly = true;
            this.dtEffective.RegularExpressionValidator = null;
            this.dtEffective.ShowTime = false;
            this.dtEffective.Size = new System.Drawing.Size(176, 41);
            this.dtEffective.TabIndex = 8;
            this.dtEffective.TabStop = false;
            this.dtEffective.Title = "Effective Date";
            this.dtEffective.ToolTipLookupField = "information";
            this.dtEffective.ValueText = "";
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.satsang_centre_id,
            this.centre_nm,
            this.sewa_team_id,
            this.attendance_dt,
            this.sewa_team_nm,
            this.sewa_id,
            this.sewa_nm,
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
            this.grdList.MoveDownVisible = false;
            this.grdList.MoveUpVisible = false;
            this.grdList.MultiSelect = false;
            this.grdList.Name = "grdList";
            this.grdList.ReadOnly = true;
            this.grdList.RowHeadersWidth = 15;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(25, 601);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = "satsang_centre_id";
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle5;
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
            this.centre_nm.Width = 5;
            // 
            // sewa_team_id
            // 
            this.sewa_team_id.BindingKey = "sewa_team_id";
            this.sewa_team_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewa_team_id.DefaultCellStyle = dataGridViewCellStyle6;
            this.sewa_team_id.HeaderText = "Sewa Team Id";
            this.sewa_team_id.Lookup = false;
            this.sewa_team_id.LookupColumns = "";
            this.sewa_team_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_team_id.Mandatory = false;
            this.sewa_team_id.MaxValue = ((long)(9223372036854775807));
            this.sewa_team_id.MinValue = ((long)(-9223372036854775808));
            this.sewa_team_id.Name = "sewa_team_id";
            this.sewa_team_id.PercentageWidth = 25;
            this.sewa_team_id.ReadOnly = true;
            this.sewa_team_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_team_id.ToolTipLookupField = "information";
            this.sewa_team_id.Width = 5;
            // 
            // attendance_dt
            // 
            this.attendance_dt.BindingKey = "attendance_dt";
            this.attendance_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.attendance_dt.DefaultCellStyle = dataGridViewCellStyle7;
            this.attendance_dt.HeaderText = "Attendance Date";
            this.attendance_dt.Lookup = false;
            this.attendance_dt.LookupColumns = "";
            this.attendance_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attendance_dt.Mandatory = false;
            this.attendance_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.attendance_dt.MinValue = new System.DateTime(((long)(0)));
            this.attendance_dt.Name = "attendance_dt";
            this.attendance_dt.PercentageWidth = 25;
            this.attendance_dt.ReadOnly = true;
            this.attendance_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attendance_dt.ToolTipLookupField = "information";
            this.attendance_dt.Width = 5;
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
            this.sewa_team_nm.PercentageWidth = 25;
            this.sewa_team_nm.ReadOnly = true;
            this.sewa_team_nm.RegularExpressionValidator = "";
            this.sewa_team_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_team_nm.ToolTipLookupField = "information";
            this.sewa_team_nm.Width = 5;
            // 
            // sewa_id
            // 
            this.sewa_id.BindingKey = "sewa_id";
            this.sewa_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewa_id.DefaultCellStyle = dataGridViewCellStyle8;
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
            this.sewa_id.Width = 5;
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
            this.sewa_nm.PercentageWidth = 25;
            this.sewa_nm.ReadOnly = true;
            this.sewa_nm.RegularExpressionValidator = "";
            this.sewa_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_nm.ToolTipLookupField = "information";
            this.sewa_nm.Width = 5;
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
            this.txn_ts.Width = 5;
            // 
            // SewadarTeamTransfers
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(932, 601);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "SewadarTeamTransfers";
            this.Text = "SewaTeamAttendence";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpBase.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            this.dccTableLayoutPanel2.ResumeLayout(false);
            this.dccTableLayoutPanel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;

        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn centre_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewa_team_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn attendance_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_team_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewa_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.ZOS.ZSM.Controls.Misc.SewadarHeader sewadarHeader1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel2;
        private DCC.ZOS.ZSM.Controls.Misc.DepartmentChooser departmentChooserFrom;
        private DCC.ZOS.ZSM.Controls.Misc.DepartmentChooser departmentChooserTo;
        private DCC.UMB.CDF.UIControls.DCCLabel lblOldDep;
        private DCC.UMB.CDF.UIControls.DCCLabel lblNewDep;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtCurrentSewaTeam;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup sewaTeamsLookup1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtTransferOut;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtTransferIn;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtEffective;
    }
}