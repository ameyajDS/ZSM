namespace DCC.UMB.CDF.Tools.DBFacadeGenerator
{
    partial class FacadeGenerator
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
            this.pnlUserInputs = new System.Windows.Forms.Panel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.btnGenerateFacade = new System.Windows.Forms.Button();
            this.lblUserName = new System.Windows.Forms.Label();
            this.txtProcFolder = new System.Windows.Forms.TextBox();
            this.txtApplicationId = new System.Windows.Forms.TextBox();
            this.lblPassword = new System.Windows.Forms.Label();
            this.lblApplicationId = new System.Windows.Forms.Label();
            this.txtDbServername = new System.Windows.Forms.TextBox();
            this.lblDatabaseServer = new System.Windows.Forms.Label();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.lblProcFileDirectory = new System.Windows.Forms.Label();
            this.txtuserName = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.pnlUserInputs.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlUserInputs
            // 
            this.pnlUserInputs.Controls.Add(this.tableLayoutPanel1);
            this.pnlUserInputs.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlUserInputs.Location = new System.Drawing.Point(0, 0);
            this.pnlUserInputs.Name = "pnlUserInputs";
            this.pnlUserInputs.Size = new System.Drawing.Size(935, 170);
            this.pnlUserInputs.TabIndex = 2;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 17.54011F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 82.45989F));
            this.tableLayoutPanel1.Controls.Add(this.btnGenerateFacade, 0, 5);
            this.tableLayoutPanel1.Controls.Add(this.lblUserName, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtProcFolder, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtApplicationId, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.lblPassword, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblApplicationId, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.txtDbServername, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblDatabaseServer, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtPassword, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblProcFileDirectory, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtuserName, 1, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 16F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(935, 170);
            this.tableLayoutPanel1.TabIndex = 22;
            // 
            // btnGenerateFacade
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.btnGenerateFacade, 2);
            this.btnGenerateFacade.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnGenerateFacade.Font = new System.Drawing.Font("Verdana", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGenerateFacade.Location = new System.Drawing.Point(20, 138);
            this.btnGenerateFacade.Margin = new System.Windows.Forms.Padding(20, 3, 20, 3);
            this.btnGenerateFacade.Name = "btnGenerateFacade";
            this.btnGenerateFacade.Padding = new System.Windows.Forms.Padding(1);
            this.btnGenerateFacade.Size = new System.Drawing.Size(895, 29);
            this.btnGenerateFacade.TabIndex = 22;
            this.btnGenerateFacade.Text = "Generate Code (Click Here)";
            this.btnGenerateFacade.UseVisualStyleBackColor = true;
            this.btnGenerateFacade.Click += new System.EventHandler(this.btnGenerateFacade_Click);
            // 
            // lblUserName
            // 
            this.lblUserName.AutoSize = true;
            this.lblUserName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblUserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUserName.Location = new System.Drawing.Point(15, 0);
            this.lblUserName.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(146, 27);
            this.lblUserName.TabIndex = 13;
            this.lblUserName.Text = "User Name *";
            this.lblUserName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtProcFolder
            // 
            this.txtProcFolder.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtProcFolder.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtProcFolder.Location = new System.Drawing.Point(167, 111);
            this.txtProcFolder.Name = "txtProcFolder";
            this.txtProcFolder.Size = new System.Drawing.Size(765, 22);
            this.txtProcFolder.TabIndex = 20;
            // 
            // txtApplicationId
            // 
            this.txtApplicationId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtApplicationId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtApplicationId.Location = new System.Drawing.Point(167, 84);
            this.txtApplicationId.Name = "txtApplicationId";
            this.txtApplicationId.Size = new System.Drawing.Size(765, 22);
            this.txtApplicationId.TabIndex = 18;
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPassword.Location = new System.Drawing.Point(15, 27);
            this.lblPassword.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(146, 27);
            this.lblPassword.TabIndex = 15;
            this.lblPassword.Text = "Password *";
            this.lblPassword.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // lblApplicationId
            // 
            this.lblApplicationId.AutoSize = true;
            this.lblApplicationId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblApplicationId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblApplicationId.Location = new System.Drawing.Point(15, 81);
            this.lblApplicationId.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblApplicationId.Name = "lblApplicationId";
            this.lblApplicationId.Size = new System.Drawing.Size(146, 27);
            this.lblApplicationId.TabIndex = 21;
            this.lblApplicationId.Text = "Application ID *";
            this.lblApplicationId.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtDbServername
            // 
            this.txtDbServername.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDbServername.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDbServername.Location = new System.Drawing.Point(167, 57);
            this.txtDbServername.Name = "txtDbServername";
            this.txtDbServername.Size = new System.Drawing.Size(765, 22);
            this.txtDbServername.TabIndex = 17;
            this.txtDbServername.Text = ".";
            // 
            // lblDatabaseServer
            // 
            this.lblDatabaseServer.AutoSize = true;
            this.lblDatabaseServer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDatabaseServer.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDatabaseServer.Location = new System.Drawing.Point(15, 54);
            this.lblDatabaseServer.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblDatabaseServer.Name = "lblDatabaseServer";
            this.lblDatabaseServer.Size = new System.Drawing.Size(146, 27);
            this.lblDatabaseServer.TabIndex = 16;
            this.lblDatabaseServer.Text = "Database Server *";
            this.lblDatabaseServer.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtPassword
            // 
            this.txtPassword.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassword.Location = new System.Drawing.Point(167, 30);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(765, 22);
            this.txtPassword.TabIndex = 14;
            this.txtPassword.Text = "sa";
            // 
            // lblProcFileDirectory
            // 
            this.lblProcFileDirectory.AutoSize = true;
            this.lblProcFileDirectory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblProcFileDirectory.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblProcFileDirectory.Location = new System.Drawing.Point(15, 108);
            this.lblProcFileDirectory.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblProcFileDirectory.Name = "lblProcFileDirectory";
            this.lblProcFileDirectory.Size = new System.Drawing.Size(146, 27);
            this.lblProcFileDirectory.TabIndex = 19;
            this.lblProcFileDirectory.Text = "Proc Folder";
            this.lblProcFileDirectory.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtuserName
            // 
            this.txtuserName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtuserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtuserName.Location = new System.Drawing.Point(167, 3);
            this.txtuserName.Name = "txtuserName";
            this.txtuserName.Size = new System.Drawing.Size(765, 22);
            this.txtuserName.TabIndex = 12;
            this.txtuserName.Text = "sa";
            // 
            // textBox1
            // 
            this.textBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.textBox1.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(0, 170);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(935, 324);
            this.textBox1.TabIndex = 3;
            // 
            // FacadeGenerator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(935, 494);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.pnlUserInputs);
            this.Name = "FacadeGenerator";
            this.Text = "Facade Generator";
            this.pnlUserInputs.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Windows.Forms.Panel pnlUserInputs;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.Label lblApplicationId;
        private System.Windows.Forms.Label lblDatabaseServer;
        private System.Windows.Forms.Label lblProcFileDirectory;
        private System.Windows.Forms.TextBox txtuserName;
        private System.Windows.Forms.TextBox txtApplicationId;
        private System.Windows.Forms.TextBox txtProcFolder;
        private System.Windows.Forms.TextBox txtDbServername;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Button btnGenerateFacade;
        private System.Windows.Forms.TextBox textBox1;
    }
}

