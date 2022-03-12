namespace DCC.UMB.CDF.UIControls.TextControls
{
    public partial class DCCTextField
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
            this.txtField = new System.Windows.Forms.TextBox();
            this.mnuSuggestions = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.suggestion1ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.suggestion2ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuSuggestions.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtField
            // 
            this.txtField.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtField.Location = new System.Drawing.Point(0, 0);
            this.txtField.Margin = new System.Windows.Forms.Padding(0);
            this.txtField.Name = "txtField";
            this.txtField.Size = new System.Drawing.Size(156, 22);
            this.txtField.TabIndex = 4;
            this.txtField.TextChanged += new System.EventHandler(this.txtField_TextChanged);
            this.txtField.DoubleClick += new System.EventHandler(this.txtField_DoubleClick);
            this.txtField.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtField_KeyDown);
            this.txtField.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtField_KeyPress);
            this.txtField.MouseEnter += new System.EventHandler(this.txtField_MouseEnter);
            this.txtField.Validated += new System.EventHandler(this.txtField_Validated);
            // 
            // mnuSuggestions
            // 
            this.mnuSuggestions.AutoClose = false;
            this.mnuSuggestions.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.suggestion1ToolStripMenuItem,
            this.suggestion2ToolStripMenuItem});
            this.mnuSuggestions.Name = "mnuSuggestions";
            this.mnuSuggestions.Size = new System.Drawing.Size(142, 48);
            // 
            // suggestion1ToolStripMenuItem
            // 
            this.suggestion1ToolStripMenuItem.Name = "suggestion1ToolStripMenuItem";
            this.suggestion1ToolStripMenuItem.Size = new System.Drawing.Size(141, 22);
            this.suggestion1ToolStripMenuItem.Text = "suggestion 1";
            // 
            // suggestion2ToolStripMenuItem
            // 
            this.suggestion2ToolStripMenuItem.Name = "suggestion2ToolStripMenuItem";
            this.suggestion2ToolStripMenuItem.Size = new System.Drawing.Size(141, 22);
            this.suggestion2ToolStripMenuItem.Text = "suggestion 2";
            // 
            // DCCTextField
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Transparent;
            this.ContextMenuStrip = this.mnuSuggestions;
            this.Controls.Add(this.txtField);
            this.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.MaximumSize = new System.Drawing.Size(1300, 45);
            this.MinimumSize = new System.Drawing.Size(10, 22);
            this.Name = "DCCTextField";
            this.Size = new System.Drawing.Size(156, 38);
            this.Click += new System.EventHandler(this.DCCTextField_Click);
            this.Paint += new System.Windows.Forms.PaintEventHandler(this.DCCTextField_Paint);
            this.MouseClick += new System.Windows.Forms.MouseEventHandler(this.DCCTextField_MouseClick);
            this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.DCCTextField_MouseMove);
            this.Validating += new System.ComponentModel.CancelEventHandler(this.DCCTextField_Validating);
            this.mnuSuggestions.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }


        #endregion

        internal System.Windows.Forms.TextBox txtField;
        private System.Windows.Forms.ContextMenuStrip mnuSuggestions;
        private System.Windows.Forms.ToolStripMenuItem suggestion1ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem suggestion2ToolStripMenuItem;


    }
}
