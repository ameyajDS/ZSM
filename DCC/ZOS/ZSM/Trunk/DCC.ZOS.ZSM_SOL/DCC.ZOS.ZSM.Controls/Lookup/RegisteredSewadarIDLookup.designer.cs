namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    partial class RegisteredSewadarIDLookup
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(RegisteredSewadarIDLookup));
            this.SuspendLayout();
            // 
            // RegisteredSewadarIDLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.DisplayTextBindingKey = "sewadar_id";
            this.IdText = "";
            this.IdTextBindingKey = "sewadar_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.LookupTitle = "Sewadar ID";
            this.Name = "RegisteredSewadarIDLookup";
            this.Size = new System.Drawing.Size(139, 30);
            this.Title = "Sewadar ID";
            this.ValueText = "";
            this.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.RegisteredSewadarIDLookup_LookupDialogShowing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
    }
}
