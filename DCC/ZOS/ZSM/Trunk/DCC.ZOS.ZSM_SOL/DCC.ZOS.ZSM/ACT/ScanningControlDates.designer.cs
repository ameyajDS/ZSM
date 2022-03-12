namespace DCC.ZOS.ZSM.ENT
{
    partial class ScanningControlDates
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ScanningControlDates));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpTopMost = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtSatsangCentre = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtScanningJobTypeCd = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.chkIsClosed = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.intTotalProcessedCount = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.dtLastTransferDtm = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.dtControlingDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.lkpJobName = new DCC.ZOS.ZSM.Controls.ZSMLookups.JobNameControllingDateLookup();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.scanning_job_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.scanning_job_type_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.scanning_job_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.controlling_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.last_transfer_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.total_processed_cnt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.is_closed = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.dccTextField1 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dccGrid1 = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.dccTextFieldGridColumn1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.dccTextFieldGridColumn2 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.dccDateGridColumn1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn2 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn3 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn4 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpTopMost.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.tableLayoutPanel2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).BeginInit();
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
            this.scListOrBrowse.Panel1.Controls.Add(this.tlpTopMost);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Size = new System.Drawing.Size(1291, 662);
            this.scListOrBrowse.SplitterDistance = 1250;
            this.scListOrBrowse.SplitterWidth = 5;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tlpTopMost
            // 
            this.tlpTopMost.ColumnCount = 6;
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.48136F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.25932F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.25932F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.25932F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.25932F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.48136F));
            this.tlpTopMost.Controls.Add(this.txtSatsangCentre, 1, 1);
            this.tlpTopMost.Controls.Add(this.txtScanningJobTypeCd, 4, 1);
            this.tlpTopMost.Controls.Add(this.chkIsClosed, 3, 3);
            this.tlpTopMost.Controls.Add(this.intTotalProcessedCount, 2, 3);
            this.tlpTopMost.Controls.Add(this.dtLastTransferDtm, 3, 2);
            this.tlpTopMost.Controls.Add(this.dtControlingDate, 2, 2);
            this.tlpTopMost.Controls.Add(this.lkpJobName, 2, 1);
            this.tlpTopMost.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTopMost.Location = new System.Drawing.Point(0, 0);
            this.tlpTopMost.Margin = new System.Windows.Forms.Padding(4);
            this.tlpTopMost.Name = "tlpTopMost";
            this.tlpTopMost.RowCount = 12;
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.333334F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tlpTopMost.Size = new System.Drawing.Size(1250, 662);
            this.tlpTopMost.TabIndex = 4;
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
            this.txtSatsangCentre.DisplayTextBindingKey = "";
            this.txtSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentre.EditingControlDataGridView = null;
            this.txtSatsangCentre.EditingControlFormattedValue = "";
            this.txtSatsangCentre.EditingControlRowIndex = 0;
            this.txtSatsangCentre.EditingControlValueChanged = false;
            this.txtSatsangCentre.EnableToolTip = false;
            this.txtSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentre.IdText = null;
            this.txtSatsangCentre.IdTextBindingKey = null;
            this.txtSatsangCentre.Location = new System.Drawing.Point(123, 59);
            this.txtSatsangCentre.Lookup = false;
            this.txtSatsangCentre.LookupColumns = null;
            this.txtSatsangCentre.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentre.LookupResult = null;
            this.txtSatsangCentre.Mandatory = false;
            this.txtSatsangCentre.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtSatsangCentre.MaxCharacterLength = 32767;
            this.txtSatsangCentre.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtSatsangCentre.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtSatsangCentre.Name = "txtSatsangCentre";
            this.txtSatsangCentre.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCentre.PascalCase = false;
            this.txtSatsangCentre.RangeInQueryMode = false;
            this.txtSatsangCentre.ReadOnly = true;
            this.txtSatsangCentre.RegularExpressionValidator = null;
            this.txtSatsangCentre.Size = new System.Drawing.Size(243, 47);
            this.txtSatsangCentre.TabIndex = 66;
            this.txtSatsangCentre.TabStop = false;
            this.txtSatsangCentre.Title = "Satsang Centre";
            this.txtSatsangCentre.ToolTipLookupField = "information";
            this.txtSatsangCentre.ValueText = null;
            // 
            // txtScanningJobTypeCd
            // 
            this.txtScanningJobTypeCd.AllowsNew = false;
            this.txtScanningJobTypeCd.AllowsReference = false;
            this.txtScanningJobTypeCd.AllowsUpdate = false;
            this.txtScanningJobTypeCd.ApplicationIdForDbConnection = null;
            this.txtScanningJobTypeCd.BackColor = System.Drawing.Color.Transparent;
            this.txtScanningJobTypeCd.CalledScreenApplicationId = null;
            this.txtScanningJobTypeCd.CalledScreenTypeName = null;
            this.txtScanningJobTypeCd.CallingScreenType = null;
            this.txtScanningJobTypeCd.DisplayText = "";
            this.txtScanningJobTypeCd.DisplayTextBindingKey = "scanning_job_type_cd";
            this.txtScanningJobTypeCd.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtScanningJobTypeCd.EditingControlDataGridView = null;
            this.txtScanningJobTypeCd.EditingControlFormattedValue = "";
            this.txtScanningJobTypeCd.EditingControlRowIndex = 0;
            this.txtScanningJobTypeCd.EditingControlValueChanged = false;
            this.txtScanningJobTypeCd.EnableToolTip = false;
            this.txtScanningJobTypeCd.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtScanningJobTypeCd.IdText = null;
            this.txtScanningJobTypeCd.IdTextBindingKey = null;
            this.txtScanningJobTypeCd.Location = new System.Drawing.Point(882, 59);
            this.txtScanningJobTypeCd.Lookup = false;
            this.txtScanningJobTypeCd.LookupColumns = null;
            this.txtScanningJobTypeCd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtScanningJobTypeCd.LookupResult = null;
            this.txtScanningJobTypeCd.Mandatory = false;
            this.txtScanningJobTypeCd.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtScanningJobTypeCd.MaxCharacterLength = 10;
            this.txtScanningJobTypeCd.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtScanningJobTypeCd.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtScanningJobTypeCd.Name = "txtScanningJobTypeCd";
            this.txtScanningJobTypeCd.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtScanningJobTypeCd.PascalCase = false;
            this.txtScanningJobTypeCd.RangeInQueryMode = false;
            this.txtScanningJobTypeCd.ReadOnly = true;
            this.txtScanningJobTypeCd.RegularExpressionValidator = null;
            this.txtScanningJobTypeCd.Size = new System.Drawing.Size(243, 47);
            this.txtScanningJobTypeCd.TabIndex = 65;
            this.txtScanningJobTypeCd.TabStop = false;
            this.txtScanningJobTypeCd.Title = "Scanning Job Type Code";
            this.txtScanningJobTypeCd.ToolTipLookupField = "information";
            this.txtScanningJobTypeCd.ValueText = null;
            // 
            // chkIsClosed
            // 
            this.chkIsClosed.AutoSize = true;
            this.chkIsClosed.BackColor = System.Drawing.Color.Transparent;
            this.chkIsClosed.BindingKey = "is_closed";
            this.chkIsClosed.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIsClosed.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkIsClosed.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkIsClosed.Location = new System.Drawing.Point(628, 169);
            this.chkIsClosed.Margin = new System.Windows.Forms.Padding(4);
            this.chkIsClosed.Name = "chkIsClosed";
            this.chkIsClosed.Size = new System.Drawing.Size(245, 47);
            this.chkIsClosed.TabIndex = 64;
            this.chkIsClosed.Text = "Is Closed";
            this.chkIsClosed.UseVisualStyleBackColor = true;
            // 
            // intTotalProcessedCount
            // 
            this.intTotalProcessedCount.AllowsNew = false;
            this.intTotalProcessedCount.AllowsReference = false;
            this.intTotalProcessedCount.AllowsUpdate = false;
            this.intTotalProcessedCount.ApplicationIdForDbConnection = null;
            this.intTotalProcessedCount.BackColor = System.Drawing.Color.Transparent;
            this.intTotalProcessedCount.CalledScreenApplicationId = null;
            this.intTotalProcessedCount.CalledScreenTypeName = null;
            this.intTotalProcessedCount.CallingScreenType = null;
            this.intTotalProcessedCount.DisplayText = "";
            this.intTotalProcessedCount.DisplayTextBindingKey = "total_processed_cnt";
            this.intTotalProcessedCount.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intTotalProcessedCount.EditingControlDataGridView = null;
            this.intTotalProcessedCount.EditingControlFormattedValue = "";
            this.intTotalProcessedCount.EditingControlRowIndex = 0;
            this.intTotalProcessedCount.EditingControlValueChanged = false;
            this.intTotalProcessedCount.EnableToolTip = false;
            this.intTotalProcessedCount.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intTotalProcessedCount.IdText = null;
            this.intTotalProcessedCount.IdTextBindingKey = null;
            this.intTotalProcessedCount.Location = new System.Drawing.Point(376, 169);
            this.intTotalProcessedCount.Lookup = false;
            this.intTotalProcessedCount.LookupColumns = null;
            this.intTotalProcessedCount.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intTotalProcessedCount.LookupResult = null;
            this.intTotalProcessedCount.Mandatory = false;
            this.intTotalProcessedCount.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intTotalProcessedCount.MaxCharacterLength = 2;
            this.intTotalProcessedCount.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intTotalProcessedCount.MaxValue = ((long)(9223372036854775807));
            this.intTotalProcessedCount.MinimumSize = new System.Drawing.Size(13, 27);
            this.intTotalProcessedCount.MinValue = ((long)(-9223372036854775808));
            this.intTotalProcessedCount.Name = "intTotalProcessedCount";
            this.intTotalProcessedCount.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intTotalProcessedCount.PascalCase = false;
            this.intTotalProcessedCount.RangeInQueryMode = false;
            this.intTotalProcessedCount.ReadOnly = false;
            this.intTotalProcessedCount.RegularExpressionValidator = null;
            this.intTotalProcessedCount.Size = new System.Drawing.Size(243, 47);
            this.intTotalProcessedCount.TabIndex = 62;
            this.intTotalProcessedCount.Title = "Total Processed Count";
            this.intTotalProcessedCount.ToolTipLookupField = "information";
            this.intTotalProcessedCount.ValueText = null;
            // 
            // dtLastTransferDtm
            // 
            this.dtLastTransferDtm.AllowsNew = false;
            this.dtLastTransferDtm.AllowsReference = false;
            this.dtLastTransferDtm.AllowsUpdate = false;
            this.dtLastTransferDtm.ApplicationIdForDbConnection = null;
            this.dtLastTransferDtm.BackColor = System.Drawing.Color.Transparent;
            this.dtLastTransferDtm.CalledScreenApplicationId = null;
            this.dtLastTransferDtm.CalledScreenTypeName = null;
            this.dtLastTransferDtm.CallingScreenType = null;
            this.dtLastTransferDtm.DisplayText = null;
            this.dtLastTransferDtm.DisplayTextAsDateTime = null;
            this.dtLastTransferDtm.DisplayTextBindingKey = "last_transfer_dtm";
            this.dtLastTransferDtm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtLastTransferDtm.EditingControlDataGridView = null;
            this.dtLastTransferDtm.EditingControlFormattedValue = null;
            this.dtLastTransferDtm.EditingControlRowIndex = 0;
            this.dtLastTransferDtm.EditingControlValueChanged = false;
            this.dtLastTransferDtm.EnableToolTip = false;
            this.dtLastTransferDtm.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtLastTransferDtm.IdText = "";
            this.dtLastTransferDtm.IdTextBindingKey = "";
            this.dtLastTransferDtm.Location = new System.Drawing.Point(629, 114);
            this.dtLastTransferDtm.Lookup = true;
            this.dtLastTransferDtm.LookupColumns = null;
            this.dtLastTransferDtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtLastTransferDtm.LookupResult = null;
            this.dtLastTransferDtm.Mandatory = false;
            this.dtLastTransferDtm.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtLastTransferDtm.MaxCharacterLength = 11;
            this.dtLastTransferDtm.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtLastTransferDtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtLastTransferDtm.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtLastTransferDtm.MinValue = new System.DateTime(((long)(0)));
            this.dtLastTransferDtm.Name = "dtLastTransferDtm";
            this.dtLastTransferDtm.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtLastTransferDtm.PascalCase = false;
            this.dtLastTransferDtm.RangeInQueryMode = false;
            this.dtLastTransferDtm.ReadOnly = false;
            this.dtLastTransferDtm.RegularExpressionValidator = null;
            this.dtLastTransferDtm.ShowTime = false;
            this.dtLastTransferDtm.Size = new System.Drawing.Size(243, 47);
            this.dtLastTransferDtm.TabIndex = 61;
            this.dtLastTransferDtm.Title = "Last Transfer Date";
            this.dtLastTransferDtm.ToolTipLookupField = "information";
            this.dtLastTransferDtm.ValueText = "";
            // 
            // dtControlingDate
            // 
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
            this.dtControlingDate.IdTextBindingKey = "";
            this.dtControlingDate.Location = new System.Drawing.Point(376, 114);
            this.dtControlingDate.Lookup = true;
            this.dtControlingDate.LookupColumns = null;
            this.dtControlingDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtControlingDate.LookupResult = null;
            this.dtControlingDate.Mandatory = true;
            this.dtControlingDate.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.dtControlingDate.MaxCharacterLength = 11;
            this.dtControlingDate.MaximumSize = new System.Drawing.Size(1733, 55);
            this.dtControlingDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtControlingDate.MinimumSize = new System.Drawing.Size(13, 27);
            this.dtControlingDate.MinValue = new System.DateTime(((long)(0)));
            this.dtControlingDate.Name = "dtControlingDate";
            this.dtControlingDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtControlingDate.PascalCase = false;
            this.dtControlingDate.RangeInQueryMode = false;
            this.dtControlingDate.ReadOnly = false;
            this.dtControlingDate.RegularExpressionValidator = null;
            this.dtControlingDate.ShowTime = false;
            this.dtControlingDate.Size = new System.Drawing.Size(243, 47);
            this.dtControlingDate.TabIndex = 60;
            this.dtControlingDate.Title = "Controlling Date";
            this.dtControlingDate.ToolTipLookupField = "information";
            this.dtControlingDate.ValueText = "";
            // 
            // lkpJobName
            // 
            this.lkpJobName.AllowsNew = false;
            this.lkpJobName.AllowsReference = false;
            this.lkpJobName.AllowsUpdate = false;
            this.lkpJobName.BackColor = System.Drawing.Color.Transparent;
            this.lkpJobName.CalledScreenApplicationId = "";
            this.lkpJobName.CalledScreenTypeName = null;
            this.lkpJobName.CallingScreenType = null;
            this.tlpTopMost.SetColumnSpan(this.lkpJobName, 2);
            this.lkpJobName.DisplayText = "";
            this.lkpJobName.DisplayTextBindingKey = "scanning_job_nm";
            this.lkpJobName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpJobName.EditingControlDataGridView = null;
            this.lkpJobName.EditingControlFormattedValue = null;
            this.lkpJobName.EditingControlRowIndex = 0;
            this.lkpJobName.EditingControlValueChanged = true;
            this.lkpJobName.EnableToolTip = false;
            this.lkpJobName.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lkpJobName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpJobName.IdText = null;
            this.lkpJobName.IdTextBindingKey = "scanning_job_id";
            this.lkpJobName.Location = new System.Drawing.Point(376, 59);
            this.lkpJobName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpJobName.LookupResult = null;
            this.lkpJobName.Mandatory = true;
            this.lkpJobName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lkpJobName.MaxCharacterLength = 32767;
            this.lkpJobName.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lkpJobName.MinimumSize = new System.Drawing.Size(13, 27);
            this.lkpJobName.Name = "lkpJobName";
            this.lkpJobName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lkpJobName.PascalCase = false;
            this.lkpJobName.RangeInQueryMode = false;
            this.lkpJobName.ReadOnly = false;
            this.lkpJobName.RegularExpressionValidator = null;
            this.lkpJobName.Size = new System.Drawing.Size(496, 47);
            this.lkpJobName.TabIndex = 47;
            this.lkpJobName.Title = "Job Name";
            this.lkpJobName.ToolTipLookupField = "information";
            this.lkpJobName.ValueText = null;
            this.lkpJobName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lkpJobName_LookupDialogShowing);
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.scanning_job_id,
            this.scanning_job_type_cd,
            this.scanning_job_nm,
            this.controlling_dt,
            this.last_transfer_dtm,
            this.total_processed_cnt,
            this.is_closed,
            this.txn_ts});
            this.grdList.DeleteRowMenuEnabled = true;
            this.grdList.DeleteVisible = true;
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdList.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
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
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(36, 662);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // scanning_job_id
            // 
            this.scanning_job_id.BindingKey = "scanning_job_id";
            this.scanning_job_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.scanning_job_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.scanning_job_id.HeaderText = "scanning_job_id";
            this.scanning_job_id.Lookup = false;
            this.scanning_job_id.LookupColumns = "";
            this.scanning_job_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.scanning_job_id.Mandatory = false;
            this.scanning_job_id.MaxValue = ((long)(9223372036854775807));
            this.scanning_job_id.MinValue = ((long)(-9223372036854775808));
            this.scanning_job_id.Name = "scanning_job_id";
            this.scanning_job_id.PercentageWidth = 25;
            this.scanning_job_id.ReadOnly = true;
            this.scanning_job_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.scanning_job_id.ToolTipLookupField = "information";
            this.scanning_job_id.Width = 5;
            // 
            // scanning_job_type_cd
            // 
            this.scanning_job_type_cd.BindingKey = "scanning_job_type_cd";
            this.scanning_job_type_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.scanning_job_type_cd.HeaderText = "scanning_job_type_cd";
            this.scanning_job_type_cd.Lookup = false;
            this.scanning_job_type_cd.LookupColumns = "";
            this.scanning_job_type_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.scanning_job_type_cd.Mandatory = false;
            this.scanning_job_type_cd.MaxCharacterLength = 2147483647;
            this.scanning_job_type_cd.Name = "scanning_job_type_cd";
            this.scanning_job_type_cd.PercentageWidth = 25;
            this.scanning_job_type_cd.ReadOnly = true;
            this.scanning_job_type_cd.RegularExpressionValidator = "";
            this.scanning_job_type_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.scanning_job_type_cd.ToolTipLookupField = "information";
            this.scanning_job_type_cd.Width = 5;
            // 
            // scanning_job_nm
            // 
            this.scanning_job_nm.BindingKey = "scanning_job_nm";
            this.scanning_job_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.scanning_job_nm.HeaderText = "scanning_job_nm";
            this.scanning_job_nm.Lookup = false;
            this.scanning_job_nm.LookupColumns = "";
            this.scanning_job_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.scanning_job_nm.Mandatory = false;
            this.scanning_job_nm.MaxCharacterLength = 2147483647;
            this.scanning_job_nm.Name = "scanning_job_nm";
            this.scanning_job_nm.PercentageWidth = 25;
            this.scanning_job_nm.ReadOnly = true;
            this.scanning_job_nm.RegularExpressionValidator = "";
            this.scanning_job_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.scanning_job_nm.ToolTipLookupField = "information";
            this.scanning_job_nm.Width = 5;
            // 
            // controlling_dt
            // 
            this.controlling_dt.BindingKey = "controlling_dt";
            this.controlling_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.controlling_dt.DefaultCellStyle = dataGridViewCellStyle3;
            this.controlling_dt.HeaderText = "controlling_dt";
            this.controlling_dt.Lookup = false;
            this.controlling_dt.LookupColumns = "";
            this.controlling_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.controlling_dt.Mandatory = false;
            this.controlling_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.controlling_dt.MinValue = new System.DateTime(((long)(0)));
            this.controlling_dt.Name = "controlling_dt";
            this.controlling_dt.PercentageWidth = 25;
            this.controlling_dt.ReadOnly = true;
            this.controlling_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.controlling_dt.ToolTipLookupField = "information";
            this.controlling_dt.Width = 5;
            // 
            // last_transfer_dtm
            // 
            this.last_transfer_dtm.BindingKey = "last_transfer_dtm";
            this.last_transfer_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.last_transfer_dtm.DefaultCellStyle = dataGridViewCellStyle4;
            this.last_transfer_dtm.HeaderText = "last_transfer_dtm";
            this.last_transfer_dtm.Lookup = false;
            this.last_transfer_dtm.LookupColumns = "";
            this.last_transfer_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.last_transfer_dtm.Mandatory = false;
            this.last_transfer_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.last_transfer_dtm.MinValue = new System.DateTime(((long)(0)));
            this.last_transfer_dtm.Name = "last_transfer_dtm";
            this.last_transfer_dtm.PercentageWidth = 25;
            this.last_transfer_dtm.ReadOnly = true;
            this.last_transfer_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.last_transfer_dtm.ToolTipLookupField = "information";
            this.last_transfer_dtm.Width = 5;
            // 
            // total_processed_cnt
            // 
            this.total_processed_cnt.BindingKey = "total_processed_cnt";
            this.total_processed_cnt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.total_processed_cnt.DefaultCellStyle = dataGridViewCellStyle5;
            this.total_processed_cnt.HeaderText = "total_processed_cnt";
            this.total_processed_cnt.Lookup = false;
            this.total_processed_cnt.LookupColumns = "";
            this.total_processed_cnt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.total_processed_cnt.Mandatory = false;
            this.total_processed_cnt.MaxValue = ((long)(9223372036854775807));
            this.total_processed_cnt.MinValue = ((long)(-9223372036854775808));
            this.total_processed_cnt.Name = "total_processed_cnt";
            this.total_processed_cnt.PercentageWidth = 25;
            this.total_processed_cnt.ReadOnly = true;
            this.total_processed_cnt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.total_processed_cnt.ToolTipLookupField = "information";
            this.total_processed_cnt.Width = 5;
            // 
            // is_closed
            // 
            this.is_closed.BindingKey = "is_closed";
            this.is_closed.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.is_closed.HeaderText = "is_closed";
            this.is_closed.Lookup = false;
            this.is_closed.LookupColumns = "";
            this.is_closed.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_closed.Mandatory = false;
            this.is_closed.MaxCharacterLength = 2147483647;
            this.is_closed.Name = "is_closed";
            this.is_closed.PercentageWidth = 25;
            this.is_closed.ReadOnly = true;
            this.is_closed.RegularExpressionValidator = "";
            this.is_closed.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_closed.ToolTipLookupField = "information";
            this.is_closed.Width = 5;
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
            this.txn_ts.Width = 5;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 3;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.Controls.Add(this.dccTextField1, 0, 0);
            this.tableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 1;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(200, 100);
            this.tableLayoutPanel2.TabIndex = 0;
            // 
            // dccTextField1
            // 
            this.dccTextField1.AllowsNew = false;
            this.dccTextField1.AllowsReference = false;
            this.dccTextField1.AllowsUpdate = false;
            this.dccTextField1.ApplicationIdForDbConnection = null;
            this.dccTextField1.BackColor = System.Drawing.Color.Transparent;
            this.dccTextField1.CalledScreenApplicationId = null;
            this.dccTextField1.CalledScreenTypeName = null;
            this.dccTextField1.CallingScreenType = null;
            this.dccTextField1.DisplayText = "";
            this.dccTextField1.DisplayTextBindingKey = null;
            this.dccTextField1.Dock = System.Windows.Forms.DockStyle.Right;
            this.dccTextField1.EditingControlDataGridView = null;
            this.dccTextField1.EditingControlFormattedValue = "";
            this.dccTextField1.EditingControlRowIndex = 0;
            this.dccTextField1.EditingControlValueChanged = false;
            this.dccTextField1.EnableToolTip = false;
            this.dccTextField1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccTextField1.IdText = null;
            this.dccTextField1.IdTextBindingKey = null;
            this.dccTextField1.Location = new System.Drawing.Point(150, 3);
            this.dccTextField1.Lookup = false;
            this.dccTextField1.LookupColumns = null;
            this.dccTextField1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextField1.LookupResult = null;
            this.dccTextField1.Mandatory = true;
            this.dccTextField1.Margin = new System.Windows.Forms.Padding(150, 3, 50, 3);
            this.dccTextField1.MaxCharacterLength = 8;
            this.dccTextField1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.dccTextField1.MinimumSize = new System.Drawing.Size(10, 22);
            this.dccTextField1.Name = "dccTextField1";
            this.dccTextField1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.dccTextField1.PascalCase = false;
            this.dccTextField1.RangeInQueryMode = false;
            this.dccTextField1.ReadOnly = false;
            this.dccTextField1.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.dccTextField1.Size = new System.Drawing.Size(10, 44);
            this.dccTextField1.TabIndex = 0;
            this.dccTextField1.Title = "Country Code";
            this.dccTextField1.ToolTipLookupField = "information";
            this.dccTextField1.ValueText = null;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dccGrid1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(200, 52);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(200, 3, 200, 3);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1, 253);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Subjects";
            // 
            // dccGrid1
            // 
            this.dccGrid1.AllowRowSorting = false;
            this.dccGrid1.AllowUserToAddRows = false;
            this.dccGrid1.AutoAddNewRowForUser = false;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle6.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle6.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle6.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle6.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle6.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dccGrid1.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle6;
            this.dccGrid1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dccGrid1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dccTextFieldGridColumn1,
            this.dccTextFieldGridColumn2,
            this.dccDateGridColumn1,
            this.dccDateGridColumn2,
            this.dccDateGridColumn3,
            this.dccDateGridColumn4});
            this.dccGrid1.DeleteRowMenuEnabled = true;
            this.dccGrid1.DeleteVisible = true;
            this.dccGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccGrid1.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dccGrid1.ExportToExcelVisible = true;
            this.dccGrid1.InsertAfterVisible = true;
            this.dccGrid1.InsertBeforeVisible = true;
            this.dccGrid1.InsertLastVisible = true;
            this.dccGrid1.InsertRowsMenuItemsEnabled = true;
            this.dccGrid1.Location = new System.Drawing.Point(3, 16);
            this.dccGrid1.Mandatory = false;
            this.dccGrid1.MoveDownVisible = false;
            this.dccGrid1.MoveUpVisible = false;
            this.dccGrid1.MultiSelect = false;
            this.dccGrid1.Name = "dccGrid1";
            this.dccGrid1.RowHeadersWidth = 15;
            this.dccGrid1.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.dccGrid1.ShowCommandStrip = false;
            this.dccGrid1.Size = new System.Drawing.Size(0, 234);
            this.dccGrid1.TabIndex = 3;
            this.dccGrid1.Title = null;
            this.dccGrid1.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.dccGrid1.VirtualMode = true;
            // 
            // dccTextFieldGridColumn1
            // 
            this.dccTextFieldGridColumn1.BindingKey = "qlfctn_subject_id";
            this.dccTextFieldGridColumn1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.dccTextFieldGridColumn1.HeaderText = "SubjectID";
            this.dccTextFieldGridColumn1.Lookup = false;
            this.dccTextFieldGridColumn1.LookupColumns = "";
            this.dccTextFieldGridColumn1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextFieldGridColumn1.Mandatory = false;
            this.dccTextFieldGridColumn1.MaxCharacterLength = 2147483647;
            this.dccTextFieldGridColumn1.Name = "dccTextFieldGridColumn1";
            this.dccTextFieldGridColumn1.PercentageWidth = 5;
            this.dccTextFieldGridColumn1.RegularExpressionValidator = "";
            this.dccTextFieldGridColumn1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccTextFieldGridColumn1.ToolTipLookupField = "information";
            this.dccTextFieldGridColumn1.Visible = false;
            this.dccTextFieldGridColumn1.Width = 25;
            // 
            // dccTextFieldGridColumn2
            // 
            this.dccTextFieldGridColumn2.BindingKey = "qlfctn_subject_nm";
            this.dccTextFieldGridColumn2.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.dccTextFieldGridColumn2.HeaderText = "Subject";
            this.dccTextFieldGridColumn2.Lookup = true;
            this.dccTextFieldGridColumn2.LookupColumns = resources.GetString("dccTextFieldGridColumn2.LookupColumns");
            this.dccTextFieldGridColumn2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextFieldGridColumn2.Mandatory = true;
            this.dccTextFieldGridColumn2.MaxCharacterLength = 2147483647;
            this.dccTextFieldGridColumn2.Name = "dccTextFieldGridColumn2";
            this.dccTextFieldGridColumn2.PercentageWidth = 50;
            this.dccTextFieldGridColumn2.RegularExpressionValidator = "";
            this.dccTextFieldGridColumn2.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccTextFieldGridColumn2.ToolTipLookupField = "information";
            this.dccTextFieldGridColumn2.Width = 5;
            // 
            // dccDateGridColumn1
            // 
            this.dccDateGridColumn1.BindingKey = "effective_from";
            this.dccDateGridColumn1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn1.DefaultCellStyle = dataGridViewCellStyle7;
            this.dccDateGridColumn1.HeaderText = "Effective From";
            this.dccDateGridColumn1.Lookup = false;
            this.dccDateGridColumn1.LookupColumns = "";
            this.dccDateGridColumn1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn1.Mandatory = false;
            this.dccDateGridColumn1.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn1.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn1.Name = "dccDateGridColumn1";
            this.dccDateGridColumn1.PercentageWidth = 25;
            this.dccDateGridColumn1.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dccDateGridColumn1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn1.ToolTipLookupField = "information";
            this.dccDateGridColumn1.Width = 5;
            // 
            // dccDateGridColumn2
            // 
            this.dccDateGridColumn2.BindingKey = "effective_from";
            this.dccDateGridColumn2.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn2.DefaultCellStyle = dataGridViewCellStyle8;
            this.dccDateGridColumn2.HeaderText = "OldEffectiveFrom";
            this.dccDateGridColumn2.Lookup = false;
            this.dccDateGridColumn2.LookupColumns = "";
            this.dccDateGridColumn2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn2.Mandatory = false;
            this.dccDateGridColumn2.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn2.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn2.Name = "dccDateGridColumn2";
            this.dccDateGridColumn2.PercentageWidth = 25;
            this.dccDateGridColumn2.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn2.ToolTipLookupField = "information";
            this.dccDateGridColumn2.Visible = false;
            this.dccDateGridColumn2.Width = 126;
            // 
            // dccDateGridColumn3
            // 
            this.dccDateGridColumn3.BindingKey = "effective_till";
            this.dccDateGridColumn3.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn3.DefaultCellStyle = dataGridViewCellStyle9;
            this.dccDateGridColumn3.HeaderText = "OldEffectiveTill";
            this.dccDateGridColumn3.Lookup = false;
            this.dccDateGridColumn3.LookupColumns = "";
            this.dccDateGridColumn3.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn3.Mandatory = false;
            this.dccDateGridColumn3.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn3.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn3.Name = "dccDateGridColumn3";
            this.dccDateGridColumn3.PercentageWidth = 25;
            this.dccDateGridColumn3.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn3.ToolTipLookupField = "information";
            this.dccDateGridColumn3.Visible = false;
            this.dccDateGridColumn3.Width = 126;
            // 
            // dccDateGridColumn4
            // 
            this.dccDateGridColumn4.BindingKey = "effective_till";
            this.dccDateGridColumn4.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn4.DefaultCellStyle = dataGridViewCellStyle10;
            this.dccDateGridColumn4.HeaderText = "Effective Till";
            this.dccDateGridColumn4.Lookup = false;
            this.dccDateGridColumn4.LookupColumns = "";
            this.dccDateGridColumn4.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn4.Mandatory = false;
            this.dccDateGridColumn4.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn4.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn4.Name = "dccDateGridColumn4";
            this.dccDateGridColumn4.PercentageWidth = 25;
            this.dccDateGridColumn4.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dccDateGridColumn4.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn4.ToolTipLookupField = "information";
            this.dccDateGridColumn4.Width = 5;
            // 
            // ScanningControlDates
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1291, 662);
            this.Controls.Add(this.scListOrBrowse);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "ScanningControlDates";
            this.Text = "Zonal Sewadar Management - Scanning Control Dates]";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpTopMost.ResumeLayout(false);
            this.tlpTopMost.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.tableLayoutPanel2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField dccTextField1;
        private System.Windows.Forms.GroupBox groupBox1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid dccGrid1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn dccTextFieldGridColumn1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn dccTextFieldGridColumn2;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn2;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn3;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn4;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTopMost;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.JobNameControllingDateLookup lkpJobName;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtControlingDate;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtLastTransferDtm;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intTotalProcessedCount;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkIsClosed;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn scanning_job_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn scanning_job_type_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn scanning_job_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn controlling_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn last_transfer_dtm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn total_processed_cnt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn is_closed;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtScanningJobTypeCd;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentre;
    }
}