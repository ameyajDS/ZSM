namespace DCC.ZOS.ZSM.ENT
{
    partial class BadgeTemplates
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BadgeTemplates));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpTopMost = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtProcedureNmBack = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtProcedureNmFront = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtReportFileNmBack = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtReportFileNmFront = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtExpiryYear = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtBottomLinePart2Text = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.cmbBottomLinePart2Type = new DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo();
            this.txtBottomLinePart1Text = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intBottomLineFontSize = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.cmbBottomLinePart1Type = new DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo();
            this.cmbBottomLinePartsSeparator = new DCC.ZOS.ZSM.Controls.Combos.SeparatorCombo();
            this.txtMiddleLinePart2Text = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.cmbMiddleLinePart2Type = new DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo();
            this.txtMiddleLinePart1Text = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intMiddleLineFontSize = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.cmbMiddleLinePart1Type = new DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo();
            this.cmbMiddleLinePartsSeparator = new DCC.ZOS.ZSM.Controls.Combos.SeparatorCombo();
            this.txtTopLinePart2Text = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.cmbTopLinePart2Type = new DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo();
            this.txtTopLinePart1Text = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.intTopLineFontSize = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.lkpBackgroundColourId = new DCC.ZOS.ZSM.Controls.ZSMLookups.ColoursLookup();
            this.txtBadgeTemplateNm = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtBadgeTemplateId = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.lkpForegroundColourId = new DCC.ZOS.ZSM.Controls.ZSMLookups.ColoursLookup();
            this.cmbForegroundColourControl = new DCC.ZOS.ZSM.Controls.Combos.ColourControlCombo();
            this.cmbBackgroundColourControl = new DCC.ZOS.ZSM.Controls.Combos.ColourControlCombo();
            this.cmbTopLinePart1Type = new DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo();
            this.cmbTopLinePartsSeparator = new DCC.ZOS.ZSM.Controls.Combos.SeparatorCombo();
            this.cmbInformationType = new DCC.ZOS.ZSM.Controls.Combos.InformationTypeCombo();
            this.cmbBadgeShape = new DCC.ZOS.ZSM.Controls.Combos.BadgeShapeCombo();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.badge_template_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.badge_template_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.badge_shape = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.information_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.foreground_colour_control = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.foreground_colour_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.background_colour_control = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.background_colour_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.top_line_font_size = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.top_line_part_1_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.top_line_part_1_text = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.top_line_parts_separator = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.top_line_part_2_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.top_line_part_2_text = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.middle_line_font_size = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.middle_line_part_1_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.middle_line_part_1_text = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.middle_line_parts_separator = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.middle_line_part_2_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.middle_line_part_2_text = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.bottom_line_font_size = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.bottom_line_part_1_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.bottom_line_part_1_text = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.bottom_line_parts_separator = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.bottom_line_part_2_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.bottom_line_part_2_text = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.expiry_year = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.report_file_nm_front = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.report_file_nm_back = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.procedure_nm_front = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.procedure_nm_back = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.background_colour_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.foreground_colour_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
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
            this.chkAreOutstaionAllowed = new DCC.UMB.CDF.UIControls.DCCCheckBox();
            this.are_outstation_sewadars_allowed = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpTopMost.SuspendLayout();
            this.tlpTop.SuspendLayout();
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
            this.scListOrBrowse.Margin = new System.Windows.Forms.Padding(4);
            this.scListOrBrowse.Name = "scListOrBrowse";
            // 
            // scListOrBrowse.Panel1
            // 
            this.scListOrBrowse.Panel1.Controls.Add(this.tlpTopMost);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Size = new System.Drawing.Size(1291, 662);
            this.scListOrBrowse.SplitterDistance = 1250;
            this.scListOrBrowse.SplitterWidth = 5;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tlpTopMost
            // 
            this.tlpTopMost.ColumnCount = 6;
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 23F));
            this.tlpTopMost.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4F));
            this.tlpTopMost.Controls.Add(this.txtProcedureNmBack, 4, 15);
            this.tlpTopMost.Controls.Add(this.txtProcedureNmFront, 3, 15);
            this.tlpTopMost.Controls.Add(this.txtReportFileNmBack, 2, 15);
            this.tlpTopMost.Controls.Add(this.txtReportFileNmFront, 1, 15);
            this.tlpTopMost.Controls.Add(this.tlpTop, 2, 14);
            this.tlpTopMost.Controls.Add(this.txtBottomLinePart2Text, 3, 12);
            this.tlpTopMost.Controls.Add(this.cmbBottomLinePart2Type, 2, 12);
            this.tlpTopMost.Controls.Add(this.txtBottomLinePart1Text, 3, 11);
            this.tlpTopMost.Controls.Add(this.intBottomLineFontSize, 1, 11);
            this.tlpTopMost.Controls.Add(this.cmbBottomLinePart1Type, 2, 11);
            this.tlpTopMost.Controls.Add(this.cmbBottomLinePartsSeparator, 4, 11);
            this.tlpTopMost.Controls.Add(this.txtMiddleLinePart2Text, 3, 9);
            this.tlpTopMost.Controls.Add(this.cmbMiddleLinePart2Type, 2, 9);
            this.tlpTopMost.Controls.Add(this.txtMiddleLinePart1Text, 3, 8);
            this.tlpTopMost.Controls.Add(this.intMiddleLineFontSize, 1, 8);
            this.tlpTopMost.Controls.Add(this.cmbMiddleLinePart1Type, 2, 8);
            this.tlpTopMost.Controls.Add(this.cmbMiddleLinePartsSeparator, 4, 8);
            this.tlpTopMost.Controls.Add(this.txtTopLinePart2Text, 3, 6);
            this.tlpTopMost.Controls.Add(this.cmbTopLinePart2Type, 2, 6);
            this.tlpTopMost.Controls.Add(this.txtTopLinePart1Text, 3, 5);
            this.tlpTopMost.Controls.Add(this.intTopLineFontSize, 1, 5);
            this.tlpTopMost.Controls.Add(this.lkpBackgroundColourId, 4, 3);
            this.tlpTopMost.Controls.Add(this.txtBadgeTemplateNm, 2, 1);
            this.tlpTopMost.Controls.Add(this.txtBadgeTemplateId, 1, 1);
            this.tlpTopMost.Controls.Add(this.lkpForegroundColourId, 2, 3);
            this.tlpTopMost.Controls.Add(this.cmbForegroundColourControl, 1, 3);
            this.tlpTopMost.Controls.Add(this.cmbBackgroundColourControl, 3, 3);
            this.tlpTopMost.Controls.Add(this.cmbTopLinePart1Type, 2, 5);
            this.tlpTopMost.Controls.Add(this.cmbTopLinePartsSeparator, 4, 5);
            this.tlpTopMost.Controls.Add(this.cmbInformationType, 4, 1);
            this.tlpTopMost.Controls.Add(this.cmbBadgeShape, 3, 1);
            this.tlpTopMost.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTopMost.Location = new System.Drawing.Point(0, 0);
            this.tlpTopMost.Margin = new System.Windows.Forms.Padding(4);
            this.tlpTopMost.Name = "tlpTopMost";
            this.tlpTopMost.RowCount = 17;
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 4.792269F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 2.587826F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 2.665461F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 2.745425F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 2.827787F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 1.672862F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 8.736059F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.667634F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 4.792271F));
            this.tlpTopMost.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.tlpTopMost.Size = new System.Drawing.Size(1250, 662);
            this.tlpTopMost.TabIndex = 4;
            this.tlpTopMost.Validating += new System.ComponentModel.CancelEventHandler(this.FontSize_Validating);
            // 
            // txtProcedureNmBack
            // 
            this.txtProcedureNmBack.AllowsNew = false;
            this.txtProcedureNmBack.AllowsReference = false;
            this.txtProcedureNmBack.AllowsUpdate = false;
            this.txtProcedureNmBack.ApplicationIdForDbConnection = null;
            this.txtProcedureNmBack.BackColor = System.Drawing.Color.Transparent;
            this.txtProcedureNmBack.CalledScreenApplicationId = null;
            this.txtProcedureNmBack.CalledScreenTypeName = null;
            this.txtProcedureNmBack.CallingScreenType = null;
            this.txtProcedureNmBack.DisplayText = "";
            this.txtProcedureNmBack.DisplayTextBindingKey = "procedure_nm_back";
            this.txtProcedureNmBack.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtProcedureNmBack.EditingControlDataGridView = null;
            this.txtProcedureNmBack.EditingControlFormattedValue = "";
            this.txtProcedureNmBack.EditingControlRowIndex = 0;
            this.txtProcedureNmBack.EditingControlValueChanged = false;
            this.txtProcedureNmBack.EnableToolTip = false;
            this.txtProcedureNmBack.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtProcedureNmBack.IdText = null;
            this.txtProcedureNmBack.IdTextBindingKey = null;
            this.txtProcedureNmBack.Location = new System.Drawing.Point(916, 573);
            this.txtProcedureNmBack.Lookup = false;
            this.txtProcedureNmBack.LookupColumns = null;
            this.txtProcedureNmBack.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtProcedureNmBack.LookupResult = null;
            this.txtProcedureNmBack.Mandatory = false;
            this.txtProcedureNmBack.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtProcedureNmBack.MaxCharacterLength = 100;
            this.txtProcedureNmBack.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtProcedureNmBack.MinCharactersForQuery = 0;
            this.txtProcedureNmBack.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtProcedureNmBack.Name = "txtProcedureNmBack";
            this.txtProcedureNmBack.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtProcedureNmBack.PascalCase = false;
            this.txtProcedureNmBack.RangeInQueryMode = false;
            this.txtProcedureNmBack.ReadOnly = false;
            this.txtProcedureNmBack.RegularExpressionValidator = null;
            this.txtProcedureNmBack.Size = new System.Drawing.Size(277, 42);
            this.txtProcedureNmBack.TabIndex = 44;
            this.txtProcedureNmBack.Title = "Procedure Name Back";
            this.txtProcedureNmBack.ToolTipLookupField = "information";
            this.txtProcedureNmBack.ValueText = null;
            // 
            // txtProcedureNmFront
            // 
            this.txtProcedureNmFront.AllowsNew = false;
            this.txtProcedureNmFront.AllowsReference = false;
            this.txtProcedureNmFront.AllowsUpdate = false;
            this.txtProcedureNmFront.ApplicationIdForDbConnection = null;
            this.txtProcedureNmFront.BackColor = System.Drawing.Color.Transparent;
            this.txtProcedureNmFront.CalledScreenApplicationId = null;
            this.txtProcedureNmFront.CalledScreenTypeName = null;
            this.txtProcedureNmFront.CallingScreenType = null;
            this.txtProcedureNmFront.DisplayText = "";
            this.txtProcedureNmFront.DisplayTextBindingKey = "procedure_nm_front";
            this.txtProcedureNmFront.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtProcedureNmFront.EditingControlDataGridView = null;
            this.txtProcedureNmFront.EditingControlFormattedValue = "";
            this.txtProcedureNmFront.EditingControlRowIndex = 0;
            this.txtProcedureNmFront.EditingControlValueChanged = false;
            this.txtProcedureNmFront.EnableToolTip = false;
            this.txtProcedureNmFront.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtProcedureNmFront.IdText = null;
            this.txtProcedureNmFront.IdTextBindingKey = null;
            this.txtProcedureNmFront.Location = new System.Drawing.Point(629, 573);
            this.txtProcedureNmFront.Lookup = false;
            this.txtProcedureNmFront.LookupColumns = null;
            this.txtProcedureNmFront.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtProcedureNmFront.LookupResult = null;
            this.txtProcedureNmFront.Mandatory = true;
            this.txtProcedureNmFront.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtProcedureNmFront.MaxCharacterLength = 100;
            this.txtProcedureNmFront.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtProcedureNmFront.MinCharactersForQuery = 0;
            this.txtProcedureNmFront.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtProcedureNmFront.Name = "txtProcedureNmFront";
            this.txtProcedureNmFront.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtProcedureNmFront.PascalCase = false;
            this.txtProcedureNmFront.RangeInQueryMode = false;
            this.txtProcedureNmFront.ReadOnly = false;
            this.txtProcedureNmFront.RegularExpressionValidator = null;
            this.txtProcedureNmFront.Size = new System.Drawing.Size(277, 42);
            this.txtProcedureNmFront.TabIndex = 43;
            this.txtProcedureNmFront.Title = "Procedure Name Front";
            this.txtProcedureNmFront.ToolTipLookupField = "information";
            this.txtProcedureNmFront.ValueText = null;
            // 
            // txtReportFileNmBack
            // 
            this.txtReportFileNmBack.AllowsNew = false;
            this.txtReportFileNmBack.AllowsReference = false;
            this.txtReportFileNmBack.AllowsUpdate = false;
            this.txtReportFileNmBack.ApplicationIdForDbConnection = null;
            this.txtReportFileNmBack.BackColor = System.Drawing.Color.Transparent;
            this.txtReportFileNmBack.CalledScreenApplicationId = null;
            this.txtReportFileNmBack.CalledScreenTypeName = null;
            this.txtReportFileNmBack.CallingScreenType = null;
            this.txtReportFileNmBack.DisplayText = "";
            this.txtReportFileNmBack.DisplayTextBindingKey = "report_file_nm_back";
            this.txtReportFileNmBack.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtReportFileNmBack.EditingControlDataGridView = null;
            this.txtReportFileNmBack.EditingControlFormattedValue = "";
            this.txtReportFileNmBack.EditingControlRowIndex = 0;
            this.txtReportFileNmBack.EditingControlValueChanged = false;
            this.txtReportFileNmBack.EnableToolTip = false;
            this.txtReportFileNmBack.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtReportFileNmBack.IdText = null;
            this.txtReportFileNmBack.IdTextBindingKey = null;
            this.txtReportFileNmBack.Location = new System.Drawing.Point(342, 573);
            this.txtReportFileNmBack.Lookup = false;
            this.txtReportFileNmBack.LookupColumns = null;
            this.txtReportFileNmBack.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtReportFileNmBack.LookupResult = null;
            this.txtReportFileNmBack.Mandatory = false;
            this.txtReportFileNmBack.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtReportFileNmBack.MaxCharacterLength = 100;
            this.txtReportFileNmBack.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtReportFileNmBack.MinCharactersForQuery = 0;
            this.txtReportFileNmBack.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtReportFileNmBack.Name = "txtReportFileNmBack";
            this.txtReportFileNmBack.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtReportFileNmBack.PascalCase = false;
            this.txtReportFileNmBack.RangeInQueryMode = false;
            this.txtReportFileNmBack.ReadOnly = false;
            this.txtReportFileNmBack.RegularExpressionValidator = null;
            this.txtReportFileNmBack.Size = new System.Drawing.Size(277, 42);
            this.txtReportFileNmBack.TabIndex = 42;
            this.txtReportFileNmBack.Title = "Report File Name Back";
            this.txtReportFileNmBack.ToolTipLookupField = "information";
            this.txtReportFileNmBack.ValueText = null;
            // 
            // txtReportFileNmFront
            // 
            this.txtReportFileNmFront.AllowsNew = false;
            this.txtReportFileNmFront.AllowsReference = false;
            this.txtReportFileNmFront.AllowsUpdate = false;
            this.txtReportFileNmFront.ApplicationIdForDbConnection = null;
            this.txtReportFileNmFront.BackColor = System.Drawing.Color.Transparent;
            this.txtReportFileNmFront.CalledScreenApplicationId = null;
            this.txtReportFileNmFront.CalledScreenTypeName = null;
            this.txtReportFileNmFront.CallingScreenType = null;
            this.txtReportFileNmFront.DisplayText = "";
            this.txtReportFileNmFront.DisplayTextBindingKey = "report_file_nm_front";
            this.txtReportFileNmFront.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtReportFileNmFront.EditingControlDataGridView = null;
            this.txtReportFileNmFront.EditingControlFormattedValue = "";
            this.txtReportFileNmFront.EditingControlRowIndex = 0;
            this.txtReportFileNmFront.EditingControlValueChanged = false;
            this.txtReportFileNmFront.EnableToolTip = false;
            this.txtReportFileNmFront.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtReportFileNmFront.IdText = null;
            this.txtReportFileNmFront.IdTextBindingKey = null;
            this.txtReportFileNmFront.Location = new System.Drawing.Point(55, 573);
            this.txtReportFileNmFront.Lookup = false;
            this.txtReportFileNmFront.LookupColumns = null;
            this.txtReportFileNmFront.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtReportFileNmFront.LookupResult = null;
            this.txtReportFileNmFront.Mandatory = true;
            this.txtReportFileNmFront.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtReportFileNmFront.MaxCharacterLength = 100;
            this.txtReportFileNmFront.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtReportFileNmFront.MinCharactersForQuery = 0;
            this.txtReportFileNmFront.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtReportFileNmFront.Name = "txtReportFileNmFront";
            this.txtReportFileNmFront.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtReportFileNmFront.PascalCase = false;
            this.txtReportFileNmFront.RangeInQueryMode = false;
            this.txtReportFileNmFront.ReadOnly = false;
            this.txtReportFileNmFront.RegularExpressionValidator = null;
            this.txtReportFileNmFront.Size = new System.Drawing.Size(277, 42);
            this.txtReportFileNmFront.TabIndex = 41;
            this.txtReportFileNmFront.Title = "Report File Name Front";
            this.txtReportFileNmFront.ToolTipLookupField = "information";
            this.txtReportFileNmFront.ValueText = null;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 3;
            this.tlpTopMost.SetColumnSpan(this.tlpTop, 2);
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 27F));
            this.tlpTop.Controls.Add(this.txtExpiryYear, 1, 0);
            this.tlpTop.Controls.Add(this.chkAreOutstaionAllowed, 0, 0);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(338, 513);
            this.tlpTop.Margin = new System.Windows.Forms.Padding(1);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 1;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpTop.Size = new System.Drawing.Size(572, 55);
            this.tlpTop.TabIndex = 40;
            // 
            // txtExpiryYear
            // 
            this.txtExpiryYear.AllowsNew = false;
            this.txtExpiryYear.AllowsReference = false;
            this.txtExpiryYear.AllowsUpdate = false;
            this.txtExpiryYear.ApplicationIdForDbConnection = null;
            this.txtExpiryYear.BackColor = System.Drawing.Color.Transparent;
            this.txtExpiryYear.CalledScreenApplicationId = null;
            this.txtExpiryYear.CalledScreenTypeName = null;
            this.txtExpiryYear.CallingScreenType = null;
            this.txtExpiryYear.DisplayText = "";
            this.txtExpiryYear.DisplayTextBindingKey = "expiry_year";
            this.txtExpiryYear.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtExpiryYear.EditingControlDataGridView = null;
            this.txtExpiryYear.EditingControlFormattedValue = "";
            this.txtExpiryYear.EditingControlRowIndex = 0;
            this.txtExpiryYear.EditingControlValueChanged = false;
            this.txtExpiryYear.EnableToolTip = false;
            this.txtExpiryYear.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtExpiryYear.IdText = null;
            this.txtExpiryYear.IdTextBindingKey = null;
            this.txtExpiryYear.Location = new System.Drawing.Point(195, 4);
            this.txtExpiryYear.Lookup = false;
            this.txtExpiryYear.LookupColumns = null;
            this.txtExpiryYear.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtExpiryYear.LookupResult = null;
            this.txtExpiryYear.Mandatory = false;
            this.txtExpiryYear.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtExpiryYear.MaxCharacterLength = 4;
            this.txtExpiryYear.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtExpiryYear.MinCharactersForQuery = 0;
            this.txtExpiryYear.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtExpiryYear.Name = "txtExpiryYear";
            this.txtExpiryYear.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtExpiryYear.PascalCase = false;
            this.txtExpiryYear.RangeInQueryMode = false;
            this.txtExpiryYear.ReadOnly = false;
            this.txtExpiryYear.RegularExpressionValidator = "[0-9][0-9][0-9][0-9]";
            this.txtExpiryYear.Size = new System.Drawing.Size(180, 47);
            this.txtExpiryYear.TabIndex = 40;
            this.txtExpiryYear.Title = "Expiry Year";
            this.txtExpiryYear.ToolTipLookupField = "information";
            this.txtExpiryYear.ValueText = null;
            // 
            // txtBottomLinePart2Text
            // 
            this.txtBottomLinePart2Text.AllowsNew = false;
            this.txtBottomLinePart2Text.AllowsReference = false;
            this.txtBottomLinePart2Text.AllowsUpdate = false;
            this.txtBottomLinePart2Text.ApplicationIdForDbConnection = null;
            this.txtBottomLinePart2Text.BackColor = System.Drawing.Color.Transparent;
            this.txtBottomLinePart2Text.CalledScreenApplicationId = null;
            this.txtBottomLinePart2Text.CalledScreenTypeName = null;
            this.txtBottomLinePart2Text.CallingScreenType = null;
            this.txtBottomLinePart2Text.DisplayText = "";
            this.txtBottomLinePart2Text.DisplayTextBindingKey = "bottom_line_part_2_text";
            this.txtBottomLinePart2Text.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtBottomLinePart2Text.EditingControlDataGridView = null;
            this.txtBottomLinePart2Text.EditingControlFormattedValue = "";
            this.txtBottomLinePart2Text.EditingControlRowIndex = 0;
            this.txtBottomLinePart2Text.EditingControlValueChanged = false;
            this.txtBottomLinePart2Text.EnableToolTip = false;
            this.txtBottomLinePart2Text.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBottomLinePart2Text.IdText = null;
            this.txtBottomLinePart2Text.IdTextBindingKey = null;
            this.txtBottomLinePart2Text.Location = new System.Drawing.Point(629, 455);
            this.txtBottomLinePart2Text.Lookup = false;
            this.txtBottomLinePart2Text.LookupColumns = null;
            this.txtBottomLinePart2Text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtBottomLinePart2Text.LookupResult = null;
            this.txtBottomLinePart2Text.Mandatory = false;
            this.txtBottomLinePart2Text.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtBottomLinePart2Text.MaxCharacterLength = 40;
            this.txtBottomLinePart2Text.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtBottomLinePart2Text.MinCharactersForQuery = 0;
            this.txtBottomLinePart2Text.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtBottomLinePart2Text.Name = "txtBottomLinePart2Text";
            this.txtBottomLinePart2Text.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtBottomLinePart2Text.PascalCase = false;
            this.txtBottomLinePart2Text.RangeInQueryMode = false;
            this.txtBottomLinePart2Text.ReadOnly = false;
            this.txtBottomLinePart2Text.RegularExpressionValidator = null;
            this.txtBottomLinePart2Text.Size = new System.Drawing.Size(277, 42);
            this.txtBottomLinePart2Text.TabIndex = 39;
            this.txtBottomLinePart2Text.Title = "Bottom Line Part 2 Text";
            this.txtBottomLinePart2Text.ToolTipLookupField = "information";
            this.txtBottomLinePart2Text.ValueText = null;
            // 
            // cmbBottomLinePart2Type
            // 
            this.cmbBottomLinePart2Type.ApplicationIdForDbConnection = null;
            this.cmbBottomLinePart2Type.BackColor = System.Drawing.Color.Transparent;
            this.cmbBottomLinePart2Type.DisplayText = "";
            this.cmbBottomLinePart2Type.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbBottomLinePart2Type.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbBottomLinePart2Type.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbBottomLinePart2Type.isGlobal = false;
            this.cmbBottomLinePart2Type.Location = new System.Drawing.Point(342, 455);
            this.cmbBottomLinePart2Type.Mandatory = false;
            this.cmbBottomLinePart2Type.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbBottomLinePart2Type.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbBottomLinePart2Type.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbBottomLinePart2Type.Name = "cmbBottomLinePart2Type";
            this.cmbBottomLinePart2Type.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbBottomLinePart2Type.ReadOnly = false;
            this.cmbBottomLinePart2Type.SelectedIndex = -1;
            this.cmbBottomLinePart2Type.SelectedItem = null;
            this.cmbBottomLinePart2Type.SelectedText = "";
            this.cmbBottomLinePart2Type.SelectedValue = null;
            this.cmbBottomLinePart2Type.SelectedValueBindingKey = "bottom_line_part_2_type";
            this.cmbBottomLinePart2Type.Size = new System.Drawing.Size(277, 42);
            this.cmbBottomLinePart2Type.TabIndex = 38;
            this.cmbBottomLinePart2Type.Title = "Bottom Line Part 2 Type";
            this.cmbBottomLinePart2Type.ValueText = null;
            // 
            // txtBottomLinePart1Text
            // 
            this.txtBottomLinePart1Text.AllowsNew = false;
            this.txtBottomLinePart1Text.AllowsReference = false;
            this.txtBottomLinePart1Text.AllowsUpdate = false;
            this.txtBottomLinePart1Text.ApplicationIdForDbConnection = null;
            this.txtBottomLinePart1Text.BackColor = System.Drawing.Color.Transparent;
            this.txtBottomLinePart1Text.CalledScreenApplicationId = null;
            this.txtBottomLinePart1Text.CalledScreenTypeName = null;
            this.txtBottomLinePart1Text.CallingScreenType = null;
            this.txtBottomLinePart1Text.DisplayText = "";
            this.txtBottomLinePart1Text.DisplayTextBindingKey = "bottom_line_part_1_text";
            this.txtBottomLinePart1Text.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtBottomLinePart1Text.EditingControlDataGridView = null;
            this.txtBottomLinePart1Text.EditingControlFormattedValue = "";
            this.txtBottomLinePart1Text.EditingControlRowIndex = 0;
            this.txtBottomLinePart1Text.EditingControlValueChanged = false;
            this.txtBottomLinePart1Text.EnableToolTip = false;
            this.txtBottomLinePart1Text.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBottomLinePart1Text.IdText = null;
            this.txtBottomLinePart1Text.IdTextBindingKey = null;
            this.txtBottomLinePart1Text.Location = new System.Drawing.Point(629, 405);
            this.txtBottomLinePart1Text.Lookup = false;
            this.txtBottomLinePart1Text.LookupColumns = null;
            this.txtBottomLinePart1Text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtBottomLinePart1Text.LookupResult = null;
            this.txtBottomLinePart1Text.Mandatory = false;
            this.txtBottomLinePart1Text.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtBottomLinePart1Text.MaxCharacterLength = 40;
            this.txtBottomLinePart1Text.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtBottomLinePart1Text.MinCharactersForQuery = 0;
            this.txtBottomLinePart1Text.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtBottomLinePart1Text.Name = "txtBottomLinePart1Text";
            this.txtBottomLinePart1Text.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtBottomLinePart1Text.PascalCase = false;
            this.txtBottomLinePart1Text.RangeInQueryMode = false;
            this.txtBottomLinePart1Text.ReadOnly = false;
            this.txtBottomLinePart1Text.RegularExpressionValidator = null;
            this.txtBottomLinePart1Text.Size = new System.Drawing.Size(277, 42);
            this.txtBottomLinePart1Text.TabIndex = 36;
            this.txtBottomLinePart1Text.Title = "Bottom Line Part 1 Text";
            this.txtBottomLinePart1Text.ToolTipLookupField = "information";
            this.txtBottomLinePart1Text.ValueText = null;
            // 
            // intBottomLineFontSize
            // 
            this.intBottomLineFontSize.AllowsNew = false;
            this.intBottomLineFontSize.AllowsReference = false;
            this.intBottomLineFontSize.AllowsUpdate = false;
            this.intBottomLineFontSize.ApplicationIdForDbConnection = null;
            this.intBottomLineFontSize.BackColor = System.Drawing.Color.Transparent;
            this.intBottomLineFontSize.CalledScreenApplicationId = null;
            this.intBottomLineFontSize.CalledScreenTypeName = null;
            this.intBottomLineFontSize.CallingScreenType = null;
            this.intBottomLineFontSize.DisplayText = "";
            this.intBottomLineFontSize.DisplayTextBindingKey = "bottom_line_font_size";
            this.intBottomLineFontSize.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intBottomLineFontSize.EditingControlDataGridView = null;
            this.intBottomLineFontSize.EditingControlFormattedValue = "";
            this.intBottomLineFontSize.EditingControlRowIndex = 0;
            this.intBottomLineFontSize.EditingControlValueChanged = false;
            this.intBottomLineFontSize.EnableToolTip = false;
            this.intBottomLineFontSize.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intBottomLineFontSize.IdText = null;
            this.intBottomLineFontSize.IdTextBindingKey = null;
            this.intBottomLineFontSize.Location = new System.Drawing.Point(55, 405);
            this.intBottomLineFontSize.Lookup = false;
            this.intBottomLineFontSize.LookupColumns = null;
            this.intBottomLineFontSize.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intBottomLineFontSize.LookupResult = null;
            this.intBottomLineFontSize.Mandatory = true;
            this.intBottomLineFontSize.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intBottomLineFontSize.MaxCharacterLength = 2;
            this.intBottomLineFontSize.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intBottomLineFontSize.MaxValue = ((long)(9223372036854775807));
            this.intBottomLineFontSize.MinCharactersForQuery = 0;
            this.intBottomLineFontSize.MinimumSize = new System.Drawing.Size(13, 27);
            this.intBottomLineFontSize.MinValue = ((long)(-9223372036854775808));
            this.intBottomLineFontSize.Name = "intBottomLineFontSize";
            this.intBottomLineFontSize.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intBottomLineFontSize.PascalCase = false;
            this.intBottomLineFontSize.RangeInQueryMode = false;
            this.intBottomLineFontSize.ReadOnly = false;
            this.intBottomLineFontSize.RegularExpressionValidator = null;
            this.intBottomLineFontSize.Size = new System.Drawing.Size(277, 42);
            this.intBottomLineFontSize.TabIndex = 34;
            this.intBottomLineFontSize.Title = "Bottom Line Font Size";
            this.intBottomLineFontSize.ToolTipLookupField = "information";
            this.intBottomLineFontSize.ValueText = null;
            this.intBottomLineFontSize.Validating += new System.ComponentModel.CancelEventHandler(this.FontSize_Validating);
            // 
            // cmbBottomLinePart1Type
            // 
            this.cmbBottomLinePart1Type.ApplicationIdForDbConnection = null;
            this.cmbBottomLinePart1Type.BackColor = System.Drawing.Color.Transparent;
            this.cmbBottomLinePart1Type.DisplayText = "";
            this.cmbBottomLinePart1Type.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbBottomLinePart1Type.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbBottomLinePart1Type.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbBottomLinePart1Type.isGlobal = false;
            this.cmbBottomLinePart1Type.Location = new System.Drawing.Point(342, 405);
            this.cmbBottomLinePart1Type.Mandatory = true;
            this.cmbBottomLinePart1Type.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbBottomLinePart1Type.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbBottomLinePart1Type.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbBottomLinePart1Type.Name = "cmbBottomLinePart1Type";
            this.cmbBottomLinePart1Type.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbBottomLinePart1Type.ReadOnly = false;
            this.cmbBottomLinePart1Type.SelectedIndex = -1;
            this.cmbBottomLinePart1Type.SelectedItem = null;
            this.cmbBottomLinePart1Type.SelectedText = "";
            this.cmbBottomLinePart1Type.SelectedValue = null;
            this.cmbBottomLinePart1Type.SelectedValueBindingKey = "bottom_line_part_1_type";
            this.cmbBottomLinePart1Type.Size = new System.Drawing.Size(277, 42);
            this.cmbBottomLinePart1Type.TabIndex = 35;
            this.cmbBottomLinePart1Type.Title = "Bottom Line Part 1 Type";
            this.cmbBottomLinePart1Type.ValueText = null;
            // 
            // cmbBottomLinePartsSeparator
            // 
            this.cmbBottomLinePartsSeparator.ApplicationIdForDbConnection = null;
            this.cmbBottomLinePartsSeparator.BackColor = System.Drawing.Color.Transparent;
            this.cmbBottomLinePartsSeparator.DisplayText = ".......";
            this.cmbBottomLinePartsSeparator.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbBottomLinePartsSeparator.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbBottomLinePartsSeparator.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbBottomLinePartsSeparator.Location = new System.Drawing.Point(916, 405);
            this.cmbBottomLinePartsSeparator.Mandatory = false;
            this.cmbBottomLinePartsSeparator.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbBottomLinePartsSeparator.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbBottomLinePartsSeparator.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbBottomLinePartsSeparator.Name = "cmbBottomLinePartsSeparator";
            this.cmbBottomLinePartsSeparator.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbBottomLinePartsSeparator.ReadOnly = false;
            this.cmbBottomLinePartsSeparator.SelectedIndex = 0;
            this.cmbBottomLinePartsSeparator.SelectedText = ".......";
            this.cmbBottomLinePartsSeparator.SelectedValue = null;
            this.cmbBottomLinePartsSeparator.SelectedValueBindingKey = "bottom_line_parts_separator";
            this.cmbBottomLinePartsSeparator.Size = new System.Drawing.Size(277, 42);
            this.cmbBottomLinePartsSeparator.TabIndex = 37;
            this.cmbBottomLinePartsSeparator.Title = "Bottom Line Parts Separator";
            this.cmbBottomLinePartsSeparator.ValueText = null;
            // 
            // txtMiddleLinePart2Text
            // 
            this.txtMiddleLinePart2Text.AllowsNew = false;
            this.txtMiddleLinePart2Text.AllowsReference = false;
            this.txtMiddleLinePart2Text.AllowsUpdate = false;
            this.txtMiddleLinePart2Text.ApplicationIdForDbConnection = null;
            this.txtMiddleLinePart2Text.BackColor = System.Drawing.Color.Transparent;
            this.txtMiddleLinePart2Text.CalledScreenApplicationId = null;
            this.txtMiddleLinePart2Text.CalledScreenTypeName = null;
            this.txtMiddleLinePart2Text.CallingScreenType = null;
            this.txtMiddleLinePart2Text.DisplayText = "";
            this.txtMiddleLinePart2Text.DisplayTextBindingKey = "middle_line_part_2_text";
            this.txtMiddleLinePart2Text.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtMiddleLinePart2Text.EditingControlDataGridView = null;
            this.txtMiddleLinePart2Text.EditingControlFormattedValue = "";
            this.txtMiddleLinePart2Text.EditingControlRowIndex = 0;
            this.txtMiddleLinePart2Text.EditingControlValueChanged = false;
            this.txtMiddleLinePart2Text.EnableToolTip = false;
            this.txtMiddleLinePart2Text.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMiddleLinePart2Text.IdText = null;
            this.txtMiddleLinePart2Text.IdTextBindingKey = null;
            this.txtMiddleLinePart2Text.Location = new System.Drawing.Point(629, 337);
            this.txtMiddleLinePart2Text.Lookup = false;
            this.txtMiddleLinePart2Text.LookupColumns = null;
            this.txtMiddleLinePart2Text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtMiddleLinePart2Text.LookupResult = null;
            this.txtMiddleLinePart2Text.Mandatory = false;
            this.txtMiddleLinePart2Text.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtMiddleLinePart2Text.MaxCharacterLength = 40;
            this.txtMiddleLinePart2Text.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtMiddleLinePart2Text.MinCharactersForQuery = 0;
            this.txtMiddleLinePart2Text.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtMiddleLinePart2Text.Name = "txtMiddleLinePart2Text";
            this.txtMiddleLinePart2Text.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtMiddleLinePart2Text.PascalCase = false;
            this.txtMiddleLinePart2Text.RangeInQueryMode = false;
            this.txtMiddleLinePart2Text.ReadOnly = false;
            this.txtMiddleLinePart2Text.RegularExpressionValidator = null;
            this.txtMiddleLinePart2Text.Size = new System.Drawing.Size(277, 42);
            this.txtMiddleLinePart2Text.TabIndex = 33;
            this.txtMiddleLinePart2Text.Title = "Middle Line Part 2 Text";
            this.txtMiddleLinePart2Text.ToolTipLookupField = "information";
            this.txtMiddleLinePart2Text.ValueText = null;
            // 
            // cmbMiddleLinePart2Type
            // 
            this.cmbMiddleLinePart2Type.ApplicationIdForDbConnection = null;
            this.cmbMiddleLinePart2Type.BackColor = System.Drawing.Color.Transparent;
            this.cmbMiddleLinePart2Type.DisplayText = "";
            this.cmbMiddleLinePart2Type.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbMiddleLinePart2Type.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMiddleLinePart2Type.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbMiddleLinePart2Type.isGlobal = false;
            this.cmbMiddleLinePart2Type.Location = new System.Drawing.Point(342, 337);
            this.cmbMiddleLinePart2Type.Mandatory = false;
            this.cmbMiddleLinePart2Type.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbMiddleLinePart2Type.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbMiddleLinePart2Type.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbMiddleLinePart2Type.Name = "cmbMiddleLinePart2Type";
            this.cmbMiddleLinePart2Type.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbMiddleLinePart2Type.ReadOnly = false;
            this.cmbMiddleLinePart2Type.SelectedIndex = -1;
            this.cmbMiddleLinePart2Type.SelectedItem = null;
            this.cmbMiddleLinePart2Type.SelectedText = "";
            this.cmbMiddleLinePart2Type.SelectedValue = null;
            this.cmbMiddleLinePart2Type.SelectedValueBindingKey = "middle_line_part_2_type";
            this.cmbMiddleLinePart2Type.Size = new System.Drawing.Size(277, 42);
            this.cmbMiddleLinePart2Type.TabIndex = 32;
            this.cmbMiddleLinePart2Type.Title = "Middle Line Part 2 Type";
            this.cmbMiddleLinePart2Type.ValueText = null;
            // 
            // txtMiddleLinePart1Text
            // 
            this.txtMiddleLinePart1Text.AllowsNew = false;
            this.txtMiddleLinePart1Text.AllowsReference = false;
            this.txtMiddleLinePart1Text.AllowsUpdate = false;
            this.txtMiddleLinePart1Text.ApplicationIdForDbConnection = null;
            this.txtMiddleLinePart1Text.BackColor = System.Drawing.Color.Transparent;
            this.txtMiddleLinePart1Text.CalledScreenApplicationId = null;
            this.txtMiddleLinePart1Text.CalledScreenTypeName = null;
            this.txtMiddleLinePart1Text.CallingScreenType = null;
            this.txtMiddleLinePart1Text.DisplayText = "";
            this.txtMiddleLinePart1Text.DisplayTextBindingKey = "middle_line_part_1_text";
            this.txtMiddleLinePart1Text.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtMiddleLinePart1Text.EditingControlDataGridView = null;
            this.txtMiddleLinePart1Text.EditingControlFormattedValue = "";
            this.txtMiddleLinePart1Text.EditingControlRowIndex = 0;
            this.txtMiddleLinePart1Text.EditingControlValueChanged = false;
            this.txtMiddleLinePart1Text.EnableToolTip = false;
            this.txtMiddleLinePart1Text.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMiddleLinePart1Text.IdText = null;
            this.txtMiddleLinePart1Text.IdTextBindingKey = null;
            this.txtMiddleLinePart1Text.Location = new System.Drawing.Point(629, 287);
            this.txtMiddleLinePart1Text.Lookup = false;
            this.txtMiddleLinePart1Text.LookupColumns = null;
            this.txtMiddleLinePart1Text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtMiddleLinePart1Text.LookupResult = null;
            this.txtMiddleLinePart1Text.Mandatory = false;
            this.txtMiddleLinePart1Text.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtMiddleLinePart1Text.MaxCharacterLength = 40;
            this.txtMiddleLinePart1Text.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtMiddleLinePart1Text.MinCharactersForQuery = 0;
            this.txtMiddleLinePart1Text.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtMiddleLinePart1Text.Name = "txtMiddleLinePart1Text";
            this.txtMiddleLinePart1Text.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtMiddleLinePart1Text.PascalCase = false;
            this.txtMiddleLinePart1Text.RangeInQueryMode = false;
            this.txtMiddleLinePart1Text.ReadOnly = false;
            this.txtMiddleLinePart1Text.RegularExpressionValidator = null;
            this.txtMiddleLinePart1Text.Size = new System.Drawing.Size(277, 42);
            this.txtMiddleLinePart1Text.TabIndex = 30;
            this.txtMiddleLinePart1Text.Title = "Middle Line Part 1 Text";
            this.txtMiddleLinePart1Text.ToolTipLookupField = "information";
            this.txtMiddleLinePart1Text.ValueText = null;
            // 
            // intMiddleLineFontSize
            // 
            this.intMiddleLineFontSize.AllowsNew = false;
            this.intMiddleLineFontSize.AllowsReference = false;
            this.intMiddleLineFontSize.AllowsUpdate = false;
            this.intMiddleLineFontSize.ApplicationIdForDbConnection = null;
            this.intMiddleLineFontSize.BackColor = System.Drawing.Color.Transparent;
            this.intMiddleLineFontSize.CalledScreenApplicationId = null;
            this.intMiddleLineFontSize.CalledScreenTypeName = null;
            this.intMiddleLineFontSize.CallingScreenType = null;
            this.intMiddleLineFontSize.DisplayText = "";
            this.intMiddleLineFontSize.DisplayTextBindingKey = "middle_line_font_size";
            this.intMiddleLineFontSize.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intMiddleLineFontSize.EditingControlDataGridView = null;
            this.intMiddleLineFontSize.EditingControlFormattedValue = "";
            this.intMiddleLineFontSize.EditingControlRowIndex = 0;
            this.intMiddleLineFontSize.EditingControlValueChanged = false;
            this.intMiddleLineFontSize.EnableToolTip = false;
            this.intMiddleLineFontSize.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intMiddleLineFontSize.IdText = null;
            this.intMiddleLineFontSize.IdTextBindingKey = null;
            this.intMiddleLineFontSize.Location = new System.Drawing.Point(55, 287);
            this.intMiddleLineFontSize.Lookup = false;
            this.intMiddleLineFontSize.LookupColumns = null;
            this.intMiddleLineFontSize.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intMiddleLineFontSize.LookupResult = null;
            this.intMiddleLineFontSize.Mandatory = false;
            this.intMiddleLineFontSize.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intMiddleLineFontSize.MaxCharacterLength = 2;
            this.intMiddleLineFontSize.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intMiddleLineFontSize.MaxValue = ((long)(9223372036854775807));
            this.intMiddleLineFontSize.MinCharactersForQuery = 0;
            this.intMiddleLineFontSize.MinimumSize = new System.Drawing.Size(13, 27);
            this.intMiddleLineFontSize.MinValue = ((long)(-9223372036854775808));
            this.intMiddleLineFontSize.Name = "intMiddleLineFontSize";
            this.intMiddleLineFontSize.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intMiddleLineFontSize.PascalCase = false;
            this.intMiddleLineFontSize.RangeInQueryMode = false;
            this.intMiddleLineFontSize.ReadOnly = false;
            this.intMiddleLineFontSize.RegularExpressionValidator = null;
            this.intMiddleLineFontSize.Size = new System.Drawing.Size(277, 42);
            this.intMiddleLineFontSize.TabIndex = 28;
            this.intMiddleLineFontSize.Title = "Middle Line Font Size";
            this.intMiddleLineFontSize.ToolTipLookupField = "information";
            this.intMiddleLineFontSize.ValueText = null;
            this.intMiddleLineFontSize.Validating += new System.ComponentModel.CancelEventHandler(this.FontSize_Validating);
            // 
            // cmbMiddleLinePart1Type
            // 
            this.cmbMiddleLinePart1Type.ApplicationIdForDbConnection = null;
            this.cmbMiddleLinePart1Type.BackColor = System.Drawing.Color.Transparent;
            this.cmbMiddleLinePart1Type.DisplayText = "";
            this.cmbMiddleLinePart1Type.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbMiddleLinePart1Type.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMiddleLinePart1Type.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbMiddleLinePart1Type.isGlobal = false;
            this.cmbMiddleLinePart1Type.Location = new System.Drawing.Point(342, 287);
            this.cmbMiddleLinePart1Type.Mandatory = false;
            this.cmbMiddleLinePart1Type.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbMiddleLinePart1Type.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbMiddleLinePart1Type.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbMiddleLinePart1Type.Name = "cmbMiddleLinePart1Type";
            this.cmbMiddleLinePart1Type.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbMiddleLinePart1Type.ReadOnly = false;
            this.cmbMiddleLinePart1Type.SelectedIndex = -1;
            this.cmbMiddleLinePart1Type.SelectedItem = null;
            this.cmbMiddleLinePart1Type.SelectedText = "";
            this.cmbMiddleLinePart1Type.SelectedValue = null;
            this.cmbMiddleLinePart1Type.SelectedValueBindingKey = "middle_line_part_1_type";
            this.cmbMiddleLinePart1Type.Size = new System.Drawing.Size(277, 42);
            this.cmbMiddleLinePart1Type.TabIndex = 29;
            this.cmbMiddleLinePart1Type.Title = "Middle Line Part 1 Type";
            this.cmbMiddleLinePart1Type.ValueText = null;
            // 
            // cmbMiddleLinePartsSeparator
            // 
            this.cmbMiddleLinePartsSeparator.ApplicationIdForDbConnection = null;
            this.cmbMiddleLinePartsSeparator.BackColor = System.Drawing.Color.Transparent;
            this.cmbMiddleLinePartsSeparator.DisplayText = ".......";
            this.cmbMiddleLinePartsSeparator.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbMiddleLinePartsSeparator.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMiddleLinePartsSeparator.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbMiddleLinePartsSeparator.Location = new System.Drawing.Point(916, 287);
            this.cmbMiddleLinePartsSeparator.Mandatory = false;
            this.cmbMiddleLinePartsSeparator.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbMiddleLinePartsSeparator.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbMiddleLinePartsSeparator.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbMiddleLinePartsSeparator.Name = "cmbMiddleLinePartsSeparator";
            this.cmbMiddleLinePartsSeparator.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbMiddleLinePartsSeparator.ReadOnly = false;
            this.cmbMiddleLinePartsSeparator.SelectedIndex = 0;
            this.cmbMiddleLinePartsSeparator.SelectedText = ".......";
            this.cmbMiddleLinePartsSeparator.SelectedValue = null;
            this.cmbMiddleLinePartsSeparator.SelectedValueBindingKey = "middle_line_parts_separator";
            this.cmbMiddleLinePartsSeparator.Size = new System.Drawing.Size(277, 42);
            this.cmbMiddleLinePartsSeparator.TabIndex = 31;
            this.cmbMiddleLinePartsSeparator.Title = "Middle Line Parts Separator";
            this.cmbMiddleLinePartsSeparator.ValueText = null;
            // 
            // txtTopLinePart2Text
            // 
            this.txtTopLinePart2Text.AllowsNew = false;
            this.txtTopLinePart2Text.AllowsReference = false;
            this.txtTopLinePart2Text.AllowsUpdate = false;
            this.txtTopLinePart2Text.ApplicationIdForDbConnection = null;
            this.txtTopLinePart2Text.BackColor = System.Drawing.Color.Transparent;
            this.txtTopLinePart2Text.CalledScreenApplicationId = null;
            this.txtTopLinePart2Text.CalledScreenTypeName = null;
            this.txtTopLinePart2Text.CallingScreenType = null;
            this.txtTopLinePart2Text.DisplayText = "";
            this.txtTopLinePart2Text.DisplayTextBindingKey = "top_line_part_2_text";
            this.txtTopLinePart2Text.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtTopLinePart2Text.EditingControlDataGridView = null;
            this.txtTopLinePart2Text.EditingControlFormattedValue = "";
            this.txtTopLinePart2Text.EditingControlRowIndex = 0;
            this.txtTopLinePart2Text.EditingControlValueChanged = false;
            this.txtTopLinePart2Text.EnableToolTip = false;
            this.txtTopLinePart2Text.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTopLinePart2Text.IdText = null;
            this.txtTopLinePart2Text.IdTextBindingKey = null;
            this.txtTopLinePart2Text.Location = new System.Drawing.Point(629, 219);
            this.txtTopLinePart2Text.Lookup = false;
            this.txtTopLinePart2Text.LookupColumns = null;
            this.txtTopLinePart2Text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtTopLinePart2Text.LookupResult = null;
            this.txtTopLinePart2Text.Mandatory = false;
            this.txtTopLinePart2Text.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtTopLinePart2Text.MaxCharacterLength = 40;
            this.txtTopLinePart2Text.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtTopLinePart2Text.MinCharactersForQuery = 0;
            this.txtTopLinePart2Text.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtTopLinePart2Text.Name = "txtTopLinePart2Text";
            this.txtTopLinePart2Text.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtTopLinePart2Text.PascalCase = false;
            this.txtTopLinePart2Text.RangeInQueryMode = false;
            this.txtTopLinePart2Text.ReadOnly = false;
            this.txtTopLinePart2Text.RegularExpressionValidator = null;
            this.txtTopLinePart2Text.Size = new System.Drawing.Size(277, 42);
            this.txtTopLinePart2Text.TabIndex = 27;
            this.txtTopLinePart2Text.Title = "Top Line Part 2 Text";
            this.txtTopLinePart2Text.ToolTipLookupField = "information";
            this.txtTopLinePart2Text.ValueText = null;
            // 
            // cmbTopLinePart2Type
            // 
            this.cmbTopLinePart2Type.ApplicationIdForDbConnection = null;
            this.cmbTopLinePart2Type.BackColor = System.Drawing.Color.Transparent;
            this.cmbTopLinePart2Type.DisplayText = "";
            this.cmbTopLinePart2Type.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbTopLinePart2Type.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTopLinePart2Type.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTopLinePart2Type.isGlobal = false;
            this.cmbTopLinePart2Type.Location = new System.Drawing.Point(342, 219);
            this.cmbTopLinePart2Type.Mandatory = false;
            this.cmbTopLinePart2Type.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbTopLinePart2Type.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbTopLinePart2Type.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbTopLinePart2Type.Name = "cmbTopLinePart2Type";
            this.cmbTopLinePart2Type.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbTopLinePart2Type.ReadOnly = false;
            this.cmbTopLinePart2Type.SelectedIndex = -1;
            this.cmbTopLinePart2Type.SelectedItem = null;
            this.cmbTopLinePart2Type.SelectedText = "";
            this.cmbTopLinePart2Type.SelectedValue = null;
            this.cmbTopLinePart2Type.SelectedValueBindingKey = "top_line_part_2_type";
            this.cmbTopLinePart2Type.Size = new System.Drawing.Size(277, 42);
            this.cmbTopLinePart2Type.TabIndex = 26;
            this.cmbTopLinePart2Type.Title = "Top Line Part 2 Type";
            this.cmbTopLinePart2Type.ValueText = null;
            // 
            // txtTopLinePart1Text
            // 
            this.txtTopLinePart1Text.AllowsNew = false;
            this.txtTopLinePart1Text.AllowsReference = false;
            this.txtTopLinePart1Text.AllowsUpdate = false;
            this.txtTopLinePart1Text.ApplicationIdForDbConnection = null;
            this.txtTopLinePart1Text.BackColor = System.Drawing.Color.Transparent;
            this.txtTopLinePart1Text.CalledScreenApplicationId = null;
            this.txtTopLinePart1Text.CalledScreenTypeName = null;
            this.txtTopLinePart1Text.CallingScreenType = null;
            this.txtTopLinePart1Text.DisplayText = "";
            this.txtTopLinePart1Text.DisplayTextBindingKey = "top_line_part_1_text";
            this.txtTopLinePart1Text.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtTopLinePart1Text.EditingControlDataGridView = null;
            this.txtTopLinePart1Text.EditingControlFormattedValue = "";
            this.txtTopLinePart1Text.EditingControlRowIndex = 0;
            this.txtTopLinePart1Text.EditingControlValueChanged = false;
            this.txtTopLinePart1Text.EnableToolTip = false;
            this.txtTopLinePart1Text.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTopLinePart1Text.IdText = null;
            this.txtTopLinePart1Text.IdTextBindingKey = null;
            this.txtTopLinePart1Text.Location = new System.Drawing.Point(629, 169);
            this.txtTopLinePart1Text.Lookup = false;
            this.txtTopLinePart1Text.LookupColumns = null;
            this.txtTopLinePart1Text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtTopLinePart1Text.LookupResult = null;
            this.txtTopLinePart1Text.Mandatory = false;
            this.txtTopLinePart1Text.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtTopLinePart1Text.MaxCharacterLength = 40;
            this.txtTopLinePart1Text.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtTopLinePart1Text.MinCharactersForQuery = 0;
            this.txtTopLinePart1Text.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtTopLinePart1Text.Name = "txtTopLinePart1Text";
            this.txtTopLinePart1Text.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtTopLinePart1Text.PascalCase = false;
            this.txtTopLinePart1Text.RangeInQueryMode = false;
            this.txtTopLinePart1Text.ReadOnly = false;
            this.txtTopLinePart1Text.RegularExpressionValidator = null;
            this.txtTopLinePart1Text.Size = new System.Drawing.Size(277, 42);
            this.txtTopLinePart1Text.TabIndex = 24;
            this.txtTopLinePart1Text.Title = "Top Line Part 1 Text";
            this.txtTopLinePart1Text.ToolTipLookupField = "information";
            this.txtTopLinePart1Text.ValueText = null;
            // 
            // intTopLineFontSize
            // 
            this.intTopLineFontSize.AllowsNew = false;
            this.intTopLineFontSize.AllowsReference = false;
            this.intTopLineFontSize.AllowsUpdate = false;
            this.intTopLineFontSize.ApplicationIdForDbConnection = null;
            this.intTopLineFontSize.BackColor = System.Drawing.Color.Transparent;
            this.intTopLineFontSize.CalledScreenApplicationId = null;
            this.intTopLineFontSize.CalledScreenTypeName = null;
            this.intTopLineFontSize.CallingScreenType = null;
            this.intTopLineFontSize.DisplayText = "";
            this.intTopLineFontSize.DisplayTextBindingKey = "top_line_font_size";
            this.intTopLineFontSize.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intTopLineFontSize.EditingControlDataGridView = null;
            this.intTopLineFontSize.EditingControlFormattedValue = "";
            this.intTopLineFontSize.EditingControlRowIndex = 0;
            this.intTopLineFontSize.EditingControlValueChanged = false;
            this.intTopLineFontSize.EnableToolTip = false;
            this.intTopLineFontSize.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intTopLineFontSize.IdText = null;
            this.intTopLineFontSize.IdTextBindingKey = null;
            this.intTopLineFontSize.Location = new System.Drawing.Point(55, 169);
            this.intTopLineFontSize.Lookup = false;
            this.intTopLineFontSize.LookupColumns = null;
            this.intTopLineFontSize.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intTopLineFontSize.LookupResult = null;
            this.intTopLineFontSize.Mandatory = true;
            this.intTopLineFontSize.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intTopLineFontSize.MaxCharacterLength = 2;
            this.intTopLineFontSize.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intTopLineFontSize.MaxValue = ((long)(9223372036854775807));
            this.intTopLineFontSize.MinCharactersForQuery = 0;
            this.intTopLineFontSize.MinimumSize = new System.Drawing.Size(13, 27);
            this.intTopLineFontSize.MinValue = ((long)(-9223372036854775808));
            this.intTopLineFontSize.Name = "intTopLineFontSize";
            this.intTopLineFontSize.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intTopLineFontSize.PascalCase = false;
            this.intTopLineFontSize.RangeInQueryMode = false;
            this.intTopLineFontSize.ReadOnly = false;
            this.intTopLineFontSize.RegularExpressionValidator = null;
            this.intTopLineFontSize.Size = new System.Drawing.Size(277, 42);
            this.intTopLineFontSize.TabIndex = 22;
            this.intTopLineFontSize.Title = "Top Line Font Size";
            this.intTopLineFontSize.ToolTipLookupField = "information";
            this.intTopLineFontSize.ValueText = null;
            this.intTopLineFontSize.Validating += new System.ComponentModel.CancelEventHandler(this.FontSize_Validating);
            // 
            // lkpBackgroundColourId
            // 
            this.lkpBackgroundColourId.AllowsNew = false;
            this.lkpBackgroundColourId.AllowsReference = false;
            this.lkpBackgroundColourId.AllowsUpdate = false;
            this.lkpBackgroundColourId.ApplicationIdForDbConnection = null;
            this.lkpBackgroundColourId.BackColor = System.Drawing.Color.Transparent;
            this.lkpBackgroundColourId.CalledScreenApplicationId = null;
            this.lkpBackgroundColourId.CalledScreenTypeName = null;
            this.lkpBackgroundColourId.CallingScreenType = null;
            this.lkpBackgroundColourId.DisplayText = "";
            this.lkpBackgroundColourId.DisplayTextBindingKey = "background_colour_nm";
            this.lkpBackgroundColourId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpBackgroundColourId.EditingControlDataGridView = null;
            this.lkpBackgroundColourId.EditingControlFormattedValue = null;
            this.lkpBackgroundColourId.EditingControlRowIndex = 0;
            this.lkpBackgroundColourId.EditingControlValueChanged = true;
            this.lkpBackgroundColourId.EnableToolTip = false;
            this.lkpBackgroundColourId.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lkpBackgroundColourId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpBackgroundColourId.IdText = null;
            this.lkpBackgroundColourId.IdTextBindingKey = "background_colour_id";
            this.lkpBackgroundColourId.Location = new System.Drawing.Point(916, 102);
            this.lkpBackgroundColourId.Lookup = true;
            this.lkpBackgroundColourId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpBackgroundColourId.LookupResult = null;
            this.lkpBackgroundColourId.Mandatory = false;
            this.lkpBackgroundColourId.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lkpBackgroundColourId.MaxCharacterLength = 32767;
            this.lkpBackgroundColourId.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lkpBackgroundColourId.MinCharactersForQuery = 0;
            this.lkpBackgroundColourId.MinimumSize = new System.Drawing.Size(13, 27);
            this.lkpBackgroundColourId.Name = "lkpBackgroundColourId";
            this.lkpBackgroundColourId.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lkpBackgroundColourId.PascalCase = false;
            this.lkpBackgroundColourId.RangeInQueryMode = false;
            this.lkpBackgroundColourId.ReadOnly = false;
            this.lkpBackgroundColourId.RegularExpressionValidator = null;
            this.lkpBackgroundColourId.Size = new System.Drawing.Size(277, 42);
            this.lkpBackgroundColourId.TabIndex = 19;
            this.lkpBackgroundColourId.Title = "Background Colour";
            this.lkpBackgroundColourId.ToolTipLookupField = "information";
            this.lkpBackgroundColourId.ValueText = null;
            // 
            // txtBadgeTemplateNm
            // 
            this.txtBadgeTemplateNm.AllowsNew = false;
            this.txtBadgeTemplateNm.AllowsReference = false;
            this.txtBadgeTemplateNm.AllowsUpdate = false;
            this.txtBadgeTemplateNm.ApplicationIdForDbConnection = null;
            this.txtBadgeTemplateNm.BackColor = System.Drawing.Color.Transparent;
            this.txtBadgeTemplateNm.CalledScreenApplicationId = null;
            this.txtBadgeTemplateNm.CalledScreenTypeName = null;
            this.txtBadgeTemplateNm.CallingScreenType = null;
            this.txtBadgeTemplateNm.DisplayText = "";
            this.txtBadgeTemplateNm.DisplayTextBindingKey = "badge_template_nm";
            this.txtBadgeTemplateNm.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtBadgeTemplateNm.EditingControlDataGridView = null;
            this.txtBadgeTemplateNm.EditingControlFormattedValue = "";
            this.txtBadgeTemplateNm.EditingControlRowIndex = 0;
            this.txtBadgeTemplateNm.EditingControlValueChanged = false;
            this.txtBadgeTemplateNm.EnableToolTip = false;
            this.txtBadgeTemplateNm.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBadgeTemplateNm.IdText = null;
            this.txtBadgeTemplateNm.IdTextBindingKey = null;
            this.txtBadgeTemplateNm.Location = new System.Drawing.Point(342, 35);
            this.txtBadgeTemplateNm.Lookup = false;
            this.txtBadgeTemplateNm.LookupColumns = null;
            this.txtBadgeTemplateNm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtBadgeTemplateNm.LookupResult = null;
            this.txtBadgeTemplateNm.Mandatory = true;
            this.txtBadgeTemplateNm.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtBadgeTemplateNm.MaxCharacterLength = 10;
            this.txtBadgeTemplateNm.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtBadgeTemplateNm.MinCharactersForQuery = 0;
            this.txtBadgeTemplateNm.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtBadgeTemplateNm.Name = "txtBadgeTemplateNm";
            this.txtBadgeTemplateNm.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtBadgeTemplateNm.PascalCase = false;
            this.txtBadgeTemplateNm.RangeInQueryMode = false;
            this.txtBadgeTemplateNm.ReadOnly = false;
            this.txtBadgeTemplateNm.RegularExpressionValidator = null;
            this.txtBadgeTemplateNm.Size = new System.Drawing.Size(277, 42);
            this.txtBadgeTemplateNm.TabIndex = 9;
            this.txtBadgeTemplateNm.Title = "Badge Template Name";
            this.txtBadgeTemplateNm.ToolTipLookupField = "information";
            this.txtBadgeTemplateNm.ValueText = null;
            // 
            // txtBadgeTemplateId
            // 
            this.txtBadgeTemplateId.AllowsNew = false;
            this.txtBadgeTemplateId.AllowsReference = false;
            this.txtBadgeTemplateId.AllowsUpdate = false;
            this.txtBadgeTemplateId.ApplicationIdForDbConnection = null;
            this.txtBadgeTemplateId.BackColor = System.Drawing.Color.Transparent;
            this.txtBadgeTemplateId.CalledScreenApplicationId = null;
            this.txtBadgeTemplateId.CalledScreenTypeName = null;
            this.txtBadgeTemplateId.CallingScreenType = null;
            this.txtBadgeTemplateId.DisplayText = "";
            this.txtBadgeTemplateId.DisplayTextBindingKey = "badge_template_id";
            this.txtBadgeTemplateId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtBadgeTemplateId.EditingControlDataGridView = null;
            this.txtBadgeTemplateId.EditingControlFormattedValue = "";
            this.txtBadgeTemplateId.EditingControlRowIndex = 0;
            this.txtBadgeTemplateId.EditingControlValueChanged = false;
            this.txtBadgeTemplateId.EnableToolTip = false;
            this.txtBadgeTemplateId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBadgeTemplateId.IdText = null;
            this.txtBadgeTemplateId.IdTextBindingKey = null;
            this.txtBadgeTemplateId.Location = new System.Drawing.Point(55, 35);
            this.txtBadgeTemplateId.Lookup = false;
            this.txtBadgeTemplateId.LookupColumns = null;
            this.txtBadgeTemplateId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtBadgeTemplateId.LookupResult = null;
            this.txtBadgeTemplateId.Mandatory = true;
            this.txtBadgeTemplateId.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtBadgeTemplateId.MaxCharacterLength = 10;
            this.txtBadgeTemplateId.MaximumSize = new System.Drawing.Size(1733, 55);
            this.txtBadgeTemplateId.MinCharactersForQuery = 0;
            this.txtBadgeTemplateId.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtBadgeTemplateId.Name = "txtBadgeTemplateId";
            this.txtBadgeTemplateId.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtBadgeTemplateId.PascalCase = false;
            this.txtBadgeTemplateId.RangeInQueryMode = false;
            this.txtBadgeTemplateId.ReadOnly = false;
            this.txtBadgeTemplateId.RegularExpressionValidator = null;
            this.txtBadgeTemplateId.Size = new System.Drawing.Size(277, 42);
            this.txtBadgeTemplateId.TabIndex = 8;
            this.txtBadgeTemplateId.Title = "Badge Template ID";
            this.txtBadgeTemplateId.ToolTipLookupField = "information";
            this.txtBadgeTemplateId.ValueText = null;
            // 
            // lkpForegroundColourId
            // 
            this.lkpForegroundColourId.AllowsNew = false;
            this.lkpForegroundColourId.AllowsReference = false;
            this.lkpForegroundColourId.AllowsUpdate = false;
            this.lkpForegroundColourId.ApplicationIdForDbConnection = null;
            this.lkpForegroundColourId.BackColor = System.Drawing.Color.Transparent;
            this.lkpForegroundColourId.CalledScreenApplicationId = null;
            this.lkpForegroundColourId.CalledScreenTypeName = null;
            this.lkpForegroundColourId.CallingScreenType = null;
            this.lkpForegroundColourId.DisplayText = "";
            this.lkpForegroundColourId.DisplayTextBindingKey = "foreground_colour_nm";
            this.lkpForegroundColourId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lkpForegroundColourId.EditingControlDataGridView = null;
            this.lkpForegroundColourId.EditingControlFormattedValue = null;
            this.lkpForegroundColourId.EditingControlRowIndex = 0;
            this.lkpForegroundColourId.EditingControlValueChanged = true;
            this.lkpForegroundColourId.EnableToolTip = false;
            this.lkpForegroundColourId.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.lkpForegroundColourId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lkpForegroundColourId.IdText = null;
            this.lkpForegroundColourId.IdTextBindingKey = "foreground_colour_id";
            this.lkpForegroundColourId.Location = new System.Drawing.Point(342, 102);
            this.lkpForegroundColourId.Lookup = true;
            this.lkpForegroundColourId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.lkpForegroundColourId.LookupResult = null;
            this.lkpForegroundColourId.Mandatory = false;
            this.lkpForegroundColourId.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.lkpForegroundColourId.MaxCharacterLength = 32767;
            this.lkpForegroundColourId.MaximumSize = new System.Drawing.Size(1733, 55);
            this.lkpForegroundColourId.MinCharactersForQuery = 0;
            this.lkpForegroundColourId.MinimumSize = new System.Drawing.Size(13, 27);
            this.lkpForegroundColourId.Name = "lkpForegroundColourId";
            this.lkpForegroundColourId.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.lkpForegroundColourId.PascalCase = false;
            this.lkpForegroundColourId.RangeInQueryMode = false;
            this.lkpForegroundColourId.ReadOnly = false;
            this.lkpForegroundColourId.RegularExpressionValidator = null;
            this.lkpForegroundColourId.Size = new System.Drawing.Size(277, 42);
            this.lkpForegroundColourId.TabIndex = 18;
            this.lkpForegroundColourId.Title = "Foreground Colour";
            this.lkpForegroundColourId.ToolTipLookupField = "information";
            this.lkpForegroundColourId.ValueText = null;
            // 
            // cmbForegroundColourControl
            // 
            this.cmbForegroundColourControl.ApplicationIdForDbConnection = null;
            this.cmbForegroundColourControl.BackColor = System.Drawing.Color.Transparent;
            this.cmbForegroundColourControl.DisplayText = ".......";
            this.cmbForegroundColourControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbForegroundColourControl.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbForegroundColourControl.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbForegroundColourControl.Location = new System.Drawing.Point(55, 102);
            this.cmbForegroundColourControl.Mandatory = true;
            this.cmbForegroundColourControl.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbForegroundColourControl.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbForegroundColourControl.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbForegroundColourControl.Name = "cmbForegroundColourControl";
            this.cmbForegroundColourControl.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbForegroundColourControl.ReadOnly = false;
            this.cmbForegroundColourControl.SelectedIndex = 0;
            this.cmbForegroundColourControl.SelectedText = ".......";
            this.cmbForegroundColourControl.SelectedValue = null;
            this.cmbForegroundColourControl.SelectedValueBindingKey = "foreground_colour_control";
            this.cmbForegroundColourControl.Size = new System.Drawing.Size(277, 42);
            this.cmbForegroundColourControl.TabIndex = 20;
            this.cmbForegroundColourControl.Title = "Foreground Colour Control";
            this.cmbForegroundColourControl.ValueText = null;
            // 
            // cmbBackgroundColourControl
            // 
            this.cmbBackgroundColourControl.ApplicationIdForDbConnection = null;
            this.cmbBackgroundColourControl.BackColor = System.Drawing.Color.Transparent;
            this.cmbBackgroundColourControl.DisplayText = ".......";
            this.cmbBackgroundColourControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbBackgroundColourControl.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbBackgroundColourControl.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbBackgroundColourControl.Location = new System.Drawing.Point(629, 102);
            this.cmbBackgroundColourControl.Mandatory = true;
            this.cmbBackgroundColourControl.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbBackgroundColourControl.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbBackgroundColourControl.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbBackgroundColourControl.Name = "cmbBackgroundColourControl";
            this.cmbBackgroundColourControl.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbBackgroundColourControl.ReadOnly = false;
            this.cmbBackgroundColourControl.SelectedIndex = 0;
            this.cmbBackgroundColourControl.SelectedText = ".......";
            this.cmbBackgroundColourControl.SelectedValue = null;
            this.cmbBackgroundColourControl.SelectedValueBindingKey = "background_colour_control";
            this.cmbBackgroundColourControl.Size = new System.Drawing.Size(277, 42);
            this.cmbBackgroundColourControl.TabIndex = 21;
            this.cmbBackgroundColourControl.Title = "Background Colour Control";
            this.cmbBackgroundColourControl.ValueText = null;
            // 
            // cmbTopLinePart1Type
            // 
            this.cmbTopLinePart1Type.ApplicationIdForDbConnection = null;
            this.cmbTopLinePart1Type.BackColor = System.Drawing.Color.Transparent;
            this.cmbTopLinePart1Type.DisplayText = "";
            this.cmbTopLinePart1Type.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbTopLinePart1Type.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTopLinePart1Type.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTopLinePart1Type.isGlobal = false;
            this.cmbTopLinePart1Type.Location = new System.Drawing.Point(342, 169);
            this.cmbTopLinePart1Type.Mandatory = true;
            this.cmbTopLinePart1Type.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbTopLinePart1Type.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbTopLinePart1Type.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbTopLinePart1Type.Name = "cmbTopLinePart1Type";
            this.cmbTopLinePart1Type.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbTopLinePart1Type.ReadOnly = false;
            this.cmbTopLinePart1Type.SelectedIndex = -1;
            this.cmbTopLinePart1Type.SelectedItem = null;
            this.cmbTopLinePart1Type.SelectedText = "";
            this.cmbTopLinePart1Type.SelectedValue = null;
            this.cmbTopLinePart1Type.SelectedValueBindingKey = "top_line_part_1_type";
            this.cmbTopLinePart1Type.Size = new System.Drawing.Size(277, 42);
            this.cmbTopLinePart1Type.TabIndex = 23;
            this.cmbTopLinePart1Type.Title = "Top Line Part 1 Type";
            this.cmbTopLinePart1Type.ValueText = null;
            // 
            // cmbTopLinePartsSeparator
            // 
            this.cmbTopLinePartsSeparator.ApplicationIdForDbConnection = null;
            this.cmbTopLinePartsSeparator.BackColor = System.Drawing.Color.Transparent;
            this.cmbTopLinePartsSeparator.DisplayText = ".......";
            this.cmbTopLinePartsSeparator.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbTopLinePartsSeparator.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTopLinePartsSeparator.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbTopLinePartsSeparator.Location = new System.Drawing.Point(916, 169);
            this.cmbTopLinePartsSeparator.Mandatory = false;
            this.cmbTopLinePartsSeparator.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbTopLinePartsSeparator.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbTopLinePartsSeparator.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbTopLinePartsSeparator.Name = "cmbTopLinePartsSeparator";
            this.cmbTopLinePartsSeparator.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbTopLinePartsSeparator.ReadOnly = false;
            this.cmbTopLinePartsSeparator.SelectedIndex = 0;
            this.cmbTopLinePartsSeparator.SelectedText = ".......";
            this.cmbTopLinePartsSeparator.SelectedValue = null;
            this.cmbTopLinePartsSeparator.SelectedValueBindingKey = "top_line_parts_separator";
            this.cmbTopLinePartsSeparator.Size = new System.Drawing.Size(277, 42);
            this.cmbTopLinePartsSeparator.TabIndex = 25;
            this.cmbTopLinePartsSeparator.Title = "Top Line Parts Separator";
            this.cmbTopLinePartsSeparator.ValueText = null;
            // 
            // cmbInformationType
            // 
            this.cmbInformationType.ApplicationIdForDbConnection = null;
            this.cmbInformationType.BackColor = System.Drawing.Color.Transparent;
            this.cmbInformationType.DisplayText = ".......";
            this.cmbInformationType.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbInformationType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbInformationType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbInformationType.Location = new System.Drawing.Point(916, 35);
            this.cmbInformationType.Mandatory = true;
            this.cmbInformationType.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbInformationType.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbInformationType.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbInformationType.Name = "cmbInformationType";
            this.cmbInformationType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbInformationType.ReadOnly = false;
            this.cmbInformationType.SelectedIndex = 0;
            this.cmbInformationType.SelectedText = ".......";
            this.cmbInformationType.SelectedValue = null;
            this.cmbInformationType.SelectedValueBindingKey = "information_type";
            this.cmbInformationType.Size = new System.Drawing.Size(277, 42);
            this.cmbInformationType.TabIndex = 45;
            this.cmbInformationType.Title = "Information Type";
            this.cmbInformationType.ValueText = null;
            // 
            // cmbBadgeShape
            // 
            this.cmbBadgeShape.ApplicationIdForDbConnection = null;
            this.cmbBadgeShape.BackColor = System.Drawing.Color.Transparent;
            this.cmbBadgeShape.DisplayText = ".......";
            this.cmbBadgeShape.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cmbBadgeShape.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbBadgeShape.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbBadgeShape.Location = new System.Drawing.Point(629, 35);
            this.cmbBadgeShape.Mandatory = true;
            this.cmbBadgeShape.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.cmbBadgeShape.MaximumSize = new System.Drawing.Size(1733, 54);
            this.cmbBadgeShape.MinimumSize = new System.Drawing.Size(13, 27);
            this.cmbBadgeShape.Name = "cmbBadgeShape";
            this.cmbBadgeShape.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbBadgeShape.ReadOnly = false;
            this.cmbBadgeShape.SelectedIndex = 0;
            this.cmbBadgeShape.SelectedText = ".......";
            this.cmbBadgeShape.SelectedValue = null;
            this.cmbBadgeShape.SelectedValueBindingKey = "badge_shape";
            this.cmbBadgeShape.Size = new System.Drawing.Size(277, 42);
            this.cmbBadgeShape.TabIndex = 46;
            this.cmbBadgeShape.Title = "Badge Shape";
            this.cmbBadgeShape.ValueText = null;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.badge_template_id,
            this.badge_template_nm,
            this.badge_shape,
            this.information_type,
            this.foreground_colour_control,
            this.foreground_colour_id,
            this.background_colour_control,
            this.background_colour_id,
            this.top_line_font_size,
            this.top_line_part_1_type,
            this.top_line_part_1_text,
            this.top_line_parts_separator,
            this.top_line_part_2_type,
            this.top_line_part_2_text,
            this.middle_line_font_size,
            this.middle_line_part_1_type,
            this.middle_line_part_1_text,
            this.middle_line_parts_separator,
            this.middle_line_part_2_type,
            this.middle_line_part_2_text,
            this.bottom_line_font_size,
            this.bottom_line_part_1_type,
            this.bottom_line_part_1_text,
            this.bottom_line_parts_separator,
            this.bottom_line_part_2_type,
            this.bottom_line_part_2_text,
            this.expiry_year,
            this.report_file_nm_front,
            this.report_file_nm_back,
            this.procedure_nm_front,
            this.procedure_nm_back,
            this.txn_ts,
            this.background_colour_nm,
            this.foreground_colour_nm,
            this.are_outstation_sewadars_allowed});
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
            this.grdList.Margin = new System.Windows.Forms.Padding(4);
            this.grdList.MoveDownVisible = false;
            this.grdList.MoveUpVisible = false;
            this.grdList.MultiSelect = false;
            this.grdList.Name = "grdList";
            this.grdList.ReadOnly = true;
            this.grdList.RowHeadersWidth = 15;
            this.grdList.RowTemplate.Height = 24;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(36, 662);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // badge_template_id
            // 
            this.badge_template_id.BindingKey = "badge_template_id";
            this.badge_template_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.badge_template_id.HeaderText = "badge_template_id";
            this.badge_template_id.Lookup = false;
            this.badge_template_id.LookupColumns = "";
            this.badge_template_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.badge_template_id.Mandatory = false;
            this.badge_template_id.MaxCharacterLength = 2147483647;
            this.badge_template_id.Name = "badge_template_id";
            this.badge_template_id.PercentageWidth = 25;
            this.badge_template_id.ReadOnly = true;
            this.badge_template_id.RegularExpressionValidator = "";
            this.badge_template_id.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.badge_template_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.badge_template_id.ToolTipLookupField = "information";
            this.badge_template_id.Width = 5;
            // 
            // badge_template_nm
            // 
            this.badge_template_nm.BindingKey = "badge_template_nm";
            this.badge_template_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.badge_template_nm.HeaderText = "badge_template_nm";
            this.badge_template_nm.Lookup = false;
            this.badge_template_nm.LookupColumns = "";
            this.badge_template_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.badge_template_nm.Mandatory = false;
            this.badge_template_nm.MaxCharacterLength = 2147483647;
            this.badge_template_nm.Name = "badge_template_nm";
            this.badge_template_nm.PercentageWidth = 25;
            this.badge_template_nm.ReadOnly = true;
            this.badge_template_nm.RegularExpressionValidator = "";
            this.badge_template_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.badge_template_nm.ToolTipLookupField = "information";
            this.badge_template_nm.Width = 5;
            // 
            // badge_shape
            // 
            this.badge_shape.BindingKey = "badge_shape";
            this.badge_shape.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.badge_shape.HeaderText = "badge_shape";
            this.badge_shape.Lookup = false;
            this.badge_shape.LookupColumns = "";
            this.badge_shape.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.badge_shape.Mandatory = false;
            this.badge_shape.MaxCharacterLength = 2147483647;
            this.badge_shape.Name = "badge_shape";
            this.badge_shape.PercentageWidth = 25;
            this.badge_shape.ReadOnly = true;
            this.badge_shape.RegularExpressionValidator = "";
            this.badge_shape.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.badge_shape.ToolTipLookupField = "information";
            this.badge_shape.Width = 5;
            // 
            // information_type
            // 
            this.information_type.BindingKey = "information_type";
            this.information_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.information_type.HeaderText = "information_type";
            this.information_type.Lookup = false;
            this.information_type.LookupColumns = "";
            this.information_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.information_type.Mandatory = false;
            this.information_type.MaxCharacterLength = 2147483647;
            this.information_type.Name = "information_type";
            this.information_type.PercentageWidth = 25;
            this.information_type.ReadOnly = true;
            this.information_type.RegularExpressionValidator = "";
            this.information_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.information_type.ToolTipLookupField = "information";
            this.information_type.Width = 5;
            // 
            // foreground_colour_control
            // 
            this.foreground_colour_control.BindingKey = "foreground_colour_control";
            this.foreground_colour_control.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.foreground_colour_control.HeaderText = "foreground_colour_control";
            this.foreground_colour_control.Lookup = false;
            this.foreground_colour_control.LookupColumns = "";
            this.foreground_colour_control.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.foreground_colour_control.Mandatory = false;
            this.foreground_colour_control.MaxCharacterLength = 2147483647;
            this.foreground_colour_control.Name = "foreground_colour_control";
            this.foreground_colour_control.PercentageWidth = 25;
            this.foreground_colour_control.ReadOnly = true;
            this.foreground_colour_control.RegularExpressionValidator = "";
            this.foreground_colour_control.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.foreground_colour_control.ToolTipLookupField = "information";
            this.foreground_colour_control.Width = 5;
            // 
            // foreground_colour_id
            // 
            this.foreground_colour_id.BindingKey = "foreground_colour_id";
            this.foreground_colour_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.foreground_colour_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.foreground_colour_id.HeaderText = "foreground_colour_id";
            this.foreground_colour_id.Lookup = false;
            this.foreground_colour_id.LookupColumns = "";
            this.foreground_colour_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.foreground_colour_id.Mandatory = false;
            this.foreground_colour_id.MaxValue = ((long)(9223372036854775807));
            this.foreground_colour_id.MinValue = ((long)(-9223372036854775808));
            this.foreground_colour_id.Name = "foreground_colour_id";
            this.foreground_colour_id.PercentageWidth = 25;
            this.foreground_colour_id.ReadOnly = true;
            this.foreground_colour_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.foreground_colour_id.ToolTipLookupField = "information";
            this.foreground_colour_id.Width = 5;
            // 
            // background_colour_control
            // 
            this.background_colour_control.BindingKey = "background_colour_control";
            this.background_colour_control.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.background_colour_control.HeaderText = "background_colour_control";
            this.background_colour_control.Lookup = false;
            this.background_colour_control.LookupColumns = "";
            this.background_colour_control.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.background_colour_control.Mandatory = false;
            this.background_colour_control.MaxCharacterLength = 2147483647;
            this.background_colour_control.Name = "background_colour_control";
            this.background_colour_control.PercentageWidth = 25;
            this.background_colour_control.ReadOnly = true;
            this.background_colour_control.RegularExpressionValidator = "";
            this.background_colour_control.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.background_colour_control.ToolTipLookupField = "information";
            this.background_colour_control.Width = 5;
            // 
            // background_colour_id
            // 
            this.background_colour_id.BindingKey = "background_colour_id";
            this.background_colour_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.background_colour_id.DefaultCellStyle = dataGridViewCellStyle3;
            this.background_colour_id.HeaderText = "background_colour_id";
            this.background_colour_id.Lookup = false;
            this.background_colour_id.LookupColumns = "";
            this.background_colour_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.background_colour_id.Mandatory = false;
            this.background_colour_id.MaxValue = ((long)(9223372036854775807));
            this.background_colour_id.MinValue = ((long)(-9223372036854775808));
            this.background_colour_id.Name = "background_colour_id";
            this.background_colour_id.PercentageWidth = 25;
            this.background_colour_id.ReadOnly = true;
            this.background_colour_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.background_colour_id.ToolTipLookupField = "information";
            this.background_colour_id.Width = 5;
            // 
            // top_line_font_size
            // 
            this.top_line_font_size.BindingKey = "top_line_font_size";
            this.top_line_font_size.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.top_line_font_size.DefaultCellStyle = dataGridViewCellStyle4;
            this.top_line_font_size.HeaderText = "top_line_font_size";
            this.top_line_font_size.Lookup = false;
            this.top_line_font_size.LookupColumns = "";
            this.top_line_font_size.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.top_line_font_size.Mandatory = false;
            this.top_line_font_size.MaxValue = ((long)(9223372036854775807));
            this.top_line_font_size.MinValue = ((long)(-9223372036854775808));
            this.top_line_font_size.Name = "top_line_font_size";
            this.top_line_font_size.PercentageWidth = 25;
            this.top_line_font_size.ReadOnly = true;
            this.top_line_font_size.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.top_line_font_size.ToolTipLookupField = "information";
            this.top_line_font_size.Width = 5;
            // 
            // top_line_part_1_type
            // 
            this.top_line_part_1_type.BindingKey = "top_line_part_1_type";
            this.top_line_part_1_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.top_line_part_1_type.HeaderText = "top_line_part_1_type";
            this.top_line_part_1_type.Lookup = false;
            this.top_line_part_1_type.LookupColumns = "";
            this.top_line_part_1_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.top_line_part_1_type.Mandatory = false;
            this.top_line_part_1_type.MaxCharacterLength = 2147483647;
            this.top_line_part_1_type.Name = "top_line_part_1_type";
            this.top_line_part_1_type.PercentageWidth = 25;
            this.top_line_part_1_type.ReadOnly = true;
            this.top_line_part_1_type.RegularExpressionValidator = "";
            this.top_line_part_1_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.top_line_part_1_type.ToolTipLookupField = "information";
            this.top_line_part_1_type.Width = 5;
            // 
            // top_line_part_1_text
            // 
            this.top_line_part_1_text.BindingKey = "top_line_part_1_text";
            this.top_line_part_1_text.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.top_line_part_1_text.HeaderText = "top_line_part_1_text";
            this.top_line_part_1_text.Lookup = false;
            this.top_line_part_1_text.LookupColumns = "";
            this.top_line_part_1_text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.top_line_part_1_text.Mandatory = false;
            this.top_line_part_1_text.MaxCharacterLength = 2147483647;
            this.top_line_part_1_text.Name = "top_line_part_1_text";
            this.top_line_part_1_text.PercentageWidth = 25;
            this.top_line_part_1_text.ReadOnly = true;
            this.top_line_part_1_text.RegularExpressionValidator = "";
            this.top_line_part_1_text.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.top_line_part_1_text.ToolTipLookupField = "information";
            this.top_line_part_1_text.Width = 5;
            // 
            // top_line_parts_separator
            // 
            this.top_line_parts_separator.BindingKey = "top_line_parts_separator";
            this.top_line_parts_separator.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.top_line_parts_separator.HeaderText = "top_line_parts_separator";
            this.top_line_parts_separator.Lookup = false;
            this.top_line_parts_separator.LookupColumns = "";
            this.top_line_parts_separator.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.top_line_parts_separator.Mandatory = false;
            this.top_line_parts_separator.MaxCharacterLength = 2147483647;
            this.top_line_parts_separator.Name = "top_line_parts_separator";
            this.top_line_parts_separator.PercentageWidth = 25;
            this.top_line_parts_separator.ReadOnly = true;
            this.top_line_parts_separator.RegularExpressionValidator = "";
            this.top_line_parts_separator.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.top_line_parts_separator.ToolTipLookupField = "information";
            this.top_line_parts_separator.Width = 5;
            // 
            // top_line_part_2_type
            // 
            this.top_line_part_2_type.BindingKey = "top_line_part_2_type";
            this.top_line_part_2_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.top_line_part_2_type.HeaderText = "top_line_part_2_type";
            this.top_line_part_2_type.Lookup = false;
            this.top_line_part_2_type.LookupColumns = "";
            this.top_line_part_2_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.top_line_part_2_type.Mandatory = false;
            this.top_line_part_2_type.MaxCharacterLength = 2147483647;
            this.top_line_part_2_type.Name = "top_line_part_2_type";
            this.top_line_part_2_type.PercentageWidth = 25;
            this.top_line_part_2_type.ReadOnly = true;
            this.top_line_part_2_type.RegularExpressionValidator = "";
            this.top_line_part_2_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.top_line_part_2_type.ToolTipLookupField = "information";
            this.top_line_part_2_type.Width = 5;
            // 
            // top_line_part_2_text
            // 
            this.top_line_part_2_text.BindingKey = "top_line_part_2_text";
            this.top_line_part_2_text.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.top_line_part_2_text.HeaderText = "top_line_part_2_text";
            this.top_line_part_2_text.Lookup = false;
            this.top_line_part_2_text.LookupColumns = "";
            this.top_line_part_2_text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.top_line_part_2_text.Mandatory = false;
            this.top_line_part_2_text.MaxCharacterLength = 2147483647;
            this.top_line_part_2_text.Name = "top_line_part_2_text";
            this.top_line_part_2_text.PercentageWidth = 25;
            this.top_line_part_2_text.ReadOnly = true;
            this.top_line_part_2_text.RegularExpressionValidator = "";
            this.top_line_part_2_text.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.top_line_part_2_text.ToolTipLookupField = "information";
            this.top_line_part_2_text.Width = 5;
            // 
            // middle_line_font_size
            // 
            this.middle_line_font_size.BindingKey = "middle_line_font_size";
            this.middle_line_font_size.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.middle_line_font_size.HeaderText = "middle_line_font_size";
            this.middle_line_font_size.Lookup = false;
            this.middle_line_font_size.LookupColumns = "";
            this.middle_line_font_size.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.middle_line_font_size.Mandatory = false;
            this.middle_line_font_size.MaxCharacterLength = 2147483647;
            this.middle_line_font_size.Name = "middle_line_font_size";
            this.middle_line_font_size.PercentageWidth = 25;
            this.middle_line_font_size.ReadOnly = true;
            this.middle_line_font_size.RegularExpressionValidator = "";
            this.middle_line_font_size.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.middle_line_font_size.ToolTipLookupField = "information";
            this.middle_line_font_size.Width = 5;
            // 
            // middle_line_part_1_type
            // 
            this.middle_line_part_1_type.BindingKey = "middle_line_part_1_type";
            this.middle_line_part_1_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.middle_line_part_1_type.HeaderText = "middle_line_part_1_type";
            this.middle_line_part_1_type.Lookup = false;
            this.middle_line_part_1_type.LookupColumns = "";
            this.middle_line_part_1_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.middle_line_part_1_type.Mandatory = false;
            this.middle_line_part_1_type.MaxCharacterLength = 2147483647;
            this.middle_line_part_1_type.Name = "middle_line_part_1_type";
            this.middle_line_part_1_type.PercentageWidth = 25;
            this.middle_line_part_1_type.ReadOnly = true;
            this.middle_line_part_1_type.RegularExpressionValidator = "";
            this.middle_line_part_1_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.middle_line_part_1_type.ToolTipLookupField = "information";
            this.middle_line_part_1_type.Width = 5;
            // 
            // middle_line_part_1_text
            // 
            this.middle_line_part_1_text.BindingKey = "middle_line_part_1_text";
            this.middle_line_part_1_text.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.middle_line_part_1_text.HeaderText = "middle_line_part_1_text";
            this.middle_line_part_1_text.Lookup = false;
            this.middle_line_part_1_text.LookupColumns = "";
            this.middle_line_part_1_text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.middle_line_part_1_text.Mandatory = false;
            this.middle_line_part_1_text.MaxCharacterLength = 2147483647;
            this.middle_line_part_1_text.Name = "middle_line_part_1_text";
            this.middle_line_part_1_text.PercentageWidth = 25;
            this.middle_line_part_1_text.ReadOnly = true;
            this.middle_line_part_1_text.RegularExpressionValidator = "";
            this.middle_line_part_1_text.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.middle_line_part_1_text.ToolTipLookupField = "information";
            this.middle_line_part_1_text.Width = 5;
            // 
            // middle_line_parts_separator
            // 
            this.middle_line_parts_separator.BindingKey = "middle_line_parts_separator";
            this.middle_line_parts_separator.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.middle_line_parts_separator.HeaderText = "middle_line_parts_separator";
            this.middle_line_parts_separator.Lookup = false;
            this.middle_line_parts_separator.LookupColumns = "";
            this.middle_line_parts_separator.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.middle_line_parts_separator.Mandatory = false;
            this.middle_line_parts_separator.MaxCharacterLength = 2147483647;
            this.middle_line_parts_separator.Name = "middle_line_parts_separator";
            this.middle_line_parts_separator.PercentageWidth = 25;
            this.middle_line_parts_separator.ReadOnly = true;
            this.middle_line_parts_separator.RegularExpressionValidator = "";
            this.middle_line_parts_separator.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.middle_line_parts_separator.ToolTipLookupField = "information";
            this.middle_line_parts_separator.Width = 5;
            // 
            // middle_line_part_2_type
            // 
            this.middle_line_part_2_type.BindingKey = "middle_line_part_2_type";
            this.middle_line_part_2_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.middle_line_part_2_type.HeaderText = "middle_line_part_2_type";
            this.middle_line_part_2_type.Lookup = false;
            this.middle_line_part_2_type.LookupColumns = "";
            this.middle_line_part_2_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.middle_line_part_2_type.Mandatory = false;
            this.middle_line_part_2_type.MaxCharacterLength = 2147483647;
            this.middle_line_part_2_type.Name = "middle_line_part_2_type";
            this.middle_line_part_2_type.PercentageWidth = 25;
            this.middle_line_part_2_type.ReadOnly = true;
            this.middle_line_part_2_type.RegularExpressionValidator = "";
            this.middle_line_part_2_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.middle_line_part_2_type.ToolTipLookupField = "information";
            this.middle_line_part_2_type.Width = 5;
            // 
            // middle_line_part_2_text
            // 
            this.middle_line_part_2_text.BindingKey = "middle_line_part_2_text";
            this.middle_line_part_2_text.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.middle_line_part_2_text.HeaderText = "middle_line_part_2_text";
            this.middle_line_part_2_text.Lookup = false;
            this.middle_line_part_2_text.LookupColumns = "";
            this.middle_line_part_2_text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.middle_line_part_2_text.Mandatory = false;
            this.middle_line_part_2_text.MaxCharacterLength = 2147483647;
            this.middle_line_part_2_text.Name = "middle_line_part_2_text";
            this.middle_line_part_2_text.PercentageWidth = 25;
            this.middle_line_part_2_text.ReadOnly = true;
            this.middle_line_part_2_text.RegularExpressionValidator = "";
            this.middle_line_part_2_text.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.middle_line_part_2_text.ToolTipLookupField = "information";
            this.middle_line_part_2_text.Width = 5;
            // 
            // bottom_line_font_size
            // 
            this.bottom_line_font_size.BindingKey = "bottom_line_font_size";
            this.bottom_line_font_size.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.bottom_line_font_size.DefaultCellStyle = dataGridViewCellStyle5;
            this.bottom_line_font_size.HeaderText = "bottom_line_font_size";
            this.bottom_line_font_size.Lookup = false;
            this.bottom_line_font_size.LookupColumns = "";
            this.bottom_line_font_size.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.bottom_line_font_size.Mandatory = false;
            this.bottom_line_font_size.MaxValue = ((long)(9223372036854775807));
            this.bottom_line_font_size.MinValue = ((long)(-9223372036854775808));
            this.bottom_line_font_size.Name = "bottom_line_font_size";
            this.bottom_line_font_size.PercentageWidth = 25;
            this.bottom_line_font_size.ReadOnly = true;
            this.bottom_line_font_size.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.bottom_line_font_size.ToolTipLookupField = "information";
            this.bottom_line_font_size.Width = 5;
            // 
            // bottom_line_part_1_type
            // 
            this.bottom_line_part_1_type.BindingKey = "bottom_line_part_1_type";
            this.bottom_line_part_1_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.bottom_line_part_1_type.HeaderText = "bottom_line_part_1_type";
            this.bottom_line_part_1_type.Lookup = false;
            this.bottom_line_part_1_type.LookupColumns = "";
            this.bottom_line_part_1_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.bottom_line_part_1_type.Mandatory = false;
            this.bottom_line_part_1_type.MaxCharacterLength = 2147483647;
            this.bottom_line_part_1_type.Name = "bottom_line_part_1_type";
            this.bottom_line_part_1_type.PercentageWidth = 25;
            this.bottom_line_part_1_type.ReadOnly = true;
            this.bottom_line_part_1_type.RegularExpressionValidator = "";
            this.bottom_line_part_1_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.bottom_line_part_1_type.ToolTipLookupField = "information";
            this.bottom_line_part_1_type.Width = 5;
            // 
            // bottom_line_part_1_text
            // 
            this.bottom_line_part_1_text.BindingKey = "bottom_line_part_1_text";
            this.bottom_line_part_1_text.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.bottom_line_part_1_text.HeaderText = "bottom_line_part_1_text";
            this.bottom_line_part_1_text.Lookup = false;
            this.bottom_line_part_1_text.LookupColumns = "";
            this.bottom_line_part_1_text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.bottom_line_part_1_text.Mandatory = false;
            this.bottom_line_part_1_text.MaxCharacterLength = 2147483647;
            this.bottom_line_part_1_text.Name = "bottom_line_part_1_text";
            this.bottom_line_part_1_text.PercentageWidth = 25;
            this.bottom_line_part_1_text.ReadOnly = true;
            this.bottom_line_part_1_text.RegularExpressionValidator = "";
            this.bottom_line_part_1_text.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.bottom_line_part_1_text.ToolTipLookupField = "information";
            this.bottom_line_part_1_text.Width = 5;
            // 
            // bottom_line_parts_separator
            // 
            this.bottom_line_parts_separator.BindingKey = "bottom_line_parts_separator";
            this.bottom_line_parts_separator.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.bottom_line_parts_separator.HeaderText = "bottom_line_parts_separator";
            this.bottom_line_parts_separator.Lookup = false;
            this.bottom_line_parts_separator.LookupColumns = "";
            this.bottom_line_parts_separator.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.bottom_line_parts_separator.Mandatory = false;
            this.bottom_line_parts_separator.MaxCharacterLength = 2147483647;
            this.bottom_line_parts_separator.Name = "bottom_line_parts_separator";
            this.bottom_line_parts_separator.PercentageWidth = 25;
            this.bottom_line_parts_separator.ReadOnly = true;
            this.bottom_line_parts_separator.RegularExpressionValidator = "";
            this.bottom_line_parts_separator.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.bottom_line_parts_separator.ToolTipLookupField = "information";
            this.bottom_line_parts_separator.Width = 5;
            // 
            // bottom_line_part_2_type
            // 
            this.bottom_line_part_2_type.BindingKey = "bottom_line_part_2_type";
            this.bottom_line_part_2_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.bottom_line_part_2_type.HeaderText = "bottom_line_part_2_type";
            this.bottom_line_part_2_type.Lookup = false;
            this.bottom_line_part_2_type.LookupColumns = "";
            this.bottom_line_part_2_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.bottom_line_part_2_type.Mandatory = false;
            this.bottom_line_part_2_type.MaxCharacterLength = 2147483647;
            this.bottom_line_part_2_type.Name = "bottom_line_part_2_type";
            this.bottom_line_part_2_type.PercentageWidth = 25;
            this.bottom_line_part_2_type.ReadOnly = true;
            this.bottom_line_part_2_type.RegularExpressionValidator = "";
            this.bottom_line_part_2_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.bottom_line_part_2_type.ToolTipLookupField = "information";
            this.bottom_line_part_2_type.Width = 5;
            // 
            // bottom_line_part_2_text
            // 
            this.bottom_line_part_2_text.BindingKey = "bottom_line_part_2_text";
            this.bottom_line_part_2_text.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.bottom_line_part_2_text.HeaderText = "bottom_line_part_2_text";
            this.bottom_line_part_2_text.Lookup = false;
            this.bottom_line_part_2_text.LookupColumns = "";
            this.bottom_line_part_2_text.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.bottom_line_part_2_text.Mandatory = false;
            this.bottom_line_part_2_text.MaxCharacterLength = 2147483647;
            this.bottom_line_part_2_text.Name = "bottom_line_part_2_text";
            this.bottom_line_part_2_text.PercentageWidth = 25;
            this.bottom_line_part_2_text.ReadOnly = true;
            this.bottom_line_part_2_text.RegularExpressionValidator = "";
            this.bottom_line_part_2_text.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.bottom_line_part_2_text.ToolTipLookupField = "information";
            this.bottom_line_part_2_text.Width = 5;
            // 
            // expiry_year
            // 
            this.expiry_year.BindingKey = "expiry_year";
            this.expiry_year.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.expiry_year.HeaderText = "expiry_year";
            this.expiry_year.Lookup = false;
            this.expiry_year.LookupColumns = "";
            this.expiry_year.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.expiry_year.Mandatory = false;
            this.expiry_year.MaxCharacterLength = 2147483647;
            this.expiry_year.Name = "expiry_year";
            this.expiry_year.PercentageWidth = 25;
            this.expiry_year.ReadOnly = true;
            this.expiry_year.RegularExpressionValidator = "";
            this.expiry_year.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.expiry_year.ToolTipLookupField = "information";
            this.expiry_year.Width = 5;
            // 
            // report_file_nm_front
            // 
            this.report_file_nm_front.BindingKey = "report_file_nm_front";
            this.report_file_nm_front.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.report_file_nm_front.HeaderText = "report_file_nm_front";
            this.report_file_nm_front.Lookup = false;
            this.report_file_nm_front.LookupColumns = "";
            this.report_file_nm_front.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.report_file_nm_front.Mandatory = false;
            this.report_file_nm_front.MaxCharacterLength = 2147483647;
            this.report_file_nm_front.Name = "report_file_nm_front";
            this.report_file_nm_front.PercentageWidth = 25;
            this.report_file_nm_front.ReadOnly = true;
            this.report_file_nm_front.RegularExpressionValidator = "";
            this.report_file_nm_front.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.report_file_nm_front.ToolTipLookupField = "information";
            this.report_file_nm_front.Width = 5;
            // 
            // report_file_nm_back
            // 
            this.report_file_nm_back.BindingKey = "report_file_nm_back";
            this.report_file_nm_back.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.report_file_nm_back.HeaderText = "report_file_nm_back";
            this.report_file_nm_back.Lookup = false;
            this.report_file_nm_back.LookupColumns = "";
            this.report_file_nm_back.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.report_file_nm_back.Mandatory = false;
            this.report_file_nm_back.MaxCharacterLength = 2147483647;
            this.report_file_nm_back.Name = "report_file_nm_back";
            this.report_file_nm_back.PercentageWidth = 25;
            this.report_file_nm_back.ReadOnly = true;
            this.report_file_nm_back.RegularExpressionValidator = "";
            this.report_file_nm_back.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.report_file_nm_back.ToolTipLookupField = "information";
            this.report_file_nm_back.Width = 5;
            // 
            // procedure_nm_front
            // 
            this.procedure_nm_front.BindingKey = "procedure_nm_front";
            this.procedure_nm_front.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.procedure_nm_front.HeaderText = "procedure_nm_front";
            this.procedure_nm_front.Lookup = false;
            this.procedure_nm_front.LookupColumns = "";
            this.procedure_nm_front.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.procedure_nm_front.Mandatory = false;
            this.procedure_nm_front.MaxCharacterLength = 2147483647;
            this.procedure_nm_front.Name = "procedure_nm_front";
            this.procedure_nm_front.PercentageWidth = 25;
            this.procedure_nm_front.ReadOnly = true;
            this.procedure_nm_front.RegularExpressionValidator = "";
            this.procedure_nm_front.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.procedure_nm_front.ToolTipLookupField = "information";
            this.procedure_nm_front.Width = 5;
            // 
            // procedure_nm_back
            // 
            this.procedure_nm_back.BindingKey = "procedure_nm_back";
            this.procedure_nm_back.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.procedure_nm_back.HeaderText = "procedure_nm_back";
            this.procedure_nm_back.Lookup = false;
            this.procedure_nm_back.LookupColumns = "";
            this.procedure_nm_back.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.procedure_nm_back.Mandatory = false;
            this.procedure_nm_back.MaxCharacterLength = 2147483647;
            this.procedure_nm_back.Name = "procedure_nm_back";
            this.procedure_nm_back.PercentageWidth = 25;
            this.procedure_nm_back.ReadOnly = true;
            this.procedure_nm_back.RegularExpressionValidator = "";
            this.procedure_nm_back.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.procedure_nm_back.ToolTipLookupField = "information";
            this.procedure_nm_back.Width = 5;
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
            this.txn_ts.PercentageWidth = 25;
            this.txn_ts.ReadOnly = true;
            this.txn_ts.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txn_ts.ToolTipLookupField = "information";
            this.txn_ts.Visible = false;
            // 
            // background_colour_nm
            // 
            this.background_colour_nm.BindingKey = "background_colour_nm";
            this.background_colour_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.background_colour_nm.HeaderText = "background_colour_nm";
            this.background_colour_nm.Lookup = false;
            this.background_colour_nm.LookupColumns = "";
            this.background_colour_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.background_colour_nm.Mandatory = false;
            this.background_colour_nm.MaxCharacterLength = 2147483647;
            this.background_colour_nm.Name = "background_colour_nm";
            this.background_colour_nm.PercentageWidth = 25;
            this.background_colour_nm.ReadOnly = true;
            this.background_colour_nm.RegularExpressionValidator = "";
            this.background_colour_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.background_colour_nm.ToolTipLookupField = "information";
            this.background_colour_nm.Visible = false;
            // 
            // foreground_colour_nm
            // 
            this.foreground_colour_nm.BindingKey = "foreground_colour_nm";
            this.foreground_colour_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.foreground_colour_nm.HeaderText = "foreground_colour_nm";
            this.foreground_colour_nm.Lookup = false;
            this.foreground_colour_nm.LookupColumns = "";
            this.foreground_colour_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.foreground_colour_nm.Mandatory = false;
            this.foreground_colour_nm.MaxCharacterLength = 2147483647;
            this.foreground_colour_nm.Name = "foreground_colour_nm";
            this.foreground_colour_nm.PercentageWidth = 25;
            this.foreground_colour_nm.ReadOnly = true;
            this.foreground_colour_nm.RegularExpressionValidator = "";
            this.foreground_colour_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.foreground_colour_nm.ToolTipLookupField = "information";
            this.foreground_colour_nm.Visible = false;
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
            this.dccTextField1.MinCharactersForQuery = 0;
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
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dccGrid1.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle7;
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
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn1.DefaultCellStyle = dataGridViewCellStyle8;
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
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn2.DefaultCellStyle = dataGridViewCellStyle9;
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
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn3.DefaultCellStyle = dataGridViewCellStyle10;
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
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn4.DefaultCellStyle = dataGridViewCellStyle11;
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
            // chkAreOutstaionAllowed
            // 
            this.chkAreOutstaionAllowed.AutoSize = true;
            this.chkAreOutstaionAllowed.BackColor = System.Drawing.Color.Transparent;
            this.chkAreOutstaionAllowed.BindingKey = "are_outstation_sewadars_allowed";
            this.chkAreOutstaionAllowed.Dock = System.Windows.Forms.DockStyle.Fill;
            this.chkAreOutstaionAllowed.Font = new System.Drawing.Font("Arial", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkAreOutstaionAllowed.Location = new System.Drawing.Point(3, 3);
            this.chkAreOutstaionAllowed.Name = "chkAreOutstaionAllowed";
            this.chkAreOutstaionAllowed.Size = new System.Drawing.Size(184, 49);
            this.chkAreOutstaionAllowed.TabIndex = 41;
            this.chkAreOutstaionAllowed.Text = "outstation sewadars allowed?";
            this.chkAreOutstaionAllowed.UseVisualStyleBackColor = false;
            // 
            // are_outstation_sewadars_allowed
            // 
            this.are_outstation_sewadars_allowed.BindingKey = "are_outstation_sewadars_allowed";
            this.are_outstation_sewadars_allowed.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.are_outstation_sewadars_allowed.DefaultCellStyle = dataGridViewCellStyle6;
            this.are_outstation_sewadars_allowed.HeaderText = "are_outstation_sewadars_allowed";
            this.are_outstation_sewadars_allowed.Lookup = false;
            this.are_outstation_sewadars_allowed.LookupColumns = "";
            this.are_outstation_sewadars_allowed.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.are_outstation_sewadars_allowed.Mandatory = false;
            this.are_outstation_sewadars_allowed.Name = "are_outstation_sewadars_allowed";
            this.are_outstation_sewadars_allowed.PercentageWidth = 25;
            this.are_outstation_sewadars_allowed.ReadOnly = true;
            this.are_outstation_sewadars_allowed.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.are_outstation_sewadars_allowed.ToolTipLookupField = "information";
            this.are_outstation_sewadars_allowed.Visible = false;
            // 
            // BadgeTemplates
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1291, 662);
            this.Controls.Add(this.scListOrBrowse);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "BadgeTemplates";
            this.Text = "Zonal Sewadar Management - Badge Templates]";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpTopMost.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            this.tlpTop.PerformLayout();
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
        private DCC.ZOS.ZSM.Controls.ZSMLookups.ColoursLookup lkpForegroundColourId;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.ColoursLookup lkpBackgroundColourId;
        private DCC.ZOS.ZSM.Controls.Combos.ColourControlCombo cmbForegroundColourControl;
        private DCC.ZOS.ZSM.Controls.Combos.ColourControlCombo cmbBackgroundColourControl;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intTopLineFontSize;
        private DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo cmbTopLinePart1Type;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtTopLinePart1Text;
        private DCC.ZOS.ZSM.Controls.Combos.SeparatorCombo cmbTopLinePartsSeparator;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtTopLinePart2Text;
        private DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo cmbTopLinePart2Type;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtMiddleLinePart2Text;
        private DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo cmbMiddleLinePart2Type;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtMiddleLinePart1Text;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intMiddleLineFontSize;
        private DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo cmbMiddleLinePart1Type;
        private DCC.ZOS.ZSM.Controls.Combos.SeparatorCombo cmbMiddleLinePartsSeparator;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtBottomLinePart2Text;
        private DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo cmbBottomLinePart2Type;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtBottomLinePart1Text;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intBottomLineFontSize;
        private DCC.ZOS.ZSM.Controls.Combos.BadgePartTypesCombo cmbBottomLinePart1Type;
        private DCC.ZOS.ZSM.Controls.Combos.SeparatorCombo cmbBottomLinePartsSeparator;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtExpiryYear;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtProcedureNmBack;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtProcedureNmFront;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtReportFileNmBack;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtReportFileNmFront;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn badge_template_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn badge_template_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn badge_shape;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn information_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn foreground_colour_control;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn foreground_colour_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn background_colour_control;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn background_colour_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn top_line_font_size;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn top_line_part_1_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn top_line_part_1_text;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn top_line_parts_separator;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn top_line_part_2_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn top_line_part_2_text;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn middle_line_font_size;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn middle_line_part_1_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn middle_line_part_1_text;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn middle_line_parts_separator;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn middle_line_part_2_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn middle_line_part_2_text;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn bottom_line_font_size;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn bottom_line_part_1_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn bottom_line_part_1_text;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn bottom_line_parts_separator;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn bottom_line_part_2_type;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn bottom_line_part_2_text;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn expiry_year;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn report_file_nm_front;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn report_file_nm_back;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn procedure_nm_front;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn procedure_nm_back;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtBadgeTemplateNm;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtBadgeTemplateId;
        private DCC.ZOS.ZSM.Controls.Combos.InformationTypeCombo cmbInformationType;
        private DCC.ZOS.ZSM.Controls.Combos.BadgeShapeCombo cmbBadgeShape;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn background_colour_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn foreground_colour_nm;
        private UMB.CDF.UIControls.DCCCheckBox chkAreOutstaionAllowed;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn are_outstation_sewadars_allowed;
    }
}