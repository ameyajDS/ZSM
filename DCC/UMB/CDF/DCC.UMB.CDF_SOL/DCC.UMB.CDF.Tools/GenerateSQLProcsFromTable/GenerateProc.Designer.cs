namespace DCC.UMB.CDF.Tools.GenerateSQLProcsFromTable
{
    partial class GenerateProc
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
            this.btnGenerateProc = new System.Windows.Forms.Button();
            this.txtTableName = new System.Windows.Forms.TextBox();
            this.lblTableName = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.gbConnectionString = new System.Windows.Forms.GroupBox();
            this.pnlUserInputs = new System.Windows.Forms.Panel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.lblUserName = new System.Windows.Forms.Label();
            this.txtDBName = new System.Windows.Forms.TextBox();
            this.lblPassword = new System.Windows.Forms.Label();
            this.lblDBname = new System.Windows.Forms.Label();
            this.txtDbServername = new System.Windows.Forms.TextBox();
            this.lblDatabaseServer = new System.Windows.Forms.Label();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtuserName = new System.Windows.Forms.TextBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.txtQryProc = new System.Windows.Forms.TextBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.txtDeleteProc = new System.Windows.Forms.TextBox();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.txtUpdateProc = new System.Windows.Forms.TextBox();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.txtInsertProc = new System.Windows.Forms.TextBox();
            this.tbOutput = new System.Windows.Forms.TabControl();
            this.tabPage5 = new System.Windows.Forms.TabPage();
            this.txtConsolidatedProcs = new System.Windows.Forms.TextBox();
            this.panel3 = new System.Windows.Forms.Panel();
            this.button1 = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.panel1.SuspendLayout();
            this.gbConnectionString.SuspendLayout();
            this.pnlUserInputs.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tbOutput.SuspendLayout();
            this.tabPage5.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnGenerateProc
            // 
            this.btnGenerateProc.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnGenerateProc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGenerateProc.Location = new System.Drawing.Point(741, 0);
            this.btnGenerateProc.Name = "btnGenerateProc";
            this.btnGenerateProc.Size = new System.Drawing.Size(100, 44);
            this.btnGenerateProc.TabIndex = 1;
            this.btnGenerateProc.Text = "GO";
            this.btnGenerateProc.UseVisualStyleBackColor = true;
            this.btnGenerateProc.Click += new System.EventHandler(this.btnGenerateProc_Click);
            // 
            // txtTableName
            // 
            this.txtTableName.Location = new System.Drawing.Point(3, 16);
            this.txtTableName.Name = "txtTableName";
            this.txtTableName.Size = new System.Drawing.Size(522, 20);
            this.txtTableName.TabIndex = 0;
            this.txtTableName.Text = "Type table name here";
            // 
            // lblTableName
            // 
            this.lblTableName.AutoSize = true;
            this.lblTableName.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblTableName.Location = new System.Drawing.Point(0, 0);
            this.lblTableName.Name = "lblTableName";
            this.lblTableName.Size = new System.Drawing.Size(65, 13);
            this.lblTableName.TabIndex = 2;
            this.lblTableName.Text = "Table Name";
            this.lblTableName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.gbConnectionString);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(853, 257);
            this.panel1.TabIndex = 3;
            // 
            // gbConnectionString
            // 
            this.gbConnectionString.Controls.Add(this.pnlUserInputs);
            this.gbConnectionString.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gbConnectionString.Location = new System.Drawing.Point(0, 0);
            this.gbConnectionString.Name = "gbConnectionString";
            this.gbConnectionString.Size = new System.Drawing.Size(853, 257);
            this.gbConnectionString.TabIndex = 6;
            this.gbConnectionString.TabStop = false;
            this.gbConnectionString.Text = "Connection String";
            // 
            // pnlUserInputs
            // 
            this.pnlUserInputs.Controls.Add(this.tableLayoutPanel1);
            this.pnlUserInputs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlUserInputs.Location = new System.Drawing.Point(3, 16);
            this.pnlUserInputs.Name = "pnlUserInputs";
            this.pnlUserInputs.Size = new System.Drawing.Size(847, 238);
            this.pnlUserInputs.TabIndex = 3;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 70F));
            this.tableLayoutPanel1.Controls.Add(this.lblUserName, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtDBName, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.lblPassword, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.lblDBname, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.txtDbServername, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblDatabaseServer, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtPassword, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.txtuserName, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.panel2, 0, 4);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 5;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(847, 238);
            this.tableLayoutPanel1.TabIndex = 22;
            // 
            // lblUserName
            // 
            this.lblUserName.AutoSize = true;
            this.lblUserName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblUserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUserName.Location = new System.Drawing.Point(15, 0);
            this.lblUserName.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblUserName.Name = "lblUserName";
            this.lblUserName.Size = new System.Drawing.Size(236, 47);
            this.lblUserName.TabIndex = 13;
            this.lblUserName.Text = "User Name *";
            this.lblUserName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtDBName
            // 
            this.txtDBName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDBName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDBName.Location = new System.Drawing.Point(257, 144);
            this.txtDBName.Name = "txtDBName";
            this.txtDBName.Size = new System.Drawing.Size(587, 22);
            this.txtDBName.TabIndex = 18;
            this.txtDBName.Text = "RES_APP";
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPassword.Location = new System.Drawing.Point(15, 47);
            this.lblPassword.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(236, 47);
            this.lblPassword.TabIndex = 15;
            this.lblPassword.Text = "Password *";
            this.lblPassword.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // lblDBname
            // 
            this.lblDBname.AutoSize = true;
            this.lblDBname.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDBname.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDBname.Location = new System.Drawing.Point(15, 141);
            this.lblDBname.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblDBname.Name = "lblDBname";
            this.lblDBname.Size = new System.Drawing.Size(236, 47);
            this.lblDBname.TabIndex = 21;
            this.lblDBname.Text = "DB Name *";
            this.lblDBname.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtDbServername
            // 
            this.txtDbServername.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDbServername.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDbServername.Location = new System.Drawing.Point(257, 97);
            this.txtDbServername.Name = "txtDbServername";
            this.txtDbServername.Size = new System.Drawing.Size(587, 22);
            this.txtDbServername.TabIndex = 17;
            this.txtDbServername.Text = ".\\sqlexpress";
            // 
            // lblDatabaseServer
            // 
            this.lblDatabaseServer.AutoSize = true;
            this.lblDatabaseServer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDatabaseServer.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDatabaseServer.Location = new System.Drawing.Point(15, 94);
            this.lblDatabaseServer.Margin = new System.Windows.Forms.Padding(15, 0, 3, 0);
            this.lblDatabaseServer.Name = "lblDatabaseServer";
            this.lblDatabaseServer.Size = new System.Drawing.Size(236, 47);
            this.lblDatabaseServer.TabIndex = 16;
            this.lblDatabaseServer.Text = "Database Server *";
            this.lblDatabaseServer.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtPassword
            // 
            this.txtPassword.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPassword.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassword.Location = new System.Drawing.Point(257, 50);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.PasswordChar = '*';
            this.txtPassword.Size = new System.Drawing.Size(587, 22);
            this.txtPassword.TabIndex = 14;
            this.txtPassword.Text = "4o9";
            // 
            // txtuserName
            // 
            this.txtuserName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtuserName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtuserName.Location = new System.Drawing.Point(257, 3);
            this.txtuserName.Name = "txtuserName";
            this.txtuserName.Size = new System.Drawing.Size(587, 22);
            this.txtuserName.TabIndex = 12;
            this.txtuserName.Text = "sa";
            // 
            // panel2
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.panel2, 2);
            this.panel2.Controls.Add(this.lblTableName);
            this.panel2.Controls.Add(this.btnGenerateProc);
            this.panel2.Controls.Add(this.txtTableName);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(3, 191);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(841, 44);
            this.panel2.TabIndex = 22;
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.txtQryProc);
            this.tabPage4.Location = new System.Drawing.Point(4, 22);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Size = new System.Drawing.Size(845, 250);
            this.tabPage4.TabIndex = 3;
            this.tabPage4.Text = "Query Proc";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // txtQryProc
            // 
            this.txtQryProc.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtQryProc.Location = new System.Drawing.Point(0, 0);
            this.txtQryProc.Multiline = true;
            this.txtQryProc.Name = "txtQryProc";
            this.txtQryProc.ReadOnly = true;
            this.txtQryProc.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtQryProc.Size = new System.Drawing.Size(845, 250);
            this.txtQryProc.TabIndex = 7;
            this.txtQryProc.WordWrap = false;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.txtDeleteProc);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Size = new System.Drawing.Size(845, 250);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Delete Proc";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // txtDeleteProc
            // 
            this.txtDeleteProc.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDeleteProc.Location = new System.Drawing.Point(0, 0);
            this.txtDeleteProc.Multiline = true;
            this.txtDeleteProc.Name = "txtDeleteProc";
            this.txtDeleteProc.ReadOnly = true;
            this.txtDeleteProc.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtDeleteProc.Size = new System.Drawing.Size(845, 250);
            this.txtDeleteProc.TabIndex = 7;
            this.txtDeleteProc.WordWrap = false;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.txtUpdateProc);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(845, 250);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Update Proc";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // txtUpdateProc
            // 
            this.txtUpdateProc.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtUpdateProc.Location = new System.Drawing.Point(3, 3);
            this.txtUpdateProc.Multiline = true;
            this.txtUpdateProc.Name = "txtUpdateProc";
            this.txtUpdateProc.ReadOnly = true;
            this.txtUpdateProc.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtUpdateProc.Size = new System.Drawing.Size(839, 244);
            this.txtUpdateProc.TabIndex = 6;
            this.txtUpdateProc.WordWrap = false;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.txtInsertProc);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(845, 250);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Insert Proc";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // txtInsertProc
            // 
            this.txtInsertProc.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtInsertProc.Location = new System.Drawing.Point(3, 3);
            this.txtInsertProc.Multiline = true;
            this.txtInsertProc.Name = "txtInsertProc";
            this.txtInsertProc.ReadOnly = true;
            this.txtInsertProc.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtInsertProc.Size = new System.Drawing.Size(839, 244);
            this.txtInsertProc.TabIndex = 5;
            this.txtInsertProc.WordWrap = false;
            // 
            // tbOutput
            // 
            this.tbOutput.Controls.Add(this.tabPage1);
            this.tbOutput.Controls.Add(this.tabPage2);
            this.tbOutput.Controls.Add(this.tabPage3);
            this.tbOutput.Controls.Add(this.tabPage4);
            this.tbOutput.Controls.Add(this.tabPage5);
            this.tbOutput.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbOutput.Location = new System.Drawing.Point(0, 257);
            this.tbOutput.Name = "tbOutput";
            this.tbOutput.SelectedIndex = 0;
            this.tbOutput.Size = new System.Drawing.Size(853, 276);
            this.tbOutput.TabIndex = 6;
            // 
            // tabPage5
            // 
            this.tabPage5.Controls.Add(this.txtConsolidatedProcs);
            this.tabPage5.Location = new System.Drawing.Point(4, 22);
            this.tabPage5.Name = "tabPage5";
            this.tabPage5.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage5.Size = new System.Drawing.Size(845, 250);
            this.tabPage5.TabIndex = 4;
            this.tabPage5.Text = "Consolidated";
            this.tabPage5.UseVisualStyleBackColor = true;
            // 
            // txtConsolidatedProcs
            // 
            this.txtConsolidatedProcs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtConsolidatedProcs.Location = new System.Drawing.Point(3, 3);
            this.txtConsolidatedProcs.Multiline = true;
            this.txtConsolidatedProcs.Name = "txtConsolidatedProcs";
            this.txtConsolidatedProcs.ReadOnly = true;
            this.txtConsolidatedProcs.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtConsolidatedProcs.Size = new System.Drawing.Size(839, 244);
            this.txtConsolidatedProcs.TabIndex = 8;
            this.txtConsolidatedProcs.WordWrap = false;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.button1);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel3.Location = new System.Drawing.Point(0, 533);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(853, 44);
            this.panel3.TabIndex = 7;
            // 
            // button1
            // 
            this.button1.Dock = System.Windows.Forms.DockStyle.Right;
            this.button1.Location = new System.Drawing.Point(719, 0);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(134, 44);
            this.button1.TabIndex = 0;
            this.button1.Text = "Generate Files";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // GenerateProc
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(853, 577);
            this.Controls.Add(this.tbOutput);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel1);
            this.Name = "GenerateProc";
            this.Text = "Create Procedures From Table Name";
            this.panel1.ResumeLayout(false);
            this.gbConnectionString.ResumeLayout(false);
            this.pnlUserInputs.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.tabPage4.ResumeLayout(false);
            this.tabPage4.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tbOutput.ResumeLayout(false);
            this.tabPage5.ResumeLayout(false);
            this.tabPage5.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnGenerateProc;
        private System.Windows.Forms.TextBox txtTableName;
        private System.Windows.Forms.Label lblTableName;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox gbConnectionString;
        private System.Windows.Forms.Panel pnlUserInputs;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Label lblUserName;
        private System.Windows.Forms.TextBox txtDBName;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.Label lblDBname;
        private System.Windows.Forms.TextBox txtDbServername;
        private System.Windows.Forms.Label lblDatabaseServer;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.TextBox txtuserName;
        private System.Windows.Forms.TabPage tabPage4;
        private System.Windows.Forms.TextBox txtQryProc;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.TextBox txtDeleteProc;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TextBox txtUpdateProc;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TextBox txtInsertProc;
        private System.Windows.Forms.TabControl tbOutput;
        private System.Windows.Forms.TabPage tabPage5;
        private System.Windows.Forms.TextBox txtConsolidatedProcs;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
    }
}

