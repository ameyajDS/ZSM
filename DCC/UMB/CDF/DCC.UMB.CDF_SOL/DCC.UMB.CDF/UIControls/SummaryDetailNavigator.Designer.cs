namespace DCC.UMB.CDF.UIControls
{
    partial class SummaryDetailNavigator
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
            this.btnToggle = new System.Windows.Forms.Button();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.btnBefore = new System.Windows.Forms.ToolStripButton();
            this.btnAfter = new System.Windows.Forms.ToolStripButton();
            this.btnLast = new System.Windows.Forms.ToolStripButton();
            this.btnDelete = new System.Windows.Forms.ToolStripButton();
            this.btnPrevious = new System.Windows.Forms.ToolStripButton();
            this.btnNext = new System.Windows.Forms.ToolStripButton();
            this.btnUp = new System.Windows.Forms.ToolStripButton();
            this.btnDown = new System.Windows.Forms.ToolStripButton();
            this.lblCounter = new System.Windows.Forms.ToolStripLabel();
            this.panel2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnToggle
            // 
            this.btnToggle.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnToggle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnToggle.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnToggle.Image = global::DCC.UMB.CDF.Properties.Resources.SD_Show_Summary;
            this.btnToggle.ImageAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnToggle.Location = new System.Drawing.Point(2, 2);
            this.btnToggle.Name = "btnToggle";
            this.btnToggle.Size = new System.Drawing.Size(66, 24);
            this.btnToggle.TabIndex = 1;
            this.btnToggle.Tag = "SMRY";
            this.btnToggle.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolTip1.SetToolTip(this.btnToggle, "Switch to Summary View");
            this.btnToggle.UseVisualStyleBackColor = false;
            this.btnToggle.Click += new System.EventHandler(this.btnToggle_Click);
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.ControlDark;
            this.panel2.Controls.Add(this.btnToggle);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Padding = new System.Windows.Forms.Padding(2, 2, 2, 5);
            this.panel2.Size = new System.Drawing.Size(70, 31);
            this.panel2.TabIndex = 2;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.ControlDark;
            this.panel1.Controls.Add(this.toolStrip1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 31);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(70, 253);
            this.panel1.TabIndex = 3;
            // 
            // toolStrip1
            // 
            this.toolStrip1.BackColor = System.Drawing.SystemColors.ControlDark;
            this.toolStrip1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btnBefore,
            this.btnAfter,
            this.btnLast,
            this.btnDelete,
            this.btnPrevious,
            this.btnNext,
            this.btnUp,
            this.btnDown,
            this.lblCounter});
            this.toolStrip1.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.Table;
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(70, 253);
            this.toolStrip1.TabIndex = 1;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // btnBefore
            // 
            this.btnBefore.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnBefore.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnBefore.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBefore.Image = global::DCC.UMB.CDF.Properties.Resources.Insert_Before;
            this.btnBefore.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnBefore.Name = "btnBefore";
            this.btnBefore.Size = new System.Drawing.Size(23, 20);
            this.btnBefore.Text = "btnBefore";
            this.btnBefore.TextImageRelation = System.Windows.Forms.TextImageRelation.Overlay;
            this.btnBefore.ToolTipText = "Insert before this record";
            this.btnBefore.Click += new System.EventHandler(this.btnBefore_Click);
            // 
            // btnAfter
            // 
            this.btnAfter.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnAfter.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnAfter.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAfter.Image = global::DCC.UMB.CDF.Properties.Resources.Insert_After;
            this.btnAfter.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnAfter.Name = "btnAfter";
            this.btnAfter.Size = new System.Drawing.Size(23, 20);
            this.btnAfter.Text = "btnAfter";
            this.btnAfter.TextImageRelation = System.Windows.Forms.TextImageRelation.Overlay;
            this.btnAfter.ToolTipText = "Insert after this record";
            this.btnAfter.Click += new System.EventHandler(this.btnAfter_Click);
            // 
            // btnLast
            // 
            this.btnLast.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnLast.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnLast.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLast.Image = global::DCC.UMB.CDF.Properties.Resources.Insert_Last;
            this.btnLast.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnLast.Name = "btnLast";
            this.btnLast.Size = new System.Drawing.Size(23, 20);
            this.btnLast.Text = "btnLast";
            this.btnLast.TextImageRelation = System.Windows.Forms.TextImageRelation.Overlay;
            this.btnLast.ToolTipText = "Insert at last";
            this.btnLast.Click += new System.EventHandler(this.btnLast_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnDelete.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnDelete.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDelete.Image = global::DCC.UMB.CDF.Properties.Resources.Delete1;
            this.btnDelete.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(23, 20);
            this.btnDelete.Text = "btnDelete";
            this.btnDelete.TextImageRelation = System.Windows.Forms.TextImageRelation.Overlay;
            this.btnDelete.ToolTipText = "Delete current record";
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnPrevious
            // 
            this.btnPrevious.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnPrevious.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnPrevious.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPrevious.Image = global::DCC.UMB.CDF.Properties.Resources.Show_Previous;
            this.btnPrevious.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnPrevious.Name = "btnPrevious";
            this.btnPrevious.Size = new System.Drawing.Size(23, 20);
            this.btnPrevious.Text = "btnPrevious";
            this.btnPrevious.TextImageRelation = System.Windows.Forms.TextImageRelation.Overlay;
            this.btnPrevious.ToolTipText = "Show previous record";
            this.btnPrevious.Click += new System.EventHandler(this.btnPrevious_Click);
            // 
            // btnNext
            // 
            this.btnNext.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnNext.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnNext.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNext.Image = global::DCC.UMB.CDF.Properties.Resources.Show_Next;
            this.btnNext.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(23, 20);
            this.btnNext.Text = "btnNext";
            this.btnNext.TextImageRelation = System.Windows.Forms.TextImageRelation.Overlay;
            this.btnNext.ToolTipText = "Show next record";
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // btnUp
            // 
            this.btnUp.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnUp.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnUp.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUp.Image = global::DCC.UMB.CDF.Properties.Resources.Move_Up;
            this.btnUp.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnUp.Name = "btnUp";
            this.btnUp.Size = new System.Drawing.Size(23, 20);
            this.btnUp.Text = "btnUp";
            this.btnUp.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnUp.ToolTipText = "Move this record up";
            this.btnUp.Click += new System.EventHandler(this.btnUp_Click);
            // 
            // btnDown
            // 
            this.btnDown.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnDown.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnDown.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDown.Image = global::DCC.UMB.CDF.Properties.Resources.Move_Down;
            this.btnDown.ImageTransparentColor = System.Drawing.Color.Transparent;
            this.btnDown.Name = "btnDown";
            this.btnDown.Size = new System.Drawing.Size(23, 20);
            this.btnDown.Text = "btnDown";
            this.btnDown.TextImageRelation = System.Windows.Forms.TextImageRelation.Overlay;
            this.btnDown.ToolTipText = "Move this record down";
            this.btnDown.Click += new System.EventHandler(this.btnDown_Click);
            // 
            // lblCounter
            // 
            this.lblCounter.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCounter.Name = "lblCounter";
            this.lblCounter.Size = new System.Drawing.Size(36, 13);
            this.lblCounter.Text = "78/99";
            // 
            // SummaryDetailNavigator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.panel2);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MaximumSize = new System.Drawing.Size(70, 800);
            this.Name = "SummaryDetailNavigator";
            this.Size = new System.Drawing.Size(70, 284);
            this.Load += new System.EventHandler(this.UserControl1_Load);
            this.panel2.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnToggle;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton btnBefore;
        private System.Windows.Forms.ToolStripButton btnAfter;
        private System.Windows.Forms.ToolStripButton btnLast;
        private System.Windows.Forms.ToolStripButton btnDelete;
        private System.Windows.Forms.ToolStripButton btnPrevious;
        private System.Windows.Forms.ToolStripButton btnNext;
        private System.Windows.Forms.ToolStripButton btnUp;
        private System.Windows.Forms.ToolStripButton btnDown;
        private System.Windows.Forms.ToolStripLabel lblCounter;

    }
}
