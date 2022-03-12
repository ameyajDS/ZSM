namespace AES
{
    partial class Assets1
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Assets1));
            this.countriesLookup1 = new DCC.UMB.CDBLookups.CountriesLookup();
            this.SuspendLayout();
            // 
            // countriesLookup1
            // 
            this.countriesLookup1.AllowsNew = false;
            this.countriesLookup1.AllowsReference = false;
            this.countriesLookup1.AllowsUpdate = false;
            this.countriesLookup1.ApplicationIdForDbConnection = "AMS_App";
            this.countriesLookup1.BackColor = System.Drawing.Color.Transparent;
            this.countriesLookup1.CalledScreenTypeName = null;
            this.countriesLookup1.CallingScreenType = null;
            this.countriesLookup1.DisplayText = "";
            this.countriesLookup1.EditingControlDataGridView = null;
            this.countriesLookup1.EditingControlFormattedValue = null;
            this.countriesLookup1.EditingControlRowIndex = 0;
            this.countriesLookup1.EditingControlValueChanged = true;
            this.countriesLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.countriesLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.countriesLookup1.FormMode = DCC.UMB.CDF.Configuration.UIModes.New;
            this.countriesLookup1.IdText = null;
            this.countriesLookup1.Location = new System.Drawing.Point(110, 58);
            this.countriesLookup1.Lookup = true;
            this.countriesLookup1.LookupColumns = resources.GetString("countriesLookup1.LookupColumns");
            this.countriesLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.countriesLookup1.Mandatory = false;
            this.countriesLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.countriesLookup1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.countriesLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.countriesLookup1.Name = "countriesLookup1";
            this.countriesLookup1.Padding = new System.Windows.Forms.Padding(0, 16, 14, 0);
            this.countriesLookup1.ReadOnly = false;
            this.countriesLookup1.Size = new System.Drawing.Size(159, 44);
            this.countriesLookup1.TabIndex = 0;
            this.countriesLookup1.Title = "Countries";
            this.countriesLookup1.ValueText = null;
            // 
            // Assets1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(807, 557);
            this.Controls.Add(this.countriesLookup1);
            this.Name = "Assets1";
            this.Text = "Assets";
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDBLookups.CountriesLookup countriesLookup1;


    }
}