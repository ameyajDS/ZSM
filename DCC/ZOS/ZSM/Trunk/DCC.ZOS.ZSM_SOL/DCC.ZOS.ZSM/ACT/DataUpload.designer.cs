namespace DCC.ZOS.ZSM.ACT
{
    partial class DataUpload
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DataUpload));
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtExcelLoc = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.btnExcelLoc = new System.Windows.Forms.Button();
            this.zsmSatsangCentresLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.ZSMSatsangCentresLookup();
            this.ErrorCommentsView = new System.Windows.Forms.DataGridView();
            this.lblError = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.tlpBase.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ErrorCommentsView)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 5;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.17985F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.53712F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 21.94323F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.06565F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.17726F));
            this.tlpBase.Controls.Add(this.txtExcelLoc, 1, 3);
            this.tlpBase.Controls.Add(this.btnExcelLoc, 3, 3);
            this.tlpBase.Controls.Add(this.zsmSatsangCentresLookup1, 2, 2);
            this.tlpBase.Controls.Add(this.ErrorCommentsView, 1, 5);
            this.tlpBase.Controls.Add(this.lblError, 1, 4);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 10;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.910695F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5.00035F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.439446F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.89965F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 6.148282F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 27.8481F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.797568F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.002764F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.310489F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.00067F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.Size = new System.Drawing.Size(916, 578);
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
            this.txtExcelLoc.Location = new System.Drawing.Point(253, 126);
            this.txtExcelLoc.Lookup = false;
            this.txtExcelLoc.LookupColumns = null;
            this.txtExcelLoc.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtExcelLoc.LookupResult = null;
            this.txtExcelLoc.LookupTitle = "Excel Location";
            this.txtExcelLoc.Mandatory = true;
            this.txtExcelLoc.Margin = new System.Windows.Forms.Padding(4, 3, 0, 3);
            this.txtExcelLoc.MaxCharacterLength = 32767;
            this.txtExcelLoc.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtExcelLoc.MinCharactersForQuery = 0;
            this.txtExcelLoc.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtExcelLoc.Name = "txtExcelLoc";
            this.txtExcelLoc.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtExcelLoc.PascalCase = false;
            this.txtExcelLoc.RangeInQueryMode = false;
            this.txtExcelLoc.ReadOnly = true;
            this.txtExcelLoc.RegularExpressionValidator = null;
            this.txtExcelLoc.Size = new System.Drawing.Size(413, 45);
            this.txtExcelLoc.TabIndex = 6;
            this.txtExcelLoc.TabStop = false;
            this.txtExcelLoc.Title = "Excel Location";
            this.txtExcelLoc.ToolTipLookupField = "information";
            this.txtExcelLoc.ValueText = null;
            // 
            // btnExcelLoc
            // 
            this.btnExcelLoc.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnExcelLoc.Image = ((System.Drawing.Image)(resources.GetObject("btnExcelLoc.Image")));
            this.btnExcelLoc.Location = new System.Drawing.Point(666, 143);
            this.btnExcelLoc.Margin = new System.Windows.Forms.Padding(0, 20, 4, 3);
            this.btnExcelLoc.MaximumSize = new System.Drawing.Size(25, 25);
            this.btnExcelLoc.Name = "btnExcelLoc";
            this.btnExcelLoc.Size = new System.Drawing.Size(25, 25);
            this.btnExcelLoc.TabIndex = 7;
            this.btnExcelLoc.UseVisualStyleBackColor = true;
            this.btnExcelLoc.Click += new System.EventHandler(this.btnExcelLoc_Click);
            // 
            // zsmSatsangCentresLookup1
            // 
            this.zsmSatsangCentresLookup1.AllowsNew = false;
            this.zsmSatsangCentresLookup1.AllowsReference = false;
            this.zsmSatsangCentresLookup1.AllowsUpdate = false;
            this.zsmSatsangCentresLookup1.ApplicationIdForDbConnection = null;
            this.zsmSatsangCentresLookup1.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.zsmSatsangCentresLookup1.BackColor = System.Drawing.Color.Transparent;
            this.zsmSatsangCentresLookup1.CalledScreenApplicationId = null;
            this.zsmSatsangCentresLookup1.CalledScreenTypeName = null;
            this.zsmSatsangCentresLookup1.CallingScreenType = null;
            this.zsmSatsangCentresLookup1.DisplayText = "";
            this.zsmSatsangCentresLookup1.DisplayTextBindingKey = null;
            this.zsmSatsangCentresLookup1.EditingControlDataGridView = null;
            this.zsmSatsangCentresLookup1.EditingControlFormattedValue = null;
            this.zsmSatsangCentresLookup1.EditingControlRowIndex = 0;
            this.zsmSatsangCentresLookup1.EditingControlValueChanged = true;
            this.zsmSatsangCentresLookup1.EnableToolTip = false;
            this.zsmSatsangCentresLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.zsmSatsangCentresLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.zsmSatsangCentresLookup1.IdText = "";
            this.zsmSatsangCentresLookup1.IdTextBindingKey = null;
            this.zsmSatsangCentresLookup1.Location = new System.Drawing.Point(377, 85);
            this.zsmSatsangCentresLookup1.Lookup = true;
            this.zsmSatsangCentresLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.zsmSatsangCentresLookup1.LookupResult = null;
            this.zsmSatsangCentresLookup1.LookupTitle = "Satsang Centre";
            this.zsmSatsangCentresLookup1.Mandatory = false;
            this.zsmSatsangCentresLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.zsmSatsangCentresLookup1.MaxCharacterLength = 32767;
            this.zsmSatsangCentresLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.zsmSatsangCentresLookup1.MinCharactersForQuery = 0;
            this.zsmSatsangCentresLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.zsmSatsangCentresLookup1.Name = "zsmSatsangCentresLookup1";
            this.zsmSatsangCentresLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.zsmSatsangCentresLookup1.PascalCase = false;
            this.zsmSatsangCentresLookup1.RangeInQueryMode = false;
            this.zsmSatsangCentresLookup1.ReadOnly = false;
            this.zsmSatsangCentresLookup1.RegularExpressionValidator = null;
            this.zsmSatsangCentresLookup1.ShowNonMainCentres = true;
            this.zsmSatsangCentresLookup1.Size = new System.Drawing.Size(156, 35);
            this.zsmSatsangCentresLookup1.TabIndex = 42;
            this.zsmSatsangCentresLookup1.Title = "Satsang Centre";
            this.zsmSatsangCentresLookup1.ToolTipLookupField = "information";
            this.zsmSatsangCentresLookup1.ValueText = "";
            // 
            // ErrorCommentsView
            // 
            this.ErrorCommentsView.AllowUserToAddRows = false;
            this.ErrorCommentsView.AllowUserToDeleteRows = false;
            this.ErrorCommentsView.AllowUserToOrderColumns = true;
            this.ErrorCommentsView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.tlpBase.SetColumnSpan(this.ErrorCommentsView, 4);
            this.ErrorCommentsView.Location = new System.Drawing.Point(252, 220);
            this.ErrorCommentsView.Name = "ErrorCommentsView";
            this.ErrorCommentsView.ReadOnly = true;
            this.tlpBase.SetRowSpan(this.ErrorCommentsView, 6);
            this.ErrorCommentsView.Size = new System.Drawing.Size(537, 291);
            this.ErrorCommentsView.TabIndex = 43;
            // 
            // lblError
            // 
            this.lblError.AutoSize = true;
            this.lblError.BackColor = System.Drawing.Color.Transparent;
            this.tlpBase.SetColumnSpan(this.lblError, 3);
            this.lblError.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblError.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblError.Location = new System.Drawing.Point(252, 183);
            this.lblError.Name = "lblError";
            this.lblError.Size = new System.Drawing.Size(0, 14);
            this.lblError.TabIndex = 44;
            // 
            // DataUpload
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(916, 578);
            this.Controls.Add(this.tlpBase);
            this.Name = "DataUpload";
            this.Text = "Data Upload";
            this.tlpBase.ResumeLayout(false);
            this.tlpBase.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ErrorCommentsView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtExcelLoc;
        private System.Windows.Forms.Button btnExcelLoc;
        private Controls.ZSMLookups.ZSMSatsangCentresLookup zsmSatsangCentresLookup1;
        private System.Windows.Forms.DataGridView ErrorCommentsView;
        private UMB.CDF.UIControls.DCCLabel lblError;

    }
}