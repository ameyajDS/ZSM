namespace DCC.ZOS.ZSM.RPT
{
    partial class PostBadgePrintingDialog
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
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnOK = new System.Windows.Forms.Button();
            this.grdSewadarsPrinted = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.printed = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.tlpBase.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSewadarsPrinted)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 6;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tlpBase.Controls.Add(this.btnCancel, 2, 2);
            this.tlpBase.Controls.Add(this.btnOK, 1, 2);
            this.tlpBase.Controls.Add(this.grdSewadarsPrinted, 0, 0);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 3;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 52.54379F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 39.69754F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.939508F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.Size = new System.Drawing.Size(707, 529);
            this.tlpBase.TabIndex = 4;
            // 
            // btnCancel
            // 
            this.btnCancel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnCancel.Location = new System.Drawing.Point(356, 489);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(94, 37);
            this.btnCancel.TabIndex = 0;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnOK
            // 
            this.btnOK.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnOK.Location = new System.Drawing.Point(256, 489);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(94, 37);
            this.btnOK.TabIndex = 1;
            this.btnOK.Text = "OK";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // grdSewadarsPrinted
            // 
            this.grdSewadarsPrinted.AllowRowSorting = false;
            this.grdSewadarsPrinted.AllowUserToAddRows = false;
            this.grdSewadarsPrinted.AutoAddNewRowForUser = false;
            this.grdSewadarsPrinted.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSewadarsPrinted.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sewadar_grno,
            this.full_nm,
            this.printed});
            this.tlpBase.SetColumnSpan(this.grdSewadarsPrinted, 6);
            this.grdSewadarsPrinted.DeleteRowMenuEnabled = true;
            this.grdSewadarsPrinted.DeleteVisible = true;
            this.grdSewadarsPrinted.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSewadarsPrinted.ExportToExcelVisible = true;
            this.grdSewadarsPrinted.InsertAfterVisible = true;
            this.grdSewadarsPrinted.InsertBeforeVisible = true;
            this.grdSewadarsPrinted.InsertLastVisible = true;
            this.grdSewadarsPrinted.InsertRowsMenuItemsEnabled = true;
            this.grdSewadarsPrinted.Location = new System.Drawing.Point(3, 3);
            this.grdSewadarsPrinted.Mandatory = false;
            this.grdSewadarsPrinted.MoveDownVisible = false;
            this.grdSewadarsPrinted.MoveUpVisible = false;
            this.grdSewadarsPrinted.MultiSelect = false;
            this.grdSewadarsPrinted.Name = "grdSewadarsPrinted";
            this.grdSewadarsPrinted.RowHeadersWidth = 15;
            this.tlpBase.SetRowSpan(this.grdSewadarsPrinted, 2);
            this.grdSewadarsPrinted.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdSewadarsPrinted.ShowCommandStrip = false;
            this.grdSewadarsPrinted.Size = new System.Drawing.Size(701, 480);
            this.grdSewadarsPrinted.TabIndex = 2;
            this.grdSewadarsPrinted.Title = null;
            this.grdSewadarsPrinted.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdSewadarsPrinted.VirtualMode = true;
            // 
            // sewadar_grno
            // 
            this.sewadar_grno.BindingKey = "sewadar_grno";
            this.sewadar_grno.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_grno.HeaderText = "GR No.";
            this.sewadar_grno.Lookup = false;
            this.sewadar_grno.LookupColumns = "";
            this.sewadar_grno.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_grno.Mandatory = false;
            this.sewadar_grno.MaxCharacterLength = 2147483647;
            this.sewadar_grno.Name = "sewadar_grno";
            this.sewadar_grno.PercentageWidth = 25;
            this.sewadar_grno.RegularExpressionValidator = "";
            this.sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_grno.ToolTipLookupField = "information";
            this.sewadar_grno.Width = 171;
            // 
            // full_nm
            // 
            this.full_nm.BindingKey = "full_nm";
            this.full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.full_nm.HeaderText = "Name";
            this.full_nm.Lookup = false;
            this.full_nm.LookupColumns = "";
            this.full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.full_nm.Mandatory = false;
            this.full_nm.MaxCharacterLength = 2147483647;
            this.full_nm.Name = "full_nm";
            this.full_nm.PercentageWidth = 60;
            this.full_nm.RegularExpressionValidator = "";
            this.full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.full_nm.ToolTipLookupField = "information";
            this.full_nm.Width = 411;
            // 
            // printed
            // 
            this.printed.BindingKey = "";
            this.printed.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.printed.DefaultCellStyle = dataGridViewCellStyle1;
            this.printed.HeaderText = "Printed";
            this.printed.Lookup = false;
            this.printed.LookupColumns = "";
            this.printed.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.printed.Mandatory = false;
            this.printed.Name = "printed";
            this.printed.PercentageWidth = 15;
            this.printed.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.printed.ToolTipLookupField = "information";
            this.printed.Width = 102;
            // 
            // PostBadgePrintingDialog
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(707, 529);
            this.Controls.Add(this.tlpBase);
            this.Name = "PostBadgePrintingDialog";
            this.Text = "ImportDataUnitFromXMLParametersScreen";
            this.tlpBase.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSewadarsPrinted)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnOK;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSewadarsPrinted;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_grno;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn full_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn printed;

    }
}