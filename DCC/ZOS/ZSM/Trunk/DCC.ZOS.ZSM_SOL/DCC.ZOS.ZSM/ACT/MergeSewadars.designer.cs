namespace DCC.ZOS.ZSM.ACT
{
    partial class MergeSewadars
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
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.historyHeader1 = new DCC.ZOS.ZSM.Controls.Misc.HistoryHeader();
            this.historyHeader2 = new DCC.ZOS.ZSM.Controls.Misc.HistoryHeader();
            this.dccLabel1 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.dccLabel2 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.src_sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.src_full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.dst_sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.dst_full_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.merged_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.tlpBase.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).BeginInit();
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
            this.scListOrBrowse.Panel1.Controls.Add(this.tlpBase);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.grdList);
            this.scListOrBrowse.Size = new System.Drawing.Size(932, 601);
            this.scListOrBrowse.SplitterDistance = 902;
            this.scListOrBrowse.TabIndex = 2;
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 1;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpBase.Controls.Add(this.historyHeader1, 0, 1);
            this.tlpBase.Controls.Add(this.historyHeader2, 0, 3);
            this.tlpBase.Controls.Add(this.dccLabel1, 0, 0);
            this.tlpBase.Controls.Add(this.dccLabel2, 0, 2);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 4;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 16F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 16F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tlpBase.Size = new System.Drawing.Size(902, 601);
            this.tlpBase.TabIndex = 1;
            // 
            // historyHeader1
            // 
            this.historyHeader1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.historyHeader1.Location = new System.Drawing.Point(3, 19);
            this.historyHeader1.Name = "historyHeader1";
            this.historyHeader1.Size = new System.Drawing.Size(896, 278);
            this.historyHeader1.TabIndex = 0;
            // 
            // historyHeader2
            // 
            this.historyHeader2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.historyHeader2.Location = new System.Drawing.Point(3, 319);
            this.historyHeader2.Name = "historyHeader2";
            this.historyHeader2.Size = new System.Drawing.Size(896, 279);
            this.historyHeader2.TabIndex = 1;
            // 
            // dccLabel1
            // 
            this.dccLabel1.AutoSize = true;
            this.dccLabel1.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel1.Location = new System.Drawing.Point(2, 0);
            this.dccLabel1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.dccLabel1.Name = "dccLabel1";
            this.dccLabel1.Size = new System.Drawing.Size(898, 16);
            this.dccLabel1.TabIndex = 2;
            this.dccLabel1.Text = "Source Sewadar";
            this.dccLabel1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // dccLabel2
            // 
            this.dccLabel2.AutoSize = true;
            this.dccLabel2.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel2.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel2.Location = new System.Drawing.Point(2, 300);
            this.dccLabel2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.dccLabel2.Name = "dccLabel2";
            this.dccLabel2.Size = new System.Drawing.Size(898, 16);
            this.dccLabel2.TabIndex = 3;
            this.dccLabel2.Text = "Desitination Sewadar";
            this.dccLabel2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.src_sewadar_id,
            this.src_full_nm,
            this.dst_sewadar_id,
            this.dst_full_nm,
            this.merged_dtm});
            this.grdList.DeleteRowMenuEnabled = true;
            this.grdList.DeleteVisible = true;
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
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
            this.grdList.Size = new System.Drawing.Size(26, 601);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Program;
            this.grdList.VirtualMode = true;
            // 
            // src_sewadar_id
            // 
            this.src_sewadar_id.BindingKey = "src_sewadar_id";
            this.src_sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.src_sewadar_id.DefaultCellStyle = dataGridViewCellStyle1;
            this.src_sewadar_id.HeaderText = "Src Sewadar ID";
            this.src_sewadar_id.Lookup = false;
            this.src_sewadar_id.LookupColumns = "";
            this.src_sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.src_sewadar_id.Mandatory = false;
            this.src_sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.src_sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.src_sewadar_id.Name = "src_sewadar_id";
            this.src_sewadar_id.PercentageWidth = 10;
            this.src_sewadar_id.ReadOnly = true;
            this.src_sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.src_sewadar_id.ToolTipLookupField = "information";
            this.src_sewadar_id.Width = 5;
            // 
            // src_full_nm
            // 
            this.src_full_nm.BindingKey = "src_full_nm";
            this.src_full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.src_full_nm.HeaderText = "Src Name";
            this.src_full_nm.Lookup = false;
            this.src_full_nm.LookupColumns = "";
            this.src_full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.src_full_nm.Mandatory = false;
            this.src_full_nm.MaxCharacterLength = 2147483647;
            this.src_full_nm.Name = "src_full_nm";
            this.src_full_nm.PercentageWidth = 35;
            this.src_full_nm.ReadOnly = true;
            this.src_full_nm.RegularExpressionValidator = "";
            this.src_full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.src_full_nm.ToolTipLookupField = "information";
            this.src_full_nm.Width = 5;
            // 
            // dst_sewadar_id
            // 
            this.dst_sewadar_id.BindingKey = "dst_sewadar_id";
            this.dst_sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.dst_sewadar_id.DefaultCellStyle = dataGridViewCellStyle2;
            this.dst_sewadar_id.HeaderText = "Dst Sewadar ID";
            this.dst_sewadar_id.Lookup = false;
            this.dst_sewadar_id.LookupColumns = "";
            this.dst_sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dst_sewadar_id.Mandatory = false;
            this.dst_sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.dst_sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.dst_sewadar_id.Name = "dst_sewadar_id";
            this.dst_sewadar_id.PercentageWidth = 10;
            this.dst_sewadar_id.ReadOnly = true;
            this.dst_sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dst_sewadar_id.ToolTipLookupField = "information";
            this.dst_sewadar_id.Width = 5;
            // 
            // dst_full_nm
            // 
            this.dst_full_nm.BindingKey = "dst_full_nm";
            this.dst_full_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.dst_full_nm.HeaderText = "Dst Name";
            this.dst_full_nm.Lookup = false;
            this.dst_full_nm.LookupColumns = "";
            this.dst_full_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dst_full_nm.Mandatory = false;
            this.dst_full_nm.MaxCharacterLength = 2147483647;
            this.dst_full_nm.Name = "dst_full_nm";
            this.dst_full_nm.PercentageWidth = 35;
            this.dst_full_nm.ReadOnly = true;
            this.dst_full_nm.RegularExpressionValidator = "";
            this.dst_full_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.dst_full_nm.ToolTipLookupField = "information";
            this.dst_full_nm.Width = 5;
            // 
            // merged_dtm
            // 
            this.merged_dtm.BindingKey = "merged_dtm";
            this.merged_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.merged_dtm.DefaultCellStyle = dataGridViewCellStyle3;
            this.merged_dtm.HeaderText = "Merged Date";
            this.merged_dtm.Lookup = false;
            this.merged_dtm.LookupColumns = "";
            this.merged_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.merged_dtm.Mandatory = false;
            this.merged_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.merged_dtm.MinValue = new System.DateTime(((long)(0)));
            this.merged_dtm.Name = "merged_dtm";
            this.merged_dtm.PercentageWidth = 10;
            this.merged_dtm.ReadOnly = true;
            this.merged_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.merged_dtm.ToolTipLookupField = "information";
            this.merged_dtm.Width = 5;
            // 
            // MergeSewadars
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(932, 601);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "MergeSewadars";
            this.Text = "SewaTeamAttendence";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            this.scListOrBrowse.ResumeLayout(false);
            this.tlpBase.ResumeLayout(false);
            this.tlpBase.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private DCC.ZOS.ZSM.Controls.Misc.HistoryHeader historyHeader1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.ZOS.ZSM.Controls.Misc.HistoryHeader historyHeader2;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn src_sewadar_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn src_full_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn dst_sewadar_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn dst_full_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn merged_dtm;
        private UMB.CDF.UIControls.DCCLabel dccLabel1;
        private UMB.CDF.UIControls.DCCLabel dccLabel2;
    }
}