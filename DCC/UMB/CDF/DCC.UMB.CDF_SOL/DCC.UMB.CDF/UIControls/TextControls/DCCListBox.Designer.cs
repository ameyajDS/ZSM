namespace DCC.UMB.CDF.UIControls.TextControls
{
    public partial class DCCListBox
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
            this.lstBox = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // lstBox
            // 
            this.lstBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstBox.ItemHeight = 14;
            this.lstBox.Location = new System.Drawing.Point(0, 0);
            this.lstBox.Margin = new System.Windows.Forms.Padding(0);
            this.lstBox.Name = "lstBox";
            this.lstBox.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
            this.lstBox.Size = new System.Drawing.Size(150, 88);
            this.lstBox.TabIndex = 4;
            this.lstBox.DoubleClick += new System.EventHandler(this.txtField_DoubleClick);
            this.lstBox.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtField_KeyPress);
            this.lstBox.KeyDown += new System.Windows.Forms.KeyEventHandler(this.lstBox_KeyDown);
            // 
            // DCCListBox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Transparent;
            this.Controls.Add(this.lstBox);
            this.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.MinimumSize = new System.Drawing.Size(10, 22);
            this.Name = "DCCListBox";
            this.Size = new System.Drawing.Size(150, 100);
            this.Paint += new System.Windows.Forms.PaintEventHandler(this.DCCTextField_Paint);
            this.Click += new System.EventHandler(this.DCCTextField_Click);
            this.MouseMove += new System.Windows.Forms.MouseEventHandler(this.DCCTextFieldLight_MouseMove);
            this.Validating += new System.ComponentModel.CancelEventHandler(this.DCCTextField_Validating);
            this.MouseClick += new System.Windows.Forms.MouseEventHandler(this.DCCTextField_MouseClick);
            this.ResumeLayout(false);

        }


        #endregion

        internal System.Windows.Forms.ListBox lstBox;


    }
}
