namespace DCC.UMB.CDF.UIControls.TextControls
{
    public partial class DCCImageBox
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
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.lblTitle = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.pbxDelete = new System.Windows.Forms.PictureBox();
            this.pbxSignature = new System.Windows.Forms.PictureBox();
            this.dccTableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbxDelete)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbxSignature)).BeginInit();
            this.SuspendLayout();
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 3;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.14285F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 54.28572F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.57143F));
            this.dccTableLayoutPanel1.Controls.Add(this.lblTitle, 0, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.pbxDelete, 2, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.pbxSignature, 0, 1);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Margin = new System.Windows.Forms.Padding(1);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 2;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(167, 71);
            this.dccTableLayoutPanel1.TabIndex = 5;
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.BackColor = System.Drawing.Color.Transparent;
            this.dccTableLayoutPanel1.SetColumnSpan(this.lblTitle, 2);
            this.lblTitle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblTitle.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitle.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblTitle.Location = new System.Drawing.Point(1, 1);
            this.lblTitle.Margin = new System.Windows.Forms.Padding(1);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(143, 18);
            this.lblTitle.TabIndex = 3;
            this.lblTitle.Text = "Title";
            this.lblTitle.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // pbxDelete
            // 
            this.pbxDelete.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pbxDelete.Image = global::DCC.UMB.CDF.Properties.Resources.Delete1;
            this.pbxDelete.Location = new System.Drawing.Point(146, 1);
            this.pbxDelete.Margin = new System.Windows.Forms.Padding(1);
            this.pbxDelete.Name = "pbxDelete";
            this.pbxDelete.Size = new System.Drawing.Size(20, 18);
            this.pbxDelete.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pbxDelete.TabIndex = 4;
            this.pbxDelete.TabStop = false;
            this.pbxDelete.Click += new System.EventHandler(this.pbxDelete_Click);
            // 
            // pbxSignature
            // 
            this.pbxSignature.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.dccTableLayoutPanel1.SetColumnSpan(this.pbxSignature, 3);
            this.pbxSignature.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pbxSignature.Location = new System.Drawing.Point(3, 23);
            this.pbxSignature.Name = "pbxSignature";
            this.pbxSignature.Size = new System.Drawing.Size(161, 45);
            this.pbxSignature.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbxSignature.TabIndex = 2;
            this.pbxSignature.TabStop = false;
            this.pbxSignature.DoubleClick += new System.EventHandler(this.pbxSignature_DoubleClick);
            // 
            // DCCImageBox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Transparent;
            this.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Controls.Add(this.dccTableLayoutPanel1);
            this.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.MaximumSize = new System.Drawing.Size(5000, 5000);
            this.MinimumSize = new System.Drawing.Size(10, 22);
            this.Name = "DCCImageBox";
            this.Size = new System.Drawing.Size(167, 71);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.dccTableLayoutPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbxDelete)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbxSignature)).EndInit();
            this.ResumeLayout(false);

        }


        #endregion

        private System.Windows.Forms.PictureBox pbxSignature;
        private DCCLabel lblTitle;
        private System.Windows.Forms.PictureBox pbxDelete;
        private Containers.DCCTableLayoutPanel dccTableLayoutPanel1;


    }
}
