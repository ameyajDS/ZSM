namespace DCC.ZOS.ZSM.MSC
{
    partial class SewadarHistory
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
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewadarHeader1 = new DCC.ZOS.ZSM.Controls.Misc.SewadarHeader();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpMid = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.lblStatusHistory = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.lblResponsibilityHistory = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.lblBadgeHistory = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.lblTransferHistory = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.grdStatusHistory = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadar_status_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.effective_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.grdResponsibilityHistory = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.responsibility = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.res_effective_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.grdBadgeHistory = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.badge_template_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.expiry_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.printing_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.grdTransferHistory = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.old_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_sub_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.trans_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sub_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.transfer_effective_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpBase.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.tlpMid.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdStatusHistory)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdResponsibilityHistory)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdBadgeHistory)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdTransferHistory)).BeginInit();
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
            this.scListOrBrowse.SplitterDistance = 902;
            this.scListOrBrowse.TabIndex = 2;
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 3;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 0.9966778F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 98.22813F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 0.8859358F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.Controls.Add(this.tlpTop, 0, 1);
            this.tlpBase.Controls.Add(this.dccTableLayoutPanel1, 0, 3);
            this.tlpBase.Controls.Add(this.tlpMid, 1, 2);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 4;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 1.858108F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.10135F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 78.04054F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 8F));
            this.tlpBase.Size = new System.Drawing.Size(902, 601);
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
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 112F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 112F));
            this.tlpTop.Size = new System.Drawing.Size(896, 113);
            this.tlpTop.TabIndex = 0;
            // 
            // sewadarHeader1
            // 
            this.sewadarHeader1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarHeader1.HeaderType = DCC.ZOS.ZSM.Controls.Utils.SewadarHeaderType.SewadarIDWise;
            this.sewadarHeader1.Location = new System.Drawing.Point(3, 3);
            this.sewadarHeader1.Name = "sewadarHeader1";
            this.sewadarHeader1.SatsangCentreId = null;
            this.sewadarHeader1.Size = new System.Drawing.Size(890, 107);
            this.sewadarHeader1.SttsCode = null;
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
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(896, 3);
            this.dccTableLayoutPanel1.TabIndex = 2;
            // 
            // tlpMid
            // 
            this.tlpMid.ColumnCount = 3;
            this.tlpMid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.41899F));
            this.tlpMid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 49.58101F));
            this.tlpMid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 343F));
            this.tlpMid.Controls.Add(this.lblStatusHistory, 0, 0);
            this.tlpMid.Controls.Add(this.lblResponsibilityHistory, 1, 0);
            this.tlpMid.Controls.Add(this.lblBadgeHistory, 2, 0);
            this.tlpMid.Controls.Add(this.lblTransferHistory, 0, 2);
            this.tlpMid.Controls.Add(this.grdStatusHistory, 0, 1);
            this.tlpMid.Controls.Add(this.grdResponsibilityHistory, 1, 1);
            this.tlpMid.Controls.Add(this.grdBadgeHistory, 2, 1);
            this.tlpMid.Controls.Add(this.grdTransferHistory, 0, 3);
            this.tlpMid.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpMid.Location = new System.Drawing.Point(11, 133);
            this.tlpMid.Name = "tlpMid";
            this.tlpMid.RowCount = 4;
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 15F));
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 54.16667F));
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 17F));
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 45.83333F));
            this.tlpMid.Size = new System.Drawing.Size(879, 456);
            this.tlpMid.TabIndex = 3;
            // 
            // lblStatusHistory
            // 
            this.lblStatusHistory.AutoSize = true;
            this.lblStatusHistory.BackColor = System.Drawing.Color.Transparent;
            this.lblStatusHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblStatusHistory.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStatusHistory.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblStatusHistory.Location = new System.Drawing.Point(3, 0);
            this.lblStatusHistory.Name = "lblStatusHistory";
            this.lblStatusHistory.Size = new System.Drawing.Size(264, 15);
            this.lblStatusHistory.TabIndex = 0;
            this.lblStatusHistory.Text = "Status History";
            // 
            // lblResponsibilityHistory
            // 
            this.lblResponsibilityHistory.AutoSize = true;
            this.lblResponsibilityHistory.BackColor = System.Drawing.Color.Transparent;
            this.lblResponsibilityHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblResponsibilityHistory.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblResponsibilityHistory.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblResponsibilityHistory.Location = new System.Drawing.Point(273, 0);
            this.lblResponsibilityHistory.Name = "lblResponsibilityHistory";
            this.lblResponsibilityHistory.Size = new System.Drawing.Size(259, 15);
            this.lblResponsibilityHistory.TabIndex = 1;
            this.lblResponsibilityHistory.Text = "Responsibility History";
            // 
            // lblBadgeHistory
            // 
            this.lblBadgeHistory.AutoSize = true;
            this.lblBadgeHistory.BackColor = System.Drawing.Color.Transparent;
            this.lblBadgeHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblBadgeHistory.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblBadgeHistory.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblBadgeHistory.Location = new System.Drawing.Point(538, 0);
            this.lblBadgeHistory.Name = "lblBadgeHistory";
            this.lblBadgeHistory.Size = new System.Drawing.Size(338, 15);
            this.lblBadgeHistory.TabIndex = 2;
            this.lblBadgeHistory.Text = "Badge History";
            // 
            // lblTransferHistory
            // 
            this.lblTransferHistory.AutoSize = true;
            this.lblTransferHistory.BackColor = System.Drawing.Color.Transparent;
            this.tlpMid.SetColumnSpan(this.lblTransferHistory, 3);
            this.lblTransferHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblTransferHistory.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTransferHistory.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblTransferHistory.Location = new System.Drawing.Point(3, 244);
            this.lblTransferHistory.Name = "lblTransferHistory";
            this.lblTransferHistory.Size = new System.Drawing.Size(873, 17);
            this.lblTransferHistory.TabIndex = 3;
            this.lblTransferHistory.Text = "Transfer History";
            this.lblTransferHistory.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // grdStatusHistory
            // 
            this.grdStatusHistory.AllowRowSorting = false;
            this.grdStatusHistory.AllowUserToAddRows = false;
            this.grdStatusHistory.AutoAddNewRowForUser = false;
            this.grdStatusHistory.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdStatusHistory.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewadar_status_nm,
            this.effective_dtm});
            this.grdStatusHistory.DeleteRowMenuEnabled = true;
            this.grdStatusHistory.DeleteVisible = true;
            this.grdStatusHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdStatusHistory.ExportToExcelVisible = true;
            this.grdStatusHistory.InsertAfterVisible = true;
            this.grdStatusHistory.InsertBeforeVisible = true;
            this.grdStatusHistory.InsertLastVisible = true;
            this.grdStatusHistory.InsertRowsMenuItemsEnabled = true;
            this.grdStatusHistory.Location = new System.Drawing.Point(3, 18);
            this.grdStatusHistory.Mandatory = false;
            this.grdStatusHistory.MoveDownVisible = false;
            this.grdStatusHistory.MoveUpVisible = false;
            this.grdStatusHistory.MultiSelect = false;
            this.grdStatusHistory.Name = "grdStatusHistory";
            this.grdStatusHistory.ReadOnly = true;
            this.grdStatusHistory.RowHeadersWidth = 15;
            this.grdStatusHistory.RowTemplate.Height = 24;
            this.grdStatusHistory.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdStatusHistory.ShowCommandStrip = false;
            this.grdStatusHistory.Size = new System.Drawing.Size(264, 223);
            this.grdStatusHistory.TabIndex = 4;
            this.grdStatusHistory.Title = null;
            this.grdStatusHistory.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdStatusHistory.VirtualMode = true;
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
            this.sewadar_status_nm.PercentageWidth = 40F;
            this.sewadar_status_nm.ReadOnly = true;
            this.sewadar_status_nm.RegularExpressionValidator = "";
            this.sewadar_status_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_nm.ToolTipLookupField = "information";
            this.sewadar_status_nm.Width = 99;
            // 
            // effective_dtm
            // 
            this.effective_dtm.BindingKey = "effective_dtm";
            this.effective_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.effective_dtm.DefaultCellStyle = dataGridViewCellStyle1;
            this.effective_dtm.HeaderText = "Date";
            this.effective_dtm.Lookup = false;
            this.effective_dtm.LookupColumns = "";
            this.effective_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.effective_dtm.Mandatory = false;
            this.effective_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effective_dtm.MinValue = new System.DateTime(((long)(0)));
            this.effective_dtm.Name = "effective_dtm";
            this.effective_dtm.PercentageWidth = 60F;
            this.effective_dtm.ReadOnly = true;
            this.effective_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effective_dtm.ToolTipLookupField = "information";
            this.effective_dtm.Width = 149;
            // 
            // grdResponsibilityHistory
            // 
            this.grdResponsibilityHistory.AllowRowSorting = false;
            this.grdResponsibilityHistory.AllowUserToAddRows = false;
            this.grdResponsibilityHistory.AutoAddNewRowForUser = false;
            this.grdResponsibilityHistory.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdResponsibilityHistory.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.responsibility,
            this.res_effective_dtm});
            this.grdResponsibilityHistory.DeleteRowMenuEnabled = true;
            this.grdResponsibilityHistory.DeleteVisible = true;
            this.grdResponsibilityHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdResponsibilityHistory.ExportToExcelVisible = true;
            this.grdResponsibilityHistory.InsertAfterVisible = true;
            this.grdResponsibilityHistory.InsertBeforeVisible = true;
            this.grdResponsibilityHistory.InsertLastVisible = true;
            this.grdResponsibilityHistory.InsertRowsMenuItemsEnabled = true;
            this.grdResponsibilityHistory.Location = new System.Drawing.Point(273, 18);
            this.grdResponsibilityHistory.Mandatory = false;
            this.grdResponsibilityHistory.MoveDownVisible = false;
            this.grdResponsibilityHistory.MoveUpVisible = false;
            this.grdResponsibilityHistory.MultiSelect = false;
            this.grdResponsibilityHistory.Name = "grdResponsibilityHistory";
            this.grdResponsibilityHistory.ReadOnly = true;
            this.grdResponsibilityHistory.RowHeadersWidth = 15;
            this.grdResponsibilityHistory.RowTemplate.Height = 24;
            this.grdResponsibilityHistory.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdResponsibilityHistory.ShowCommandStrip = false;
            this.grdResponsibilityHistory.Size = new System.Drawing.Size(259, 223);
            this.grdResponsibilityHistory.TabIndex = 5;
            this.grdResponsibilityHistory.Title = null;
            this.grdResponsibilityHistory.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdResponsibilityHistory.VirtualMode = true;
            // 
            // responsibility
            // 
            this.responsibility.BindingKey = "responsibility";
            this.responsibility.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.responsibility.HeaderText = "Responsibility";
            this.responsibility.Lookup = false;
            this.responsibility.LookupColumns = "";
            this.responsibility.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.responsibility.Mandatory = false;
            this.responsibility.MaxCharacterLength = 2147483647;
            this.responsibility.Name = "responsibility";
            this.responsibility.PercentageWidth = 40F;
            this.responsibility.ReadOnly = true;
            this.responsibility.RegularExpressionValidator = "";
            this.responsibility.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.responsibility.ToolTipLookupField = "information";
            this.responsibility.Width = 97;
            // 
            // res_effective_dtm
            // 
            this.res_effective_dtm.BindingKey = "effective_dtm";
            this.res_effective_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.res_effective_dtm.DefaultCellStyle = dataGridViewCellStyle2;
            this.res_effective_dtm.HeaderText = "Date";
            this.res_effective_dtm.Lookup = false;
            this.res_effective_dtm.LookupColumns = "";
            this.res_effective_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.res_effective_dtm.Mandatory = false;
            this.res_effective_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.res_effective_dtm.MinValue = new System.DateTime(((long)(0)));
            this.res_effective_dtm.Name = "res_effective_dtm";
            this.res_effective_dtm.PercentageWidth = 60F;
            this.res_effective_dtm.ReadOnly = true;
            this.res_effective_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.res_effective_dtm.ToolTipLookupField = "information";
            this.res_effective_dtm.Width = 146;
            // 
            // grdBadgeHistory
            // 
            this.grdBadgeHistory.AllowRowSorting = false;
            this.grdBadgeHistory.AllowUserToAddRows = false;
            this.grdBadgeHistory.AutoAddNewRowForUser = false;
            this.grdBadgeHistory.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdBadgeHistory.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.badge_template_nm,
            this.department_nm,
            this.expiry_dt,
            this.printing_dtm});
            this.grdBadgeHistory.DeleteRowMenuEnabled = true;
            this.grdBadgeHistory.DeleteVisible = true;
            this.grdBadgeHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdBadgeHistory.ExportToExcelVisible = true;
            this.grdBadgeHistory.InsertAfterVisible = true;
            this.grdBadgeHistory.InsertBeforeVisible = true;
            this.grdBadgeHistory.InsertLastVisible = true;
            this.grdBadgeHistory.InsertRowsMenuItemsEnabled = true;
            this.grdBadgeHistory.Location = new System.Drawing.Point(538, 18);
            this.grdBadgeHistory.Mandatory = false;
            this.grdBadgeHistory.MoveDownVisible = false;
            this.grdBadgeHistory.MoveUpVisible = false;
            this.grdBadgeHistory.MultiSelect = false;
            this.grdBadgeHistory.Name = "grdBadgeHistory";
            this.grdBadgeHistory.ReadOnly = true;
            this.grdBadgeHistory.RowHeadersWidth = 15;
            this.grdBadgeHistory.RowTemplate.Height = 24;
            this.grdBadgeHistory.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdBadgeHistory.ShowCommandStrip = false;
            this.grdBadgeHistory.Size = new System.Drawing.Size(338, 223);
            this.grdBadgeHistory.TabIndex = 6;
            this.grdBadgeHistory.Title = null;
            this.grdBadgeHistory.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdBadgeHistory.VirtualMode = true;
            // 
            // badge_template_nm
            // 
            this.badge_template_nm.BindingKey = "badge_template_nm";
            this.badge_template_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.badge_template_nm.HeaderText = "Badge Template";
            this.badge_template_nm.Lookup = false;
            this.badge_template_nm.LookupColumns = "";
            this.badge_template_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.badge_template_nm.Mandatory = false;
            this.badge_template_nm.MaxCharacterLength = 2147483647;
            this.badge_template_nm.Name = "badge_template_nm";
            this.badge_template_nm.PercentageWidth = 25F;
            this.badge_template_nm.ReadOnly = true;
            this.badge_template_nm.RegularExpressionValidator = "";
            this.badge_template_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.badge_template_nm.ToolTipLookupField = "information";
            this.badge_template_nm.Width = 80;
            // 
            // department_nm
            // 
            this.department_nm.BindingKey = "department_nm";
            this.department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.department_nm.HeaderText = "Department";
            this.department_nm.Lookup = false;
            this.department_nm.LookupColumns = "";
            this.department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_nm.Mandatory = false;
            this.department_nm.MaxCharacterLength = 2147483647;
            this.department_nm.Name = "department_nm";
            this.department_nm.PercentageWidth = 25F;
            this.department_nm.ReadOnly = true;
            this.department_nm.RegularExpressionValidator = "";
            this.department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_nm.ToolTipLookupField = "information";
            this.department_nm.Width = 80;
            // 
            // expiry_dt
            // 
            this.expiry_dt.BindingKey = "expiry_dt";
            this.expiry_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.expiry_dt.DefaultCellStyle = dataGridViewCellStyle3;
            this.expiry_dt.HeaderText = "Expiry";
            this.expiry_dt.Lookup = false;
            this.expiry_dt.LookupColumns = "";
            this.expiry_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.expiry_dt.Mandatory = false;
            this.expiry_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.expiry_dt.MinValue = new System.DateTime(((long)(0)));
            this.expiry_dt.Name = "expiry_dt";
            this.expiry_dt.PercentageWidth = 25F;
            this.expiry_dt.ReadOnly = true;
            this.expiry_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.expiry_dt.ToolTipLookupField = "information";
            this.expiry_dt.Width = 80;
            // 
            // printing_dtm
            // 
            this.printing_dtm.BindingKey = "printing_dtm";
            this.printing_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.printing_dtm.DefaultCellStyle = dataGridViewCellStyle4;
            this.printing_dtm.HeaderText = "Printing Date";
            this.printing_dtm.Lookup = false;
            this.printing_dtm.LookupColumns = "";
            this.printing_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.printing_dtm.Mandatory = false;
            this.printing_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.printing_dtm.MinValue = new System.DateTime(((long)(0)));
            this.printing_dtm.Name = "printing_dtm";
            this.printing_dtm.PercentageWidth = 25F;
            this.printing_dtm.ReadOnly = true;
            this.printing_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.printing_dtm.ToolTipLookupField = "information";
            this.printing_dtm.Width = 80;
            // 
            // grdTransferHistory
            // 
            this.grdTransferHistory.AllowRowSorting = false;
            this.grdTransferHistory.AllowUserToAddRows = false;
            this.grdTransferHistory.AutoAddNewRowForUser = false;
            this.grdTransferHistory.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdTransferHistory.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.old_department_nm,
            this.old_sub_department_nm,
            this.trans_department_nm,
            this.sub_department_nm,
            this.transfer_effective_dt});
            this.tlpMid.SetColumnSpan(this.grdTransferHistory, 3);
            this.grdTransferHistory.DeleteRowMenuEnabled = true;
            this.grdTransferHistory.DeleteVisible = true;
            this.grdTransferHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdTransferHistory.ExportToExcelVisible = true;
            this.grdTransferHistory.InsertAfterVisible = true;
            this.grdTransferHistory.InsertBeforeVisible = true;
            this.grdTransferHistory.InsertLastVisible = true;
            this.grdTransferHistory.InsertRowsMenuItemsEnabled = true;
            this.grdTransferHistory.Location = new System.Drawing.Point(3, 264);
            this.grdTransferHistory.Mandatory = false;
            this.grdTransferHistory.MoveDownVisible = false;
            this.grdTransferHistory.MoveUpVisible = false;
            this.grdTransferHistory.MultiSelect = false;
            this.grdTransferHistory.Name = "grdTransferHistory";
            this.grdTransferHistory.ReadOnly = true;
            this.grdTransferHistory.RowHeadersWidth = 15;
            this.grdTransferHistory.RowTemplate.Height = 24;
            this.grdTransferHistory.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdTransferHistory.ShowCommandStrip = false;
            this.grdTransferHistory.Size = new System.Drawing.Size(873, 189);
            this.grdTransferHistory.TabIndex = 7;
            this.grdTransferHistory.Title = null;
            this.grdTransferHistory.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdTransferHistory.VirtualMode = true;
            // 
            // old_department_nm
            // 
            this.old_department_nm.BindingKey = "old_department_nm";
            this.old_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.old_department_nm.HeaderText = "Old Dept.";
            this.old_department_nm.Lookup = false;
            this.old_department_nm.LookupColumns = "";
            this.old_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_department_nm.Mandatory = false;
            this.old_department_nm.MaxCharacterLength = 2147483647;
            this.old_department_nm.Name = "old_department_nm";
            this.old_department_nm.PercentageWidth = 20F;
            this.old_department_nm.ReadOnly = true;
            this.old_department_nm.RegularExpressionValidator = "";
            this.old_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_department_nm.ToolTipLookupField = "information";
            this.old_department_nm.Width = 171;
            // 
            // old_sub_department_nm
            // 
            this.old_sub_department_nm.BindingKey = "old_sub_department_nm";
            this.old_sub_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.old_sub_department_nm.HeaderText = "Old Sub Dept.";
            this.old_sub_department_nm.Lookup = false;
            this.old_sub_department_nm.LookupColumns = "";
            this.old_sub_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_sub_department_nm.Mandatory = false;
            this.old_sub_department_nm.MaxCharacterLength = 2147483647;
            this.old_sub_department_nm.Name = "old_sub_department_nm";
            this.old_sub_department_nm.PercentageWidth = 20F;
            this.old_sub_department_nm.ReadOnly = true;
            this.old_sub_department_nm.RegularExpressionValidator = "";
            this.old_sub_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_sub_department_nm.ToolTipLookupField = "information";
            this.old_sub_department_nm.Width = 171;
            // 
            // trans_department_nm
            // 
            this.trans_department_nm.BindingKey = "department_nm";
            this.trans_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.trans_department_nm.HeaderText = "New Dept.";
            this.trans_department_nm.Lookup = false;
            this.trans_department_nm.LookupColumns = "";
            this.trans_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.trans_department_nm.Mandatory = false;
            this.trans_department_nm.MaxCharacterLength = 2147483647;
            this.trans_department_nm.Name = "trans_department_nm";
            this.trans_department_nm.PercentageWidth = 20F;
            this.trans_department_nm.ReadOnly = true;
            this.trans_department_nm.RegularExpressionValidator = "";
            this.trans_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.trans_department_nm.ToolTipLookupField = "information";
            this.trans_department_nm.Width = 171;
            // 
            // sub_department_nm
            // 
            this.sub_department_nm.BindingKey = "sub_department_nm";
            this.sub_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sub_department_nm.HeaderText = "New Sub Dept.";
            this.sub_department_nm.Lookup = false;
            this.sub_department_nm.LookupColumns = "";
            this.sub_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sub_department_nm.Mandatory = false;
            this.sub_department_nm.MaxCharacterLength = 2147483647;
            this.sub_department_nm.Name = "sub_department_nm";
            this.sub_department_nm.PercentageWidth = 20F;
            this.sub_department_nm.ReadOnly = true;
            this.sub_department_nm.RegularExpressionValidator = "";
            this.sub_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sub_department_nm.ToolTipLookupField = "information";
            this.sub_department_nm.Width = 171;
            // 
            // transfer_effective_dt
            // 
            this.transfer_effective_dt.BindingKey = "effective_dt";
            this.transfer_effective_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.transfer_effective_dt.DefaultCellStyle = dataGridViewCellStyle5;
            this.transfer_effective_dt.HeaderText = "Effective Date";
            this.transfer_effective_dt.Lookup = false;
            this.transfer_effective_dt.LookupColumns = "";
            this.transfer_effective_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.transfer_effective_dt.Mandatory = false;
            this.transfer_effective_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.transfer_effective_dt.MinValue = new System.DateTime(((long)(0)));
            this.transfer_effective_dt.Name = "transfer_effective_dt";
            this.transfer_effective_dt.PercentageWidth = 20F;
            this.transfer_effective_dt.ReadOnly = true;
            this.transfer_effective_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.transfer_effective_dt.ToolTipLookupField = "information";
            this.transfer_effective_dt.Width = 171;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
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
            this.grdList.RowTemplate.Height = 24;
            this.grdList.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(26, 601);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // SewadarHistory
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(932, 601);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "SewadarHistory";
            this.Text = "SewaTeamAttendence";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpBase.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            this.tlpMid.ResumeLayout(false);
            this.tlpMid.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdStatusHistory)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdResponsibilityHistory)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdBadgeHistory)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdTransferHistory)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private DCC.ZOS.ZSM.Controls.Misc.SewadarHeader sewadarHeader1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpMid;
        private DCC.UMB.CDF.UIControls.DCCLabel lblStatusHistory;
        private DCC.UMB.CDF.UIControls.DCCLabel lblResponsibilityHistory;
        private DCC.UMB.CDF.UIControls.DCCLabel lblBadgeHistory;
        private DCC.UMB.CDF.UIControls.DCCLabel lblTransferHistory;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdStatusHistory;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdResponsibilityHistory;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdBadgeHistory;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdTransferHistory;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn old_department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn old_sub_department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn trans_department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sub_department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn transfer_effective_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn badge_template_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn department_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn expiry_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn printing_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn responsibility;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn res_effective_dtm;
    }
}