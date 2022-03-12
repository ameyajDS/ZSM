namespace DCC.ZOS.ZSM.Controls.Misc
{
    partial class HistoryHeader
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.grdHistory = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.sewadarHeader1 = new DCC.ZOS.ZSM.Controls.Misc.SewadarHeader();
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.grd_centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.grd_sewadar_grno = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.is_outstation_sewadar = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.department_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Responsibility = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.Status = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_status_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.weekly_sewa_location_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.tlpBase.SuspendLayout();
            this.tlpTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdHistory)).BeginInit();
            this.sewadarHeader1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 1;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.Controls.Add(this.tlpTop, 0, 0);
            this.tlpBase.Controls.Add(this.grdHistory, 0, 1);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 2;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 60F));
            this.tlpBase.Size = new System.Drawing.Size(970, 420);
            this.tlpBase.TabIndex = 1;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 1;
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.Controls.Add(this.sewadarHeader1, 0, 0);
            this.tlpTop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpTop.Location = new System.Drawing.Point(3, 3);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 1;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 113F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 113F));
            this.tlpTop.Size = new System.Drawing.Size(964, 162);
            this.tlpTop.TabIndex = 0;
            // 
            // grdHistory
            // 
            this.grdHistory.AllowRowSorting = false;
            this.grdHistory.AllowUserToAddRows = false;
            this.grdHistory.AutoAddNewRowForUser = false;
            this.grdHistory.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdHistory.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.grd_centre_nm,
            this.grd_sewadar_grno,
            this.is_outstation_sewadar,
            this.department_nm,
            this.Responsibility,
            this.Status,
            this.sewadar_status_dtm,
            this.weekly_sewa_location_nm});
            this.grdHistory.DeleteRowMenuEnabled = true;
            this.grdHistory.DeleteVisible = true;
            this.grdHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdHistory.ExportToExcelVisible = true;
            this.grdHistory.InsertAfterVisible = true;
            this.grdHistory.InsertBeforeVisible = true;
            this.grdHistory.InsertLastVisible = true;
            this.grdHistory.InsertRowsMenuItemsEnabled = true;
            this.grdHistory.Location = new System.Drawing.Point(3, 171);
            this.grdHistory.Mandatory = false;
            this.grdHistory.MoveDownVisible = false;
            this.grdHistory.MoveUpVisible = false;
            this.grdHistory.MultiSelect = false;
            this.grdHistory.Name = "grdHistory";
            this.grdHistory.RowHeadersWidth = 15;
            this.grdHistory.ShowCommandStrip = false;
            this.grdHistory.Size = new System.Drawing.Size(964, 246);
            this.grdHistory.TabIndex = 3;
            this.grdHistory.Title = null;
            this.grdHistory.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdHistory.VirtualMode = true;
            // 
            // sewadarHeader1
            // 
            this.sewadarHeader1.Controls.Add(this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36);
            this.sewadarHeader1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarHeader1.Location = new System.Drawing.Point(3, 3);
            this.sewadarHeader1.Name = "sewadarHeader1";
            this.sewadarHeader1.SatsangCentreId = null;
            this.sewadarHeader1.Size = new System.Drawing.Size(958, 156);
            this.sewadarHeader1.TabIndex = 0;
            this.sewadarHeader1.UseFocusLostEvent = false;
            this.sewadarHeader1.SewadarSelectionChanged += new System.EventHandler<DCC.ZOS.ZSM.Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs>(this.sewadarHeader1_SewadarSelectionChanged);
            // 
            // object_9830eb7e_03f0_4b3d_8178_3c6966b6af36
            // 
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnCount = 16;
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.473514F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 4.347939F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.523057F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.760379F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 8.356671F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 2.644516F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.173419F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.616207F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 2.115613F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.45262F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.616207F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.981522F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 2.108768F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.103219F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.48211F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 14.17461F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.Dock = System.Windows.Forms.DockStyle.Fill;
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.Location = new System.Drawing.Point(0, 0);
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.Name = "object_9830eb7e_03f0_4b3d_8178_3c6966b6af36";
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.RowCount = 2;
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 49.73662F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.26338F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.Size = new System.Drawing.Size(958, 156);
            this.object_9830eb7e_03f0_4b3d_8178_3c6966b6af36.TabIndex = 1;
            // 
            // grd_centre_nm
            // 
            this.grd_centre_nm.BindingKey = "centre_nm";
            this.grd_centre_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.grd_centre_nm.HeaderText = "Satsang Centre";
            this.grd_centre_nm.Lookup = false;
            this.grd_centre_nm.LookupColumns = "";
            this.grd_centre_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.grd_centre_nm.Mandatory = false;
            this.grd_centre_nm.MaxCharacterLength = 2147483647;
            this.grd_centre_nm.Name = "grd_centre_nm";
            this.grd_centre_nm.PercentageWidth = 18;
            this.grd_centre_nm.RegularExpressionValidator = "";
            this.grd_centre_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.grd_centre_nm.ToolTipLookupField = "information";
            this.grd_centre_nm.Width = 170;
            // 
            // grd_sewadar_grno
            // 
            this.grd_sewadar_grno.BindingKey = "sewadar_grno";
            this.grd_sewadar_grno.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.grd_sewadar_grno.HeaderText = "GR No";
            this.grd_sewadar_grno.Lookup = false;
            this.grd_sewadar_grno.LookupColumns = "";
            this.grd_sewadar_grno.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.grd_sewadar_grno.Mandatory = false;
            this.grd_sewadar_grno.MaxCharacterLength = 2147483647;
            this.grd_sewadar_grno.Name = "grd_sewadar_grno";
            this.grd_sewadar_grno.PercentageWidth = 10;
            this.grd_sewadar_grno.RegularExpressionValidator = "";
            this.grd_sewadar_grno.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.grd_sewadar_grno.ToolTipLookupField = "information";
            this.grd_sewadar_grno.Width = 94;
            // 
            // is_outstation_sewadar
            // 
            this.is_outstation_sewadar.BindingKey = "is_outstation_sewadar";
            this.is_outstation_sewadar.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.is_outstation_sewadar.DefaultCellStyle = dataGridViewCellStyle1;
            this.is_outstation_sewadar.HeaderText = "Out?";
            this.is_outstation_sewadar.Lookup = false;
            this.is_outstation_sewadar.LookupColumns = "";
            this.is_outstation_sewadar.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_outstation_sewadar.Mandatory = false;
            this.is_outstation_sewadar.Name = "is_outstation_sewadar";
            this.is_outstation_sewadar.PercentageWidth = 5;
            this.is_outstation_sewadar.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_outstation_sewadar.ToolTipLookupField = "information";
            this.is_outstation_sewadar.Width = 47;
            // 
            // department_nm
            // 
            this.department_nm.BindingKey = "department_nm";
            this.department_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.department_nm.HeaderText = "Department";
            this.department_nm.Lookup = false;
            this.department_nm.LookupColumns = "";
            this.department_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.department_nm.Mandatory = false;
            this.department_nm.MaxCharacterLength = 2147483647;
            this.department_nm.Name = "department_nm";
            this.department_nm.PercentageWidth = 15;
            this.department_nm.RegularExpressionValidator = "";
            this.department_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.department_nm.ToolTipLookupField = "information";
            this.department_nm.Width = 142;
            // 
            // Responsibility
            // 
            this.Responsibility.BindingKey = "responsibility";
            this.Responsibility.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.Responsibility.HeaderText = "Responsibility";
            this.Responsibility.Lookup = false;
            this.Responsibility.LookupColumns = "";
            this.Responsibility.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Responsibility.Mandatory = false;
            this.Responsibility.MaxCharacterLength = 2147483647;
            this.Responsibility.Name = "Responsibility";
            this.Responsibility.PercentageWidth = 10;
            this.Responsibility.RegularExpressionValidator = "";
            this.Responsibility.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Responsibility.ToolTipLookupField = "information";
            this.Responsibility.Width = 94;
            // 
            // Status
            // 
            this.Status.BindingKey = "sewadar_status_cd";
            this.Status.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.Status.HeaderText = "Status Cd";
            this.Status.Lookup = false;
            this.Status.LookupColumns = "";
            this.Status.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.Status.Mandatory = false;
            this.Status.MaxCharacterLength = 2147483647;
            this.Status.Name = "Status";
            this.Status.PercentageWidth = 10;
            this.Status.RegularExpressionValidator = "";
            this.Status.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.Status.ToolTipLookupField = "information";
            this.Status.Width = 94;
            // 
            // sewadar_status_dtm
            // 
            this.sewadar_status_dtm.BindingKey = "sewadar_status_dtm";
            this.sewadar_status_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.sewadar_status_dtm.DefaultCellStyle = dataGridViewCellStyle2;
            this.sewadar_status_dtm.HeaderText = " Status Date";
            this.sewadar_status_dtm.Lookup = false;
            this.sewadar_status_dtm.LookupColumns = "";
            this.sewadar_status_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_dtm.Mandatory = false;
            this.sewadar_status_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.sewadar_status_dtm.MinValue = new System.DateTime(((long)(0)));
            this.sewadar_status_dtm.Name = "sewadar_status_dtm";
            this.sewadar_status_dtm.PercentageWidth = 12;
            this.sewadar_status_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_dtm.ToolTipLookupField = "information";
            this.sewadar_status_dtm.Width = 113;
            // 
            // weekly_sewa_location_nm
            // 
            this.weekly_sewa_location_nm.BindingKey = "weekly_sewa_location_nm";
            this.weekly_sewa_location_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.weekly_sewa_location_nm.HeaderText = "Weekly Sewa Location";
            this.weekly_sewa_location_nm.Lookup = false;
            this.weekly_sewa_location_nm.LookupColumns = "";
            this.weekly_sewa_location_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.weekly_sewa_location_nm.Mandatory = false;
            this.weekly_sewa_location_nm.MaxCharacterLength = 2147483647;
            this.weekly_sewa_location_nm.Name = "weekly_sewa_location_nm";
            this.weekly_sewa_location_nm.PercentageWidth = 20;
            this.weekly_sewa_location_nm.RegularExpressionValidator = "";
            this.weekly_sewa_location_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.weekly_sewa_location_nm.ToolTipLookupField = "information";
            this.weekly_sewa_location_nm.Width = 189;
            // 
            // HistoryHeader
            // 
            this.Controls.Add(this.tlpBase);
            this.Name = "HistoryHeader";
            this.Size = new System.Drawing.Size(970, 420);
            this.Load += new System.EventHandler(this.HistoryHeader_Load);
            this.tlpBase.ResumeLayout(false);
            this.tlpTop.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdHistory)).EndInit();
            this.sewadarHeader1.ResumeLayout(false);
            this.ResumeLayout(false);

        }
        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        public DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        public SewadarHeader sewadarHeader1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel object_9830eb7e_03f0_4b3d_8178_3c6966b6af36;
        public DCC.UMB.CDF.UIControls.Grid.DCCGrid grdHistory;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn grd_centre_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn grd_sewadar_grno;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn is_outstation_sewadar;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn department_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn Responsibility;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn Status;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn sewadar_status_dtm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn weekly_sewa_location_nm;


    }
}