namespace DCC.ZOS.ZSM.ENT
{
    partial class CopyCreditSpecifications
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
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnOK = new System.Windows.Forms.Button();
            this.txtNewCreditSpecificationName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpBase.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 5;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tlpBase.Controls.Add(this.btnCancel, 2, 2);
            this.tlpBase.Controls.Add(this.btnOK, 1, 2);
            this.tlpBase.Controls.Add(this.txtNewCreditSpecificationName, 1, 1);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 4;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.Size = new System.Drawing.Size(739, 242);
            this.tlpBase.TabIndex = 3;
            // 
            // btnCancel
            // 
            this.btnCancel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnCancel.Location = new System.Drawing.Point(372, 143);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(94, 24);
            this.btnCancel.TabIndex = 0;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnOK
            // 
            this.btnOK.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnOK.Location = new System.Drawing.Point(272, 143);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(94, 24);
            this.btnOK.TabIndex = 1;
            this.btnOK.Text = "Copy";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // txtNewCreditSpecificationName
            // 
            this.txtNewCreditSpecificationName.AllowsNew = false;
            this.txtNewCreditSpecificationName.AllowsReference = false;
            this.txtNewCreditSpecificationName.AllowsUpdate = false;
            this.txtNewCreditSpecificationName.ApplicationIdForDbConnection = null;
            this.txtNewCreditSpecificationName.BackColor = System.Drawing.Color.Transparent;
            this.txtNewCreditSpecificationName.CalledScreenApplicationId = null;
            this.txtNewCreditSpecificationName.CalledScreenTypeName = null;
            this.txtNewCreditSpecificationName.CallingScreenType = null;
            this.tlpBase.SetColumnSpan(this.txtNewCreditSpecificationName, 2);
            this.txtNewCreditSpecificationName.DisplayText = "";
            this.txtNewCreditSpecificationName.DisplayTextBindingKey = null;
            this.txtNewCreditSpecificationName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtNewCreditSpecificationName.EditingControlDataGridView = null;
            this.txtNewCreditSpecificationName.EditingControlFormattedValue = "";
            this.txtNewCreditSpecificationName.EditingControlRowIndex = 0;
            this.txtNewCreditSpecificationName.EditingControlValueChanged = false;
            this.txtNewCreditSpecificationName.EnableToolTip = false;
            this.txtNewCreditSpecificationName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNewCreditSpecificationName.IdText = null;
            this.txtNewCreditSpecificationName.IdTextBindingKey = null;
            this.txtNewCreditSpecificationName.Location = new System.Drawing.Point(273, 73);
            this.txtNewCreditSpecificationName.Lookup = false;
            this.txtNewCreditSpecificationName.LookupColumns = null;
            this.txtNewCreditSpecificationName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtNewCreditSpecificationName.LookupResult = null;
            this.txtNewCreditSpecificationName.LookupTitle = "New Credit Specification Name";
            this.txtNewCreditSpecificationName.Mandatory = false;
            this.txtNewCreditSpecificationName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtNewCreditSpecificationName.MaxCharacterLength = 32767;
            this.txtNewCreditSpecificationName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtNewCreditSpecificationName.MinCharactersForQuery = 0;
            this.txtNewCreditSpecificationName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtNewCreditSpecificationName.Name = "txtNewCreditSpecificationName";
            this.txtNewCreditSpecificationName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtNewCreditSpecificationName.PascalCase = false;
            this.txtNewCreditSpecificationName.RangeInQueryMode = false;
            this.txtNewCreditSpecificationName.ReadOnly = false;
            this.txtNewCreditSpecificationName.RegularExpressionValidator = null;
            this.txtNewCreditSpecificationName.Size = new System.Drawing.Size(192, 45);
            this.txtNewCreditSpecificationName.TabIndex = 5;
            this.txtNewCreditSpecificationName.Title = "New Credit Specification Name";
            this.txtNewCreditSpecificationName.ToolTipLookupField = "information";
            this.txtNewCreditSpecificationName.ValueText = null;
            // 
            // CopyCreditSpecifications
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(739, 242);
            this.Controls.Add(this.tlpBase);
            this.Name = "CopyCreditSpecifications";
            this.Text = "Copy Credit Specifications";
            this.tlpBase.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnOK;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtNewCreditSpecificationName;

    }
}