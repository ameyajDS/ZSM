namespace DCC.UMB.CDF.UIControls.TextControls
{
    public partial class DCCComboBox
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
            this.cmbField = new DCC.UMB.CDF.UIControls.TextControls.ReadOnlyCombo();
            this.SuspendLayout();
            // 
            // cmbField
            // 
            this.cmbField.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbField.Location = new System.Drawing.Point(0, 16);
            this.cmbField.Margin = new System.Windows.Forms.Padding(0);
            this.cmbField.Name = "cmbField";
            this.cmbField.Size = new System.Drawing.Size(156, 22);
            this.cmbField.TabIndex = 4;
            // 
            // DCCComboBox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Transparent;
            this.Controls.Add(this.cmbField);
            this.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.MaximumSize = new System.Drawing.Size(1300, 44);
            this.MinimumSize = new System.Drawing.Size(10, 22);
            this.Name = "DCCComboBox";
            this.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.Size = new System.Drawing.Size(156, 38);
            this.Paint += new System.Windows.Forms.PaintEventHandler(this.DCCComboBox_Paint);
            this.Click += new System.EventHandler(this.DCCTextField_Click);
            this.Validating += new System.ComponentModel.CancelEventHandler(this.DCCComboBox_Validating);
            this.MouseClick += new System.Windows.Forms.MouseEventHandler(this.DCCTextField_MouseClick);
            this.ResumeLayout(false);

        }


        #endregion

        ReadOnlyCombo cmbField;


    }
}
