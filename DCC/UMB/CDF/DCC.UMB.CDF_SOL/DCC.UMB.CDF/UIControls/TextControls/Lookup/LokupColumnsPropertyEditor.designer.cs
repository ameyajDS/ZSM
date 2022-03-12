namespace DCC.UMB.CDF.UIControls.TextControls.Lookup
{
    partial class LookupColumnsPropertyEditor
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.grpSqlText = new System.Windows.Forms.GroupBox();
            this.txtSqlText = new System.Windows.Forms.TextBox();
            this.btnWizard = new System.Windows.Forms.Button();
            this.toolTip1 = new System.Windows.Forms.ToolTip();
            this.lblTablePrefix = new System.Windows.Forms.Label();
            this.lblIsCodeMember = new System.Windows.Forms.Label();
            this.lblIsValuemember = new System.Windows.Forms.Label();
            this.lblIsDisplayMember = new System.Windows.Forms.Label();
            this.lblToolTip = new System.Windows.Forms.Label();
            this.lblPercentageWidth = new System.Windows.Forms.Label();
            this.lblAliasName = new System.Windows.Forms.Label();
            this.lblSqlName = new System.Windows.Forms.Label();
            this.lblCaption = new System.Windows.Forms.Label();
            this.pnlCentrePanel = new DCC.UMB.CDF.UIControls.Containers.DCCPanel();
            this.spltMain = new System.Windows.Forms.SplitContainer();
            this.tlpColumnGrid = new System.Windows.Forms.TableLayoutPanel();
            this.btnRemove = new System.Windows.Forms.Button();
            this.grdLookupColumns = new System.Windows.Forms.DataGridView();
            this.Item_Caption = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GUID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnAddColumn = new System.Windows.Forms.Button();
            this.btnMoveUp = new System.Windows.Forms.Button();
            this.btnMoveDown = new System.Windows.Forms.Button();
            this.tlpColumnEditor = new System.Windows.Forms.TableLayoutPanel();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnDone = new System.Windows.Forms.Button();
            this.tlpPropertyPairsContainerPanel = new System.Windows.Forms.TableLayoutPanel();
            this.txtTablePrefix = new System.Windows.Forms.TextBox();
            this.cmbIsCodeMember = new System.Windows.Forms.ComboBox();
            this.cmbIsValueMember = new System.Windows.Forms.ComboBox();
            this.cmbIsDisplayMember = new System.Windows.Forms.ComboBox();
            this.txtToolTipText = new System.Windows.Forms.TextBox();
            this.txtAliasName = new System.Windows.Forms.TextBox();
            this.txtSqlName = new System.Windows.Forms.TextBox();
            this.txtPercentageWidth = new System.Windows.Forms.MaskedTextBox();
            this.txtCaption = new System.Windows.Forms.TextBox();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grpSqlText.SuspendLayout();
            this.pnlCentrePanel.SuspendLayout();
            this.spltMain.Panel1.SuspendLayout();
            this.spltMain.Panel2.SuspendLayout();
            this.spltMain.SuspendLayout();
            this.tlpColumnGrid.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdLookupColumns)).BeginInit();
            this.tlpColumnEditor.SuspendLayout();
            this.tlpPropertyPairsContainerPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpSqlText
            // 
            this.grpSqlText.Controls.Add(this.txtSqlText);
            this.grpSqlText.Controls.Add(this.btnWizard);
            this.grpSqlText.Dock = System.Windows.Forms.DockStyle.Top;
            this.grpSqlText.Location = new System.Drawing.Point(0, 0);
            this.grpSqlText.Name = "grpSqlText";
            this.grpSqlText.Size = new System.Drawing.Size(582, 129);
            this.grpSqlText.TabIndex = 8;
            this.grpSqlText.TabStop = false;
            this.grpSqlText.Text = "Sql Statement for Lookup Query";
            // 
            // txtSqlText
            // 
            this.txtSqlText.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSqlText.Font = new System.Drawing.Font("Lucida Console", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSqlText.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.txtSqlText.Location = new System.Drawing.Point(3, 16);
            this.txtSqlText.Multiline = true;
            this.txtSqlText.Name = "txtSqlText";
            this.txtSqlText.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtSqlText.Size = new System.Drawing.Size(506, 110);
            this.txtSqlText.TabIndex = 9;
            // 
            // btnWizard
            // 
            this.btnWizard.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnWizard.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnWizard.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnWizard.Image = global::DCC.UMB.CDF.Properties.Resources.Erase;
            this.btnWizard.Location = new System.Drawing.Point(509, 16);
            this.btnWizard.Name = "btnWizard";
            this.btnWizard.Size = new System.Drawing.Size(70, 110);
            this.btnWizard.TabIndex = 8;
            this.btnWizard.Text = "Wizard";
            this.btnWizard.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnWizard.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnWizard.UseVisualStyleBackColor = true;
            this.btnWizard.Click += new System.EventHandler(this.btnWizard_Click);
            // 
            // toolTip1
            // 
            this.toolTip1.IsBalloon = true;
            this.toolTip1.ToolTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            this.toolTip1.ToolTipTitle = "Help";
            // 
            // lblTablePrefix
            // 
            this.lblTablePrefix.AutoSize = true;
            this.lblTablePrefix.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblTablePrefix.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTablePrefix.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblTablePrefix.Location = new System.Drawing.Point(3, 336);
            this.lblTablePrefix.Name = "lblTablePrefix";
            this.lblTablePrefix.Size = new System.Drawing.Size(199, 41);
            this.lblTablePrefix.TabIndex = 16;
            this.lblTablePrefix.Text = "Table Alias";
            this.toolTip1.SetToolTip(this.lblTablePrefix, "The alias of the table(in the select query) to which\r\n this column belongs to. If" +
        " no table alias is defined \r\nin underlying select query, then leave blank.");
            // 
            // lblIsCodeMember
            // 
            this.lblIsCodeMember.AutoSize = true;
            this.lblIsCodeMember.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblIsCodeMember.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIsCodeMember.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblIsCodeMember.Location = new System.Drawing.Point(3, 294);
            this.lblIsCodeMember.Name = "lblIsCodeMember";
            this.lblIsCodeMember.Size = new System.Drawing.Size(199, 42);
            this.lblIsCodeMember.TabIndex = 14;
            this.lblIsCodeMember.Text = "Is Code Member?";
            this.toolTip1.SetToolTip(this.lblIsCodeMember, "Does this column represents code of the entity. \r\nIf yes, then this column is use" +
        "d as \"Code\" in the \r\nlogical search mode.");
            // 
            // lblIsValuemember
            // 
            this.lblIsValuemember.AutoSize = true;
            this.lblIsValuemember.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblIsValuemember.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIsValuemember.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblIsValuemember.Location = new System.Drawing.Point(3, 252);
            this.lblIsValuemember.Name = "lblIsValuemember";
            this.lblIsValuemember.Size = new System.Drawing.Size(199, 42);
            this.lblIsValuemember.TabIndex = 12;
            this.lblIsValuemember.Text = "Is Value Member?";
            this.toolTip1.SetToolTip(this.lblIsValuemember, "Is this column represents Value Member. \r\nIf true then the value of this column w" +
        "ill be \r\nstored as the IdText of the underlying field \r\non which lookup is invok" +
        "ed");
            // 
            // lblIsDisplayMember
            // 
            this.lblIsDisplayMember.AutoSize = true;
            this.lblIsDisplayMember.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblIsDisplayMember.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIsDisplayMember.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblIsDisplayMember.Location = new System.Drawing.Point(3, 210);
            this.lblIsDisplayMember.Name = "lblIsDisplayMember";
            this.lblIsDisplayMember.Size = new System.Drawing.Size(199, 42);
            this.lblIsDisplayMember.TabIndex = 10;
            this.lblIsDisplayMember.Text = "Is Display Member?";
            this.toolTip1.SetToolTip(this.lblIsDisplayMember, "Is this column represents Display Member. \r\nIf yes, then the value of this lookup" +
        " column \r\nwill be shown on to the field on which lookup is invoked.");
            // 
            // lblToolTip
            // 
            this.lblToolTip.AutoSize = true;
            this.lblToolTip.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblToolTip.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblToolTip.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblToolTip.Location = new System.Drawing.Point(3, 168);
            this.lblToolTip.Name = "lblToolTip";
            this.lblToolTip.Size = new System.Drawing.Size(199, 42);
            this.lblToolTip.TabIndex = 8;
            this.lblToolTip.Text = "Tool Tip";
            this.toolTip1.SetToolTip(this.lblToolTip, "Tooltip on the header of this column as it \r\nshows up in Lookup Dialog");
            // 
            // lblPercentageWidth
            // 
            this.lblPercentageWidth.AutoSize = true;
            this.lblPercentageWidth.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblPercentageWidth.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPercentageWidth.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblPercentageWidth.Location = new System.Drawing.Point(3, 126);
            this.lblPercentageWidth.Name = "lblPercentageWidth";
            this.lblPercentageWidth.Size = new System.Drawing.Size(199, 42);
            this.lblPercentageWidth.TabIndex = 6;
            this.lblPercentageWidth.Text = "*%age Width";
            this.toolTip1.SetToolTip(this.lblPercentageWidth, "%age width of this column as it \r\nappears in the look up dialog");
            // 
            // lblAliasName
            // 
            this.lblAliasName.AutoSize = true;
            this.lblAliasName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblAliasName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAliasName.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblAliasName.Location = new System.Drawing.Point(3, 42);
            this.lblAliasName.Name = "lblAliasName";
            this.lblAliasName.Size = new System.Drawing.Size(199, 42);
            this.lblAliasName.TabIndex = 4;
            this.lblAliasName.Text = "*Column Alias";
            this.toolTip1.SetToolTip(this.lblAliasName, "Alias name of this column as it is provided\r\n in the select query");
            // 
            // lblSqlName
            // 
            this.lblSqlName.AutoSize = true;
            this.lblSqlName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblSqlName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSqlName.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblSqlName.Location = new System.Drawing.Point(3, 84);
            this.lblSqlName.Name = "lblSqlName";
            this.lblSqlName.Size = new System.Drawing.Size(199, 42);
            this.lblSqlName.TabIndex = 2;
            this.lblSqlName.Text = "*SQL Name";
            this.toolTip1.SetToolTip(this.lblSqlName, "Actual name of the column in database.\r\n If this is a derived column, then use th" +
        "e \r\nalias name as sql name.");
            // 
            // lblCaption
            // 
            this.lblCaption.AutoSize = true;
            this.lblCaption.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblCaption.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCaption.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblCaption.Location = new System.Drawing.Point(3, 0);
            this.lblCaption.Name = "lblCaption";
            this.lblCaption.Size = new System.Drawing.Size(199, 42);
            this.lblCaption.TabIndex = 0;
            this.lblCaption.Text = "*Caption";
            this.toolTip1.SetToolTip(this.lblCaption, "Heading of this column as it \r\nshows up in Lookup dialog.");
            // 
            // pnlCentrePanel
            // 
            this.pnlCentrePanel.Controls.Add(this.spltMain);
            this.pnlCentrePanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlCentrePanel.Location = new System.Drawing.Point(0, 129);
            this.pnlCentrePanel.Name = "pnlCentrePanel";
            this.pnlCentrePanel.Size = new System.Drawing.Size(582, 413);
            this.pnlCentrePanel.TabIndex = 9;
            // 
            // spltMain
            // 
            this.spltMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.spltMain.Location = new System.Drawing.Point(0, 0);
            this.spltMain.Name = "spltMain";
            // 
            // spltMain.Panel1
            // 
            this.spltMain.Panel1.Controls.Add(this.tlpColumnGrid);
            // 
            // spltMain.Panel2
            // 
            this.spltMain.Panel2.Controls.Add(this.tlpColumnEditor);
            this.spltMain.Size = new System.Drawing.Size(582, 413);
            this.spltMain.SplitterDistance = 159;
            this.spltMain.SplitterWidth = 6;
            this.spltMain.TabIndex = 1;
            // 
            // tlpColumnGrid
            // 
            this.tlpColumnGrid.ColumnCount = 2;
            this.tlpColumnGrid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpColumnGrid.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpColumnGrid.Controls.Add(this.btnRemove, 1, 2);
            this.tlpColumnGrid.Controls.Add(this.grdLookupColumns, 0, 1);
            this.tlpColumnGrid.Controls.Add(this.btnAddColumn, 0, 2);
            this.tlpColumnGrid.Controls.Add(this.btnMoveUp, 0, 0);
            this.tlpColumnGrid.Controls.Add(this.btnMoveDown, 1, 0);
            this.tlpColumnGrid.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpColumnGrid.Location = new System.Drawing.Point(0, 0);
            this.tlpColumnGrid.Name = "tlpColumnGrid";
            this.tlpColumnGrid.RowCount = 3;
            this.tlpColumnGrid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.tlpColumnGrid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpColumnGrid.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.tlpColumnGrid.Size = new System.Drawing.Size(159, 413);
            this.tlpColumnGrid.TabIndex = 10;
            // 
            // btnRemove
            // 
            this.btnRemove.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnRemove.Location = new System.Drawing.Point(82, 386);
            this.btnRemove.Name = "btnRemove";
            this.btnRemove.Size = new System.Drawing.Size(74, 24);
            this.btnRemove.TabIndex = 12;
            this.btnRemove.Text = "&Remove";
            this.btnRemove.UseVisualStyleBackColor = true;
            this.btnRemove.Click += new System.EventHandler(this.btnRemove_Click);
            // 
            // grdLookupColumns
            // 
            this.grdLookupColumns.AllowUserToAddRows = false;
            this.grdLookupColumns.AllowUserToDeleteRows = false;
            this.grdLookupColumns.AllowUserToResizeColumns = false;
            this.grdLookupColumns.AllowUserToResizeRows = false;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.grdLookupColumns.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.grdLookupColumns.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdLookupColumns.ColumnHeadersVisible = false;
            this.grdLookupColumns.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Item_Caption,
            this.GUID});
            this.tlpColumnGrid.SetColumnSpan(this.grdLookupColumns, 2);
            this.grdLookupColumns.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdLookupColumns.Location = new System.Drawing.Point(3, 33);
            this.grdLookupColumns.Name = "grdLookupColumns";
            this.grdLookupColumns.ReadOnly = true;
            this.grdLookupColumns.RowHeadersVisible = false;
            this.grdLookupColumns.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.grdLookupColumns.Size = new System.Drawing.Size(153, 347);
            this.grdLookupColumns.TabIndex = 9;
            this.grdLookupColumns.VirtualMode = true;
            // 
            // Item_Caption
            // 
            this.Item_Caption.HeaderText = "Item_Caption";
            this.Item_Caption.Name = "Item_Caption";
            this.Item_Caption.ReadOnly = true;
            // 
            // GUID
            // 
            this.GUID.HeaderText = "GUID";
            this.GUID.Name = "GUID";
            this.GUID.ReadOnly = true;
            this.GUID.Visible = false;
            // 
            // btnAddColumn
            // 
            this.btnAddColumn.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnAddColumn.Location = new System.Drawing.Point(3, 386);
            this.btnAddColumn.Name = "btnAddColumn";
            this.btnAddColumn.Size = new System.Drawing.Size(73, 24);
            this.btnAddColumn.TabIndex = 1;
            this.btnAddColumn.Text = "&Add";
            this.btnAddColumn.UseVisualStyleBackColor = true;
            this.btnAddColumn.Click += new System.EventHandler(this.btnAddColumn_Click);
            // 
            // btnMoveUp
            // 
            this.btnMoveUp.Location = new System.Drawing.Point(3, 3);
            this.btnMoveUp.Name = "btnMoveUp";
            this.btnMoveUp.Size = new System.Drawing.Size(73, 23);
            this.btnMoveUp.TabIndex = 10;
            this.btnMoveUp.Text = "Up";
            this.btnMoveUp.UseVisualStyleBackColor = true;
            this.btnMoveUp.Click += new System.EventHandler(this.btnMoveUp_Click);
            // 
            // btnMoveDown
            // 
            this.btnMoveDown.Location = new System.Drawing.Point(82, 3);
            this.btnMoveDown.Name = "btnMoveDown";
            this.btnMoveDown.Size = new System.Drawing.Size(74, 23);
            this.btnMoveDown.TabIndex = 11;
            this.btnMoveDown.Text = "Down";
            this.btnMoveDown.UseVisualStyleBackColor = true;
            this.btnMoveDown.Click += new System.EventHandler(this.btnMoveDown_Click);
            // 
            // tlpColumnEditor
            // 
            this.tlpColumnEditor.ColumnCount = 2;
            this.tlpColumnEditor.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpColumnEditor.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpColumnEditor.Controls.Add(this.btnCancel, 1, 1);
            this.tlpColumnEditor.Controls.Add(this.btnDone, 0, 1);
            this.tlpColumnEditor.Controls.Add(this.tlpPropertyPairsContainerPanel, 0, 0);
            this.tlpColumnEditor.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpColumnEditor.Location = new System.Drawing.Point(0, 0);
            this.tlpColumnEditor.Name = "tlpColumnEditor";
            this.tlpColumnEditor.RowCount = 2;
            this.tlpColumnEditor.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpColumnEditor.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.tlpColumnEditor.Size = new System.Drawing.Size(417, 413);
            this.tlpColumnEditor.TabIndex = 6;
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnCancel.Location = new System.Drawing.Point(275, 386);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 5;
            this.btnCancel.Text = "&Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnDone
            // 
            this.btnDone.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnDone.Location = new System.Drawing.Point(66, 386);
            this.btnDone.Name = "btnDone";
            this.btnDone.Size = new System.Drawing.Size(75, 23);
            this.btnDone.TabIndex = 2;
            this.btnDone.Text = "&Done";
            this.btnDone.UseVisualStyleBackColor = true;
            this.btnDone.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // tlpPropertyPairsContainerPanel
            // 
            this.tlpPropertyPairsContainerPanel.ColumnCount = 2;
            this.tlpColumnEditor.SetColumnSpan(this.tlpPropertyPairsContainerPanel, 2);
            this.tlpPropertyPairsContainerPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpPropertyPairsContainerPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblTablePrefix, 0, 8);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.txtTablePrefix, 1, 8);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.cmbIsCodeMember, 1, 7);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.cmbIsValueMember, 1, 6);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.cmbIsDisplayMember, 1, 5);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblIsCodeMember, 0, 7);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblIsValuemember, 0, 6);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblIsDisplayMember, 0, 5);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblToolTip, 0, 4);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.txtToolTipText, 1, 4);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblPercentageWidth, 0, 3);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblAliasName, 0, 1);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.txtAliasName, 1, 1);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblSqlName, 0, 2);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.txtSqlName, 1, 2);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.lblCaption, 0, 0);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.txtPercentageWidth, 1, 3);
            this.tlpPropertyPairsContainerPanel.Controls.Add(this.txtCaption, 1, 0);
            this.tlpPropertyPairsContainerPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPropertyPairsContainerPanel.Location = new System.Drawing.Point(3, 3);
            this.tlpPropertyPairsContainerPanel.Name = "tlpPropertyPairsContainerPanel";
            this.tlpPropertyPairsContainerPanel.RowCount = 9;
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.14093F));
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.14093F));
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.14093F));
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.14093F));
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.14093F));
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.14093F));
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.14093F));
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.14093F));
            this.tlpPropertyPairsContainerPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.87257F));
            this.tlpPropertyPairsContainerPanel.Size = new System.Drawing.Size(411, 377);
            this.tlpPropertyPairsContainerPanel.TabIndex = 4;
            // 
            // txtTablePrefix
            // 
            this.txtTablePrefix.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtTablePrefix.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTablePrefix.Location = new System.Drawing.Point(208, 339);
            this.txtTablePrefix.Name = "txtTablePrefix";
            this.txtTablePrefix.Size = new System.Drawing.Size(200, 22);
            this.txtTablePrefix.TabIndex = 15;
            // 
            // cmbIsCodeMember
            // 
            this.cmbIsCodeMember.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbIsCodeMember.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbIsCodeMember.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbIsCodeMember.FormattingEnabled = true;
            this.cmbIsCodeMember.Location = new System.Drawing.Point(208, 297);
            this.cmbIsCodeMember.Name = "cmbIsCodeMember";
            this.cmbIsCodeMember.Size = new System.Drawing.Size(200, 22);
            this.cmbIsCodeMember.TabIndex = 10;
            // 
            // cmbIsValueMember
            // 
            this.cmbIsValueMember.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbIsValueMember.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbIsValueMember.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbIsValueMember.FormattingEnabled = true;
            this.cmbIsValueMember.Location = new System.Drawing.Point(208, 255);
            this.cmbIsValueMember.Name = "cmbIsValueMember";
            this.cmbIsValueMember.Size = new System.Drawing.Size(200, 22);
            this.cmbIsValueMember.TabIndex = 8;
            // 
            // cmbIsDisplayMember
            // 
            this.cmbIsDisplayMember.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbIsDisplayMember.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbIsDisplayMember.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbIsDisplayMember.FormattingEnabled = true;
            this.cmbIsDisplayMember.Location = new System.Drawing.Point(208, 213);
            this.cmbIsDisplayMember.Name = "cmbIsDisplayMember";
            this.cmbIsDisplayMember.Size = new System.Drawing.Size(200, 22);
            this.cmbIsDisplayMember.TabIndex = 7;
            // 
            // txtToolTipText
            // 
            this.txtToolTipText.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtToolTipText.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtToolTipText.Location = new System.Drawing.Point(208, 171);
            this.txtToolTipText.Name = "txtToolTipText";
            this.txtToolTipText.Size = new System.Drawing.Size(200, 22);
            this.txtToolTipText.TabIndex = 6;
            // 
            // txtAliasName
            // 
            this.txtAliasName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtAliasName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAliasName.Location = new System.Drawing.Point(208, 45);
            this.txtAliasName.Name = "txtAliasName";
            this.txtAliasName.Size = new System.Drawing.Size(200, 22);
            this.txtAliasName.TabIndex = 3;
            this.txtAliasName.Leave += new System.EventHandler(this.txtAliasName_Leave);
            // 
            // txtSqlName
            // 
            this.txtSqlName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSqlName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSqlName.Location = new System.Drawing.Point(208, 87);
            this.txtSqlName.Name = "txtSqlName";
            this.txtSqlName.Size = new System.Drawing.Size(200, 22);
            this.txtSqlName.TabIndex = 4;
            // 
            // txtPercentageWidth
            // 
            this.txtPercentageWidth.BeepOnError = true;
            this.txtPercentageWidth.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPercentageWidth.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPercentageWidth.Location = new System.Drawing.Point(208, 129);
            this.txtPercentageWidth.Mask = "000";
            this.txtPercentageWidth.Name = "txtPercentageWidth";
            this.txtPercentageWidth.Size = new System.Drawing.Size(200, 22);
            this.txtPercentageWidth.TabIndex = 5;
            // 
            // txtCaption
            // 
            this.txtCaption.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCaption.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCaption.Location = new System.Drawing.Point(208, 3);
            this.txtCaption.Name = "txtCaption";
            this.txtCaption.Size = new System.Drawing.Size(200, 22);
            this.txtCaption.TabIndex = 2;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.HeaderText = "Item_Caption";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            this.dataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.HeaderText = "GUID";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            this.dataGridViewTextBoxColumn2.ReadOnly = true;
            this.dataGridViewTextBoxColumn2.Visible = false;
            // 
            // LookupColumnsPropertyEditor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(582, 542);
            this.Controls.Add(this.pnlCentrePanel);
            this.Controls.Add(this.grpSqlText);
            this.Name = "LookupColumnsPropertyEditor";
            this.Text = "Setup Lookup";
            this.Load += new System.EventHandler(this.LookupColumnsPropertyEditor_Load);
            this.grpSqlText.ResumeLayout(false);
            this.grpSqlText.PerformLayout();
            this.pnlCentrePanel.ResumeLayout(false);
            this.spltMain.Panel1.ResumeLayout(false);
            this.spltMain.Panel2.ResumeLayout(false);
            this.spltMain.ResumeLayout(false);
            this.tlpColumnGrid.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdLookupColumns)).EndInit();
            this.tlpColumnEditor.ResumeLayout(false);
            this.tlpPropertyPairsContainerPanel.ResumeLayout(false);
            this.tlpPropertyPairsContainerPanel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnAddColumn;
        private System.Windows.Forms.Button btnDone;
        private System.Windows.Forms.TableLayoutPanel tlpPropertyPairsContainerPanel;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label lblCaption;
        private System.Windows.Forms.TextBox txtCaption;
        private System.Windows.Forms.Label lblIsCodeMember;
        private System.Windows.Forms.Label lblIsValuemember;
        private System.Windows.Forms.Label lblIsDisplayMember;
        private System.Windows.Forms.Label lblToolTip;
        private System.Windows.Forms.TextBox txtToolTipText;
        private System.Windows.Forms.Label lblPercentageWidth;
        private System.Windows.Forms.Label lblAliasName;
        private System.Windows.Forms.TextBox txtAliasName;
        private System.Windows.Forms.Label lblSqlName;
        private System.Windows.Forms.TextBox txtSqlName;
        private System.Windows.Forms.ComboBox cmbIsValueMember;
        private System.Windows.Forms.ComboBox cmbIsDisplayMember;
        private System.Windows.Forms.MaskedTextBox txtPercentageWidth;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.SplitContainer spltMain;
        private System.Windows.Forms.GroupBox grpSqlText;
        private System.Windows.Forms.TextBox txtSqlText;
        private System.Windows.Forms.Button btnWizard;
        private DCC.UMB.CDF.UIControls.Containers.DCCPanel pnlCentrePanel;
        private System.Windows.Forms.DataGridView grdLookupColumns;
        private System.Windows.Forms.DataGridViewTextBoxColumn Item_Caption;
        private System.Windows.Forms.DataGridViewTextBoxColumn GUID;
        private System.Windows.Forms.TableLayoutPanel tlpColumnGrid;
        private System.Windows.Forms.Button btnMoveUp;
        private System.Windows.Forms.Button btnMoveDown;
        private System.Windows.Forms.TableLayoutPanel tlpColumnEditor;
        private System.Windows.Forms.ComboBox cmbIsCodeMember;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.Label lblTablePrefix;
        private System.Windows.Forms.TextBox txtTablePrefix;
        private System.Windows.Forms.Button btnRemove;

    }
}