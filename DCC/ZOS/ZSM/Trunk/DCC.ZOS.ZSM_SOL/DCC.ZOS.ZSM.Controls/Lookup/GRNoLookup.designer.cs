namespace DCC.ZOS.ZSM.Controls.ZSMLookups
{
    partial class GRNoLookup
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GRNoLookup));
            this.SuspendLayout();
            // 
            // GRNoLookup
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.DisplayTextBindingKey = "sewadar_grno";
            this.IdText = "";
            this.IdTextBindingKey = "sewadar_id";
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.LookupTitle = "GR No.";
            this.Name = "GRNoLookup";
            this.Size = new System.Drawing.Size(139, 30);
            this.Title = "GR No.";
            this.ValueText = "";
            this.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.GRNoLookup_LookupDialogShowing);
            this.KeyUp += new System.EventHandler<System.Windows.Forms.KeyEventArgs>(this.GRNoLookup_KeyUp);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
    }
}
