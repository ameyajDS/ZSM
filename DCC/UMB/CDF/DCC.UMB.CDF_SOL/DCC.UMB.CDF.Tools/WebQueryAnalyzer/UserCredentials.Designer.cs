namespace DCC.UMB.CDF.Tools.WebQueryAnalyzer
{
    partial class UserCredentials
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
            this.txtDbServiceUrl = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtuserName = new System.Windows.Forms.TextBox();
            this.lblDatabaseServer = new System.Windows.Forms.Label();
            this.lblPassword = new System.Windows.Forms.Label();
            this.lblUserName = new System.Windows.Forms.Label();
            this.btnConnect = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.lblDbServerName = new System.Windows.Forms.Label();
            this.txtDbServerName = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // txtDbServiceUrl
            // 
            this.txtDbServiceUrl.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDbServiceUrl.Location = new System.Drawing.Point(172, 113);
            this.txtDbServiceUrl.Name = "txtDbServiceUrl";
            this.txtDbServiceUrl.Size = new System.Drawing.Size(224, 22);
            this.txtDbServiceUrl.TabIndex = 3;
            this.txtDbServiceUrl.Text = "http://dvsrvp.dnsalias.net:8086/DBManager/DBManagerWS.asmx";
            this.txtDbServiceUrl.WordWrap = false;
            // 
            // txtPassword
            // 
            this.txtPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassword.Location = new System.Drawing.Point(172, 47);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(224, 22);
            this.txtPassword.TabIndex = 1;
            this.txtPassword.Text = "rssb";
            // 
            // txtuserName
            // 
            this.txtuserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtuserName.Location = new System.Drawing.Point(172, 14);
            this.txtuserName.Name = "txtuserName";
            this.txtuserName.Size = new System.Drawing.Size(224, 22);
            this.txtuserName.TabIndex = 0;
            this.txtuserName.Text = "sa";
            // 
            // lblDatabaseServer
            // 
            this.lblDatabaseServer.AutoSize = true;
            this.lblDatabaseServer.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDatabaseServer.Location = new System.Drawing.Point(12, 116);
            this.lblDatabaseServer.Name = "lblDatabaseServer";
            this.lblDatabaseServer.Size = new System.Drawing.Size(157, 14);
            this.lblDatabaseServer.TabIndex = 9;
            this.lblDatabaseServer.Text = "Database Service URL *";
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPassword.Location = new System.Drawing.Point(12, 50);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(81, 14);
            this.lblPassword.TabIndex = 6;
            this.lblPassword.Text = "Password *";
            // 
            // lblUserName
            // 
            this.lblUserName.AutoSize = true;
            this.lblUserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUserName.Location = new System.Drawing.Point(12, 17);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(88, 14);
            this.lblUserName.TabIndex = 5;
            this.lblUserName.Text = "User Name *";
            // 
            // btnConnect
            // 
            this.btnConnect.Location = new System.Drawing.Point(79, 158);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(75, 23);
            this.btnConnect.TabIndex = 4;
            this.btnConnect.Text = "Connect";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // btnExit
            // 
            this.btnExit.Location = new System.Drawing.Point(262, 158);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(75, 23);
            this.btnExit.TabIndex = 5;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // lblDbServerName
            // 
            this.lblDbServerName.AutoSize = true;
            this.lblDbServerName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDbServerName.Location = new System.Drawing.Point(12, 83);
            this.lblDbServerName.Name = "lblDbServerName";
            this.lblDbServerName.Size = new System.Drawing.Size(121, 14);
            this.lblDbServerName.TabIndex = 12;
            this.lblDbServerName.Text = "DB Server Name *";
            // 
            // txtDbServerName
            // 
            this.txtDbServerName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDbServerName.Location = new System.Drawing.Point(172, 80);
            this.txtDbServerName.Name = "txtDbServerName";
            this.txtDbServerName.Size = new System.Drawing.Size(224, 22);
            this.txtDbServerName.TabIndex = 2;
            this.txtDbServerName.Text = "dvsrvp.dnsalias.net";
            // 
            // UserCredentials
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(408, 202);
            this.Controls.Add(this.txtDbServerName);
            this.Controls.Add(this.lblDbServerName);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnConnect);
            this.Controls.Add(this.txtDbServiceUrl);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.txtuserName);
            this.Controls.Add(this.lblDatabaseServer);
            this.Controls.Add(this.lblPassword);
            this.Controls.Add(this.lblUserName);
            this.Name = "UserCredentials";
            this.Text = "UserCredentials";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtDbServiceUrl;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtuserName;
        private System.Windows.Forms.Label lblDatabaseServer;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Label lblDbServerName;
        private System.Windows.Forms.TextBox txtDbServerName;
    }
}