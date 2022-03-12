namespace AES
{
    partial class Items
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
            this.grdItems = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.btnShowCurrent = new System.Windows.Forms.Button();
            this.ItemID = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.ItemName = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Asset_Type_Code = new DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn();
            this.Asset_Type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Effective_From = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.Effective_Till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            ((System.ComponentModel.ISupportInitialize)(this.grdItems)).BeginInit();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // grdItems
            // 
            this.grdItems.AllowUserToAddRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdItems.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdItems.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdItems.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ItemID,
            this.ItemName,
            this.Asset_Type_Code,
            this.Asset_Type,
            this.Effective_From,
            this.Effective_Till,
            this.txn_ts});
            this.tableLayoutPanel1.SetColumnSpan(this.grdItems, 2);
            this.grdItems.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdItems.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdItems.Location = new System.Drawing.Point(3, 55);
            this.grdItems.Mode = DCC.UMB.CDF.Configuration.UIModes.None;
            this.grdItems.Name = "grdItems";
            this.grdItems.RowHeadersWidth = 15;
            this.grdItems.Size = new System.Drawing.Size(793, 467);
            this.grdItems.TabIndex = 0;
            this.grdItems.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdItems.VirtualMode = true;
            this.grdItems.FillDefaultCellValues += new System.EventHandler<DCC.UMB.CDF.UIControls.Grid.FillDefaultCellValuesEventArgs>(this.grdItems_FillDefaultCellValues);
            this.grdItems.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdItems_CellContentClick);
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.grdItems, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.btnShowCurrent, 1, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 90F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(799, 525);
            this.tableLayoutPanel1.TabIndex = 1;
            // 
            // btnShowCurrent
            // 
            this.btnShowCurrent.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnShowCurrent.Location = new System.Drawing.Point(677, 10);
            this.btnShowCurrent.Margin = new System.Windows.Forms.Padding(3, 10, 10, 10);
            this.btnShowCurrent.Name = "btnShowCurrent";
            this.btnShowCurrent.Size = new System.Drawing.Size(112, 32);
            this.btnShowCurrent.TabIndex = 1;
            this.btnShowCurrent.Text = "Show Current";
            this.btnShowCurrent.UseVisualStyleBackColor = true;
            this.btnShowCurrent.Click += new System.EventHandler(this.btnShowCurrent_Click);
            // 
            // ItemID
            // 
            this.ItemID.BindingKey = "item_id";
            this.ItemID.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.ItemID.HeaderText = "Item ID";
            this.ItemID.Lookup = false;
            this.ItemID.LookupColumns = "";
            this.ItemID.Mandatory = true;
            this.ItemID.Name = "ItemID";
            this.ItemID.PercentageWidth = 15;
            this.ItemID.ReadOnly = true;
            this.ItemID.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.ItemID.Width = 116;
            // 
            // ItemName
            // 
            this.ItemName.BindingKey = "item_nm";
            this.ItemName.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.ItemName.HeaderText = "Item Name";
            this.ItemName.Lookup = false;
            this.ItemName.LookupColumns = "";
            this.ItemName.Mandatory = true;
            this.ItemName.Name = "ItemName";
            this.ItemName.PercentageWidth = 20;
            this.ItemName.Width = 155;
            // 
            // Asset_Type_Code
            // 
            this.Asset_Type_Code.BindingKey = "asset_type_id";
            this.Asset_Type_Code.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Combobox;
            this.Asset_Type_Code.HeaderText = "Asset Type Code";
            this.Asset_Type_Code.Lookup = false;
            this.Asset_Type_Code.LookupColumns = "";
            this.Asset_Type_Code.Mandatory = true;
            this.Asset_Type_Code.Name = "Asset_Type_Code";
            this.Asset_Type_Code.PercentageWidth = 15;
            this.Asset_Type_Code.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Asset_Type_Code.Width = 116;
            // 
            // Asset_Type
            // 
            this.Asset_Type.BindingKey = "asset_type_nm";
            this.Asset_Type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.Asset_Type.HeaderText = "Asset Type";
            this.Asset_Type.Lookup = false;
            this.Asset_Type.LookupColumns = "";
            this.Asset_Type.Mandatory = false;
            this.Asset_Type.Name = "Asset_Type";
            this.Asset_Type.PercentageWidth = 25;
            this.Asset_Type.Width = 194;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            this.Effective_From.HeaderText = "Effective From";
            this.Effective_From.Lookup = false;
            this.Effective_From.LookupColumns = "";
            this.Effective_From.Mandatory = true;
            this.Effective_From.Name = "Effective_From";
            this.Effective_From.PercentageWidth = 15;
            this.Effective_From.Width = 116;
            // 
            // Effective_Till
            // 
            this.Effective_Till.BindingKey = "effective_till";
            this.Effective_Till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            this.Effective_Till.HeaderText = "Effective Till";
            this.Effective_Till.Lookup = false;
            this.Effective_Till.LookupColumns = "";
            this.Effective_Till.Mandatory = true;
            this.Effective_Till.Name = "Effective_Till";
            this.Effective_Till.PercentageWidth = 15;
            this.Effective_Till.Width = 116;
            // 
            // txn_ts
            // 
            this.txn_ts.BindingKey = "txn_ts";
            this.txn_ts.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.txn_ts.HeaderText = "TxnTs";
            this.txn_ts.Lookup = false;
            this.txn_ts.LookupColumns = "";
            this.txn_ts.Mandatory = false;
            this.txn_ts.Name = "txn_ts";
            this.txn_ts.PercentageWidth = 0;
            this.txn_ts.Visible = false;
            this.txn_ts.Width = 5;
            // 
            // Items
            // 
            this.ClientSize = new System.Drawing.Size(799, 525);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "Items";
            this.Load += new System.EventHandler(this.Items_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grdItems)).EndInit();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdItems;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Button btnShowCurrent;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn ItemID;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn ItemName;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn Asset_Type_Code;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn Asset_Type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn txn_ts;
    }
}

