namespace DCC.ZOS.ZSM.RPT
{
    partial class GenerateDailyAttendanceReports
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
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.dccLabel1 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.lkpSewa = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.departmentListBox1 = new DCC.ZOS.ZSM.Controls.Lists.DepartmentListBox();
            this.dtStartEndDate = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.txtPath = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.btnPath = new System.Windows.Forms.Button();
            this.btnGenerate = new System.Windows.Forms.Button();
            this.subDepartmentListBox1 = new DCC.ZOS.ZSM.Controls.Lists.SubDepartmentListBox();
            this.chkAttendanceType = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.chkCombined = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.tableLayoutPanel1.SuspendLayout();
            this.flowLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 59.51134F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 40.48866F));
            this.tableLayoutPanel1.Controls.Add(this.dccLabel1, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.lkpSewa, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.departmentListBox1, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.dtStartEndDate, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtPath, 0, 5);
            this.tableLayoutPanel1.Controls.Add(this.btnPath, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.btnGenerate, 0, 6);
            this.tableLayoutPanel1.Controls.Add(this.subDepartmentListBox1, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.flowLayoutPanel1, 1, 4);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 8;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 54F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 46F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(573, 431);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // dccLabel1
            // 
            this.dccLabel1.AutoSize = true;
            this.dccLabel1.BackColor = System.Drawing.Color.Transparent;
            this.tableLayoutPanel1.SetColumnSpan(this.dccLabel1, 2);
            this.dccLabel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel1.Location = new System.Drawing.Point(3, 0);
            this.dccLabel1.Name = "dccLabel1";
            this.dccLabel1.Padding = new System.Windows.Forms.Padding(10);
            this.dccLabel1.Size = new System.Drawing.Size(567, 50);
            this.dccLabel1.TabIndex = 0;
            this.dccLabel1.Text = "Export Daily Attendance Report";
            this.dccLabel1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lkpSewa
            // 
            this.lkpSewa.AllowsNew = false;
            this.lkpSewa.AllowsReference = false;
            this.lkpSewa.AllowsUpdate = false;
            this.lkpSewa.ApplicationIdForDbConnection = null;
            this.lkpSewa.BackColor = System.Drawing.Color.Transparent;
            this.lkpSewa.CalledScreenApplicationId = null;
            this.lkpSewa.CalledScreenTypeName = null;
            this.lkpSewa.CallingScreenType = null;
            this.lkpSewa.DisplayText = "";
            this.lkpSewa.DisplayTextBindingKey = null;
            this.lkpSewa.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpSewa.EditingControlDataGridView = null;
            this.lkpSewa.EditingControlFormattedValue = null;
            this.lkpSewa.EditingControlRowIndex = 0;
            this.lkpSewa.EditingControlValueChanged = true;
            this.lkpSewa.EnableToolTip = false;
            this.lkpSewa.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lkpSewa.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpSewa.IdText = "";
            this.lkpSewa.IdTextBindingKey = null;
            this.lkpSewa.Location = new System.Drawing.Point(4, 53);
            this.lkpSewa.Lookup = true;
            this.lkpSewa.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpSewa.LookupResult = null;
            this.lkpSewa.LookupTitle = "Sewa";
            this.lkpSewa.Mandatory = false;
            this.lkpSewa.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.lkpSewa.MaxCharacterLength = 32767;
            this.lkpSewa.MaximumSize = new System.Drawing.Size(1300, 45);
            this.lkpSewa.MinCharactersForQuery = 0;
            this.lkpSewa.MinimumSize = new System.Drawing.Size(10, 22);
            this.lkpSewa.Name = "lkpSewa";
            this.lkpSewa.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lkpSewa.PascalCase = false;
            this.lkpSewa.RangeInQueryMode = false;
            this.lkpSewa.ReadOnly = false;
            this.lkpSewa.RegularExpressionValidator = null;
            this.lkpSewa.Size = new System.Drawing.Size(332, 44);
            this.lkpSewa.TabIndex = 1;
            this.lkpSewa.Title = "Sewa";
            this.lkpSewa.ToolTipLookupField = "information";
            this.lkpSewa.ValueText = "";
            this.lkpSewa.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookup1_LookupDialogShowing);
            this.lkpSewa.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.lkpSewa_LookupResultSet);
            // 
            // departmentListBox1
            // 
            this.departmentListBox1.ApplicationIdForDbConnection = null;
            this.departmentListBox1.BackColor = System.Drawing.Color.Transparent;
            this.departmentListBox1.CalledScreenApplicationId = null;
            this.departmentListBox1.CalledScreenTypeName = null;
            this.departmentListBox1.CallingScreenType = null;
            this.departmentListBox1.DisplayTextBindingKey = null;
            this.departmentListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.departmentListBox1.IdTextBindingKey = "departments_ids_xml";
            this.departmentListBox1.Location = new System.Drawing.Point(5, 105);
            this.departmentListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.departmentListBox1.Mandatory = false;
            this.departmentListBox1.Margin = new System.Windows.Forms.Padding(5);
            this.departmentListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.departmentListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.departmentListBox1.Name = "departmentListBox1";
            this.departmentListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.departmentListBox1.ReadOnly = false;
            this.tableLayoutPanel1.SetRowSpan(this.departmentListBox1, 2);
            this.departmentListBox1.Size = new System.Drawing.Size(330, 90);
            this.departmentListBox1.TabIndex = 2;
            this.departmentListBox1.Title = "Department(s)";
            this.departmentListBox1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.departmentListBox1_LookupDialogShowing);
            // 
            // dtStartEndDate
            // 
            this.dtStartEndDate.DiscreteInQueryMode = false;
            this.dtStartEndDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtStartEndDate.FillDefailtValuesInInsertMode = false;
            this.dtStartEndDate.FromDate = null;
            this.dtStartEndDate.FromDateFieldBindingKey = "effective_from_dt";
            this.dtStartEndDate.FromDateMandatory = true;
            this.dtStartEndDate.FromDateTitle = "From Date";
            this.dtStartEndDate.Location = new System.Drawing.Point(3, 203);
            this.dtStartEndDate.Mandatory = true;
            this.dtStartEndDate.Name = "dtStartEndDate";
            this.dtStartEndDate.ReadOnly = false;
            this.dtStartEndDate.Size = new System.Drawing.Size(334, 48);
            this.dtStartEndDate.TabIndex = 3;
            this.dtStartEndDate.TitleInQueryMode = null;
            this.dtStartEndDate.ToDate = null;
            this.dtStartEndDate.ToDateFieldBindingKey = "effective_till_dt";
            this.dtStartEndDate.ToDateMandatory = true;
            this.dtStartEndDate.ToDateTitle = "To Date";
            // 
            // txtPath
            // 
            this.txtPath.AllowsNew = false;
            this.txtPath.AllowsReference = false;
            this.txtPath.AllowsUpdate = false;
            this.txtPath.ApplicationIdForDbConnection = null;
            this.txtPath.BackColor = System.Drawing.Color.Transparent;
            this.txtPath.CalledScreenApplicationId = null;
            this.txtPath.CalledScreenTypeName = null;
            this.txtPath.CallingScreenType = null;
            this.txtPath.DisplayText = "";
            this.txtPath.DisplayTextBindingKey = null;
            this.txtPath.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPath.EditingControlDataGridView = null;
            this.txtPath.EditingControlFormattedValue = "";
            this.txtPath.EditingControlRowIndex = 0;
            this.txtPath.EditingControlValueChanged = false;
            this.txtPath.Enabled = false;
            this.txtPath.EnableToolTip = false;
            this.txtPath.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPath.IdText = null;
            this.txtPath.IdTextBindingKey = null;
            this.txtPath.Location = new System.Drawing.Point(4, 257);
            this.txtPath.Lookup = false;
            this.txtPath.LookupColumns = null;
            this.txtPath.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtPath.LookupResult = null;
            this.txtPath.LookupTitle = "Export Path";
            this.txtPath.Mandatory = true;
            this.txtPath.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtPath.MaxCharacterLength = 32767;
            this.txtPath.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtPath.MinCharactersForQuery = 0;
            this.txtPath.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtPath.Name = "txtPath";
            this.txtPath.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtPath.PascalCase = false;
            this.txtPath.RangeInQueryMode = false;
            this.txtPath.ReadOnly = false;
            this.txtPath.RegularExpressionValidator = null;
            this.txtPath.Size = new System.Drawing.Size(332, 40);
            this.txtPath.TabIndex = 4;
            this.txtPath.Title = "Export Path:";
            this.txtPath.ToolTipLookupField = "information";
            this.txtPath.ValueText = null;
            // 
            // btnPath
            // 
            this.btnPath.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.btnPath.Location = new System.Drawing.Point(340, 269);
            this.btnPath.Margin = new System.Windows.Forms.Padding(0, 15, 5, 15);
            this.btnPath.Name = "btnPath";
            this.btnPath.Size = new System.Drawing.Size(28, 16);
            this.btnPath.TabIndex = 5;
            this.btnPath.Text = "...";
            this.btnPath.UseVisualStyleBackColor = true;
            this.btnPath.Click += new System.EventHandler(this.btnPath_Click);
            // 
            // btnGenerate
            // 
            this.btnGenerate.Enabled = false;
            this.btnGenerate.Location = new System.Drawing.Point(10, 312);
            this.btnGenerate.Margin = new System.Windows.Forms.Padding(10, 12, 3, 12);
            this.btnGenerate.Name = "btnGenerate";
            this.btnGenerate.Size = new System.Drawing.Size(194, 23);
            this.btnGenerate.TabIndex = 6;
            this.btnGenerate.Text = "Generate And Export Report";
            this.btnGenerate.UseVisualStyleBackColor = true;
            this.btnGenerate.Click += new System.EventHandler(this.btnGenerate_Click);
            // 
            // subDepartmentListBox1
            // 
            this.subDepartmentListBox1.ApplicationIdForDbConnection = null;
            this.subDepartmentListBox1.BackColor = System.Drawing.Color.Transparent;
            this.subDepartmentListBox1.CalledScreenApplicationId = null;
            this.subDepartmentListBox1.CalledScreenTypeName = null;
            this.subDepartmentListBox1.CallingScreenType = null;
            this.subDepartmentListBox1.DisplayTextBindingKey = null;
            this.subDepartmentListBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.subDepartmentListBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.subDepartmentListBox1.IdTextBindingKey = "sub_departments_ids_xml";
            this.subDepartmentListBox1.Location = new System.Drawing.Point(345, 105);
            this.subDepartmentListBox1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Large;
            this.subDepartmentListBox1.Mandatory = false;
            this.subDepartmentListBox1.Margin = new System.Windows.Forms.Padding(5);
            this.subDepartmentListBox1.MaximumSize = new System.Drawing.Size(2000, 2000);
            this.subDepartmentListBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.subDepartmentListBox1.Name = "subDepartmentListBox1";
            this.subDepartmentListBox1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.subDepartmentListBox1.ReadOnly = false;
            this.tableLayoutPanel1.SetRowSpan(this.subDepartmentListBox1, 2);
            this.subDepartmentListBox1.Size = new System.Drawing.Size(223, 90);
            this.subDepartmentListBox1.TabIndex = 7;
            this.subDepartmentListBox1.Title = "Sub Department(s)";
            this.subDepartmentListBox1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.subDepartmentListBox1_LookupDialogShowing);
            // 
            // chkAttendanceType
            // 
            this.chkAttendanceType.AutoSize = true;
            this.chkAttendanceType.BackColor = System.Drawing.Color.Transparent;
            this.chkAttendanceType.BindingKey = null;
            this.chkAttendanceType.Font = new System.Drawing.Font("Verdana", 9.75F);
            this.chkAttendanceType.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkAttendanceType.Location = new System.Drawing.Point(3, 3);
            this.chkAttendanceType.Name = "chkAttendanceType";
            this.chkAttendanceType.Size = new System.Drawing.Size(107, 20);
            this.chkAttendanceType.TabIndex = 8;
            this.chkAttendanceType.Text = "Absent Only";
            this.chkAttendanceType.UseVisualStyleBackColor = false;
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.Controls.Add(this.chkAttendanceType);
            this.flowLayoutPanel1.Controls.Add(this.chkCombined);
            this.flowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel1.Location = new System.Drawing.Point(343, 203);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(227, 48);
            this.flowLayoutPanel1.TabIndex = 9;
            // 
            // chkCombined
            // 
            this.chkCombined.AutoSize = true;
            this.chkCombined.BackColor = System.Drawing.Color.Transparent;
            this.chkCombined.BindingKey = null;
            this.chkCombined.Font = new System.Drawing.Font("Verdana", 9.75F);
            this.chkCombined.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkCombined.Location = new System.Drawing.Point(3, 29);
            this.chkCombined.Name = "chkCombined";
            this.chkCombined.Size = new System.Drawing.Size(138, 20);
            this.chkCombined.TabIndex = 9;
            this.chkCombined.Text = "Combined Report";
            this.chkCombined.UseVisualStyleBackColor = false;
            // 
            // GenerateDailyAttendanceReports
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(573, 431);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "GenerateDailyAttendanceReports";
            this.Text = "GenerateDailyAttendanceReports";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.flowLayoutPanel1.ResumeLayout(false);
            this.flowLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private UMB.CDF.UIControls.DCCLabel dccLabel1;
        private Controls.ZSMLookups.SewaLookup lkpSewa;
        private Controls.Lists.DepartmentListBox departmentListBox1;
        private UMB.CDF.UIControls.TextControls.DateRangePair dtStartEndDate;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtPath;
        private System.Windows.Forms.Button btnPath;
        private System.Windows.Forms.Button btnGenerate;
        private Controls.Lists.SubDepartmentListBox subDepartmentListBox1;
        private UMB.CDF.UIControls.DCCCheckBox chkAttendanceType;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private UMB.CDF.UIControls.DCCCheckBox chkCombined;
    }
}