using DCC.UMB.CDF.UIControls.TextControls;
namespace DCC.ZOS.ZSM.RPT
{
    partial class RosterPrinting
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
            this.tlpRootPanel = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.txtSatsangCentre = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.sewaLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.sewaTeamsLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewaLookupLastYear = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.sewaLookupSecondLast = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.sewaLookupThirdLat = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.sewaContructionLookup = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup();
            this.yesNoCombo1 = new DCC.UMB.CDBControls.DropDown.YesNoCombo();
            this.tableLayoutPanel1.SuspendLayout();
            this.tlpRootPanel.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 3;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel1.Controls.Add(this.tlpRootPanel, 1, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 3;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.092198F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 75.53191F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 17.55319F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(893, 564);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // tlpRootPanel
            // 
            this.tlpRootPanel.ColumnCount = 2;
            this.tlpRootPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpRootPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpRootPanel.Controls.Add(this.txtSatsangCentre, 0, 0);
            this.tlpRootPanel.Controls.Add(this.sewaLookup1, 0, 1);
            this.tlpRootPanel.Controls.Add(this.sewaTeamsLookup1, 0, 2);
            this.tlpRootPanel.Controls.Add(this.groupBox1, 0, 3);
            this.tlpRootPanel.Controls.Add(this.yesNoCombo1, 0, 4);
            this.tlpRootPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpRootPanel.Location = new System.Drawing.Point(300, 42);
            this.tlpRootPanel.Name = "tlpRootPanel";
            this.tlpRootPanel.RowCount = 5;
            this.tlpRootPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 13.04348F));
            this.tlpRootPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 13.04348F));
            this.tlpRootPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 13.04348F));
            this.tlpRootPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 47.82609F));
            this.tlpRootPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 13.04348F));
            this.tlpRootPanel.Size = new System.Drawing.Size(291, 419);
            this.tlpRootPanel.TabIndex = 2;
            // 
            // txtSatsangCentre
            // 
            this.txtSatsangCentre.AllowsNew = false;
            this.txtSatsangCentre.AllowsReference = false;
            this.txtSatsangCentre.AllowsUpdate = false;
            this.txtSatsangCentre.ApplicationIdForDbConnection = null;
            this.txtSatsangCentre.BackColor = System.Drawing.Color.Transparent;
            this.txtSatsangCentre.CalledScreenApplicationId = null;
            this.txtSatsangCentre.CalledScreenTypeName = null;
            this.txtSatsangCentre.CallingScreenType = null;
            this.tlpRootPanel.SetColumnSpan(this.txtSatsangCentre, 2);
            this.txtSatsangCentre.DisplayText = "";
            this.txtSatsangCentre.DisplayTextBindingKey = null;
            this.txtSatsangCentre.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSatsangCentre.EditingControlDataGridView = null;
            this.txtSatsangCentre.EditingControlFormattedValue = "";
            this.txtSatsangCentre.EditingControlRowIndex = 0;
            this.txtSatsangCentre.EditingControlValueChanged = false;
            this.txtSatsangCentre.EnableToolTip = false;
            this.txtSatsangCentre.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSatsangCentre.IdText = null;
            this.txtSatsangCentre.IdTextBindingKey = null;
            this.txtSatsangCentre.Location = new System.Drawing.Point(4, 3);
            this.txtSatsangCentre.Lookup = false;
            this.txtSatsangCentre.LookupColumns = null;
            this.txtSatsangCentre.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSatsangCentre.LookupResult = null;
            this.txtSatsangCentre.LookupTitle = "Satsang Centre";
            this.txtSatsangCentre.Mandatory = false;
            this.txtSatsangCentre.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSatsangCentre.MaxCharacterLength = 32767;
            this.txtSatsangCentre.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSatsangCentre.MinCharactersForQuery = 0;
            this.txtSatsangCentre.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSatsangCentre.Name = "txtSatsangCentre";
            this.txtSatsangCentre.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSatsangCentre.PascalCase = false;
            this.txtSatsangCentre.RangeInQueryMode = false;
            this.txtSatsangCentre.ReadOnly = true;
            this.txtSatsangCentre.RegularExpressionValidator = null;
            this.txtSatsangCentre.Size = new System.Drawing.Size(283, 45);
            this.txtSatsangCentre.TabIndex = 0;
            this.txtSatsangCentre.TabStop = false;
            this.txtSatsangCentre.Title = "Satsang Centre";
            this.txtSatsangCentre.ToolTipLookupField = "information";
            this.txtSatsangCentre.ValueText = null;
            // 
            // sewaLookup1
            // 
            this.sewaLookup1.AllowsNew = false;
            this.sewaLookup1.AllowsReference = false;
            this.sewaLookup1.AllowsUpdate = false;
            this.sewaLookup1.ApplicationIdForDbConnection = null;
            this.sewaLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewaLookup1.CalledScreenApplicationId = null;
            this.sewaLookup1.CalledScreenTypeName = null;
            this.sewaLookup1.CallingScreenType = null;
            this.tlpRootPanel.SetColumnSpan(this.sewaLookup1, 2);
            this.sewaLookup1.DisplayText = "";
            this.sewaLookup1.DisplayTextBindingKey = null;
            this.sewaLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaLookup1.EditingControlDataGridView = null;
            this.sewaLookup1.EditingControlFormattedValue = null;
            this.sewaLookup1.EditingControlRowIndex = 0;
            this.sewaLookup1.EditingControlValueChanged = true;
            this.sewaLookup1.EnableToolTip = false;
            this.sewaLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaLookup1.IdText = "";
            this.sewaLookup1.IdTextBindingKey = null;
            this.sewaLookup1.Location = new System.Drawing.Point(4, 57);
            this.sewaLookup1.Lookup = true;
            this.sewaLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.sewaLookup1.LookupResult = null;
            this.sewaLookup1.LookupTitle = "Sewa";
            this.sewaLookup1.Mandatory = true;
            this.sewaLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaLookup1.MaxCharacterLength = 32767;
            this.sewaLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaLookup1.MinCharactersForQuery = 0;
            this.sewaLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaLookup1.Name = "sewaLookup1";
            this.sewaLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaLookup1.PascalCase = false;
            this.sewaLookup1.RangeInQueryMode = false;
            this.sewaLookup1.ReadOnly = false;
            this.sewaLookup1.RegularExpressionValidator = null;
            this.sewaLookup1.Size = new System.Drawing.Size(283, 45);
            this.sewaLookup1.TabIndex = 1;
            this.sewaLookup1.Title = "Sewa";
            this.sewaLookup1.ToolTipLookupField = "information";
            this.sewaLookup1.ValueText = "";
            this.sewaLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookup1_LookupDialogShowing);
            // 
            // sewaTeamsLookup1
            // 
            this.sewaTeamsLookup1.AllowsNew = false;
            this.sewaTeamsLookup1.AllowsReference = false;
            this.sewaTeamsLookup1.AllowsUpdate = false;
            this.sewaTeamsLookup1.ApplicationIdForDbConnection = null;
            this.sewaTeamsLookup1.BackColor = System.Drawing.Color.Transparent;
            this.sewaTeamsLookup1.CalledScreenApplicationId = null;
            this.sewaTeamsLookup1.CalledScreenTypeName = null;
            this.sewaTeamsLookup1.CallingScreenType = null;
            this.tlpRootPanel.SetColumnSpan(this.sewaTeamsLookup1, 2);
            this.sewaTeamsLookup1.DisplayText = "";
            this.sewaTeamsLookup1.DisplayTextBindingKey = "sewa_team_nm";
            this.sewaTeamsLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaTeamsLookup1.EditingControlDataGridView = null;
            this.sewaTeamsLookup1.EditingControlFormattedValue = null;
            this.sewaTeamsLookup1.EditingControlRowIndex = 0;
            this.sewaTeamsLookup1.EditingControlValueChanged = true;
            this.sewaTeamsLookup1.EnableToolTip = false;
            this.sewaTeamsLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaTeamsLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaTeamsLookup1.IdText = "";
            this.sewaTeamsLookup1.IdTextBindingKey = "sewa_team_id";
            this.sewaTeamsLookup1.Location = new System.Drawing.Point(4, 111);
            this.sewaTeamsLookup1.Lookup = true;
            this.sewaTeamsLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewaTeamsLookup1.LookupResult = null;
            this.sewaTeamsLookup1.LookupTitle = "Sewa Team";
            this.sewaTeamsLookup1.Mandatory = true;
            this.sewaTeamsLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaTeamsLookup1.MaxCharacterLength = 32767;
            this.sewaTeamsLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaTeamsLookup1.MinCharactersForQuery = 0;
            this.sewaTeamsLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaTeamsLookup1.Name = "sewaTeamsLookup1";
            this.sewaTeamsLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaTeamsLookup1.PascalCase = false;
            this.sewaTeamsLookup1.RangeInQueryMode = false;
            this.sewaTeamsLookup1.ReadOnly = false;
            this.sewaTeamsLookup1.RegularExpressionValidator = null;
            this.sewaTeamsLookup1.Size = new System.Drawing.Size(283, 45);
            this.sewaTeamsLookup1.TabIndex = 2;
            this.sewaTeamsLookup1.Title = "Sewa Team";
            this.sewaTeamsLookup1.ToolTipLookupField = "information";
            this.sewaTeamsLookup1.ValueText = "";
            this.sewaTeamsLookup1.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaTeamsLookup1_LookupDialogShowing);
            // 
            // groupBox1
            // 
            this.tlpRootPanel.SetColumnSpan(this.groupBox1, 2);
            this.groupBox1.Controls.Add(this.dccTableLayoutPanel1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Location = new System.Drawing.Point(3, 165);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(285, 194);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Previous Years Sewa";
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 1;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel1.Controls.Add(this.sewaLookupLastYear, 0, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.sewaLookupSecondLast, 0, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.sewaLookupThirdLat, 0, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.sewaContructionLookup, 0, 3);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(3, 16);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 4;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25.00062F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25.00062F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25.00062F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 24.99813F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(279, 175);
            this.dccTableLayoutPanel1.TabIndex = 0;
            // 
            // sewaLookupLastYear
            // 
            this.sewaLookupLastYear.AllowsNew = false;
            this.sewaLookupLastYear.AllowsReference = false;
            this.sewaLookupLastYear.AllowsUpdate = false;
            this.sewaLookupLastYear.ApplicationIdForDbConnection = null;
            this.sewaLookupLastYear.BackColor = System.Drawing.Color.Transparent;
            this.sewaLookupLastYear.CalledScreenApplicationId = null;
            this.sewaLookupLastYear.CalledScreenTypeName = null;
            this.sewaLookupLastYear.CallingScreenType = null;
            this.sewaLookupLastYear.DisplayText = "";
            this.sewaLookupLastYear.DisplayTextBindingKey = null;
            this.sewaLookupLastYear.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaLookupLastYear.EditingControlDataGridView = null;
            this.sewaLookupLastYear.EditingControlFormattedValue = null;
            this.sewaLookupLastYear.EditingControlRowIndex = 0;
            this.sewaLookupLastYear.EditingControlValueChanged = true;
            this.sewaLookupLastYear.EnableToolTip = false;
            this.sewaLookupLastYear.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaLookupLastYear.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaLookupLastYear.IdText = "";
            this.sewaLookupLastYear.IdTextBindingKey = null;
            this.sewaLookupLastYear.Location = new System.Drawing.Point(4, 3);
            this.sewaLookupLastYear.Lookup = true;
            this.sewaLookupLastYear.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.sewaLookupLastYear.LookupResult = null;
            this.sewaLookupLastYear.LookupTitle = "Last Year Sewa";
            this.sewaLookupLastYear.Mandatory = false;
            this.sewaLookupLastYear.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaLookupLastYear.MaxCharacterLength = 32767;
            this.sewaLookupLastYear.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaLookupLastYear.MinCharactersForQuery = 0;
            this.sewaLookupLastYear.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaLookupLastYear.Name = "sewaLookupLastYear";
            this.sewaLookupLastYear.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaLookupLastYear.PascalCase = false;
            this.sewaLookupLastYear.RangeInQueryMode = false;
            this.sewaLookupLastYear.ReadOnly = false;
            this.sewaLookupLastYear.RegularExpressionValidator = null;
            this.sewaLookupLastYear.Size = new System.Drawing.Size(271, 37);
            this.sewaLookupLastYear.TabIndex = 0;
            this.sewaLookupLastYear.Title = "Last Year Sewa";
            this.sewaLookupLastYear.ToolTipLookupField = "information";
            this.sewaLookupLastYear.ValueText = "";
            this.sewaLookupLastYear.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookupLastYear_LookupDialogShowing);
            // 
            // sewaLookupSecondLast
            // 
            this.sewaLookupSecondLast.AllowsNew = false;
            this.sewaLookupSecondLast.AllowsReference = false;
            this.sewaLookupSecondLast.AllowsUpdate = false;
            this.sewaLookupSecondLast.ApplicationIdForDbConnection = null;
            this.sewaLookupSecondLast.BackColor = System.Drawing.Color.Transparent;
            this.sewaLookupSecondLast.CalledScreenApplicationId = null;
            this.sewaLookupSecondLast.CalledScreenTypeName = null;
            this.sewaLookupSecondLast.CallingScreenType = null;
            this.sewaLookupSecondLast.DisplayText = "";
            this.sewaLookupSecondLast.DisplayTextBindingKey = null;
            this.sewaLookupSecondLast.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaLookupSecondLast.EditingControlDataGridView = null;
            this.sewaLookupSecondLast.EditingControlFormattedValue = null;
            this.sewaLookupSecondLast.EditingControlRowIndex = 0;
            this.sewaLookupSecondLast.EditingControlValueChanged = true;
            this.sewaLookupSecondLast.EnableToolTip = false;
            this.sewaLookupSecondLast.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaLookupSecondLast.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaLookupSecondLast.IdText = "";
            this.sewaLookupSecondLast.IdTextBindingKey = null;
            this.sewaLookupSecondLast.Location = new System.Drawing.Point(4, 46);
            this.sewaLookupSecondLast.Lookup = true;
            this.sewaLookupSecondLast.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.sewaLookupSecondLast.LookupResult = null;
            this.sewaLookupSecondLast.LookupTitle = "Second Last Year Sewa";
            this.sewaLookupSecondLast.Mandatory = false;
            this.sewaLookupSecondLast.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaLookupSecondLast.MaxCharacterLength = 32767;
            this.sewaLookupSecondLast.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaLookupSecondLast.MinCharactersForQuery = 0;
            this.sewaLookupSecondLast.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaLookupSecondLast.Name = "sewaLookupSecondLast";
            this.sewaLookupSecondLast.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaLookupSecondLast.PascalCase = false;
            this.sewaLookupSecondLast.RangeInQueryMode = false;
            this.sewaLookupSecondLast.ReadOnly = false;
            this.sewaLookupSecondLast.RegularExpressionValidator = null;
            this.sewaLookupSecondLast.Size = new System.Drawing.Size(271, 37);
            this.sewaLookupSecondLast.TabIndex = 1;
            this.sewaLookupSecondLast.Title = "Second Last Year Sewa";
            this.sewaLookupSecondLast.ToolTipLookupField = "information";
            this.sewaLookupSecondLast.ValueText = "";
            this.sewaLookupSecondLast.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookupSecondLast_LookupDialogShowing);
            // 
            // sewaLookupThirdLat
            // 
            this.sewaLookupThirdLat.AllowsNew = false;
            this.sewaLookupThirdLat.AllowsReference = false;
            this.sewaLookupThirdLat.AllowsUpdate = false;
            this.sewaLookupThirdLat.ApplicationIdForDbConnection = null;
            this.sewaLookupThirdLat.BackColor = System.Drawing.Color.Transparent;
            this.sewaLookupThirdLat.CalledScreenApplicationId = null;
            this.sewaLookupThirdLat.CalledScreenTypeName = null;
            this.sewaLookupThirdLat.CallingScreenType = null;
            this.sewaLookupThirdLat.DisplayText = "";
            this.sewaLookupThirdLat.DisplayTextBindingKey = null;
            this.sewaLookupThirdLat.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaLookupThirdLat.EditingControlDataGridView = null;
            this.sewaLookupThirdLat.EditingControlFormattedValue = null;
            this.sewaLookupThirdLat.EditingControlRowIndex = 0;
            this.sewaLookupThirdLat.EditingControlValueChanged = true;
            this.sewaLookupThirdLat.EnableToolTip = false;
            this.sewaLookupThirdLat.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaLookupThirdLat.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaLookupThirdLat.IdText = "";
            this.sewaLookupThirdLat.IdTextBindingKey = null;
            this.sewaLookupThirdLat.Location = new System.Drawing.Point(4, 89);
            this.sewaLookupThirdLat.Lookup = true;
            this.sewaLookupThirdLat.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.sewaLookupThirdLat.LookupResult = null;
            this.sewaLookupThirdLat.LookupTitle = "Third Last Year Sewa";
            this.sewaLookupThirdLat.Mandatory = false;
            this.sewaLookupThirdLat.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaLookupThirdLat.MaxCharacterLength = 32767;
            this.sewaLookupThirdLat.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaLookupThirdLat.MinCharactersForQuery = 0;
            this.sewaLookupThirdLat.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaLookupThirdLat.Name = "sewaLookupThirdLat";
            this.sewaLookupThirdLat.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaLookupThirdLat.PascalCase = false;
            this.sewaLookupThirdLat.RangeInQueryMode = false;
            this.sewaLookupThirdLat.ReadOnly = false;
            this.sewaLookupThirdLat.RegularExpressionValidator = null;
            this.sewaLookupThirdLat.Size = new System.Drawing.Size(271, 37);
            this.sewaLookupThirdLat.TabIndex = 2;
            this.sewaLookupThirdLat.Title = "Third Last Year Sewa";
            this.sewaLookupThirdLat.ToolTipLookupField = "information";
            this.sewaLookupThirdLat.ValueText = "";
            this.sewaLookupThirdLat.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaLookupThirdLat_LookupDialogShowing);
            // 
            // sewaContructionLookup
            // 
            this.sewaContructionLookup.AllowsNew = false;
            this.sewaContructionLookup.AllowsReference = false;
            this.sewaContructionLookup.AllowsUpdate = false;
            this.sewaContructionLookup.ApplicationIdForDbConnection = null;
            this.sewaContructionLookup.BackColor = System.Drawing.Color.Transparent;
            this.sewaContructionLookup.CalledScreenApplicationId = null;
            this.sewaContructionLookup.CalledScreenTypeName = null;
            this.sewaContructionLookup.CallingScreenType = null;
            this.sewaContructionLookup.DisplayText = "";
            this.sewaContructionLookup.DisplayTextBindingKey = null;
            this.sewaContructionLookup.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewaContructionLookup.EditingControlDataGridView = null;
            this.sewaContructionLookup.EditingControlFormattedValue = null;
            this.sewaContructionLookup.EditingControlRowIndex = 0;
            this.sewaContructionLookup.EditingControlValueChanged = true;
            this.sewaContructionLookup.EnableToolTip = false;
            this.sewaContructionLookup.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.sewaContructionLookup.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.sewaContructionLookup.IdText = "";
            this.sewaContructionLookup.IdTextBindingKey = null;
            this.sewaContructionLookup.Location = new System.Drawing.Point(4, 132);
            this.sewaContructionLookup.Lookup = true;
            this.sewaContructionLookup.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.sewaContructionLookup.LookupResult = null;
            this.sewaContructionLookup.LookupTitle = "Construction Sewa";
            this.sewaContructionLookup.Mandatory = false;
            this.sewaContructionLookup.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.sewaContructionLookup.MaxCharacterLength = 32767;
            this.sewaContructionLookup.MaximumSize = new System.Drawing.Size(1300, 45);
            this.sewaContructionLookup.MinCharactersForQuery = 0;
            this.sewaContructionLookup.MinimumSize = new System.Drawing.Size(10, 22);
            this.sewaContructionLookup.Name = "sewaContructionLookup";
            this.sewaContructionLookup.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.sewaContructionLookup.PascalCase = false;
            this.sewaContructionLookup.RangeInQueryMode = false;
            this.sewaContructionLookup.ReadOnly = false;
            this.sewaContructionLookup.RegularExpressionValidator = null;
            this.sewaContructionLookup.Size = new System.Drawing.Size(271, 40);
            this.sewaContructionLookup.TabIndex = 3;
            this.sewaContructionLookup.Title = "Construction Sewa";
            this.sewaContructionLookup.ToolTipLookupField = "information";
            this.sewaContructionLookup.ValueText = "";
            this.sewaContructionLookup.LookupDialogShowing += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs>(this.sewaContructionLookup_LookupDialogShowing);
            // 
            // yesNoCombo1
            // 
            this.yesNoCombo1.ApplicationIdForDbConnection = null;
            this.yesNoCombo1.BackColor = System.Drawing.Color.Transparent;
            this.yesNoCombo1.DisplayText = ".......";
            this.yesNoCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.yesNoCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.yesNoCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.yesNoCombo1.Location = new System.Drawing.Point(4, 365);
            this.yesNoCombo1.Mandatory = false;
            this.yesNoCombo1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.yesNoCombo1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.yesNoCombo1.MinimumSize = new System.Drawing.Size(10, 22);
            this.yesNoCombo1.Name = "yesNoCombo1";
            this.yesNoCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.yesNoCombo1.ReadOnly = false;
            this.yesNoCombo1.SelectedIndex = 0;
            this.yesNoCombo1.SelectedText = ".......";
            this.yesNoCombo1.SelectedValue = null;
            this.yesNoCombo1.SelectedValueBindingKey = null;
            this.yesNoCombo1.Size = new System.Drawing.Size(137, 44);
            this.yesNoCombo1.TabIndex = 4;
            this.yesNoCombo1.Title = "Non Initiate Team ?";
            this.yesNoCombo1.ValueText = null;
            // 
            // RosterPrinting
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(893, 564);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "RosterPrinting";
            this.Text = "MED_56";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tlpRootPanel.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpRootPanel;
        private DCCTextField txtSatsangCentre;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup sewaLookup1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaTeamsLookup sewaTeamsLookup1;
        private System.Windows.Forms.GroupBox groupBox1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup sewaLookupLastYear;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup sewaLookupSecondLast;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup sewaLookupThirdLat;
        private DCC.ZOS.ZSM.Controls.ZSMLookups.SewaLookup sewaContructionLookup;
        private DCC.UMB.CDBControls.DropDown.YesNoCombo yesNoCombo1;

    }
}