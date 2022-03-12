namespace DCC.ZOS.ZSM.ACT
{
    partial class Speakers
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle13 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle14 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle15 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle16 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.scListOrBrowse = new System.Windows.Forms.SplitContainer();
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccLabel1 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.dccLabel2 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.tlpSewadarPhoto = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.ImgSewadarPhoto = new System.Windows.Forms.PictureBox();
            this.dtmSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.txtSewadarStatus = new DCC.UMB.CDF.UIControls.TextControls.DCCTextField();
            this.zsmGenderCombo1 = new DCC.ZOS.ZSM.Controls.DropDown.ZSMGenderCombo();
            this.intSewadarId = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarIDLookup();
            this.txtName = new DCC.ZOS.ZSM.Controls.ZSMLookups.SewadarLookup();
            this.txtAge = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.dtmCurrentStatusDate = new DCC.UMB.CDF.UIControls.TextControls.DCCDateTimeField();
            this.speakerStatusCombo1 = new DCC.ZOS.ZSM.Controls.Combos.SpeakerStatusCombo();
            this.speakerTypeCombo1 = new DCC.ZOS.ZSM.Controls.Combos.SpeakerTypeCombo();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.zsmSatsangCentresLookup1 = new DCC.ZOS.ZSM.Controls.ZSMLookups.ZSMSatsangCentresLookup();
            this.cmbSatsangCentreType = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.zsmSatsangCentresLookup2 = new DCC.ZOS.ZSM.Controls.ZSMLookups.ZSMSatsangCentresLookup();
            this.grdApproval = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.grdTraining = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.training_request_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.training_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.isAttended = new DCC.UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn();
            this.training_reference_no = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.training_reference_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.training_remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txn_ts_training = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.tableLayoutPanel3 = new System.Windows.Forms.TableLayoutPanel();
            this.grdList = new DCC.UMB.CDF.UIControls.Grid.DCCGrid();
            this.SpeakerId = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.FullName = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.gender = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.birth_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.age = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.global_sewadar_status_cd = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.global_sewadar_status_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.sewadar_status_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.sewadar_status_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.satsang_centre_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.is_main_centre = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.centre_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.SpeakerType = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.speaker_status = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.speaker_status_dtm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.txn_ts = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            this.request_for_speaker_type = new DCC.UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn();
            this.request_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.approval_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn();
            this.reference_no = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.reference_dt = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.audition_remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.review_remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.review_sewadar_id = new DCC.UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn();
            this.review_non_sewadar_nm = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.remarks = new DCC.UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            this.txn_ts_aud = new DCC.UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn();
            ((System.ComponentModel.ISupportInitialize)(this.scListOrBrowse)).BeginInit();
            this.scListOrBrowse.Panel1.SuspendLayout();
            this.scListOrBrowse.Panel2.SuspendLayout();
            this.scListOrBrowse.SuspendLayout();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.tlpSewadarPhoto.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ImgSewadarPhoto)).BeginInit();
            this.tableLayoutPanel1.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdApproval)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdTraining)).BeginInit();
            this.tableLayoutPanel3.SuspendLayout();
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
            this.scListOrBrowse.Panel1.Controls.Add(this.dccTableLayoutPanel1);
            // 
            // scListOrBrowse.Panel2
            // 
            this.scListOrBrowse.Panel2.Controls.Add(this.tableLayoutPanel3);
            this.scListOrBrowse.Panel2Collapsed = true;
            this.scListOrBrowse.Size = new System.Drawing.Size(958, 486);
            this.scListOrBrowse.SplitterDistance = 522;
            this.scListOrBrowse.TabIndex = 0;
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.dccTableLayoutPanel1.ColumnCount = 7;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.21704F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 10.82039F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 27.97185F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.676409F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.84196F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.95611F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 12.51625F));
            this.dccTableLayoutPanel1.Controls.Add(this.dccLabel1, 0, 3);
            this.dccTableLayoutPanel1.Controls.Add(this.dccLabel2, 0, 5);
            this.dccTableLayoutPanel1.Controls.Add(this.tlpSewadarPhoto, 6, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.dtmSewadarStatus, 5, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.txtSewadarStatus, 4, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.zsmGenderCombo1, 1, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.intSewadarId, 0, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.txtName, 2, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.txtAge, 3, 0);
            this.dccTableLayoutPanel1.Controls.Add(this.tableLayoutPanel1, 0, 1);
            this.dccTableLayoutPanel1.Controls.Add(this.tableLayoutPanel2, 0, 2);
            this.dccTableLayoutPanel1.Controls.Add(this.grdApproval, 0, 4);
            this.dccTableLayoutPanel1.Controls.Add(this.grdTraining, 0, 6);
            this.dccTableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 7;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25F));
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(958, 486);
            this.dccTableLayoutPanel1.TabIndex = 0;
            // 
            // dccLabel1
            // 
            this.dccLabel1.AutoSize = true;
            this.dccLabel1.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.dccTableLayoutPanel1.SetColumnSpan(this.dccLabel1, 6);
            this.dccLabel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel1.Location = new System.Drawing.Point(4, 154);
            this.dccLabel1.Name = "dccLabel1";
            this.dccLabel1.Size = new System.Drawing.Size(827, 25);
            this.dccLabel1.TabIndex = 70;
            this.dccLabel1.Text = "Approval / Renewal Details";
            // 
            // dccLabel2
            // 
            this.dccLabel2.AutoSize = true;
            this.dccLabel2.BackColor = System.Drawing.SystemColors.Control;
            this.dccTableLayoutPanel1.SetColumnSpan(this.dccLabel2, 7);
            this.dccLabel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel2.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel2.Location = new System.Drawing.Point(4, 320);
            this.dccLabel2.Name = "dccLabel2";
            this.dccLabel2.Size = new System.Drawing.Size(950, 25);
            this.dccLabel2.TabIndex = 67;
            this.dccLabel2.Text = "Training Details";
            // 
            // tlpSewadarPhoto
            // 
            this.tlpSewadarPhoto.ColumnCount = 2;
            this.tlpSewadarPhoto.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpSewadarPhoto.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 75F));
            this.tlpSewadarPhoto.Controls.Add(this.ImgSewadarPhoto, 0, 0);
            this.tlpSewadarPhoto.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpSewadarPhoto.Location = new System.Drawing.Point(838, 4);
            this.tlpSewadarPhoto.Name = "tlpSewadarPhoto";
            this.tlpSewadarPhoto.RowCount = 1;
            this.dccTableLayoutPanel1.SetRowSpan(this.tlpSewadarPhoto, 4);
            this.tlpSewadarPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpSewadarPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 172F));
            this.tlpSewadarPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 172F));
            this.tlpSewadarPhoto.Size = new System.Drawing.Size(116, 172);
            this.tlpSewadarPhoto.TabIndex = 63;
            // 
            // ImgSewadarPhoto
            // 
            this.ImgSewadarPhoto.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.tlpSewadarPhoto.SetColumnSpan(this.ImgSewadarPhoto, 2);
            this.ImgSewadarPhoto.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ImgSewadarPhoto.Location = new System.Drawing.Point(3, 3);
            this.ImgSewadarPhoto.Name = "ImgSewadarPhoto";
            this.ImgSewadarPhoto.Size = new System.Drawing.Size(110, 166);
            this.ImgSewadarPhoto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.ImgSewadarPhoto.TabIndex = 0;
            this.ImgSewadarPhoto.TabStop = false;
            // 
            // dtmSewadarStatus
            // 
            this.dtmSewadarStatus.AllowFutureDate = true;
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
            this.dtmSewadarStatus.DisplayTextBindingKey = "global_sewadar_status_dt";
            this.dtmSewadarStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmSewadarStatus.EditingControlDataGridView = null;
            this.dtmSewadarStatus.EditingControlFormattedValue = null;
            this.dtmSewadarStatus.EditingControlRowIndex = 0;
            this.dtmSewadarStatus.EditingControlValueChanged = false;
            this.dtmSewadarStatus.EnableToolTip = false;
            this.dtmSewadarStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtmSewadarStatus.IdText = "";
            this.dtmSewadarStatus.IdTextBindingKey = null;
            this.dtmSewadarStatus.Location = new System.Drawing.Point(715, 4);
            this.dtmSewadarStatus.Lookup = true;
            this.dtmSewadarStatus.LookupColumns = null;
            this.dtmSewadarStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtmSewadarStatus.LookupResult = null;
            this.dtmSewadarStatus.LookupTitle = "Status Date";
            this.dtmSewadarStatus.Mandatory = false;
            this.dtmSewadarStatus.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtmSewadarStatus.MaxCharacterLength = 11;
            this.dtmSewadarStatus.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtmSewadarStatus.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtmSewadarStatus.MinCharactersForQuery = 0;
            this.dtmSewadarStatus.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtmSewadarStatus.MinValue = new System.DateTime(((long)(0)));
            this.dtmSewadarStatus.Name = "dtmSewadarStatus";
            this.dtmSewadarStatus.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtmSewadarStatus.PascalCase = false;
            this.dtmSewadarStatus.RangeInQueryMode = false;
            this.dtmSewadarStatus.ReadOnly = true;
            this.dtmSewadarStatus.RegularExpressionValidator = null;
            this.dtmSewadarStatus.ShowTime = false;
            this.dtmSewadarStatus.Size = new System.Drawing.Size(115, 44);
            this.dtmSewadarStatus.TabIndex = 62;
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
            this.txtSewadarStatus.DisplayTextBindingKey = "global_sewadar_status_nm";
            this.txtSewadarStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSewadarStatus.EditingControlDataGridView = null;
            this.txtSewadarStatus.EditingControlFormattedValue = "";
            this.txtSewadarStatus.EditingControlRowIndex = 0;
            this.txtSewadarStatus.EditingControlValueChanged = false;
            this.txtSewadarStatus.EnableToolTip = false;
            this.txtSewadarStatus.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSewadarStatus.IdText = null;
            this.txtSewadarStatus.IdTextBindingKey = null;
            this.txtSewadarStatus.Location = new System.Drawing.Point(593, 4);
            this.txtSewadarStatus.Lookup = false;
            this.txtSewadarStatus.LookupColumns = null;
            this.txtSewadarStatus.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtSewadarStatus.LookupResult = null;
            this.txtSewadarStatus.LookupTitle = "Global Status";
            this.txtSewadarStatus.Mandatory = false;
            this.txtSewadarStatus.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtSewadarStatus.MaxCharacterLength = 32767;
            this.txtSewadarStatus.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtSewadarStatus.MinCharactersForQuery = 0;
            this.txtSewadarStatus.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtSewadarStatus.Name = "txtSewadarStatus";
            this.txtSewadarStatus.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtSewadarStatus.PascalCase = false;
            this.txtSewadarStatus.RangeInQueryMode = false;
            this.txtSewadarStatus.ReadOnly = true;
            this.txtSewadarStatus.RegularExpressionValidator = null;
            this.txtSewadarStatus.Size = new System.Drawing.Size(113, 44);
            this.txtSewadarStatus.TabIndex = 61;
            this.txtSewadarStatus.TabStop = false;
            this.txtSewadarStatus.Title = "Global Status";
            this.txtSewadarStatus.ToolTipLookupField = "information";
            this.txtSewadarStatus.ValueText = null;
            // 
            // zsmGenderCombo1
            // 
            this.zsmGenderCombo1.ApplicationIdForDbConnection = null;
            this.zsmGenderCombo1.BackColor = System.Drawing.Color.Transparent;
            this.zsmGenderCombo1.DisplayText = ".......";
            this.zsmGenderCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.zsmGenderCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.zsmGenderCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.zsmGenderCombo1.Location = new System.Drawing.Point(160, 4);
            this.zsmGenderCombo1.Mandatory = false;
            this.zsmGenderCombo1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.zsmGenderCombo1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.zsmGenderCombo1.MinimumSize = new System.Drawing.Size(10, 22);
            this.zsmGenderCombo1.Name = "zsmGenderCombo1";
            this.zsmGenderCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.zsmGenderCombo1.ReadOnly = false;
            this.zsmGenderCombo1.SelectedIndex = 0;
            this.zsmGenderCombo1.SelectedText = ".......";
            this.zsmGenderCombo1.SelectedValue = null;
            this.zsmGenderCombo1.SelectedValueBindingKey = "gender";
            this.zsmGenderCombo1.Size = new System.Drawing.Size(94, 44);
            this.zsmGenderCombo1.TabIndex = 56;
            this.zsmGenderCombo1.TabStop = false;
            this.zsmGenderCombo1.Title = "Gender";
            this.zsmGenderCombo1.ValueText = null;
            // 
            // intSewadarId
            // 
            this.intSewadarId.AllowsNew = false;
            this.intSewadarId.AllowsReference = false;
            this.intSewadarId.AllowsUpdate = false;
            this.intSewadarId.ApplicationIdForDbConnection = null;
            this.intSewadarId.BackColor = System.Drawing.Color.Transparent;
            this.intSewadarId.CalledScreenApplicationId = null;
            this.intSewadarId.CalledScreenTypeName = null;
            this.intSewadarId.CallingScreenType = null;
            this.intSewadarId.DisplayText = "";
            this.intSewadarId.DisplayTextBindingKey = "speaker_id";
            this.intSewadarId.Dock = System.Windows.Forms.DockStyle.Fill;
            this.intSewadarId.EditingControlDataGridView = null;
            this.intSewadarId.EditingControlFormattedValue = null;
            this.intSewadarId.EditingControlRowIndex = 0;
            this.intSewadarId.EditingControlValueChanged = true;
            this.intSewadarId.EnableToolTip = false;
            this.intSewadarId.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.intSewadarId.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.intSewadarId.IdText = "";
            this.intSewadarId.IdTextBindingKey = "sewadar_id";
            this.intSewadarId.Location = new System.Drawing.Point(5, 4);
            this.intSewadarId.Lookup = true;
            this.intSewadarId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.intSewadarId.LookupResult = null;
            this.intSewadarId.LookupTitle = "Sewadar ID";
            this.intSewadarId.Mandatory = false;
            this.intSewadarId.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.intSewadarId.MaxCharacterLength = 32767;
            this.intSewadarId.MaximumSize = new System.Drawing.Size(1300, 45);
            this.intSewadarId.MinCharactersForQuery = 0;
            this.intSewadarId.MinimumSize = new System.Drawing.Size(10, 22);
            this.intSewadarId.Name = "intSewadarId";
            this.intSewadarId.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.intSewadarId.PascalCase = false;
            this.intSewadarId.RangeInQueryMode = false;
            this.intSewadarId.ReadOnly = false;
            this.intSewadarId.RegularExpressionValidator = null;
            this.intSewadarId.Size = new System.Drawing.Size(146, 44);
            this.intSewadarId.TabIndex = 1;
            this.intSewadarId.Title = "Sewadar ID";
            this.intSewadarId.ToolTipLookupField = "information";
            this.intSewadarId.ValueText = "";
            this.intSewadarId.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.intSewadarId_LookupResultSet);
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
            this.txtName.DisplayText = "";
            this.txtName.DisplayTextBindingKey = "full_nm";
            this.txtName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtName.EditingControlDataGridView = null;
            this.txtName.EditingControlFormattedValue = null;
            this.txtName.EditingControlRowIndex = 0;
            this.txtName.EditingControlValueChanged = true;
            this.txtName.EnableToolTip = false;
            this.txtName.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.txtName.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtName.IdText = "";
            this.txtName.IdTextBindingKey = "sewadar_id";
            this.txtName.Location = new System.Drawing.Point(263, 4);
            this.txtName.Lookup = true;
            this.txtName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Largest;
            this.txtName.LookupResult = null;
            this.txtName.LookupTitle = "Name";
            this.txtName.Mandatory = true;
            this.txtName.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtName.MaxCharacterLength = 32767;
            this.txtName.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtName.MinCharactersForQuery = 0;
            this.txtName.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtName.Name = "txtName";
            this.txtName.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.txtName.PascalCase = false;
            this.txtName.RangeInQueryMode = false;
            this.txtName.ReadOnly = false;
            this.txtName.RegularExpressionValidator = null;
            this.txtName.Size = new System.Drawing.Size(257, 44);
            this.txtName.TabIndex = 57;
            this.txtName.Title = "Name";
            this.txtName.ToolTipLookupField = "information";
            this.txtName.ValueText = "";
            this.txtName.LookupResultSet += new System.EventHandler<DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs>(this.txtName_LookupResultSet);
            // 
            // txtAge
            // 
            this.txtAge.AllowsNew = false;
            this.txtAge.AllowsReference = false;
            this.txtAge.AllowsUpdate = false;
            this.txtAge.ApplicationIdForDbConnection = null;
            this.txtAge.BackColor = System.Drawing.Color.Transparent;
            this.txtAge.CalledScreenApplicationId = null;
            this.txtAge.CalledScreenTypeName = null;
            this.txtAge.CallingScreenType = null;
            this.txtAge.DisplayText = "";
            this.txtAge.DisplayTextBindingKey = "age";
            this.txtAge.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtAge.EditingControlDataGridView = null;
            this.txtAge.EditingControlFormattedValue = "";
            this.txtAge.EditingControlRowIndex = 0;
            this.txtAge.EditingControlValueChanged = false;
            this.txtAge.EnableToolTip = false;
            this.txtAge.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAge.IdText = null;
            this.txtAge.IdTextBindingKey = null;
            this.txtAge.Location = new System.Drawing.Point(529, 4);
            this.txtAge.Lookup = false;
            this.txtAge.LookupColumns = null;
            this.txtAge.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txtAge.LookupResult = null;
            this.txtAge.LookupTitle = "Age";
            this.txtAge.Mandatory = false;
            this.txtAge.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.txtAge.MaxCharacterLength = 32767;
            this.txtAge.MaximumSize = new System.Drawing.Size(1300, 45);
            this.txtAge.MaxValue = ((long)(9223372036854775807));
            this.txtAge.MinCharactersForQuery = 0;
            this.txtAge.MinimumSize = new System.Drawing.Size(10, 22);
            this.txtAge.MinValue = ((long)(-9223372036854775808));
            this.txtAge.Name = "txtAge";
            this.txtAge.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.txtAge.PascalCase = false;
            this.txtAge.RangeInQueryMode = false;
            this.txtAge.ReadOnly = true;
            this.txtAge.RegularExpressionValidator = null;
            this.txtAge.Size = new System.Drawing.Size(55, 44);
            this.txtAge.TabIndex = 59;
            this.txtAge.TabStop = false;
            this.txtAge.Title = "Age";
            this.txtAge.ToolTipLookupField = "information";
            this.txtAge.ValueText = null;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 4;
            this.dccTableLayoutPanel1.SetColumnSpan(this.tableLayoutPanel1, 6);
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 44.77612F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 55.22388F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 161F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 358F));
            this.tableLayoutPanel1.Controls.Add(this.dtmCurrentStatusDate, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.speakerStatusCombo1, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.speakerTypeCombo1, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(4, 55);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 1;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(827, 44);
            this.tableLayoutPanel1.TabIndex = 64;
            // 
            // dtmCurrentStatusDate
            // 
            this.dtmCurrentStatusDate.AllowFutureDate = true;
            this.dtmCurrentStatusDate.AllowsNew = false;
            this.dtmCurrentStatusDate.AllowsReference = false;
            this.dtmCurrentStatusDate.AllowsUpdate = false;
            this.dtmCurrentStatusDate.ApplicationIdForDbConnection = null;
            this.dtmCurrentStatusDate.BackColor = System.Drawing.Color.Transparent;
            this.dtmCurrentStatusDate.CalledScreenApplicationId = null;
            this.dtmCurrentStatusDate.CalledScreenTypeName = null;
            this.dtmCurrentStatusDate.CallingScreenType = null;
            this.dtmCurrentStatusDate.DisplayText = null;
            this.dtmCurrentStatusDate.DisplayTextAsDateTime = null;
            this.dtmCurrentStatusDate.DisplayTextBindingKey = "sewadar_status_dtm";
            this.dtmCurrentStatusDate.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtmCurrentStatusDate.EditingControlDataGridView = null;
            this.dtmCurrentStatusDate.EditingControlFormattedValue = null;
            this.dtmCurrentStatusDate.EditingControlRowIndex = 0;
            this.dtmCurrentStatusDate.EditingControlValueChanged = false;
            this.dtmCurrentStatusDate.EnableToolTip = false;
            this.dtmCurrentStatusDate.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtmCurrentStatusDate.IdText = "";
            this.dtmCurrentStatusDate.IdTextBindingKey = "speaker_status_dtm";
            this.dtmCurrentStatusDate.Location = new System.Drawing.Point(311, 3);
            this.dtmCurrentStatusDate.Lookup = true;
            this.dtmCurrentStatusDate.LookupColumns = null;
            this.dtmCurrentStatusDate.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dtmCurrentStatusDate.LookupResult = null;
            this.dtmCurrentStatusDate.LookupTitle = "Status Date";
            this.dtmCurrentStatusDate.Mandatory = true;
            this.dtmCurrentStatusDate.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dtmCurrentStatusDate.MaxCharacterLength = 20;
            this.dtmCurrentStatusDate.MaximumSize = new System.Drawing.Size(1300, 45);
            this.dtmCurrentStatusDate.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.dtmCurrentStatusDate.MinCharactersForQuery = 0;
            this.dtmCurrentStatusDate.MinimumSize = new System.Drawing.Size(10, 22);
            this.dtmCurrentStatusDate.MinValue = new System.DateTime(((long)(0)));
            this.dtmCurrentStatusDate.Name = "dtmCurrentStatusDate";
            this.dtmCurrentStatusDate.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.dtmCurrentStatusDate.PascalCase = false;
            this.dtmCurrentStatusDate.RangeInQueryMode = true;
            this.dtmCurrentStatusDate.ReadOnly = false;
            this.dtmCurrentStatusDate.RegularExpressionValidator = null;
            this.dtmCurrentStatusDate.ShowTime = true;
            this.dtmCurrentStatusDate.Size = new System.Drawing.Size(153, 38);
            this.dtmCurrentStatusDate.TabIndex = 65;
            this.dtmCurrentStatusDate.Title = "Status Date";
            this.dtmCurrentStatusDate.ToolTipLookupField = "information";
            this.dtmCurrentStatusDate.ValueText = "";
            // 
            // speakerStatusCombo1
            // 
            this.speakerStatusCombo1.ApplicationIdForDbConnection = null;
            this.speakerStatusCombo1.BackColor = System.Drawing.Color.Transparent;
            this.speakerStatusCombo1.DisplayText = ".......";
            this.speakerStatusCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.speakerStatusCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.speakerStatusCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.speakerStatusCombo1.Location = new System.Drawing.Point(141, 3);
            this.speakerStatusCombo1.Mandatory = false;
            this.speakerStatusCombo1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.speakerStatusCombo1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.speakerStatusCombo1.MinimumSize = new System.Drawing.Size(10, 22);
            this.speakerStatusCombo1.Name = "speakerStatusCombo1";
            this.speakerStatusCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.speakerStatusCombo1.ReadOnly = false;
            this.speakerStatusCombo1.SelectedIndex = 0;
            this.speakerStatusCombo1.SelectedText = ".......";
            this.speakerStatusCombo1.SelectedValue = null;
            this.speakerStatusCombo1.SelectedValueBindingKey = "speaker_status";
            this.speakerStatusCombo1.Size = new System.Drawing.Size(162, 38);
            this.speakerStatusCombo1.TabIndex = 0;
            this.speakerStatusCombo1.Title = "Speaker Status";
            this.speakerStatusCombo1.ValueText = null;
            // 
            // speakerTypeCombo1
            // 
            this.speakerTypeCombo1.ApplicationIdForDbConnection = null;
            this.speakerTypeCombo1.BackColor = System.Drawing.Color.Transparent;
            this.speakerTypeCombo1.DisplayText = ".......";
            this.speakerTypeCombo1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.speakerTypeCombo1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.speakerTypeCombo1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.speakerTypeCombo1.Location = new System.Drawing.Point(4, 3);
            this.speakerTypeCombo1.Mandatory = false;
            this.speakerTypeCombo1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.speakerTypeCombo1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.speakerTypeCombo1.MinimumSize = new System.Drawing.Size(10, 22);
            this.speakerTypeCombo1.Name = "speakerTypeCombo1";
            this.speakerTypeCombo1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.speakerTypeCombo1.ReadOnly = false;
            this.speakerTypeCombo1.SelectedIndex = 0;
            this.speakerTypeCombo1.SelectedText = ".......";
            this.speakerTypeCombo1.SelectedValue = null;
            this.speakerTypeCombo1.SelectedValueBindingKey = "speaker_type";
            this.speakerTypeCombo1.Size = new System.Drawing.Size(129, 38);
            this.speakerTypeCombo1.TabIndex = 1;
            this.speakerTypeCombo1.Title = "Speaker Type";
            this.speakerTypeCombo1.ValueText = null;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 3;
            this.dccTableLayoutPanel1.SetColumnSpan(this.tableLayoutPanel2, 6);
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 291F));
            this.tableLayoutPanel2.Controls.Add(this.zsmSatsangCentresLookup1, 2, 0);
            this.tableLayoutPanel2.Controls.Add(this.cmbSatsangCentreType, 1, 0);
            this.tableLayoutPanel2.Controls.Add(this.zsmSatsangCentresLookup2, 0, 0);
            this.tableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel2.Location = new System.Drawing.Point(4, 106);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 1;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(827, 44);
            this.tableLayoutPanel2.TabIndex = 65;
            // 
            // zsmSatsangCentresLookup1
            // 
            this.zsmSatsangCentresLookup1.AllowsNew = false;
            this.zsmSatsangCentresLookup1.AllowsReference = false;
            this.zsmSatsangCentresLookup1.AllowsUpdate = false;
            this.zsmSatsangCentresLookup1.ApplicationIdForDbConnection = null;
            this.zsmSatsangCentresLookup1.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.zsmSatsangCentresLookup1.BackColor = System.Drawing.Color.Transparent;
            this.zsmSatsangCentresLookup1.CalledScreenApplicationId = null;
            this.zsmSatsangCentresLookup1.CalledScreenTypeName = null;
            this.zsmSatsangCentresLookup1.CallingScreenType = null;
            this.zsmSatsangCentresLookup1.DisplayText = "";
            this.zsmSatsangCentresLookup1.DisplayTextBindingKey = "reporting_centre_nm";
            this.zsmSatsangCentresLookup1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.zsmSatsangCentresLookup1.EditingControlDataGridView = null;
            this.zsmSatsangCentresLookup1.EditingControlFormattedValue = "";
            this.zsmSatsangCentresLookup1.EditingControlRowIndex = 0;
            this.zsmSatsangCentresLookup1.EditingControlValueChanged = true;
            this.zsmSatsangCentresLookup1.EnableToolTip = false;
            this.zsmSatsangCentresLookup1.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.zsmSatsangCentresLookup1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.zsmSatsangCentresLookup1.IdText = "";
            this.zsmSatsangCentresLookup1.IdTextBindingKey = "reports_to_centre_id";
            this.zsmSatsangCentresLookup1.Location = new System.Drawing.Point(540, 3);
            this.zsmSatsangCentresLookup1.Lookup = false;
            this.zsmSatsangCentresLookup1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.zsmSatsangCentresLookup1.LookupResult = null;
            this.zsmSatsangCentresLookup1.LookupTitle = "Reporting To Centre";
            this.zsmSatsangCentresLookup1.Mandatory = false;
            this.zsmSatsangCentresLookup1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.zsmSatsangCentresLookup1.MaxCharacterLength = 32767;
            this.zsmSatsangCentresLookup1.MaximumSize = new System.Drawing.Size(1300, 45);
            this.zsmSatsangCentresLookup1.MinCharactersForQuery = 0;
            this.zsmSatsangCentresLookup1.MinimumSize = new System.Drawing.Size(10, 22);
            this.zsmSatsangCentresLookup1.Name = "zsmSatsangCentresLookup1";
            this.zsmSatsangCentresLookup1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.zsmSatsangCentresLookup1.PascalCase = false;
            this.zsmSatsangCentresLookup1.RangeInQueryMode = false;
            this.zsmSatsangCentresLookup1.ReadOnly = false;
            this.zsmSatsangCentresLookup1.RegularExpressionValidator = null;
            this.zsmSatsangCentresLookup1.ShowNonMainCentres = true;
            this.zsmSatsangCentresLookup1.Size = new System.Drawing.Size(283, 38);
            this.zsmSatsangCentresLookup1.TabIndex = 10;
            this.zsmSatsangCentresLookup1.Title = "Reporting To Centre";
            this.zsmSatsangCentresLookup1.ToolTipLookupField = "information";
            this.zsmSatsangCentresLookup1.ValueText = "";
            // 
            // cmbSatsangCentreType
            // 
            this.cmbSatsangCentreType.ApplicationIdForDbConnection = null;
            this.cmbSatsangCentreType.BackColor = System.Drawing.Color.Transparent;
            this.cmbSatsangCentreType.DisplayText = "";
            this.cmbSatsangCentreType.Dock = System.Windows.Forms.DockStyle.Top;
            this.cmbSatsangCentreType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSatsangCentreType.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbSatsangCentreType.Location = new System.Drawing.Point(272, 3);
            this.cmbSatsangCentreType.Mandatory = true;
            this.cmbSatsangCentreType.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.cmbSatsangCentreType.MaximumSize = new System.Drawing.Size(1300, 44);
            this.cmbSatsangCentreType.MinimumSize = new System.Drawing.Size(10, 22);
            this.cmbSatsangCentreType.Name = "cmbSatsangCentreType";
            this.cmbSatsangCentreType.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.cmbSatsangCentreType.ReadOnly = false;
            this.cmbSatsangCentreType.SelectedIndex = -1;
            this.cmbSatsangCentreType.SelectedItem = null;
            this.cmbSatsangCentreType.SelectedText = "";
            this.cmbSatsangCentreType.SelectedValue = null;
            this.cmbSatsangCentreType.SelectedValueBindingKey = "satsang_centre_type";
            this.cmbSatsangCentreType.Size = new System.Drawing.Size(260, 38);
            this.cmbSatsangCentreType.TabIndex = 4;
            this.cmbSatsangCentreType.Title = "Type";
            this.cmbSatsangCentreType.ValueText = null;
            // 
            // zsmSatsangCentresLookup2
            // 
            this.zsmSatsangCentresLookup2.AllowsNew = false;
            this.zsmSatsangCentresLookup2.AllowsReference = false;
            this.zsmSatsangCentresLookup2.AllowsUpdate = false;
            this.zsmSatsangCentresLookup2.ApplicationIdForDbConnection = null;
            this.zsmSatsangCentresLookup2.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.zsmSatsangCentresLookup2.BackColor = System.Drawing.Color.Transparent;
            this.zsmSatsangCentresLookup2.CalledScreenApplicationId = null;
            this.zsmSatsangCentresLookup2.CalledScreenTypeName = null;
            this.zsmSatsangCentresLookup2.CallingScreenType = null;
            this.zsmSatsangCentresLookup2.DisplayText = "";
            this.zsmSatsangCentresLookup2.DisplayTextBindingKey = null;
            this.zsmSatsangCentresLookup2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.zsmSatsangCentresLookup2.EditingControlDataGridView = null;
            this.zsmSatsangCentresLookup2.EditingControlFormattedValue = null;
            this.zsmSatsangCentresLookup2.EditingControlRowIndex = 0;
            this.zsmSatsangCentresLookup2.EditingControlValueChanged = true;
            this.zsmSatsangCentresLookup2.EnableToolTip = false;
            this.zsmSatsangCentresLookup2.EntityStatus = DCC.UMB.CDF.UIControls.TextControls.Status.Active;
            this.zsmSatsangCentresLookup2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.zsmSatsangCentresLookup2.IdText = "";
            this.zsmSatsangCentresLookup2.IdTextBindingKey = "centre_nm";
            this.zsmSatsangCentresLookup2.Location = new System.Drawing.Point(4, 3);
            this.zsmSatsangCentresLookup2.Lookup = true;
            this.zsmSatsangCentresLookup2.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.zsmSatsangCentresLookup2.LookupResult = null;
            this.zsmSatsangCentresLookup2.LookupTitle = "Satsang Centre";
            this.zsmSatsangCentresLookup2.Mandatory = false;
            this.zsmSatsangCentresLookup2.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.zsmSatsangCentresLookup2.MaxCharacterLength = 32767;
            this.zsmSatsangCentresLookup2.MaximumSize = new System.Drawing.Size(1300, 45);
            this.zsmSatsangCentresLookup2.MinCharactersForQuery = 0;
            this.zsmSatsangCentresLookup2.MinimumSize = new System.Drawing.Size(10, 22);
            this.zsmSatsangCentresLookup2.Name = "zsmSatsangCentresLookup2";
            this.zsmSatsangCentresLookup2.Padding = new System.Windows.Forms.Padding(0, 17, 14, 0);
            this.zsmSatsangCentresLookup2.PascalCase = false;
            this.zsmSatsangCentresLookup2.RangeInQueryMode = false;
            this.zsmSatsangCentresLookup2.ReadOnly = false;
            this.zsmSatsangCentresLookup2.RegularExpressionValidator = null;
            this.zsmSatsangCentresLookup2.ShowNonMainCentres = true;
            this.zsmSatsangCentresLookup2.Size = new System.Drawing.Size(260, 38);
            this.zsmSatsangCentresLookup2.TabIndex = 11;
            this.zsmSatsangCentresLookup2.Title = "Satsang Centre";
            this.zsmSatsangCentresLookup2.ToolTipLookupField = "information";
            this.zsmSatsangCentresLookup2.ValueText = "";
            // 
            // grdApproval
            // 
            this.grdApproval.AllowRowSorting = false;
            this.grdApproval.AllowUserToAddRows = false;
            this.grdApproval.AutoAddNewRowForUser = true;
            this.grdApproval.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdApproval.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.request_for_speaker_type,
            this.request_dt,
            this.approval_dt,
            this.reference_no,
            this.reference_dt,
            this.audition_remarks,
            this.review_remarks,
            this.review_sewadar_id,
            this.review_non_sewadar_nm,
            this.remarks,
            this.txn_ts_aud});
            this.dccTableLayoutPanel1.SetColumnSpan(this.grdApproval, 7);
            this.grdApproval.DeleteRowMenuEnabled = true;
            this.grdApproval.DeleteVisible = true;
            this.grdApproval.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdApproval.ExportToExcelVisible = true;
            this.grdApproval.InsertAfterVisible = true;
            this.grdApproval.InsertBeforeVisible = true;
            this.grdApproval.InsertLastVisible = true;
            this.grdApproval.InsertRowsMenuItemsEnabled = true;
            this.grdApproval.Location = new System.Drawing.Point(4, 183);
            this.grdApproval.Mandatory = false;
            this.grdApproval.MoveDownVisible = false;
            this.grdApproval.MoveUpVisible = false;
            this.grdApproval.MultiSelect = false;
            this.grdApproval.Name = "grdApproval";
            this.grdApproval.RowHeadersWidth = 15;
            this.grdApproval.ShowCommandStrip = false;
            this.grdApproval.Size = new System.Drawing.Size(950, 133);
            this.grdApproval.TabIndex = 68;
            this.grdApproval.Title = null;
            this.grdApproval.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdApproval.VirtualMode = true;
            // 
            // grdTraining
            // 
            this.grdTraining.AllowRowSorting = false;
            this.grdTraining.AllowUserToAddRows = false;
            this.grdTraining.AutoAddNewRowForUser = false;
            this.grdTraining.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdTraining.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.training_request_dt,
            this.training_dt,
            this.isAttended,
            this.training_reference_no,
            this.training_reference_dt,
            this.training_remarks,
            this.txn_ts_training});
            this.dccTableLayoutPanel1.SetColumnSpan(this.grdTraining, 7);
            this.grdTraining.DeleteRowMenuEnabled = true;
            this.grdTraining.DeleteVisible = true;
            this.grdTraining.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdTraining.ExportToExcelVisible = true;
            this.grdTraining.InsertAfterVisible = true;
            this.grdTraining.InsertBeforeVisible = true;
            this.grdTraining.InsertLastVisible = true;
            this.grdTraining.InsertRowsMenuItemsEnabled = true;
            this.grdTraining.Location = new System.Drawing.Point(4, 349);
            this.grdTraining.Mandatory = false;
            this.grdTraining.MoveDownVisible = false;
            this.grdTraining.MoveUpVisible = false;
            this.grdTraining.MultiSelect = false;
            this.grdTraining.Name = "grdTraining";
            this.grdTraining.RowHeadersWidth = 15;
            this.grdTraining.ShowCommandStrip = false;
            this.grdTraining.Size = new System.Drawing.Size(950, 133);
            this.grdTraining.TabIndex = 69;
            this.grdTraining.Title = null;
            this.grdTraining.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdTraining.VirtualMode = true;
            this.grdTraining.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdTraining_CellContentClick);
            // 
            // training_request_dt
            // 
            this.training_request_dt.BindingKey = null;
            this.training_request_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.training_request_dt.DefaultCellStyle = dataGridViewCellStyle4;
            this.training_request_dt.HeaderText = "Request Date";
            this.training_request_dt.Lookup = false;
            this.training_request_dt.LookupColumns = "";
            this.training_request_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.training_request_dt.Mandatory = false;
            this.training_request_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.training_request_dt.MinValue = new System.DateTime(((long)(0)));
            this.training_request_dt.Name = "training_request_dt";
            this.training_request_dt.PercentageWidth = 13F;
            this.training_request_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.training_request_dt.ToolTipLookupField = "information";
            this.training_request_dt.Width = 121;
            // 
            // training_dt
            // 
            this.training_dt.BindingKey = null;
            this.training_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.training_dt.DefaultCellStyle = dataGridViewCellStyle5;
            this.training_dt.HeaderText = "Training Date";
            this.training_dt.Lookup = false;
            this.training_dt.LookupColumns = "";
            this.training_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.training_dt.Mandatory = false;
            this.training_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.training_dt.MinValue = new System.DateTime(((long)(0)));
            this.training_dt.Name = "training_dt";
            this.training_dt.PercentageWidth = 13F;
            this.training_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.training_dt.ToolTipLookupField = "information";
            this.training_dt.Width = 121;
            // 
            // isAttended
            // 
            this.isAttended.BindingKey = null;
            this.isAttended.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.CheckBox;
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.isAttended.DefaultCellStyle = dataGridViewCellStyle6;
            this.isAttended.HeaderText = "Is Attended";
            this.isAttended.Lookup = false;
            this.isAttended.LookupColumns = "";
            this.isAttended.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.isAttended.Mandatory = false;
            this.isAttended.Name = "isAttended";
            this.isAttended.PercentageWidth = 8F;
            this.isAttended.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.isAttended.ToolTipLookupField = "information";
            this.isAttended.Width = 74;
            // 
            // training_reference_no
            // 
            this.training_reference_no.BindingKey = null;
            this.training_reference_no.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.training_reference_no.HeaderText = "Ref. No.";
            this.training_reference_no.Lookup = false;
            this.training_reference_no.LookupColumns = "";
            this.training_reference_no.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.training_reference_no.Mandatory = false;
            this.training_reference_no.MaxCharacterLength = 2147483647;
            this.training_reference_no.Name = "training_reference_no";
            this.training_reference_no.PercentageWidth = 15F;
            this.training_reference_no.RegularExpressionValidator = "";
            this.training_reference_no.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.training_reference_no.ToolTipLookupField = "information";
            this.training_reference_no.Width = 140;
            // 
            // training_reference_dt
            // 
            this.training_reference_dt.BindingKey = null;
            this.training_reference_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.training_reference_dt.DefaultCellStyle = dataGridViewCellStyle7;
            this.training_reference_dt.HeaderText = "Ref. Date";
            this.training_reference_dt.Lookup = false;
            this.training_reference_dt.LookupColumns = "";
            this.training_reference_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.training_reference_dt.Mandatory = false;
            this.training_reference_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.training_reference_dt.MinValue = new System.DateTime(((long)(0)));
            this.training_reference_dt.Name = "training_reference_dt";
            this.training_reference_dt.PercentageWidth = 13F;
            this.training_reference_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.training_reference_dt.ToolTipLookupField = "information";
            this.training_reference_dt.Width = 121;
            // 
            // training_remarks
            // 
            this.training_remarks.BindingKey = null;
            this.training_remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.training_remarks.HeaderText = "Remarks";
            this.training_remarks.Lookup = false;
            this.training_remarks.LookupColumns = "";
            this.training_remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.training_remarks.Mandatory = false;
            this.training_remarks.MaxCharacterLength = 2147483647;
            this.training_remarks.Name = "training_remarks";
            this.training_remarks.PercentageWidth = 38F;
            this.training_remarks.RegularExpressionValidator = "";
            this.training_remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.training_remarks.ToolTipLookupField = "information";
            this.training_remarks.Width = 355;
            // 
            // txn_ts_training
            // 
            this.txn_ts_training.BindingKey = "txn_ts";
            this.txn_ts_training.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Object;
            this.txn_ts_training.HeaderText = "Txn Ts";
            this.txn_ts_training.Lookup = false;
            this.txn_ts_training.LookupColumns = "";
            this.txn_ts_training.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txn_ts_training.Mandatory = false;
            this.txn_ts_training.Name = "txn_ts_training";
            this.txn_ts_training.PercentageWidth = 25F;
            this.txn_ts_training.ReadOnly = true;
            this.txn_ts_training.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txn_ts_training.ToolTipLookupField = "information";
            this.txn_ts_training.Visible = false;
            // 
            // tableLayoutPanel3
            // 
            this.tableLayoutPanel3.ColumnCount = 1;
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel3.Controls.Add(this.grdList, 0, 0);
            this.tableLayoutPanel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel3.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel3.Name = "tableLayoutPanel3";
            this.tableLayoutPanel3.RowCount = 1;
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel3.Size = new System.Drawing.Size(96, 100);
            this.tableLayoutPanel3.TabIndex = 0;
            // 
            // grdList
            // 
            this.grdList.AllowRowSorting = false;
            this.grdList.AllowUserToAddRows = false;
            this.grdList.AutoAddNewRowForUser = false;
            this.grdList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.SpeakerId,
            this.FullName,
            this.gender,
            this.birth_dtm,
            this.age,
            this.global_sewadar_status_cd,
            this.global_sewadar_status_dt,
            this.sewadar_status_nm,
            this.sewadar_status_dt,
            this.satsang_centre_id,
            this.is_main_centre,
            this.centre_nm,
            this.SpeakerType,
            this.speaker_status,
            this.speaker_status_dtm,
            this.txn_ts});
            this.grdList.DeleteRowMenuEnabled = true;
            this.grdList.DeleteVisible = true;
            this.grdList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdList.ExportToExcelVisible = true;
            this.grdList.InsertAfterVisible = true;
            this.grdList.InsertBeforeVisible = true;
            this.grdList.InsertLastVisible = true;
            this.grdList.InsertRowsMenuItemsEnabled = true;
            this.grdList.Location = new System.Drawing.Point(3, 3);
            this.grdList.Mandatory = false;
            this.grdList.MoveDownVisible = false;
            this.grdList.MoveUpVisible = false;
            this.grdList.MultiSelect = false;
            this.grdList.Name = "grdList";
            this.grdList.RowHeadersWidth = 15;
            this.grdList.ShowCommandStrip = false;
            this.grdList.Size = new System.Drawing.Size(90, 94);
            this.grdList.TabIndex = 0;
            this.grdList.Title = null;
            this.grdList.UserMode = DCC.UMB.CDF.UIControls.Grid.UserModes.Auto;
            this.grdList.VirtualMode = true;
            // 
            // SpeakerId
            // 
            this.SpeakerId.BindingKey = "speaker_id";
            this.SpeakerId.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.SpeakerId.DefaultCellStyle = dataGridViewCellStyle8;
            this.SpeakerId.HeaderText = "Speaker Id";
            this.SpeakerId.Lookup = false;
            this.SpeakerId.LookupColumns = "";
            this.SpeakerId.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.SpeakerId.Mandatory = false;
            this.SpeakerId.MaxValue = ((long)(9223372036854775807));
            this.SpeakerId.MinValue = ((long)(-9223372036854775808));
            this.SpeakerId.Name = "SpeakerId";
            this.SpeakerId.PercentageWidth = 5F;
            this.SpeakerId.ReadOnly = true;
            this.SpeakerId.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.SpeakerId.ToolTipLookupField = "information";
            this.SpeakerId.Width = 5;
            // 
            // FullName
            // 
            this.FullName.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.FullName.BindingKey = "full_nm";
            this.FullName.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.FullName.HeaderText = "Sewadar  Name";
            this.FullName.Lookup = false;
            this.FullName.LookupColumns = "";
            this.FullName.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.FullName.Mandatory = false;
            this.FullName.MaxCharacterLength = 2147483647;
            this.FullName.Name = "FullName";
            this.FullName.PercentageWidth = 10F;
            this.FullName.ReadOnly = true;
            this.FullName.RegularExpressionValidator = "";
            this.FullName.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.FullName.ToolTipLookupField = "information";
            this.FullName.Width = 88;
            // 
            // gender
            // 
            this.gender.BindingKey = "gender";
            this.gender.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.gender.HeaderText = "Gender";
            this.gender.Lookup = false;
            this.gender.LookupColumns = "";
            this.gender.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.gender.Mandatory = false;
            this.gender.MaxCharacterLength = 2147483647;
            this.gender.Name = "gender";
            this.gender.PercentageWidth = 5F;
            this.gender.ReadOnly = true;
            this.gender.RegularExpressionValidator = "";
            this.gender.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.gender.ToolTipLookupField = "information";
            this.gender.Width = 5;
            // 
            // birth_dtm
            // 
            this.birth_dtm.BindingKey = "birth_dtm";
            this.birth_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.birth_dtm.DefaultCellStyle = dataGridViewCellStyle9;
            this.birth_dtm.HeaderText = "Birth Date";
            this.birth_dtm.Lookup = false;
            this.birth_dtm.LookupColumns = "";
            this.birth_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.birth_dtm.Mandatory = false;
            this.birth_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.birth_dtm.MinValue = new System.DateTime(((long)(0)));
            this.birth_dtm.Name = "birth_dtm";
            this.birth_dtm.PercentageWidth = 10F;
            this.birth_dtm.ReadOnly = true;
            this.birth_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.birth_dtm.ToolTipLookupField = "information";
            this.birth_dtm.Width = 7;
            // 
            // age
            // 
            this.age.BindingKey = "age";
            this.age.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.age.DefaultCellStyle = dataGridViewCellStyle10;
            this.age.HeaderText = "Age";
            this.age.Lookup = false;
            this.age.LookupColumns = "";
            this.age.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.age.Mandatory = false;
            this.age.MaxValue = ((long)(9223372036854775807));
            this.age.MinValue = ((long)(-9223372036854775808));
            this.age.Name = "age";
            this.age.PercentageWidth = 10F;
            this.age.ReadOnly = true;
            this.age.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.age.ToolTipLookupField = "information";
            this.age.Width = 7;
            // 
            // global_sewadar_status_cd
            // 
            this.global_sewadar_status_cd.BindingKey = "global_sewadar_status_cd";
            this.global_sewadar_status_cd.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.global_sewadar_status_cd.DefaultCellStyle = dataGridViewCellStyle11;
            this.global_sewadar_status_cd.HeaderText = "Global Sewadar Status code";
            this.global_sewadar_status_cd.Lookup = false;
            this.global_sewadar_status_cd.LookupColumns = "";
            this.global_sewadar_status_cd.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.global_sewadar_status_cd.Mandatory = false;
            this.global_sewadar_status_cd.MaxValue = ((long)(9223372036854775807));
            this.global_sewadar_status_cd.MinValue = ((long)(-9223372036854775808));
            this.global_sewadar_status_cd.Name = "global_sewadar_status_cd";
            this.global_sewadar_status_cd.PercentageWidth = 10F;
            this.global_sewadar_status_cd.ReadOnly = true;
            this.global_sewadar_status_cd.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.global_sewadar_status_cd.ToolTipLookupField = "information";
            this.global_sewadar_status_cd.Visible = false;
            this.global_sewadar_status_cd.Width = 234;
            // 
            // global_sewadar_status_dt
            // 
            this.global_sewadar_status_dt.BindingKey = "global_sewadar_status_dt";
            this.global_sewadar_status_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.global_sewadar_status_dt.DefaultCellStyle = dataGridViewCellStyle12;
            this.global_sewadar_status_dt.HeaderText = "Global Sewadar Status date";
            this.global_sewadar_status_dt.Lookup = false;
            this.global_sewadar_status_dt.LookupColumns = "";
            this.global_sewadar_status_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.global_sewadar_status_dt.Mandatory = false;
            this.global_sewadar_status_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.global_sewadar_status_dt.MinValue = new System.DateTime(((long)(0)));
            this.global_sewadar_status_dt.Name = "global_sewadar_status_dt";
            this.global_sewadar_status_dt.PercentageWidth = 5F;
            this.global_sewadar_status_dt.ReadOnly = true;
            this.global_sewadar_status_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.global_sewadar_status_dt.ToolTipLookupField = "information";
            this.global_sewadar_status_dt.Width = 5;
            // 
            // sewadar_status_nm
            // 
            this.sewadar_status_nm.BindingKey = "sewadar_status_nm";
            this.sewadar_status_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.sewadar_status_nm.HeaderText = "Sewadar Status";
            this.sewadar_status_nm.Lookup = false;
            this.sewadar_status_nm.LookupColumns = "";
            this.sewadar_status_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_nm.Mandatory = false;
            this.sewadar_status_nm.MaxCharacterLength = 2147483647;
            this.sewadar_status_nm.Name = "sewadar_status_nm";
            this.sewadar_status_nm.PercentageWidth = 10F;
            this.sewadar_status_nm.ReadOnly = true;
            this.sewadar_status_nm.RegularExpressionValidator = "";
            this.sewadar_status_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_nm.ToolTipLookupField = "information";
            this.sewadar_status_nm.Width = 7;
            // 
            // sewadar_status_dt
            // 
            this.sewadar_status_dt.BindingKey = "sewadar_status_dt";
            this.sewadar_status_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle13.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.sewadar_status_dt.DefaultCellStyle = dataGridViewCellStyle13;
            this.sewadar_status_dt.HeaderText = "Sewadar Status Date";
            this.sewadar_status_dt.Lookup = false;
            this.sewadar_status_dt.LookupColumns = "";
            this.sewadar_status_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.sewadar_status_dt.Mandatory = false;
            this.sewadar_status_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.sewadar_status_dt.MinValue = new System.DateTime(((long)(0)));
            this.sewadar_status_dt.Name = "sewadar_status_dt";
            this.sewadar_status_dt.PercentageWidth = 10F;
            this.sewadar_status_dt.ReadOnly = true;
            this.sewadar_status_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.sewadar_status_dt.ToolTipLookupField = "information";
            this.sewadar_status_dt.Width = 7;
            // 
            // satsang_centre_id
            // 
            this.satsang_centre_id.BindingKey = "satsang_centre_id";
            this.satsang_centre_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle14.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.satsang_centre_id.DefaultCellStyle = dataGridViewCellStyle14;
            this.satsang_centre_id.HeaderText = "Satsang Centre Id";
            this.satsang_centre_id.Lookup = false;
            this.satsang_centre_id.LookupColumns = "";
            this.satsang_centre_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.satsang_centre_id.Mandatory = false;
            this.satsang_centre_id.MaxValue = ((long)(9223372036854775807));
            this.satsang_centre_id.MinValue = ((long)(-9223372036854775808));
            this.satsang_centre_id.Name = "satsang_centre_id";
            this.satsang_centre_id.PercentageWidth = 25F;
            this.satsang_centre_id.ReadOnly = true;
            this.satsang_centre_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.satsang_centre_id.ToolTipLookupField = "information";
            this.satsang_centre_id.Visible = false;
            this.satsang_centre_id.Width = 234;
            // 
            // is_main_centre
            // 
            this.is_main_centre.BindingKey = "is_main_centre";
            this.is_main_centre.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle15.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.is_main_centre.DefaultCellStyle = dataGridViewCellStyle15;
            this.is_main_centre.HeaderText = "Is main centre";
            this.is_main_centre.Lookup = false;
            this.is_main_centre.LookupColumns = "";
            this.is_main_centre.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.is_main_centre.Mandatory = false;
            this.is_main_centre.MaxValue = ((long)(9223372036854775807));
            this.is_main_centre.MinValue = ((long)(-9223372036854775808));
            this.is_main_centre.Name = "is_main_centre";
            this.is_main_centre.PercentageWidth = 5F;
            this.is_main_centre.ReadOnly = true;
            this.is_main_centre.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.is_main_centre.ToolTipLookupField = "information";
            this.is_main_centre.Width = 5;
            // 
            // centre_nm
            // 
            this.centre_nm.BindingKey = "centre_nm";
            this.centre_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.centre_nm.HeaderText = "Satsang Centre Name";
            this.centre_nm.Lookup = false;
            this.centre_nm.LookupColumns = "";
            this.centre_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.centre_nm.Mandatory = false;
            this.centre_nm.MaxCharacterLength = 2147483647;
            this.centre_nm.Name = "centre_nm";
            this.centre_nm.PercentageWidth = 10F;
            this.centre_nm.ReadOnly = true;
            this.centre_nm.RegularExpressionValidator = "";
            this.centre_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.centre_nm.ToolTipLookupField = "information";
            this.centre_nm.Width = 7;
            // 
            // SpeakerType
            // 
            this.SpeakerType.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.SpeakerType.BindingKey = "speaker_type";
            this.SpeakerType.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.SpeakerType.HeaderText = "Speaker Type";
            this.SpeakerType.Lookup = false;
            this.SpeakerType.LookupColumns = "";
            this.SpeakerType.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.SpeakerType.Mandatory = false;
            this.SpeakerType.MaxCharacterLength = 2147483647;
            this.SpeakerType.Name = "SpeakerType";
            this.SpeakerType.PercentageWidth = 25F;
            this.SpeakerType.ReadOnly = true;
            this.SpeakerType.RegularExpressionValidator = "";
            this.SpeakerType.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.SpeakerType.ToolTipLookupField = "information";
            this.SpeakerType.Width = 108;
            // 
            // speaker_status
            // 
            this.speaker_status.BindingKey = "speaker_status";
            this.speaker_status.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.speaker_status.HeaderText = "Speaker Status";
            this.speaker_status.Lookup = false;
            this.speaker_status.LookupColumns = "";
            this.speaker_status.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.speaker_status.Mandatory = false;
            this.speaker_status.MaxCharacterLength = 2147483647;
            this.speaker_status.Name = "speaker_status";
            this.speaker_status.PercentageWidth = 10F;
            this.speaker_status.ReadOnly = true;
            this.speaker_status.RegularExpressionValidator = "";
            this.speaker_status.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.speaker_status.ToolTipLookupField = "information";
            this.speaker_status.Width = 7;
            // 
            // speaker_status_dtm
            // 
            this.speaker_status_dtm.BindingKey = "speaker_status_dtm";
            this.speaker_status_dtm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle16.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.speaker_status_dtm.DefaultCellStyle = dataGridViewCellStyle16;
            this.speaker_status_dtm.HeaderText = "Speaker Status Date";
            this.speaker_status_dtm.Lookup = false;
            this.speaker_status_dtm.LookupColumns = "";
            this.speaker_status_dtm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.speaker_status_dtm.Mandatory = false;
            this.speaker_status_dtm.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.speaker_status_dtm.MinValue = new System.DateTime(((long)(0)));
            this.speaker_status_dtm.Name = "speaker_status_dtm";
            this.speaker_status_dtm.PercentageWidth = 10F;
            this.speaker_status_dtm.ReadOnly = true;
            this.speaker_status_dtm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.speaker_status_dtm.ToolTipLookupField = "information";
            this.speaker_status_dtm.Width = 7;
            // 
            // txn_ts
            // 
            this.txn_ts.BindingKey = "txn_ts";
            this.txn_ts.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Object;
            this.txn_ts.HeaderText = "txn ts";
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
            this.txn_ts.Width = 20;
            // 
            // request_for_speaker_type
            // 
            this.request_for_speaker_type.BindingKey = "request_for_speaker_type";
            this.request_for_speaker_type.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Combobox;
            this.request_for_speaker_type.HeaderText = "Type";
            this.request_for_speaker_type.Lookup = false;
            this.request_for_speaker_type.LookupColumns = "";
            this.request_for_speaker_type.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.request_for_speaker_type.Mandatory = false;
            this.request_for_speaker_type.Name = "request_for_speaker_type";
            this.request_for_speaker_type.PercentageWidth = 10F;
            this.request_for_speaker_type.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.request_for_speaker_type.ToolTipLookupField = "information";
            this.request_for_speaker_type.Width = 93;
            // 
            // request_dt
            // 
            this.request_dt.BindingKey = null;
            this.request_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.request_dt.DefaultCellStyle = dataGridViewCellStyle1;
            this.request_dt.HeaderText = "Request Date";
            this.request_dt.Lookup = false;
            this.request_dt.LookupColumns = "";
            this.request_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.request_dt.Mandatory = false;
            this.request_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.request_dt.MinValue = new System.DateTime(((long)(0)));
            this.request_dt.Name = "request_dt";
            this.request_dt.PercentageWidth = 13F;
            this.request_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.request_dt.ToolTipLookupField = "information";
            this.request_dt.Width = 121;
            // 
            // approval_dt
            // 
            this.approval_dt.BindingKey = null;
            this.approval_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Date;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.approval_dt.DefaultCellStyle = dataGridViewCellStyle2;
            this.approval_dt.HeaderText = "Approval Date";
            this.approval_dt.Lookup = false;
            this.approval_dt.LookupColumns = "";
            this.approval_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.approval_dt.Mandatory = false;
            this.approval_dt.MaxValue = new System.DateTime(9999, 12, 31, 23, 59, 59, 999);
            this.approval_dt.MinValue = new System.DateTime(((long)(0)));
            this.approval_dt.Name = "approval_dt";
            this.approval_dt.PercentageWidth = 13F;
            this.approval_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.approval_dt.ToolTipLookupField = "information";
            this.approval_dt.Width = 121;
            // 
            // reference_no
            // 
            this.reference_no.BindingKey = null;
            this.reference_no.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.reference_no.HeaderText = "Ref.No.";
            this.reference_no.Lookup = false;
            this.reference_no.LookupColumns = "";
            this.reference_no.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.reference_no.Mandatory = false;
            this.reference_no.MaxCharacterLength = 2147483647;
            this.reference_no.Name = "reference_no";
            this.reference_no.PercentageWidth = 15F;
            this.reference_no.RegularExpressionValidator = "";
            this.reference_no.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.reference_no.ToolTipLookupField = "information";
            this.reference_no.Width = 140;
            // 
            // reference_dt
            // 
            this.reference_dt.BindingKey = null;
            this.reference_dt.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.reference_dt.HeaderText = "Reference Date";
            this.reference_dt.Lookup = false;
            this.reference_dt.LookupColumns = "";
            this.reference_dt.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.reference_dt.Mandatory = false;
            this.reference_dt.MaxCharacterLength = 2147483647;
            this.reference_dt.Name = "reference_dt";
            this.reference_dt.PercentageWidth = 13F;
            this.reference_dt.RegularExpressionValidator = "";
            this.reference_dt.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.reference_dt.ToolTipLookupField = "information";
            this.reference_dt.Width = 121;
            // 
            // audition_remarks
            // 
            this.audition_remarks.BindingKey = null;
            this.audition_remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.audition_remarks.HeaderText = "Audition Remarks";
            this.audition_remarks.Lookup = false;
            this.audition_remarks.LookupColumns = "";
            this.audition_remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.audition_remarks.Mandatory = false;
            this.audition_remarks.MaxCharacterLength = 2147483647;
            this.audition_remarks.Name = "audition_remarks";
            this.audition_remarks.PercentageWidth = 15F;
            this.audition_remarks.RegularExpressionValidator = "";
            this.audition_remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.audition_remarks.ToolTipLookupField = "information";
            this.audition_remarks.Width = 140;
            // 
            // review_remarks
            // 
            this.review_remarks.BindingKey = null;
            this.review_remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.review_remarks.HeaderText = "Review Remarks";
            this.review_remarks.Lookup = false;
            this.review_remarks.LookupColumns = "";
            this.review_remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.review_remarks.Mandatory = false;
            this.review_remarks.MaxCharacterLength = 2147483647;
            this.review_remarks.Name = "review_remarks";
            this.review_remarks.PercentageWidth = 15F;
            this.review_remarks.RegularExpressionValidator = "";
            this.review_remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.review_remarks.ToolTipLookupField = "information";
            this.review_remarks.Width = 140;
            // 
            // review_sewadar_id
            // 
            this.review_sewadar_id.BindingKey = null;
            this.review_sewadar_id.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.LongInteger;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            this.review_sewadar_id.DefaultCellStyle = dataGridViewCellStyle3;
            this.review_sewadar_id.HeaderText = "Review SewadarId";
            this.review_sewadar_id.Lookup = false;
            this.review_sewadar_id.LookupColumns = "";
            this.review_sewadar_id.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.review_sewadar_id.Mandatory = false;
            this.review_sewadar_id.MaxValue = ((long)(9223372036854775807));
            this.review_sewadar_id.MinValue = ((long)(-9223372036854775808));
            this.review_sewadar_id.Name = "review_sewadar_id";
            this.review_sewadar_id.PercentageWidth = 10F;
            this.review_sewadar_id.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.review_sewadar_id.ToolTipLookupField = "information";
            this.review_sewadar_id.Width = 93;
            // 
            // review_non_sewadar_nm
            // 
            this.review_non_sewadar_nm.BindingKey = null;
            this.review_non_sewadar_nm.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.review_non_sewadar_nm.HeaderText = "Review Non Sewadar Name";
            this.review_non_sewadar_nm.Lookup = false;
            this.review_non_sewadar_nm.LookupColumns = "";
            this.review_non_sewadar_nm.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.review_non_sewadar_nm.Mandatory = false;
            this.review_non_sewadar_nm.MaxCharacterLength = 2147483647;
            this.review_non_sewadar_nm.Name = "review_non_sewadar_nm";
            this.review_non_sewadar_nm.PercentageWidth = 15F;
            this.review_non_sewadar_nm.RegularExpressionValidator = "";
            this.review_non_sewadar_nm.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.review_non_sewadar_nm.ToolTipLookupField = "information";
            this.review_non_sewadar_nm.Width = 140;
            // 
            // remarks
            // 
            this.remarks.BindingKey = null;
            this.remarks.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.TextField;
            this.remarks.HeaderText = "Remarks";
            this.remarks.Lookup = false;
            this.remarks.LookupColumns = "";
            this.remarks.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.remarks.Mandatory = false;
            this.remarks.MaxCharacterLength = 2147483647;
            this.remarks.Name = "remarks";
            this.remarks.PercentageWidth = 20F;
            this.remarks.RegularExpressionValidator = "";
            this.remarks.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.remarks.ToolTipLookupField = "information";
            this.remarks.Width = 187;
            // 
            // txn_ts_aud
            // 
            this.txn_ts_aud.BindingKey = "txn_ts";
            this.txn_ts_aud.ColumnCellType = DCC.UMB.CDF.UIControls.DCCGridCellTypes.Object;
            this.txn_ts_aud.HeaderText = "Txn Ts";
            this.txn_ts_aud.Lookup = false;
            this.txn_ts_aud.LookupColumns = "";
            this.txn_ts_aud.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.txn_ts_aud.Mandatory = false;
            this.txn_ts_aud.Name = "txn_ts_aud";
            this.txn_ts_aud.PercentageWidth = 25F;
            this.txn_ts_aud.ReadOnly = true;
            this.txn_ts_aud.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            this.txn_ts_aud.ToolTipLookupField = "information";
            this.txn_ts_aud.Visible = false;
            // 
            // Speakers
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(958, 486);
            this.Controls.Add(this.scListOrBrowse);
            this.Name = "Speakers";
            this.Text = "SpeakerDetails";
            this.scListOrBrowse.Panel1.ResumeLayout(false);
            this.scListOrBrowse.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.scListOrBrowse)).EndInit();
            this.scListOrBrowse.ResumeLayout(false);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.dccTableLayoutPanel1.PerformLayout();
            this.tlpSewadarPhoto.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.ImgSewadarPhoto)).EndInit();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdApproval)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdTraining)).EndInit();
            this.tableLayoutPanel3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer scListOrBrowse;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private Controls.ZSMLookups.SewadarIDLookup intSewadarId;
        private Controls.DropDown.ZSMGenderCombo zsmGenderCombo1;
        private Controls.ZSMLookups.SewadarLookup txtName;
        private UMB.CDF.UIControls.TextControls.DCCLongIntegerField txtAge;
        private UMB.CDF.UIControls.TextControls.DCCTextField txtSewadarStatus;
        private UMB.CDF.UIControls.TextControls.DCCDateTimeField dtmSewadarStatus;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpSewadarPhoto;
        private System.Windows.Forms.PictureBox ImgSewadarPhoto;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private Controls.Combos.SpeakerStatusCombo speakerStatusCombo1;
        private Controls.Combos.SpeakerTypeCombo speakerTypeCombo1;
        private UMB.CDF.UIControls.TextControls.DCCDateTimeField dtmCurrentStatusDate;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private Controls.ZSMLookups.ZSMSatsangCentresLookup zsmSatsangCentresLookup1;
        private Controls.ZSMLookups.ZSMSatsangCentresLookup zsmSatsangCentresLookup2;
        private UMB.CDF.UIControls.DCCLabel dccLabel2;
        private UMB.CDF.UIControls.Grid.DCCGrid grdApproval;
        private UMB.CDF.UIControls.Grid.DCCGrid grdTraining;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel3;
        private UMB.CDF.UIControls.Grid.DCCGrid grdList;
        private UMB.CDF.UIControls.DCCLabel dccLabel1;
        private UMB.CDF.UIControls.TextControls.DCCComboBox cmbSatsangCentreType;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn training_request_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn training_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCCheckBoxGridColumn isAttended;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn training_reference_no;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn training_reference_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn training_remarks;
        private UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts_training;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn SpeakerId;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn FullName;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn gender;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn birth_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn age;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn global_sewadar_status_cd;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn global_sewadar_status_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn sewadar_status_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn sewadar_status_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn satsang_centre_id;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn is_main_centre;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn centre_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn SpeakerType;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn speaker_status;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn speaker_status_dtm;
        private UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts;
        private UMB.CDF.UIControls.Grid.Column.DCCComboboxGridColumn request_for_speaker_type;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn request_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCDateGridColumn approval_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn reference_no;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn reference_dt;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn audition_remarks;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn review_remarks;
        private UMB.CDF.UIControls.Grid.Column.DCCLongIntegerGridColumn review_sewadar_id;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn review_non_sewadar_nm;
        private UMB.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn remarks;
        private UMB.CDF.UIControls.Grid.Column.DCCObjectGridColumn txn_ts_aud;
    }
}