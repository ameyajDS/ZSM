namespace DCC.ZOS.ZSM.ENT
{
    partial class Occupations
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Occupations));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.txtOccupationName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtmEffectiveRange = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.intOccupationID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtOccupationCode = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
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
            this.occupation_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.occupation_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.occupation_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Effective_From = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.Effective_Till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
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
            this.scListOrBrowse.Panel1.Controls.Add(this.tableLayoutPanel1);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(956, 512);
            this.scListOrBrowse.SplitterDistance = 927;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 6;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 35.48922F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.02564F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30.28846F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 18.18182F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 97F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 204F));
            this.tableLayoutPanel1.Controls.Add(this.txtOccupationName, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.dtmEffectiveRange, 2, 2);
            this.tableLayoutPanel1.Controls.Add(this.intOccupationID, 4, 1);
            this.tableLayoutPanel1.Controls.Add(this.txtOccupationCode, 3, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 3;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 24.41406F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.765625F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 65.82031F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(956, 512);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // txtOccupationName
            // 
            this.txtOccupationName.AllowsNew = false;
            this.txtOccupationName.AllowsReference = false;
            this.txtOccupationName.AllowsUpdate = false;
            this.txtOccupationName.ApplicationIdForDbConnection = null;
            this.txtOccupationName.BackColor = System.Drawing.Color.Transparent;
            this.txtOccupationName.CalledScreenApplicationId = null;
            this.txtOccupationName.CalledScreenTypeName = null;
            this.txtOccupationName.CallingScreenType = null;
            this.tableLayoutPanel1.SetColumnSpan(this.txtOccupationName, 2);
            this.txtOccupationName.DisplayText = "";
            this.txtOccupationName.DisplayTextBindingKey = "occupation_nm";
            this.txtOccupationName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtOccupationName.EditingControlDataGridView = null;
            this.txtOccupationName.EditingControlFormattedValue = "";
            this.txtOccupationName.EditingControlRowIndex = 0;
            this.txtOccupationName.EditingControlValueChanged = false;
            this.txtOccupationName.EnableToolTip = false;
            this.txtOccupationName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtOccupationName.IdText = null;
            this.txtOccupationName.IdTextBindingKey = null;
            this.txtOccupationName.Location = new System.Drawing.Point(236, 128);
            this.txtOccupationName.Lookup = false;
            this.txtOccupationName.LookupColumns = null;
            this.txtOccupationName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtOccupationName.LookupResult = null;
            this.txtOccupationName.Mandatory = true;
            this.txtOccupationName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtOccupationName.MaxCharacterLength = 20;
            this.txtOccupationName.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtOccupationName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtOccupationName.Name = "txtOccupationName";
            this.txtOccupationName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtOccupationName.PascalCase = false;
            this.txtOccupationName.RangeInQueryMode = false;
            this.txtOccupationName.ReadOnly = false;
            this.txtOccupationName.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtOccupationName.Size = new System.Drawing.Size(294, 44);
            this.txtOccupationName.TabIndex = 1;
            this.txtOccupationName.Title = "Occupation Name";
            this.txtOccupationName.ToolTipLookupField = "information";
            this.txtOccupationName.ValueText = null;
            // 
            // dtmEffectiveRange
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.dtmEffectiveRange, 2);
            this.dtmEffectiveRange.DiscreteInQueryMode = false;
            this.dtmEffectiveRange.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmEffectiveRange.FillDefailtValuesInInsertMode = true;
            this.dtmEffectiveRange.FromDate = null;
            this.dtmEffectiveRange.FromDateFieldBindingKey = "effective_from";
            this.dtmEffectiveRange.FromDateMandatory = true;
            this.dtmEffectiveRange.FromDateTitle = "Effective From";
            this.dtmEffectiveRange.Location = new System.Drawing.Point(339, 178);
            this.dtmEffectiveRange.Name = "dtmEffectiveRange";
            this.dtmEffectiveRange.ReadOnly = false;
            this.dtmEffectiveRange.Size = new System.Drawing.Size(311, 331);
            this.dtmEffectiveRange.TabIndex = 3;
            this.dtmEffectiveRange.TitleInQueryMode = null;
            this.dtmEffectiveRange.ToDate = null;
            this.dtmEffectiveRange.ToDateFieldBindingKey = "effective_till";
            this.dtmEffectiveRange.ToDateMandatory = true;
            this.dtmEffectiveRange.ToDateTitle = "Effective Till";
            // 
            // intOccupationID
            // 
            this.intOccupationID.AllowsNew = false;
            this.intOccupationID.AllowsReference = false;
            this.intOccupationID.AllowsUpdate = false;
            this.intOccupationID.ApplicationIdForDbConnection = null;
            this.intOccupationID.BackColor = System.Drawing.Color.Transparent;
            this.intOccupationID.CalledScreenApplicationId = null;
            this.intOccupationID.CalledScreenTypeName = null;
            this.intOccupationID.CallingScreenType = null;
            this.intOccupationID.DisplayText = "";
            this.intOccupationID.DisplayTextBindingKey = "occupation_id";
            this.intOccupationID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intOccupationID.EditingControlDataGridView = null;
            this.intOccupationID.EditingControlFormattedValue = "";
            this.intOccupationID.EditingControlRowIndex = 0;
            this.intOccupationID.EditingControlValueChanged = false;
            this.intOccupationID.EnableToolTip = false;
            this.intOccupationID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intOccupationID.IdText = null;
            this.intOccupationID.IdTextBindingKey = "occupation_id";
            this.intOccupationID.Location = new System.Drawing.Point(656, 128);
            this.intOccupationID.Lookup = false;
            this.intOccupationID.LookupColumns = null;
            this.intOccupationID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intOccupationID.LookupResult = null;
            this.intOccupationID.Mandatory = false;
            this.intOccupationID.MaxCharacterLength = 32767;
            this.intOccupationID.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intOccupationID.MaxValue = ((long)(9223372036854775807));
            this.intOccupationID.MinimumSize = new System.Drawing.Size(10, 22);
            this.intOccupationID.MinValue = ((long)(-9223372036854775808));
            this.intOccupationID.Name = "intOccupationID";
            this.intOccupationID.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intOccupationID.PascalCase = false;
            this.intOccupationID.RangeInQueryMode = false;
            this.intOccupationID.ReadOnly = true;
            this.intOccupationID.RegularExpressionValidator = null;
            this.intOccupationID.Size = new System.Drawing.Size(91, 44);
            this.intOccupationID.TabIndex = 2;
            this.intOccupationID.TabStop = false;
            this.intOccupationID.Title = "Occupation ID";
            this.intOccupationID.ToolTipLookupField = null;
            this.intOccupationID.ValueText = null;
            // 
            // txtOccupationCode
            // 
            this.txtOccupationCode.AllowsNew = false;
            this.txtOccupationCode.AllowsReference = false;
            this.txtOccupationCode.AllowsUpdate = false;
            this.txtOccupationCode.ApplicationIdForDbConnection = null;
            this.txtOccupationCode.BackColor = System.Drawing.Color.Transparent;
            this.txtOccupationCode.CalledScreenApplicationId = null;
            this.txtOccupationCode.CalledScreenTypeName = null;
            this.txtOccupationCode.CallingScreenType = null;
            this.txtOccupationCode.DisplayText = "";
            this.txtOccupationCode.DisplayTextBindingKey = "occupation_cd";
            this.txtOccupationCode.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtOccupationCode.EditingControlDataGridView = null;
            this.txtOccupationCode.EditingControlFormattedValue = "";
            this.txtOccupationCode.EditingControlRowIndex = 0;
            this.txtOccupationCode.EditingControlValueChanged = false;
            this.txtOccupationCode.EnableToolTip = false;
            this.txtOccupationCode.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtOccupationCode.IdText = null;
            this.txtOccupationCode.IdTextBindingKey = "";
            this.txtOccupationCode.Location = new System.Drawing.Point(537, 128);
            this.txtOccupationCode.Lookup = false;
            this.txtOccupationCode.LookupColumns = null;
            this.txtOccupationCode.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtOccupationCode.LookupResult = null;
            this.txtOccupationCode.Mandatory = true;
            this.txtOccupationCode.MaxCharacterLength = 5;
            this.txtOccupationCode.MaximumSize = new System.Drawing.Size(1300, 44);
            this.txtOccupationCode.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtOccupationCode.Name = "txtOccupationCode";
            this.txtOccupationCode.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtOccupationCode.PascalCase = false;
            this.txtOccupationCode.RangeInQueryMode = false;
            this.txtOccupationCode.ReadOnly = false;
            this.txtOccupationCode.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtOccupationCode.Size = new System.Drawing.Size(113, 44);
            this.txtOccupationCode.TabIndex = 0;
            this.txtOccupationCode.Title = "Occupation Code";
            this.txtOccupationCode.ToolTipLookupField = "information";
            this.txtOccupationCode.ValueText = null;
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
            this.occupation_id,
            this.occupation_nm,
            this.occupation_cd,
            this.Effective_From,
            this.Effective_Till,
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
            this.grdList.Size = new System.Drawing.Size(25, 512);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
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
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dccGrid1.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle5;
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
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn1.DefaultCellStyle = dataGridViewCellStyle6;
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
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn2.DefaultCellStyle = dataGridViewCellStyle7;
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
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn3.DefaultCellStyle = dataGridViewCellStyle8;
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
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn4.DefaultCellStyle = dataGridViewCellStyle9;
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
            // occupation_id
            // 
            this.occupation_id.BindingKey = "occupation_id";
            this.occupation_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.occupation_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.occupation_id.HeaderText = "Id";
            this.occupation_id.Lookup = false;
            this.occupation_id.LookupColumns = "";
            this.occupation_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.occupation_id.Mandatory = true;
            this.occupation_id.MaxValue = ((long)(9223372036854775807));
            this.occupation_id.MinValue = ((long)(-9223372036854775808));
            this.occupation_id.Name = "occupation_id";
            this.occupation_id.PercentageWidth = 25;
            this.occupation_id.ReadOnly = true;
            this.occupation_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.occupation_id.ToolTipLookupField = "information";
            this.occupation_id.Visible = false;
            this.occupation_id.Width = 5;
            // 
            // occupation_nm
            // 
            this.occupation_nm.BindingKey = "occupation_nm";
            this.occupation_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.occupation_nm.HeaderText = "Name";
            this.occupation_nm.Lookup = false;
            this.occupation_nm.LookupColumns = "";
            this.occupation_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.occupation_nm.Mandatory = true;
            this.occupation_nm.MaxCharacterLength = 2147483647;
            this.occupation_nm.Name = "occupation_nm";
            this.occupation_nm.PercentageWidth = 40;
            this.occupation_nm.ReadOnly = true;
            this.occupation_nm.RegularExpressionValidator = "";
            this.occupation_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.occupation_nm.ToolTipLookupField = "information";
            this.occupation_nm.Width = 5;
            // 
            // occupation_cd
            // 
            this.occupation_cd.BindingKey = "occupation_cd";
            this.occupation_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.occupation_cd.HeaderText = "Code";
            this.occupation_cd.Lookup = false;
            this.occupation_cd.LookupColumns = "";
            this.occupation_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.occupation_cd.Mandatory = false;
            this.occupation_cd.MaxCharacterLength = 2147483647;
            this.occupation_cd.Name = "occupation_cd";
            this.occupation_cd.PercentageWidth = 20;
            this.occupation_cd.ReadOnly = true;
            this.occupation_cd.RegularExpressionValidator = "";
            this.occupation_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.occupation_cd.ToolTipLookupField = "information";
            this.occupation_cd.Width = 5;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_From.DefaultCellStyle = dataGridViewCellStyle3;
            this.Effective_From.HeaderText = "Effective_From";
            this.Effective_From.Lookup = false;
            this.Effective_From.LookupColumns = "";
            this.Effective_From.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_From.Mandatory = false;
            this.Effective_From.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_From.MinValue = new System.DateTime(((long)(0)));
            this.Effective_From.Name = "Effective_From";
            this.Effective_From.PercentageWidth = 20;
            this.Effective_From.ReadOnly = true;
            this.Effective_From.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Effective_From.ToolTipLookupField = "information";
            this.Effective_From.Width = 5;
            // 
            // Effective_Till
            // 
            this.Effective_Till.BindingKey = "effective_till";
            this.Effective_Till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_Till.DefaultCellStyle = dataGridViewCellStyle4;
            this.Effective_Till.HeaderText = "Effective_Till";
            this.Effective_Till.Lookup = false;
            this.Effective_Till.LookupColumns = "";
            this.Effective_Till.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_Till.Mandatory = false;
            this.Effective_Till.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_Till.MinValue = new System.DateTime(((long)(0)));
            this.Effective_Till.Name = "Effective_Till";
            this.Effective_Till.PercentageWidth = 20;
            this.Effective_Till.ReadOnly = true;
            this.Effective_Till.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Effective_Till.ToolTipLookupField = "information";
            this.Effective_Till.Width = 5;
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
            this.txn_ts.Width = 5;
            // 
            // Occupations
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(956, 512);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "Occupations";
            this.Text = "Zonal Sewadar Management - [Occupations]";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.tableLayoutPanel2.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtOccupationName;
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
        private DCC.UMB.CDF.UIControls.TextControls.DateRangePair dtmEffectiveRange;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intOccupationID;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtOccupationCode;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn occupation_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn occupation_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn occupation_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
    }
}