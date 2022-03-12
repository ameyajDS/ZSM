namespace SamplePackage
{
    partial class SampleScreen
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.listBrowseSplitContainer = new System.Windows.Forms.SplitContainer();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.listBrowseSplitContainer.Panel1.SuspendLayout();
            this.listBrowseSplitContainer.Panel2.SuspendLayout();
            this.listBrowseSplitContainer.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.SuspendLayout();
            // 
            // listBrowseSplitContainer
            // 
            this.listBrowseSplitContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listBrowseSplitContainer.Location = new System.Drawing.Point(0, 0);
            this.listBrowseSplitContainer.Name = "listBrowseSplitContainer";
            // 
            // listBrowseSplitContainer.Panel1
            // 
            this.listBrowseSplitContainer.Panel1.Controls.Add(this.textBox1);
            this.listBrowseSplitContainer.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.listBrowseSplitContainer.Panel1MinSize = 80;
            // 
            // listBrowseSplitContainer.Panel2
            // 
            this.listBrowseSplitContainer.Panel2.Controls.Add(this.grdList);
            this.listBrowseSplitContainer.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.listBrowseSplitContainer.Panel2MinSize = 10;
            this.listBrowseSplitContainer.Size = new System.Drawing.Size(781, 487);
            this.listBrowseSplitContainer.SplitterDistance = 605;
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
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdList.Location = new System.Drawing.Point(0, 0);
            this.grdList.Mode = DCC.UMB.CDF.Configuration.UIModes.None;
            this.grdList.Name = "grdList";
            this.grdList.RowHeadersWidth = 15;
            this.grdList.Size = new System.Drawing.Size(175, 487);
            this.grdList.TabIndex = 0;
            this.grdList.VirtualMode = true;
            // 
            // textBox1
            // 
            this.textBox1.BackColor = System.Drawing.SystemColors.Info;
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBox1.Enabled = false;
            this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 36F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.textBox1.Location = new System.Drawing.Point(56, 124);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(452, 189);
            this.textBox1.TabIndex = 0;
            this.textBox1.Text = "This is the area where you will have your controls.";
            // 
            // SampleScreen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(781, 487);
            this.Controls.Add(this.listBrowseSplitContainer);
            this.Name = "SampleScreen";
            this.Text = "Sample Screen";
            this.listBrowseSplitContainer.Panel1.ResumeLayout(false);
            this.listBrowseSplitContainer.Panel1.PerformLayout();
            this.listBrowseSplitContainer.Panel2.ResumeLayout(false);
            this.listBrowseSplitContainer.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer listBrowseSplitContainer;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private System.Windows.Forms.TextBox textBox1;
    }
}