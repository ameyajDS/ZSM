namespace DCC.UMB.CDF.UIControls.TextControls
{
    partial class DCCTextEditor
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
            this.tlpMain = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtEditor = new System.Windows.Forms.TextBox();
            this.f = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnOk = new System.Windows.Forms.Button();
            this.lblViewText = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.tlpMain.SuspendLayout();
            this.f.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpMain
            // 
            this.tlpMain.ColumnCount = 3;
            this.tlpMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.432836F));
            this.tlpMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 93.28358F));
            this.tlpMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.432836F));
            this.tlpMain.Controls.Add(this.txtEditor, 1, 1);
            this.tlpMain.Controls.Add(this.f, 1, 2);
            this.tlpMain.Controls.Add(this.lblViewText, 1, 0);
            this.tlpMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpMain.Location = new System.Drawing.Point(0, 0);
            this.tlpMain.Name = "tlpMain";
            this.tlpMain.RowCount = 3;
            this.tlpMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 4.816956F));
            this.tlpMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 86.7052F));
            this.tlpMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.67052F));
            this.tlpMain.Size = new System.Drawing.Size(670, 519);
            this.tlpMain.TabIndex = 0;
            // 
            // txtEditor
            // 
            this.txtEditor.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtEditor.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEditor.Location = new System.Drawing.Point(25, 27);
            this.txtEditor.Multiline = true;
            this.txtEditor.Name = "txtEditor";
            this.txtEditor.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtEditor.Size = new System.Drawing.Size(618, 443);
            this.txtEditor.TabIndex = 0;
            // 
            // f
            // 
            this.f.ColumnCount = 4;
            this.f.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.f.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.f.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.f.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.f.Controls.Add(this.btnCancel, 2, 0);
            this.f.Controls.Add(this.btnOk, 1, 0);
            this.f.Dock = System.Windows.Forms.DockStyle.Fill;
            this.f.Location = new System.Drawing.Point(25, 476);
            this.f.Name = "f";
            this.f.RowCount = 1;
            this.f.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.f.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 40F));
            this.f.Size = new System.Drawing.Size(618, 40);
            this.f.TabIndex = 1;
            // 
            // btnCancel
            // 
            this.btnCancel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnCancel.Location = new System.Drawing.Point(323, 5);
            this.btnCancel.Margin = new System.Windows.Forms.Padding(15, 5, 15, 5);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(124, 30);
            this.btnCancel.TabIndex = 2;
            this.btnCancel.Text = "&Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnOk
            // 
            this.btnOk.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnOk.Location = new System.Drawing.Point(169, 5);
            this.btnOk.Margin = new System.Windows.Forms.Padding(15, 5, 15, 5);
            this.btnOk.Name = "btnOk";
            this.btnOk.Size = new System.Drawing.Size(124, 30);
            this.btnOk.TabIndex = 1;
            this.btnOk.Text = "&OK";
            this.btnOk.UseVisualStyleBackColor = true;
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // lblViewText
            // 
            this.lblViewText.AutoSize = true;
            this.lblViewText.BackColor = System.Drawing.Color.Transparent;
            this.lblViewText.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblViewText.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblViewText.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblViewText.Location = new System.Drawing.Point(25, 10);
            this.lblViewText.Name = "lblViewText";
            this.lblViewText.Size = new System.Drawing.Size(618, 14);
            this.lblViewText.TabIndex = 2;
            this.lblViewText.Text = "Edit/View Text";
            // 
            // DCCTextEditor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(670, 519);
            this.Controls.Add(this.tlpMain);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "DCCTextEditor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Text Editor";
            this.tlpMain.ResumeLayout(false);
            this.tlpMain.PerformLayout();
            this.f.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpMain;
        private System.Windows.Forms.TextBox txtEditor;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel f;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnOk;
        private DCCLabel lblViewText;
    }
}