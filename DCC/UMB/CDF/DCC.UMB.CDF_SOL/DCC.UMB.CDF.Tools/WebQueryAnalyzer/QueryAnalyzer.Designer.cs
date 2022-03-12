namespace DCC.UMB.CDF.Tools.WebQueryAnalyzer
{
    partial class QueryAnalyzer
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
            this.mainSpltContainer = new System.Windows.Forms.SplitContainer();
            this.txtQuery = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblMessage = new System.Windows.Forms.Label();
            this.tlpQueryResults = new System.Windows.Forms.TableLayoutPanel();
            this.tabPaneQueryResults = new System.Windows.Forms.TabControl();
            this.taResults = new System.Windows.Forms.TabPage();
            this.tabMessages = new System.Windows.Forms.TabPage();
            this.txtMessages = new System.Windows.Forms.TextBox();
            this.mainSpltContainer.Panel1.SuspendLayout();
            this.mainSpltContainer.Panel2.SuspendLayout();
            this.mainSpltContainer.SuspendLayout();
            this.panel1.SuspendLayout();
            this.tabPaneQueryResults.SuspendLayout();
            this.taResults.SuspendLayout();
            this.tabMessages.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainSpltContainer
            // 
            this.mainSpltContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainSpltContainer.Location = new System.Drawing.Point(0, 0);
            this.mainSpltContainer.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.mainSpltContainer.Name = "mainSpltContainer";
            this.mainSpltContainer.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // mainSpltContainer.Panel1
            // 
            this.mainSpltContainer.Panel1.Controls.Add(this.txtQuery);
            this.mainSpltContainer.Panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            // 
            // mainSpltContainer.Panel2
            // 
            this.mainSpltContainer.Panel2.Controls.Add(this.tabPaneQueryResults);
            this.mainSpltContainer.Panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.mainSpltContainer.Size = new System.Drawing.Size(758, 526);
            this.mainSpltContainer.SplitterDistance = 190;
            this.mainSpltContainer.TabIndex = 0;
            // 
            // txtQuery
            // 
            this.txtQuery.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtQuery.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtQuery.Location = new System.Drawing.Point(0, 0);
            this.txtQuery.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtQuery.Multiline = true;
            this.txtQuery.Name = "txtQuery";
            this.txtQuery.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtQuery.Size = new System.Drawing.Size(758, 190);
            this.txtQuery.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.lblMessage);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 500);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(758, 26);
            this.panel1.TabIndex = 1;
            // 
            // lblMessage
            // 
            this.lblMessage.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblMessage.Location = new System.Drawing.Point(0, 0);
            this.lblMessage.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMessage.Name = "lblMessage";
            this.lblMessage.Size = new System.Drawing.Size(756, 24);
            this.lblMessage.TabIndex = 0;
            this.lblMessage.Text = "Ready";
            this.lblMessage.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // tlpQueryResults
            // 
            this.tlpQueryResults.AutoScroll = true;
            this.tlpQueryResults.AutoSize = true;
            this.tlpQueryResults.ColumnCount = 1;
            this.tlpQueryResults.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpQueryResults.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpQueryResults.Location = new System.Drawing.Point(3, 3);
            this.tlpQueryResults.Name = "tlpQueryResults";
            this.tlpQueryResults.RowCount = 1;
            this.tlpQueryResults.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpQueryResults.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpQueryResults.Size = new System.Drawing.Size(744, 299);
            this.tlpQueryResults.TabIndex = 0;
            // 
            // tabPaneQueryResults
            // 
            this.tabPaneQueryResults.Controls.Add(this.taResults);
            this.tabPaneQueryResults.Controls.Add(this.tabMessages);
            this.tabPaneQueryResults.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabPaneQueryResults.Location = new System.Drawing.Point(0, 0);
            this.tabPaneQueryResults.Name = "tabPaneQueryResults";
            this.tabPaneQueryResults.SelectedIndex = 0;
            this.tabPaneQueryResults.Size = new System.Drawing.Size(758, 332);
            this.tabPaneQueryResults.TabIndex = 0;
            // 
            // taResults
            // 
            this.taResults.Controls.Add(this.tlpQueryResults);
            this.taResults.Location = new System.Drawing.Point(4, 23);
            this.taResults.Name = "taResults";
            this.taResults.Padding = new System.Windows.Forms.Padding(3);
            this.taResults.Size = new System.Drawing.Size(750, 305);
            this.taResults.TabIndex = 0;
            this.taResults.Text = "Results";
            this.taResults.UseVisualStyleBackColor = true;
            // 
            // tabMessages
            // 
            this.tabMessages.Controls.Add(this.txtMessages);
            this.tabMessages.Location = new System.Drawing.Point(4, 23);
            this.tabMessages.Name = "tabMessages";
            this.tabMessages.Padding = new System.Windows.Forms.Padding(3);
            this.tabMessages.Size = new System.Drawing.Size(750, 305);
            this.tabMessages.TabIndex = 1;
            this.tabMessages.Text = "Messages";
            this.tabMessages.UseVisualStyleBackColor = true;
            // 
            // txtMessages
            // 
            this.txtMessages.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtMessages.Location = new System.Drawing.Point(3, 3);
            this.txtMessages.Multiline = true;
            this.txtMessages.Name = "txtMessages";
            this.txtMessages.ReadOnly = true;
            this.txtMessages.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtMessages.Size = new System.Drawing.Size(744, 299);
            this.txtMessages.TabIndex = 0;
            // 
            // QueryAnalyzer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(758, 526);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.mainSpltContainer);
            this.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.KeyPreview = true;
            this.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.Name = "QueryAnalyzer";
            this.Text = "Web Based Query Analyzer";
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.QueryAnalyzer_KeyPress);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.QueryAnalyzer_KeyDown);
            this.mainSpltContainer.Panel1.ResumeLayout(false);
            this.mainSpltContainer.Panel1.PerformLayout();
            this.mainSpltContainer.Panel2.ResumeLayout(false);
            this.mainSpltContainer.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.tabPaneQueryResults.ResumeLayout(false);
            this.taResults.ResumeLayout(false);
            this.taResults.PerformLayout();
            this.tabMessages.ResumeLayout(false);
            this.tabMessages.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer mainSpltContainer;
        private System.Windows.Forms.TextBox txtQuery;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblMessage;
        private System.Windows.Forms.TableLayoutPanel tlpQueryResults;
        private System.Windows.Forms.TabControl tabPaneQueryResults;
        private System.Windows.Forms.TabPage taResults;
        private System.Windows.Forms.TabPage tabMessages;
        private System.Windows.Forms.TextBox txtMessages;
    }
}