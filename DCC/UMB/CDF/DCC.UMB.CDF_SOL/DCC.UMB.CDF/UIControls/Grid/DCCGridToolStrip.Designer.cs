namespace DCC.UMB.CDF.UIControls.Grid
{
    partial class DCCGridToolStrip
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.btnExportToExcel = new System.Windows.Forms.Button();
            this.btnMoveDown = new System.Windows.Forms.Button();
            this.btnMoveUp = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnInsertLast = new System.Windows.Forms.Button();
            this.btnInsertAfter = new System.Windows.Forms.Button();
            this.btnInsertBefore = new System.Windows.Forms.Button();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccTableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnExportToExcel
            // 
            this.btnExportToExcel.BackColor = System.Drawing.SystemColors.Control;
            this.btnExportToExcel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnExportToExcel.FlatAppearance.BorderSize = 0;
            this.btnExportToExcel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnExportToExcel.Image = global::DCC.UMB.CDF.Properties.Resources.Excel_16;
            this.btnExportToExcel.Location = new System.Drawing.Point(0, 154);
            this.btnExportToExcel.Margin = new System.Windows.Forms.Padding(0);
            this.btnExportToExcel.Name = "btnExportToExcel";
            this.btnExportToExcel.Size = new System.Drawing.Size(18, 22);
            this.btnExportToExcel.TabIndex = 13;
            this.btnExportToExcel.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.toolTip1.SetToolTip(this.btnExportToExcel, "Export this grid to Excel");
            this.btnExportToExcel.UseVisualStyleBackColor = false;
            this.btnExportToExcel.Click += new System.EventHandler(this.btnExportToExcel_Click);
            // 
            // btnMoveDown
            // 
            this.btnMoveDown.BackColor = System.Drawing.SystemColors.Control;
            this.btnMoveDown.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnMoveDown.FlatAppearance.BorderSize = 0;
            this.btnMoveDown.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMoveDown.Image = global::DCC.UMB.CDF.Properties.Resources.Move_Down;
            this.btnMoveDown.Location = new System.Drawing.Point(0, 132);
            this.btnMoveDown.Margin = new System.Windows.Forms.Padding(0);
            this.btnMoveDown.Name = "btnMoveDown";
            this.btnMoveDown.Size = new System.Drawing.Size(18, 22);
            this.btnMoveDown.TabIndex = 12;
            this.btnMoveDown.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.toolTip1.SetToolTip(this.btnMoveDown, "Move current record down (Ctrl+Down)");
            this.btnMoveDown.UseVisualStyleBackColor = false;
            this.btnMoveDown.Click += new System.EventHandler(this.btnMoveDown_Click);
            // 
            // btnMoveUp
            // 
            this.btnMoveUp.BackColor = System.Drawing.SystemColors.Control;
            this.btnMoveUp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnMoveUp.FlatAppearance.BorderSize = 0;
            this.btnMoveUp.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMoveUp.Image = global::DCC.UMB.CDF.Properties.Resources.Move_Up;
            this.btnMoveUp.Location = new System.Drawing.Point(0, 110);
            this.btnMoveUp.Margin = new System.Windows.Forms.Padding(0);
            this.btnMoveUp.Name = "btnMoveUp";
            this.btnMoveUp.Size = new System.Drawing.Size(18, 22);
            this.btnMoveUp.TabIndex = 11;
            this.btnMoveUp.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.toolTip1.SetToolTip(this.btnMoveUp, "Move current record up (Ctrl+Up)");
            this.btnMoveUp.UseVisualStyleBackColor = false;
            this.btnMoveUp.Click += new System.EventHandler(this.btnMoveUp_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.BackColor = System.Drawing.SystemColors.Control;
            this.btnDelete.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnDelete.FlatAppearance.BorderSize = 0;
            this.btnDelete.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelete.Image = global::DCC.UMB.CDF.Properties.Resources.Delete1;
            this.btnDelete.Location = new System.Drawing.Point(0, 88);
            this.btnDelete.Margin = new System.Windows.Forms.Padding(0);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(18, 22);
            this.btnDelete.TabIndex = 10;
            this.btnDelete.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.toolTip1.SetToolTip(this.btnDelete, "Delete current record (Ctrl+Del)");
            this.btnDelete.UseVisualStyleBackColor = false;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnInsertLast
            // 
            this.btnInsertLast.BackColor = System.Drawing.SystemColors.Control;
            this.btnInsertLast.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnInsertLast.FlatAppearance.BorderSize = 0;
            this.btnInsertLast.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInsertLast.Image = global::DCC.UMB.CDF.Properties.Resources.Insert_Last;
            this.btnInsertLast.Location = new System.Drawing.Point(0, 66);
            this.btnInsertLast.Margin = new System.Windows.Forms.Padding(0);
            this.btnInsertLast.Name = "btnInsertLast";
            this.btnInsertLast.Size = new System.Drawing.Size(18, 22);
            this.btnInsertLast.TabIndex = 9;
            this.btnInsertLast.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.toolTip1.SetToolTip(this.btnInsertLast, "Insert at last(Ctrl+Shift+L)");
            this.btnInsertLast.UseVisualStyleBackColor = false;
            this.btnInsertLast.Click += new System.EventHandler(this.btnInsertLast_Click);
            // 
            // btnInsertAfter
            // 
            this.btnInsertAfter.BackColor = System.Drawing.SystemColors.Control;
            this.btnInsertAfter.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnInsertAfter.FlatAppearance.BorderSize = 0;
            this.btnInsertAfter.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInsertAfter.Image = global::DCC.UMB.CDF.Properties.Resources.Insert_After;
            this.btnInsertAfter.Location = new System.Drawing.Point(0, 44);
            this.btnInsertAfter.Margin = new System.Windows.Forms.Padding(0);
            this.btnInsertAfter.Name = "btnInsertAfter";
            this.btnInsertAfter.Size = new System.Drawing.Size(18, 22);
            this.btnInsertAfter.TabIndex = 8;
            this.btnInsertAfter.TextImageRelation = System.Windows.Forms.TextImageRelation.TextAboveImage;
            this.toolTip1.SetToolTip(this.btnInsertAfter, "Insert after current record (Ctrl+Shift+B+");
            this.btnInsertAfter.UseVisualStyleBackColor = false;
            this.btnInsertAfter.Click += new System.EventHandler(this.btnInsertAfter_Click);
            // 
            // btnInsertBefore
            // 
            this.btnInsertBefore.BackColor = System.Drawing.SystemColors.Control;
            this.btnInsertBefore.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnInsertBefore.FlatAppearance.BorderSize = 0;
            this.btnInsertBefore.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInsertBefore.Image = global::DCC.UMB.CDF.Properties.Resources.Insert_Before;
            this.btnInsertBefore.Location = new System.Drawing.Point(0, 22);
            this.btnInsertBefore.Margin = new System.Windows.Forms.Padding(0);
            this.btnInsertBefore.Name = "btnInsertBefore";
            this.btnInsertBefore.Size = new System.Drawing.Size(18, 22);
            this.btnInsertBefore.TabIndex = 7;
            this.btnInsertBefore.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.toolTip1.SetToolTip(this.btnInsertBefore, "Insert before current record (Ctrl+Ins)");
            this.btnInsertBefore.UseVisualStyleBackColor = false;
            this.btnInsertBefore.Click += new System.EventHandler(this.btnInsertBefore_Click);
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 1;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel1.Controls.Add(this.btnExportToExcel, 0, 7);
            this.dccTableLayoutPanel1.Controls.Add(this.btnMoveDown, 0, 6);
            this.dccTableLayoutPanel1.Controls.Add(this.btnMoveUp, 0, 5);
            this.dccTableLayoutPanel1.Controls.Add(this.btnDelete, 0, 4);
            this.dccTableLayoutPanel1.Controls.Add(this.btnInsertLast, 0, 3);
            this.dccTableLayoutPanel1.Controls.Add(this.btnInsertAfter, 0, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.btnInsertBefore, 0, 1);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Margin = new System.Windows.Forms.Padding(0);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 10;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 22F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(18, 416);
            this.dccTableLayoutPanel1.TabIndex = 7;
            // 
            // DCCGridToolStrip
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dccTableLayoutPanel1);
            this.Margin = new System.Windows.Forms.Padding(0);
            this.MaximumSize = new System.Drawing.Size(18, 1000);
            this.MinimumSize = new System.Drawing.Size(18, 10);
            this.Name = "DCCGridToolStrip";
            this.Size = new System.Drawing.Size(18, 416);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private System.Windows.Forms.Button btnInsertBefore;
        private System.Windows.Forms.Button btnInsertAfter;
        private System.Windows.Forms.Button btnInsertLast;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnMoveUp;
        private System.Windows.Forms.Button btnMoveDown;
        private System.Windows.Forms.Button btnExportToExcel;
        private System.Windows.Forms.ToolTip toolTip1;

    }
}
