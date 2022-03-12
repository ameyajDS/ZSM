namespace AES
{
    partial class Assets
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Assets));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.tlpMain = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpHeader = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.cmbZone = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.cmbCentreType = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.txtSatsangCentre = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpHeadings = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.lblItemDetails = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.pnlSummaryDetailMainContainer = new System.Windows.Forms.Panel();
            this.scSummaryDetails = new System.Windows.Forms.SplitContainer();
            this.tlpDetailViewMainPanel = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextArea();
            this.tlpItemDetailsPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtItemDetails = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtEngineNo = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtChasisNo = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtQuantity = new DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField();
            this.cmbAssetType = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.txtIdNumber = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtItemModel = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpItemDetailsPanel2 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtItemName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.grpAquisition = new System.Windows.Forms.GroupBox();
            this.tlpAquisition = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtAquisitionCost = new DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField();
            this.txtAquisitionDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.grpPresent = new System.Windows.Forms.GroupBox();
            this.tlpPresent = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtPresentValue = new DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField();
            this.txtValuationDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.grdSummary = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.asset_type_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.asset_type_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.asset_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.make_model = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.quantity = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn();
            this.chasis_no = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.engine_no = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.details = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.item_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.item_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.acquisition_cost = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn();
            this.present_value = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn();
            this.acquisition_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.valuation_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.summaryDetailNavigator1 = new DCC.UMB.CDF.UIControls.SummaryDetailNavigator();
            this.listBrowseSplitContainer = new System.Windows.Forms.SplitContainer();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.zone_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.centre_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.satsang_centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.tlpMain.SuspendLayout();
            this.tlpHeader.SuspendLayout();
            this.tlpHeadings.SuspendLayout();
            this.pnlSummaryDetailMainContainer.SuspendLayout();
            this.scSummaryDetails.Panel1.SuspendLayout();
            this.scSummaryDetails.Panel2.SuspendLayout();
            this.scSummaryDetails.SuspendLayout();
            this.tlpDetailViewMainPanel.SuspendLayout();
            this.tlpItemDetailsPanel1.SuspendLayout();
            this.tlpItemDetailsPanel2.SuspendLayout();
            this.grpAquisition.SuspendLayout();
            this.tlpAquisition.SuspendLayout();
            this.grpPresent.SuspendLayout();
            this.tlpPresent.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSummary)).BeginInit();
            this.listBrowseSplitContainer.Panel1.SuspendLayout();
            this.listBrowseSplitContainer.Panel2.SuspendLayout();
            this.listBrowseSplitContainer.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpMain
            // 
            this.tlpMain.ColumnCount = 1;
            this.tlpMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpMain.Controls.Add(this.tlpHeader, 0, 0);
            this.tlpMain.Controls.Add(this.tlpHeadings, 0, 1);
            this.tlpMain.Controls.Add(this.pnlSummaryDetailMainContainer, 0, 2);
            this.tlpMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpMain.Location = new System.Drawing.Point(0, 0);
            this.tlpMain.Name = "tlpMain";
            this.tlpMain.RowCount = 3;
            this.tlpMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.63964F));
            this.tlpMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.783784F));
            this.tlpMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 76.57658F));
            this.tlpMain.Size = new System.Drawing.Size(802, 555);
            this.tlpMain.TabIndex = 0;
            // 
            // tlpHeader
            // 
            this.tlpHeader.ColumnCount = 3;
            this.tlpHeader.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpHeader.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpHeader.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 245F));
            this.tlpHeader.Controls.Add(this.cmbZone, 0, 0);
            this.tlpHeader.Controls.Add(this.cmbCentreType, 1, 0);
            this.tlpHeader.Controls.Add(this.txtSatsangCentre, 2, 0);
            this.tlpHeader.Location = new System.Drawing.Point(3, 3);
            this.tlpHeader.Name = "tlpHeader";
            this.tlpHeader.RowCount = 1;
            this.tlpHeader.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpHeader.Size = new System.Drawing.Size(643, 70);
            this.tlpHeader.TabIndex = 0;
            // 
            // cmbZone
            // 
            this.cmbZone.BackColor = System.Drawing.Color.Transparent;
            this.cmbZone.DataSource = null;
            this.cmbZone.DisplayMember = "";
            this.cmbZone.DisplayText = "";
            this.cmbZone.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbZone.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbZone.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbZone.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.cmbZone.IdText = null;
            this.cmbZone.Location = new System.Drawing.Point(4, 3);
            this.cmbZone.Mandatory = true;
            this.cmbZone.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbZone.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbZone.MinimumSize = new System.Drawing.Size(0, 28);
            this.cmbZone.Name = "cmbZone";
            this.cmbZone.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbZone.SelectedIndex = -1;
            this.cmbZone.SelectedValue = null;
            this.cmbZone.Size = new System.Drawing.Size(191, 44);
            this.cmbZone.TabIndex = 0;
            this.cmbZone.Title = "Zone";
            this.cmbZone.ValueMember = "";
            this.cmbZone.ValueText = null;
            // 
            // cmbCentreType
            // 
            this.cmbCentreType.BackColor = System.Drawing.Color.Transparent;
            this.cmbCentreType.DataSource = null;
            this.cmbCentreType.DisplayMember = "";
            this.cmbCentreType.DisplayText = "";
            this.cmbCentreType.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbCentreType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCentreType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbCentreType.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.cmbCentreType.IdText = null;
            this.cmbCentreType.Location = new System.Drawing.Point(203, 3);
            this.cmbCentreType.Mandatory = true;
            this.cmbCentreType.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbCentreType.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbCentreType.MinimumSize = new System.Drawing.Size(0, 28);
            this.cmbCentreType.Name = "cmbCentreType";
            this.cmbCentreType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbCentreType.SelectedIndex = -1;
            this.cmbCentreType.SelectedValue = null;
            this.cmbCentreType.Size = new System.Drawing.Size(191, 44);
            this.cmbCentreType.TabIndex = 1;
            this.cmbCentreType.Title = "Centre Type";
            this.cmbCentreType.ValueMember = "";
            this.cmbCentreType.ValueText = null;
            // 
            // txtSatsangCentre
            // 
            this.txtSatsangCentre.AllowsNew = true;
            this.txtSatsangCentre.AllowsReference = true;
            this.txtSatsangCentre.AllowsUpdate = true;
            this.txtSatsangCentre.ApplicationIdForDbConnection = "";
            this.txtSatsangCentre.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangCentre.CalledScreenApplicationId = null;
            this.txtSatsangCentre.CalledScreenTypeName = null;
            this.txtSatsangCentre.CallingScreenType = null;
            this.txtSatsangCentre.DisplayText = "";
            this.txtSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentre.EditingControlDataGridView = null;
            this.txtSatsangCentre.EditingControlFormattedValue = null;
            this.txtSatsangCentre.EditingControlRowIndex = 0;
            this.txtSatsangCentre.EditingControlValueChanged = false;
            this.txtSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentre.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtSatsangCentre.IdText = null;
            this.txtSatsangCentre.Location = new System.Drawing.Point(402, 3);
            this.txtSatsangCentre.Lookup = true;
            this.txtSatsangCentre.LookupColumns = resources.GetString("txtSatsangCentre.LookupColumns");
            this.txtSatsangCentre.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentre.Mandatory = false;
            this.txtSatsangCentre.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSatsangCentre.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtSatsangCentre.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtSatsangCentre.Name = "txtSatsangCentre";
            this.txtSatsangCentre.Padding = new System.Windows.Forms.Padding(0, 16, 14, 0);
            this.txtSatsangCentre.ReadOnly = false;
            this.txtSatsangCentre.Size = new System.Drawing.Size(237, 44);
            this.txtSatsangCentre.TabIndex = 2;
            this.txtSatsangCentre.Title = "Satsang Centre";
            this.txtSatsangCentre.ValueText = null;
            // 
            // tlpHeadings
            // 
            this.tlpHeadings.ColumnCount = 2;
            this.tlpHeadings.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 47.74194F));
            this.tlpHeadings.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 52.25806F));
            this.tlpHeadings.Controls.Add(this.lblItemDetails, 0, 0);
            this.tlpHeadings.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpHeadings.Location = new System.Drawing.Point(3, 84);
            this.tlpHeadings.Name = "tlpHeadings";
            this.tlpHeadings.RowCount = 1;
            this.tlpHeadings.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpHeadings.Size = new System.Drawing.Size(796, 42);
            this.tlpHeadings.TabIndex = 1;
            // 
            // lblItemDetails
            // 
            this.lblItemDetails.AutoSize = true;
            this.lblItemDetails.BackColor = System.Drawing.Color.Transparent;
            this.lblItemDetails.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblItemDetails.Font = new System.Drawing.Font("Verdana", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblItemDetails.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblItemDetails.Location = new System.Drawing.Point(20, 0);
            this.lblItemDetails.Margin = new System.Windows.Forms.Padding(20, 0, 3, 0);
            this.lblItemDetails.Name = "lblItemDetails";
            this.lblItemDetails.Size = new System.Drawing.Size(357, 42);
            this.lblItemDetails.TabIndex = 0;
            this.lblItemDetails.Text = "Item Details";
            this.lblItemDetails.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // pnlSummaryDetailMainContainer
            // 
            this.pnlSummaryDetailMainContainer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnlSummaryDetailMainContainer.Controls.Add(this.scSummaryDetails);
            this.pnlSummaryDetailMainContainer.Controls.Add(this.summaryDetailNavigator1);
            this.pnlSummaryDetailMainContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlSummaryDetailMainContainer.Location = new System.Drawing.Point(3, 132);
            this.pnlSummaryDetailMainContainer.Name = "pnlSummaryDetailMainContainer";
            this.pnlSummaryDetailMainContainer.Size = new System.Drawing.Size(796, 420);
            this.pnlSummaryDetailMainContainer.TabIndex = 2;
            // 
            // scSummaryDetails
            // 
            this.scSummaryDetails.Dock = System.Windows.Forms.DockStyle.Fill;
            this.scSummaryDetails.Location = new System.Drawing.Point(0, 0);
            this.scSummaryDetails.Name = "scSummaryDetails";
            // 
            // scSummaryDetails.Panel1
            // 
            this.scSummaryDetails.Panel1.Controls.Add(this.tlpDetailViewMainPanel);
            this.scSummaryDetails.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.scSummaryDetails.Panel1MinSize = 0;
            // 
            // scSummaryDetails.Panel2
            // 
            this.scSummaryDetails.Panel2.Controls.Add(this.grdSummary);
            this.scSummaryDetails.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.scSummaryDetails.Panel2MinSize = 0;
            this.scSummaryDetails.Size = new System.Drawing.Size(688, 418);
            this.scSummaryDetails.SplitterDistance = 392;
            this.scSummaryDetails.TabIndex = 1;
            // 
            // tlpDetailViewMainPanel
            // 
            this.tlpDetailViewMainPanel.ColumnCount = 2;
            this.tlpDetailViewMainPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpDetailViewMainPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpDetailViewMainPanel.Controls.Add(this.txtRemarks, 0, 1);
            this.tlpDetailViewMainPanel.Controls.Add(this.tlpItemDetailsPanel1, 0, 0);
            this.tlpDetailViewMainPanel.Controls.Add(this.tlpItemDetailsPanel2, 1, 0);
            this.tlpDetailViewMainPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpDetailViewMainPanel.Location = new System.Drawing.Point(0, 0);
            this.tlpDetailViewMainPanel.Name = "tlpDetailViewMainPanel";
            this.tlpDetailViewMainPanel.RowCount = 2;
            this.tlpDetailViewMainPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 55F));
            this.tlpDetailViewMainPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 45F));
            this.tlpDetailViewMainPanel.Size = new System.Drawing.Size(392, 418);
            this.tlpDetailViewMainPanel.TabIndex = 0;
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
            this.tlpDetailViewMainPanel.SetColumnSpan(this.txtRemarks, 2);
            this.txtRemarks.DisplayText = "";
            this.txtRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRemarks.EditingControlDataGridView = null;
            this.txtRemarks.EditingControlFormattedValue = "";
            this.txtRemarks.EditingControlRowIndex = 0;
            this.txtRemarks.EditingControlValueChanged = false;
            this.txtRemarks.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRemarks.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtRemarks.IdText = null;
            this.txtRemarks.Location = new System.Drawing.Point(4, 232);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(4, 3, 15, 10);
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 2000);
            this.txtRemarks.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.Size = new System.Drawing.Size(373, 176);
            this.txtRemarks.TabIndex = 0;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ValueText = null;
            // 
            // tlpItemDetailsPanel1
            // 
            this.tlpItemDetailsPanel1.ColumnCount = 4;
            this.tlpItemDetailsPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpItemDetailsPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpItemDetailsPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpItemDetailsPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpItemDetailsPanel1.Controls.Add(this.txtItemDetails, 0, 3);
            this.tlpItemDetailsPanel1.Controls.Add(this.txtEngineNo, 2, 2);
            this.tlpItemDetailsPanel1.Controls.Add(this.txtChasisNo, 0, 2);
            this.tlpItemDetailsPanel1.Controls.Add(this.txtQuantity, 3, 1);
            this.tlpItemDetailsPanel1.Controls.Add(this.cmbAssetType, 0, 0);
            this.tlpItemDetailsPanel1.Controls.Add(this.txtIdNumber, 3, 0);
            this.tlpItemDetailsPanel1.Controls.Add(this.txtItemModel, 0, 1);
            this.tlpItemDetailsPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpItemDetailsPanel1.Location = new System.Drawing.Point(3, 3);
            this.tlpItemDetailsPanel1.Name = "tlpItemDetailsPanel1";
            this.tlpItemDetailsPanel1.RowCount = 4;
            this.tlpItemDetailsPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpItemDetailsPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpItemDetailsPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpItemDetailsPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpItemDetailsPanel1.Size = new System.Drawing.Size(190, 223);
            this.tlpItemDetailsPanel1.TabIndex = 1;
            // 
            // txtItemDetails
            // 
            this.txtItemDetails.AllowsNew = false;
            this.txtItemDetails.AllowsReference = false;
            this.txtItemDetails.AllowsUpdate = false;
            this.txtItemDetails.ApplicationIdForDbConnection = null;
            this.txtItemDetails.BackColor = System.Drawing.Color.Transparent;
            this.txtItemDetails.CalledScreenApplicationId = null;
            this.txtItemDetails.CalledScreenTypeName = null;
            this.txtItemDetails.CallingScreenType = null;
            this.tlpItemDetailsPanel1.SetColumnSpan(this.txtItemDetails, 4);
            this.txtItemDetails.DisplayText = "";
            this.txtItemDetails.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtItemDetails.EditingControlDataGridView = null;
            this.txtItemDetails.EditingControlFormattedValue = "";
            this.txtItemDetails.EditingControlRowIndex = 0;
            this.txtItemDetails.EditingControlValueChanged = false;
            this.txtItemDetails.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtItemDetails.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtItemDetails.IdText = null;
            this.txtItemDetails.Location = new System.Drawing.Point(4, 168);
            this.txtItemDetails.Lookup = false;
            this.txtItemDetails.LookupColumns = null;
            this.txtItemDetails.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtItemDetails.Mandatory = false;
            this.txtItemDetails.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtItemDetails.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtItemDetails.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtItemDetails.Name = "txtItemDetails";
            this.txtItemDetails.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtItemDetails.ReadOnly = false;
            this.txtItemDetails.Size = new System.Drawing.Size(182, 44);
            this.txtItemDetails.TabIndex = 7;
            this.txtItemDetails.Title = "Details";
            this.txtItemDetails.ValueText = null;
            // 
            // txtEngineNo
            // 
            this.txtEngineNo.AllowsNew = false;
            this.txtEngineNo.AllowsReference = false;
            this.txtEngineNo.AllowsUpdate = false;
            this.txtEngineNo.ApplicationIdForDbConnection = null;
            this.txtEngineNo.BackColor = System.Drawing.Color.Transparent;
            this.txtEngineNo.CalledScreenApplicationId = null;
            this.txtEngineNo.CalledScreenTypeName = null;
            this.txtEngineNo.CallingScreenType = null;
            this.tlpItemDetailsPanel1.SetColumnSpan(this.txtEngineNo, 2);
            this.txtEngineNo.DisplayText = "";
            this.txtEngineNo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtEngineNo.EditingControlDataGridView = null;
            this.txtEngineNo.EditingControlFormattedValue = "";
            this.txtEngineNo.EditingControlRowIndex = 0;
            this.txtEngineNo.EditingControlValueChanged = false;
            this.txtEngineNo.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEngineNo.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtEngineNo.IdText = null;
            this.txtEngineNo.Location = new System.Drawing.Point(98, 113);
            this.txtEngineNo.Lookup = false;
            this.txtEngineNo.LookupColumns = null;
            this.txtEngineNo.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtEngineNo.Mandatory = false;
            this.txtEngineNo.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtEngineNo.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtEngineNo.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtEngineNo.Name = "txtEngineNo";
            this.txtEngineNo.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtEngineNo.ReadOnly = false;
            this.txtEngineNo.Size = new System.Drawing.Size(88, 44);
            this.txtEngineNo.TabIndex = 6;
            this.txtEngineNo.Title = "Engine No.";
            this.txtEngineNo.ValueText = null;
            // 
            // txtChasisNo
            // 
            this.txtChasisNo.AllowsNew = false;
            this.txtChasisNo.AllowsReference = false;
            this.txtChasisNo.AllowsUpdate = false;
            this.txtChasisNo.ApplicationIdForDbConnection = null;
            this.txtChasisNo.BackColor = System.Drawing.Color.Transparent;
            this.txtChasisNo.CalledScreenApplicationId = null;
            this.txtChasisNo.CalledScreenTypeName = null;
            this.txtChasisNo.CallingScreenType = null;
            this.tlpItemDetailsPanel1.SetColumnSpan(this.txtChasisNo, 2);
            this.txtChasisNo.DisplayText = "";
            this.txtChasisNo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtChasisNo.EditingControlDataGridView = null;
            this.txtChasisNo.EditingControlFormattedValue = "";
            this.txtChasisNo.EditingControlRowIndex = 0;
            this.txtChasisNo.EditingControlValueChanged = false;
            this.txtChasisNo.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtChasisNo.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtChasisNo.IdText = null;
            this.txtChasisNo.Location = new System.Drawing.Point(4, 113);
            this.txtChasisNo.Lookup = false;
            this.txtChasisNo.LookupColumns = null;
            this.txtChasisNo.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtChasisNo.Mandatory = false;
            this.txtChasisNo.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtChasisNo.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtChasisNo.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtChasisNo.Name = "txtChasisNo";
            this.txtChasisNo.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtChasisNo.ReadOnly = false;
            this.txtChasisNo.Size = new System.Drawing.Size(86, 44);
            this.txtChasisNo.TabIndex = 4;
            this.txtChasisNo.Title = "Chassis No.";
            this.txtChasisNo.ValueText = null;
            // 
            // txtQuantity
            // 
            this.txtQuantity.AllowsNew = false;
            this.txtQuantity.AllowsReference = false;
            this.txtQuantity.AllowsUpdate = false;
            this.txtQuantity.ApplicationIdForDbConnection = null;
            this.txtQuantity.BackColor = System.Drawing.Color.Transparent;
            this.txtQuantity.CalledScreenApplicationId = null;
            this.txtQuantity.CalledScreenTypeName = null;
            this.txtQuantity.CallingScreenType = null;
            this.txtQuantity.DisplayText = "";
            this.txtQuantity.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtQuantity.EditingControlDataGridView = null;
            this.txtQuantity.EditingControlFormattedValue = "";
            this.txtQuantity.EditingControlRowIndex = 0;
            this.txtQuantity.EditingControlValueChanged = false;
            this.txtQuantity.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtQuantity.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtQuantity.IdText = null;
            this.txtQuantity.Location = new System.Drawing.Point(145, 58);
            this.txtQuantity.Lookup = false;
            this.txtQuantity.LookupColumns = null;
            this.txtQuantity.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtQuantity.Mandatory = true;
            this.txtQuantity.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtQuantity.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtQuantity.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtQuantity.Name = "txtQuantity";
            this.txtQuantity.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtQuantity.ReadOnly = false;
            this.txtQuantity.Size = new System.Drawing.Size(41, 44);
            this.txtQuantity.TabIndex = 3;
            this.txtQuantity.Title = "Quantity";
            this.txtQuantity.ValueText = null;
            // 
            // cmbAssetType
            // 
            this.cmbAssetType.BackColor = System.Drawing.Color.Transparent;
            this.tlpItemDetailsPanel1.SetColumnSpan(this.cmbAssetType, 3);
            this.cmbAssetType.DataSource = null;
            this.cmbAssetType.DisplayMember = "";
            this.cmbAssetType.DisplayText = "";
            this.cmbAssetType.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbAssetType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAssetType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbAssetType.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.cmbAssetType.IdText = null;
            this.cmbAssetType.Location = new System.Drawing.Point(4, 3);
            this.cmbAssetType.Mandatory = true;
            this.cmbAssetType.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbAssetType.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbAssetType.MinimumSize = new System.Drawing.Size(0, 28);
            this.cmbAssetType.Name = "cmbAssetType";
            this.cmbAssetType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbAssetType.SelectedIndex = -1;
            this.cmbAssetType.SelectedValue = null;
            this.cmbAssetType.Size = new System.Drawing.Size(133, 44);
            this.cmbAssetType.TabIndex = 0;
            this.cmbAssetType.Title = "Asset Type";
            this.cmbAssetType.ValueMember = "";
            this.cmbAssetType.ValueText = null;
            // 
            // txtIdNumber
            // 
            this.txtIdNumber.AllowsNew = false;
            this.txtIdNumber.AllowsReference = false;
            this.txtIdNumber.AllowsUpdate = false;
            this.txtIdNumber.ApplicationIdForDbConnection = null;
            this.txtIdNumber.BackColor = System.Drawing.Color.Transparent;
            this.txtIdNumber.CalledScreenApplicationId = null;
            this.txtIdNumber.CalledScreenTypeName = null;
            this.txtIdNumber.CallingScreenType = null;
            this.txtIdNumber.DisplayText = "";
            this.txtIdNumber.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtIdNumber.EditingControlDataGridView = null;
            this.txtIdNumber.EditingControlFormattedValue = "";
            this.txtIdNumber.EditingControlRowIndex = 0;
            this.txtIdNumber.EditingControlValueChanged = false;
            this.txtIdNumber.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtIdNumber.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtIdNumber.IdText = null;
            this.txtIdNumber.Location = new System.Drawing.Point(145, 3);
            this.txtIdNumber.Lookup = false;
            this.txtIdNumber.LookupColumns = null;
            this.txtIdNumber.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtIdNumber.Mandatory = false;
            this.txtIdNumber.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtIdNumber.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtIdNumber.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtIdNumber.Name = "txtIdNumber";
            this.txtIdNumber.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtIdNumber.ReadOnly = true;
            this.txtIdNumber.Size = new System.Drawing.Size(41, 44);
            this.txtIdNumber.TabIndex = 1;
            this.txtIdNumber.Title = "ID No.";
            this.txtIdNumber.ValueText = null;
            // 
            // txtItemModel
            // 
            this.txtItemModel.AllowsNew = false;
            this.txtItemModel.AllowsReference = false;
            this.txtItemModel.AllowsUpdate = false;
            this.txtItemModel.ApplicationIdForDbConnection = null;
            this.txtItemModel.BackColor = System.Drawing.Color.Transparent;
            this.txtItemModel.CalledScreenApplicationId = null;
            this.txtItemModel.CalledScreenTypeName = null;
            this.txtItemModel.CallingScreenType = null;
            this.tlpItemDetailsPanel1.SetColumnSpan(this.txtItemModel, 3);
            this.txtItemModel.DisplayText = "";
            this.txtItemModel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtItemModel.EditingControlDataGridView = null;
            this.txtItemModel.EditingControlFormattedValue = "";
            this.txtItemModel.EditingControlRowIndex = 0;
            this.txtItemModel.EditingControlValueChanged = false;
            this.txtItemModel.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtItemModel.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtItemModel.IdText = null;
            this.txtItemModel.Location = new System.Drawing.Point(4, 58);
            this.txtItemModel.Lookup = false;
            this.txtItemModel.LookupColumns = null;
            this.txtItemModel.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtItemModel.Mandatory = true;
            this.txtItemModel.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtItemModel.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtItemModel.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtItemModel.Name = "txtItemModel";
            this.txtItemModel.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtItemModel.ReadOnly = false;
            this.txtItemModel.Size = new System.Drawing.Size(133, 44);
            this.txtItemModel.TabIndex = 2;
            this.txtItemModel.Title = "Make / Model";
            this.txtItemModel.ValueText = null;
            // 
            // tlpItemDetailsPanel2
            // 
            this.tlpItemDetailsPanel2.ColumnCount = 2;
            this.tlpItemDetailsPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpItemDetailsPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpItemDetailsPanel2.Controls.Add(this.txtItemName, 0, 0);
            this.tlpItemDetailsPanel2.Controls.Add(this.grpAquisition, 0, 1);
            this.tlpItemDetailsPanel2.Controls.Add(this.grpPresent, 1, 1);
            this.tlpItemDetailsPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpItemDetailsPanel2.Location = new System.Drawing.Point(199, 3);
            this.tlpItemDetailsPanel2.Name = "tlpItemDetailsPanel2";
            this.tlpItemDetailsPanel2.RowCount = 2;
            this.tlpItemDetailsPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 23.4375F));
            this.tlpItemDetailsPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 76.5625F));
            this.tlpItemDetailsPanel2.Size = new System.Drawing.Size(190, 223);
            this.tlpItemDetailsPanel2.TabIndex = 2;
            // 
            // txtItemName
            // 
            this.txtItemName.AllowsNew = true;
            this.txtItemName.AllowsReference = true;
            this.txtItemName.AllowsUpdate = true;
            this.txtItemName.ApplicationIdForDbConnection = null;
            this.txtItemName.BackColor = System.Drawing.Color.Transparent;
            this.txtItemName.CalledScreenApplicationId = null;
            this.txtItemName.CalledScreenTypeName = null;
            this.txtItemName.CallingScreenType = null;
            this.tlpItemDetailsPanel2.SetColumnSpan(this.txtItemName, 2);
            this.txtItemName.DisplayText = "";
            this.txtItemName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtItemName.EditingControlDataGridView = null;
            this.txtItemName.EditingControlFormattedValue = null;
            this.txtItemName.EditingControlRowIndex = 0;
            this.txtItemName.EditingControlValueChanged = true;
            this.txtItemName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtItemName.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtItemName.IdText = null;
            this.txtItemName.Location = new System.Drawing.Point(4, 3);
            this.txtItemName.Lookup = true;
            this.txtItemName.LookupColumns = resources.GetString("txtItemName.LookupColumns");
            this.txtItemName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtItemName.Mandatory = true;
            this.txtItemName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtItemName.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtItemName.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtItemName.Name = "txtItemName";
            this.txtItemName.Padding = new System.Windows.Forms.Padding(0, 16, 14, 0);
            this.txtItemName.ReadOnly = false;
            this.txtItemName.Size = new System.Drawing.Size(182, 44);
            this.txtItemName.TabIndex = 2;
            this.txtItemName.Title = "Item Name";
            this.txtItemName.ValueText = null;
            // 
            // grpAquisition
            // 
            this.grpAquisition.Controls.Add(this.tlpAquisition);
            this.grpAquisition.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpAquisition.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpAquisition.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.grpAquisition.Location = new System.Drawing.Point(3, 55);
            this.grpAquisition.Name = "grpAquisition";
            this.grpAquisition.Size = new System.Drawing.Size(89, 165);
            this.grpAquisition.TabIndex = 3;
            this.grpAquisition.TabStop = false;
            this.grpAquisition.Text = "Aquisition";
            // 
            // tlpAquisition
            // 
            this.tlpAquisition.ColumnCount = 1;
            this.tlpAquisition.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpAquisition.Controls.Add(this.txtAquisitionCost, 0, 0);
            this.tlpAquisition.Controls.Add(this.txtAquisitionDate, 0, 1);
            this.tlpAquisition.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpAquisition.Location = new System.Drawing.Point(3, 19);
            this.tlpAquisition.Name = "tlpAquisition";
            this.tlpAquisition.RowCount = 2;
            this.tlpAquisition.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpAquisition.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpAquisition.Size = new System.Drawing.Size(83, 143);
            this.tlpAquisition.TabIndex = 0;
            // 
            // txtAquisitionCost
            // 
            this.txtAquisitionCost.AllowsNew = false;
            this.txtAquisitionCost.AllowsReference = false;
            this.txtAquisitionCost.AllowsUpdate = false;
            this.txtAquisitionCost.ApplicationIdForDbConnection = null;
            this.txtAquisitionCost.BackColor = System.Drawing.Color.Transparent;
            this.txtAquisitionCost.CalledScreenApplicationId = null;
            this.txtAquisitionCost.CalledScreenTypeName = null;
            this.txtAquisitionCost.CallingScreenType = null;
            this.txtAquisitionCost.DisplayText = "";
            this.txtAquisitionCost.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtAquisitionCost.EditingControlDataGridView = null;
            this.txtAquisitionCost.EditingControlFormattedValue = "";
            this.txtAquisitionCost.EditingControlRowIndex = 0;
            this.txtAquisitionCost.EditingControlValueChanged = false;
            this.txtAquisitionCost.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAquisitionCost.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtAquisitionCost.IdText = null;
            this.txtAquisitionCost.Location = new System.Drawing.Point(4, 3);
            this.txtAquisitionCost.Lookup = false;
            this.txtAquisitionCost.LookupColumns = null;
            this.txtAquisitionCost.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtAquisitionCost.Mandatory = false;
            this.txtAquisitionCost.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtAquisitionCost.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtAquisitionCost.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtAquisitionCost.Name = "txtAquisitionCost";
            this.txtAquisitionCost.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtAquisitionCost.ReadOnly = false;
            this.txtAquisitionCost.Size = new System.Drawing.Size(75, 44);
            this.txtAquisitionCost.TabIndex = 2;
            this.txtAquisitionCost.Title = "Cost";
            this.txtAquisitionCost.ValueText = null;
            // 
            // txtAquisitionDate
            // 
            this.txtAquisitionDate.AllowsNew = false;
            this.txtAquisitionDate.AllowsReference = false;
            this.txtAquisitionDate.AllowsUpdate = false;
            this.txtAquisitionDate.ApplicationIdForDbConnection = null;
            this.txtAquisitionDate.BackColor = System.Drawing.Color.Transparent;
            this.txtAquisitionDate.CalledScreenApplicationId = null;
            this.txtAquisitionDate.CalledScreenTypeName = null;
            this.txtAquisitionDate.CallingScreenType = null;
            this.txtAquisitionDate.DisplayText = "06 Oct 2007";
            this.txtAquisitionDate.DisplayTextAsDateTime = new System.DateTime(2007, 10, 6, 18, 23, 8, 83);
            this.txtAquisitionDate.EditingControlDataGridView = null;
            this.txtAquisitionDate.EditingControlFormattedValue = new System.DateTime(2007, 10, 6, 18, 23, 8, 83);
            this.txtAquisitionDate.EditingControlRowIndex = 0;
            this.txtAquisitionDate.EditingControlValueChanged = true;
            this.txtAquisitionDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAquisitionDate.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtAquisitionDate.IdText = null;
            this.txtAquisitionDate.Location = new System.Drawing.Point(4, 74);
            this.txtAquisitionDate.Lookup = true;
            this.txtAquisitionDate.LookupColumns = null;
            this.txtAquisitionDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtAquisitionDate.Mandatory = false;
            this.txtAquisitionDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtAquisitionDate.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtAquisitionDate.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtAquisitionDate.Name = "txtAquisitionDate";
            this.txtAquisitionDate.Padding = new System.Windows.Forms.Padding(0, 16, 14, 0);
            this.txtAquisitionDate.ReadOnly = false;
            this.txtAquisitionDate.Size = new System.Drawing.Size(75, 38);
            this.txtAquisitionDate.TabIndex = 3;
            this.txtAquisitionDate.Title = "Date";
            this.txtAquisitionDate.ValueText = null;
            // 
            // grpPresent
            // 
            this.grpPresent.Controls.Add(this.tlpPresent);
            this.grpPresent.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpPresent.Font = new System.Drawing.Font("Verdana", 9.75F);
            this.grpPresent.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.grpPresent.Location = new System.Drawing.Point(98, 55);
            this.grpPresent.Name = "grpPresent";
            this.grpPresent.Size = new System.Drawing.Size(89, 165);
            this.grpPresent.TabIndex = 4;
            this.grpPresent.TabStop = false;
            this.grpPresent.Text = "Present";
            // 
            // tlpPresent
            // 
            this.tlpPresent.ColumnCount = 1;
            this.tlpPresent.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpPresent.Controls.Add(this.txtPresentValue, 0, 0);
            this.tlpPresent.Controls.Add(this.txtValuationDate, 0, 1);
            this.tlpPresent.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPresent.Location = new System.Drawing.Point(3, 19);
            this.tlpPresent.Name = "tlpPresent";
            this.tlpPresent.RowCount = 2;
            this.tlpPresent.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpPresent.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpPresent.Size = new System.Drawing.Size(83, 143);
            this.tlpPresent.TabIndex = 1;
            // 
            // txtPresentValue
            // 
            this.txtPresentValue.AllowsNew = false;
            this.txtPresentValue.AllowsReference = false;
            this.txtPresentValue.AllowsUpdate = false;
            this.txtPresentValue.ApplicationIdForDbConnection = null;
            this.txtPresentValue.BackColor = System.Drawing.Color.Transparent;
            this.txtPresentValue.CalledScreenApplicationId = null;
            this.txtPresentValue.CalledScreenTypeName = null;
            this.txtPresentValue.CallingScreenType = null;
            this.txtPresentValue.DisplayText = "";
            this.txtPresentValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPresentValue.EditingControlDataGridView = null;
            this.txtPresentValue.EditingControlFormattedValue = "";
            this.txtPresentValue.EditingControlRowIndex = 0;
            this.txtPresentValue.EditingControlValueChanged = false;
            this.txtPresentValue.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPresentValue.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtPresentValue.IdText = null;
            this.txtPresentValue.Location = new System.Drawing.Point(4, 3);
            this.txtPresentValue.Lookup = false;
            this.txtPresentValue.LookupColumns = null;
            this.txtPresentValue.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtPresentValue.Mandatory = false;
            this.txtPresentValue.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtPresentValue.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtPresentValue.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtPresentValue.Name = "txtPresentValue";
            this.txtPresentValue.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.txtPresentValue.ReadOnly = false;
            this.txtPresentValue.Size = new System.Drawing.Size(75, 44);
            this.txtPresentValue.TabIndex = 2;
            this.txtPresentValue.Title = "Value";
            this.txtPresentValue.ValueText = null;
            // 
            // txtValuationDate
            // 
            this.txtValuationDate.AllowsNew = false;
            this.txtValuationDate.AllowsReference = false;
            this.txtValuationDate.AllowsUpdate = false;
            this.txtValuationDate.ApplicationIdForDbConnection = null;
            this.txtValuationDate.BackColor = System.Drawing.Color.Transparent;
            this.txtValuationDate.CalledScreenApplicationId = null;
            this.txtValuationDate.CalledScreenTypeName = null;
            this.txtValuationDate.CallingScreenType = null;
            this.txtValuationDate.DisplayText = "06 Oct 2007";
            this.txtValuationDate.DisplayTextAsDateTime = new System.DateTime(2007, 10, 6, 18, 23, 10, 747);
            this.txtValuationDate.EditingControlDataGridView = null;
            this.txtValuationDate.EditingControlFormattedValue = new System.DateTime(2007, 10, 6, 18, 23, 10, 747);
            this.txtValuationDate.EditingControlRowIndex = 0;
            this.txtValuationDate.EditingControlValueChanged = true;
            this.txtValuationDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtValuationDate.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.txtValuationDate.IdText = null;
            this.txtValuationDate.Location = new System.Drawing.Point(4, 74);
            this.txtValuationDate.Lookup = true;
            this.txtValuationDate.LookupColumns = null;
            this.txtValuationDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtValuationDate.Mandatory = false;
            this.txtValuationDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtValuationDate.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtValuationDate.MinimumSize = new System.Drawing.Size(0, 28);
            this.txtValuationDate.Name = "txtValuationDate";
            this.txtValuationDate.Padding = new System.Windows.Forms.Padding(0, 16, 14, 0);
            this.txtValuationDate.ReadOnly = false;
            this.txtValuationDate.Size = new System.Drawing.Size(75, 38);
            this.txtValuationDate.TabIndex = 3;
            this.txtValuationDate.Title = "Date";
            this.txtValuationDate.ValueText = null;
            // 
            // grdSummary
            // 
            this.grdSummary.AllowUserToAddRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdSummary.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdSummary.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSummary.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.asset_type_id,
            this.asset_type_nm,
            this.asset_id,
            this.make_model,
            this.quantity,
            this.chasis_no,
            this.engine_no,
            this.details,
            this.item_nm,
            this.item_id,
            this.acquisition_cost,
            this.present_value,
            this.acquisition_dt,
            this.valuation_dt,
            this.remarks,
            this.txn_ts});
            this.grdSummary.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSummary.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdSummary.Location = new System.Drawing.Point(0, 0);
            this.grdSummary.Mode = DCC.UMB.CDF.Configuration.UIModes.None;
            this.grdSummary.Name = "grdSummary";
            this.grdSummary.RowHeadersWidth = 15;
            this.grdSummary.Size = new System.Drawing.Size(292, 418);
            this.grdSummary.TabIndex = 0;
            this.grdSummary.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdSummary.VirtualMode = true;
            // 
            // asset_type_id
            // 
            this.asset_type_id.BindingKey = "asset_type_id";
            this.asset_type_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.asset_type_id.HeaderText = "Asset Type Id";
            this.asset_type_id.Lookup = false;
            this.asset_type_id.LookupColumns = "";
            this.asset_type_id.Mandatory = false;
            this.asset_type_id.Name = "asset_type_id";
            this.asset_type_id.PercentageWidth = 25;
            this.asset_type_id.Width = 69;
            // 
            // asset_type_nm
            // 
            this.asset_type_nm.BindingKey = "asset_type_nm";
            this.asset_type_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.asset_type_nm.HeaderText = "Asset Type";
            this.asset_type_nm.Lookup = false;
            this.asset_type_nm.LookupColumns = "";
            this.asset_type_nm.Mandatory = false;
            this.asset_type_nm.Name = "asset_type_nm";
            this.asset_type_nm.PercentageWidth = 25;
            this.asset_type_nm.ReadOnly = true;
            this.asset_type_nm.Width = 69;
            // 
            // asset_id
            // 
            this.asset_id.BindingKey = "asset_id";
            this.asset_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.asset_id.HeaderText = "ID No.";
            this.asset_id.Lookup = false;
            this.asset_id.LookupColumns = "";
            this.asset_id.Mandatory = false;
            this.asset_id.Name = "asset_id";
            this.asset_id.PercentageWidth = 25;
            this.asset_id.ReadOnly = true;
            this.asset_id.Width = 69;
            // 
            // make_model
            // 
            this.make_model.BindingKey = "make_model";
            this.make_model.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.make_model.HeaderText = "Make / Model";
            this.make_model.Lookup = false;
            this.make_model.LookupColumns = "";
            this.make_model.Mandatory = false;
            this.make_model.Name = "make_model";
            this.make_model.PercentageWidth = 25;
            this.make_model.ReadOnly = true;
            this.make_model.Width = 69;
            // 
            // quantity
            // 
            this.quantity.BindingKey = "quantity";
            this.quantity.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat;
            this.quantity.HeaderText = "Quantity";
            this.quantity.Lookup = false;
            this.quantity.LookupColumns = "";
            this.quantity.Mandatory = false;
            this.quantity.Name = "quantity";
            this.quantity.PercentageWidth = 25;
            this.quantity.Width = 69;
            // 
            // chasis_no
            // 
            this.chasis_no.BindingKey = "chasis_no";
            this.chasis_no.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.chasis_no.HeaderText = "Chassis No.";
            this.chasis_no.Lookup = false;
            this.chasis_no.LookupColumns = "";
            this.chasis_no.Mandatory = false;
            this.chasis_no.Name = "chasis_no";
            this.chasis_no.PercentageWidth = 25;
            this.chasis_no.ReadOnly = true;
            this.chasis_no.Width = 69;
            // 
            // engine_no
            // 
            this.engine_no.BindingKey = "engine_no";
            this.engine_no.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.engine_no.HeaderText = "Engine No";
            this.engine_no.Lookup = false;
            this.engine_no.LookupColumns = "";
            this.engine_no.Mandatory = false;
            this.engine_no.Name = "engine_no";
            this.engine_no.PercentageWidth = 25;
            this.engine_no.ReadOnly = true;
            this.engine_no.Width = 69;
            // 
            // details
            // 
            this.details.BindingKey = "details";
            this.details.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.details.HeaderText = "Details";
            this.details.Lookup = false;
            this.details.LookupColumns = "";
            this.details.Mandatory = false;
            this.details.Name = "details";
            this.details.PercentageWidth = 25;
            this.details.ReadOnly = true;
            this.details.Width = 69;
            // 
            // item_nm
            // 
            this.item_nm.BindingKey = "item_nm";
            this.item_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.item_nm.HeaderText = "Item Name";
            this.item_nm.Lookup = false;
            this.item_nm.LookupColumns = "";
            this.item_nm.Mandatory = false;
            this.item_nm.Name = "item_nm";
            this.item_nm.PercentageWidth = 25;
            this.item_nm.ReadOnly = true;
            this.item_nm.Width = 69;
            // 
            // item_id
            // 
            this.item_id.BindingKey = "item_id";
            this.item_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.item_id.HeaderText = "Item Id";
            this.item_id.Lookup = false;
            this.item_id.LookupColumns = "";
            this.item_id.Mandatory = false;
            this.item_id.Name = "item_id";
            this.item_id.PercentageWidth = 25;
            this.item_id.Visible = false;
            this.item_id.Width = 69;
            // 
            // acquisition_cost
            // 
            this.acquisition_cost.BindingKey = "acquisition_cost";
            this.acquisition_cost.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat;
            this.acquisition_cost.HeaderText = "Aq. Cost";
            this.acquisition_cost.Lookup = false;
            this.acquisition_cost.LookupColumns = "";
            this.acquisition_cost.Mandatory = false;
            this.acquisition_cost.Name = "acquisition_cost";
            this.acquisition_cost.PercentageWidth = 25;
            this.acquisition_cost.Width = 69;
            // 
            // present_value
            // 
            this.present_value.BindingKey = "present_value";
            this.present_value.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.DoubleFloat;
            this.present_value.HeaderText = "Value";
            this.present_value.Lookup = false;
            this.present_value.LookupColumns = "";
            this.present_value.Mandatory = false;
            this.present_value.Name = "present_value";
            this.present_value.PercentageWidth = 25;
            this.present_value.Width = 69;
            // 
            // acquisition_dt
            // 
            this.acquisition_dt.BindingKey = "acquisition_dt";
            this.acquisition_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            this.acquisition_dt.HeaderText = "Aq. Date";
            this.acquisition_dt.Lookup = false;
            this.acquisition_dt.LookupColumns = "";
            this.acquisition_dt.Mandatory = false;
            this.acquisition_dt.Name = "acquisition_dt";
            this.acquisition_dt.PercentageWidth = 25;
            this.acquisition_dt.Width = 69;
            // 
            // valuation_dt
            // 
            this.valuation_dt.BindingKey = "valuation_dt";
            this.valuation_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            this.valuation_dt.HeaderText = "Val. Date";
            this.valuation_dt.Lookup = false;
            this.valuation_dt.LookupColumns = "";
            this.valuation_dt.Mandatory = false;
            this.valuation_dt.Name = "valuation_dt";
            this.valuation_dt.PercentageWidth = 25;
            this.valuation_dt.Width = 69;
            // 
            // remarks
            // 
            this.remarks.BindingKey = "remarks";
            this.remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.remarks.HeaderText = "Remarks";
            this.remarks.Lookup = false;
            this.remarks.LookupColumns = "";
            this.remarks.Mandatory = false;
            this.remarks.Name = "remarks";
            this.remarks.PercentageWidth = 25;
            this.remarks.ReadOnly = true;
            this.remarks.Width = 69;
            // 
            // txn_ts
            // 
            this.txn_ts.BindingKey = "txn_ts";
            this.txn_ts.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Label;
            this.txn_ts.HeaderText = "Txn Ts";
            this.txn_ts.Lookup = false;
            this.txn_ts.LookupColumns = "";
            this.txn_ts.Mandatory = false;
            this.txn_ts.Name = "txn_ts";
            this.txn_ts.PercentageWidth = 25;
            this.txn_ts.ReadOnly = true;
            this.txn_ts.Visible = false;
            this.txn_ts.Width = 69;
            // 
            // summaryDetailNavigator1
            // 
            this.summaryDetailNavigator1.Dock = System.Windows.Forms.DockStyle.Right;
            this.summaryDetailNavigator1.EnableInsertAfter = true;
            this.summaryDetailNavigator1.EnableInsertBefore = true;
            this.summaryDetailNavigator1.EnableInsertLast = true;
            this.summaryDetailNavigator1.EnableMoveDown = false;
            this.summaryDetailNavigator1.EnableMoveUp = false;
            this.summaryDetailNavigator1.EnableNext = true;
            this.summaryDetailNavigator1.EnablePrevious = true;
            this.summaryDetailNavigator1.Location = new System.Drawing.Point(688, 0);
            this.summaryDetailNavigator1.Name = "summaryDetailNavigator1";
            this.summaryDetailNavigator1.PanelInsertVisible = true;
            this.summaryDetailNavigator1.PanelMoveVisible = true;
            this.summaryDetailNavigator1.PanelShowVisible = true;
            this.summaryDetailNavigator1.Size = new System.Drawing.Size(106, 418);
            this.summaryDetailNavigator1.SummaryDetailEditor = null;
            this.summaryDetailNavigator1.TabIndex = 1;
            // 
            // listBrowseSplitContainer
            // 
            this.listBrowseSplitContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listBrowseSplitContainer.Location = new System.Drawing.Point(0, 0);
            this.listBrowseSplitContainer.Name = "listBrowseSplitContainer";
            // 
            // listBrowseSplitContainer.Panel1
            // 
            this.listBrowseSplitContainer.Panel1.Controls.Add(this.tlpMain);
            this.listBrowseSplitContainer.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.listBrowseSplitContainer.Panel1MinSize = 0;
            // 
            // listBrowseSplitContainer.Panel2
            // 
            this.listBrowseSplitContainer.Panel2.Controls.Add(this.grdList);
            this.listBrowseSplitContainer.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.listBrowseSplitContainer.Panel2Collapsed = true;
            this.listBrowseSplitContainer.Panel2MinSize = 0;
            this.listBrowseSplitContainer.Size = new System.Drawing.Size(802, 555);
            this.listBrowseSplitContainer.SplitterDistance = 775;
            this.listBrowseSplitContainer.SplitterWidth = 1;
            this.listBrowseSplitContainer.TabIndex = 1;
            // 
            // grdList
            // 
            this.grdList.AllowUserToAddRows = false;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.zone_id,
            this.centre_type,
            this.satsang_centre_id,
            this.satsang_centre_nm});
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdList.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdList.Location = new System.Drawing.Point(0, 0);
            this.grdList.Mode = DCC.UMB.CDF.Configuration.UIModes.None;
            this.grdList.Name = "grdList";
            this.grdList.RowHeadersWidth = 15;
            this.grdList.Size = new System.Drawing.Size(96, 100);
            this.grdList.TabIndex = 0;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // zone_id
            // 
            this.zone_id.BindingKey = "zone_id";
            this.zone_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.zone_id.HeaderText = "Zone ID";
            this.zone_id.Lookup = false;
            this.zone_id.LookupColumns = "";
            this.zone_id.Mandatory = false;
            this.zone_id.Name = "zone_id";
            this.zone_id.PercentageWidth = 25;
            this.zone_id.Width = 20;
            // 
            // centre_type
            // 
            this.centre_type.BindingKey = "centre_type";
            this.centre_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.centre_type.HeaderText = "Centre Type";
            this.centre_type.Lookup = false;
            this.centre_type.LookupColumns = "";
            this.centre_type.Mandatory = false;
            this.centre_type.Name = "centre_type";
            this.centre_type.PercentageWidth = 25;
            this.centre_type.Width = 20;
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = "satsang_centre_id";
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.satsang_centre_id.HeaderText = "Satsang Centre Id";
            this.satsang_centre_id.Lookup = false;
            this.satsang_centre_id.LookupColumns = "";
            this.satsang_centre_id.Mandatory = false;
            this.satsang_centre_id.Name = "satsang_centre_id";
            this.satsang_centre_id.PercentageWidth = 25;
            this.satsang_centre_id.Width = 20;
            // 
            // satsang_centre_nm
            // 
            this.satsang_centre_nm.BindingKey = "satsang_centre_nm";
            this.satsang_centre_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.satsang_centre_nm.HeaderText = "Satsang Centre Name";
            this.satsang_centre_nm.Lookup = false;
            this.satsang_centre_nm.LookupColumns = "";
            this.satsang_centre_nm.Mandatory = false;
            this.satsang_centre_nm.Name = "satsang_centre_nm";
            this.satsang_centre_nm.PercentageWidth = 25;
            this.satsang_centre_nm.Width = 20;
            // 
            // Assets
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(802, 555);
            this.Controls.Add(this.listBrowseSplitContainer);
            this.Name = "Assets";
            this.Text = "Assets";
            this.Load += new System.EventHandler(this.Assets_Load);
            this.tlpMain.ResumeLayout(false);
            this.tlpHeader.ResumeLayout(false);
            this.tlpHeadings.ResumeLayout(false);
            this.tlpHeadings.PerformLayout();
            this.pnlSummaryDetailMainContainer.ResumeLayout(false);
            this.scSummaryDetails.Panel1.ResumeLayout(false);
            this.scSummaryDetails.Panel2.ResumeLayout(false);
            this.scSummaryDetails.ResumeLayout(false);
            this.tlpDetailViewMainPanel.ResumeLayout(false);
            this.tlpItemDetailsPanel1.ResumeLayout(false);
            this.tlpItemDetailsPanel2.ResumeLayout(false);
            this.grpAquisition.ResumeLayout(false);
            this.tlpAquisition.ResumeLayout(false);
            this.grpPresent.ResumeLayout(false);
            this.tlpPresent.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSummary)).EndInit();
            this.listBrowseSplitContainer.Panel1.ResumeLayout(false);
            this.listBrowseSplitContainer.Panel2.ResumeLayout(false);
            this.listBrowseSplitContainer.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpMain;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpHeader;
        private DCC.UMB.CDF.UIControls.TextControls.DCCComboBox cmbZone;
        private DCC.UMB.CDF.UIControls.TextControls.DCCComboBox cmbCentreType;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCentre;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpHeadings;
        private DCC.UMB.CDF.UIControls.DCCLabel lblItemDetails;
        private System.Windows.Forms.Panel pnlSummaryDetailMainContainer;
        private System.Windows.Forms.SplitContainer scSummaryDetails;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextArea txtRemarks;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSummary;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpItemDetailsPanel1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtItemDetails;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtEngineNo;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtChasisNo;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField txtQuantity;
        private DCC.UMB.CDF.UIControls.TextControls.DCCComboBox cmbAssetType;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField txtIdNumber;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtItemModel;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpItemDetailsPanel2;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtItemName;
        private System.Windows.Forms.GroupBox grpAquisition;
        private System.Windows.Forms.GroupBox grpPresent;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpAquisition;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField txtAquisitionCost;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtAquisitionDate;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpPresent;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDoubleFloatField txtPresentValue;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField txtValuationDate;
        private System.Windows.Forms.SplitContainer listBrowseSplitContainer;
        private DCC.UMB.CDF.UIControls.SummaryDetailNavigator summaryDetailNavigator1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn zone_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn centre_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn satsang_centre_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn asset_type_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn asset_type_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn asset_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn make_model;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn quantity;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn chasis_no;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn engine_no;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn details;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn item_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn item_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn acquisition_cost;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDoubleFloatGridColumn present_value;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn acquisition_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn valuation_dt;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn remarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpDetailViewMainPanel;
    }
}