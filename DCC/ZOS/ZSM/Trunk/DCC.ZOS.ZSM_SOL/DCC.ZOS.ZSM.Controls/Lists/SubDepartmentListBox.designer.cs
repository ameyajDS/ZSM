namespace DCC.ZOS.ZSM.Controls.Lists
{
    partial class SubDepartmentListBox
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SubDepartmentListBox));
            this.SuspendLayout();
            // 
            // SubDepartmentListBox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.IdTextBindingKey = "sub_departments_ids_xml";
            this.Lookup = true;
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximumSize = new System.Drawing.Size(2250, 2571);
            this.MinimumSize = new System.Drawing.Size(11, 28);
            this.Name = "SubDepartmentListBox";
            this.Padding = new System.Windows.Forms.Padding(0, 22, 0, 0);
            this.Title = "Sub Department(s)";
            this.ResumeLayout(false);

        }

        #endregion
    }
}