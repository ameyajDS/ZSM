namespace DCC.UMB.CDBControls.Lists
{
    partial class CountriesListBox
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CountriesListBox));
            this.SuspendLayout();
            // 
            // CountriesListBox
            // 
            this.ApplicationIdForDbConnection = "CDB_APP";
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CalledScreenApplicationId = "";
            this.IdTextBindingKey = "countries_ids_xml";
            this.Lookup = true;
            this.LookupColumns = resources.GetString("$this.LookupColumns");
            this.Name = "CountriesListBox";
            this.Title = "Country (s)";
            this.ResumeLayout(false);

        }

        #endregion
    }
}