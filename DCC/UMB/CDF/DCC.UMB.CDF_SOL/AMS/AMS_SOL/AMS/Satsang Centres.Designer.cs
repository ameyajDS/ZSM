namespace AES
{
    partial class SatsangCentres
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
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.grdSatsangCentres = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.Satsang_centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Centre_Type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn();
            this.Zone = new DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn();
            this.Effective_from = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.effective_till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn();
            this.btnShowCurrent = new System.Windows.Forms.Button();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSatsangCentres)).BeginInit();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.btnShowCurrent, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.grdSatsangCentres, 0, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.77694F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 89.22306F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(697, 526);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // grdSatsangCentres
            // 
            this.grdSatsangCentres.AllowUserToAddRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdSatsangCentres.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdSatsangCentres.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSatsangCentres.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.satsang_centre_id,
            this.Satsang_centre_nm,
            this.Centre_Type,
            this.Zone,
            this.Effective_from,
            this.effective_till,
            this.txn_ts});
            this.tableLayoutPanel1.SetColumnSpan(this.grdSatsangCentres, 2);
            this.grdSatsangCentres.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSatsangCentres.Location = new System.Drawing.Point(3, 59);
            this.grdSatsangCentres.Mode = DCC.UMB.CDF.Configuration.UIModes.None;
            this.grdSatsangCentres.Name = "grdSatsangCentres";
            this.grdSatsangCentres.RowHeadersWidth = 15;
            this.grdSatsangCentres.Size = new System.Drawing.Size(691, 464);
            this.grdSatsangCentres.TabIndex = 0;
            this.grdSatsangCentres.VirtualMode = true;
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = "satsang_centre_id";
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.satsang_centre_id.HeaderText = "Centre ID";
            this.satsang_centre_id.Lookup = false;
            this.satsang_centre_id.LookupColumns = "";
            this.satsang_centre_id.Mandatory = false;
            this.satsang_centre_id.Name = "satsang_centre_id";
            this.satsang_centre_id.PercentageWidth = 25;
            this.satsang_centre_id.ReadOnly = true;
            this.satsang_centre_id.Width = 169;
            // 
            // Satsang_centre_nm
            // 
            this.Satsang_centre_nm.BindingKey = "satsang_centre_nm";
            this.Satsang_centre_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.Satsang_centre_nm.HeaderText = "Satsang Centre Name";
            this.Satsang_centre_nm.Lookup = false;
            this.Satsang_centre_nm.LookupColumns = "";
            this.Satsang_centre_nm.Mandatory = false;
            this.Satsang_centre_nm.Name = "Satsang_centre_nm";
            this.Satsang_centre_nm.PercentageWidth = 25;
            this.Satsang_centre_nm.Width = 169;
            // 
            // Centre_Type
            // 
            this.Centre_Type.BindingKey = "centre_type";
            this.Centre_Type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Combobox;
            this.Centre_Type.HeaderText = "Centre Type";
            this.Centre_Type.Lookup = false;
            this.Centre_Type.LookupColumns = "";
            this.Centre_Type.Mandatory = false;
            this.Centre_Type.Name = "Centre_Type";
            this.Centre_Type.PercentageWidth = 25;
            this.Centre_Type.Width = 169;
            // 
            // Zone
            // 
            this.Zone.BindingKey = "zone_id";
            this.Zone.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Combobox;
            this.Zone.HeaderText = "Zone";
            this.Zone.Lookup = false;
            this.Zone.LookupColumns = "";
            this.Zone.Mandatory = false;
            this.Zone.Name = "Zone";
            this.Zone.PercentageWidth = 25;
            this.Zone.Width = 169;
            // 
            // Effective_from
            // 
            this.Effective_from.BindingKey = "effective_from";
            this.Effective_from.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            this.Effective_from.HeaderText = "Effective From";
            this.Effective_from.Lookup = false;
            this.Effective_from.LookupColumns = "";
            this.Effective_from.Mandatory = false;
            this.Effective_from.Name = "Effective_from";
            this.Effective_from.PercentageWidth = 25;
            this.Effective_from.Width = 169;
            // 
            // effective_till
            // 
            this.effective_till.BindingKey = "effective_till";
            this.effective_till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            this.effective_till.HeaderText = "Effective Till";
            this.effective_till.Lookup = false;
            this.effective_till.LookupColumns = "";
            this.effective_till.Mandatory = false;
            this.effective_till.Name = "effective_till";
            this.effective_till.PercentageWidth = 25;
            this.effective_till.Width = 169;
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
            this.txn_ts.Width = 169;
            // 
            // btnShowCurrent
            // 
            this.btnShowCurrent.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnShowCurrent.Location = new System.Drawing.Point(575, 10);
            this.btnShowCurrent.Margin = new System.Windows.Forms.Padding(3, 10, 10, 10);
            this.btnShowCurrent.Name = "btnShowCurrent";
            this.btnShowCurrent.Size = new System.Drawing.Size(112, 36);
            this.btnShowCurrent.TabIndex = 2;
            this.btnShowCurrent.Text = "Show Current";
            this.btnShowCurrent.UseVisualStyleBackColor = true;
            this.btnShowCurrent.Click += new System.EventHandler(this.btnShowCurrent_Click);
            // 
            // SatsangCentres
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(697, 526);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "SatsangCentres";
            this.Text = "Satsang_Centres";
            this.Load += new System.EventHandler(this.Satsang_Centres_Load);
            this.tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSatsangCentres)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSatsangCentres;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn Satsang_centre_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn Centre_Type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn Zone;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_from;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLabelGridColumn txn_ts;
        private System.Windows.Forms.Button btnShowCurrent;
    }
}