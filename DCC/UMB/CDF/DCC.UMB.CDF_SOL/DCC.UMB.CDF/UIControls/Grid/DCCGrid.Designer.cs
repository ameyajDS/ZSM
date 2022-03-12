namespace DCC.UMB.CDF.UIControls.Grid
{
    partial class DCCGrid
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dccContextMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.addRowAboveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.addRowBelowToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.deleteRowToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.panelForGridCommands = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccContextMenuStrip.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            this.SuspendLayout();
            // 
            // dccContextMenuStrip
            // 
            this.dccContextMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.addRowAboveToolStripMenuItem,
            this.addRowBelowToolStripMenuItem1,
            this.deleteRowToolStripMenuItem});
            this.dccContextMenuStrip.Name = "dccContextMenuStrip";
            this.dccContextMenuStrip.Size = new System.Drawing.Size(217, 70);
            this.dccContextMenuStrip.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.dccContextMenuStrip_ItemClicked);
            this.dccContextMenuStrip.Opening += new System.ComponentModel.CancelEventHandler(this.dccContextMenuStrip_Opening);
            // 
            // addRowAboveToolStripMenuItem
            // 
            this.addRowAboveToolStripMenuItem.Name = "addRowAboveToolStripMenuItem";
            this.addRowAboveToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Insert)));
            this.addRowAboveToolStripMenuItem.Size = new System.Drawing.Size(216, 22);
            this.addRowAboveToolStripMenuItem.Text = "Add Row Above";
            // 
            // addRowBelowToolStripMenuItem1
            // 
            this.addRowBelowToolStripMenuItem1.Name = "addRowBelowToolStripMenuItem1";
            this.addRowBelowToolStripMenuItem1.ShortcutKeys = ((System.Windows.Forms.Keys)(((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Shift)
                        | System.Windows.Forms.Keys.B)));
            this.addRowBelowToolStripMenuItem1.Size = new System.Drawing.Size(216, 22);
            this.addRowBelowToolStripMenuItem1.Text = "Add Row Below";
            // 
            // deleteRowToolStripMenuItem
            // 
            this.deleteRowToolStripMenuItem.Name = "deleteRowToolStripMenuItem";
            this.deleteRowToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Delete)));
            this.deleteRowToolStripMenuItem.Size = new System.Drawing.Size(216, 22);
            this.deleteRowToolStripMenuItem.Text = "Delete Row";
            // 
            // panelForGridCommands
            // 
            this.panelForGridCommands.BackColor = System.Drawing.SystemColors.Control;
            this.panelForGridCommands.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.panelForGridCommands.ColumnCount = 2;
            this.panelForGridCommands.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.panelForGridCommands.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 18F));
            this.panelForGridCommands.Location = new System.Drawing.Point(0, 0);
            this.panelForGridCommands.Margin = new System.Windows.Forms.Padding(0);
            this.panelForGridCommands.Name = "panelForGridCommands";
            this.panelForGridCommands.RowCount = 1;
            this.panelForGridCommands.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.panelForGridCommands.Size = new System.Drawing.Size(26, 100);
            this.panelForGridCommands.TabIndex = 0;
            // 
            // DCCGrid
            // 
            this.ContextMenuStrip = this.dccContextMenuStrip;
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.DCCGrid_MouseDown);
            this.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.DCCGrid_CellClick);
            this.dccContextMenuStrip.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();
            this.ResumeLayout(false);

        }
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
            try
            {
                base.Dispose(disposing);
            }
            catch
            {
                //Do Nothing.
            }
        }

        private System.Windows.Forms.ContextMenuStrip dccContextMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem addRowAboveToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem addRowBelowToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem deleteRowToolStripMenuItem;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel panelForGridCommands;

        #region Component Designer generated code

        

        #endregion
    }
}
