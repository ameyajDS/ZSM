using System.Windows.Forms;
namespace DCC.UMB.CDF.Lookup.View
{
    partial class LookupDialog
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LookupDialog));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.baseTableLayoutPanel = new System.Windows.Forms.TableLayoutPanel();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.lblSearchOperator = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.cmbSearchOperator = new System.Windows.Forms.ToolStripComboBox();
            this.btnExit = new System.Windows.Forms.ToolStripButton();
            this.tlbsToolbarStrip = new System.Windows.Forms.ToolStrip();
            this.btnSelect = new System.Windows.Forms.ToolStripButton();
            this.btnNew = new System.Windows.Forms.ToolStripButton();
            this.btnUpdate = new System.Windows.Forms.ToolStripButton();
            this.btnReference = new System.Windows.Forms.ToolStripButton();
            this.pnlSearchOn = new System.Windows.Forms.Panel();
            this.cmbSearchOn = new System.Windows.Forms.ComboBox();
            this.lblSearchOn = new System.Windows.Forms.Label();
            this.pnlSearch = new System.Windows.Forms.Panel();
            this.mtxtSearchString = new System.Windows.Forms.MaskedTextBox();
            this.lblSearchString = new System.Windows.Forms.Label();
            this.spltResultPanel = new System.Windows.Forms.SplitContainer();
            this.grpbxAvailableRecords = new System.Windows.Forms.GroupBox();
            this.dgvAvailableRecords = new DCC.UMB.CDF.Lookup.View.LookupDataGridView();
            this.tbloutSelectedRecordsPanel = new System.Windows.Forms.TableLayoutPanel();
            this.grpbxSelectedRecords = new System.Windows.Forms.GroupBox();
            this.dgvSelectedRecords = new DCC.UMB.CDF.Lookup.View.LookupDataGridView();
            this.tbloutButtonsPanel = new System.Windows.Forms.TableLayoutPanel();
            this.btnRejectAllRecords = new System.Windows.Forms.Button();
            this.btnRejectRecord = new System.Windows.Forms.Button();
            this.btnSelectAllRecords = new System.Windows.Forms.Button();
            this.btnSelectRecord = new System.Windows.Forms.Button();
            this.chkAppend = new System.Windows.Forms.CheckBox();
            this.btnDone = new System.Windows.Forms.Button();
            this.typingTimer = new System.Windows.Forms.Timer(this.components);
            this.baseTableLayoutPanel.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.tlbsToolbarStrip.SuspendLayout();
            this.pnlSearchOn.SuspendLayout();
            this.pnlSearch.SuspendLayout();
            this.spltResultPanel.Panel1.SuspendLayout();
            this.spltResultPanel.Panel2.SuspendLayout();
            this.spltResultPanel.SuspendLayout();
            this.grpbxAvailableRecords.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAvailableRecords)).BeginInit();
            this.tbloutSelectedRecordsPanel.SuspendLayout();
            this.grpbxSelectedRecords.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSelectedRecords)).BeginInit();
            this.tbloutButtonsPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // baseTableLayoutPanel
            // 
            this.baseTableLayoutPanel.ColumnCount = 2;
            this.baseTableLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.baseTableLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.baseTableLayoutPanel.Controls.Add(this.toolStrip1, 1, 0);
            this.baseTableLayoutPanel.Controls.Add(this.tlbsToolbarStrip, 0, 0);
            this.baseTableLayoutPanel.Controls.Add(this.pnlSearchOn, 1, 1);
            this.baseTableLayoutPanel.Controls.Add(this.pnlSearch, 0, 1);
            this.baseTableLayoutPanel.Controls.Add(this.spltResultPanel, 0, 2);
            this.baseTableLayoutPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.baseTableLayoutPanel.Location = new System.Drawing.Point(0, 0);
            this.baseTableLayoutPanel.Name = "baseTableLayoutPanel";
            this.baseTableLayoutPanel.RowCount = 3;
            this.baseTableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.baseTableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 40F));
            this.baseTableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.baseTableLayoutPanel.Size = new System.Drawing.Size(612, 419);
            this.baseTableLayoutPanel.TabIndex = 0;
            // 
            // toolStrip1
            // 
            this.toolStrip1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.lblSearchOperator,
            this.toolStripSeparator2,
            this.cmbSearchOperator,
            this.btnExit});
            this.toolStrip1.Location = new System.Drawing.Point(306, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.toolStrip1.Size = new System.Drawing.Size(306, 30);
            this.toolStrip1.TabIndex = 9;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // lblSearchOperator
            // 
            this.lblSearchOperator.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearchOperator.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblSearchOperator.Name = "lblSearchOperator";
            this.lblSearchOperator.Size = new System.Drawing.Size(89, 27);
            this.lblSearchOperator.Text = "Search St&yle";
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 30);
            // 
            // cmbSearchOperator
            // 
            this.cmbSearchOperator.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSearchOperator.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSearchOperator.Name = "cmbSearchOperator";
            this.cmbSearchOperator.Size = new System.Drawing.Size(120, 30);
            // 
            // btnExit
            // 
            this.btnExit.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnExit.Image = ((System.Drawing.Image)(resources.GetObject("btnExit.Image")));
            this.btnExit.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(28, 27);
            this.btnExit.Text = "Exit";
            this.btnExit.ToolTipText = "Exit from lookup";
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // tlbsToolbarStrip
            // 
            this.tlbsToolbarStrip.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlbsToolbarStrip.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.tlbsToolbarStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btnSelect,
            this.btnNew,
            this.btnUpdate,
            this.btnReference});
            this.tlbsToolbarStrip.Location = new System.Drawing.Point(0, 0);
            this.tlbsToolbarStrip.Name = "tlbsToolbarStrip";
            this.tlbsToolbarStrip.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.tlbsToolbarStrip.Size = new System.Drawing.Size(306, 30);
            this.tlbsToolbarStrip.TabIndex = 5;
            this.tlbsToolbarStrip.Text = "toolStrip1";
            // 
            // btnSelect
            // 
            this.btnSelect.AutoSize = false;
            this.btnSelect.BackColor = System.Drawing.SystemColors.Control;
            this.btnSelect.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnSelect.Image = ((System.Drawing.Image)(resources.GetObject("btnSelect.Image")));
            this.btnSelect.ImageAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnSelect.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnSelect.Margin = new System.Windows.Forms.Padding(5, 0, 0, 0);
            this.btnSelect.Name = "btnSelect";
            this.btnSelect.Size = new System.Drawing.Size(28, 27);
            this.btnSelect.Text = "Select";
            this.btnSelect.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnSelect.ToolTipText = "Select the highlighted record";
            this.btnSelect.Click += new System.EventHandler(this.btnSelect_Click);
            // 
            // btnNew
            // 
            this.btnNew.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnNew.Image = ((System.Drawing.Image)(resources.GetObject("btnNew.Image")));
            this.btnNew.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(28, 27);
            this.btnNew.Text = "New";
            this.btnNew.ToolTipText = "Create a new record";
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnUpdate.ForeColor = System.Drawing.Color.Transparent;
            this.btnUpdate.Image = ((System.Drawing.Image)(resources.GetObject("btnUpdate.Image")));
            this.btnUpdate.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(28, 27);
            this.btnUpdate.Text = "Update";
            this.btnUpdate.ToolTipText = "Update the highlighted record";
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // btnReference
            // 
            this.btnReference.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnReference.Image = ((System.Drawing.Image)(resources.GetObject("btnReference.Image")));
            this.btnReference.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnReference.Name = "btnReference";
            this.btnReference.Size = new System.Drawing.Size(28, 27);
            this.btnReference.Text = "Reference";
            this.btnReference.ToolTipText = "View the highlighted record";
            this.btnReference.Click += new System.EventHandler(this.btnReference_Click);
            // 
            // pnlSearchOn
            // 
            this.pnlSearchOn.Controls.Add(this.cmbSearchOn);
            this.pnlSearchOn.Controls.Add(this.lblSearchOn);
            this.pnlSearchOn.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlSearchOn.Location = new System.Drawing.Point(309, 33);
            this.pnlSearchOn.Name = "pnlSearchOn";
            this.pnlSearchOn.Size = new System.Drawing.Size(300, 34);
            this.pnlSearchOn.TabIndex = 1;
            // 
            // cmbSearchOn
            // 
            this.cmbSearchOn.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbSearchOn.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSearchOn.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSearchOn.FormattingEnabled = true;
            this.cmbSearchOn.Location = new System.Drawing.Point(82, 0);
            this.cmbSearchOn.Name = "cmbSearchOn";
            this.cmbSearchOn.Size = new System.Drawing.Size(218, 24);
            this.cmbSearchOn.TabIndex = 3;
            this.cmbSearchOn.SelectedIndexChanged += new System.EventHandler(this.cmbSearchOn_SelectedIndexChanged);
            // 
            // lblSearchOn
            // 
            this.lblSearchOn.AutoSize = true;
            this.lblSearchOn.Dock = System.Windows.Forms.DockStyle.Left;
            this.lblSearchOn.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearchOn.ForeColor = System.Drawing.Color.Navy;
            this.lblSearchOn.Location = new System.Drawing.Point(0, 0);
            this.lblSearchOn.Name = "lblSearchOn";
            this.lblSearchOn.Padding = new System.Windows.Forms.Padding(0, 2, 0, 0);
            this.lblSearchOn.Size = new System.Drawing.Size(82, 18);
            this.lblSearchOn.TabIndex = 0;
            this.lblSearchOn.Text = "Search &On";
            // 
            // pnlSearch
            // 
            this.pnlSearch.Controls.Add(this.mtxtSearchString);
            this.pnlSearch.Controls.Add(this.lblSearchString);
            this.pnlSearch.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlSearch.Location = new System.Drawing.Point(3, 33);
            this.pnlSearch.Name = "pnlSearch";
            this.pnlSearch.Size = new System.Drawing.Size(300, 34);
            this.pnlSearch.TabIndex = 0;
            // 
            // mtxtSearchString
            // 
            this.mtxtSearchString.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mtxtSearchString.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.mtxtSearchString.Location = new System.Drawing.Point(94, 0);
            this.mtxtSearchString.Name = "mtxtSearchString";
            this.mtxtSearchString.Size = new System.Drawing.Size(206, 23);
            this.mtxtSearchString.TabIndex = 1;
            this.mtxtSearchString.TextChanged += new System.EventHandler(this.mtxtSearchString_TextChanged);
            this.mtxtSearchString.Enter += new System.EventHandler(this.mtxtSearchString_Enter);
            this.mtxtSearchString.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.mtxtSearchString_KeyPress);
            this.mtxtSearchString.KeyUp += new System.Windows.Forms.KeyEventHandler(this.mtxtSearchString_KeyUp);
            // 
            // lblSearchString
            // 
            this.lblSearchString.AutoSize = true;
            this.lblSearchString.Dock = System.Windows.Forms.DockStyle.Left;
            this.lblSearchString.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearchString.ForeColor = System.Drawing.Color.Navy;
            this.lblSearchString.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblSearchString.Location = new System.Drawing.Point(0, 0);
            this.lblSearchString.Name = "lblSearchString";
            this.lblSearchString.Padding = new System.Windows.Forms.Padding(0, 2, 0, 0);
            this.lblSearchString.Size = new System.Drawing.Size(94, 18);
            this.lblSearchString.TabIndex = 0;
            this.lblSearchString.Text = "&Search Text\r\n";
            this.lblSearchString.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // spltResultPanel
            // 
            this.spltResultPanel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.baseTableLayoutPanel.SetColumnSpan(this.spltResultPanel, 2);
            this.spltResultPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.spltResultPanel.Location = new System.Drawing.Point(3, 73);
            this.spltResultPanel.Name = "spltResultPanel";
            // 
            // spltResultPanel.Panel1
            // 
            this.spltResultPanel.Panel1.Controls.Add(this.grpbxAvailableRecords);
            // 
            // spltResultPanel.Panel2
            // 
            this.spltResultPanel.Panel2.Controls.Add(this.tbloutSelectedRecordsPanel);
            this.spltResultPanel.Panel2MinSize = 0;
            this.spltResultPanel.Size = new System.Drawing.Size(606, 343);
            this.spltResultPanel.SplitterDistance = 255;
            this.spltResultPanel.SplitterWidth = 6;
            this.spltResultPanel.TabIndex = 8;
            this.spltResultPanel.TabStop = false;
            // 
            // grpbxAvailableRecords
            // 
            this.grpbxAvailableRecords.Controls.Add(this.dgvAvailableRecords);
            this.grpbxAvailableRecords.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpbxAvailableRecords.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold);
            this.grpbxAvailableRecords.ForeColor = System.Drawing.Color.Navy;
            this.grpbxAvailableRecords.Location = new System.Drawing.Point(0, 0);
            this.grpbxAvailableRecords.Name = "grpbxAvailableRecords";
            this.grpbxAvailableRecords.Size = new System.Drawing.Size(251, 339);
            this.grpbxAvailableRecords.TabIndex = 3;
            this.grpbxAvailableRecords.TabStop = false;
            this.grpbxAvailableRecords.Text = "&Available Records";
            // 
            // dgvAvailableRecords
            // 
            this.dgvAvailableRecords.AllowUserToAddRows = false;
            this.dgvAvailableRecords.AllowUserToDeleteRows = false;
            this.dgvAvailableRecords.AllowUserToResizeRows = false;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.dgvAvailableRecords.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvAvailableRecords.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Sunken;
            this.dgvAvailableRecords.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAvailableRecords.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvAvailableRecords.Location = new System.Drawing.Point(3, 17);
            this.dgvAvailableRecords.MultiSelect = false;
            this.dgvAvailableRecords.Name = "dgvAvailableRecords";
            this.dgvAvailableRecords.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Sunken;
            this.dgvAvailableRecords.RowHeadersVisible = false;
            this.dgvAvailableRecords.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.CellSelect;
            this.dgvAvailableRecords.Size = new System.Drawing.Size(245, 319);
            this.dgvAvailableRecords.StandardTab = true;
            this.dgvAvailableRecords.TabIndex = 2;
            this.dgvAvailableRecords.CellLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvAvailableRecords_CellLeave);
            this.dgvAvailableRecords.ColumnHeaderMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgvAvailableRecords_ColumnHeaderMouseClick);
            this.dgvAvailableRecords.CurrentCellChanged += new System.EventHandler(this.dgvAvailableRecords_CurrentCellChanged);
            this.dgvAvailableRecords.DoubleClick += new System.EventHandler(this.dgvAvailableRecords_DoubleClick);
            this.dgvAvailableRecords.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvAvailableRecords_KeyDown);
            // 
            // tbloutSelectedRecordsPanel
            // 
            this.tbloutSelectedRecordsPanel.ColumnCount = 2;
            this.tbloutSelectedRecordsPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 90F));
            this.tbloutSelectedRecordsPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tbloutSelectedRecordsPanel.Controls.Add(this.grpbxSelectedRecords, 1, 0);
            this.tbloutSelectedRecordsPanel.Controls.Add(this.tbloutButtonsPanel, 0, 0);
            this.tbloutSelectedRecordsPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbloutSelectedRecordsPanel.Location = new System.Drawing.Point(0, 0);
            this.tbloutSelectedRecordsPanel.Name = "tbloutSelectedRecordsPanel";
            this.tbloutSelectedRecordsPanel.RowCount = 1;
            this.tbloutSelectedRecordsPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tbloutSelectedRecordsPanel.Size = new System.Drawing.Size(341, 339);
            this.tbloutSelectedRecordsPanel.TabIndex = 0;
            // 
            // grpbxSelectedRecords
            // 
            this.grpbxSelectedRecords.Controls.Add(this.dgvSelectedRecords);
            this.grpbxSelectedRecords.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grpbxSelectedRecords.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpbxSelectedRecords.ForeColor = System.Drawing.Color.Navy;
            this.grpbxSelectedRecords.Location = new System.Drawing.Point(93, 3);
            this.grpbxSelectedRecords.Name = "grpbxSelectedRecords";
            this.grpbxSelectedRecords.Size = new System.Drawing.Size(245, 333);
            this.grpbxSelectedRecords.TabIndex = 2;
            this.grpbxSelectedRecords.TabStop = false;
            this.grpbxSelectedRecords.Text = "Selected &Records";
            // 
            // dgvSelectedRecords
            // 
            this.dgvSelectedRecords.AllowUserToAddRows = false;
            this.dgvSelectedRecords.AllowUserToDeleteRows = false;
            this.dgvSelectedRecords.AllowUserToResizeRows = false;
            this.dgvSelectedRecords.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvSelectedRecords.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Sunken;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvSelectedRecords.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvSelectedRecords.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSelectedRecords.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvSelectedRecords.Location = new System.Drawing.Point(3, 17);
            this.dgvSelectedRecords.MultiSelect = false;
            this.dgvSelectedRecords.Name = "dgvSelectedRecords";
            this.dgvSelectedRecords.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Sunken;
            this.dgvSelectedRecords.RowHeadersVisible = false;
            this.dgvSelectedRecords.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.CellSelect;
            this.dgvSelectedRecords.Size = new System.Drawing.Size(239, 313);
            this.dgvSelectedRecords.StandardTab = true;
            this.dgvSelectedRecords.TabIndex = 8;
            this.dgvSelectedRecords.ColumnHeaderMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgvSelectedRecords_ColumnHeaderMouseClick);
            this.dgvSelectedRecords.DoubleClick += new System.EventHandler(this.dgvSelectedRecords_DoubleClick);
            this.dgvSelectedRecords.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dgvSelectedRecords_KeyUp);
            // 
            // tbloutButtonsPanel
            // 
            this.tbloutButtonsPanel.ColumnCount = 1;
            this.tbloutButtonsPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tbloutButtonsPanel.Controls.Add(this.btnRejectAllRecords, 0, 3);
            this.tbloutButtonsPanel.Controls.Add(this.btnRejectRecord, 0, 2);
            this.tbloutButtonsPanel.Controls.Add(this.btnSelectAllRecords, 0, 1);
            this.tbloutButtonsPanel.Controls.Add(this.btnSelectRecord, 0, 0);
            this.tbloutButtonsPanel.Controls.Add(this.chkAppend, 0, 4);
            this.tbloutButtonsPanel.Controls.Add(this.btnDone, 0, 5);
            this.tbloutButtonsPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbloutButtonsPanel.Location = new System.Drawing.Point(3, 3);
            this.tbloutButtonsPanel.Name = "tbloutButtonsPanel";
            this.tbloutButtonsPanel.RowCount = 6;
            this.tbloutButtonsPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tbloutButtonsPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tbloutButtonsPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tbloutButtonsPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tbloutButtonsPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tbloutButtonsPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tbloutButtonsPanel.Size = new System.Drawing.Size(84, 333);
            this.tbloutButtonsPanel.TabIndex = 3;
            // 
            // btnRejectAllRecords
            // 
            this.btnRejectAllRecords.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnRejectAllRecords.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRejectAllRecords.Location = new System.Drawing.Point(18, 181);
            this.btnRejectAllRecords.Name = "btnRejectAllRecords";
            this.btnRejectAllRecords.Size = new System.Drawing.Size(47, 23);
            this.btnRejectAllRecords.TabIndex = 7;
            this.btnRejectAllRecords.Text = "< <";
            this.btnRejectAllRecords.UseVisualStyleBackColor = true;
            this.btnRejectAllRecords.Click += new System.EventHandler(this.btnRejectAllRecords_Click);
            // 
            // btnRejectRecord
            // 
            this.btnRejectRecord.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnRejectRecord.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRejectRecord.Location = new System.Drawing.Point(18, 126);
            this.btnRejectRecord.Name = "btnRejectRecord";
            this.btnRejectRecord.Size = new System.Drawing.Size(47, 23);
            this.btnRejectRecord.TabIndex = 6;
            this.btnRejectRecord.Text = "<";
            this.btnRejectRecord.UseVisualStyleBackColor = true;
            this.btnRejectRecord.Click += new System.EventHandler(this.btnRejectRecord_Click);
            // 
            // btnSelectAllRecords
            // 
            this.btnSelectAllRecords.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnSelectAllRecords.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSelectAllRecords.Location = new System.Drawing.Point(18, 71);
            this.btnSelectAllRecords.Name = "btnSelectAllRecords";
            this.btnSelectAllRecords.Size = new System.Drawing.Size(47, 23);
            this.btnSelectAllRecords.TabIndex = 5;
            this.btnSelectAllRecords.Text = "> >";
            this.btnSelectAllRecords.UseVisualStyleBackColor = true;
            this.btnSelectAllRecords.Click += new System.EventHandler(this.btnSelectAllRecords_Click);
            // 
            // btnSelectRecord
            // 
            this.btnSelectRecord.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnSelectRecord.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSelectRecord.Location = new System.Drawing.Point(18, 16);
            this.btnSelectRecord.Name = "btnSelectRecord";
            this.btnSelectRecord.Size = new System.Drawing.Size(47, 23);
            this.btnSelectRecord.TabIndex = 4;
            this.btnSelectRecord.Text = ">";
            this.btnSelectRecord.UseVisualStyleBackColor = true;
            this.btnSelectRecord.Click += new System.EventHandler(this.btnSelectRecord_Click);
            // 
            // chkAppend
            // 
            this.chkAppend.AutoSize = true;
            this.chkAppend.Checked = true;
            this.chkAppend.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkAppend.Location = new System.Drawing.Point(3, 223);
            this.chkAppend.Name = "chkAppend";
            this.chkAppend.Padding = new System.Windows.Forms.Padding(3, 0, 0, 0);
            this.chkAppend.Size = new System.Drawing.Size(72, 17);
            this.chkAppend.TabIndex = 8;
            this.chkAppend.Text = "Append";
            this.chkAppend.UseVisualStyleBackColor = true;
            // 
            // btnDone
            // 
            this.btnDone.Location = new System.Drawing.Point(3, 278);
            this.btnDone.Name = "btnDone";
            this.btnDone.Size = new System.Drawing.Size(75, 23);
            this.btnDone.TabIndex = 9;
            this.btnDone.Text = "Done";
            this.btnDone.UseVisualStyleBackColor = true;
            this.btnDone.Click += new System.EventHandler(this.btnDone_Click);
            // 
            // typingTimer
            // 
            this.typingTimer.Enabled = true;
            this.typingTimer.Interval = 400;
            this.typingTimer.Tick += new System.EventHandler(this.typingTimer_Tick);
            // 
            // LookupDialog
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(612, 419);
            this.Controls.Add(this.baseTableLayoutPanel);
            this.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.Name = "LookupDialog";
            this.ShowInTaskbar = false;
            this.Text = "Lookup Dialog";
            this.Activated += new System.EventHandler(this.LookupDialog_Activated);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.LookupDialog_KeyDown);
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.LookupDialog_KeyPress);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.LookupDialog_KeyUp);
            this.baseTableLayoutPanel.ResumeLayout(false);
            this.baseTableLayoutPanel.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.tlbsToolbarStrip.ResumeLayout(false);
            this.tlbsToolbarStrip.PerformLayout();
            this.pnlSearchOn.ResumeLayout(false);
            this.pnlSearchOn.PerformLayout();
            this.pnlSearch.ResumeLayout(false);
            this.pnlSearch.PerformLayout();
            this.spltResultPanel.Panel1.ResumeLayout(false);
            this.spltResultPanel.Panel2.ResumeLayout(false);
            this.spltResultPanel.ResumeLayout(false);
            this.grpbxAvailableRecords.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAvailableRecords)).EndInit();
            this.tbloutSelectedRecordsPanel.ResumeLayout(false);
            this.grpbxSelectedRecords.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSelectedRecords)).EndInit();
            this.tbloutButtonsPanel.ResumeLayout(false);
            this.tbloutButtonsPanel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel baseTableLayoutPanel;
        private System.Windows.Forms.Panel pnlSearch;
        private System.Windows.Forms.MaskedTextBox mtxtSearchString;
        private System.Windows.Forms.Label lblSearchString;
        private System.Windows.Forms.Panel pnlSearchOn;
        private System.Windows.Forms.Label lblSearchOn;
        private System.Windows.Forms.ComboBox cmbSearchOn;
        private System.Windows.Forms.Timer typingTimer;
        private System.Windows.Forms.ToolStrip tlbsToolbarStrip;
        private System.Windows.Forms.ToolStripButton btnSelect;
        private System.Windows.Forms.ToolStripButton btnNew;
        private System.Windows.Forms.ToolStripButton btnUpdate;
        private System.Windows.Forms.ToolStripButton btnReference;
        private System.Windows.Forms.SplitContainer spltResultPanel;
        private System.Windows.Forms.TableLayoutPanel tbloutSelectedRecordsPanel;
        private System.Windows.Forms.GroupBox grpbxSelectedRecords;
        private System.Windows.Forms.TableLayoutPanel tbloutButtonsPanel;
        private System.Windows.Forms.Button btnRejectAllRecords;
        private System.Windows.Forms.Button btnRejectRecord;
        private System.Windows.Forms.Button btnSelectAllRecords;
        private System.Windows.Forms.Button btnSelectRecord;
        private System.Windows.Forms.GroupBox grpbxAvailableRecords;
        private LookupDataGridView dgvSelectedRecords;
        private LookupDataGridView dgvAvailableRecords;
        private ToolStrip toolStrip1;
        private ToolStripSeparator toolStripSeparator2;
        private ToolStripButton btnExit;
        private ToolStripComboBox cmbSearchOperator;
        private ToolStripLabel lblSearchOperator;
        private Button btnDone;
        public CheckBox chkAppend;
    }
}