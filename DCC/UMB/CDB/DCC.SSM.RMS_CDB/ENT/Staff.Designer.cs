namespace DCC.UMB.CDB2.ENT
{
    partial class Staff
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            this.tlpStaff = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.grdStaff = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.btnStaff = new System.Windows.Forms.Button();
            this.personId = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.name = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.gender = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.age = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.desig = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.swdType = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.status = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.StatusDate = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.tlpStaff.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdStaff)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpStaff
            // 
            this.tlpStaff.ColumnCount = 2;
            this.tlpStaff.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 87.01299F));
            this.tlpStaff.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.98701F));
            this.tlpStaff.Controls.Add(this.grdStaff, 0, 2);
            this.tlpStaff.Controls.Add(this.btnStaff, 1, 0);
            this.tlpStaff.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpStaff.Location = new System.Drawing.Point(0, 0);
            this.tlpStaff.Name = "tlpStaff";
            this.tlpStaff.RowCount = 3;
            this.tlpStaff.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.487923F));
            this.tlpStaff.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 1.5625F));
            this.tlpStaff.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 91.06281F));
            this.tlpStaff.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpStaff.Size = new System.Drawing.Size(944, 513);
            this.tlpStaff.TabIndex = 2;
            // 
            // grdStaff
            // 
            this.grdStaff.AllowRowSorting = false;
            this.grdStaff.AllowUserToAddRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdStaff.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdStaff.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdStaff.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.personId,
            this.name,
            this.gender,
            this.age,
            this.desig,
            this.swdType,
            this.status,
            this.StatusDate});
            this.tlpStaff.SetColumnSpan(this.grdStaff, 2);
            this.grdStaff.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdStaff.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdStaff.Location = new System.Drawing.Point(3, 49);
            this.grdStaff.Mandatory = false;
            this.grdStaff.Mode = DCC.UMB.CDF.Configuration.UIModes.None;
            this.grdStaff.Name = "grdStaff";
            this.grdStaff.ReadOnly = true;
            this.grdStaff.RowHeadersWidth = 15;
            this.grdStaff.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdStaff.Size = new System.Drawing.Size(938, 461);
            this.grdStaff.TabIndex = 4;
            this.grdStaff.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdStaff.VirtualMode = true;
            // 
            // btnStaff
            // 
            this.btnStaff.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnStaff.Location = new System.Drawing.Point(824, 3);
            this.btnStaff.Name = "btnStaff";
            this.btnStaff.Size = new System.Drawing.Size(117, 32);
            this.btnStaff.TabIndex = 2;
            this.btnStaff.Text = "All Level Staff";
            this.btnStaff.UseVisualStyleBackColor = true;
            this.btnStaff.Click += new System.EventHandler(this.btnStaff_Click);
            // 
            // personId
            // 
            this.personId.BindingKey = "person_id";
            this.personId.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.personId.HeaderText = "ID No.";
            this.personId.Lookup = false;
            this.personId.LookupColumns = "";
            this.personId.Mandatory = false;
            this.personId.MaxValue = ((long)(9223372036854775807));
            this.personId.MinValue = ((long)(-9223372036854775808));
            this.personId.Name = "personId";
            this.personId.PercentageWidth = 5;
            this.personId.ReadOnly = true;
            this.personId.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.personId.Width = 46;
            // 
            // name
            // 
            this.name.BindingKey = "person_nm";
            this.name.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.name.DefaultCellStyle = dataGridViewCellStyle2;
            this.name.HeaderText = "Name";
            this.name.Lookup = false;
            this.name.LookupColumns = "";
            this.name.Mandatory = false;
            this.name.MaxCharacterLength = 2147483647;
            this.name.Name = "name";
            this.name.PercentageWidth = 24;
            this.name.ReadOnly = true;
            this.name.RegularExpressionValidator = "";
            this.name.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.name.Width = 221;
            // 
            // gender
            // 
            this.gender.BindingKey = "person_gender";
            this.gender.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.gender.DefaultCellStyle = dataGridViewCellStyle3;
            this.gender.HeaderText = "Gender";
            this.gender.Lookup = false;
            this.gender.LookupColumns = "";
            this.gender.Mandatory = false;
            this.gender.MaxCharacterLength = 2147483647;
            this.gender.Name = "gender";
            this.gender.PercentageWidth = 7;
            this.gender.ReadOnly = true;
            this.gender.RegularExpressionValidator = "";
            this.gender.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gender.Width = 64;
            // 
            // age
            // 
            this.age.BindingKey = "age";
            this.age.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.age.HeaderText = "Age";
            this.age.Lookup = false;
            this.age.LookupColumns = "";
            this.age.Mandatory = false;
            this.age.MaxValue = ((long)(9223372036854775807));
            this.age.MinValue = ((long)(-9223372036854775808));
            this.age.Name = "age";
            this.age.PercentageWidth = 8;
            this.age.ReadOnly = true;
            this.age.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.age.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.age.Width = 73;
            // 
            // desig
            // 
            this.desig.BindingKey = "designation_nm";
            this.desig.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.desig.HeaderText = "Designation";
            this.desig.Lookup = false;
            this.desig.LookupColumns = "";
            this.desig.Mandatory = false;
            this.desig.MaxCharacterLength = 2147483647;
            this.desig.Name = "desig";
            this.desig.PercentageWidth = 14;
            this.desig.ReadOnly = true;
            this.desig.RegularExpressionValidator = "";
            this.desig.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.desig.Width = 129;
            // 
            // swdType
            // 
            this.swdType.BindingKey = "sewadartype_nm";
            this.swdType.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.swdType.DefaultCellStyle = dataGridViewCellStyle4;
            this.swdType.HeaderText = "Sewadar Type";
            this.swdType.Lookup = false;
            this.swdType.LookupColumns = "";
            this.swdType.Mandatory = false;
            this.swdType.MaxCharacterLength = 2147483647;
            this.swdType.Name = "swdType";
            this.swdType.PercentageWidth = 14;
            this.swdType.ReadOnly = true;
            this.swdType.RegularExpressionValidator = "";
            this.swdType.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.swdType.Width = 129;
            // 
            // status
            // 
            this.status.BindingKey = "person_status_nm";
            this.status.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.status.HeaderText = "Status";
            this.status.Lookup = false;
            this.status.LookupColumns = "";
            this.status.Mandatory = false;
            this.status.MaxCharacterLength = 2147483647;
            this.status.Name = "status";
            this.status.PercentageWidth = 15;
            this.status.ReadOnly = true;
            this.status.RegularExpressionValidator = "";
            this.status.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.status.Width = 138;
            // 
            // StatusDate
            // 
            this.StatusDate.BindingKey = "status_dt";
            this.StatusDate.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.StatusDate.DefaultCellStyle = dataGridViewCellStyle5;
            this.StatusDate.HeaderText = "Status Date";
            this.StatusDate.Lookup = false;
            this.StatusDate.LookupColumns = "";
            this.StatusDate.Mandatory = false;
            this.StatusDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.StatusDate.MinValue = new System.DateTime(((long)(0)));
            this.StatusDate.Name = "StatusDate";
            this.StatusDate.PercentageWidth = 13;
            this.StatusDate.ReadOnly = true;
            this.StatusDate.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.StatusDate.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.StatusDate.Width = 119;
            // 
            // Staff
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(944, 513);
            this.Controls.Add(this.tlpStaff);
            this.Name = "Staff";
            this.Text = "Staff";
            this.tlpStaff.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdStaff)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpStaff;
        private System.Windows.Forms.Button btnStaff;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdStaff;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn personId;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn name;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gender;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn age;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn desig;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn swdType;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn status;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn StatusDate;
    }
}