namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    partial class SewadarIDLookup
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SewadarIDLookup));
            this.SuspendLayout();
            // 
            // SewadarIDLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.DisplayTextBindingKey = "sewadar_id";
            this.IdTextBindingKey = "sewadar_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "SewadarIDLookup";
            this.Title = "Sewadar ID";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
    }
}
