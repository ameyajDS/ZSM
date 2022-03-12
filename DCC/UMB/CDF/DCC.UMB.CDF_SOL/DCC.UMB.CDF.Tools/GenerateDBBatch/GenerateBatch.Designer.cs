namespace DCC.UMB.CDF.Tools.GenerateDBBatch
{
    partial class GenerateBatch
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
            this.btnBrowse = new System.Windows.Forms.Button();
            this.txtResults = new System.Windows.Forms.TextBox();
            this.lblSelectedDirectory = new System.Windows.Forms.Label();
            this.btnGenerateBatch = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnBrowse
            // 
            this.btnBrowse.Location = new System.Drawing.Point(752, 9);
            this.btnBrowse.Name = "btnBrowse";
            this.btnBrowse.Size = new System.Drawing.Size(79, 29);
            this.btnBrowse.TabIndex = 0;
            this.btnBrowse.Text = "Browse";
            this.btnBrowse.UseVisualStyleBackColor = true;
            this.btnBrowse.Click += new System.EventHandler(this.btnBrowse_Click);
            // 
            // txtResults
            // 
            this.txtResults.Location = new System.Drawing.Point(35, 105);
            this.txtResults.Multiline = true;
            this.txtResults.Name = "txtResults";
            this.txtResults.ReadOnly = true;
            this.txtResults.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtResults.Size = new System.Drawing.Size(780, 334);
            this.txtResults.TabIndex = 2;
            // 
            // lblSelectedDirectory
            // 
            this.lblSelectedDirectory.Location = new System.Drawing.Point(32, 3);
            this.lblSelectedDirectory.Name = "lblSelectedDirectory";
            this.lblSelectedDirectory.Size = new System.Drawing.Size(687, 53);
            this.lblSelectedDirectory.TabIndex = 3;
            this.lblSelectedDirectory.Text = "\\";
            // 
            // btnGenerateBatch
            // 
            this.btnGenerateBatch.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGenerateBatch.Location = new System.Drawing.Point(35, 59);
            this.btnGenerateBatch.Name = "btnGenerateBatch";
            this.btnGenerateBatch.Size = new System.Drawing.Size(761, 39);
            this.btnGenerateBatch.TabIndex = 4;
            this.btnGenerateBatch.Text = "Generate Batch";
            this.btnGenerateBatch.UseVisualStyleBackColor = true;
            this.btnGenerateBatch.Click += new System.EventHandler(this.btnGenerateBatch_Click);
            // 
            // GenerateBatch
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(859, 451);
            this.Controls.Add(this.btnGenerateBatch);
            this.Controls.Add(this.lblSelectedDirectory);
            this.Controls.Add(this.txtResults);
            this.Controls.Add(this.btnBrowse);
            this.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "GenerateBatch";
            this.Text = "GenerateBatch";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnBrowse;
        private System.Windows.Forms.TextBox txtResults;
        private System.Windows.Forms.Label lblSelectedDirectory;
        private System.Windows.Forms.Button btnGenerateBatch;
    }
}

