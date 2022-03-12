namespace DCC.UMB.CDF.Tools.GenerateGridColumns
{
    partial class GenerateGridColumns
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
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.btnGenerateGridColumns = new System.Windows.Forms.Button();
            this.lblUserName = new System.Windows.Forms.Label();
            this.txtTable = new System.Windows.Forms.TextBox();
            this.txtDbName = new System.Windows.Forms.TextBox();
            this.lblPassword = new System.Windows.Forms.Label();
            this.lblDBName = new System.Windows.Forms.Label();
            this.txtDbServername = new System.Windows.Forms.TextBox();
            this.lblDatabaseServer = new System.Windows.Forms.Label();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.lblProcFileDirectory = new System.Windows.Forms.Label();
            this.txtuserName = new System.Windows.Forms.TextBox();
            this.lblColumnPrefix = new System.Windows.Forms.Label();
            this.txtColumnPrefix = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.pnlUserInputs = new System.Windows.Forms.Panel();
            this.bindingSource1 = new System.Windows.Forms.BindingSource();
            this.tableLayoutPanel1.SuspendLayout();
            this.pnlUserInputs.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 24.4898F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 75.5102F));
            this.tableLayoutPanel1.Controls.Add(this.btnGenerateGridColumns, 0, 6);
            this.tableLayoutPanel1.Controls.Add(this.lblUserName, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtTable, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtDbName, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.lblPassword, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblDBName, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.txtDbServername, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblDatabaseServer, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtPassword, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblProcFileDirectory, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtuserName, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.lblColumnPrefix, 0, 5);
            this.tableLayoutPanel1.Controls.Add(this.txtColumnPrefix, 1, 5);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 7;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.28571F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.28571F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.28571F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.28571F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.28571F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.28571F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.28571F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(686, 217);
            this.tableLayoutPanel1.TabIndex = 22;
            // 
            // btnGenerateGridColumns
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.btnGenerateGridColumns, 2);
            this.btnGenerateGridColumns.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnGenerateGridColumns.Font = new System.Drawing.Font("Verdana", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGenerateGridColumns.Location = new System.Drawing.Point(20, 183);
            this.btnGenerateGridColumns.Margin = new System.Windows.Forms.Padding(20, 3, 20, 3);
            this.btnGenerateGridColumns.Name = "btnGenerateGridColumns";
            this.btnGenerateGridColumns.Padding = new System.Windows.Forms.Padding(1);
            this.btnGenerateGridColumns.Size = new System.Drawing.Size(646, 31);
            this.btnGenerateGridColumns.TabIndex = 22;
            this.btnGenerateGridColumns.Text = "Generate Grid Columns (Click Here)";
            this.btnGenerateGridColumns.UseVisualStyleBackColor = true;
            this.btnGenerateGridColumns.Click += new System.EventHandler(this.btnGenerateGridColumns_Click);
            // 
            // lblUserName
            // 
            this.lblUserName.AutoSize = true;
            this.lblUserName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblUserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUserName.Location = new System.Drawing.Point(15, 0);
            this.lblUserName.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(150, 30);
            this.lblUserName.TabIndex = 13;
            this.lblUserName.Text = "User Name *";
            this.lblUserName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtTable
            // 
            this.txtTable.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtTable.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTable.Location = new System.Drawing.Point(171, 123);
            this.txtTable.Name = "txtTable";
            this.txtTable.Size = new System.Drawing.Size(512, 22);
            this.txtTable.TabIndex = 20;
            // 
            // txtDbName
            // 
            this.txtDbName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDbName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDbName.Location = new System.Drawing.Point(171, 93);
            this.txtDbName.Name = "txtDbName";
            this.txtDbName.Size = new System.Drawing.Size(512, 22);
            this.txtDbName.TabIndex = 18;
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPassword.Location = new System.Drawing.Point(15, 30);
            this.lblPassword.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(150, 30);
            this.lblPassword.TabIndex = 15;
            this.lblPassword.Text = "Password *";
            this.lblPassword.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // lblDBName
            // 
            this.lblDBName.AutoSize = true;
            this.lblDBName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDBName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDBName.Location = new System.Drawing.Point(15, 90);
            this.lblDBName.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblDBName.Name = "lblDBName";
            this.lblDBName.Size = new System.Drawing.Size(150, 30);
            this.lblDBName.TabIndex = 21;
            this.lblDBName.Text = "DB Name *";
            this.lblDBName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtDbServername
            // 
            this.txtDbServername.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDbServername.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDbServername.Location = new System.Drawing.Point(171, 63);
            this.txtDbServername.Name = "txtDbServername";
            this.txtDbServername.Size = new System.Drawing.Size(512, 22);
            this.txtDbServername.TabIndex = 17;
            this.txtDbServername.Text = ".";
            // 
            // lblDatabaseServer
            // 
            this.lblDatabaseServer.AutoSize = true;
            this.lblDatabaseServer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDatabaseServer.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDatabaseServer.Location = new System.Drawing.Point(15, 60);
            this.lblDatabaseServer.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblDatabaseServer.Name = "lblDatabaseServer";
            this.lblDatabaseServer.Size = new System.Drawing.Size(150, 30);
            this.lblDatabaseServer.TabIndex = 16;
            this.lblDatabaseServer.Text = "Database Server *";
            this.lblDatabaseServer.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtPassword
            // 
            this.txtPassword.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassword.Location = new System.Drawing.Point(171, 33);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(512, 22);
            this.txtPassword.TabIndex = 14;
            this.txtPassword.Text = "sa";
            // 
            // lblProcFileDirectory
            // 
            this.lblProcFileDirectory.AutoSize = true;
            this.lblProcFileDirectory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblProcFileDirectory.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblProcFileDirectory.Location = new System.Drawing.Point(15, 120);
            this.lblProcFileDirectory.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblProcFileDirectory.Name = "lblProcFileDirectory";
            this.lblProcFileDirectory.Size = new System.Drawing.Size(150, 30);
            this.lblProcFileDirectory.TabIndex = 19;
            this.lblProcFileDirectory.Text = "Table or View";
            this.lblProcFileDirectory.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtuserName
            // 
            this.txtuserName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtuserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtuserName.Location = new System.Drawing.Point(171, 3);
            this.txtuserName.Name = "txtuserName";
            this.txtuserName.Size = new System.Drawing.Size(512, 22);
            this.txtuserName.TabIndex = 12;
            this.txtuserName.Text = "sa";
            // 
            // lblColumnPrefix
            // 
            this.lblColumnPrefix.AutoSize = true;
            this.lblColumnPrefix.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblColumnPrefix.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblColumnPrefix.Location = new System.Drawing.Point(15, 150);
            this.lblColumnPrefix.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblColumnPrefix.Name = "lblColumnPrefix";
            this.lblColumnPrefix.Size = new System.Drawing.Size(150, 30);
            this.lblColumnPrefix.TabIndex = 23;
            this.lblColumnPrefix.Text = "Column Prefix";
            this.lblColumnPrefix.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtColumnPrefix
            // 
            this.txtColumnPrefix.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtColumnPrefix.Location = new System.Drawing.Point(171, 153);
            this.txtColumnPrefix.Name = "txtColumnPrefix";
            this.txtColumnPrefix.Size = new System.Drawing.Size(512, 20);
            this.txtColumnPrefix.TabIndex = 24;
            // 
            // textBox1
            // 
            this.textBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.textBox1.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(0, 217);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.textBox1.Size = new System.Drawing.Size(686, 238);
            this.textBox1.TabIndex = 5;
            this.textBox1.WordWrap = false;
            // 
            // pnlUserInputs
            // 
            this.pnlUserInputs.Controls.Add(this.tableLayoutPanel1);
            this.pnlUserInputs.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlUserInputs.Location = new System.Drawing.Point(0, 0);
            this.pnlUserInputs.Name = "pnlUserInputs";
            this.pnlUserInputs.Size = new System.Drawing.Size(686, 217);
            this.pnlUserInputs.TabIndex = 4;
            // 
            // GenerateGridColumns
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(686, 455);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.pnlUserInputs);
            this.Name = "GenerateGridColumns";
            this.Text = "GenerateGridColumns";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.pnlUserInputs.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Button btnGenerateGridColumns;
        private System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.TextBox txtTable;
        private System.Windows.Forms.TextBox txtDbName;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.Label lblDBName;
        private System.Windows.Forms.TextBox txtDbServername;
        private System.Windows.Forms.Label lblDatabaseServer;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Label lblProcFileDirectory;
        private System.Windows.Forms.TextBox txtuserName;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Panel pnlUserInputs;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Windows.Forms.Label lblColumnPrefix;
        private System.Windows.Forms.TextBox txtColumnPrefix;
    }
}