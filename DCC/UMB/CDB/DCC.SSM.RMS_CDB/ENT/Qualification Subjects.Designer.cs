namespace DCC.UMB.CDB2.ENT
{
    partial class QualificationSubjects
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
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.grdSubjects = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.btnAll = new System.Windows.Forms.Button();
            this.qlfctn_subject_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.qlfctn_subject_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.qlfctn_subject_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.description = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.effective_from = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.effective_till = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.tlpBase.SuspendLayout();
            this.dccTableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdSubjects)).BeginInit();
            this.SuspendLayout();
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 1;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpBase.Controls.Add(this.dccTableLayoutPanel1, 0, 0);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 1;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBase.Size = new System.Drawing.Size(973, 494);
            this.tlpBase.TabIndex = 0;
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 2;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 103F));
            this.dccTableLayoutPanel1.Controls.Add(this.grdSubjects, 0, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.btnAll, 2, 0);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(3, 3);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 2;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 7.377049F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 92.62295F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(967, 488);
            this.dccTableLayoutPanel1.TabIndex = 0;
            // 
            // grdSubjects
            // 
            this.grdSubjects.AllowRowSorting = false;
            this.grdSubjects.AllowUserToAddRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.HotTrack;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.grdSubjects.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.grdSubjects.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdSubjects.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.qlfctn_subject_id,
            this.qlfctn_subject_cd,
            this.qlfctn_subject_nm,
            this.description,
            this.effective_from,
            this.effective_till});
            this.dccTableLayoutPanel1.SetColumnSpan(this.grdSubjects, 2);
            this.grdSubjects.DeleteRowMenuEnabled = true;
            this.grdSubjects.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdSubjects.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.grdSubjects.InsertRowsMenuItemsEnabled = true;
            this.grdSubjects.Location = new System.Drawing.Point(3, 38);
            this.grdSubjects.Mandatory = false;
            this.grdSubjects.Name = "grdSubjects";
            this.grdSubjects.RowHeadersWidth = 15;
            this.grdSubjects.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.grdSubjects.Size = new System.Drawing.Size(961, 447);
            this.grdSubjects.TabIndex = 0;
            this.grdSubjects.Title = null;
            this.grdSubjects.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdSubjects.VirtualMode = true;
            this.grdSubjects.ValidateRow += new System.EventHandler<DCC.UMB.CDF.UIControls.Grid.ValidateRowEventArgs>(this.grdSubjects_ValidateRow);
            // 
            // btnAll
            // 
            this.btnAll.Dock = System.Windows.Forms.DockStyle.Fill;
            this.btnAll.Location = new System.Drawing.Point(867, 3);
            this.btnAll.Name = "btnAll";
            this.btnAll.Size = new System.Drawing.Size(97, 29);
            this.btnAll.TabIndex = 1;
            this.btnAll.Text = "Show All";
            this.btnAll.UseVisualStyleBackColor = true;
            this.btnAll.Click += new System.EventHandler(this.btnAll_Click);
            // 
            // qlfctn_subject_id
            // 
            this.qlfctn_subject_id.BindingKey = "qlfctn_subject_id";
            this.qlfctn_subject_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            this.qlfctn_subject_id.HeaderText = "SubjectId";
            this.qlfctn_subject_id.Lookup = false;
            this.qlfctn_subject_id.LookupColumns = "";
            this.qlfctn_subject_id.Mandatory = false;
            this.qlfctn_subject_id.MaxValue = ((long)(9223372036854775807));
            this.qlfctn_subject_id.MinValue = ((long)(-9223372036854775808));
            this.qlfctn_subject_id.Name = "qlfctn_subject_id";
            this.qlfctn_subject_id.PercentageWidth = 15;
            this.qlfctn_subject_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qlfctn_subject_id.Visible = false;
            this.qlfctn_subject_id.Width = 141;
            // 
            // qlfctn_subject_cd
            // 
            this.qlfctn_subject_cd.BindingKey = "qlfctn_subject_cd";
            this.qlfctn_subject_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.qlfctn_subject_cd.HeaderText = "Code";
            this.qlfctn_subject_cd.Lookup = false;
            this.qlfctn_subject_cd.LookupColumns = "";
            this.qlfctn_subject_cd.Mandatory = true;
            this.qlfctn_subject_cd.MaxCharacterLength = 5;
            this.qlfctn_subject_cd.Name = "qlfctn_subject_cd";
            this.qlfctn_subject_cd.PercentageWidth = 10;
            this.qlfctn_subject_cd.RegularExpressionValidator = "^[0-9a-z&A-Z .]+$";
            this.qlfctn_subject_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qlfctn_subject_cd.Width = 94;
            // 
            // qlfctn_subject_nm
            // 
            this.qlfctn_subject_nm.BindingKey = "qlfctn_subject_nm";
            this.qlfctn_subject_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.qlfctn_subject_nm.HeaderText = "Name";
            this.qlfctn_subject_nm.Lookup = false;
            this.qlfctn_subject_nm.LookupColumns = "";
            this.qlfctn_subject_nm.Mandatory = true;
            this.qlfctn_subject_nm.MaxCharacterLength = 20;
            this.qlfctn_subject_nm.Name = "qlfctn_subject_nm";
            this.qlfctn_subject_nm.PercentageWidth = 38;
            this.qlfctn_subject_nm.RegularExpressionValidator = "";
            this.qlfctn_subject_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.qlfctn_subject_nm.Width = 359;
            // 
            // description
            // 
            this.description.BindingKey = "description";
            this.description.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.description.HeaderText = "Description";
            this.description.Lookup = false;
            this.description.LookupColumns = "";
            this.description.Mandatory = false;
            this.description.MaxCharacterLength = 50;
            this.description.Name = "description";
            this.description.PercentageWidth = 25;
            this.description.RegularExpressionValidator = "";
            this.description.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.description.Width = 236;
            // 
            // effective_from
            // 
            this.effective_from.BindingKey = "effective_from";
            this.effective_from.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            this.effective_from.HeaderText = "Effective From";
            this.effective_from.Lookup = false;
            this.effective_from.LookupColumns = "";
            this.effective_from.Mandatory = true;
            this.effective_from.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effective_from.MinValue = new System.DateTime(((long)(0)));
            this.effective_from.Name = "effective_from";
            this.effective_from.PercentageWidth = 14;
            this.effective_from.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effective_from.Width = 132;
            // 
            // effective_till
            // 
            this.effective_till.BindingKey = "effective_till";
            this.effective_till.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            this.effective_till.HeaderText = "Effective Till";
            this.effective_till.Lookup = false;
            this.effective_till.LookupColumns = "";
            this.effective_till.Mandatory = true;
            this.effective_till.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.effective_till.MinValue = new System.DateTime(((long)(0)));
            this.effective_till.Name = "effective_till";
            this.effective_till.PercentageWidth = 13;
            this.effective_till.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.effective_till.Width = 122;
            // 
            // QualificationSubjects
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(973, 494);
            this.Controls.Add(this.tlpBase);
            this.Name = "QualificationSubjects";
            this.Text = "Residents Management System - [QUALIFICATION SUBJECTS]";
            this.Load += new System.EventHandler(this.Subjects_Load);
            this.tlpBase.ResumeLayout(false);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdSubjects)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.Grid.DCCGrid grdSubjects;
        private System.Windows.Forms.Button btnAll;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn qlfctn_subject_id;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qlfctn_subject_cd;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn qlfctn_subject_nm;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn description;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_from;
        private DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn effective_till;
    }
}