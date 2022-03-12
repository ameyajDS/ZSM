namespace DCC.UMB.CDF.UIControls.TextControls.Lookup
{
    partial class LookupColumnCreatorDialog
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
            this.btnGetColumns = new System.Windows.Forms.Button();
            this.lblUserName = new System.Windows.Forms.Label();
            this.lblPassword = new System.Windows.Forms.Label();
            this.lblDatabaseServer = new System.Windows.Forms.Label();
            this.txtuserName = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtDbServername = new System.Windows.Forms.TextBox();
            this.txtDBName = new System.Windows.Forms.TextBox();
            this.lblApplicaiton = new System.Windows.Forms.Label();
            this.grpSqlText = new System.Windows.Forms.GroupBox();
            this.txtSqlText = new System.Windows.Forms.TextBox();
            this.grpSqlText.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnGetColumns
            // 
            this.btnGetColumns.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGetColumns.Location = new System.Drawing.Point(131, 270);
            this.btnGetColumns.Name = "btnGetColumns";
            this.btnGetColumns.Size = new System.Drawing.Size(148, 23);
            this.btnGetColumns.TabIndex = 6;
            this.btnGetColumns.Text = "Get Columns";
            this.btnGetColumns.UseVisualStyleBackColor = true;
            this.btnGetColumns.Click += new System.EventHandler(this.btnGetColumns_Click);
            // 
            // lblUserName
            // 
            this.lblUserName.AutoSize = true;
            this.lblUserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUserName.Location = new System.Drawing.Point(27, 28);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(88, 14);
            this.lblUserName.TabIndex = 1;
            this.lblUserName.Text = "User Name *";
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPassword.Location = new System.Drawing.Point(27, 64);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(81, 14);
            this.lblPassword.TabIndex = 2;
            this.lblPassword.Text = "Password *";
            // 
            // lblDatabaseServer
            // 
            this.lblDatabaseServer.AutoSize = true;
            this.lblDatabaseServer.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDatabaseServer.Location = new System.Drawing.Point(27, 100);
            this.lblDatabaseServer.Name = "lblDatabaseServer";
            this.lblDatabaseServer.Size = new System.Drawing.Size(125, 14);
            this.lblDatabaseServer.TabIndex = 3;
            this.lblDatabaseServer.Text = "Database Server *";
            // 
            // txtuserName
            // 
            this.txtuserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtuserName.Location = new System.Drawing.Point(157, 28);
            this.txtuserName.Name = "txtuserName";
            this.txtuserName.Size = new System.Drawing.Size(176, 22);
            this.txtuserName.TabIndex = 1;
            this.txtuserName.Text = "sa";
            // 
            // txtPassword
            // 
            this.txtPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassword.Location = new System.Drawing.Point(157, 64);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(176, 22);
            this.txtPassword.TabIndex = 2;
            this.txtPassword.Text = "sa";
            // 
            // txtDbServername
            // 
            this.txtDbServername.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDbServername.Location = new System.Drawing.Point(157, 100);
            this.txtDbServername.Name = "txtDbServername";
            this.txtDbServername.Size = new System.Drawing.Size(176, 22);
            this.txtDbServername.TabIndex = 3;
            this.txtDbServername.Text = "nbharti-mobl1";
            // 
            // txtDBName
            // 
            this.txtDBName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDBName.Location = new System.Drawing.Point(159, 137);
            this.txtDBName.Name = "txtDBName";
            this.txtDBName.Size = new System.Drawing.Size(176, 22);
            this.txtDBName.TabIndex = 4;
            this.txtDBName.Text = "RES";
            // 
            // lblApplicaiton
            // 
            this.lblApplicaiton.AutoSize = true;
            this.lblApplicaiton.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblApplicaiton.Location = new System.Drawing.Point(29, 137);
            this.lblApplicaiton.Name = "lblApplicaiton";
            this.lblApplicaiton.Size = new System.Drawing.Size(64, 14);
            this.lblApplicaiton.TabIndex = 11;
            this.lblApplicaiton.Text = "DB Name";
            // 
            // grpSqlText
            // 
            this.grpSqlText.Controls.Add(this.txtSqlText);
            this.grpSqlText.Location = new System.Drawing.Point(12, 175);
            this.grpSqlText.Name = "grpSqlText";
            this.grpSqlText.Size = new System.Drawing.Size(358, 89);
            this.grpSqlText.TabIndex = 12;
            this.grpSqlText.TabStop = false;
            this.grpSqlText.Text = "Sql Statement for Lookup Query";
            // 
            // txtSqlText
            // 
            this.txtSqlText.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSqlText.Font = new System.Drawing.Font("Lucida Console", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSqlText.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.txtSqlText.Location = new System.Drawing.Point(3, 16);
            this.txtSqlText.Multiline = true;
            this.txtSqlText.Name = "txtSqlText";
            this.txtSqlText.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtSqlText.Size = new System.Drawing.Size(352, 70);
            this.txtSqlText.TabIndex = 9;
            // 
            // LookupColumnCreatorDialog
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(382, 305);
            this.Controls.Add(this.grpSqlText);
            this.Controls.Add(this.txtDBName);
            this.Controls.Add(this.lblApplicaiton);
            this.Controls.Add(this.txtDbServername);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.txtuserName);
            this.Controls.Add(this.lblDatabaseServer);
            this.Controls.Add(this.lblPassword);
            this.Controls.Add(this.lblUserName);
            this.Controls.Add(this.btnGetColumns);
            this.Name = "LookupColumnCreatorDialog";
            this.Text = "Lookup Column Wizard";
            this.grpSqlText.ResumeLayout(false);
            this.grpSqlText.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnGetColumns;
        private System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.Label lblDatabaseServer;
        private System.Windows.Forms.TextBox txtuserName;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtDbServername;
        private System.Windows.Forms.TextBox txtDBName;
        private System.Windows.Forms.Label lblApplicaiton;
        private System.Windows.Forms.GroupBox grpSqlText;
        private System.Windows.Forms.TextBox txtSqlText;
    }
}