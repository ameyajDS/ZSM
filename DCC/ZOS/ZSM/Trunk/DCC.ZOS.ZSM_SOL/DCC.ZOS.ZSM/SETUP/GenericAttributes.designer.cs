namespace DCC.ZOS.ZSM.SETUP
{
    partial class GenericAttributes
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GenericAttributes));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scBrowseOrList = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextArea();
            this.chkIsTemporal = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkIsStatusApplicable = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.chkIsMandatory = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.intAttributeScale = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.intAttributeLength = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.intAttributeSq = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtAttGroup = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.cmbAttributeType = new DCC.ZOS.ZSM.Controls.DropDown.AttributeTypeCombo();
            this.intID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.tblGrids = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.grdSatsangCentre = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.effective_from = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.effective_till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.dccLabel3 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.dccLabel1 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.dccLabel2 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.grdAttributeStatus = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadar_status_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_sewadar_status_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.grdAttributeValue = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.attribute_value_sq = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.attribute_value = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.old_attribute_value = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.attribute_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.attribute_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.attribute_group = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.attribute_sq = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.attribute_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.attribute_length = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.attribute_scale = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.is_temporal = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.is_mandatory = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.is_status_applicable = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.dateRangePair1 = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.dccTextField2 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tableLayoutPanel3 = new System.Windows.Forms.TableLayoutPanel();
            this.dccTextField3 = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.sewadarListLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup();
            this.sewadarListLookup2 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup();
            this.scBrowseOrList.Panel1.SuspendLayout();
            this.scBrowseOrList.Panel2.SuspendLayout();
            this.scBrowseOrList.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.tblGrids.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSatsangCentre)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdAttributeStatus)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdAttributeValue)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
            this.dateRangePair1.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            this.tableLayoutPanel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // scBrowseOrList
            // 
            this.scBrowseOrList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.scBrowseOrList.Location = new System.Drawing.Point(0, 0);
            this.scBrowseOrList.Name = "scBrowseOrList";
            // 
            // scBrowseOrList.Panel1
            // 
            this.scBrowseOrList.Panel1.Controls.Add(this.tableLayoutPanel1);
            // 
            // scBrowseOrList.Panel2
            // 
            this.scBrowseOrList.Panel2.Controls.Add(this.grdList);
            this.scBrowseOrList.Size = new System.Drawing.Size(956, 512);
            this.scBrowseOrList.SplitterDistance = 924;
            this.scBrowseOrList.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 6;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.66667F));
            this.tableLayoutPanel1.Controls.Add(this.txtRemarks, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.chkIsTemporal, 3, 1);
            this.tableLayoutPanel1.Controls.Add(this.chkIsStatusApplicable, 5, 1);
            this.tableLayoutPanel1.Controls.Add(this.chkIsMandatory, 4, 1);
            this.tableLayoutPanel1.Controls.Add(this.intAttributeScale, 2, 1);
            this.tableLayoutPanel1.Controls.Add(this.intAttributeLength, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.intAttributeSq, 4, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtAttGroup, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtName, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.cmbAttributeType, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.intID, 5, 0);
            this.tableLayoutPanel1.Controls.Add(this.tblGrids, 0, 3);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 4;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.895334F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.895334F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.47279F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 71.73653F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(924, 512);
            this.tableLayoutPanel1.TabIndex = 0;
            this.tableLayoutPanel1.TabStop = true;
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
            this.tableLayoutPanel1.SetColumnSpan(this.txtRemarks, 6);
            this.txtRemarks.DisplayText = "";
            this.txtRemarks.DisplayTextBindingKey = "Remarks";
            this.txtRemarks.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRemarks.EditingControlDataGridView = null;
            this.txtRemarks.EditingControlFormattedValue = "";
            this.txtRemarks.EditingControlRowIndex = 0;
            this.txtRemarks.EditingControlValueChanged = false;
            this.txtRemarks.EnableToolTip = false;
            this.txtRemarks.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRemarks.IdText = null;
            this.txtRemarks.IdTextBindingKey = null;
            this.txtRemarks.Location = new System.Drawing.Point(4, 93);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.LookupTitle = "Remarks";
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtRemarks.MaxCharacterLength = 100;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1300, 2000);
            this.txtRemarks.MinCharactersForQuery = 0;
            this.txtRemarks.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.RegularExpressionValidator = null;
            this.txtRemarks.Size = new System.Drawing.Size(916, 47);
            this.txtRemarks.TabIndex = 10;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
            // 
            // chkIsTemporal
            // 
            this.chkIsTemporal.AutoSize = true;
            this.chkIsTemporal.BackColor = System.Drawing.Color.Transparent;
            this.chkIsTemporal.BindingKey = "is_temporal";
            this.chkIsTemporal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIsTemporal.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkIsTemporal.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkIsTemporal.Location = new System.Drawing.Point(462, 48);
            this.chkIsTemporal.Name = "chkIsTemporal";
            this.chkIsTemporal.Size = new System.Drawing.Size(147, 39);
            this.chkIsTemporal.TabIndex = 7;
            this.chkIsTemporal.Text = "Is Temporal";
            this.chkIsTemporal.UseVisualStyleBackColor = true;
            // 
            // chkIsStatusApplicable
            // 
            this.chkIsStatusApplicable.AutoSize = true;
            this.chkIsStatusApplicable.BackColor = System.Drawing.Color.Transparent;
            this.chkIsStatusApplicable.BindingKey = "is_status_applicable";
            this.chkIsStatusApplicable.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIsStatusApplicable.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkIsStatusApplicable.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkIsStatusApplicable.Location = new System.Drawing.Point(768, 48);
            this.chkIsStatusApplicable.Name = "chkIsStatusApplicable";
            this.chkIsStatusApplicable.Size = new System.Drawing.Size(153, 39);
            this.chkIsStatusApplicable.TabIndex = 9;
            this.chkIsStatusApplicable.Text = "Is Status Applicable";
            this.chkIsStatusApplicable.UseVisualStyleBackColor = true;
            // 
            // chkIsMandatory
            // 
            this.chkIsMandatory.AutoSize = true;
            this.chkIsMandatory.BackColor = System.Drawing.Color.Transparent;
            this.chkIsMandatory.BindingKey = "is_mandatory";
            this.chkIsMandatory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkIsMandatory.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkIsMandatory.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.chkIsMandatory.Location = new System.Drawing.Point(615, 48);
            this.chkIsMandatory.Name = "chkIsMandatory";
            this.chkIsMandatory.Size = new System.Drawing.Size(147, 39);
            this.chkIsMandatory.TabIndex = 8;
            this.chkIsMandatory.Text = "Is Mandatory";
            this.chkIsMandatory.UseVisualStyleBackColor = true;
            // 
            // intAttributeScale
            // 
            this.intAttributeScale.AllowsNew = false;
            this.intAttributeScale.AllowsReference = false;
            this.intAttributeScale.AllowsUpdate = false;
            this.intAttributeScale.ApplicationIdForDbConnection = null;
            this.intAttributeScale.BackColor = System.Drawing.Color.Transparent;
            this.intAttributeScale.CalledScreenApplicationId = null;
            this.intAttributeScale.CalledScreenTypeName = null;
            this.intAttributeScale.CallingScreenType = null;
            this.intAttributeScale.DisplayText = "";
            this.intAttributeScale.DisplayTextBindingKey = "attribute_scale";
            this.intAttributeScale.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intAttributeScale.EditingControlDataGridView = null;
            this.intAttributeScale.EditingControlFormattedValue = "";
            this.intAttributeScale.EditingControlRowIndex = 0;
            this.intAttributeScale.EditingControlValueChanged = false;
            this.intAttributeScale.EnableToolTip = false;
            this.intAttributeScale.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intAttributeScale.IdText = null;
            this.intAttributeScale.IdTextBindingKey = "";
            this.intAttributeScale.Location = new System.Drawing.Point(310, 48);
            this.intAttributeScale.Lookup = false;
            this.intAttributeScale.LookupColumns = null;
            this.intAttributeScale.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intAttributeScale.LookupResult = null;
            this.intAttributeScale.LookupTitle = "Scale";
            this.intAttributeScale.Mandatory = false;
            this.intAttributeScale.Margin = new System.Windows.Forms.Padding(4, 3, 10, 3);
            this.intAttributeScale.MaxCharacterLength = 4;
            this.intAttributeScale.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intAttributeScale.MaxValue = ((long)(9223372036854775807));
            this.intAttributeScale.MinCharactersForQuery = 0;
            this.intAttributeScale.MinimumSize = new System.Drawing.Size(10, 22);
            this.intAttributeScale.MinValue = ((long)(-9223372036854775808));
            this.intAttributeScale.Name = "intAttributeScale";
            this.intAttributeScale.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intAttributeScale.PascalCase = false;
            this.intAttributeScale.RangeInQueryMode = false;
            this.intAttributeScale.ReadOnly = false;
            this.intAttributeScale.RegularExpressionValidator = null;
            this.intAttributeScale.Size = new System.Drawing.Size(139, 39);
            this.intAttributeScale.TabIndex = 6;
            this.intAttributeScale.Title = "Scale";
            this.intAttributeScale.ToolTipLookupField = null;
            this.intAttributeScale.ValueText = null;
            // 
            // intAttributeLength
            // 
            this.intAttributeLength.AllowsNew = false;
            this.intAttributeLength.AllowsReference = false;
            this.intAttributeLength.AllowsUpdate = false;
            this.intAttributeLength.ApplicationIdForDbConnection = null;
            this.intAttributeLength.BackColor = System.Drawing.Color.Transparent;
            this.intAttributeLength.CalledScreenApplicationId = null;
            this.intAttributeLength.CalledScreenTypeName = null;
            this.intAttributeLength.CallingScreenType = null;
            this.intAttributeLength.DisplayText = "";
            this.intAttributeLength.DisplayTextBindingKey = "attribute_length";
            this.intAttributeLength.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intAttributeLength.EditingControlDataGridView = null;
            this.intAttributeLength.EditingControlFormattedValue = "";
            this.intAttributeLength.EditingControlRowIndex = 0;
            this.intAttributeLength.EditingControlValueChanged = false;
            this.intAttributeLength.EnableToolTip = false;
            this.intAttributeLength.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intAttributeLength.IdText = null;
            this.intAttributeLength.IdTextBindingKey = "";
            this.intAttributeLength.Location = new System.Drawing.Point(157, 48);
            this.intAttributeLength.Lookup = false;
            this.intAttributeLength.LookupColumns = null;
            this.intAttributeLength.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intAttributeLength.LookupResult = null;
            this.intAttributeLength.LookupTitle = "Length";
            this.intAttributeLength.Mandatory = false;
            this.intAttributeLength.Margin = new System.Windows.Forms.Padding(4, 3, 10, 3);
            this.intAttributeLength.MaxCharacterLength = 4;
            this.intAttributeLength.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intAttributeLength.MaxValue = ((long)(9223372036854775807));
            this.intAttributeLength.MinCharactersForQuery = 0;
            this.intAttributeLength.MinimumSize = new System.Drawing.Size(10, 22);
            this.intAttributeLength.MinValue = ((long)(-9223372036854775808));
            this.intAttributeLength.Name = "intAttributeLength";
            this.intAttributeLength.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intAttributeLength.PascalCase = false;
            this.intAttributeLength.RangeInQueryMode = false;
            this.intAttributeLength.ReadOnly = false;
            this.intAttributeLength.RegularExpressionValidator = null;
            this.intAttributeLength.Size = new System.Drawing.Size(139, 39);
            this.intAttributeLength.TabIndex = 5;
            this.intAttributeLength.Title = "Length";
            this.intAttributeLength.ToolTipLookupField = null;
            this.intAttributeLength.ValueText = null;
            // 
            // intAttributeSq
            // 
            this.intAttributeSq.AllowsNew = false;
            this.intAttributeSq.AllowsReference = false;
            this.intAttributeSq.AllowsUpdate = false;
            this.intAttributeSq.ApplicationIdForDbConnection = null;
            this.intAttributeSq.BackColor = System.Drawing.Color.Transparent;
            this.intAttributeSq.CalledScreenApplicationId = null;
            this.intAttributeSq.CalledScreenTypeName = null;
            this.intAttributeSq.CallingScreenType = null;
            this.intAttributeSq.DisplayText = "";
            this.intAttributeSq.DisplayTextBindingKey = "attribute_sq";
            this.intAttributeSq.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intAttributeSq.EditingControlDataGridView = null;
            this.intAttributeSq.EditingControlFormattedValue = "";
            this.intAttributeSq.EditingControlRowIndex = 0;
            this.intAttributeSq.EditingControlValueChanged = false;
            this.intAttributeSq.EnableToolTip = false;
            this.intAttributeSq.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intAttributeSq.IdText = null;
            this.intAttributeSq.IdTextBindingKey = "attribute_sq";
            this.intAttributeSq.Location = new System.Drawing.Point(616, 3);
            this.intAttributeSq.Lookup = false;
            this.intAttributeSq.LookupColumns = null;
            this.intAttributeSq.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intAttributeSq.LookupResult = null;
            this.intAttributeSq.LookupTitle = "Attribute Seq";
            this.intAttributeSq.Mandatory = true;
            this.intAttributeSq.Margin = new System.Windows.Forms.Padding(4, 3, 10, 3);
            this.intAttributeSq.MaxCharacterLength = 6;
            this.intAttributeSq.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intAttributeSq.MaxValue = ((long)(9223372036854775807));
            this.intAttributeSq.MinCharactersForQuery = 0;
            this.intAttributeSq.MinimumSize = new System.Drawing.Size(10, 22);
            this.intAttributeSq.MinValue = ((long)(-9223372036854775808));
            this.intAttributeSq.Name = "intAttributeSq";
            this.intAttributeSq.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intAttributeSq.PascalCase = false;
            this.intAttributeSq.RangeInQueryMode = false;
            this.intAttributeSq.ReadOnly = false;
            this.intAttributeSq.RegularExpressionValidator = null;
            this.intAttributeSq.Size = new System.Drawing.Size(139, 39);
            this.intAttributeSq.TabIndex = 2;
            this.intAttributeSq.Title = "Attribute Seq";
            this.intAttributeSq.ToolTipLookupField = null;
            this.intAttributeSq.ValueText = null;
            // 
            // txtAttGroup
            // 
            this.txtAttGroup.AllowsNew = false;
            this.txtAttGroup.AllowsReference = false;
            this.txtAttGroup.AllowsUpdate = false;
            this.txtAttGroup.ApplicationIdForDbConnection = null;
            this.txtAttGroup.BackColor = System.Drawing.Color.Transparent;
            this.txtAttGroup.CalledScreenApplicationId = null;
            this.txtAttGroup.CalledScreenTypeName = null;
            this.txtAttGroup.CallingScreenType = null;
            this.tableLayoutPanel1.SetColumnSpan(this.txtAttGroup, 2);
            this.txtAttGroup.DisplayText = "";
            this.txtAttGroup.DisplayTextBindingKey = "attribute_group";
            this.txtAttGroup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtAttGroup.EditingControlDataGridView = null;
            this.txtAttGroup.EditingControlFormattedValue = "";
            this.txtAttGroup.EditingControlRowIndex = 0;
            this.txtAttGroup.EditingControlValueChanged = false;
            this.txtAttGroup.EnableToolTip = false;
            this.txtAttGroup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAttGroup.IdText = null;
            this.txtAttGroup.IdTextBindingKey = "";
            this.txtAttGroup.Location = new System.Drawing.Point(310, 3);
            this.txtAttGroup.Lookup = false;
            this.txtAttGroup.LookupColumns = null;
            this.txtAttGroup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtAttGroup.LookupResult = null;
            this.txtAttGroup.LookupTitle = "Attribute Group";
            this.txtAttGroup.Mandatory = true;
            this.txtAttGroup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtAttGroup.MaxCharacterLength = 30;
            this.txtAttGroup.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtAttGroup.MinCharactersForQuery = 0;
            this.txtAttGroup.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtAttGroup.Name = "txtAttGroup";
            this.txtAttGroup.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtAttGroup.PascalCase = false;
            this.txtAttGroup.RangeInQueryMode = false;
            this.txtAttGroup.ReadOnly = false;
            this.txtAttGroup.RegularExpressionValidator = null;
            this.txtAttGroup.Size = new System.Drawing.Size(298, 39);
            this.txtAttGroup.TabIndex = 1;
            this.txtAttGroup.Title = "Attribute Group";
            this.txtAttGroup.ToolTipLookupField = "information";
            this.txtAttGroup.ValueText = null;
            // 
            // txtName
            // 
            this.txtName.AllowsNew = false;
            this.txtName.AllowsReference = false;
            this.txtName.AllowsUpdate = false;
            this.txtName.ApplicationIdForDbConnection = null;
            this.txtName.BackColor = System.Drawing.Color.Transparent;
            this.txtName.CalledScreenApplicationId = null;
            this.txtName.CalledScreenTypeName = null;
            this.txtName.CallingScreenType = null;
            this.tableLayoutPanel1.SetColumnSpan(this.txtName, 2);
            this.txtName.DisplayText = "";
            this.txtName.DisplayTextBindingKey = "attribute_nm";
            this.txtName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtName.EditingControlDataGridView = null;
            this.txtName.EditingControlFormattedValue = "";
            this.txtName.EditingControlRowIndex = 0;
            this.txtName.EditingControlValueChanged = false;
            this.txtName.EnableToolTip = false;
            this.txtName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.IdText = null;
            this.txtName.IdTextBindingKey = "";
            this.txtName.Location = new System.Drawing.Point(4, 3);
            this.txtName.Lookup = false;
            this.txtName.LookupColumns = null;
            this.txtName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtName.LookupResult = null;
            this.txtName.LookupTitle = "Attribute Name";
            this.txtName.Mandatory = true;
            this.txtName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtName.MaxCharacterLength = 30;
            this.txtName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtName.MinCharactersForQuery = 0;
            this.txtName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtName.Name = "txtName";
            this.txtName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtName.PascalCase = false;
            this.txtName.RangeInQueryMode = false;
            this.txtName.ReadOnly = false;
            this.txtName.RegularExpressionValidator = null;
            this.txtName.Size = new System.Drawing.Size(298, 39);
            this.txtName.TabIndex = 0;
            this.txtName.Title = "Attribute Name";
            this.txtName.ToolTipLookupField = "information";
            this.txtName.ValueText = null;
            // 
            // cmbAttributeType
            // 
            this.cmbAttributeType.ApplicationIdForDbConnection = null;
            this.cmbAttributeType.BackColor = System.Drawing.Color.Transparent;
            this.cmbAttributeType.DisplayText = ".......";
            this.cmbAttributeType.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbAttributeType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAttributeType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbAttributeType.Location = new System.Drawing.Point(4, 48);
            this.cmbAttributeType.Mandatory = true;
            this.cmbAttributeType.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbAttributeType.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbAttributeType.MinimumSize = new System.Drawing.Size(10, 22);
            this.cmbAttributeType.Name = "cmbAttributeType";
            this.cmbAttributeType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbAttributeType.ReadOnly = false;
            this.cmbAttributeType.SelectedIndex = 0;
            this.cmbAttributeType.SelectedText = ".......";
            this.cmbAttributeType.SelectedValue = null;
            this.cmbAttributeType.SelectedValueBindingKey = "attribute_type";
            this.cmbAttributeType.Size = new System.Drawing.Size(145, 39);
            this.cmbAttributeType.TabIndex = 4;
            this.cmbAttributeType.Title = "Attribute Type";
            this.cmbAttributeType.ValueText = null;
            // 
            // intID
            // 
            this.intID.AllowsNew = false;
            this.intID.AllowsReference = false;
            this.intID.AllowsUpdate = false;
            this.intID.ApplicationIdForDbConnection = null;
            this.intID.BackColor = System.Drawing.Color.Transparent;
            this.intID.CalledScreenApplicationId = null;
            this.intID.CalledScreenTypeName = null;
            this.intID.CallingScreenType = null;
            this.intID.DisplayText = "";
            this.intID.DisplayTextBindingKey = "attribute_id";
            this.intID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intID.EditingControlDataGridView = null;
            this.intID.EditingControlFormattedValue = "";
            this.intID.EditingControlRowIndex = 0;
            this.intID.EditingControlValueChanged = false;
            this.intID.EnableToolTip = false;
            this.intID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intID.IdText = null;
            this.intID.IdTextBindingKey = "";
            this.intID.Location = new System.Drawing.Point(769, 3);
            this.intID.Lookup = false;
            this.intID.LookupColumns = null;
            this.intID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intID.LookupResult = null;
            this.intID.LookupTitle = "ID";
            this.intID.Mandatory = false;
            this.intID.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intID.MaxCharacterLength = 4;
            this.intID.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intID.MaxValue = ((long)(9223372036854775807));
            this.intID.MinCharactersForQuery = 0;
            this.intID.MinimumSize = new System.Drawing.Size(10, 22);
            this.intID.MinValue = ((long)(-9223372036854775808));
            this.intID.Name = "intID";
            this.intID.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intID.PascalCase = false;
            this.intID.RangeInQueryMode = false;
            this.intID.ReadOnly = true;
            this.intID.RegularExpressionValidator = null;
            this.intID.Size = new System.Drawing.Size(151, 39);
            this.intID.TabIndex = 3;
            this.intID.TabStop = false;
            this.intID.Title = "ID";
            this.intID.ToolTipLookupField = null;
            this.intID.ValueText = null;
            // 
            // tblGrids
            // 
            this.tblGrids.ColumnCount = 3;
            this.tableLayoutPanel1.SetColumnSpan(this.tblGrids, 6);
            this.tblGrids.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30F));
            this.tblGrids.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30F));
            this.tblGrids.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tblGrids.Controls.Add(this.grdSatsangCentre, 2, 1);
            this.tblGrids.Controls.Add(this.dccLabel3, 2, 0);
            this.tblGrids.Controls.Add(this.dccLabel1, 0, 0);
            this.tblGrids.Controls.Add(this.dccLabel2, 1, 0);
            this.tblGrids.Controls.Add(this.grdAttributeStatus, 0, 1);
            this.tblGrids.Controls.Add(this.grdAttributeValue, 1, 1);
            this.tblGrids.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblGrids.Location = new System.Drawing.Point(3, 146);
            this.tblGrids.Name = "tblGrids";
            this.tblGrids.RowCount = 2;
            this.tblGrids.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tblGrids.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 90F));
            this.tblGrids.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tblGrids.Size = new System.Drawing.Size(918, 363);
            this.tblGrids.TabIndex = 11;
            this.tblGrids.TabStop = true;
            // 
            // grdSatsangCentre
            // 
            this.grdSatsangCentre.AllowRowSorting = false;
            this.grdSatsangCentre.AllowUserToAddRows = false;
            this.grdSatsangCentre.AutoAddNewRowForUser = false;
            this.grdSatsangCentre.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSatsangCentre.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.satsang_centre_id,
            this.old_satsang_centre_id,
            this.effective_from,
            this.effective_till});
            this.grdSatsangCentre.DeleteRowMenuEnabled = true;
            this.grdSatsangCentre.DeleteVisible = true;
            this.grdSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSatsangCentre.ExportToExcelVisible = true;
            this.grdSatsangCentre.InsertAfterVisible = true;
            this.grdSatsangCentre.InsertBeforeVisible = true;
            this.grdSatsangCentre.InsertLastVisible = true;
            this.grdSatsangCentre.InsertRowsMenuItemsEnabled = true;
            this.grdSatsangCentre.Location = new System.Drawing.Point(553, 39);
            this.grdSatsangCentre.Mandatory = false;
            this.grdSatsangCentre.MoveDownVisible = false;
            this.grdSatsangCentre.MoveUpVisible = false;
            this.grdSatsangCentre.MultiSelect = false;
            this.grdSatsangCentre.Name = "grdSatsangCentre";
            this.grdSatsangCentre.RowHeadersWidth = 15;
            this.grdSatsangCentre.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdSatsangCentre.ShowCommandStrip = false;
            this.grdSatsangCentre.Size = new System.Drawing.Size(362, 321);
            this.grdSatsangCentre.TabIndex = 2;
            this.grdSatsangCentre.Title = "Satsang Centres";
            this.grdSatsangCentre.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdSatsangCentre.VirtualMode = true;
            this.grdSatsangCentre.FillDefaultCellValues += new System.EventHandler<DCC.UMB.CDF.UIControls.Grid.FillDefaultCellValuesEventArgs>(this.grdSatsangCentre_FillDefaultCellValues);
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = "satsang_centre_id";
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.satsang_centre_id.HeaderText = "Satsang Centre";
            this.satsang_centre_id.Lookup = true;
            this.satsang_centre_id.LookupColumns = resources.GetString("satsang_centre_id.LookupColumns");
            this.satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.satsang_centre_id.Mandatory = true;
            this.satsang_centre_id.MaxCharacterLength = 2147483647;
            this.satsang_centre_id.Name = "satsang_centre_id";
            this.satsang_centre_id.PercentageWidth = 34F;
            this.satsang_centre_id.RegularExpressionValidator = "";
            this.satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.satsang_centre_id.ToolTipLookupField = "information";
            this.satsang_centre_id.Width = 117;
            // 
            // old_satsang_centre_id
            // 
            this.old_satsang_centre_id.BindingKey = "old_satsang_centre_id";
            this.old_satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.old_satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle1;
            this.old_satsang_centre_id.HeaderText = "old_satsang_centre_id";
            this.old_satsang_centre_id.Lookup = false;
            this.old_satsang_centre_id.LookupColumns = "";
            this.old_satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_satsang_centre_id.Mandatory = false;
            this.old_satsang_centre_id.MaxValue = ((long)(9223372036854775807));
            this.old_satsang_centre_id.MinValue = ((long)(-9223372036854775808));
            this.old_satsang_centre_id.Name = "old_satsang_centre_id";
            this.old_satsang_centre_id.PercentageWidth = 25F;
            this.old_satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_satsang_centre_id.ToolTipLookupField = "information";
            this.old_satsang_centre_id.Visible = false;
            // 
            // effective_from
            // 
            this.effective_from.BindingKey = "effective_from";
            this.effective_from.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.effective_from.DefaultCellStyle = dataGridViewCellStyle2;
            this.effective_from.HeaderText = "Effective From";
            this.effective_from.Lookup = false;
            this.effective_from.LookupColumns = "";
            this.effective_from.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.effective_from.Mandatory = true;
            this.effective_from.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effective_from.MinValue = new System.DateTime(((long)(0)));
            this.effective_from.Name = "effective_from";
            this.effective_from.PercentageWidth = 33F;
            this.effective_from.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effective_from.ToolTipLookupField = "information";
            this.effective_from.Width = 114;
            // 
            // effective_till
            // 
            this.effective_till.BindingKey = "effective_till";
            this.effective_till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.effective_till.DefaultCellStyle = dataGridViewCellStyle3;
            this.effective_till.HeaderText = "Effective Till";
            this.effective_till.Lookup = false;
            this.effective_till.LookupColumns = "";
            this.effective_till.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.effective_till.Mandatory = true;
            this.effective_till.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effective_till.MinValue = new System.DateTime(((long)(0)));
            this.effective_till.Name = "effective_till";
            this.effective_till.PercentageWidth = 33F;
            this.effective_till.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effective_till.ToolTipLookupField = "information";
            this.effective_till.Width = 114;
            // 
            // dccLabel3
            // 
            this.dccLabel3.AutoSize = true;
            this.dccLabel3.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel3.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dccLabel3.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel3.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel3.Location = new System.Drawing.Point(553, 22);
            this.dccLabel3.Name = "dccLabel3";
            this.dccLabel3.Size = new System.Drawing.Size(362, 14);
            this.dccLabel3.TabIndex = 57;
            this.dccLabel3.Text = "Satsang Centres";
            // 
            // dccLabel1
            // 
            this.dccLabel1.AutoSize = true;
            this.dccLabel1.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dccLabel1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel1.Location = new System.Drawing.Point(3, 22);
            this.dccLabel1.Name = "dccLabel1";
            this.dccLabel1.Size = new System.Drawing.Size(269, 14);
            this.dccLabel1.TabIndex = 55;
            this.dccLabel1.Text = "Attributes Status";
            // 
            // dccLabel2
            // 
            this.dccLabel2.AutoSize = true;
            this.dccLabel2.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dccLabel2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel2.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel2.Location = new System.Drawing.Point(278, 22);
            this.dccLabel2.Name = "dccLabel2";
            this.dccLabel2.Size = new System.Drawing.Size(269, 14);
            this.dccLabel2.TabIndex = 43;
            this.dccLabel2.Text = "Attributes List Values";
            // 
            // grdAttributeStatus
            // 
            this.grdAttributeStatus.AllowRowSorting = false;
            this.grdAttributeStatus.AllowUserToAddRows = false;
            this.grdAttributeStatus.AutoAddNewRowForUser = false;
            this.grdAttributeStatus.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdAttributeStatus.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewadar_status_cd,
            this.old_sewadar_status_cd});
            this.grdAttributeStatus.DeleteRowMenuEnabled = true;
            this.grdAttributeStatus.DeleteVisible = true;
            this.grdAttributeStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdAttributeStatus.ExportToExcelVisible = true;
            this.grdAttributeStatus.InsertAfterVisible = true;
            this.grdAttributeStatus.InsertBeforeVisible = true;
            this.grdAttributeStatus.InsertLastVisible = true;
            this.grdAttributeStatus.InsertRowsMenuItemsEnabled = true;
            this.grdAttributeStatus.Location = new System.Drawing.Point(3, 39);
            this.grdAttributeStatus.Mandatory = false;
            this.grdAttributeStatus.MoveDownVisible = false;
            this.grdAttributeStatus.MoveUpVisible = false;
            this.grdAttributeStatus.MultiSelect = false;
            this.grdAttributeStatus.Name = "grdAttributeStatus";
            this.grdAttributeStatus.RowHeadersWidth = 15;
            this.grdAttributeStatus.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdAttributeStatus.ShowCommandStrip = false;
            this.grdAttributeStatus.Size = new System.Drawing.Size(269, 321);
            this.grdAttributeStatus.TabIndex = 0;
            this.grdAttributeStatus.Title = "Attributes Status";
            this.grdAttributeStatus.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdAttributeStatus.VirtualMode = true;
            // 
            // sewadar_status_cd
            // 
            this.sewadar_status_cd.BindingKey = "sewadar_status_cd";
            this.sewadar_status_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_status_cd.HeaderText = "Sewadar Status";
            this.sewadar_status_cd.Lookup = true;
            this.sewadar_status_cd.LookupColumns = resources.GetString("sewadar_status_cd.LookupColumns");
            this.sewadar_status_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_cd.Mandatory = true;
            this.sewadar_status_cd.MaxCharacterLength = 20;
            this.sewadar_status_cd.Name = "sewadar_status_cd";
            this.sewadar_status_cd.PercentageWidth = 100F;
            this.sewadar_status_cd.RegularExpressionValidator = "";
            this.sewadar_status_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_cd.ToolTipLookupField = "information";
            this.sewadar_status_cd.Width = 254;
            // 
            // old_sewadar_status_cd
            // 
            this.old_sewadar_status_cd.BindingKey = "old_sewadar_status_cd";
            this.old_sewadar_status_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.old_sewadar_status_cd.HeaderText = "old_sewadar_status_cd";
            this.old_sewadar_status_cd.Lookup = false;
            this.old_sewadar_status_cd.LookupColumns = "";
            this.old_sewadar_status_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_sewadar_status_cd.Mandatory = false;
            this.old_sewadar_status_cd.MaxCharacterLength = 2147483647;
            this.old_sewadar_status_cd.Name = "old_sewadar_status_cd";
            this.old_sewadar_status_cd.PercentageWidth = 25F;
            this.old_sewadar_status_cd.RegularExpressionValidator = "";
            this.old_sewadar_status_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_sewadar_status_cd.ToolTipLookupField = "information";
            this.old_sewadar_status_cd.Visible = false;
            // 
            // grdAttributeValue
            // 
            this.grdAttributeValue.AllowRowSorting = false;
            this.grdAttributeValue.AllowUserToAddRows = false;
            this.grdAttributeValue.AutoAddNewRowForUser = false;
            this.grdAttributeValue.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdAttributeValue.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.attribute_value_sq,
            this.attribute_value,
            this.old_attribute_value});
            this.grdAttributeValue.DeleteRowMenuEnabled = true;
            this.grdAttributeValue.DeleteVisible = true;
            this.grdAttributeValue.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdAttributeValue.ExportToExcelVisible = true;
            this.grdAttributeValue.InsertAfterVisible = true;
            this.grdAttributeValue.InsertBeforeVisible = true;
            this.grdAttributeValue.InsertLastVisible = true;
            this.grdAttributeValue.InsertRowsMenuItemsEnabled = true;
            this.grdAttributeValue.Location = new System.Drawing.Point(278, 39);
            this.grdAttributeValue.Mandatory = false;
            this.grdAttributeValue.MoveDownVisible = false;
            this.grdAttributeValue.MoveUpVisible = false;
            this.grdAttributeValue.MultiSelect = false;
            this.grdAttributeValue.Name = "grdAttributeValue";
            this.grdAttributeValue.RowHeadersWidth = 15;
            this.grdAttributeValue.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdAttributeValue.ShowCommandStrip = true;
            this.grdAttributeValue.Size = new System.Drawing.Size(269, 321);
            this.grdAttributeValue.TabIndex = 1;
            this.grdAttributeValue.Title = "Attributes List Values";
            this.grdAttributeValue.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdAttributeValue.VirtualMode = true;
            // 
            // attribute_value_sq
            // 
            this.attribute_value_sq.BindingKey = "attribute_value_sq";
            this.attribute_value_sq.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.attribute_value_sq.DefaultCellStyle = dataGridViewCellStyle4;
            this.attribute_value_sq.HeaderText = "attribute_value_sq";
            this.attribute_value_sq.Lookup = false;
            this.attribute_value_sq.LookupColumns = "";
            this.attribute_value_sq.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_value_sq.Mandatory = false;
            this.attribute_value_sq.MaxValue = ((long)(9223372036854775807));
            this.attribute_value_sq.MinValue = ((long)(-9223372036854775808));
            this.attribute_value_sq.Name = "attribute_value_sq";
            this.attribute_value_sq.PercentageWidth = 25F;
            this.attribute_value_sq.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_value_sq.ToolTipLookupField = "information";
            this.attribute_value_sq.Visible = false;
            // 
            // attribute_value
            // 
            this.attribute_value.BindingKey = "attribute_value";
            this.attribute_value.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.attribute_value.HeaderText = "Attribute Value";
            this.attribute_value.Lookup = false;
            this.attribute_value.LookupColumns = "";
            this.attribute_value.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_value.Mandatory = true;
            this.attribute_value.MaxCharacterLength = 20;
            this.attribute_value.Name = "attribute_value";
            this.attribute_value.PercentageWidth = 100F;
            this.attribute_value.RegularExpressionValidator = "";
            this.attribute_value.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_value.ToolTipLookupField = "information";
            this.attribute_value.Width = 254;
            // 
            // old_attribute_value
            // 
            this.old_attribute_value.BindingKey = "old_attribute_value";
            this.old_attribute_value.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.old_attribute_value.HeaderText = "old_attribute_value";
            this.old_attribute_value.Lookup = false;
            this.old_attribute_value.LookupColumns = "";
            this.old_attribute_value.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_attribute_value.Mandatory = false;
            this.old_attribute_value.MaxCharacterLength = 2147483647;
            this.old_attribute_value.Name = "old_attribute_value";
            this.old_attribute_value.PercentageWidth = 25F;
            this.old_attribute_value.RegularExpressionValidator = "";
            this.old_attribute_value.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_attribute_value.ToolTipLookupField = "information";
            this.old_attribute_value.Visible = false;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle5;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.attribute_id,
            this.attribute_nm,
            this.attribute_group,
            this.attribute_sq,
            this.attribute_type,
            this.attribute_length,
            this.attribute_scale,
            this.is_temporal,
            this.is_mandatory,
            this.is_status_applicable,
            this.remarks,
            this.txn_ts});
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
            this.grdList.Size = new System.Drawing.Size(28, 512);
            this.grdList.TabIndex = 100;
            this.grdList.TabStop = false;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // attribute_id
            // 
            this.attribute_id.BindingKey = "attribute_id";
            this.attribute_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.attribute_id.DefaultCellStyle = dataGridViewCellStyle6;
            this.attribute_id.HeaderText = "attribute_id";
            this.attribute_id.Lookup = false;
            this.attribute_id.LookupColumns = "";
            this.attribute_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_id.Mandatory = false;
            this.attribute_id.MaxValue = ((long)(9223372036854775807));
            this.attribute_id.MinValue = ((long)(-9223372036854775808));
            this.attribute_id.Name = "attribute_id";
            this.attribute_id.PercentageWidth = 25F;
            this.attribute_id.ReadOnly = true;
            this.attribute_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_id.ToolTipLookupField = "information";
            this.attribute_id.Visible = false;
            // 
            // attribute_nm
            // 
            this.attribute_nm.BindingKey = "attribute_nm";
            this.attribute_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.attribute_nm.HeaderText = "Attribute Name";
            this.attribute_nm.Lookup = false;
            this.attribute_nm.LookupColumns = "";
            this.attribute_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_nm.Mandatory = false;
            this.attribute_nm.MaxCharacterLength = 2147483647;
            this.attribute_nm.Name = "attribute_nm";
            this.attribute_nm.PercentageWidth = 14F;
            this.attribute_nm.ReadOnly = true;
            this.attribute_nm.RegularExpressionValidator = "";
            this.attribute_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_nm.ToolTipLookupField = "information";
            this.attribute_nm.Width = 5;
            // 
            // attribute_group
            // 
            this.attribute_group.BindingKey = "attribute_group";
            this.attribute_group.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.attribute_group.HeaderText = "Attribute Group";
            this.attribute_group.Lookup = false;
            this.attribute_group.LookupColumns = "";
            this.attribute_group.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_group.Mandatory = false;
            this.attribute_group.MaxCharacterLength = 2147483647;
            this.attribute_group.Name = "attribute_group";
            this.attribute_group.PercentageWidth = 10F;
            this.attribute_group.ReadOnly = true;
            this.attribute_group.RegularExpressionValidator = "";
            this.attribute_group.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_group.ToolTipLookupField = "information";
            this.attribute_group.Width = 5;
            // 
            // attribute_sq
            // 
            this.attribute_sq.BindingKey = "attribute_sq";
            this.attribute_sq.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.attribute_sq.DefaultCellStyle = dataGridViewCellStyle7;
            this.attribute_sq.HeaderText = "attribute_sq";
            this.attribute_sq.Lookup = false;
            this.attribute_sq.LookupColumns = "";
            this.attribute_sq.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_sq.Mandatory = false;
            this.attribute_sq.MaxValue = ((long)(9223372036854775807));
            this.attribute_sq.MinValue = ((long)(-9223372036854775808));
            this.attribute_sq.Name = "attribute_sq";
            this.attribute_sq.PercentageWidth = 25F;
            this.attribute_sq.ReadOnly = true;
            this.attribute_sq.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_sq.ToolTipLookupField = "information";
            this.attribute_sq.Visible = false;
            // 
            // attribute_type
            // 
            this.attribute_type.BindingKey = "attribute_type";
            this.attribute_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.attribute_type.HeaderText = "Attribute Type";
            this.attribute_type.Lookup = false;
            this.attribute_type.LookupColumns = "";
            this.attribute_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_type.Mandatory = false;
            this.attribute_type.MaxCharacterLength = 2147483647;
            this.attribute_type.Name = "attribute_type";
            this.attribute_type.PercentageWidth = 10F;
            this.attribute_type.ReadOnly = true;
            this.attribute_type.RegularExpressionValidator = "";
            this.attribute_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_type.ToolTipLookupField = "information";
            this.attribute_type.Width = 5;
            // 
            // attribute_length
            // 
            this.attribute_length.BindingKey = "attribute_length";
            this.attribute_length.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.attribute_length.DefaultCellStyle = dataGridViewCellStyle8;
            this.attribute_length.HeaderText = "Attribute Length";
            this.attribute_length.Lookup = false;
            this.attribute_length.LookupColumns = "";
            this.attribute_length.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_length.Mandatory = false;
            this.attribute_length.MaxValue = ((long)(9223372036854775807));
            this.attribute_length.MinValue = ((long)(-9223372036854775808));
            this.attribute_length.Name = "attribute_length";
            this.attribute_length.PercentageWidth = 10F;
            this.attribute_length.ReadOnly = true;
            this.attribute_length.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_length.ToolTipLookupField = "information";
            this.attribute_length.Width = 5;
            // 
            // attribute_scale
            // 
            this.attribute_scale.BindingKey = "attribute_scale";
            this.attribute_scale.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.attribute_scale.DefaultCellStyle = dataGridViewCellStyle9;
            this.attribute_scale.HeaderText = "Attribute Scale";
            this.attribute_scale.Lookup = false;
            this.attribute_scale.LookupColumns = "";
            this.attribute_scale.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.attribute_scale.Mandatory = false;
            this.attribute_scale.MaxValue = ((long)(9223372036854775807));
            this.attribute_scale.MinValue = ((long)(-9223372036854775808));
            this.attribute_scale.Name = "attribute_scale";
            this.attribute_scale.PercentageWidth = 10F;
            this.attribute_scale.ReadOnly = true;
            this.attribute_scale.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.attribute_scale.ToolTipLookupField = "information";
            this.attribute_scale.Width = 5;
            // 
            // is_temporal
            // 
            this.is_temporal.BindingKey = "is_temporal";
            this.is_temporal.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_temporal.DefaultCellStyle = dataGridViewCellStyle10;
            this.is_temporal.HeaderText = "Is Temporal";
            this.is_temporal.Lookup = false;
            this.is_temporal.LookupColumns = "";
            this.is_temporal.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_temporal.Mandatory = false;
            this.is_temporal.Name = "is_temporal";
            this.is_temporal.PercentageWidth = 7F;
            this.is_temporal.ReadOnly = true;
            this.is_temporal.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_temporal.ToolTipLookupField = "information";
            this.is_temporal.Width = 5;
            // 
            // is_mandatory
            // 
            this.is_mandatory.BindingKey = "is_mandatory";
            this.is_mandatory.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_mandatory.DefaultCellStyle = dataGridViewCellStyle11;
            this.is_mandatory.HeaderText = "Is Mandatory";
            this.is_mandatory.Lookup = false;
            this.is_mandatory.LookupColumns = "";
            this.is_mandatory.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_mandatory.Mandatory = false;
            this.is_mandatory.Name = "is_mandatory";
            this.is_mandatory.PercentageWidth = 7F;
            this.is_mandatory.ReadOnly = true;
            this.is_mandatory.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_mandatory.ToolTipLookupField = "information";
            this.is_mandatory.Width = 5;
            // 
            // is_status_applicable
            // 
            this.is_status_applicable.BindingKey = "is_status_applicable";
            this.is_status_applicable.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_status_applicable.DefaultCellStyle = dataGridViewCellStyle12;
            this.is_status_applicable.HeaderText = "Is Status Applicable";
            this.is_status_applicable.Lookup = false;
            this.is_status_applicable.LookupColumns = "";
            this.is_status_applicable.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_status_applicable.Mandatory = false;
            this.is_status_applicable.Name = "is_status_applicable";
            this.is_status_applicable.PercentageWidth = 7F;
            this.is_status_applicable.ReadOnly = true;
            this.is_status_applicable.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_status_applicable.ToolTipLookupField = "information";
            this.is_status_applicable.Width = 5;
            // 
            // remarks
            // 
            this.remarks.BindingKey = "remarks";
            this.remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.remarks.HeaderText = "remarks";
            this.remarks.Lookup = false;
            this.remarks.LookupColumns = "";
            this.remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.remarks.Mandatory = false;
            this.remarks.MaxCharacterLength = 2147483647;
            this.remarks.Name = "remarks";
            this.remarks.PercentageWidth = 25F;
            this.remarks.ReadOnly = true;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Width = 5;
            // 
            // txn_ts
            // 
            this.txn_ts.BindingKey = "txn_ts";
            this.txn_ts.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Object;
            this.txn_ts.HeaderText = "txn_ts";
            this.txn_ts.Lookup = false;
            this.txn_ts.LookupColumns = "";
            this.txn_ts.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txn_ts.Mandatory = false;
            this.txn_ts.Name = "txn_ts";
            this.txn_ts.PercentageWidth = 25F;
            this.txn_ts.ReadOnly = true;
            this.txn_ts.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txn_ts.ToolTipLookupField = "information";
            this.txn_ts.Visible = false;
            // 
            // dateRangePair1
            // 
            this.dateRangePair1.Controls.Add(this.object_465feb1e_662d_463a_a2d9_925c4fd02740);
            this.dateRangePair1.DiscreteInQueryMode = false;
            this.dateRangePair1.FillDefailtValuesInInsertMode = false;
            this.dateRangePair1.FromDate = null;
            this.dateRangePair1.FromDateFieldBindingKey = "effective_from_dt";
            this.dateRangePair1.FromDateMandatory = false;
            this.dateRangePair1.FromDateTitle = null;
            this.dateRangePair1.Location = new System.Drawing.Point(0, 0);
            this.dateRangePair1.Mandatory = false;
            this.dateRangePair1.Margin = new System.Windows.Forms.Padding(4);
            this.dateRangePair1.Name = "dateRangePair1";
            this.dateRangePair1.ReadOnly = false;
            this.dateRangePair1.Size = new System.Drawing.Size(376, 45);
            this.dateRangePair1.TabIndex = 0;
            this.dateRangePair1.TitleInQueryMode = null;
            this.dateRangePair1.ToDate = null;
            this.dateRangePair1.ToDateFieldBindingKey = "effective_till_dt";
            this.dateRangePair1.ToDateMandatory = false;
            this.dateRangePair1.ToDateTitle = "Effective Till Date";
            // 
            // object_465feb1e_662d_463a_a2d9_925c4fd02740
            // 
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.ColumnCount = 2;
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.Dock = System.Windows.Forms.DockStyle.Fill;
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.Location = new System.Drawing.Point(0, 0);
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.MaximumSize = new System.Drawing.Size(2000, 45);
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.Name = "object_465feb1e_662d_463a_a2d9_925c4fd02740";
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.RowCount = 1;
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.Size = new System.Drawing.Size(376, 45);
            this.object_465feb1e_662d_463a_a2d9_925c4fd02740.TabIndex = 0;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 6;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tableLayoutPanel2.Controls.Add(this.dccTextField2, 0, 0);
            this.tableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 1;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(200, 100);
            this.tableLayoutPanel2.TabIndex = 0;
            // 
            // dccTextField2
            // 
            this.dccTextField2.AllowsNew = false;
            this.dccTextField2.AllowsReference = false;
            this.dccTextField2.AllowsUpdate = false;
            this.dccTextField2.ApplicationIdForDbConnection = null;
            this.dccTextField2.BackColor = System.Drawing.Color.Transparent;
            this.dccTextField2.CalledScreenApplicationId = null;
            this.dccTextField2.CalledScreenTypeName = null;
            this.dccTextField2.CallingScreenType = null;
            this.tableLayoutPanel2.SetColumnSpan(this.dccTextField2, 2);
            this.dccTextField2.DisplayText = "";
            this.dccTextField2.DisplayTextBindingKey = "satsang_centre_id";
            this.dccTextField2.EditingControlDataGridView = null;
            this.dccTextField2.EditingControlFormattedValue = "";
            this.dccTextField2.EditingControlRowIndex = 0;
            this.dccTextField2.EditingControlValueChanged = false;
            this.dccTextField2.EnableToolTip = false;
            this.dccTextField2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccTextField2.IdText = null;
            this.dccTextField2.IdTextBindingKey = "";
            this.dccTextField2.Location = new System.Drawing.Point(4, 3);
            this.dccTextField2.Lookup = false;
            this.dccTextField2.LookupColumns = null;
            this.dccTextField2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextField2.LookupResult = null;
            this.dccTextField2.LookupTitle = "Satsang Centre";
            this.dccTextField2.Mandatory = false;
            this.dccTextField2.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dccTextField2.MaxCharacterLength = 32767;
            this.dccTextField2.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dccTextField2.MinCharactersForQuery = 0;
            this.dccTextField2.MinimumSize = new System.Drawing.Size(10, 22);
            this.dccTextField2.Name = "dccTextField2";
            this.dccTextField2.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.dccTextField2.PascalCase = false;
            this.dccTextField2.RangeInQueryMode = false;
            this.dccTextField2.ReadOnly = true;
            this.dccTextField2.RegularExpressionValidator = null;
            this.dccTextField2.Size = new System.Drawing.Size(52, 45);
            this.dccTextField2.TabIndex = 0;
            this.dccTextField2.TabStop = false;
            this.dccTextField2.Title = "Satsang Centre";
            this.dccTextField2.ToolTipLookupField = "information";
            this.dccTextField2.ValueText = null;
            // 
            // tableLayoutPanel3
            // 
            this.tableLayoutPanel3.ColumnCount = 6;
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 15F));
            this.tableLayoutPanel3.Controls.Add(this.dccTextField3, 0, 0);
            this.tableLayoutPanel3.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel3.Name = "tableLayoutPanel3";
            this.tableLayoutPanel3.RowCount = 1;
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel3.Size = new System.Drawing.Size(200, 100);
            this.tableLayoutPanel3.TabIndex = 0;
            // 
            // dccTextField3
            // 
            this.dccTextField3.AllowsNew = false;
            this.dccTextField3.AllowsReference = false;
            this.dccTextField3.AllowsUpdate = false;
            this.dccTextField3.ApplicationIdForDbConnection = null;
            this.dccTextField3.BackColor = System.Drawing.Color.Transparent;
            this.dccTextField3.CalledScreenApplicationId = null;
            this.dccTextField3.CalledScreenTypeName = null;
            this.dccTextField3.CallingScreenType = null;
            this.tableLayoutPanel3.SetColumnSpan(this.dccTextField3, 2);
            this.dccTextField3.DisplayText = "";
            this.dccTextField3.DisplayTextBindingKey = "satsang_centre_id";
            this.dccTextField3.EditingControlDataGridView = null;
            this.dccTextField3.EditingControlFormattedValue = "";
            this.dccTextField3.EditingControlRowIndex = 0;
            this.dccTextField3.EditingControlValueChanged = false;
            this.dccTextField3.EnableToolTip = false;
            this.dccTextField3.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccTextField3.IdText = null;
            this.dccTextField3.IdTextBindingKey = "";
            this.dccTextField3.Location = new System.Drawing.Point(4, 3);
            this.dccTextField3.Lookup = false;
            this.dccTextField3.LookupColumns = null;
            this.dccTextField3.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccTextField3.LookupResult = null;
            this.dccTextField3.LookupTitle = "Satsang Centre";
            this.dccTextField3.Mandatory = false;
            this.dccTextField3.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dccTextField3.MaxCharacterLength = 32767;
            this.dccTextField3.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dccTextField3.MinCharactersForQuery = 0;
            this.dccTextField3.MinimumSize = new System.Drawing.Size(10, 22);
            this.dccTextField3.Name = "dccTextField3";
            this.dccTextField3.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.dccTextField3.PascalCase = false;
            this.dccTextField3.RangeInQueryMode = false;
            this.dccTextField3.ReadOnly = true;
            this.dccTextField3.RegularExpressionValidator = null;
            this.dccTextField3.Size = new System.Drawing.Size(30, 22);
            this.dccTextField3.TabIndex = 0;
            this.dccTextField3.TabStop = false;
            this.dccTextField3.Title = "Satsang Centre";
            this.dccTextField3.ToolTipLookupField = "information";
            this.dccTextField3.ValueText = null;
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
            this.sewadarListLookup1.DisplayTextBindingKey = "sewadar_list_nm";
            this.sewadarListLookup1.EditingControlDataGridView = null;
            this.sewadarListLookup1.EditingControlFormattedValue = null;
            this.sewadarListLookup1.EditingControlRowIndex = 0;
            this.sewadarListLookup1.EditingControlValueChanged = true;
            this.sewadarListLookup1.EnableToolTip = false;
            this.sewadarListLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewadarListLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewadarListLookup1.IdText = "";
            this.sewadarListLookup1.IdTextBindingKey = "sewadar_list_id";
            this.sewadarListLookup1.Location = new System.Drawing.Point(23, 12);
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
            this.sewadarListLookup1.ReadOnly = true;
            this.sewadarListLookup1.RegularExpressionValidator = null;
            this.sewadarListLookup1.Size = new System.Drawing.Size(11, 22);
            this.sewadarListLookup1.TabIndex = 5;
            this.sewadarListLookup1.TabStop = false;
            this.sewadarListLookup1.Title = "Sewadar List";
            this.sewadarListLookup1.ToolTipLookupField = "information";
            this.sewadarListLookup1.ValueText = "";
            // 
            // sewadarListLookup2
            // 
            this.sewadarListLookup2.AllowsNew = false;
            this.sewadarListLookup2.AllowsReference = false;
            this.sewadarListLookup2.AllowsUpdate = false;
            this.sewadarListLookup2.ApplicationIdForDbConnection = null;
            this.sewadarListLookup2.BackColor = System.Drawing.Color.Transparent;
            this.sewadarListLookup2.CalledScreenApplicationId = null;
            this.sewadarListLookup2.CalledScreenTypeName = null;
            this.sewadarListLookup2.CallingScreenType = null;
            this.sewadarListLookup2.DisplayText = "";
            this.sewadarListLookup2.DisplayTextBindingKey = "sewadar_list_nm";
            this.sewadarListLookup2.EditingControlDataGridView = null;
            this.sewadarListLookup2.EditingControlFormattedValue = null;
            this.sewadarListLookup2.EditingControlRowIndex = 0;
            this.sewadarListLookup2.EditingControlValueChanged = true;
            this.sewadarListLookup2.EnableToolTip = false;
            this.sewadarListLookup2.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewadarListLookup2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewadarListLookup2.IdText = "";
            this.sewadarListLookup2.IdTextBindingKey = "sewadar_list_id";
            this.sewadarListLookup2.Location = new System.Drawing.Point(23, 12);
            this.sewadarListLookup2.Lookup = true;
            this.sewadarListLookup2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadarListLookup2.LookupResult = null;
            this.sewadarListLookup2.LookupTitle = "Sewadar List";
            this.sewadarListLookup2.Mandatory = false;
            this.sewadarListLookup2.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewadarListLookup2.MaxCharacterLength = 32767;
            this.sewadarListLookup2.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewadarListLookup2.MinCharactersForQuery = 0;
            this.sewadarListLookup2.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewadarListLookup2.Name = "sewadarListLookup2";
            this.sewadarListLookup2.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewadarListLookup2.PascalCase = false;
            this.sewadarListLookup2.RangeInQueryMode = false;
            this.sewadarListLookup2.ReadOnly = true;
            this.sewadarListLookup2.RegularExpressionValidator = null;
            this.sewadarListLookup2.Size = new System.Drawing.Size(11, 22);
            this.sewadarListLookup2.TabIndex = 5;
            this.sewadarListLookup2.TabStop = false;
            this.sewadarListLookup2.Title = "Sewadar List";
            this.sewadarListLookup2.ToolTipLookupField = "information";
            this.sewadarListLookup2.ValueText = "";
            // 
            // GenericAttributes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(956, 512);
            this.Controls.Add(this.scBrowseOrList);
            this.Name = "GenericAttributes";
            this.Text = "Residents Management System - [GENERIC ATTRIBUTES]";
            this.scBrowseOrList.Panel1.ResumeLayout(false);
            this.scBrowseOrList.Panel2.ResumeLayout(false);
            this.scBrowseOrList.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.tblGrids.ResumeLayout(false);
            this.tblGrids.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSatsangCentre)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdAttributeStatus)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdAttributeValue)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.dateRangePair1.ResumeLayout(false);
            this.tableLayoutPanel2.ResumeLayout(false);
            this.tableLayoutPanel3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scBrowseOrList;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.TextControls.DateRangePair dateRangePair1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel object_465feb1e_662d_463a_a2d9_925c4fd02740;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField dccTextField2;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup sewadarListLookup1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel3;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField dccTextField3;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarListLookup sewadarListLookup2;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intAttributeScale;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intAttributeLength;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intAttributeSq;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtAttGroup;
        public DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtName;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdAttributeValue;
        private DCC.UMB.CDF.UIControls.DCCLabel dccLabel2;
        private DCC.ZOS.ZSM.Controls.DropDown.AttributeTypeCombo cmbAttributeType;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intID;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkIsTemporal;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkIsStatusApplicable;
        private DCC.UMB.CDF.UIControls.DCCCheckBox chkIsMandatory;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextArea txtRemarks;
        private DCC.UMB.CDF.UIControls.DCCLabel dccLabel1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSatsangCentre;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdAttributeStatus;
        private DCC.UMB.CDF.UIControls.DCCLabel dccLabel3;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn attribute_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn attribute_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn attribute_group;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn attribute_sq;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn attribute_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn attribute_length;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn attribute_scale;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_temporal;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_mandatory;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_status_applicable;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn attribute_value_sq;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn attribute_value;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn old_attribute_value;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tblGrids;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn old_sewadar_status_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn satsang_centre_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn old_satsang_centre_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_from;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_till;
    }
}