namespace DCC.ZOS.ZSM.MSC
{
    partial class SewaSummary
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
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewadarHeader1 = new DCC.ZOS.ZSM.Controls.Misc.SewadarHeader();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpMid = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.lblResponsibilityHistory = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.grdTransferHistory = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewa_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.start_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.finish_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.present_cnt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn();
            this.exempt_cnt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn();
            this.leave_cnt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn();
            this.absent_cnt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpBase.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.tlpMid.SuspendLayout();
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
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(932, 601);
            this.scListOrBrowse.SplitterDistance = 903;
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
            this.tlpBase.Size = new System.Drawing.Size(932, 601);
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
            this.tlpTop.Size = new System.Drawing.Size(926, 113);
            this.tlpTop.TabIndex = 0;
            // 
            // sewadarHeader1
            // 
            this.sewadarHeader1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarHeader1.HeaderType = DCC.ZOS.ZSM.Controls.Utils.SewadarHeaderType.SewadarIDWise;
            this.sewadarHeader1.Location = new System.Drawing.Point(3, 3);
            this.sewadarHeader1.Name = "sewadarHeader1";
            this.sewadarHeader1.SatsangCentreId = null;
            this.sewadarHeader1.Size = new System.Drawing.Size(920, 107);
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
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100F));
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(3, 595);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 1;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(926, 3);
            this.dccTableLayoutPanel1.TabIndex = 2;
            // 
            // tlpMid
            // 
            this.tlpMid.ColumnCount = 3;
            this.tlpMid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 46.78492F));
            this.tlpMid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 53.21508F));
            this.tlpMid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 278F));
            this.tlpMid.Controls.Add(this.lblResponsibilityHistory, 1, 0);
            this.tlpMid.Controls.Add(this.grdTransferHistory, 0, 1);
            this.tlpMid.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpMid.Location = new System.Drawing.Point(12, 133);
            this.tlpMid.Name = "tlpMid";
            this.tlpMid.RowCount = 4;
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 15F));
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 54.16667F));
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 17F));
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 45.83333F));
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpMid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpMid.Size = new System.Drawing.Size(908, 456);
            this.tlpMid.TabIndex = 3;
            // 
            // lblResponsibilityHistory
            // 
            this.lblResponsibilityHistory.AutoSize = true;
            this.lblResponsibilityHistory.BackColor = System.Drawing.Color.Transparent;
            this.lblResponsibilityHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblResponsibilityHistory.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblResponsibilityHistory.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblResponsibilityHistory.Location = new System.Drawing.Point(297, 0);
            this.lblResponsibilityHistory.Name = "lblResponsibilityHistory";
            this.lblResponsibilityHistory.Size = new System.Drawing.Size(329, 15);
            this.lblResponsibilityHistory.TabIndex = 1;
            this.lblResponsibilityHistory.Text = "Sewa Summary Details";
            // 
            // grdTransferHistory
            // 
            this.grdTransferHistory.AllowRowSorting = false;
            this.grdTransferHistory.AllowUserToAddRows = false;
            this.grdTransferHistory.AutoAddNewRowForUser = false;
            this.grdTransferHistory.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdTransferHistory.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewa_nm,
            this.start_dt,
            this.finish_dt,
            this.present_cnt,
            this.exempt_cnt,
            this.leave_cnt,
            this.absent_cnt});
            this.tlpMid.SetColumnSpan(this.grdTransferHistory, 3);
            this.grdTransferHistory.DeleteRowMenuEnabled = true;
            this.grdTransferHistory.DeleteVisible = true;
            this.grdTransferHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdTransferHistory.ExportToExcelVisible = true;
            this.grdTransferHistory.InsertAfterVisible = true;
            this.grdTransferHistory.InsertBeforeVisible = true;
            this.grdTransferHistory.InsertLastVisible = true;
            this.grdTransferHistory.InsertRowsMenuItemsEnabled = true;
            this.grdTransferHistory.Location = new System.Drawing.Point(3, 18);
            this.grdTransferHistory.Mandatory = false;
            this.grdTransferHistory.MoveDownVisible = false;
            this.grdTransferHistory.MoveUpVisible = false;
            this.grdTransferHistory.MultiSelect = false;
            this.grdTransferHistory.Name = "grdTransferHistory";
            this.grdTransferHistory.ReadOnly = true;
            this.grdTransferHistory.RowHeadersWidth = 15;
            this.tlpMid.SetRowSpan(this.grdTransferHistory, 3);
            this.grdTransferHistory.RowTemplate.Height = 24;
            this.grdTransferHistory.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdTransferHistory.ShowCommandStrip = false;
            this.grdTransferHistory.Size = new System.Drawing.Size(902, 435);
            this.grdTransferHistory.TabIndex = 7;
            this.grdTransferHistory.Title = null;
            this.grdTransferHistory.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdTransferHistory.VirtualMode = true;
            // 
            // sewa_nm
            // 
            this.sewa_nm.BindingKey = "sewa_nm";
            this.sewa_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewa_nm.HeaderText = "Sewa";
            this.sewa_nm.Lookup = false;
            this.sewa_nm.LookupColumns = "";
            this.sewa_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewa_nm.Mandatory = false;
            this.sewa_nm.MaxCharacterLength = 2147483647;
            this.sewa_nm.Name = "sewa_nm";
            this.sewa_nm.PercentageWidth = 50F;
            this.sewa_nm.ReadOnly = true;
            this.sewa_nm.RegularExpressionValidator = "";
            this.sewa_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewa_nm.ToolTipLookupField = "information";
            this.sewa_nm.Width = 443;
            // 
            // start_dt
            // 
            this.start_dt.BindingKey = "start_dt";
            this.start_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.start_dt.DefaultCellStyle = dataGridViewCellStyle1;
            this.start_dt.HeaderText = "Start Date";
            this.start_dt.Lookup = false;
            this.start_dt.LookupColumns = "";
            this.start_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.start_dt.Mandatory = false;
            this.start_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.start_dt.MinValue = new System.DateTime(((long)(0)));
            this.start_dt.Name = "start_dt";
            this.start_dt.PercentageWidth = 15F;
            this.start_dt.ReadOnly = true;
            this.start_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.start_dt.ToolTipLookupField = "information";
            this.start_dt.Width = 133;
            // 
            // finish_dt
            // 
            this.finish_dt.BindingKey = "finish_dt";
            this.finish_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.finish_dt.DefaultCellStyle = dataGridViewCellStyle2;
            this.finish_dt.HeaderText = "Finish Date";
            this.finish_dt.Lookup = false;
            this.finish_dt.LookupColumns = "";
            this.finish_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.finish_dt.Mandatory = false;
            this.finish_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.finish_dt.MinValue = new System.DateTime(((long)(0)));
            this.finish_dt.Name = "finish_dt";
            this.finish_dt.PercentageWidth = 15F;
            this.finish_dt.ReadOnly = true;
            this.finish_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.finish_dt.ToolTipLookupField = "information";
            this.finish_dt.Width = 133;
            // 
            // present_cnt
            // 
            this.present_cnt.BindingKey = "present_cnt";
            this.present_cnt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.present_cnt.DefaultCellStyle = dataGridViewCellStyle3;
            this.present_cnt.HeaderText = "Present";
            this.present_cnt.Lookup = false;
            this.present_cnt.LookupColumns = "";
            this.present_cnt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.present_cnt.Mandatory = false;
            this.present_cnt.MaxValue = 1.7976931348623157E+308D;
            this.present_cnt.MinValue = -1.7976931348623157E+308D;
            this.present_cnt.Name = "present_cnt";
            this.present_cnt.PercentageWidth = 5F;
            this.present_cnt.ReadOnly = true;
            this.present_cnt.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.present_cnt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.present_cnt.ToolTipLookupField = "information";
            this.present_cnt.Width = 44;
            // 
            // exempt_cnt
            // 
            this.exempt_cnt.BindingKey = "exempt_cnt";
            this.exempt_cnt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.exempt_cnt.DefaultCellStyle = dataGridViewCellStyle4;
            this.exempt_cnt.HeaderText = "Exempt";
            this.exempt_cnt.Lookup = false;
            this.exempt_cnt.LookupColumns = "";
            this.exempt_cnt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.exempt_cnt.Mandatory = false;
            this.exempt_cnt.MaxValue = 1.7976931348623157E+308D;
            this.exempt_cnt.MinValue = -1.7976931348623157E+308D;
            this.exempt_cnt.Name = "exempt_cnt";
            this.exempt_cnt.PercentageWidth = 5F;
            this.exempt_cnt.ReadOnly = true;
            this.exempt_cnt.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.exempt_cnt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.exempt_cnt.ToolTipLookupField = "information";
            this.exempt_cnt.Width = 44;
            // 
            // leave_cnt
            // 
            this.leave_cnt.BindingKey = "leave_cnt";
            this.leave_cnt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.leave_cnt.DefaultCellStyle = dataGridViewCellStyle5;
            this.leave_cnt.HeaderText = "Leave";
            this.leave_cnt.Lookup = false;
            this.leave_cnt.LookupColumns = "";
            this.leave_cnt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.leave_cnt.Mandatory = false;
            this.leave_cnt.MaxValue = 1.7976931348623157E+308D;
            this.leave_cnt.MinValue = -1.7976931348623157E+308D;
            this.leave_cnt.Name = "leave_cnt";
            this.leave_cnt.PercentageWidth = 5F;
            this.leave_cnt.ReadOnly = true;
            this.leave_cnt.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.leave_cnt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.leave_cnt.ToolTipLookupField = "information";
            this.leave_cnt.Width = 44;
            // 
            // absent_cnt
            // 
            this.absent_cnt.BindingKey = "absent_cnt";
            this.absent_cnt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.absent_cnt.DefaultCellStyle = dataGridViewCellStyle6;
            this.absent_cnt.HeaderText = "Absent";
            this.absent_cnt.Lookup = false;
            this.absent_cnt.LookupColumns = "";
            this.absent_cnt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.absent_cnt.Mandatory = false;
            this.absent_cnt.MaxValue = 1.7976931348623157E+308D;
            this.absent_cnt.MinValue = -1.7976931348623157E+308D;
            this.absent_cnt.Name = "absent_cnt";
            this.absent_cnt.PercentageWidth = 5F;
            this.absent_cnt.ReadOnly = true;
            this.absent_cnt.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.absent_cnt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.absent_cnt.ToolTipLookupField = "information";
            this.absent_cnt.Width = 44;
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
            this.grdList.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(72, 81);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // SewaSummary
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(932, 601);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "SewaSummary";
            this.Text = "SewaTeamAttendence";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpBase.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            this.tlpMid.ResumeLayout(false);
            this.tlpMid.PerformLayout();
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
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdTransferHistory;
        private DCC.UMB.CDF.UIControls.DCCLabel lblResponsibilityHistory;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewa_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn start_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn finish_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn present_cnt;
        private UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn exempt_cnt;
        private UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn leave_cnt;
        private UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn absent_cnt;
    }
}