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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.listBrowseSplitContainer = new System.Windows.Forms.SplitContainer();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
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
            this.listBrowseSplitContainer.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            // 
            // listBrowseSplitContainer.Panel2
            // 
            this.listBrowseSplitContainer.Panel2.Controls.Add(this.grdList);
            this.listBrowseSplitContainer.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.listBrowseSplitContainer.Size = new System.Drawing.Size(804, 556);
            this.listBrowseSplitContainer.SplitterDistance = 775;
            this.listBrowseSplitContainer.SplitterWidth = 1;
            this.listBrowseSplitContainer.TabIndex = 1;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdList.Location = new System.Drawing.Point(0, 0);
            this.grdList.Mode = DCC.UMB.CDF.Configuration.UIModes.None;
            this.grdList.Name = "grdList";
            this.grdList.ReadOnly = true;
            this.grdList.RowHeadersWidth = 15;
            this.grdList.Size = new System.Drawing.Size(28, 556);
            this.grdList.TabIndex = 0;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // SampleScreen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(804, 556);
            this.Controls.Add(this.listBrowseSplitContainer);
            this.Name = "SampleScreen";
            this.Text = "Sample Screen";
            this.listBrowseSplitContainer.Panel2.ResumeLayout(false);
            this.listBrowseSplitContainer.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer listBrowseSplitContainer;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
    }
}