namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    partial class SystemInfoCodeLookup
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SystemInfoCodeLookup));
            this.SuspendLayout();
            // 
            // SystemInfoCodeLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(15F, 29F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.DisplayTextBindingKey = "system_info_cd";
            this.IdText = "";
            this.IdTextBindingKey = "system_info_cd";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.LookupTitle = "System Info Code";
            this.Margin = new System.Windows.Forms.Padding(8, 6, 8, 6);
            this.MaximumSize = new System.Drawing.Size(2438, 93);
            this.MinimumSize = new System.Drawing.Size(19, 46);
            this.Name = "SystemInfoCodeLookup";
            this.Size = new System.Drawing.Size(156, 46);
            this.Title = "System Info Code";
            this.ValueText = "";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
    }
}
