namespace AES
{
    partial class DCC_Browsable_Screen1
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
            this.summaryDetailNavigator1 = new DCC.UMB.CDF.UIControls.SummaryDetailNavigator();
            this.SuspendLayout();
            // 
            // summaryDetailNavigator1
            // 
            this.summaryDetailNavigator1.EnableInsertAfter = true;
            this.summaryDetailNavigator1.EnableInsertBefore = true;
            this.summaryDetailNavigator1.EnableInsertLast = true;
            this.summaryDetailNavigator1.EnableMoveDown = false;
            this.summaryDetailNavigator1.EnableMoveUp = false;
            this.summaryDetailNavigator1.EnableNext = true;
            this.summaryDetailNavigator1.EnablePrevious = true;
            this.summaryDetailNavigator1.Location = new System.Drawing.Point(553, 22);
            this.summaryDetailNavigator1.Name = "summaryDetailNavigator1";
            this.summaryDetailNavigator1.PanelInsertVisible = true;
            this.summaryDetailNavigator1.PanelMoveVisible = true;
            this.summaryDetailNavigator1.PanelShowVisible = true;
            this.summaryDetailNavigator1.Size = new System.Drawing.Size(118, 466);
            this.summaryDetailNavigator1.SummaryDetailEditor = null;
            this.summaryDetailNavigator1.TabIndex = 0;
            // 
            // DCC_Browsable_Screen1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(683, 526);
            this.Controls.Add(this.summaryDetailNavigator1);
            this.Name = "DCC_Browsable_Screen1";
            this.Text = "DCC_Browsable_Screen1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private DCC.UMB.CDF.UIControls.SummaryDetailNavigator summaryDetailNavigator1;




    }
}

