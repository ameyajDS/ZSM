namespace DCC.ZOS.ZSM.ACT
{
    partial class DepartmentTransfers
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle16 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle17 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle18 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle19 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle20 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle21 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle22 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle23 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle24 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle25 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DepartmentTransfers));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle26 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle27 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle28 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle29 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpTopMost = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccTLPMiddle = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.departmentChooserOld = new DCC.ZOS.ZSM.Controls.Misc.DepartmentChooser();
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpSewadar = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dtmSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.txtSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.cmbGender = new DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo();
            this.sewadarIDLookup = new DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarIDLookup();
            this.txtGRNo = new DCC.ZOS.ZSM.Controls.ZSMLookups.GRNoLookup();
            this.txtSewadarName = new DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarLookup();
            this.dtDepartment = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtSatsangName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.cmbSatsangCentreType = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.intSatsangId = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtSatsangCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dccTLPBottom = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextArea();
            this.departmentChooserNew = new DCC.ZOS.ZSM.Controls.Misc.DepartmentChooser();
            this.object_52331939_253c_4436_b530_89ac40efcef1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccTableLayoutPanel2 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dtEffectiveDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_department_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.old_sub_department_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.department_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.sub_department_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_sub_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sub_department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.effective_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.sewadar_status_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.sewadar_status_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.gender = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.department_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.dccTextField1 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dccGrid1 = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.dccTextFieldGridColumn1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.dccTextFieldGridColumn2 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.dccDateGridColumn1 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn2 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn3 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccDateGridColumn4 = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpTopMost.SuspendLayout();
            this.dccTLPMiddle.SuspendLayout();
            this.departmentChooserOld.SuspendLayout();
            this.tlpSewadar.SuspendLayout();
            this.tlpTop.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.dccTLPBottom.SuspendLayout();
            this.departmentChooserNew.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.tableLayoutPanel2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).BeginInit();
            this.SuspendLayout();
            // 
            // scListOrBrowse
            // 
            this.scListOrBrowse.Dock = System.Windows.Forms.DockStyle.Fill;
            this.scListOrBrowse.Location = new System.Drawing.Point(0, 0);
            this.scListOrBrowse.Name = "scListOrBrowse";
            // 
            // scListOrBrowse.Panel1
            // 
            this.scListOrBrowse.Panel1.Controls.Add(this.tlpTopMost);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Size = new System.Drawing.Size(968, 538);
            this.scListOrBrowse.SplitterDistance = 938;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tlpTopMost
            // 
            this.tlpTopMost.ColumnCount = 6;
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 35F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tlpTopMost.Controls.Add(this.dccTLPMiddle, 0, 1);
            this.tlpTopMost.Controls.Add(this.tlpTop, 0, 0);
            this.tlpTopMost.Controls.Add(this.groupBox2, 0, 3);
            this.tlpTopMost.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTopMost.Location = new System.Drawing.Point(0, 0);
            this.tlpTopMost.Name = "tlpTopMost";
            this.tlpTopMost.RowCount = 6;
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.89591F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.07435F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 2.788104F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 23.60595F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 1.486989F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 40.89219F));
            this.tlpTopMost.Size = new System.Drawing.Size(938, 538);
            this.tlpTopMost.TabIndex = 0;
            this.tlpTopMost.TabStop = true;
            // 
            // dccTLPMiddle
            // 
            this.dccTLPMiddle.ColumnCount = 4;
            this.tlpTopMost.SetColumnSpan(this.dccTLPMiddle, 6);
            this.dccTLPMiddle.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.47709F));
            this.dccTLPMiddle.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 36.38814F));
            this.dccTLPMiddle.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTLPMiddle.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25.32189F));
            this.dccTLPMiddle.Controls.Add(this.departmentChooserOld, 0, 1);
            this.dccTLPMiddle.Controls.Add(this.tlpSewadar, 0, 0);
            this.dccTLPMiddle.Controls.Add(this.dtDepartment, 3, 1);
            this.dccTLPMiddle.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTLPMiddle.Location = new System.Drawing.Point(3, 66);
            this.dccTLPMiddle.Name = "dccTLPMiddle";
            this.dccTLPMiddle.RowCount = 2;
            this.dccTLPMiddle.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.92593F));
            this.dccTLPMiddle.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 49.07407F));
            this.dccTLPMiddle.Size = new System.Drawing.Size(932, 101);
            this.dccTLPMiddle.TabIndex = 0;
            this.dccTLPMiddle.TabStop = true;
            // 
            // departmentChooserOld
            // 
            this.dccTLPMiddle.SetColumnSpan(this.departmentChooserOld, 3);
            this.departmentChooserOld.Controls.Add(this.object_98cece24_9e6d_4b2d_91c6_55654649579c);
            this.departmentChooserOld.DepartmentBindingKey = "old_department_nm";
            this.departmentChooserOld.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentChooserOld.Location = new System.Drawing.Point(3, 54);
            this.departmentChooserOld.Manadatory = false;
            this.departmentChooserOld.Name = "departmentChooserOld";
            this.departmentChooserOld.ReadOnly = true;
            this.departmentChooserOld.SatsangCentreId = null;
            this.departmentChooserOld.SelectedDepartment = null;
            this.departmentChooserOld.SelectedDepartmentName = "";
            this.departmentChooserOld.SelectedSubDepartment = null;
            this.departmentChooserOld.SelectedSubDepartmentName = "";
            this.departmentChooserOld.Size = new System.Drawing.Size(689, 44);
            this.departmentChooserOld.SubDepartmentBindingKey = "old_sub_department_nm";
            this.departmentChooserOld.TabIndex = 55;
            this.departmentChooserOld.TabStop = false;
            // 
            // object_98cece24_9e6d_4b2d_91c6_55654649579c
            // 
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.ColumnCount = 2;
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.Dock = System.Windows.Forms.DockStyle.Fill;
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.Location = new System.Drawing.Point(0, 0);
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.Name = "object_98cece24_9e6d_4b2d_91c6_55654649579c";
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.RowCount = 1;
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.Size = new System.Drawing.Size(689, 44);
            this.object_98cece24_9e6d_4b2d_91c6_55654649579c.TabIndex = 2;
            // 
            // tlpSewadar
            // 
            this.tlpSewadar.ColumnCount = 6;
            this.dccTLPMiddle.SetColumnSpan(this.tlpSewadar, 4);
            this.tlpSewadar.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 21.66497F));
            this.tlpSewadar.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 59.08347F));
            this.tlpSewadar.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 19.3126F));
            this.tlpSewadar.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 78F));
            this.tlpSewadar.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 104F));
            this.tlpSewadar.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 138F));
            this.tlpSewadar.Controls.Add(this.dtmSewadarStatus, 5, 0);
            this.tlpSewadar.Controls.Add(this.txtSewadarStatus, 4, 0);
            this.tlpSewadar.Controls.Add(this.cmbGender, 3, 0);
            this.tlpSewadar.Controls.Add(this.sewadarIDLookup, 2, 0);
            this.tlpSewadar.Controls.Add(this.txtGRNo, 0, 0);
            this.tlpSewadar.Controls.Add(this.txtSewadarName, 1, 0);
            this.tlpSewadar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpSewadar.Location = new System.Drawing.Point(3, 3);
            this.tlpSewadar.Name = "tlpSewadar";
            this.tlpSewadar.RowCount = 1;
            this.tlpSewadar.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpSewadar.Size = new System.Drawing.Size(926, 45);
            this.tlpSewadar.TabIndex = 85;
            // 
            // dtmSewadarStatus
            // 
            this.dtmSewadarStatus.AllowsNew = false;
            this.dtmSewadarStatus.AllowsReference = false;
            this.dtmSewadarStatus.AllowsUpdate = false;
            this.dtmSewadarStatus.ApplicationIdForDbConnection = null;
            this.dtmSewadarStatus.BackColor = System.Drawing.Color.Transparent;
            this.dtmSewadarStatus.CalledScreenApplicationId = null;
            this.dtmSewadarStatus.CalledScreenTypeName = null;
            this.dtmSewadarStatus.CallingScreenType = null;
            this.dtmSewadarStatus.DisplayText = null;
            this.dtmSewadarStatus.DisplayTextAsDateTime = null;
            this.dtmSewadarStatus.DisplayTextBindingKey = "sewadar_status_dtm";
            this.dtmSewadarStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmSewadarStatus.EditingControlDataGridView = null;
            this.dtmSewadarStatus.EditingControlFormattedValue = null;
            this.dtmSewadarStatus.EditingControlRowIndex = 0;
            this.dtmSewadarStatus.EditingControlValueChanged = false;
            this.dtmSewadarStatus.EnableToolTip = false;
            this.dtmSewadarStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtmSewadarStatus.IdText = "";
            this.dtmSewadarStatus.IdTextBindingKey = null;
            this.dtmSewadarStatus.Location = new System.Drawing.Point(790, 3);
            this.dtmSewadarStatus.Lookup = true;
            this.dtmSewadarStatus.LookupColumns = null;
            this.dtmSewadarStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtmSewadarStatus.LookupResult = null;
            this.dtmSewadarStatus.Mandatory = false;
            this.dtmSewadarStatus.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtmSewadarStatus.MaxCharacterLength = 11;
            this.dtmSewadarStatus.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtmSewadarStatus.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtmSewadarStatus.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtmSewadarStatus.MinValue = new System.DateTime(((long)(0)));
            this.dtmSewadarStatus.Name = "dtmSewadarStatus";
            this.dtmSewadarStatus.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtmSewadarStatus.PascalCase = false;
            this.dtmSewadarStatus.RangeInQueryMode = true;
            this.dtmSewadarStatus.ReadOnly = true;
            this.dtmSewadarStatus.RegularExpressionValidator = null;
            this.dtmSewadarStatus.ShowTime = false;
            this.dtmSewadarStatus.Size = new System.Drawing.Size(132, 39);
            this.dtmSewadarStatus.TabIndex = 53;
            this.dtmSewadarStatus.TabStop = false;
            this.dtmSewadarStatus.Title = "Status Date";
            this.dtmSewadarStatus.ToolTipLookupField = "information";
            this.dtmSewadarStatus.ValueText = "";
            // 
            // txtSewadarStatus
            // 
            this.txtSewadarStatus.AllowsNew = false;
            this.txtSewadarStatus.AllowsReference = false;
            this.txtSewadarStatus.AllowsUpdate = false;
            this.txtSewadarStatus.ApplicationIdForDbConnection = null;
            this.txtSewadarStatus.BackColor = System.Drawing.Color.Transparent;
            this.txtSewadarStatus.CalledScreenApplicationId = null;
            this.txtSewadarStatus.CalledScreenTypeName = null;
            this.txtSewadarStatus.CallingScreenType = null;
            this.txtSewadarStatus.DisplayText = "";
            this.txtSewadarStatus.DisplayTextBindingKey = "sewadar_status_nm";
            this.txtSewadarStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSewadarStatus.EditingControlDataGridView = null;
            this.txtSewadarStatus.EditingControlFormattedValue = "";
            this.txtSewadarStatus.EditingControlRowIndex = 0;
            this.txtSewadarStatus.EditingControlValueChanged = false;
            this.txtSewadarStatus.EnableToolTip = false;
            this.txtSewadarStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSewadarStatus.IdText = null;
            this.txtSewadarStatus.IdTextBindingKey = null;
            this.txtSewadarStatus.Location = new System.Drawing.Point(686, 3);
            this.txtSewadarStatus.Lookup = false;
            this.txtSewadarStatus.LookupColumns = null;
            this.txtSewadarStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSewadarStatus.LookupResult = null;
            this.txtSewadarStatus.Mandatory = false;
            this.txtSewadarStatus.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSewadarStatus.MaxCharacterLength = 32767;
            this.txtSewadarStatus.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSewadarStatus.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSewadarStatus.Name = "txtSewadarStatus";
            this.txtSewadarStatus.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSewadarStatus.PascalCase = false;
            this.txtSewadarStatus.RangeInQueryMode = false;
            this.txtSewadarStatus.ReadOnly = true;
            this.txtSewadarStatus.RegularExpressionValidator = null;
            this.txtSewadarStatus.Size = new System.Drawing.Size(96, 39);
            this.txtSewadarStatus.TabIndex = 52;
            this.txtSewadarStatus.TabStop = false;
            this.txtSewadarStatus.Title = "Status";
            this.txtSewadarStatus.ToolTipLookupField = "information";
            this.txtSewadarStatus.ValueText = null;
            // 
            // cmbGender
            // 
            this.cmbGender.ApplicationIdForDbConnection = null;
            this.cmbGender.BackColor = System.Drawing.Color.Transparent;
            this.cmbGender.DisplayText = ".......";
            this.cmbGender.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbGender.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbGender.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbGender.Location = new System.Drawing.Point(608, 3);
            this.cmbGender.Mandatory = false;
            this.cmbGender.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbGender.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbGender.MinimumSize = new System.Drawing.Size(10, 22);
            this.cmbGender.Name = "cmbGender";
            this.cmbGender.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbGender.ReadOnly = true;
            this.cmbGender.SelectedIndex = 0;
            this.cmbGender.SelectedText = ".......";
            this.cmbGender.SelectedValue = null;
            this.cmbGender.SelectedValueBindingKey = "gender";
            this.cmbGender.Size = new System.Drawing.Size(70, 39);
            this.cmbGender.TabIndex = 51;
            this.cmbGender.TabStop = false;
            this.cmbGender.Title = "Gender";
            this.cmbGender.ValueText = null;
            // 
            // sewadarIDLookup
            // 
            this.sewadarIDLookup.AllowsNew = false;
            this.sewadarIDLookup.AllowsReference = false;
            this.sewadarIDLookup.AllowsUpdate = false;
            this.sewadarIDLookup.ApplicationIdForDbConnection = null;
            this.sewadarIDLookup.BackColor = System.Drawing.Color.Transparent;
            this.sewadarIDLookup.CalledScreenApplicationId = null;
            this.sewadarIDLookup.CalledScreenTypeName = null;
            this.sewadarIDLookup.CallingScreenType = null;
            this.sewadarIDLookup.DisplayText = "";
            this.sewadarIDLookup.DisplayTextBindingKey = "sewadar_id";
            this.sewadarIDLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarIDLookup.EditingControlDataGridView = null;
            this.sewadarIDLookup.EditingControlFormattedValue = null;
            this.sewadarIDLookup.EditingControlRowIndex = 0;
            this.sewadarIDLookup.EditingControlValueChanged = true;
            this.sewadarIDLookup.EnableToolTip = false;
            this.sewadarIDLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewadarIDLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewadarIDLookup.IdText = null;
            this.sewadarIDLookup.IdTextBindingKey = "sewadar_id";
            this.sewadarIDLookup.Location = new System.Drawing.Point(492, 3);
            this.sewadarIDLookup.Lookup = true;
            this.sewadarIDLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.sewadarIDLookup.LookupResult = null;
            this.sewadarIDLookup.Mandatory = false;
            this.sewadarIDLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewadarIDLookup.MaxCharacterLength = 32767;
            this.sewadarIDLookup.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewadarIDLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewadarIDLookup.Name = "sewadarIDLookup";
            this.sewadarIDLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewadarIDLookup.PascalCase = false;
            this.sewadarIDLookup.RangeInQueryMode = false;
            this.sewadarIDLookup.ReadOnly = false;
            this.sewadarIDLookup.RegularExpressionValidator = null;
            this.sewadarIDLookup.Size = new System.Drawing.Size(108, 39);
            this.sewadarIDLookup.TabIndex = 26;
            this.sewadarIDLookup.Title = "Sewadar ID";
            this.sewadarIDLookup.ToolTipLookupField = "information";
            this.sewadarIDLookup.ValueText = null;
            this.sewadarIDLookup.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewadarIDLookup_LookupDialogShowing);
            this.sewadarIDLookup.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.sewadarIDLookup_LookupResultSet);
            // 
            // txtGRNo
            // 
            this.txtGRNo.AllowsNew = false;
            this.txtGRNo.AllowsReference = false;
            this.txtGRNo.AllowsUpdate = false;
            this.txtGRNo.ApplicationIdForDbConnection = null;
            this.txtGRNo.BackColor = System.Drawing.Color.Transparent;
            this.txtGRNo.CalledScreenApplicationId = null;
            this.txtGRNo.CalledScreenTypeName = null;
            this.txtGRNo.CallingScreenType = null;
            this.txtGRNo.DisplayText = "";
            this.txtGRNo.DisplayTextBindingKey = "sewadar_grno";
            this.txtGRNo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtGRNo.EditingControlDataGridView = null;
            this.txtGRNo.EditingControlFormattedValue = null;
            this.txtGRNo.EditingControlRowIndex = 0;
            this.txtGRNo.EditingControlValueChanged = true;
            this.txtGRNo.EnableToolTip = false;
            this.txtGRNo.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.txtGRNo.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGRNo.IdText = null;
            this.txtGRNo.IdTextBindingKey = "sewadar_id";
            this.txtGRNo.Location = new System.Drawing.Point(4, 3);
            this.txtGRNo.Lookup = true;
            this.txtGRNo.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.txtGRNo.LookupResult = null;
            this.txtGRNo.Mandatory = false;
            this.txtGRNo.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtGRNo.MaxCharacterLength = 32767;
            this.txtGRNo.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtGRNo.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtGRNo.Name = "txtGRNo";
            this.txtGRNo.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtGRNo.PascalCase = false;
            this.txtGRNo.RangeInQueryMode = false;
            this.txtGRNo.ReadOnly = false;
            this.txtGRNo.RegularExpressionValidator = null;
            this.txtGRNo.Size = new System.Drawing.Size(123, 39);
            this.txtGRNo.TabIndex = 25;
            this.txtGRNo.Title = "GR No.";
            this.txtGRNo.ToolTipLookupField = "information";
            this.txtGRNo.ValueText = null;
            this.txtGRNo.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.txtGRNo_LookupDialogShowing);
            this.txtGRNo.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.txtGRNo_LookupResultSet);
            // 
            // txtSewadarName
            // 
            this.txtSewadarName.AllowsNew = false;
            this.txtSewadarName.AllowsReference = false;
            this.txtSewadarName.AllowsUpdate = false;
            this.txtSewadarName.ApplicationIdForDbConnection = null;
            this.txtSewadarName.BackColor = System.Drawing.Color.Transparent;
            this.txtSewadarName.CalledScreenApplicationId = null;
            this.txtSewadarName.CalledScreenTypeName = null;
            this.txtSewadarName.CallingScreenType = null;
            this.txtSewadarName.DisplayText = "";
            this.txtSewadarName.DisplayTextBindingKey = "full_nm";
            this.txtSewadarName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSewadarName.EditingControlDataGridView = null;
            this.txtSewadarName.EditingControlFormattedValue = null;
            this.txtSewadarName.EditingControlRowIndex = 0;
            this.txtSewadarName.EditingControlValueChanged = true;
            this.txtSewadarName.EnableToolTip = false;
            this.txtSewadarName.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.txtSewadarName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSewadarName.IdText = null;
            this.txtSewadarName.IdTextBindingKey = "sewadar_id";
            this.txtSewadarName.Location = new System.Drawing.Point(135, 3);
            this.txtSewadarName.Lookup = true;
            this.txtSewadarName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.txtSewadarName.LookupResult = null;
            this.txtSewadarName.Mandatory = true;
            this.txtSewadarName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSewadarName.MaxCharacterLength = 32767;
            this.txtSewadarName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSewadarName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSewadarName.Name = "txtSewadarName";
            this.txtSewadarName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtSewadarName.PascalCase = false;
            this.txtSewadarName.RangeInQueryMode = false;
            this.txtSewadarName.ReadOnly = false;
            this.txtSewadarName.RegularExpressionValidator = null;
            this.txtSewadarName.Size = new System.Drawing.Size(349, 39);
            this.txtSewadarName.TabIndex = 27;
            this.txtSewadarName.Title = "Name";
            this.txtSewadarName.ToolTipLookupField = "information";
            this.txtSewadarName.ValueText = null;
            this.txtSewadarName.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.txtSewadarName_LookupDialogShowing);
            this.txtSewadarName.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.txtSewadarName_LookupResultSet);
            // 
            // dtDepartment
            // 
            this.dtDepartment.AllowsNew = false;
            this.dtDepartment.AllowsReference = false;
            this.dtDepartment.AllowsUpdate = false;
            this.dtDepartment.ApplicationIdForDbConnection = null;
            this.dtDepartment.BackColor = System.Drawing.Color.Transparent;
            this.dtDepartment.CalledScreenApplicationId = null;
            this.dtDepartment.CalledScreenTypeName = null;
            this.dtDepartment.CallingScreenType = null;
            this.dtDepartment.DisplayText = null;
            this.dtDepartment.DisplayTextAsDateTime = null;
            this.dtDepartment.DisplayTextBindingKey = "department_dt";
            this.dtDepartment.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtDepartment.EditingControlDataGridView = null;
            this.dtDepartment.EditingControlFormattedValue = null;
            this.dtDepartment.EditingControlRowIndex = 0;
            this.dtDepartment.EditingControlValueChanged = false;
            this.dtDepartment.EnableToolTip = false;
            this.dtDepartment.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtDepartment.IdText = "";
            this.dtDepartment.IdTextBindingKey = null;
            this.dtDepartment.Location = new System.Drawing.Point(699, 54);
            this.dtDepartment.Lookup = true;
            this.dtDepartment.LookupColumns = null;
            this.dtDepartment.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtDepartment.LookupResult = null;
            this.dtDepartment.Mandatory = false;
            this.dtDepartment.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtDepartment.MaxCharacterLength = 11;
            this.dtDepartment.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtDepartment.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtDepartment.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtDepartment.MinValue = new System.DateTime(((long)(0)));
            this.dtDepartment.Name = "dtDepartment";
            this.dtDepartment.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtDepartment.PascalCase = false;
            this.dtDepartment.RangeInQueryMode = false;
            this.dtDepartment.ReadOnly = true;
            this.dtDepartment.RegularExpressionValidator = null;
            this.dtDepartment.ShowTime = false;
            this.dtDepartment.Size = new System.Drawing.Size(229, 44);
            this.dtDepartment.TabIndex = 86;
            this.dtDepartment.TabStop = false;
            this.dtDepartment.Title = "Dept. Date";
            this.dtDepartment.ToolTipLookupField = "information";
            this.dtDepartment.ValueText = "";
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 4;
            this.tlpTopMost.SetColumnSpan(this.tlpTop, 6);
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15.38461F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15.25424F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 44.19817F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.Controls.Add(this.txtSatsangName, 2, 0);
            this.tlpTop.Controls.Add(this.cmbSatsangCentreType, 4, 0);
            this.tlpTop.Controls.Add(this.intSatsangId, 0, 0);
            this.tlpTop.Controls.Add(this.txtSatsangCode, 1, 0);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(3, 3);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 1;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 57F));
            this.tlpTop.Size = new System.Drawing.Size(932, 57);
            this.tlpTop.TabIndex = 2;
            // 
            // txtSatsangName
            // 
            this.txtSatsangName.AllowsNew = false;
            this.txtSatsangName.AllowsReference = false;
            this.txtSatsangName.AllowsUpdate = false;
            this.txtSatsangName.ApplicationIdForDbConnection = null;
            this.txtSatsangName.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangName.CalledScreenApplicationId = null;
            this.txtSatsangName.CalledScreenTypeName = null;
            this.txtSatsangName.CallingScreenType = null;
            this.txtSatsangName.DisplayText = "";
            this.txtSatsangName.DisplayTextBindingKey = "centre_nm";
            this.txtSatsangName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangName.EditingControlDataGridView = null;
            this.txtSatsangName.EditingControlFormattedValue = "";
            this.txtSatsangName.EditingControlRowIndex = 0;
            this.txtSatsangName.EditingControlValueChanged = false;
            this.txtSatsangName.EnableToolTip = false;
            this.txtSatsangName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangName.IdText = null;
            this.txtSatsangName.IdTextBindingKey = null;
            this.txtSatsangName.Location = new System.Drawing.Point(289, 3);
            this.txtSatsangName.Lookup = false;
            this.txtSatsangName.LookupColumns = null;
            this.txtSatsangName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangName.LookupResult = null;
            this.txtSatsangName.Mandatory = false;
            this.txtSatsangName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSatsangName.MaxCharacterLength = 32767;
            this.txtSatsangName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSatsangName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSatsangName.Name = "txtSatsangName";
            this.txtSatsangName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangName.PascalCase = false;
            this.txtSatsangName.RangeInQueryMode = false;
            this.txtSatsangName.ReadOnly = true;
            this.txtSatsangName.RegularExpressionValidator = null;
            this.txtSatsangName.Size = new System.Drawing.Size(404, 45);
            this.txtSatsangName.TabIndex = 8;
            this.txtSatsangName.TabStop = false;
            this.txtSatsangName.Title = "Satsang Centre";
            this.txtSatsangName.ToolTipLookupField = "information";
            this.txtSatsangName.ValueText = null;
            // 
            // cmbSatsangCentreType
            // 
            this.cmbSatsangCentreType.ApplicationIdForDbConnection = null;
            this.cmbSatsangCentreType.BackColor = System.Drawing.Color.Transparent;
            this.cmbSatsangCentreType.DisplayText = "";
            this.cmbSatsangCentreType.Dock = System.Windows.Forms.DockStyle.Top;
            this.cmbSatsangCentreType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSatsangCentreType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSatsangCentreType.Location = new System.Drawing.Point(701, 3);
            this.cmbSatsangCentreType.Mandatory = false;
            this.cmbSatsangCentreType.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbSatsangCentreType.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbSatsangCentreType.MinimumSize = new System.Drawing.Size(10, 22);
            this.cmbSatsangCentreType.Name = "cmbSatsangCentreType";
            this.cmbSatsangCentreType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbSatsangCentreType.ReadOnly = true;
            this.cmbSatsangCentreType.SelectedIndex = -1;
            this.cmbSatsangCentreType.SelectedItem = null;
            this.cmbSatsangCentreType.SelectedText = "";
            this.cmbSatsangCentreType.SelectedValue = null;
            this.cmbSatsangCentreType.SelectedValueBindingKey = "satsang_centre_type";
            this.cmbSatsangCentreType.Size = new System.Drawing.Size(227, 38);
            this.cmbSatsangCentreType.TabIndex = 5;
            this.cmbSatsangCentreType.TabStop = false;
            this.cmbSatsangCentreType.Title = "Type";
            this.cmbSatsangCentreType.ValueText = null;
            // 
            // intSatsangId
            // 
            this.intSatsangId.AllowsNew = false;
            this.intSatsangId.AllowsReference = false;
            this.intSatsangId.AllowsUpdate = false;
            this.intSatsangId.ApplicationIdForDbConnection = null;
            this.intSatsangId.BackColor = System.Drawing.Color.Transparent;
            this.intSatsangId.CalledScreenApplicationId = null;
            this.intSatsangId.CalledScreenTypeName = null;
            this.intSatsangId.CallingScreenType = null;
            this.intSatsangId.DisplayText = "";
            this.intSatsangId.DisplayTextBindingKey = "satsang_centre_id";
            this.intSatsangId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intSatsangId.EditingControlDataGridView = null;
            this.intSatsangId.EditingControlFormattedValue = "";
            this.intSatsangId.EditingControlRowIndex = 0;
            this.intSatsangId.EditingControlValueChanged = false;
            this.intSatsangId.EnableToolTip = false;
            this.intSatsangId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSatsangId.IdText = null;
            this.intSatsangId.IdTextBindingKey = null;
            this.intSatsangId.Location = new System.Drawing.Point(4, 3);
            this.intSatsangId.Lookup = false;
            this.intSatsangId.LookupColumns = null;
            this.intSatsangId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intSatsangId.LookupResult = null;
            this.intSatsangId.Mandatory = false;
            this.intSatsangId.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intSatsangId.MaxCharacterLength = 32767;
            this.intSatsangId.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intSatsangId.MaxValue = ((long)(9223372036854775807));
            this.intSatsangId.MinimumSize = new System.Drawing.Size(10, 22);
            this.intSatsangId.MinValue = ((long)(-9223372036854775808));
            this.intSatsangId.Name = "intSatsangId";
            this.intSatsangId.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intSatsangId.PascalCase = false;
            this.intSatsangId.RangeInQueryMode = false;
            this.intSatsangId.ReadOnly = true;
            this.intSatsangId.RegularExpressionValidator = null;
            this.intSatsangId.Size = new System.Drawing.Size(135, 45);
            this.intSatsangId.TabIndex = 6;
            this.intSatsangId.TabStop = false;
            this.intSatsangId.Title = "Id";
            this.intSatsangId.ToolTipLookupField = "information";
            this.intSatsangId.ValueText = null;
            // 
            // txtSatsangCode
            // 
            this.txtSatsangCode.AllowsNew = false;
            this.txtSatsangCode.AllowsReference = false;
            this.txtSatsangCode.AllowsUpdate = false;
            this.txtSatsangCode.ApplicationIdForDbConnection = null;
            this.txtSatsangCode.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangCode.CalledScreenApplicationId = null;
            this.txtSatsangCode.CalledScreenTypeName = null;
            this.txtSatsangCode.CallingScreenType = null;
            this.txtSatsangCode.DisplayText = "";
            this.txtSatsangCode.DisplayTextBindingKey = "centre_cd";
            this.txtSatsangCode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCode.EditingControlDataGridView = null;
            this.txtSatsangCode.EditingControlFormattedValue = "";
            this.txtSatsangCode.EditingControlRowIndex = 0;
            this.txtSatsangCode.EditingControlValueChanged = false;
            this.txtSatsangCode.EnableToolTip = false;
            this.txtSatsangCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCode.IdText = null;
            this.txtSatsangCode.IdTextBindingKey = null;
            this.txtSatsangCode.Location = new System.Drawing.Point(147, 3);
            this.txtSatsangCode.Lookup = false;
            this.txtSatsangCode.LookupColumns = null;
            this.txtSatsangCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCode.LookupResult = null;
            this.txtSatsangCode.Mandatory = false;
            this.txtSatsangCode.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSatsangCode.MaxCharacterLength = 32767;
            this.txtSatsangCode.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSatsangCode.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSatsangCode.Name = "txtSatsangCode";
            this.txtSatsangCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCode.PascalCase = false;
            this.txtSatsangCode.RangeInQueryMode = false;
            this.txtSatsangCode.ReadOnly = true;
            this.txtSatsangCode.RegularExpressionValidator = null;
            this.txtSatsangCode.Size = new System.Drawing.Size(134, 45);
            this.txtSatsangCode.TabIndex = 7;
            this.txtSatsangCode.TabStop = false;
            this.txtSatsangCode.Title = "Code";
            this.txtSatsangCode.ToolTipLookupField = "information";
            this.txtSatsangCode.ValueText = null;
            // 
            // groupBox2
            // 
            this.tlpTopMost.SetColumnSpan(this.groupBox2, 6);
            this.groupBox2.Controls.Add(this.dccTLPBottom);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.ForeColor = System.Drawing.Color.Navy;
            this.groupBox2.Location = new System.Drawing.Point(3, 187);
            this.groupBox2.Name = "groupBox2";
            this.tlpTopMost.SetRowSpan(this.groupBox2, 2);
            this.groupBox2.Size = new System.Drawing.Size(932, 127);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "New Deparment";
            // 
            // dccTLPBottom
            // 
            this.dccTLPBottom.ColumnCount = 4;
            this.dccTLPBottom.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTLPBottom.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTLPBottom.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTLPBottom.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.dccTLPBottom.Controls.Add(this.txtRemarks, 0, 1);
            this.dccTLPBottom.Controls.Add(this.departmentChooserNew, 0, 0);
            this.dccTLPBottom.Controls.Add(this.dtEffectiveDate, 3, 0);
            this.dccTLPBottom.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTLPBottom.Location = new System.Drawing.Point(3, 18);
            this.dccTLPBottom.Name = "dccTLPBottom";
            this.dccTLPBottom.RowCount = 2;
            this.dccTLPBottom.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 51.88679F));
            this.dccTLPBottom.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 48.11321F));
            this.dccTLPBottom.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTLPBottom.Size = new System.Drawing.Size(926, 106);
            this.dccTLPBottom.TabIndex = 0;
            // 
            // txtRemarks
            // 
            this.txtRemarks.AllowsNew = false;
            this.txtRemarks.AllowsReference = false;
            this.txtRemarks.AllowsUpdate = false;
            this.txtRemarks.ApplicationIdForDbConnection = null;
            this.txtRemarks.BackColor = System.Drawing.Color.Transparent;
            this.txtRemarks.CalledScreenApplicationId = null;
            this.txtRemarks.CalledScreenTypeName = null;
            this.txtRemarks.CallingScreenType = null;
            this.dccTLPBottom.SetColumnSpan(this.txtRemarks, 4);
            this.txtRemarks.DisplayText = "";
            this.txtRemarks.DisplayTextBindingKey = "remarks";
            this.txtRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRemarks.EditingControlDataGridView = null;
            this.txtRemarks.EditingControlFormattedValue = "";
            this.txtRemarks.EditingControlRowIndex = 0;
            this.txtRemarks.EditingControlValueChanged = false;
            this.txtRemarks.EnableToolTip = false;
            this.txtRemarks.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRemarks.IdText = null;
            this.txtRemarks.IdTextBindingKey = null;
            this.txtRemarks.Location = new System.Drawing.Point(4, 57);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtRemarks.MaxCharacterLength = 32767;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtRemarks.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.RegularExpressionValidator = null;
            this.txtRemarks.Size = new System.Drawing.Size(918, 45);
            this.txtRemarks.TabIndex = 3;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
            // 
            // departmentChooserNew
            // 
            this.dccTLPBottom.SetColumnSpan(this.departmentChooserNew, 3);
            this.departmentChooserNew.Controls.Add(this.object_52331939_253c_4436_b530_89ac40efcef1);
            this.departmentChooserNew.Controls.Add(this.dccTableLayoutPanel2);
            this.departmentChooserNew.DepartmentBindingKey = "department_nm";
            this.departmentChooserNew.Dock = System.Windows.Forms.DockStyle.Fill;
            this.departmentChooserNew.Location = new System.Drawing.Point(4, 4);
            this.departmentChooserNew.Manadatory = true;
            this.departmentChooserNew.Margin = new System.Windows.Forms.Padding(4);
            this.departmentChooserNew.Name = "departmentChooserNew";
            this.departmentChooserNew.ReadOnly = false;
            this.departmentChooserNew.SatsangCentreId = null;
            this.departmentChooserNew.SelectedDepartment = null;
            this.departmentChooserNew.SelectedDepartmentName = "";
            this.departmentChooserNew.SelectedSubDepartment = null;
            this.departmentChooserNew.SelectedSubDepartmentName = "";
            this.departmentChooserNew.Size = new System.Drawing.Size(685, 46);
            this.departmentChooserNew.SubDepartmentBindingKey = "sub_department_nm";
            this.departmentChooserNew.TabIndex = 1;
            // 
            // object_52331939_253c_4436_b530_89ac40efcef1
            // 
            this.object_52331939_253c_4436_b530_89ac40efcef1.ColumnCount = 2;
            this.object_52331939_253c_4436_b530_89ac40efcef1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.object_52331939_253c_4436_b530_89ac40efcef1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.object_52331939_253c_4436_b530_89ac40efcef1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.object_52331939_253c_4436_b530_89ac40efcef1.Location = new System.Drawing.Point(0, 0);
            this.object_52331939_253c_4436_b530_89ac40efcef1.Margin = new System.Windows.Forms.Padding(0, 32856860, 0, 32856860);
            this.object_52331939_253c_4436_b530_89ac40efcef1.Name = "object_52331939_253c_4436_b530_89ac40efcef1";
            this.object_52331939_253c_4436_b530_89ac40efcef1.RowCount = 1;
            this.object_52331939_253c_4436_b530_89ac40efcef1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.object_52331939_253c_4436_b530_89ac40efcef1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.object_52331939_253c_4436_b530_89ac40efcef1.Size = new System.Drawing.Size(685, 46);
            this.object_52331939_253c_4436_b530_89ac40efcef1.TabIndex = 2;
            // 
            // dccTableLayoutPanel2
            // 
            this.dccTableLayoutPanel2.ColumnCount = 2;
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel2.Margin = new System.Windows.Forms.Padding(0, 32856860, 0, 32856860);
            this.dccTableLayoutPanel2.Name = "dccTableLayoutPanel2";
            this.dccTableLayoutPanel2.RowCount = 1;
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.dccTableLayoutPanel2.Size = new System.Drawing.Size(685, 46);
            this.dccTableLayoutPanel2.TabIndex = 2;
            // 
            // dtEffectiveDate
            // 
            this.dtEffectiveDate.AllowsNew = false;
            this.dtEffectiveDate.AllowsReference = false;
            this.dtEffectiveDate.AllowsUpdate = false;
            this.dtEffectiveDate.ApplicationIdForDbConnection = null;
            this.dtEffectiveDate.BackColor = System.Drawing.Color.Transparent;
            this.dtEffectiveDate.CalledScreenApplicationId = null;
            this.dtEffectiveDate.CalledScreenTypeName = null;
            this.dtEffectiveDate.CallingScreenType = null;
            this.dtEffectiveDate.DisplayText = null;
            this.dtEffectiveDate.DisplayTextAsDateTime = null;
            this.dtEffectiveDate.DisplayTextBindingKey = "effective_dt";
            this.dtEffectiveDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtEffectiveDate.EditingControlDataGridView = null;
            this.dtEffectiveDate.EditingControlFormattedValue = null;
            this.dtEffectiveDate.EditingControlRowIndex = 0;
            this.dtEffectiveDate.EditingControlValueChanged = false;
            this.dtEffectiveDate.EnableToolTip = false;
            this.dtEffectiveDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtEffectiveDate.IdText = "";
            this.dtEffectiveDate.IdTextBindingKey = null;
            this.dtEffectiveDate.Location = new System.Drawing.Point(697, 3);
            this.dtEffectiveDate.Lookup = true;
            this.dtEffectiveDate.LookupColumns = null;
            this.dtEffectiveDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtEffectiveDate.LookupResult = null;
            this.dtEffectiveDate.Mandatory = true;
            this.dtEffectiveDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtEffectiveDate.MaxCharacterLength = 11;
            this.dtEffectiveDate.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtEffectiveDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtEffectiveDate.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtEffectiveDate.MinValue = new System.DateTime(((long)(0)));
            this.dtEffectiveDate.Name = "dtEffectiveDate";
            this.dtEffectiveDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtEffectiveDate.PascalCase = false;
            this.dtEffectiveDate.RangeInQueryMode = true;
            this.dtEffectiveDate.ReadOnly = false;
            this.dtEffectiveDate.RegularExpressionValidator = null;
            this.dtEffectiveDate.ShowTime = false;
            this.dtEffectiveDate.Size = new System.Drawing.Size(225, 45);
            this.dtEffectiveDate.TabIndex = 2;
            this.dtEffectiveDate.Title = "Effective Date";
            this.dtEffectiveDate.ToolTipLookupField = "information";
            this.dtEffectiveDate.ValueText = "";
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle16.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle16.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle16.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle16.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle16.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle16.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle16.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle16;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.satsang_centre_id,
            this.sewadar_id,
            this.sewadar_grno,
            this.full_nm,
            this.old_department_id,
            this.old_sub_department_id,
            this.department_id,
            this.sub_department_id,
            this.remarks,
            this.old_department_nm,
            this.old_sub_department_nm,
            this.department_nm,
            this.sub_department_nm,
            this.txn_ts,
            this.effective_dt,
            this.sewadar_status_dtm,
            this.sewadar_status_nm,
            this.gender,
            this.department_dt});
            this.grdList.DeleteRowMenuEnabled = true;
            this.grdList.DeleteVisible = true;
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdList.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdList.ExportToExcelVisible = true;
            this.grdList.InsertAfterVisible = true;
            this.grdList.InsertBeforeVisible = true;
            this.grdList.InsertLastVisible = true;
            this.grdList.InsertRowsMenuItemsEnabled = true;
            this.grdList.Location = new System.Drawing.Point(0, 0);
            this.grdList.Mandatory = false;
            this.grdList.MoveDownVisible = false;
            this.grdList.MoveUpVisible = false;
            this.grdList.MultiSelect = false;
            this.grdList.Name = "grdList";
            this.grdList.ReadOnly = true;
            this.grdList.RowHeadersWidth = 15;
            this.grdList.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(26, 538);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = "satsang_centre_id";
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle17.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle17;
            this.satsang_centre_id.HeaderText = "Satsang Centre Id";
            this.satsang_centre_id.Lookup = false;
            this.satsang_centre_id.LookupColumns = "";
            this.satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.satsang_centre_id.Mandatory = false;
            this.satsang_centre_id.MaxValue = ((long)(9223372036854775807));
            this.satsang_centre_id.MinValue = ((long)(-9223372036854775808));
            this.satsang_centre_id.Name = "satsang_centre_id";
            this.satsang_centre_id.PercentageWidth = 25;
            this.satsang_centre_id.ReadOnly = true;
            this.satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.satsang_centre_id.ToolTipLookupField = "information";
            this.satsang_centre_id.Visible = false;
            this.satsang_centre_id.Width = 5;
            // 
            // sewadar_id
            // 
            this.sewadar_id.BindingKey = "sewadar_id";
            this.sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle18.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sewadar_id.DefaultCellStyle = dataGridViewCellStyle18;
            this.sewadar_id.HeaderText = "Sewadar Id";
            this.sewadar_id.Lookup = false;
            this.sewadar_id.LookupColumns = "";
            this.sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_id.Mandatory = false;
            this.sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.sewadar_id.Name = "sewadar_id";
            this.sewadar_id.PercentageWidth = 7;
            this.sewadar_id.ReadOnly = true;
            this.sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_id.ToolTipLookupField = "information";
            this.sewadar_id.Width = 5;
            // 
            // sewadar_grno
            // 
            this.sewadar_grno.BindingKey = "sewadar_grno";
            this.sewadar_grno.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_grno.HeaderText = "Sewadar Grno";
            this.sewadar_grno.Lookup = false;
            this.sewadar_grno.LookupColumns = "";
            this.sewadar_grno.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_grno.Mandatory = false;
            this.sewadar_grno.MaxCharacterLength = 2147483647;
            this.sewadar_grno.Name = "sewadar_grno";
            this.sewadar_grno.PercentageWidth = 7;
            this.sewadar_grno.ReadOnly = true;
            this.sewadar_grno.RegularExpressionValidator = "";
            this.sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno.ToolTipLookupField = "information";
            this.sewadar_grno.Width = 5;
            // 
            // full_nm
            // 
            this.full_nm.BindingKey = "full_nm";
            this.full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.full_nm.HeaderText = "Full Name";
            this.full_nm.Lookup = false;
            this.full_nm.LookupColumns = "";
            this.full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.full_nm.Mandatory = false;
            this.full_nm.MaxCharacterLength = 2147483647;
            this.full_nm.Name = "full_nm";
            this.full_nm.PercentageWidth = 22;
            this.full_nm.ReadOnly = true;
            this.full_nm.RegularExpressionValidator = "";
            this.full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.full_nm.ToolTipLookupField = "information";
            this.full_nm.Width = 5;
            // 
            // old_department_id
            // 
            this.old_department_id.BindingKey = "old_department_id";
            this.old_department_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle19.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.old_department_id.DefaultCellStyle = dataGridViewCellStyle19;
            this.old_department_id.HeaderText = "Old Department Id";
            this.old_department_id.Lookup = false;
            this.old_department_id.LookupColumns = "";
            this.old_department_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_department_id.Mandatory = false;
            this.old_department_id.MaxValue = ((long)(9223372036854775807));
            this.old_department_id.MinValue = ((long)(-9223372036854775808));
            this.old_department_id.Name = "old_department_id";
            this.old_department_id.PercentageWidth = 25;
            this.old_department_id.ReadOnly = true;
            this.old_department_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_department_id.ToolTipLookupField = "information";
            this.old_department_id.Visible = false;
            this.old_department_id.Width = 5;
            // 
            // old_sub_department_id
            // 
            this.old_sub_department_id.BindingKey = "old_sub_department_id";
            this.old_sub_department_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle20.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.old_sub_department_id.DefaultCellStyle = dataGridViewCellStyle20;
            this.old_sub_department_id.HeaderText = "Old Sub Department Id";
            this.old_sub_department_id.Lookup = false;
            this.old_sub_department_id.LookupColumns = "";
            this.old_sub_department_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_sub_department_id.Mandatory = false;
            this.old_sub_department_id.MaxValue = ((long)(9223372036854775807));
            this.old_sub_department_id.MinValue = ((long)(-9223372036854775808));
            this.old_sub_department_id.Name = "old_sub_department_id";
            this.old_sub_department_id.PercentageWidth = 25;
            this.old_sub_department_id.ReadOnly = true;
            this.old_sub_department_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_sub_department_id.ToolTipLookupField = "information";
            this.old_sub_department_id.Visible = false;
            this.old_sub_department_id.Width = 5;
            // 
            // department_id
            // 
            this.department_id.BindingKey = "department_id";
            this.department_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle21.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.department_id.DefaultCellStyle = dataGridViewCellStyle21;
            this.department_id.HeaderText = "Department Id";
            this.department_id.Lookup = false;
            this.department_id.LookupColumns = "";
            this.department_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_id.Mandatory = false;
            this.department_id.MaxValue = ((long)(9223372036854775807));
            this.department_id.MinValue = ((long)(-9223372036854775808));
            this.department_id.Name = "department_id";
            this.department_id.PercentageWidth = 25;
            this.department_id.ReadOnly = true;
            this.department_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_id.ToolTipLookupField = "information";
            this.department_id.Visible = false;
            this.department_id.Width = 5;
            // 
            // sub_department_id
            // 
            this.sub_department_id.BindingKey = "sub_department_id";
            this.sub_department_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle22.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.sub_department_id.DefaultCellStyle = dataGridViewCellStyle22;
            this.sub_department_id.HeaderText = "Sub Department Id";
            this.sub_department_id.Lookup = false;
            this.sub_department_id.LookupColumns = "";
            this.sub_department_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sub_department_id.Mandatory = false;
            this.sub_department_id.MaxValue = ((long)(9223372036854775807));
            this.sub_department_id.MinValue = ((long)(-9223372036854775808));
            this.sub_department_id.Name = "sub_department_id";
            this.sub_department_id.PercentageWidth = 25;
            this.sub_department_id.ReadOnly = true;
            this.sub_department_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sub_department_id.ToolTipLookupField = "information";
            this.sub_department_id.Visible = false;
            this.sub_department_id.Width = 5;
            // 
            // remarks
            // 
            this.remarks.BindingKey = "remarks";
            this.remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.remarks.HeaderText = "Remarks";
            this.remarks.Lookup = false;
            this.remarks.LookupColumns = "";
            this.remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.remarks.Mandatory = false;
            this.remarks.MaxCharacterLength = 2147483647;
            this.remarks.Name = "remarks";
            this.remarks.PercentageWidth = 25;
            this.remarks.ReadOnly = true;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Visible = false;
            this.remarks.Width = 5;
            // 
            // old_department_nm
            // 
            this.old_department_nm.BindingKey = "old_department_nm";
            this.old_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.old_department_nm.HeaderText = "Old Department Name";
            this.old_department_nm.Lookup = false;
            this.old_department_nm.LookupColumns = "";
            this.old_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_department_nm.Mandatory = false;
            this.old_department_nm.MaxCharacterLength = 2147483647;
            this.old_department_nm.Name = "old_department_nm";
            this.old_department_nm.PercentageWidth = 15;
            this.old_department_nm.ReadOnly = true;
            this.old_department_nm.RegularExpressionValidator = "";
            this.old_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_department_nm.ToolTipLookupField = "information";
            this.old_department_nm.Width = 5;
            // 
            // old_sub_department_nm
            // 
            this.old_sub_department_nm.BindingKey = "old_sub_department_nm";
            this.old_sub_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.old_sub_department_nm.HeaderText = "Old Sub Department Name";
            this.old_sub_department_nm.Lookup = false;
            this.old_sub_department_nm.LookupColumns = "";
            this.old_sub_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_sub_department_nm.Mandatory = false;
            this.old_sub_department_nm.MaxCharacterLength = 2147483647;
            this.old_sub_department_nm.Name = "old_sub_department_nm";
            this.old_sub_department_nm.PercentageWidth = 12;
            this.old_sub_department_nm.ReadOnly = true;
            this.old_sub_department_nm.RegularExpressionValidator = "";
            this.old_sub_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_sub_department_nm.ToolTipLookupField = "information";
            this.old_sub_department_nm.Width = 5;
            // 
            // department_nm
            // 
            this.department_nm.BindingKey = "department_nm";
            this.department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.department_nm.HeaderText = "Department Name";
            this.department_nm.Lookup = false;
            this.department_nm.LookupColumns = "";
            this.department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_nm.Mandatory = false;
            this.department_nm.MaxCharacterLength = 2147483647;
            this.department_nm.Name = "department_nm";
            this.department_nm.PercentageWidth = 15;
            this.department_nm.ReadOnly = true;
            this.department_nm.RegularExpressionValidator = "";
            this.department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_nm.ToolTipLookupField = "information";
            this.department_nm.Width = 5;
            // 
            // sub_department_nm
            // 
            this.sub_department_nm.BindingKey = "sub_department_nm";
            this.sub_department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sub_department_nm.HeaderText = "Sub Department Name";
            this.sub_department_nm.Lookup = false;
            this.sub_department_nm.LookupColumns = "";
            this.sub_department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sub_department_nm.Mandatory = false;
            this.sub_department_nm.MaxCharacterLength = 2147483647;
            this.sub_department_nm.Name = "sub_department_nm";
            this.sub_department_nm.PercentageWidth = 12;
            this.sub_department_nm.ReadOnly = true;
            this.sub_department_nm.RegularExpressionValidator = "";
            this.sub_department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sub_department_nm.ToolTipLookupField = "information";
            this.sub_department_nm.Width = 5;
            // 
            // txn_ts
            // 
            this.txn_ts.BindingKey = "txn_ts";
            this.txn_ts.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Object;
            this.txn_ts.HeaderText = "Txn Ts";
            this.txn_ts.Lookup = false;
            this.txn_ts.LookupColumns = "";
            this.txn_ts.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txn_ts.Mandatory = false;
            this.txn_ts.Name = "txn_ts";
            this.txn_ts.PercentageWidth = 25;
            this.txn_ts.ReadOnly = true;
            this.txn_ts.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txn_ts.ToolTipLookupField = "information";
            this.txn_ts.Visible = false;
            this.txn_ts.Width = 5;
            // 
            // effective_dt
            // 
            this.effective_dt.BindingKey = "effective_dt";
            this.effective_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle23.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.effective_dt.DefaultCellStyle = dataGridViewCellStyle23;
            this.effective_dt.HeaderText = "Effective Date";
            this.effective_dt.Lookup = false;
            this.effective_dt.LookupColumns = "";
            this.effective_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.effective_dt.Mandatory = false;
            this.effective_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effective_dt.MinValue = new System.DateTime(((long)(0)));
            this.effective_dt.Name = "effective_dt";
            this.effective_dt.PercentageWidth = 10;
            this.effective_dt.ReadOnly = true;
            this.effective_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effective_dt.ToolTipLookupField = "information";
            this.effective_dt.Width = 5;
            // 
            // sewadar_status_dtm
            // 
            this.sewadar_status_dtm.BindingKey = "sewadar_status_dtm";
            this.sewadar_status_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle24.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.sewadar_status_dtm.DefaultCellStyle = dataGridViewCellStyle24;
            this.sewadar_status_dtm.HeaderText = "sewadar_status_dtm";
            this.sewadar_status_dtm.Lookup = false;
            this.sewadar_status_dtm.LookupColumns = "";
            this.sewadar_status_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_dtm.Mandatory = false;
            this.sewadar_status_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.sewadar_status_dtm.MinValue = new System.DateTime(((long)(0)));
            this.sewadar_status_dtm.Name = "sewadar_status_dtm";
            this.sewadar_status_dtm.PercentageWidth = 25;
            this.sewadar_status_dtm.ReadOnly = true;
            this.sewadar_status_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_dtm.ToolTipLookupField = "information";
            this.sewadar_status_dtm.Visible = false;
            // 
            // sewadar_status_nm
            // 
            this.sewadar_status_nm.BindingKey = "sewadar_status_nm";
            this.sewadar_status_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_status_nm.HeaderText = "sewadar_status_nm";
            this.sewadar_status_nm.Lookup = false;
            this.sewadar_status_nm.LookupColumns = "";
            this.sewadar_status_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_nm.Mandatory = false;
            this.sewadar_status_nm.MaxCharacterLength = 2147483647;
            this.sewadar_status_nm.Name = "sewadar_status_nm";
            this.sewadar_status_nm.PercentageWidth = 25;
            this.sewadar_status_nm.ReadOnly = true;
            this.sewadar_status_nm.RegularExpressionValidator = "";
            this.sewadar_status_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_nm.ToolTipLookupField = "information";
            this.sewadar_status_nm.Visible = false;
            // 
            // gender
            // 
            this.gender.BindingKey = "gender";
            this.gender.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.gender.HeaderText = "gender";
            this.gender.Lookup = false;
            this.gender.LookupColumns = "";
            this.gender.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.gender.Mandatory = false;
            this.gender.MaxCharacterLength = 2147483647;
            this.gender.Name = "gender";
            this.gender.PercentageWidth = 25;
            this.gender.ReadOnly = true;
            this.gender.RegularExpressionValidator = "";
            this.gender.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gender.ToolTipLookupField = "information";
            this.gender.Visible = false;
            // 
            // department_dt
            // 
            this.department_dt.BindingKey = "department_dt";
            this.department_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle25.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.department_dt.DefaultCellStyle = dataGridViewCellStyle25;
            this.department_dt.HeaderText = "department_dt";
            this.department_dt.Lookup = false;
            this.department_dt.LookupColumns = "";
            this.department_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_dt.Mandatory = false;
            this.department_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.department_dt.MinValue = new System.DateTime(((long)(0)));
            this.department_dt.Name = "department_dt";
            this.department_dt.PercentageWidth = 25;
            this.department_dt.ReadOnly = true;
            this.department_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_dt.ToolTipLookupField = "information";
            this.department_dt.Visible = false;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 3;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel2.Controls.Add(this.dccTextField1, 0, 0);
            this.tableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 1;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(200, 100);
            this.tableLayoutPanel2.TabIndex = 0;
            // 
            // dccTextField1
            // 
            this.dccTextField1.AllowsNew = false;
            this.dccTextField1.AllowsReference = false;
            this.dccTextField1.AllowsUpdate = false;
            this.dccTextField1.ApplicationIdForDbConnection = null;
            this.dccTextField1.BackColor = System.Drawing.Color.Transparent;
            this.dccTextField1.CalledScreenApplicationId = null;
            this.dccTextField1.CalledScreenTypeName = null;
            this.dccTextField1.CallingScreenType = null;
            this.dccTextField1.DisplayText = "";
            this.dccTextField1.DisplayTextBindingKey = null;
            this.dccTextField1.Dock = System.Windows.Forms.DockStyle.Right;
            this.dccTextField1.EditingControlDataGridView = null;
            this.dccTextField1.EditingControlFormattedValue = "";
            this.dccTextField1.EditingControlRowIndex = 0;
            this.dccTextField1.EditingControlValueChanged = false;
            this.dccTextField1.EnableToolTip = false;
            this.dccTextField1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccTextField1.IdText = null;
            this.dccTextField1.IdTextBindingKey = null;
            this.dccTextField1.Location = new System.Drawing.Point(150, 3);
            this.dccTextField1.Lookup = false;
            this.dccTextField1.LookupColumns = null;
            this.dccTextField1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextField1.LookupResult = null;
            this.dccTextField1.Mandatory = true;
            this.dccTextField1.Margin = new System.Windows.Forms.Padding(150, 3, 50, 3);
            this.dccTextField1.MaxCharacterLength = 8;
            this.dccTextField1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.dccTextField1.MinimumSize = new System.Drawing.Size(10, 22);
            this.dccTextField1.Name = "dccTextField1";
            this.dccTextField1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.dccTextField1.PascalCase = false;
            this.dccTextField1.RangeInQueryMode = false;
            this.dccTextField1.ReadOnly = false;
            this.dccTextField1.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.dccTextField1.Size = new System.Drawing.Size(10, 44);
            this.dccTextField1.TabIndex = 0;
            this.dccTextField1.Title = "Country Code";
            this.dccTextField1.ToolTipLookupField = "information";
            this.dccTextField1.ValueText = null;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dccGrid1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(200, 52);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(200, 3, 200, 3);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1, 253);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Subjects";
            // 
            // dccGrid1
            // 
            this.dccGrid1.AllowRowSorting = false;
            this.dccGrid1.AllowUserToAddRows = false;
            this.dccGrid1.AutoAddNewRowForUser = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dccGrid1.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dccGrid1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dccGrid1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dccTextFieldGridColumn1,
            this.dccTextFieldGridColumn2,
            this.dccDateGridColumn1,
            this.dccDateGridColumn2,
            this.dccDateGridColumn3,
            this.dccDateGridColumn4});
            this.dccGrid1.DeleteRowMenuEnabled = true;
            this.dccGrid1.DeleteVisible = true;
            this.dccGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccGrid1.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dccGrid1.ExportToExcelVisible = true;
            this.dccGrid1.InsertAfterVisible = true;
            this.dccGrid1.InsertBeforeVisible = true;
            this.dccGrid1.InsertLastVisible = true;
            this.dccGrid1.InsertRowsMenuItemsEnabled = true;
            this.dccGrid1.Location = new System.Drawing.Point(3, 16);
            this.dccGrid1.Mandatory = false;
            this.dccGrid1.MoveDownVisible = false;
            this.dccGrid1.MoveUpVisible = false;
            this.dccGrid1.MultiSelect = false;
            this.dccGrid1.Name = "dccGrid1";
            this.dccGrid1.RowHeadersWidth = 15;
            this.dccGrid1.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.dccGrid1.ShowCommandStrip = false;
            this.dccGrid1.Size = new System.Drawing.Size(0, 234);
            this.dccGrid1.TabIndex = 3;
            this.dccGrid1.Title = null;
            this.dccGrid1.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.dccGrid1.VirtualMode = true;
            // 
            // dccTextFieldGridColumn1
            // 
            this.dccTextFieldGridColumn1.BindingKey = "qlfctn_subject_id";
            this.dccTextFieldGridColumn1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.dccTextFieldGridColumn1.HeaderText = "SubjectID";
            this.dccTextFieldGridColumn1.Lookup = false;
            this.dccTextFieldGridColumn1.LookupColumns = "";
            this.dccTextFieldGridColumn1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextFieldGridColumn1.Mandatory = false;
            this.dccTextFieldGridColumn1.MaxCharacterLength = 2147483647;
            this.dccTextFieldGridColumn1.Name = "dccTextFieldGridColumn1";
            this.dccTextFieldGridColumn1.PercentageWidth = 5;
            this.dccTextFieldGridColumn1.RegularExpressionValidator = "";
            this.dccTextFieldGridColumn1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccTextFieldGridColumn1.ToolTipLookupField = "information";
            this.dccTextFieldGridColumn1.Visible = false;
            this.dccTextFieldGridColumn1.Width = 25;
            // 
            // dccTextFieldGridColumn2
            // 
            this.dccTextFieldGridColumn2.BindingKey = "qlfctn_subject_nm";
            this.dccTextFieldGridColumn2.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.dccTextFieldGridColumn2.HeaderText = "Subject";
            this.dccTextFieldGridColumn2.Lookup = true;
            this.dccTextFieldGridColumn2.LookupColumns = resources.GetString("dccTextFieldGridColumn2.LookupColumns");
            this.dccTextFieldGridColumn2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextFieldGridColumn2.Mandatory = true;
            this.dccTextFieldGridColumn2.MaxCharacterLength = 2147483647;
            this.dccTextFieldGridColumn2.Name = "dccTextFieldGridColumn2";
            this.dccTextFieldGridColumn2.PercentageWidth = 50;
            this.dccTextFieldGridColumn2.RegularExpressionValidator = "";
            this.dccTextFieldGridColumn2.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccTextFieldGridColumn2.ToolTipLookupField = "information";
            this.dccTextFieldGridColumn2.Width = 5;
            // 
            // dccDateGridColumn1
            // 
            this.dccDateGridColumn1.BindingKey = "effective_from";
            this.dccDateGridColumn1.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle26.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn1.DefaultCellStyle = dataGridViewCellStyle26;
            this.dccDateGridColumn1.HeaderText = "Effective From";
            this.dccDateGridColumn1.Lookup = false;
            this.dccDateGridColumn1.LookupColumns = "";
            this.dccDateGridColumn1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn1.Mandatory = false;
            this.dccDateGridColumn1.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn1.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn1.Name = "dccDateGridColumn1";
            this.dccDateGridColumn1.PercentageWidth = 25;
            this.dccDateGridColumn1.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dccDateGridColumn1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn1.ToolTipLookupField = "information";
            this.dccDateGridColumn1.Width = 5;
            // 
            // dccDateGridColumn2
            // 
            this.dccDateGridColumn2.BindingKey = "effective_from";
            this.dccDateGridColumn2.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle27.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn2.DefaultCellStyle = dataGridViewCellStyle27;
            this.dccDateGridColumn2.HeaderText = "OldEffectiveFrom";
            this.dccDateGridColumn2.Lookup = false;
            this.dccDateGridColumn2.LookupColumns = "";
            this.dccDateGridColumn2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn2.Mandatory = false;
            this.dccDateGridColumn2.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn2.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn2.Name = "dccDateGridColumn2";
            this.dccDateGridColumn2.PercentageWidth = 25;
            this.dccDateGridColumn2.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn2.ToolTipLookupField = "information";
            this.dccDateGridColumn2.Visible = false;
            this.dccDateGridColumn2.Width = 126;
            // 
            // dccDateGridColumn3
            // 
            this.dccDateGridColumn3.BindingKey = "effective_till";
            this.dccDateGridColumn3.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle28.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn3.DefaultCellStyle = dataGridViewCellStyle28;
            this.dccDateGridColumn3.HeaderText = "OldEffectiveTill";
            this.dccDateGridColumn3.Lookup = false;
            this.dccDateGridColumn3.LookupColumns = "";
            this.dccDateGridColumn3.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn3.Mandatory = false;
            this.dccDateGridColumn3.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn3.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn3.Name = "dccDateGridColumn3";
            this.dccDateGridColumn3.PercentageWidth = 25;
            this.dccDateGridColumn3.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn3.ToolTipLookupField = "information";
            this.dccDateGridColumn3.Visible = false;
            this.dccDateGridColumn3.Width = 126;
            // 
            // dccDateGridColumn4
            // 
            this.dccDateGridColumn4.BindingKey = "effective_till";
            this.dccDateGridColumn4.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle29.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn4.DefaultCellStyle = dataGridViewCellStyle29;
            this.dccDateGridColumn4.HeaderText = "Effective Till";
            this.dccDateGridColumn4.Lookup = false;
            this.dccDateGridColumn4.LookupColumns = "";
            this.dccDateGridColumn4.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccDateGridColumn4.Mandatory = false;
            this.dccDateGridColumn4.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dccDateGridColumn4.MinValue = new System.DateTime(((long)(0)));
            this.dccDateGridColumn4.Name = "dccDateGridColumn4";
            this.dccDateGridColumn4.PercentageWidth = 25;
            this.dccDateGridColumn4.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.dccDateGridColumn4.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dccDateGridColumn4.ToolTipLookupField = "information";
            this.dccDateGridColumn4.Width = 5;
            // 
            // DepartmentTransfers
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(968, 538);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "DepartmentTransfers";
            this.Text = "Zonal Sewadar Management - [Department Transfers]";
            this.Load += new System.EventHandler(this.DepartmentTransfers_Load);
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpTopMost.ResumeLayout(false);
            this.dccTLPMiddle.ResumeLayout(false);
            this.departmentChooserOld.ResumeLayout(false);
            this.tlpSewadar.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.dccTLPBottom.ResumeLayout(false);
            this.departmentChooserNew.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.tableLayoutPanel2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion


        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField dccTextField1;
        private System.Windows.Forms.GroupBox groupBox1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid dccGrid1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn dccTextFieldGridColumn1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn dccTextFieldGridColumn2;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn1;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn2;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn3;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn dccDateGridColumn4;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTopMost;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTLPMiddle;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private UMB.CDF.UIControls.TextControls.DCCComboBox cmbSatsangCentreType;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField intSatsangId;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangCode;
        private Controls.Misc.DepartmentChooser departmentChooserOld;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel object_98cece24_9e6d_4b2d_91c6_55654649579c;
        private System.Windows.Forms.GroupBox groupBox2;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTLPBottom;
        private Controls.Misc.DepartmentChooser departmentChooserNew;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel object_52331939_253c_4436_b530_89ac40efcef1;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel2;
        private UMB.CDF.UIControls.TextControls.DCCTextArea txtRemarks;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSatsangName;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtEffectiveDate;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpSewadar;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.GRNoLookup txtGRNo;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarIDLookup sewadarIDLookup;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.RegisteredSewadarLookup txtSewadarName;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sewadar_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn full_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn old_department_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn old_sub_department_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn department_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn sub_department_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn old_department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn old_sub_department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sub_department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_dt;
        public DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo cmbGender;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtSewadarStatus;
        public DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtmSewadarStatus;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn sewadar_status_dtm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gender;
        private DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField dtDepartment;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn department_dt;
    }
}
