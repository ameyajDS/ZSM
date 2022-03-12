namespace DCC.ZOS.ZSM.PHT
{
    partial class PhotoClicking
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
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.tlpBase = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.sewadarHeader1 = new DCC.ZOS.ZSM.Controls.Misc.SewadarHeader();
            this.tlpBottom = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.picPhotoCaptureBox = new System.Windows.Forms.PictureBox();
            this.dccTableLayoutPanel2 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccLabel3 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.dccTableLayoutPanel5 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.btnClick = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.dccTableLayoutPanel4 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccLabel1 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.picExisting = new System.Windows.Forms.PictureBox();
            this.tlpClicked = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccLabel2 = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.picOld = new System.Windows.Forms.PictureBox();
            this.tlpTop = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.tlpPhoto = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccTableLayoutPanel1 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.lblDepandentsInformation = new DCC.UMB.CDF.UIControls.DCCLabel();
            this.dccTableLayoutPanel3 = new DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel(this.components);
            this.dccLongIntegerField1 = new DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField();
            this.dccComboBox1 = new DCC.UMB.CDF.UIControls.TextControls.DCCComboBox();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.tlpBase.SuspendLayout();
            this.tlpBottom.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picPhotoCaptureBox)).BeginInit();
            this.dccTableLayoutPanel5.SuspendLayout();
            this.dccTableLayoutPanel4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picExisting)).BeginInit();
            this.tlpClicked.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picOld)).BeginInit();
            this.tlpTop.SuspendLayout();
            this.dccTableLayoutPanel1.SuspendLayout();
            this.dccTableLayoutPanel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Margin = new System.Windows.Forms.Padding(4);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.tlpBase);
            this.splitContainer1.Panel2Collapsed = true;
            this.splitContainer1.Panel2MinSize = 1;
            this.splitContainer1.Size = new System.Drawing.Size(1117, 498);
            this.splitContainer1.SplitterDistance = 837;
            this.splitContainer1.SplitterWidth = 5;
            this.splitContainer1.TabIndex = 0;
            // 
            // tlpBase
            // 
            this.tlpBase.ColumnCount = 3;
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 40F));
            this.tlpBase.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 30F));
            this.tlpBase.Controls.Add(this.sewadarHeader1, 0, 0);
            this.tlpBase.Controls.Add(this.tlpBottom, 1, 1);
            this.tlpBase.Controls.Add(this.dccTableLayoutPanel4, 0, 1);
            this.tlpBase.Controls.Add(this.tlpClicked, 2, 1);
            this.tlpBase.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBase.Location = new System.Drawing.Point(0, 0);
            this.tlpBase.Margin = new System.Windows.Forms.Padding(4);
            this.tlpBase.Name = "tlpBase";
            this.tlpBase.RowCount = 2;
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.65038F));
            this.tlpBase.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 66.34962F));
            this.tlpBase.Size = new System.Drawing.Size(1117, 498);
            this.tlpBase.TabIndex = 0;
            // 
            // sewadarHeader1
            // 
            this.tlpBase.SetColumnSpan(this.sewadarHeader1, 3);
            this.sewadarHeader1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.sewadarHeader1.Location = new System.Drawing.Point(3, 3);
            this.sewadarHeader1.Name = "sewadarHeader1";
            this.sewadarHeader1.SatsangCentreId = null;
            this.sewadarHeader1.Size = new System.Drawing.Size(1111, 161);
            this.sewadarHeader1.SttsCode = null;
            this.sewadarHeader1.TabIndex = 4;
            this.sewadarHeader1.UseFocusLostEvent = false;
            this.sewadarHeader1.SewadarSelectionChanged += new System.EventHandler<DCC.ZOS.ZSM.Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs>(this.sewadarHeader1_SewadarSelectionChanged);
            // 
            // tlpBottom
            // 
            this.tlpBottom.ColumnCount = 2;
            this.tlpBottom.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 86.30137F));
            this.tlpBottom.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 13.69863F));
            this.tlpBottom.Controls.Add(this.picPhotoCaptureBox, 0, 1);
            this.tlpBottom.Controls.Add(this.dccTableLayoutPanel2, 1, 1);
            this.tlpBottom.Controls.Add(this.dccLabel3, 0, 0);
            this.tlpBottom.Controls.Add(this.dccTableLayoutPanel5, 0, 2);
            this.tlpBottom.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpBottom.Location = new System.Drawing.Point(339, 171);
            this.tlpBottom.Margin = new System.Windows.Forms.Padding(4);
            this.tlpBottom.Name = "tlpBottom";
            this.tlpBottom.RowCount = 3;
            this.tlpBottom.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpBottom.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 240F));
            this.tlpBottom.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpBottom.Size = new System.Drawing.Size(438, 323);
            this.tlpBottom.TabIndex = 2;
            // 
            // picPhotoCaptureBox
            // 
            this.picPhotoCaptureBox.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.picPhotoCaptureBox.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picPhotoCaptureBox.Location = new System.Drawing.Point(120, 20);
            this.picPhotoCaptureBox.Margin = new System.Windows.Forms.Padding(120, 0, 0, 0);
            this.picPhotoCaptureBox.Name = "picPhotoCaptureBox";
            this.picPhotoCaptureBox.Size = new System.Drawing.Size(182, 240);
            this.picPhotoCaptureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.picPhotoCaptureBox.TabIndex = 1;
            this.picPhotoCaptureBox.TabStop = false;
            // 
            // dccTableLayoutPanel2
            // 
            this.dccTableLayoutPanel2.ColumnCount = 1;
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel2.Location = new System.Drawing.Point(380, 22);
            this.dccTableLayoutPanel2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dccTableLayoutPanel2.Name = "dccTableLayoutPanel2";
            this.dccTableLayoutPanel2.RowCount = 5;
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 33.16404F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 31.02443F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 35.81154F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 65F));
            this.dccTableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 49F));
            this.dccTableLayoutPanel2.Size = new System.Drawing.Size(55, 236);
            this.dccTableLayoutPanel2.TabIndex = 3;
            // 
            // dccLabel3
            // 
            this.dccLabel3.AutoSize = true;
            this.dccLabel3.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel3.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel3.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel3.Location = new System.Drawing.Point(3, 0);
            this.dccLabel3.Name = "dccLabel3";
            this.dccLabel3.Size = new System.Drawing.Size(371, 20);
            this.dccLabel3.TabIndex = 4;
            this.dccLabel3.Text = "Webcam Feed";
            this.dccLabel3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // dccTableLayoutPanel5
            // 
            this.dccTableLayoutPanel5.ColumnCount = 2;
            this.dccTableLayoutPanel5.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 56.87331F));
            this.dccTableLayoutPanel5.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 43.12669F));
            this.dccTableLayoutPanel5.Controls.Add(this.btnClick, 1, 0);
            this.dccTableLayoutPanel5.Controls.Add(this.btnSave, 0, 0);
            this.dccTableLayoutPanel5.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel5.Location = new System.Drawing.Point(3, 263);
            this.dccTableLayoutPanel5.Name = "dccTableLayoutPanel5";
            this.dccTableLayoutPanel5.RowCount = 1;
            this.dccTableLayoutPanel5.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel5.Size = new System.Drawing.Size(371, 57);
            this.dccTableLayoutPanel5.TabIndex = 5;
            // 
            // btnClick
            // 
            this.btnClick.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnClick.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClick.Location = new System.Drawing.Point(210, 13);
            this.btnClick.Margin = new System.Windows.Forms.Padding(0);
            this.btnClick.Name = "btnClick";
            this.btnClick.Size = new System.Drawing.Size(100, 30);
            this.btnClick.TabIndex = 3;
            this.btnClick.Text = "Click";
            this.btnClick.UseVisualStyleBackColor = true;
            this.btnClick.Click += new System.EventHandler(this.btnClick_Click);
            // 
            // btnSave
            // 
            this.btnSave.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.btnSave.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSave.Location = new System.Drawing.Point(107, 13);
            this.btnSave.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(100, 30);
            this.btnSave.TabIndex = 2;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // dccTableLayoutPanel4
            // 
            this.dccTableLayoutPanel4.ColumnCount = 1;
            this.dccTableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.dccTableLayoutPanel4.Controls.Add(this.dccLabel1, 0, 0);
            this.dccTableLayoutPanel4.Controls.Add(this.picExisting, 0, 1);
            this.dccTableLayoutPanel4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccTableLayoutPanel4.Location = new System.Drawing.Point(3, 170);
            this.dccTableLayoutPanel4.Name = "dccTableLayoutPanel4";
            this.dccTableLayoutPanel4.RowCount = 2;
            this.dccTableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.dccTableLayoutPanel4.Size = new System.Drawing.Size(329, 325);
            this.dccTableLayoutPanel4.TabIndex = 5;
            // 
            // dccLabel1
            // 
            this.dccLabel1.AutoSize = true;
            this.dccLabel1.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel1.Location = new System.Drawing.Point(3, 0);
            this.dccLabel1.Name = "dccLabel1";
            this.dccLabel1.Size = new System.Drawing.Size(323, 20);
            this.dccLabel1.TabIndex = 4;
            this.dccLabel1.Text = "Old Photo";
            this.dccLabel1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // picExisting
            // 
            this.picExisting.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.picExisting.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picExisting.Location = new System.Drawing.Point(80, 20);
            this.picExisting.Margin = new System.Windows.Forms.Padding(80, 0, 0, 0);
            this.picExisting.Name = "picExisting";
            this.picExisting.Size = new System.Drawing.Size(180, 240);
            this.picExisting.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picExisting.TabIndex = 2;
            this.picExisting.TabStop = false;
            // 
            // tlpClicked
            // 
            this.tlpClicked.ColumnCount = 1;
            this.tlpClicked.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpClicked.Controls.Add(this.dccLabel2, 0, 0);
            this.tlpClicked.Controls.Add(this.picOld, 0, 1);
            this.tlpClicked.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpClicked.Location = new System.Drawing.Point(784, 170);
            this.tlpClicked.Name = "tlpClicked";
            this.tlpClicked.RowCount = 2;
            this.tlpClicked.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpClicked.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpClicked.Size = new System.Drawing.Size(330, 325);
            this.tlpClicked.TabIndex = 6;
            // 
            // dccLabel2
            // 
            this.dccLabel2.AutoSize = true;
            this.dccLabel2.BackColor = System.Drawing.Color.Transparent;
            this.dccLabel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLabel2.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLabel2.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.dccLabel2.Location = new System.Drawing.Point(3, 0);
            this.dccLabel2.Name = "dccLabel2";
            this.dccLabel2.Size = new System.Drawing.Size(324, 20);
            this.dccLabel2.TabIndex = 5;
            this.dccLabel2.Text = "Already Clicked Photo";
            this.dccLabel2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // picOld
            // 
            this.picOld.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.picOld.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picOld.Location = new System.Drawing.Point(40, 20);
            this.picOld.Margin = new System.Windows.Forms.Padding(40, 0, 0, 0);
            this.picOld.Name = "picOld";
            this.picOld.Size = new System.Drawing.Size(180, 240);
            this.picOld.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picOld.TabIndex = 3;
            this.picOld.TabStop = false;
            // 
            // tlpTop
            // 
            this.tlpTop.ColumnCount = 16;
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.548038F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.548038F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 7.307172F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.788904F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 5.583756F));
            this.tlpTop.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 16.24365F));
            this.tlpTop.Controls.Add(this.tlpPhoto, 15, 0);
            this.tlpTop.Location = new System.Drawing.Point(0, 0);
            this.tlpTop.Name = "tlpTop";
            this.tlpTop.RowCount = 3;
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tlpTop.Size = new System.Drawing.Size(200, 100);
            this.tlpTop.TabIndex = 0;
            // 
            // tlpPhoto
            // 
            this.tlpPhoto.ColumnCount = 1;
            this.tlpPhoto.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tlpPhoto.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tlpPhoto.Location = new System.Drawing.Point(167, 3);
            this.tlpPhoto.Name = "tlpPhoto";
            this.tlpPhoto.RowCount = 3;
            this.tlpTop.SetRowSpan(this.tlpPhoto, 4);
            this.tlpPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 17.52988F));
            this.tlpPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 72.11156F));
            this.tlpPhoto.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10F));
            this.tlpPhoto.Size = new System.Drawing.Size(30, 94);
            this.tlpPhoto.TabIndex = 6;
            // 
            // dccTableLayoutPanel1
            // 
            this.dccTableLayoutPanel1.ColumnCount = 15;
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 1.642036F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 11.49425F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 9.359606F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 3.776683F));
            this.dccTableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666667F));
            this.dccTableLayoutPanel1.Controls.Add(this.lblDepandentsInformation, 0, 0);
            this.dccTableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel1.Name = "dccTableLayoutPanel1";
            this.dccTableLayoutPanel1.RowCount = 1;
            this.dccTableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel1.Size = new System.Drawing.Size(200, 100);
            this.dccTableLayoutPanel1.TabIndex = 0;
            // 
            // lblDepandentsInformation
            // 
            this.lblDepandentsInformation.AutoSize = true;
            this.lblDepandentsInformation.BackColor = System.Drawing.Color.Transparent;
            this.dccTableLayoutPanel1.SetColumnSpan(this.lblDepandentsInformation, 3);
            this.lblDepandentsInformation.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDepandentsInformation.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepandentsInformation.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblDepandentsInformation.Location = new System.Drawing.Point(3, 0);
            this.lblDepandentsInformation.Name = "lblDepandentsInformation";
            this.lblDepandentsInformation.Size = new System.Drawing.Size(23, 100);
            this.lblDepandentsInformation.TabIndex = 0;
            this.lblDepandentsInformation.Text = "Depandents Information";
            // 
            // dccTableLayoutPanel3
            // 
            this.dccTableLayoutPanel3.ColumnCount = 15;
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666665F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 6.666666F));
            this.dccTableLayoutPanel3.Controls.Add(this.dccLongIntegerField1, 8, 0);
            this.dccTableLayoutPanel3.Location = new System.Drawing.Point(0, 0);
            this.dccTableLayoutPanel3.Name = "dccTableLayoutPanel3";
            this.dccTableLayoutPanel3.RowCount = 1;
            this.dccTableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.dccTableLayoutPanel3.Size = new System.Drawing.Size(200, 100);
            this.dccTableLayoutPanel3.TabIndex = 0;
            // 
            // dccLongIntegerField1
            // 
            this.dccLongIntegerField1.AllowsNew = false;
            this.dccLongIntegerField1.AllowsReference = false;
            this.dccLongIntegerField1.AllowsUpdate = false;
            this.dccLongIntegerField1.ApplicationIdForDbConnection = null;
            this.dccLongIntegerField1.BackColor = System.Drawing.Color.Transparent;
            this.dccLongIntegerField1.CalledScreenApplicationId = null;
            this.dccLongIntegerField1.CalledScreenTypeName = null;
            this.dccLongIntegerField1.CallingScreenType = null;
            this.dccLongIntegerField1.DisplayText = "";
            this.dccLongIntegerField1.DisplayTextBindingKey = null;
            this.dccLongIntegerField1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccLongIntegerField1.EditingControlDataGridView = null;
            this.dccLongIntegerField1.EditingControlFormattedValue = "";
            this.dccLongIntegerField1.EditingControlRowIndex = 0;
            this.dccLongIntegerField1.EditingControlValueChanged = false;
            this.dccLongIntegerField1.EnableToolTip = false;
            this.dccLongIntegerField1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccLongIntegerField1.IdText = null;
            this.dccLongIntegerField1.IdTextBindingKey = null;
            this.dccLongIntegerField1.Location = new System.Drawing.Point(108, 3);
            this.dccLongIntegerField1.Lookup = false;
            this.dccLongIntegerField1.LookupColumns = null;
            this.dccLongIntegerField1.LookupDialogSize = DCC.UMB.CDF.Lookup.LookupDialogSizes.Normal;
            this.dccLongIntegerField1.LookupResult = null;
            this.dccLongIntegerField1.Mandatory = false;
            this.dccLongIntegerField1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dccLongIntegerField1.MaxCharacterLength = 32767;
            this.dccLongIntegerField1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.dccLongIntegerField1.MaxValue = ((long)(9223372036854775807));
            this.dccLongIntegerField1.MinCharactersForQuery = 0;
            this.dccLongIntegerField1.MinimumSize = new System.Drawing.Size(0, 28);
            this.dccLongIntegerField1.MinValue = ((long)(-9223372036854775808));
            this.dccLongIntegerField1.Name = "dccLongIntegerField1";
            this.dccLongIntegerField1.Padding = new System.Windows.Forms.Padding(0, 17, 0, 0);
            this.dccLongIntegerField1.PascalCase = false;
            this.dccLongIntegerField1.RangeInQueryMode = false;
            this.dccLongIntegerField1.ReadOnly = false;
            this.dccLongIntegerField1.RegularExpressionValidator = "";
            this.dccLongIntegerField1.Size = new System.Drawing.Size(5, 44);
            this.dccLongIntegerField1.TabIndex = 31;
            this.dccLongIntegerField1.Title = "Age(Yrs.)";
            this.dccLongIntegerField1.ToolTipLookupField = "information";
            this.dccLongIntegerField1.ValueText = null;
            // 
            // dccComboBox1
            // 
            this.dccComboBox1.ApplicationIdForDbConnection = null;
            this.dccComboBox1.BackColor = System.Drawing.Color.Transparent;
            this.dccComboBox1.DisplayText = "";
            this.dccComboBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dccComboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.dccComboBox1.Font = new System.Drawing.Font("Verdana", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dccComboBox1.Location = new System.Drawing.Point(121, 3);
            this.dccComboBox1.Mandatory = false;
            this.dccComboBox1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.dccComboBox1.MaximumSize = new System.Drawing.Size(1300, 44);
            this.dccComboBox1.MinimumSize = new System.Drawing.Size(10, 22);
            this.dccComboBox1.Name = "dccComboBox1";
            this.dccComboBox1.Padding = new System.Windows.Forms.Padding(0, 16, 0, 0);
            this.dccComboBox1.ReadOnly = false;
            this.dccComboBox1.SelectedIndex = -1;
            this.dccComboBox1.SelectedItem = null;
            this.dccComboBox1.SelectedText = "";
            this.dccComboBox1.SelectedValue = null;
            this.dccComboBox1.SelectedValueBindingKey = null;
            this.dccComboBox1.Size = new System.Drawing.Size(18, 42);
            this.dccComboBox1.TabIndex = 30;
            this.dccComboBox1.Title = "Marital Status";
            this.dccComboBox1.ValueText = null;
            // 
            // PhotoClicking
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1117, 498);
            this.Controls.Add(this.splitContainer1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "PhotoClicking";
            this.Text = "Photo Clicking System";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.IdCardPhotos_FormClosing);
            this.Load += new System.EventHandler(this.IdCardPhotos_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.tlpBase.ResumeLayout(false);
            this.tlpBottom.ResumeLayout(false);
            this.tlpBottom.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picPhotoCaptureBox)).EndInit();
            this.dccTableLayoutPanel5.ResumeLayout(false);
            this.dccTableLayoutPanel4.ResumeLayout(false);
            this.dccTableLayoutPanel4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picExisting)).EndInit();
            this.tlpClicked.ResumeLayout(false);
            this.tlpClicked.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picOld)).EndInit();
            this.tlpTop.ResumeLayout(false);
            this.dccTableLayoutPanel1.ResumeLayout(false);
            this.dccTableLayoutPanel1.PerformLayout();
            this.dccTableLayoutPanel3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpTop;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpPhoto;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel1;
        private DCC.UMB.CDF.UIControls.DCCLabel lblDepandentsInformation;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBase;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpBottom;
        private System.Windows.Forms.PictureBox picPhotoCaptureBox;
        private System.Windows.Forms.Button btnClick;
        private DCC.UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel3;
        private DCC.UMB.CDF.UIControls.TextControls.DCCLongIntegerField dccLongIntegerField1;
        private DCC.UMB.CDF.UIControls.TextControls.DCCComboBox dccComboBox1;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel2;
        private System.Windows.Forms.Button btnSave;
        private Controls.Misc.SewadarHeader sewadarHeader1;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel4;
        private UMB.CDF.UIControls.DCCLabel dccLabel3;
        private UMB.CDF.UIControls.DCCLabel dccLabel1;
        private UMB.CDF.UIControls.DCCLabel dccLabel2;
        private System.Windows.Forms.PictureBox picExisting;
        private System.Windows.Forms.PictureBox picOld;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel tlpClicked;
        private UMB.CDF.UIControls.Containers.DCCTableLayoutPanel dccTableLayoutPanel5;

    }
}
