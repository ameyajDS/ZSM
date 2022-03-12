namespace DCC.ZOS.ZSM.MSC
{
    partial class CreateTeamUsingSewadarListAndSewa
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
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewadarListLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup();
            this.lstDepartment = new DCC.ZOS.ZSM.Controls.Lists.DepartmentListBox();
            this.lblSewa = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 3;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 34.9711F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 65.0289F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 171F));
            this.dccTableLayoutPanel1.Controls.Add(this.sewadarListLookup1, 1, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.lstDepartment, 1, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.lblSewa, 1, 0);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Margin = new System.Windows.Forms.Padding(2);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 4;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 36.15819F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 19.76285F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 44.26878F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 96F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(509, 363);
            this.dccTableLayoutPanel1.TabIndex = 0;
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
            this.sewadarListLookup1.Location = new System.Drawing.Point(122, 99);
            this.sewadarListLookup1.Lookup = true;
            this.sewadarListLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadarListLookup1.LookupResult = null;
            this.sewadarListLookup1.LookupTitle = "Sewadar List";
            this.sewadarListLookup1.Mandatory = false;
            this.sewadarListLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewadarListLookup1.MaxCharacterLength = 32767;
            this.sewadarListLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewadarListLookup1.MinCharactersForQuery = 0;
            this.sewadarListLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewadarListLookup1.Name = "sewadarListLookup1";
            this.sewadarListLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewadarListLookup1.PascalCase = false;
            this.sewadarListLookup1.RangeInQueryMode = false;
            this.sewadarListLookup1.ReadOnly = false;
            this.sewadarListLookup1.RegularExpressionValidator = null;
            this.sewadarListLookup1.Size = new System.Drawing.Size(211, 45);
            this.sewadarListLookup1.TabIndex = 1;
            this.sewadarListLookup1.Title = "Sewadar List";
            this.sewadarListLookup1.ToolTipLookupField = "information";
            this.sewadarListLookup1.ValueText = "";
            // 
            // lstDepartment
            // 
            this.lstDepartment.ApplicationIdForDbConnection = null;
            this.lstDepartment.BackColor = System.Drawing.Color.Transparent;
            this.lstDepartment.CalledScreenApplicationId = null;
            this.lstDepartment.CalledScreenTypeName = null;
            this.lstDepartment.CallingScreenType = null;
            this.lstDepartment.DisplayTextBindingKey = null;
            this.lstDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstDepartment.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstDepartment.IdTextBindingKey = "departments_ids_xml";
            this.lstDepartment.Location = new System.Drawing.Point(122, 151);
            this.lstDepartment.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.lstDepartment.Mandatory = false;
            this.lstDepartment.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.lstDepartment.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.lstDepartment.MinimumSize = new System.Drawing.Size(10, 22);
            this.lstDepartment.Name = "lstDepartment";
            this.lstDepartment.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.lstDepartment.ReadOnly = false;
            this.lstDepartment.Size = new System.Drawing.Size(211, 111);
            this.lstDepartment.TabIndex = 2;
            this.lstDepartment.Title = "Department(s)";
            this.lstDepartment.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.lstDepartment_LookupDialogShowing);
            // 
            // lblSewa
            // 
            this.lblSewa.AutoSize = true;
            this.lblSewa.BackColor = System.Drawing.Color.Transparent;
            this.lblSewa.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lblSewa.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblSewa.Font = new System.Drawing.Font("Verdana", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSewa.ForeColor = System.Drawing.SystemColors.InfoText;
            this.lblSewa.Location = new System.Drawing.Point(121, 78);
            this.lblSewa.Name = "lblSewa";
            this.lblSewa.Size = new System.Drawing.Size(213, 18);
            this.lblSewa.TabIndex = 3;
            // 
            // CreateTeamUsingSewadarListAndSewa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(509, 363);
            this.Controls.Add(this.dccTableLayoutPanel1);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "CreateTeamUsingSewadarListAndSewa";
            this.Text = "Create Sewa Teams Using Sewa & Sewadar List";
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.dccTableLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private Controls.ZSMLookups.SewadarListLookup sewadarListLookup1;
        private Controls.Lists.DepartmentListBox lstDepartment;
        private UMB.CDF.UIControls.DCCLabel lblSewa;
    }
}