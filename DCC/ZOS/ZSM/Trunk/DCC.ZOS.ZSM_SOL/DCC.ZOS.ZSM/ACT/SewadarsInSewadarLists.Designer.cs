namespace DCC.ZOS.ZSM.ACT
{
    partial class SewadarsInSewadarLists
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SewadarsInSewadarLists));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtReportName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpSewaSamiti = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtOtherUse = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.chkotherCentreSewadarsAllowed = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkIsManagedByOtherCentre = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.txtUse = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtGenerated = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.intID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtListName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intSessionId = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.chkIsEditingAllowed = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.lkpListSatsangCentre = new DCC.UMB.CDF.UIControls.TextControls.BaseMasterLookup();
            this.tlpListSewadarGrid = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.grdListSewadars = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.age = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.gender = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_status_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_status_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sub_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.lblPrevGrNo = new System.Windows.Forms.Label();
            this.tlpSewadar = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewadarHeader1 = new DCC.ZOS.ZSM.Controls.Misc.SewadarHeader();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadar_list_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.list_satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.list_centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_list_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.generated_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.report_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_list_use = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_list_other_use = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.other_satsang_centre_sewadars = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.is_other_satsang_centre = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.is_editing_allowed = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.session_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.swd_sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.grdList_full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.swd_satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.swd_sewadar_gr_no = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpBase.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.tlpSewaSamiti.SuspendLayout();
            this.tlpListSewadarGrid.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdListSewadars)).BeginInit();
            this.tlpSewadar.SuspendLayout();
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
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(932, 601);
            this.scListOrBrowse.SplitterDistance = 903;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 5;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4.767184F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.73171F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 44.90022F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 19.5279F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.40773F));
            this.tlpBase.Controls.Add(this.tlpTop, 0, 0);
            this.tlpBase.Controls.Add(this.tlpListSewadarGrid, 0, 3);
            this.tlpBase.Controls.Add(this.tlpSewadar, 0, 2);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 4;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 2F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 37.10482F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 19.80033F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 41.43095F));
            this.tlpBase.Size = new System.Drawing.Size(932, 601);
            this.tlpBase.TabIndex = 0;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 7;
            this.tlpBase.SetColumnSpan(this.tlpTop, 5);
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.36717F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 21.38229F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23.43413F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 22.24622F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 8.531318F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.887689F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.0432F));
            this.tlpTop.Controls.Add(this.txtReportName, 0, 2);
            this.tlpTop.Controls.Add(this.tlpSewaSamiti, 0, 1);
            this.tlpTop.Controls.Add(this.dtGenerated, 3, 2);
            this.tlpTop.Controls.Add(this.intID, 4, 0);
            this.tlpTop.Controls.Add(this.txtListName, 2, 0);
            this.tlpTop.Controls.Add(this.intSessionId, 4, 2);
            this.tlpTop.Controls.Add(this.chkIsEditingAllowed, 5, 2);
            this.tlpTop.Controls.Add(this.txtRemarks, 0, 3);
            this.tlpTop.Controls.Add(this.lkpListSatsangCentre, 1, 0);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(3, 3);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 4;
            this.tlpBase.SetRowSpan(this.tlpTop, 2);
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 22.68518F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25.92593F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 22.22222F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 28.24074F));
            this.tlpTop.Size = new System.Drawing.Size(926, 227);
            this.tlpTop.TabIndex = 3;
            this.tlpTop.TabStop = true;
            // 
            // txtReportName
            // 
            this.txtReportName.AllowsNew = false;
            this.txtReportName.AllowsReference = false;
            this.txtReportName.AllowsUpdate = false;
            this.txtReportName.ApplicationIdForDbConnection = null;
            this.txtReportName.BackColor = System.Drawing.Color.Transparent;
            this.txtReportName.CalledScreenApplicationId = null;
            this.txtReportName.CalledScreenTypeName = null;
            this.txtReportName.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.txtReportName, 3);
            this.txtReportName.DisplayText = "";
            this.txtReportName.DisplayTextBindingKey = "report_nm";
            this.txtReportName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtReportName.EditingControlDataGridView = null;
            this.txtReportName.EditingControlFormattedValue = "";
            this.txtReportName.EditingControlRowIndex = 0;
            this.txtReportName.EditingControlValueChanged = false;
            this.txtReportName.EnableToolTip = false;
            this.txtReportName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtReportName.IdText = null;
            this.txtReportName.IdTextBindingKey = null;
            this.txtReportName.Location = new System.Drawing.Point(4, 113);
            this.txtReportName.Lookup = false;
            this.txtReportName.LookupColumns = null;
            this.txtReportName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtReportName.LookupResult = null;
            this.txtReportName.LookupTitle = "Report Name";
            this.txtReportName.Mandatory = false;
            this.txtReportName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtReportName.MaxCharacterLength = 32767;
            this.txtReportName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtReportName.MinCharactersForQuery = 0;
            this.txtReportName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtReportName.Name = "txtReportName";
            this.txtReportName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtReportName.PascalCase = false;
            this.txtReportName.RangeInQueryMode = false;
            this.txtReportName.ReadOnly = true;
            this.txtReportName.RegularExpressionValidator = null;
            this.txtReportName.Size = new System.Drawing.Size(503, 44);
            this.txtReportName.TabIndex = 0;
            this.txtReportName.TabStop = false;
            this.txtReportName.Title = "Report Name";
            this.txtReportName.ToolTipLookupField = "information";
            this.txtReportName.ValueText = null;
            // 
            // tlpSewaSamiti
            // 
            this.tlpSewaSamiti.ColumnCount = 5;
            this.tlpTop.SetColumnSpan(this.tlpSewaSamiti, 10);
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.897172F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23.69565F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.82609F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 18.26087F));
            this.tlpSewaSamiti.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.21739F));
            this.tlpSewaSamiti.Controls.Add(this.txtOtherUse, 2, 0);
            this.tlpSewaSamiti.Controls.Add(this.chkotherCentreSewadarsAllowed, 3, 0);
            this.tlpSewaSamiti.Controls.Add(this.chkIsManagedByOtherCentre, 4, 0);
            this.tlpSewaSamiti.Controls.Add(this.txtUse, 0, 0);
            this.tlpSewaSamiti.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpSewaSamiti.Location = new System.Drawing.Point(3, 54);
            this.tlpSewaSamiti.Name = "tlpSewaSamiti";
            this.tlpSewaSamiti.RowCount = 1;
            this.tlpSewaSamiti.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpSewaSamiti.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 53F));
            this.tlpSewaSamiti.Size = new System.Drawing.Size(920, 53);
            this.tlpSewaSamiti.TabIndex = 1;
            this.tlpSewaSamiti.TabStop = true;
            // 
            // txtOtherUse
            // 
            this.txtOtherUse.AllowsNew = false;
            this.txtOtherUse.AllowsReference = false;
            this.txtOtherUse.AllowsUpdate = false;
            this.txtOtherUse.ApplicationIdForDbConnection = null;
            this.txtOtherUse.BackColor = System.Drawing.Color.Transparent;
            this.txtOtherUse.CalledScreenApplicationId = null;
            this.txtOtherUse.CalledScreenTypeName = null;
            this.txtOtherUse.CallingScreenType = null;
            this.txtOtherUse.DisplayText = "";
            this.txtOtherUse.DisplayTextBindingKey = "sewadar_list_other_use";
            this.txtOtherUse.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtOtherUse.EditingControlDataGridView = null;
            this.txtOtherUse.EditingControlFormattedValue = "";
            this.txtOtherUse.EditingControlRowIndex = 0;
            this.txtOtherUse.EditingControlValueChanged = false;
            this.txtOtherUse.EnableToolTip = false;
            this.txtOtherUse.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtOtherUse.IdText = null;
            this.txtOtherUse.IdTextBindingKey = null;
            this.txtOtherUse.Location = new System.Drawing.Point(313, 3);
            this.txtOtherUse.Lookup = false;
            this.txtOtherUse.LookupColumns = null;
            this.txtOtherUse.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtOtherUse.LookupResult = null;
            this.txtOtherUse.LookupTitle = "Other Use";
            this.txtOtherUse.Mandatory = false;
            this.txtOtherUse.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtOtherUse.MaxCharacterLength = 32767;
            this.txtOtherUse.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtOtherUse.MinCharactersForQuery = 0;
            this.txtOtherUse.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtOtherUse.Name = "txtOtherUse";
            this.txtOtherUse.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtOtherUse.PascalCase = false;
            this.txtOtherUse.RangeInQueryMode = false;
            this.txtOtherUse.ReadOnly = true;
            this.txtOtherUse.RegularExpressionValidator = null;
            this.txtOtherUse.Size = new System.Drawing.Size(248, 45);
            this.txtOtherUse.TabIndex = 1;
            this.txtOtherUse.TabStop = false;
            this.txtOtherUse.Title = "Other Use";
            this.txtOtherUse.ToolTipLookupField = "information";
            this.txtOtherUse.ValueText = null;
            // 
            // chkotherCentreSewadarsAllowed
            // 
            this.chkotherCentreSewadarsAllowed.AutoSize = true;
            this.chkotherCentreSewadarsAllowed.BackColor = System.Drawing.Color.Transparent;
            this.chkotherCentreSewadarsAllowed.BindingKey = "other_satsang_centre_sewadars";
            this.chkotherCentreSewadarsAllowed.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkotherCentreSewadarsAllowed.Enabled = false;
            this.chkotherCentreSewadarsAllowed.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkotherCentreSewadarsAllowed.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkotherCentreSewadarsAllowed.Location = new System.Drawing.Point(568, 3);
            this.chkotherCentreSewadarsAllowed.Name = "chkotherCentreSewadarsAllowed";
            this.chkotherCentreSewadarsAllowed.Size = new System.Drawing.Size(162, 47);
            this.chkotherCentreSewadarsAllowed.TabIndex = 2;
            this.chkotherCentreSewadarsAllowed.TabStop = false;
            this.chkotherCentreSewadarsAllowed.Text = "Other Centre Sewadars?";
            this.chkotherCentreSewadarsAllowed.UseVisualStyleBackColor = true;
            // 
            // chkIsManagedByOtherCentre
            // 
            this.chkIsManagedByOtherCentre.AutoSize = true;
            this.chkIsManagedByOtherCentre.BackColor = System.Drawing.Color.Transparent;
            this.chkIsManagedByOtherCentre.BindingKey = "is_other_satsang_centre";
            this.chkIsManagedByOtherCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIsManagedByOtherCentre.Enabled = false;
            this.chkIsManagedByOtherCentre.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkIsManagedByOtherCentre.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkIsManagedByOtherCentre.Location = new System.Drawing.Point(736, 3);
            this.chkIsManagedByOtherCentre.Name = "chkIsManagedByOtherCentre";
            this.chkIsManagedByOtherCentre.Size = new System.Drawing.Size(181, 47);
            this.chkIsManagedByOtherCentre.TabIndex = 3;
            this.chkIsManagedByOtherCentre.TabStop = false;
            this.chkIsManagedByOtherCentre.Text = "Managed by other centre(s)?";
            this.chkIsManagedByOtherCentre.UseVisualStyleBackColor = true;
            // 
            // txtUse
            // 
            this.txtUse.AllowsNew = false;
            this.txtUse.AllowsReference = false;
            this.txtUse.AllowsUpdate = false;
            this.txtUse.ApplicationIdForDbConnection = null;
            this.txtUse.BackColor = System.Drawing.Color.Transparent;
            this.txtUse.CalledScreenApplicationId = null;
            this.txtUse.CalledScreenTypeName = null;
            this.txtUse.CallingScreenType = null;
            this.tlpSewaSamiti.SetColumnSpan(this.txtUse, 2);
            this.txtUse.DisplayText = "";
            this.txtUse.DisplayTextBindingKey = "sewadar_list_use";
            this.txtUse.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtUse.EditingControlDataGridView = null;
            this.txtUse.EditingControlFormattedValue = "";
            this.txtUse.EditingControlRowIndex = 0;
            this.txtUse.EditingControlValueChanged = false;
            this.txtUse.EnableToolTip = false;
            this.txtUse.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtUse.IdText = null;
            this.txtUse.IdTextBindingKey = null;
            this.txtUse.Location = new System.Drawing.Point(4, 3);
            this.txtUse.Lookup = false;
            this.txtUse.LookupColumns = null;
            this.txtUse.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtUse.LookupResult = null;
            this.txtUse.LookupTitle = "Use";
            this.txtUse.Mandatory = false;
            this.txtUse.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtUse.MaxCharacterLength = 32767;
            this.txtUse.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtUse.MinCharactersForQuery = 0;
            this.txtUse.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtUse.Name = "txtUse";
            this.txtUse.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtUse.PascalCase = false;
            this.txtUse.RangeInQueryMode = false;
            this.txtUse.ReadOnly = true;
            this.txtUse.RegularExpressionValidator = null;
            this.txtUse.Size = new System.Drawing.Size(301, 45);
            this.txtUse.TabIndex = 4;
            this.txtUse.TabStop = false;
            this.txtUse.Title = "Use";
            this.txtUse.ToolTipLookupField = "information";
            this.txtUse.ValueText = null;
            // 
            // dtGenerated
            // 
            this.dtGenerated.AllowFutureDate = true;
            this.dtGenerated.AllowsNew = false;
            this.dtGenerated.AllowsReference = false;
            this.dtGenerated.AllowsUpdate = false;
            this.dtGenerated.ApplicationIdForDbConnection = null;
            this.dtGenerated.BackColor = System.Drawing.Color.Transparent;
            this.dtGenerated.CalledScreenApplicationId = null;
            this.dtGenerated.CalledScreenTypeName = null;
            this.dtGenerated.CallingScreenType = null;
            this.dtGenerated.DisplayText = null;
            this.dtGenerated.DisplayTextAsDateTime = null;
            this.dtGenerated.DisplayTextBindingKey = "generated_dtm";
            this.dtGenerated.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtGenerated.EditingControlDataGridView = null;
            this.dtGenerated.EditingControlFormattedValue = null;
            this.dtGenerated.EditingControlRowIndex = 0;
            this.dtGenerated.EditingControlValueChanged = false;
            this.dtGenerated.Enabled = false;
            this.dtGenerated.EnableToolTip = false;
            this.dtGenerated.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtGenerated.IdText = "";
            this.dtGenerated.IdTextBindingKey = null;
            this.dtGenerated.Location = new System.Drawing.Point(515, 113);
            this.dtGenerated.Lookup = true;
            this.dtGenerated.LookupColumns = null;
            this.dtGenerated.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtGenerated.LookupResult = null;
            this.dtGenerated.LookupTitle = "Generated Date";
            this.dtGenerated.Mandatory = false;
            this.dtGenerated.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtGenerated.MaxCharacterLength = 20;
            this.dtGenerated.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtGenerated.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtGenerated.MinCharactersForQuery = 0;
            this.dtGenerated.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtGenerated.MinValue = new System.DateTime(((long)(0)));
            this.dtGenerated.Name = "dtGenerated";
            this.dtGenerated.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtGenerated.PascalCase = false;
            this.dtGenerated.RangeInQueryMode = true;
            this.dtGenerated.ReadOnly = true;
            this.dtGenerated.RegularExpressionValidator = null;
            this.dtGenerated.ShowTime = true;
            this.dtGenerated.Size = new System.Drawing.Size(198, 44);
            this.dtGenerated.TabIndex = 1;
            this.dtGenerated.TabStop = false;
            this.dtGenerated.Title = "Generated Date";
            this.dtGenerated.ToolTipLookupField = "information";
            this.dtGenerated.ValueText = "";
            // 
            // intID
            // 
            this.intID.AllowsNew = false;
            this.intID.AllowsReference = false;
            this.intID.AllowsUpdate = false;
            this.intID.ApplicationIdForDbConnection = null;
            this.intID.BackColor = System.Drawing.Color.Transparent;
            this.intID.CalledScreenApplicationId = null;
            this.intID.CalledScreenTypeName = null;
            this.intID.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.intID, 2);
            this.intID.DisplayText = "";
            this.intID.DisplayTextBindingKey = "sewadar_list_id";
            this.intID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intID.EditingControlDataGridView = null;
            this.intID.EditingControlFormattedValue = "";
            this.intID.EditingControlRowIndex = 0;
            this.intID.EditingControlValueChanged = false;
            this.intID.EnableToolTip = false;
            this.intID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intID.IdText = null;
            this.intID.IdTextBindingKey = null;
            this.intID.Location = new System.Drawing.Point(721, 3);
            this.intID.Lookup = false;
            this.intID.LookupColumns = null;
            this.intID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intID.LookupResult = null;
            this.intID.LookupTitle = "ID";
            this.intID.Mandatory = false;
            this.intID.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intID.MaxCharacterLength = 32767;
            this.intID.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intID.MaxValue = ((long)(9223372036854775807));
            this.intID.MinCharactersForQuery = 0;
            this.intID.MinimumSize = new System.Drawing.Size(10, 22);
            this.intID.MinValue = ((long)(-9223372036854775808));
            this.intID.Name = "intID";
            this.intID.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intID.PascalCase = false;
            this.intID.RangeInQueryMode = false;
            this.intID.ReadOnly = true;
            this.intID.RegularExpressionValidator = null;
            this.intID.Size = new System.Drawing.Size(107, 45);
            this.intID.TabIndex = 88;
            this.intID.TabStop = false;
            this.intID.Title = "ID";
            this.intID.ToolTipLookupField = "information";
            this.intID.ValueText = null;
            // 
            // txtListName
            // 
            this.txtListName.AllowsNew = false;
            this.txtListName.AllowsReference = false;
            this.txtListName.AllowsUpdate = false;
            this.txtListName.ApplicationIdForDbConnection = null;
            this.txtListName.BackColor = System.Drawing.Color.Transparent;
            this.txtListName.CalledScreenApplicationId = null;
            this.txtListName.CalledScreenTypeName = null;
            this.txtListName.CallingScreenType = null;
            this.tlpTop.SetColumnSpan(this.txtListName, 2);
            this.txtListName.DisplayText = "";
            this.txtListName.DisplayTextBindingKey = "sewadar_list_nm";
            this.txtListName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtListName.EditingControlDataGridView = null;
            this.txtListName.EditingControlFormattedValue = null;
            this.txtListName.EditingControlRowIndex = 0;
            this.txtListName.EditingControlValueChanged = false;
            this.txtListName.EnableToolTip = false;
            this.txtListName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtListName.IdText = "";
            this.txtListName.IdTextBindingKey = "sewadar_list_id";
            this.txtListName.Location = new System.Drawing.Point(298, 3);
            this.txtListName.Lookup = true;
            this.txtListName.LookupColumns = resources.GetString("txtListName.LookupColumns");
            this.txtListName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtListName.LookupResult = null;
            this.txtListName.LookupTitle = "List Name";
            this.txtListName.Mandatory = true;
            this.txtListName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtListName.MaxCharacterLength = 32767;
            this.txtListName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtListName.MinCharactersForQuery = 0;
            this.txtListName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtListName.Name = "txtListName";
            this.txtListName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtListName.PascalCase = false;
            this.txtListName.RangeInQueryMode = false;
            this.txtListName.ReadOnly = false;
            this.txtListName.RegularExpressionValidator = null;
            this.txtListName.Size = new System.Drawing.Size(415, 45);
            this.txtListName.TabIndex = 0;
            this.txtListName.Title = "List Name";
            this.txtListName.ToolTipLookupField = "information";
            this.txtListName.ValueText = "";
            this.txtListName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.txtListName_LookupDialogShowing);
            this.txtListName.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.txtListName_LookupResultSet);
            // 
            // intSessionId
            // 
            this.intSessionId.AllowsNew = false;
            this.intSessionId.AllowsReference = false;
            this.intSessionId.AllowsUpdate = false;
            this.intSessionId.ApplicationIdForDbConnection = null;
            this.intSessionId.BackColor = System.Drawing.Color.Transparent;
            this.intSessionId.CalledScreenApplicationId = null;
            this.intSessionId.CalledScreenTypeName = null;
            this.intSessionId.CallingScreenType = null;
            this.intSessionId.DisplayText = "";
            this.intSessionId.DisplayTextBindingKey = null;
            this.intSessionId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intSessionId.EditingControlDataGridView = null;
            this.intSessionId.EditingControlFormattedValue = "";
            this.intSessionId.EditingControlRowIndex = 0;
            this.intSessionId.EditingControlValueChanged = false;
            this.intSessionId.EnableToolTip = false;
            this.intSessionId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSessionId.IdText = null;
            this.intSessionId.IdTextBindingKey = null;
            this.intSessionId.Location = new System.Drawing.Point(721, 113);
            this.intSessionId.Lookup = false;
            this.intSessionId.LookupColumns = null;
            this.intSessionId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intSessionId.LookupResult = null;
            this.intSessionId.LookupTitle = "Session ID";
            this.intSessionId.Mandatory = false;
            this.intSessionId.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intSessionId.MaxCharacterLength = 32767;
            this.intSessionId.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intSessionId.MaxValue = ((long)(9223372036854775807));
            this.intSessionId.MinCharactersForQuery = 0;
            this.intSessionId.MinimumSize = new System.Drawing.Size(10, 22);
            this.intSessionId.MinValue = ((long)(-9223372036854775808));
            this.intSessionId.Name = "intSessionId";
            this.intSessionId.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intSessionId.PascalCase = false;
            this.intSessionId.RangeInQueryMode = false;
            this.intSessionId.ReadOnly = true;
            this.intSessionId.RegularExpressionValidator = null;
            this.intSessionId.Size = new System.Drawing.Size(71, 44);
            this.intSessionId.TabIndex = 92;
            this.intSessionId.TabStop = false;
            this.intSessionId.Title = "Session ID";
            this.intSessionId.ToolTipLookupField = "information";
            this.intSessionId.ValueText = null;
            // 
            // chkIsEditingAllowed
            // 
            this.chkIsEditingAllowed.AutoSize = true;
            this.chkIsEditingAllowed.BackColor = System.Drawing.Color.Transparent;
            this.chkIsEditingAllowed.BindingKey = "is_editing_allowed";
            this.tlpTop.SetColumnSpan(this.chkIsEditingAllowed, 2);
            this.chkIsEditingAllowed.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIsEditingAllowed.Enabled = false;
            this.chkIsEditingAllowed.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkIsEditingAllowed.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkIsEditingAllowed.Location = new System.Drawing.Point(799, 113);
            this.chkIsEditingAllowed.Name = "chkIsEditingAllowed";
            this.chkIsEditingAllowed.Size = new System.Drawing.Size(124, 44);
            this.chkIsEditingAllowed.TabIndex = 93;
            this.chkIsEditingAllowed.TabStop = false;
            this.chkIsEditingAllowed.Text = "Editing Allowed?";
            this.chkIsEditingAllowed.UseVisualStyleBackColor = true;
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
            this.tlpTop.SetColumnSpan(this.txtRemarks, 7);
            this.txtRemarks.DisplayText = "";
            this.txtRemarks.DisplayTextBindingKey = "remarks";
            this.txtRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRemarks.EditingControlDataGridView = null;
            this.txtRemarks.EditingControlFormattedValue = "";
            this.txtRemarks.EditingControlRowIndex = 0;
            this.txtRemarks.EditingControlValueChanged = false;
            this.txtRemarks.EnableToolTip = false;
            this.txtRemarks.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRemarks.IdText = null;
            this.txtRemarks.IdTextBindingKey = null;
            this.txtRemarks.Location = new System.Drawing.Point(4, 163);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.LookupTitle = "Remarks";
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtRemarks.MaxCharacterLength = 32767;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtRemarks.MinCharactersForQuery = 0;
            this.txtRemarks.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = true;
            this.txtRemarks.RegularExpressionValidator = null;
            this.txtRemarks.Size = new System.Drawing.Size(918, 45);
            this.txtRemarks.TabIndex = 94;
            this.txtRemarks.TabStop = false;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
            // 
            // lkpListSatsangCentre
            // 
            this.lkpListSatsangCentre.AllowsNew = false;
            this.lkpListSatsangCentre.AllowsReference = false;
            this.lkpListSatsangCentre.AllowsUpdate = false;
            this.lkpListSatsangCentre.ApplicationIdForDbConnection = null;
            this.lkpListSatsangCentre.BackColor = System.Drawing.Color.Transparent;
            this.lkpListSatsangCentre.CalledScreenApplicationId = null;
            this.lkpListSatsangCentre.CalledScreenTypeName = null;
            this.lkpListSatsangCentre.CallingScreenType = null;
            this.lkpListSatsangCentre.DisplayText = "";
            this.lkpListSatsangCentre.DisplayTextBindingKey = "list_centre_nm";
            this.lkpListSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpListSatsangCentre.EditingControlDataGridView = null;
            this.lkpListSatsangCentre.EditingControlFormattedValue = null;
            this.lkpListSatsangCentre.EditingControlRowIndex = 0;
            this.lkpListSatsangCentre.EditingControlValueChanged = true;
            this.lkpListSatsangCentre.EnableToolTip = false;
            this.lkpListSatsangCentre.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lkpListSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpListSatsangCentre.IdText = "";
            this.lkpListSatsangCentre.IdTextBindingKey = "list_satsang_centre_id";
            this.lkpListSatsangCentre.Location = new System.Drawing.Point(100, 3);
            this.lkpListSatsangCentre.Lookup = true;
            this.lkpListSatsangCentre.LookupColumns = resources.GetString("lkpListSatsangCentre.LookupColumns");
            this.lkpListSatsangCentre.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpListSatsangCentre.LookupResult = null;
            this.lkpListSatsangCentre.LookupTitle = "Title";
            this.lkpListSatsangCentre.Mandatory = true;
            this.lkpListSatsangCentre.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.lkpListSatsangCentre.MaxCharacterLength = 32767;
            this.lkpListSatsangCentre.MaximumSize = new System.Drawing.Size(1300, 45);
            this.lkpListSatsangCentre.MinCharactersForQuery = 0;
            this.lkpListSatsangCentre.MinimumSize = new System.Drawing.Size(10, 22);
            this.lkpListSatsangCentre.Name = "lkpListSatsangCentre";
            this.lkpListSatsangCentre.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lkpListSatsangCentre.PascalCase = false;
            this.lkpListSatsangCentre.RangeInQueryMode = false;
            this.lkpListSatsangCentre.ReadOnly = true;
            this.lkpListSatsangCentre.RegularExpressionValidator = null;
            this.lkpListSatsangCentre.Size = new System.Drawing.Size(190, 45);
            this.lkpListSatsangCentre.TabIndex = 95;
            this.lkpListSatsangCentre.TabStop = false;
            this.lkpListSatsangCentre.Title = "Satsang Centre";
            this.lkpListSatsangCentre.ToolTipLookupField = "information";
            this.lkpListSatsangCentre.ValueText = "";
            this.lkpListSatsangCentre.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lkpListSatsangCentre_LookupDialogShowing);
            this.lkpListSatsangCentre.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.lkpListSatsangCentre_LookupResultSet);
            // 
            // tlpListSewadarGrid
            // 
            this.tlpListSewadarGrid.ColumnCount = 3;
            this.tlpBase.SetColumnSpan(this.tlpListSewadarGrid, 5);
            this.tlpListSewadarGrid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tlpListSewadarGrid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tlpListSewadarGrid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tlpListSewadarGrid.Controls.Add(this.grdListSewadars, 0, 0);
            this.tlpListSewadarGrid.Controls.Add(this.lblPrevGrNo, 1, 1);
            this.tlpListSewadarGrid.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpListSewadarGrid.Location = new System.Drawing.Point(3, 354);
            this.tlpListSewadarGrid.Name = "tlpListSewadarGrid";
            this.tlpListSewadarGrid.RowCount = 2;
            this.tlpListSewadarGrid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 90F));
            this.tlpListSewadarGrid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tlpListSewadarGrid.Size = new System.Drawing.Size(926, 244);
            this.tlpListSewadarGrid.TabIndex = 2;
            // 
            // grdListSewadars
            // 
            this.grdListSewadars.AllowRowSorting = false;
            this.grdListSewadars.AllowUserToAddRows = false;
            this.grdListSewadars.AutoAddNewRowForUser = false;
            this.grdListSewadars.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdListSewadars.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.satsang_centre_id,
            this.centre_nm,
            this.sewadar_grno,
            this.full_nm,
            this.sewadar_id,
            this.age,
            this.gender,
            this.sewadar_status_nm,
            this.sewadar_status_dtm,
            this.department_nm,
            this.sub_department_nm});
            this.tlpListSewadarGrid.SetColumnSpan(this.grdListSewadars, 3);
            this.grdListSewadars.DeleteRowMenuEnabled = true;
            this.grdListSewadars.DeleteVisible = true;
            this.grdListSewadars.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdListSewadars.ExportToExcelVisible = false;
            this.grdListSewadars.InsertAfterVisible = false;
            this.grdListSewadars.InsertBeforeVisible = false;
            this.grdListSewadars.InsertLastVisible = false;
            this.grdListSewadars.InsertRowsMenuItemsEnabled = true;
            this.grdListSewadars.Location = new System.Drawing.Point(3, 3);
            this.grdListSewadars.Mandatory = false;
            this.grdListSewadars.MoveDownVisible = false;
            this.grdListSewadars.MoveUpVisible = false;
            this.grdListSewadars.MultiSelect = false;
            this.grdListSewadars.Name = "grdListSewadars";
            this.grdListSewadars.RowHeadersWidth = 15;
            this.grdListSewadars.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdListSewadars.ShowCommandStrip = true;
            this.grdListSewadars.Size = new System.Drawing.Size(920, 213);
            this.grdListSewadars.TabIndex = 2;
            this.grdListSewadars.Title = null;
            this.grdListSewadars.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdListSewadars.VirtualMode = true;
            this.grdListSewadars.RowDeleting += new System.EventHandler<DCC.UMB.CDF.UIControls.Grid.RowDeletingEventArgs>(this.grdListSewadars_RowDeleting);
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = null;
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle1;
            this.satsang_centre_id.HeaderText = "Satsang Centre ID";
            this.satsang_centre_id.Lookup = false;
            this.satsang_centre_id.LookupColumns = "";
            this.satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.satsang_centre_id.Mandatory = false;
            this.satsang_centre_id.MaxValue = ((long)(9223372036854775807));
            this.satsang_centre_id.MinValue = ((long)(-9223372036854775808));
            this.satsang_centre_id.Name = "satsang_centre_id";
            this.satsang_centre_id.PercentageWidth = 25F;
            this.satsang_centre_id.ReadOnly = true;
            this.satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.satsang_centre_id.ToolTipLookupField = "information";
            this.satsang_centre_id.Visible = false;
            // 
            // centre_nm
            // 
            this.centre_nm.BindingKey = null;
            this.centre_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.centre_nm.HeaderText = "Centre";
            this.centre_nm.Lookup = false;
            this.centre_nm.LookupColumns = "";
            this.centre_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.centre_nm.Mandatory = false;
            this.centre_nm.MaxCharacterLength = 2147483647;
            this.centre_nm.Name = "centre_nm";
            this.centre_nm.PercentageWidth = 5F;
            this.centre_nm.ReadOnly = true;
            this.centre_nm.RegularExpressionValidator = "";
            this.centre_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.centre_nm.ToolTipLookupField = "information";
            this.centre_nm.Width = 45;
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
            this.sewadar_grno.PercentageWidth = 7F;
            this.sewadar_grno.ReadOnly = true;
            this.sewadar_grno.RegularExpressionValidator = "";
            this.sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno.ToolTipLookupField = "information";
            this.sewadar_grno.Width = 63;
            // 
            // full_nm
            // 
            this.full_nm.BindingKey = null;
            this.full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.full_nm.HeaderText = "Full Name";
            this.full_nm.Lookup = false;
            this.full_nm.LookupColumns = "";
            this.full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.full_nm.Mandatory = false;
            this.full_nm.MaxCharacterLength = 2147483647;
            this.full_nm.Name = "full_nm";
            this.full_nm.PercentageWidth = 28F;
            this.full_nm.ReadOnly = true;
            this.full_nm.RegularExpressionValidator = "";
            this.full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.full_nm.ToolTipLookupField = "information";
            this.full_nm.Width = 253;
            // 
            // sewadar_id
            // 
            this.sewadar_id.BindingKey = "sewadar_id";
            this.sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewadar_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.sewadar_id.HeaderText = "ID";
            this.sewadar_id.Lookup = false;
            this.sewadar_id.LookupColumns = "";
            this.sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_id.Mandatory = false;
            this.sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.sewadar_id.Name = "sewadar_id";
            this.sewadar_id.PercentageWidth = 5F;
            this.sewadar_id.ReadOnly = true;
            this.sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_id.ToolTipLookupField = "information";
            this.sewadar_id.Width = 45;
            // 
            // age
            // 
            this.age.BindingKey = "age";
            this.age.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.age.DefaultCellStyle = dataGridViewCellStyle3;
            this.age.HeaderText = "Age(Yrs)";
            this.age.Lookup = false;
            this.age.LookupColumns = "";
            this.age.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.age.Mandatory = false;
            this.age.MaxValue = ((long)(9223372036854775807));
            this.age.MinValue = ((long)(-9223372036854775808));
            this.age.Name = "age";
            this.age.PercentageWidth = 5F;
            this.age.ReadOnly = true;
            this.age.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.age.ToolTipLookupField = "information";
            this.age.Width = 45;
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
            this.gender.PercentageWidth = 5F;
            this.gender.ReadOnly = true;
            this.gender.RegularExpressionValidator = "";
            this.gender.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gender.ToolTipLookupField = "information";
            this.gender.Width = 45;
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
            this.sewadar_status_nm.Width = 90;
            // 
            // sewadar_status_dtm
            // 
            this.sewadar_status_dtm.BindingKey = "sewadar_status_dtm";
            this.sewadar_status_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_status_dtm.HeaderText = "Status Date";
            this.sewadar_status_dtm.Lookup = false;
            this.sewadar_status_dtm.LookupColumns = "";
            this.sewadar_status_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_dtm.Mandatory = false;
            this.sewadar_status_dtm.MaxCharacterLength = 2147483647;
            this.sewadar_status_dtm.Name = "sewadar_status_dtm";
            this.sewadar_status_dtm.PercentageWidth = 10F;
            this.sewadar_status_dtm.ReadOnly = true;
            this.sewadar_status_dtm.RegularExpressionValidator = "";
            this.sewadar_status_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_dtm.ToolTipLookupField = "information";
            this.sewadar_status_dtm.Width = 90;
            // 
            // department_nm
            // 
            this.department_nm.BindingKey = "department";
            this.department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.department_nm.HeaderText = "Department";
            this.department_nm.Lookup = false;
            this.department_nm.LookupColumns = "";
            this.department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_nm.Mandatory = false;
            this.department_nm.MaxCharacterLength = 2147483647;
            this.department_nm.Name = "department_nm";
            this.department_nm.PercentageWidth = 12F;
            this.department_nm.ReadOnly = true;
            this.department_nm.RegularExpressionValidator = "";
            this.department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_nm.ToolTipLookupField = "information";
            this.department_nm.Width = 108;
            // 
            // sub_department_nm
            // 
            this.sub_department_nm.BindingKey = null;
            this.sub_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sub_department_nm.HeaderText = "Sub Department";
            this.sub_department_nm.Lookup = false;
            this.sub_department_nm.LookupColumns = "";
            this.sub_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sub_department_nm.Mandatory = false;
            this.sub_department_nm.MaxCharacterLength = 2147483647;
            this.sub_department_nm.Name = "sub_department_nm";
            this.sub_department_nm.PercentageWidth = 12F;
            this.sub_department_nm.ReadOnly = true;
            this.sub_department_nm.RegularExpressionValidator = "";
            this.sub_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sub_department_nm.ToolTipLookupField = "information";
            this.sub_department_nm.Width = 108;
            // 
            // lblPrevGrNo
            // 
            this.lblPrevGrNo.AutoSize = true;
            this.lblPrevGrNo.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPrevGrNo.ForeColor = System.Drawing.Color.Green;
            this.lblPrevGrNo.Location = new System.Drawing.Point(373, 219);
            this.lblPrevGrNo.Name = "lblPrevGrNo";
            this.lblPrevGrNo.Size = new System.Drawing.Size(0, 18);
            this.lblPrevGrNo.TabIndex = 0;
            // 
            // tlpSewadar
            // 
            this.tlpSewadar.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Inset;
            this.tlpSewadar.ColumnCount = 1;
            this.tlpBase.SetColumnSpan(this.tlpSewadar, 5);
            this.tlpSewadar.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpSewadar.Controls.Add(this.sewadarHeader1, 0, 0);
            this.tlpSewadar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpSewadar.Location = new System.Drawing.Point(3, 236);
            this.tlpSewadar.Name = "tlpSewadar";
            this.tlpSewadar.RowCount = 1;
            this.tlpSewadar.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpSewadar.Size = new System.Drawing.Size(926, 112);
            this.tlpSewadar.TabIndex = 4;
            // 
            // sewadarHeader1
            // 
            this.sewadarHeader1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarHeader1.Location = new System.Drawing.Point(5, 5);
            this.sewadarHeader1.Name = "sewadarHeader1";
            this.sewadarHeader1.SatsangCentreId = 6015;
            this.sewadarHeader1.Size = new System.Drawing.Size(916, 102);
            this.sewadarHeader1.SttsCode = null;
            this.sewadarHeader1.TabIndex = 0;
            this.sewadarHeader1.UseFocusLostEvent = false;
            this.sewadarHeader1.SewadarSelectionChanged += new System.EventHandler<DCC.ZOS.ZSM.Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs>(this.sewadarHeader1_SewadarSelectionChanged);
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewadar_list_id,
            this.list_satsang_centre_id,
            this.list_centre_nm,
            this.sewadar_list_nm,
            this.generated_dtm,
            this.report_nm,
            this.sewadar_list_use,
            this.sewadar_list_other_use,
            this.other_satsang_centre_sewadars,
            this.is_other_satsang_centre,
            this.is_editing_allowed,
            this.remarks,
            this.session_id,
            this.swd_sewadar_id,
            this.grdList_full_nm,
            this.swd_satsang_centre_id,
            this.swd_sewadar_gr_no});
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
            this.grdList.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(96, 100);
            this.grdList.TabIndex = 1;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // sewadar_list_id
            // 
            this.sewadar_list_id.BindingKey = "sewadar_list_id";
            this.sewadar_list_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewadar_list_id.DefaultCellStyle = dataGridViewCellStyle4;
            this.sewadar_list_id.HeaderText = "Sewadar List Id";
            this.sewadar_list_id.Lookup = false;
            this.sewadar_list_id.LookupColumns = "";
            this.sewadar_list_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_list_id.Mandatory = false;
            this.sewadar_list_id.MaxValue = ((long)(9223372036854775807));
            this.sewadar_list_id.MinValue = ((long)(-9223372036854775808));
            this.sewadar_list_id.Name = "sewadar_list_id";
            this.sewadar_list_id.PercentageWidth = 20F;
            this.sewadar_list_id.ReadOnly = true;
            this.sewadar_list_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_list_id.ToolTipLookupField = "information";
            this.sewadar_list_id.Visible = false;
            this.sewadar_list_id.Width = 16;
            // 
            // list_satsang_centre_id
            // 
            this.list_satsang_centre_id.BindingKey = "list_satsang_centre_id";
            this.list_satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.list_satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle5;
            this.list_satsang_centre_id.HeaderText = "Satsang Centre Id";
            this.list_satsang_centre_id.Lookup = false;
            this.list_satsang_centre_id.LookupColumns = "";
            this.list_satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.list_satsang_centre_id.Mandatory = false;
            this.list_satsang_centre_id.MaxValue = ((long)(9223372036854775807));
            this.list_satsang_centre_id.MinValue = ((long)(-9223372036854775808));
            this.list_satsang_centre_id.Name = "list_satsang_centre_id";
            this.list_satsang_centre_id.PercentageWidth = 25F;
            this.list_satsang_centre_id.ReadOnly = true;
            this.list_satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.list_satsang_centre_id.ToolTipLookupField = "information";
            this.list_satsang_centre_id.Visible = false;
            this.list_satsang_centre_id.Width = 5;
            // 
            // list_centre_nm
            // 
            this.list_centre_nm.BindingKey = "list_centre_nm";
            this.list_centre_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.list_centre_nm.HeaderText = "Centre Name";
            this.list_centre_nm.Lookup = false;
            this.list_centre_nm.LookupColumns = "";
            this.list_centre_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.list_centre_nm.Mandatory = false;
            this.list_centre_nm.MaxCharacterLength = 2147483647;
            this.list_centre_nm.Name = "list_centre_nm";
            this.list_centre_nm.PercentageWidth = 25F;
            this.list_centre_nm.ReadOnly = true;
            this.list_centre_nm.RegularExpressionValidator = "";
            this.list_centre_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.list_centre_nm.ToolTipLookupField = "information";
            this.list_centre_nm.Visible = false;
            this.list_centre_nm.Width = 5;
            // 
            // sewadar_list_nm
            // 
            this.sewadar_list_nm.BindingKey = "sewadar_list_nm";
            this.sewadar_list_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_list_nm.HeaderText = "Sewadar List Name";
            this.sewadar_list_nm.Lookup = false;
            this.sewadar_list_nm.LookupColumns = "";
            this.sewadar_list_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_list_nm.Mandatory = false;
            this.sewadar_list_nm.MaxCharacterLength = 2147483647;
            this.sewadar_list_nm.Name = "sewadar_list_nm";
            this.sewadar_list_nm.PercentageWidth = 20F;
            this.sewadar_list_nm.ReadOnly = true;
            this.sewadar_list_nm.RegularExpressionValidator = "";
            this.sewadar_list_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_list_nm.ToolTipLookupField = "information";
            this.sewadar_list_nm.Width = 16;
            // 
            // generated_dtm
            // 
            this.generated_dtm.BindingKey = "generated_dtm";
            this.generated_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.generated_dtm.DefaultCellStyle = dataGridViewCellStyle6;
            this.generated_dtm.HeaderText = "Generated Date";
            this.generated_dtm.Lookup = false;
            this.generated_dtm.LookupColumns = "";
            this.generated_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.generated_dtm.Mandatory = false;
            this.generated_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.generated_dtm.MinValue = new System.DateTime(((long)(0)));
            this.generated_dtm.Name = "generated_dtm";
            this.generated_dtm.PercentageWidth = 25F;
            this.generated_dtm.ReadOnly = true;
            this.generated_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.generated_dtm.ToolTipLookupField = "information";
            this.generated_dtm.Visible = false;
            this.generated_dtm.Width = 20;
            // 
            // report_nm
            // 
            this.report_nm.BindingKey = "report_nm";
            this.report_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.report_nm.HeaderText = "Report Name";
            this.report_nm.Lookup = false;
            this.report_nm.LookupColumns = "";
            this.report_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.report_nm.Mandatory = false;
            this.report_nm.MaxCharacterLength = 2147483647;
            this.report_nm.Name = "report_nm";
            this.report_nm.PercentageWidth = 25F;
            this.report_nm.ReadOnly = true;
            this.report_nm.RegularExpressionValidator = "";
            this.report_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.report_nm.ToolTipLookupField = "information";
            this.report_nm.Visible = false;
            this.report_nm.Width = 20;
            // 
            // sewadar_list_use
            // 
            this.sewadar_list_use.BindingKey = "sewadar_list_use";
            this.sewadar_list_use.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_list_use.HeaderText = "Use";
            this.sewadar_list_use.Lookup = false;
            this.sewadar_list_use.LookupColumns = "";
            this.sewadar_list_use.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_list_use.Mandatory = false;
            this.sewadar_list_use.MaxCharacterLength = 2147483647;
            this.sewadar_list_use.Name = "sewadar_list_use";
            this.sewadar_list_use.PercentageWidth = 20F;
            this.sewadar_list_use.ReadOnly = true;
            this.sewadar_list_use.RegularExpressionValidator = "";
            this.sewadar_list_use.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_list_use.ToolTipLookupField = "information";
            this.sewadar_list_use.Width = 16;
            // 
            // sewadar_list_other_use
            // 
            this.sewadar_list_other_use.BindingKey = "sewadar_list_other_use";
            this.sewadar_list_other_use.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_list_other_use.HeaderText = "sewadar_list_other_use";
            this.sewadar_list_other_use.Lookup = false;
            this.sewadar_list_other_use.LookupColumns = "";
            this.sewadar_list_other_use.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_list_other_use.Mandatory = false;
            this.sewadar_list_other_use.MaxCharacterLength = 2147483647;
            this.sewadar_list_other_use.Name = "sewadar_list_other_use";
            this.sewadar_list_other_use.PercentageWidth = 25F;
            this.sewadar_list_other_use.ReadOnly = true;
            this.sewadar_list_other_use.RegularExpressionValidator = "";
            this.sewadar_list_other_use.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_list_other_use.ToolTipLookupField = "information";
            this.sewadar_list_other_use.Visible = false;
            // 
            // other_satsang_centre_sewadars
            // 
            this.other_satsang_centre_sewadars.BindingKey = "other_satsang_centre_sewadars";
            this.other_satsang_centre_sewadars.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.other_satsang_centre_sewadars.DefaultCellStyle = dataGridViewCellStyle7;
            this.other_satsang_centre_sewadars.HeaderText = "other_satsang_centre_sewadars";
            this.other_satsang_centre_sewadars.Lookup = false;
            this.other_satsang_centre_sewadars.LookupColumns = "";
            this.other_satsang_centre_sewadars.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.other_satsang_centre_sewadars.Mandatory = false;
            this.other_satsang_centre_sewadars.Name = "other_satsang_centre_sewadars";
            this.other_satsang_centre_sewadars.PercentageWidth = 25F;
            this.other_satsang_centre_sewadars.ReadOnly = true;
            this.other_satsang_centre_sewadars.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.other_satsang_centre_sewadars.ToolTipLookupField = "information";
            this.other_satsang_centre_sewadars.Visible = false;
            // 
            // is_other_satsang_centre
            // 
            this.is_other_satsang_centre.BindingKey = "is_other_satsang_centre";
            this.is_other_satsang_centre.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_other_satsang_centre.DefaultCellStyle = dataGridViewCellStyle8;
            this.is_other_satsang_centre.HeaderText = "is_other_satsang_centre";
            this.is_other_satsang_centre.Lookup = false;
            this.is_other_satsang_centre.LookupColumns = "";
            this.is_other_satsang_centre.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_other_satsang_centre.Mandatory = false;
            this.is_other_satsang_centre.Name = "is_other_satsang_centre";
            this.is_other_satsang_centre.PercentageWidth = 25F;
            this.is_other_satsang_centre.ReadOnly = true;
            this.is_other_satsang_centre.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_other_satsang_centre.ToolTipLookupField = "information";
            this.is_other_satsang_centre.Visible = false;
            // 
            // is_editing_allowed
            // 
            this.is_editing_allowed.BindingKey = "is_editing_allowed";
            this.is_editing_allowed.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_editing_allowed.DefaultCellStyle = dataGridViewCellStyle9;
            this.is_editing_allowed.HeaderText = "is_editing_allowed";
            this.is_editing_allowed.Lookup = false;
            this.is_editing_allowed.LookupColumns = "";
            this.is_editing_allowed.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_editing_allowed.Mandatory = false;
            this.is_editing_allowed.Name = "is_editing_allowed";
            this.is_editing_allowed.PercentageWidth = 25F;
            this.is_editing_allowed.ReadOnly = true;
            this.is_editing_allowed.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_editing_allowed.ToolTipLookupField = "information";
            this.is_editing_allowed.Visible = false;
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
            this.remarks.PercentageWidth = 25F;
            this.remarks.ReadOnly = true;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Visible = false;
            // 
            // session_id
            // 
            this.session_id.BindingKey = "session_id";
            this.session_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.session_id.DefaultCellStyle = dataGridViewCellStyle10;
            this.session_id.HeaderText = "session_id";
            this.session_id.Lookup = false;
            this.session_id.LookupColumns = "";
            this.session_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.session_id.Mandatory = false;
            this.session_id.MaxValue = ((long)(9223372036854775807));
            this.session_id.MinValue = ((long)(-9223372036854775808));
            this.session_id.Name = "session_id";
            this.session_id.PercentageWidth = 25F;
            this.session_id.ReadOnly = true;
            this.session_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.session_id.ToolTipLookupField = "information";
            this.session_id.Visible = false;
            // 
            // swd_sewadar_id
            // 
            this.swd_sewadar_id.BindingKey = "swd_sewadar_id";
            this.swd_sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.swd_sewadar_id.DefaultCellStyle = dataGridViewCellStyle11;
            this.swd_sewadar_id.HeaderText = "Sewadar ID";
            this.swd_sewadar_id.Lookup = false;
            this.swd_sewadar_id.LookupColumns = "";
            this.swd_sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.swd_sewadar_id.Mandatory = false;
            this.swd_sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.swd_sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.swd_sewadar_id.Name = "swd_sewadar_id";
            this.swd_sewadar_id.PercentageWidth = 10F;
            this.swd_sewadar_id.ReadOnly = true;
            this.swd_sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.swd_sewadar_id.ToolTipLookupField = "information";
            this.swd_sewadar_id.Width = 8;
            // 
            // grdList_full_nm
            // 
            this.grdList_full_nm.BindingKey = "full_nm";
            this.grdList_full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.grdList_full_nm.HeaderText = "Name";
            this.grdList_full_nm.Lookup = false;
            this.grdList_full_nm.LookupColumns = "";
            this.grdList_full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.grdList_full_nm.Mandatory = false;
            this.grdList_full_nm.MaxCharacterLength = 2147483647;
            this.grdList_full_nm.Name = "grdList_full_nm";
            this.grdList_full_nm.PercentageWidth = 30F;
            this.grdList_full_nm.ReadOnly = true;
            this.grdList_full_nm.RegularExpressionValidator = "";
            this.grdList_full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.grdList_full_nm.ToolTipLookupField = "information";
            this.grdList_full_nm.Width = 24;
            // 
            // swd_satsang_centre_id
            // 
            this.swd_satsang_centre_id.BindingKey = "swd_satsang_centre_id";
            this.swd_satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.swd_satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle12;
            this.swd_satsang_centre_id.HeaderText = "swd_satsang_centre_id";
            this.swd_satsang_centre_id.Lookup = false;
            this.swd_satsang_centre_id.LookupColumns = "";
            this.swd_satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.swd_satsang_centre_id.Mandatory = false;
            this.swd_satsang_centre_id.MaxValue = ((long)(9223372036854775807));
            this.swd_satsang_centre_id.MinValue = ((long)(-9223372036854775808));
            this.swd_satsang_centre_id.Name = "swd_satsang_centre_id";
            this.swd_satsang_centre_id.PercentageWidth = 25F;
            this.swd_satsang_centre_id.ReadOnly = true;
            this.swd_satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.swd_satsang_centre_id.ToolTipLookupField = "information";
            this.swd_satsang_centre_id.Visible = false;
            // 
            // swd_sewadar_gr_no
            // 
            this.swd_sewadar_gr_no.BindingKey = "swd_sewadar_gr_no";
            this.swd_sewadar_gr_no.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.swd_sewadar_gr_no.HeaderText = "GR No.";
            this.swd_sewadar_gr_no.Lookup = false;
            this.swd_sewadar_gr_no.LookupColumns = "";
            this.swd_sewadar_gr_no.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.swd_sewadar_gr_no.Mandatory = false;
            this.swd_sewadar_gr_no.MaxCharacterLength = 2147483647;
            this.swd_sewadar_gr_no.Name = "swd_sewadar_gr_no";
            this.swd_sewadar_gr_no.PercentageWidth = 20F;
            this.swd_sewadar_gr_no.ReadOnly = true;
            this.swd_sewadar_gr_no.RegularExpressionValidator = "";
            this.swd_sewadar_gr_no.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.swd_sewadar_gr_no.ToolTipLookupField = "information";
            this.swd_sewadar_gr_no.Width = 16;
            // 
            // SewadarsInSewadarLists
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(932, 601);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "SewadarsInSewadarLists";
            this.Text = "SewaTeamAttendence";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpBase.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
            this.tlpSewaSamiti.ResumeLayout(false);
            this.tlpSewaSamiti.PerformLayout();
            this.tlpListSewadarGrid.ResumeLayout(false);
            this.tlpListSewadarGrid.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdListSewadars)).EndInit();
            this.tlpSewadar.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpListSewadarGrid;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtReportName;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpSewaSamiti;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtOtherUse;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkotherCentreSewadarsAllowed;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkIsManagedByOtherCentre;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtGenerated;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intID;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtListName;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intSessionId;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkIsEditingAllowed;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtRemarks;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpSewadar;
        private DCC.ZOS.ZSM.Controls.Misc.SewadarHeader sewadarHeader1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtUse;
        private System.Windows.Forms.Label lblPrevGrNo;
        private UMB.CDF.UIControls.TextControls.BaseMasterLookup lkpListSatsangCentre;
        private UMB.CDF.UIControls.Grid.DCCGrid grdListSewadars;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewadar_list_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn list_satsang_centre_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn list_centre_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_list_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn generated_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn report_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_list_use;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_list_other_use;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn other_satsang_centre_sewadars;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_other_satsang_centre;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_editing_allowed;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn session_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn swd_sewadar_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn grdList_full_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn swd_satsang_centre_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn swd_sewadar_gr_no;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn centre_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn full_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewadar_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn age;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gender;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn department_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sub_department_nm;
    }
}
