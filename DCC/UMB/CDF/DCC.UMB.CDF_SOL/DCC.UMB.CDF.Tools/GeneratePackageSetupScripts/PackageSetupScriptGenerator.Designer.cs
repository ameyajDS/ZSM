namespace DCC.UMB.CDF.Tools.GeneratePackageSetupScripts
{
    partial class PackageSetupScriptGenerator
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
            this.button1 = new System.Windows.Forms.Button();
            this.simpleObjectEditor1 = new DCC.UMB.CDF.Tools.GeneratePackageSetupScripts.SimpleObjectEditor();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.button1.Location = new System.Drawing.Point(0, 328);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(555, 44);
            this.button1.TabIndex = 1;
            this.button1.Text = "Register Objects";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // simpleObjectEditor1
            // 
            this.simpleObjectEditor1.CurrentlySelectedObject = null;
            this.simpleObjectEditor1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.simpleObjectEditor1.Location = new System.Drawing.Point(0, 0);
            this.simpleObjectEditor1.Name = "simpleObjectEditor1";
            this.simpleObjectEditor1.Size = new System.Drawing.Size(555, 328);
            this.simpleObjectEditor1.TabIndex = 2;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(555, 48);
            this.tableLayoutPanel1.TabIndex = 3;
            // 
            // PackageSetupScriptGenerator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(555, 372);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.simpleObjectEditor1);
            this.Controls.Add(this.button1);
            this.Name = "PackageSetupScriptGenerator";
            this.Text = "Package Setup Script Generator";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private SimpleObjectEditor simpleObjectEditor1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
    }
}