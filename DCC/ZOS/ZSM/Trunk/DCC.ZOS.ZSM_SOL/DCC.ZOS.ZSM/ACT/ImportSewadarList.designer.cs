namespace DCC.ZOS.ZSM.ACT
{
    partial class ImportSewadarList
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ImportSewadarList));
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtExcelLoc = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.btnExcelLoc = new System.Windows.Forms.Button();
            this.lblForSatsangCentre = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.lblSatsangCentre = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.sewadarListLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup();
            this.tlpBase.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 5;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.17985F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.06565F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.51159F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.06565F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.17726F));
            this.tlpBase.Controls.Add(this.txtExcelLoc, 1, 3);
            this.tlpBase.Controls.Add(this.btnExcelLoc, 3, 3);
            this.tlpBase.Controls.Add(this.lblForSatsangCentre, 2, 1);
            this.tlpBase.Controls.Add(this.lblSatsangCentre, 2, 2);
            this.tlpBase.Controls.Add(this.sewadarListLookup1, 1, 4);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Margin = new System.Windows.Forms.Padding(4);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 10;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.910695F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5.00035F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.910695F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.605953F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.631717F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 24.8291F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.797568F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.002764F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.310489F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.00067F));
            this.tlpBase.Size = new System.Drawing.Size(1221, 711);
            this.tlpBase.TabIndex = 4;
            // 
            // txtExcelLoc
            // 
            this.txtExcelLoc.AllowsNew = false;
            this.txtExcelLoc.AllowsReference = false;
            this.txtExcelLoc.AllowsUpdate = false;
            this.txtExcelLoc.ApplicationIdForDbConnection = null;
            this.txtExcelLoc.BackColor = System.Drawing.Color.Transparent;
            this.txtExcelLoc.CalledScreenApplicationId = null;
            this.txtExcelLoc.CalledScreenTypeName = null;
            this.txtExcelLoc.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.txtExcelLoc, 3);
            this.txtExcelLoc.DisplayText = "";
            this.txtExcelLoc.DisplayTextBindingKey = null;
            this.txtExcelLoc.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtExcelLoc.EditingControlDataGridView = null;
            this.txtExcelLoc.EditingControlFormattedValue = "";
            this.txtExcelLoc.EditingControlRowIndex = 0;
            this.txtExcelLoc.EditingControlValueChanged = false;
            this.txtExcelLoc.EnableToolTip = false;
            this.txtExcelLoc.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtExcelLoc.IdText = null;
            this.txtExcelLoc.IdTextBindingKey = null;
            this.txtExcelLoc.Location = new System.Drawing.Point(336, 179);
            this.txtExcelLoc.Lookup = false;
            this.txtExcelLoc.LookupColumns = null;
            this.txtExcelLoc.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtExcelLoc.LookupResult = null;
            this.txtExcelLoc.LookupTitle = "CSV Location";
            this.txtExcelLoc.Mandatory = true;
            this.txtExcelLoc.Margin = new System.Windows.Forms.Padding(5, 4, 0, 4);
            this.txtExcelLoc.MaxCharacterLength = 32767;
            this.txtExcelLoc.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtExcelLoc.MinCharactersForQuery = 0;
            this.txtExcelLoc.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtExcelLoc.Name = "txtExcelLoc";
            this.txtExcelLoc.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtExcelLoc.PascalCase = false;
            this.txtExcelLoc.RangeInQueryMode = false;
            this.txtExcelLoc.ReadOnly = true;
            this.txtExcelLoc.RegularExpressionValidator = null;
            this.txtExcelLoc.Size = new System.Drawing.Size(550, 53);
            this.txtExcelLoc.TabIndex = 6;
            this.txtExcelLoc.TabStop = false;
            this.txtExcelLoc.Title = "CSV Location";
            this.txtExcelLoc.ToolTipLookupField = "information";
            this.txtExcelLoc.ValueText = null;
            // 
            // btnExcelLoc
            // 
            this.btnExcelLoc.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnExcelLoc.Image = ((System.Drawing.Image)(resources.GetObject("btnExcelLoc.Image")));
            this.btnExcelLoc.Location = new System.Drawing.Point(886, 200);
            this.btnExcelLoc.Margin = new System.Windows.Forms.Padding(0, 25, 5, 4);
            this.btnExcelLoc.MaximumSize = new System.Drawing.Size(33, 31);
            this.btnExcelLoc.Name = "btnExcelLoc";
            this.btnExcelLoc.Size = new System.Drawing.Size(33, 31);
            this.btnExcelLoc.TabIndex = 7;
            this.btnExcelLoc.UseVisualStyleBackColor = true;
            this.btnExcelLoc.Click += new System.EventHandler(this.btnExcelLoc_Click);
            // 
            // lblForSatsangCentre
            // 
            this.lblForSatsangCentre.AutoSize = true;
            this.lblForSatsangCentre.BackColor = System.Drawing.Color.Transparent;
            this.lblForSatsangCentre.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblForSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblForSatsangCentre.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblForSatsangCentre.Location = new System.Drawing.Point(457, 87);
            this.lblForSatsangCentre.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblForSatsangCentre.Name = "lblForSatsangCentre";
            this.lblForSatsangCentre.Size = new System.Drawing.Size(303, 18);
            this.lblForSatsangCentre.TabIndex = 41;
            this.lblForSatsangCentre.Text = " Satsang Centre";
            // 
            // lblSatsangCentre
            // 
            this.lblSatsangCentre.AutoSize = true;
            this.lblSatsangCentre.BackColor = System.Drawing.Color.Transparent;
            this.lblSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblSatsangCentre.Font = new System.Drawing.Font("Verdana", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSatsangCentre.ForeColor = System.Drawing.Color.Red;
            this.lblSatsangCentre.Location = new System.Drawing.Point(457, 105);
            this.lblSatsangCentre.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblSatsangCentre.Name = "lblSatsangCentre";
            this.lblSatsangCentre.Size = new System.Drawing.Size(303, 70);
            this.lblSatsangCentre.TabIndex = 42;
            // 
            // sewadarListLookup1
            // 
            this.sewadarListLookup1.AllowsNew = false;
            this.sewadarListLookup1.AllowsReference = false;
            this.sewadarListLookup1.AllowsUpdate = false;
            this.sewadarListLookup1.ApplicationIdForDbConnection = null;
            this.sewadarListLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewadarListLookup1.CalledScreenApplicationId = null;
            this.sewadarListLookup1.CalledScreenTypeName = null;
            this.sewadarListLookup1.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.sewadarListLookup1, 3);
            this.sewadarListLookup1.DisplayText = "";
            this.sewadarListLookup1.DisplayTextBindingKey = null;
            this.sewadarListLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarListLookup1.EditingControlDataGridView = null;
            this.sewadarListLookup1.EditingControlFormattedValue = null;
            this.sewadarListLookup1.EditingControlRowIndex = 0;
            this.sewadarListLookup1.EditingControlValueChanged = true;
            this.sewadarListLookup1.EnableToolTip = false;
            this.sewadarListLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewadarListLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewadarListLookup1.IdText = "";
            this.sewadarListLookup1.IdTextBindingKey = null;
            this.sewadarListLookup1.Location = new System.Drawing.Point(335, 238);
            this.sewadarListLookup1.Lookup = true;
            this.sewadarListLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadarListLookup1.LookupResult = null;
            this.sewadarListLookup1.LookupTitle = "Sewadar List";
            this.sewadarListLookup1.Mandatory = false;
            this.sewadarListLookup1.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.sewadarListLookup1.MaxCharacterLength = 32767;
            this.sewadarListLookup1.MaximumSize = new System.Drawing.Size(1300, 46);
            this.sewadarListLookup1.MinCharactersForQuery = 0;
            this.sewadarListLookup1.MinimumSize = new System.Drawing.Size(11, 22);
            this.sewadarListLookup1.Name = "sewadarListLookup1";
            this.sewadarListLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewadarListLookup1.PascalCase = false;
            this.sewadarListLookup1.RangeInQueryMode = false;
            this.sewadarListLookup1.ReadOnly = false;
            this.sewadarListLookup1.RegularExpressionValidator = null;
            this.sewadarListLookup1.Size = new System.Drawing.Size(547, 46);
            this.sewadarListLookup1.TabIndex = 43;
            this.sewadarListLookup1.Title = "Sewadar List";
            this.sewadarListLookup1.ToolTipLookupField = "information";
            this.sewadarListLookup1.ValueText = "";
            this.sewadarListLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewadarListLookup1_LookupDialogShowing);
            // 
            // ImportSewadarList
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1221, 711);
            this.Controls.Add(this.tlpBase);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "ImportSewadarList";
            this.Text = "Export Sewadars";
            this.tlpBase.ResumeLayout(false);
            this.tlpBase.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtExcelLoc;
        private System.Windows.Forms.Button btnExcelLoc;
        private UMB.CDF.UIControls.DCCLabel lblForSatsangCentre;
        private UMB.CDF.UIControls.DCCLabel lblSatsangCentre;
        private Controls.ZSMLookups.SewadarListLookup sewadarListLookup1;

    }
}