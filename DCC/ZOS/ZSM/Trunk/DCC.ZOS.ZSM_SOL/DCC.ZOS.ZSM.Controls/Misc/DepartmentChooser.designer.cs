namespace DCC.ZOS.ZSM.Controls.Misc
{
    partial class DepartmentChooser
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DepartmentChooser));
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.lkpSubDepartment = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.lkpDepartment = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 2;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Controls.Add(this.lkpSubDepartment, 1, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.lkpDepartment, 0, 0);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 1;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 55F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(628, 55);
            this.dccTableLayoutPanel1.TabIndex = 2;
            // 
            // lkpSubDepartment
            // 
            this.lkpSubDepartment.AllowsNew = false;
            this.lkpSubDepartment.AllowsReference = false;
            this.lkpSubDepartment.AllowsUpdate = false;
            this.lkpSubDepartment.ApplicationIdForDbConnection = null;
            this.lkpSubDepartment.BackColor = System.Drawing.Color.Transparent;
            this.lkpSubDepartment.CalledScreenApplicationId = null;
            this.lkpSubDepartment.CalledScreenTypeName = null;
            this.lkpSubDepartment.CallingScreenType = null;
            this.lkpSubDepartment.DisplayText = "";
            this.lkpSubDepartment.DisplayTextBindingKey = "sub_department_nm";
            this.lkpSubDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpSubDepartment.EditingControlDataGridView = null;
            this.lkpSubDepartment.EditingControlFormattedValue = null;
            this.lkpSubDepartment.EditingControlRowIndex = 0;
            this.lkpSubDepartment.EditingControlValueChanged = false;
            this.lkpSubDepartment.EnableToolTip = false;
            this.lkpSubDepartment.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpSubDepartment.IdText = null;
            this.lkpSubDepartment.IdTextBindingKey = "sub_department_id";
            this.lkpSubDepartment.Location = new System.Drawing.Point(319, 4);
            this.lkpSubDepartment.Lookup = true;
            this.lkpSubDepartment.LookupColumns = resources.GetString("lkpSubDepartment.LookupColumns");
            this.lkpSubDepartment.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpSubDepartment.LookupResult = null;
            this.lkpSubDepartment.Mandatory = false;
            this.lkpSubDepartment.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lkpSubDepartment.MaxCharacterLength = 32767;
            this.lkpSubDepartment.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lkpSubDepartment.MinCharactersForQuery = 0;
            this.lkpSubDepartment.MinimumSize = new System.Drawing.Size(13, 27);
            this.lkpSubDepartment.Name = "lkpSubDepartment";
            this.lkpSubDepartment.Padding = new System.Windows.Forms.Padding(0, 21, 19, 0);
            this.lkpSubDepartment.PascalCase = false;
            this.lkpSubDepartment.RangeInQueryMode = false;
            this.lkpSubDepartment.ReadOnly = false;
            this.lkpSubDepartment.RegularExpressionValidator = null;
            this.lkpSubDepartment.Size = new System.Drawing.Size(304, 47);
            this.lkpSubDepartment.TabIndex = 1;
            this.lkpSubDepartment.Title = "Sub-Department";
            this.lkpSubDepartment.ToolTipLookupField = "information";
            this.lkpSubDepartment.ValueText = null;
            this.lkpSubDepartment.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lkpSubDepartment_LookupDialogShowing);
            // 
            // lkpDepartment
            // 
            this.lkpDepartment.AllowsNew = false;
            this.lkpDepartment.AllowsReference = false;
            this.lkpDepartment.AllowsUpdate = false;
            this.lkpDepartment.ApplicationIdForDbConnection = null;
            this.lkpDepartment.BackColor = System.Drawing.Color.Transparent;
            this.lkpDepartment.CalledScreenApplicationId = null;
            this.lkpDepartment.CalledScreenTypeName = null;
            this.lkpDepartment.CallingScreenType = null;
            this.lkpDepartment.DisplayText = "";
            this.lkpDepartment.DisplayTextBindingKey = "department_nm";
            this.lkpDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpDepartment.EditingControlDataGridView = null;
            this.lkpDepartment.EditingControlFormattedValue = null;
            this.lkpDepartment.EditingControlRowIndex = 0;
            this.lkpDepartment.EditingControlValueChanged = false;
            this.lkpDepartment.EnableToolTip = false;
            this.lkpDepartment.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpDepartment.IdText = null;
            this.lkpDepartment.IdTextBindingKey = "department_id";
            this.lkpDepartment.Location = new System.Drawing.Point(5, 4);
            this.lkpDepartment.Lookup = true;
            this.lkpDepartment.LookupColumns = resources.GetString("lkpDepartment.LookupColumns");
            this.lkpDepartment.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpDepartment.LookupResult = null;
            this.lkpDepartment.Mandatory = false;
            this.lkpDepartment.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lkpDepartment.MaxCharacterLength = 32767;
            this.lkpDepartment.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lkpDepartment.MinCharactersForQuery = 0;
            this.lkpDepartment.MinimumSize = new System.Drawing.Size(13, 27);
            this.lkpDepartment.Name = "lkpDepartment";
            this.lkpDepartment.Padding = new System.Windows.Forms.Padding(0, 21, 19, 0);
            this.lkpDepartment.PascalCase = false;
            this.lkpDepartment.RangeInQueryMode = false;
            this.lkpDepartment.ReadOnly = false;
            this.lkpDepartment.RegularExpressionValidator = null;
            this.lkpDepartment.Size = new System.Drawing.Size(304, 47);
            this.lkpDepartment.TabIndex = 0;
            this.lkpDepartment.Title = "Department";
            this.lkpDepartment.ToolTipLookupField = "information";
            this.lkpDepartment.ValueText = null;
            this.lkpDepartment.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lkpDepartment_LookupDialogShowing);
            this.lkpDepartment.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.lkpDepartment_LookupResultSet);
            // 
            // DepartmentChooser
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dccTableLayoutPanel1);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "DepartmentChooser";
            this.Size = new System.Drawing.Size(628, 55);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField lkpSubDepartment;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField lkpDepartment;
    }
}
