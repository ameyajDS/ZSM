namespace DCC.ZOS.ZSM.ENT
{
    partial class Colours
    {
        /// <summary>
        /// Required designer variable
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle13 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle14 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle15 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle16 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle17 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle18 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle19 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Colours));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle20 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle21 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle22 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle23 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.intBlueComponent = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.intGreenComponent = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.intRedComponent = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.txtRemarks = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.txtName = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.dtmEffectiveRange = new DCC.UMB.CDF.UIControls.TextControls.DateRangePair();
            this.intID = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.btnColor = new System.Windows.Forms.Button();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.colour_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.colour_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.red_component = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.green_component = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.blue_component = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.Remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Effective_From = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.Effective_Till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.old_colour_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
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
            this.scListOrBrowse.Margin = new System.Windows.Forms.Padding(4);
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
            this.scListOrBrowse.Size = new System.Drawing.Size(1275, 630);
            this.scListOrBrowse.SplitterDistance = 927;
            this.scListOrBrowse.SplitterWidth = 5;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 5;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30.46979F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.81239F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.81239F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.20175F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 31.70369F));
            this.tableLayoutPanel1.Controls.Add(this.intBlueComponent, 3, 2);
            this.tableLayoutPanel1.Controls.Add(this.intGreenComponent, 2, 2);
            this.tableLayoutPanel1.Controls.Add(this.intRedComponent, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.txtRemarks, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.txtName, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.dtmEffectiveRange, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.intID, 3, 1);
            this.tableLayoutPanel1.Controls.Add(this.btnColor, 4, 2);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(4);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 6;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 18.47402F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.570313F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 9.570313F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.15625F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.3125F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 31.59619F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1275, 630);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // intBlueComponent
            // 
            this.intBlueComponent.AllowsNew = false;
            this.intBlueComponent.AllowsReference = false;
            this.intBlueComponent.AllowsUpdate = false;
            this.intBlueComponent.ApplicationIdForDbConnection = null;
            this.intBlueComponent.BackColor = System.Drawing.Color.Transparent;
            this.intBlueComponent.CalledScreenApplicationId = null;
            this.intBlueComponent.CalledScreenTypeName = null;
            this.intBlueComponent.CallingScreenType = null;
            this.intBlueComponent.DisplayText = "";
            this.intBlueComponent.DisplayTextBindingKey = "blue_component";
            this.intBlueComponent.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intBlueComponent.EditingControlDataGridView = null;
            this.intBlueComponent.EditingControlFormattedValue = "";
            this.intBlueComponent.EditingControlRowIndex = 0;
            this.intBlueComponent.EditingControlValueChanged = false;
            this.intBlueComponent.EnableToolTip = false;
            this.intBlueComponent.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intBlueComponent.IdText = null;
            this.intBlueComponent.IdTextBindingKey = "blue_component";
            this.intBlueComponent.Location = new System.Drawing.Point(719, 180);
            this.intBlueComponent.Lookup = false;
            this.intBlueComponent.LookupColumns = null;
            this.intBlueComponent.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intBlueComponent.LookupResult = null;
            this.intBlueComponent.Mandatory = true;
            this.intBlueComponent.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intBlueComponent.MaxCharacterLength = 3;
            this.intBlueComponent.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intBlueComponent.MaxValue = ((long)(255));
            this.intBlueComponent.MinCharactersForQuery = 0;
            this.intBlueComponent.MinimumSize = new System.Drawing.Size(13, 27);
            this.intBlueComponent.MinValue = ((long)(0));
            this.intBlueComponent.Name = "intBlueComponent";
            this.intBlueComponent.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intBlueComponent.PascalCase = false;
            this.intBlueComponent.RangeInQueryMode = false;
            this.intBlueComponent.ReadOnly = false;
            this.intBlueComponent.RegularExpressionValidator = null;
            this.intBlueComponent.Size = new System.Drawing.Size(145, 52);
            this.intBlueComponent.TabIndex = 4;
            this.intBlueComponent.Title = "Blue Component";
            this.intBlueComponent.ToolTipLookupField = null;
            this.intBlueComponent.ValueText = null;
            this.intBlueComponent.Validating += new System.ComponentModel.CancelEventHandler(this.intBlueComponent_Validating);
            // 
            // intGreenComponent
            // 
            this.intGreenComponent.AllowsNew = false;
            this.intGreenComponent.AllowsReference = false;
            this.intGreenComponent.AllowsUpdate = false;
            this.intGreenComponent.ApplicationIdForDbConnection = null;
            this.intGreenComponent.BackColor = System.Drawing.Color.Transparent;
            this.intGreenComponent.CalledScreenApplicationId = null;
            this.intGreenComponent.CalledScreenTypeName = null;
            this.intGreenComponent.CallingScreenType = null;
            this.intGreenComponent.DisplayText = "";
            this.intGreenComponent.DisplayTextBindingKey = "green_component";
            this.intGreenComponent.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intGreenComponent.EditingControlDataGridView = null;
            this.intGreenComponent.EditingControlFormattedValue = "";
            this.intGreenComponent.EditingControlRowIndex = 0;
            this.intGreenComponent.EditingControlValueChanged = false;
            this.intGreenComponent.EnableToolTip = false;
            this.intGreenComponent.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intGreenComponent.IdText = null;
            this.intGreenComponent.IdTextBindingKey = "green_component";
            this.intGreenComponent.Location = new System.Drawing.Point(556, 180);
            this.intGreenComponent.Lookup = false;
            this.intGreenComponent.LookupColumns = null;
            this.intGreenComponent.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intGreenComponent.LookupResult = null;
            this.intGreenComponent.Mandatory = true;
            this.intGreenComponent.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intGreenComponent.MaxCharacterLength = 3;
            this.intGreenComponent.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intGreenComponent.MaxValue = ((long)(255));
            this.intGreenComponent.MinCharactersForQuery = 0;
            this.intGreenComponent.MinimumSize = new System.Drawing.Size(13, 27);
            this.intGreenComponent.MinValue = ((long)(0));
            this.intGreenComponent.Name = "intGreenComponent";
            this.intGreenComponent.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intGreenComponent.PascalCase = false;
            this.intGreenComponent.RangeInQueryMode = false;
            this.intGreenComponent.ReadOnly = false;
            this.intGreenComponent.RegularExpressionValidator = null;
            this.intGreenComponent.Size = new System.Drawing.Size(153, 52);
            this.intGreenComponent.TabIndex = 3;
            this.intGreenComponent.Title = "Green Component";
            this.intGreenComponent.ToolTipLookupField = null;
            this.intGreenComponent.ValueText = null;
            this.intGreenComponent.Validating += new System.ComponentModel.CancelEventHandler(this.intGreenComponent_Validating);
            // 
            // intRedComponent
            // 
            this.intRedComponent.AllowsNew = false;
            this.intRedComponent.AllowsReference = false;
            this.intRedComponent.AllowsUpdate = false;
            this.intRedComponent.ApplicationIdForDbConnection = null;
            this.intRedComponent.BackColor = System.Drawing.Color.Transparent;
            this.intRedComponent.CalledScreenApplicationId = null;
            this.intRedComponent.CalledScreenTypeName = null;
            this.intRedComponent.CallingScreenType = null;
            this.intRedComponent.DisplayText = "";
            this.intRedComponent.DisplayTextBindingKey = "red_component";
            this.intRedComponent.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intRedComponent.EditingControlDataGridView = null;
            this.intRedComponent.EditingControlFormattedValue = "";
            this.intRedComponent.EditingControlRowIndex = 0;
            this.intRedComponent.EditingControlValueChanged = false;
            this.intRedComponent.EnableToolTip = false;
            this.intRedComponent.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intRedComponent.IdText = null;
            this.intRedComponent.IdTextBindingKey = "red_component";
            this.intRedComponent.Location = new System.Drawing.Point(393, 180);
            this.intRedComponent.Lookup = false;
            this.intRedComponent.LookupColumns = null;
            this.intRedComponent.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intRedComponent.LookupResult = null;
            this.intRedComponent.Mandatory = true;
            this.intRedComponent.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intRedComponent.MaxCharacterLength = 3;
            this.intRedComponent.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intRedComponent.MaxValue = ((long)(255));
            this.intRedComponent.MinCharactersForQuery = 0;
            this.intRedComponent.MinimumSize = new System.Drawing.Size(13, 27);
            this.intRedComponent.MinValue = ((long)(0));
            this.intRedComponent.Name = "intRedComponent";
            this.intRedComponent.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intRedComponent.PascalCase = false;
            this.intRedComponent.RangeInQueryMode = false;
            this.intRedComponent.ReadOnly = false;
            this.intRedComponent.RegularExpressionValidator = null;
            this.intRedComponent.Size = new System.Drawing.Size(153, 52);
            this.intRedComponent.TabIndex = 2;
            this.intRedComponent.Title = "Red Component";
            this.intRedComponent.ToolTipLookupField = null;
            this.intRedComponent.ValueText = null;
            this.intRedComponent.Validating += new System.ComponentModel.CancelEventHandler(this.intRedComponent_Validating);
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
            this.tableLayoutPanel1.SetColumnSpan(this.txtRemarks, 5);
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
            this.txtRemarks.Location = new System.Drawing.Point(133, 304);
            this.txtRemarks.Lookup = false;
            this.txtRemarks.LookupColumns = null;
            this.txtRemarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtRemarks.LookupResult = null;
            this.txtRemarks.Mandatory = false;
            this.txtRemarks.Margin = new System.Windows.Forms.Padding(133, 4, 133, 4);
            this.txtRemarks.MaxCharacterLength = 100;
            this.txtRemarks.MaximumSize = new System.Drawing.Size(1733, 54);
            this.txtRemarks.MinCharactersForQuery = 0;
            this.txtRemarks.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtRemarks.PascalCase = false;
            this.txtRemarks.RangeInQueryMode = false;
            this.txtRemarks.ReadOnly = false;
            this.txtRemarks.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtRemarks.Size = new System.Drawing.Size(1009, 54);
            this.txtRemarks.TabIndex = 6;
            this.txtRemarks.Title = "Remarks";
            this.txtRemarks.ToolTipLookupField = "information";
            this.txtRemarks.ValueText = null;
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
            this.txtName.DisplayTextBindingKey = "colour_nm";
            this.txtName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtName.EditingControlDataGridView = null;
            this.txtName.EditingControlFormattedValue = "";
            this.txtName.EditingControlRowIndex = 0;
            this.txtName.EditingControlValueChanged = false;
            this.txtName.EnableToolTip = false;
            this.txtName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.IdText = null;
            this.txtName.IdTextBindingKey = null;
            this.txtName.Location = new System.Drawing.Point(393, 120);
            this.txtName.Lookup = false;
            this.txtName.LookupColumns = null;
            this.txtName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtName.LookupResult = null;
            this.txtName.Mandatory = true;
            this.txtName.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.txtName.MaxCharacterLength = 15;
            this.txtName.MaximumSize = new System.Drawing.Size(1733, 54);
            this.txtName.MinCharactersForQuery = 0;
            this.txtName.MinimumSize = new System.Drawing.Size(13, 27);
            this.txtName.Name = "txtName";
            this.txtName.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtName.PascalCase = false;
            this.txtName.RangeInQueryMode = false;
            this.txtName.ReadOnly = false;
            this.txtName.RegularExpressionValidator = "^[0-9a-zA-Z .]+$";
            this.txtName.Size = new System.Drawing.Size(316, 52);
            this.txtName.TabIndex = 0;
            this.txtName.Title = "Colour Name";
            this.txtName.ToolTipLookupField = "information";
            this.txtName.ValueText = null;
            // 
            // dtmEffectiveRange
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.dtmEffectiveRange, 3);
            this.dtmEffectiveRange.DiscreteInQueryMode = true;
            this.dtmEffectiveRange.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmEffectiveRange.FillDefailtValuesInInsertMode = true;
            this.dtmEffectiveRange.FromDate = null;
            this.dtmEffectiveRange.FromDateFieldBindingKey = "effective_from";
            this.dtmEffectiveRange.FromDateMandatory = true;
            this.dtmEffectiveRange.FromDateTitle = "Effective From";
            this.dtmEffectiveRange.Location = new System.Drawing.Point(428, 240);
            this.dtmEffectiveRange.Margin = new System.Windows.Forms.Padding(40, 4, 40, 4);
            this.dtmEffectiveRange.Name = "dtmEffectiveRange";
            this.dtmEffectiveRange.ReadOnly = false;
            this.dtmEffectiveRange.Size = new System.Drawing.Size(401, 56);
            this.dtmEffectiveRange.TabIndex = 5;
            this.dtmEffectiveRange.TitleInQueryMode = "Effective On";
            this.dtmEffectiveRange.ToDate = null;
            this.dtmEffectiveRange.ToDateFieldBindingKey = "effective_till";
            this.dtmEffectiveRange.ToDateMandatory = true;
            this.dtmEffectiveRange.ToDateTitle = "Effective Till";
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
            this.intID.DisplayTextBindingKey = "colour_id";
            this.intID.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intID.EditingControlDataGridView = null;
            this.intID.EditingControlFormattedValue = "";
            this.intID.EditingControlRowIndex = 0;
            this.intID.EditingControlValueChanged = false;
            this.intID.EnableToolTip = false;
            this.intID.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intID.IdText = null;
            this.intID.IdTextBindingKey = "colour_id";
            this.intID.Location = new System.Drawing.Point(719, 120);
            this.intID.Lookup = false;
            this.intID.LookupColumns = null;
            this.intID.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.intID.LookupResult = null;
            this.intID.Mandatory = false;
            this.intID.Margin = new System.Windows.Forms.Padding(5, 4, 5, 4);
            this.intID.MaxCharacterLength = 2;
            this.intID.MaximumSize = new System.Drawing.Size(1733, 55);
            this.intID.MaxValue = ((long)(9223372036854775807));
            this.intID.MinCharactersForQuery = 0;
            this.intID.MinimumSize = new System.Drawing.Size(13, 27);
            this.intID.MinValue = ((long)(-9223372036854775808));
            this.intID.Name = "intID";
            this.intID.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.intID.PascalCase = false;
            this.intID.RangeInQueryMode = false;
            this.intID.ReadOnly = false;
            this.intID.RegularExpressionValidator = null;
            this.intID.Size = new System.Drawing.Size(145, 52);
            this.intID.TabIndex = 1;
            this.intID.Title = "Colour ID";
            this.intID.ToolTipLookupField = null;
            this.intID.ValueText = null;
            // 
            // btnColor
            // 
            this.btnColor.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnColor.Location = new System.Drawing.Point(872, 179);
            this.btnColor.Name = "btnColor";
            this.btnColor.Size = new System.Drawing.Size(75, 54);
            this.btnColor.TabIndex = 7;
            this.btnColor.UseVisualStyleBackColor = true;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            dataGridViewCellStyle13.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle13.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle13.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle13.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle13.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle13.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle13.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdList.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle13;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colour_id,
            this.colour_nm,
            this.red_component,
            this.green_component,
            this.blue_component,
            this.Remarks,
            this.Effective_From,
            this.Effective_Till,
            this.txn_ts,
            this.old_colour_id});
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
            this.grdList.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(96, 100);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // colour_id
            // 
            this.colour_id.BindingKey = "colour_id";
            this.colour_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle14.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.colour_id.DefaultCellStyle = dataGridViewCellStyle14;
            this.colour_id.HeaderText = "Id";
            this.colour_id.Lookup = false;
            this.colour_id.LookupColumns = "";
            this.colour_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.colour_id.Mandatory = true;
            this.colour_id.MaxValue = ((long)(9223372036854775807));
            this.colour_id.MinValue = ((long)(-9223372036854775808));
            this.colour_id.Name = "colour_id";
            this.colour_id.PercentageWidth = 25;
            this.colour_id.ReadOnly = true;
            this.colour_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.colour_id.ToolTipLookupField = "information";
            this.colour_id.Visible = false;
            this.colour_id.Width = 5;
            // 
            // colour_nm
            // 
            this.colour_nm.BindingKey = "colour_nm";
            this.colour_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.colour_nm.HeaderText = "Name";
            this.colour_nm.Lookup = false;
            this.colour_nm.LookupColumns = "";
            this.colour_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.colour_nm.Mandatory = true;
            this.colour_nm.MaxCharacterLength = 2147483647;
            this.colour_nm.Name = "colour_nm";
            this.colour_nm.PercentageWidth = 25;
            this.colour_nm.ReadOnly = true;
            this.colour_nm.RegularExpressionValidator = "";
            this.colour_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.colour_nm.ToolTipLookupField = "information";
            this.colour_nm.Width = 20;
            // 
            // red_component
            // 
            this.red_component.BindingKey = "red_component";
            this.red_component.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle15.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.red_component.DefaultCellStyle = dataGridViewCellStyle15;
            this.red_component.HeaderText = "Red";
            this.red_component.Lookup = false;
            this.red_component.LookupColumns = "";
            this.red_component.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.red_component.Mandatory = false;
            this.red_component.MaxValue = ((long)(9223372036854775807));
            this.red_component.MinValue = ((long)(-9223372036854775808));
            this.red_component.Name = "red_component";
            this.red_component.PercentageWidth = 10;
            this.red_component.ReadOnly = true;
            this.red_component.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.red_component.ToolTipLookupField = "information";
            this.red_component.Width = 8;
            // 
            // green_component
            // 
            this.green_component.BindingKey = "green_component";
            this.green_component.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle16.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.green_component.DefaultCellStyle = dataGridViewCellStyle16;
            this.green_component.HeaderText = "Green";
            this.green_component.Lookup = false;
            this.green_component.LookupColumns = "";
            this.green_component.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.green_component.Mandatory = false;
            this.green_component.MaxValue = ((long)(9223372036854775807));
            this.green_component.MinValue = ((long)(-9223372036854775808));
            this.green_component.Name = "green_component";
            this.green_component.PercentageWidth = 10;
            this.green_component.ReadOnly = true;
            this.green_component.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.green_component.ToolTipLookupField = "information";
            this.green_component.Width = 8;
            // 
            // blue_component
            // 
            this.blue_component.BindingKey = "blue_component";
            this.blue_component.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle17.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.blue_component.DefaultCellStyle = dataGridViewCellStyle17;
            this.blue_component.HeaderText = "Blue";
            this.blue_component.Lookup = false;
            this.blue_component.LookupColumns = "";
            this.blue_component.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.blue_component.Mandatory = false;
            this.blue_component.MaxValue = ((long)(9223372036854775807));
            this.blue_component.MinValue = ((long)(-9223372036854775808));
            this.blue_component.Name = "blue_component";
            this.blue_component.PercentageWidth = 10;
            this.blue_component.ReadOnly = true;
            this.blue_component.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.blue_component.ToolTipLookupField = "information";
            this.blue_component.Width = 8;
            // 
            // Remarks
            // 
            this.Remarks.BindingKey = "Remarks";
            this.Remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.Remarks.HeaderText = "Remarks";
            this.Remarks.Lookup = false;
            this.Remarks.LookupColumns = "";
            this.Remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Remarks.Mandatory = false;
            this.Remarks.MaxCharacterLength = 2147483647;
            this.Remarks.Name = "Remarks";
            this.Remarks.PercentageWidth = 23;
            this.Remarks.ReadOnly = true;
            this.Remarks.RegularExpressionValidator = "";
            this.Remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Remarks.ToolTipLookupField = "information";
            this.Remarks.Width = 18;
            // 
            // Effective_From
            // 
            this.Effective_From.BindingKey = "effective_from";
            this.Effective_From.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle18.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_From.DefaultCellStyle = dataGridViewCellStyle18;
            this.Effective_From.HeaderText = "Effective_From";
            this.Effective_From.Lookup = false;
            this.Effective_From.LookupColumns = "";
            this.Effective_From.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_From.Mandatory = false;
            this.Effective_From.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_From.MinValue = new System.DateTime(((long)(0)));
            this.Effective_From.Name = "Effective_From";
            this.Effective_From.PercentageWidth = 11;
            this.Effective_From.ReadOnly = true;
            this.Effective_From.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Effective_From.ToolTipLookupField = "information";
            this.Effective_From.Width = 8;
            // 
            // Effective_Till
            // 
            this.Effective_Till.BindingKey = "effective_till";
            this.Effective_Till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle19.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Effective_Till.DefaultCellStyle = dataGridViewCellStyle19;
            this.Effective_Till.HeaderText = "Effective_Till";
            this.Effective_Till.Lookup = false;
            this.Effective_Till.LookupColumns = "";
            this.Effective_Till.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Effective_Till.Mandatory = false;
            this.Effective_Till.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.Effective_Till.MinValue = new System.DateTime(((long)(0)));
            this.Effective_Till.Name = "Effective_Till";
            this.Effective_Till.PercentageWidth = 11;
            this.Effective_Till.ReadOnly = true;
            this.Effective_Till.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Effective_Till.ToolTipLookupField = "information";
            this.Effective_Till.Width = 8;
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
            // old_colour_id
            // 
            this.old_colour_id.BindingKey = "old_colour_id";
            this.old_colour_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.old_colour_id.HeaderText = "old_colour_id";
            this.old_colour_id.Lookup = false;
            this.old_colour_id.LookupColumns = "";
            this.old_colour_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.old_colour_id.Mandatory = false;
            this.old_colour_id.MaxCharacterLength = 2147483647;
            this.old_colour_id.Name = "old_colour_id";
            this.old_colour_id.PercentageWidth = 25;
            this.old_colour_id.ReadOnly = true;
            this.old_colour_id.RegularExpressionValidator = "";
            this.old_colour_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.old_colour_id.ToolTipLookupField = "information";
            this.old_colour_id.Visible = false;
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
            dataGridViewCellStyle20.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn1.DefaultCellStyle = dataGridViewCellStyle20;
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
            dataGridViewCellStyle21.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn2.DefaultCellStyle = dataGridViewCellStyle21;
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
            dataGridViewCellStyle22.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn3.DefaultCellStyle = dataGridViewCellStyle22;
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
            dataGridViewCellStyle23.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.dccDateGridColumn4.DefaultCellStyle = dataGridViewCellStyle23;
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
            // Colours
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1275, 630);
            this.Controls.Add(this.scListOrBrowse);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Colours";
            this.Text = "Zonal Sewadar Management - COUNTRIES]";
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
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtName;
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
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intID;
        private DCC.UMB.CDF.UIControls.TextControls.DCCTextField txtRemarks;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intRedComponent;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intBlueComponent;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField intGreenComponent;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn colour_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn colour_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn red_component;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn green_component;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn blue_component;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn Remarks;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_From;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn Effective_Till;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn old_colour_id;
        private System.Windows.Forms.Button btnColor;
    }
}