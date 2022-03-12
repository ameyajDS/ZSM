namespace DCC.CMN.CDF
{
    partial class TestFormBharat
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dccGrid1 = new DCC.CMN.CDF.UIControls.Grid.DCCGrid();
            this.colTextBoxColumn = new DCC.CMN.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).BeginInit();
            this.SuspendLayout();
            // 
            // dccGrid1
            // 
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
            this.colTextBoxColumn});
            this.dccGrid1.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter;
            this.dccGrid1.Location = new System.Drawing.Point(29, 86);
            this.dccGrid1.Name = "dccGrid1";
            this.dccGrid1.Size = new System.Drawing.Size(240, 150);
            this.dccGrid1.TabIndex = 0;
            this.dccGrid1.VirtualMode = true;
            // 
            // colTextBoxColumn
            // 
            this.colTextBoxColumn.ColumnCellType = DCC.CMN.CDF.UIControls.DCCGridCellTypes.TextField;
            this.colTextBoxColumn.HeaderText = "Text Box Column";
            this.colTextBoxColumn.Lookup = false;
            this.colTextBoxColumn.LookupColumns = "";
            this.colTextBoxColumn.Mandatory = false;
            this.colTextBoxColumn.Name = "colTextBoxColumn";
            this.colTextBoxColumn.PercentageWidth = 0;
            // 
            // TestFormBharat
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.dccGrid1);
            this.Name = "TestFormBharat";
            this.Text = "TestFormBharat";
            ((System.ComponentModel.ISupportInitialize)(this.dccGrid1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.CMN.CDF.UIControls.Grid.DCCGrid dccGrid1;
        private DCC.CMN.CDF.UIControls.Grid.Column.DCCTextFieldGridColumn colTextBoxColumn;
    }
}