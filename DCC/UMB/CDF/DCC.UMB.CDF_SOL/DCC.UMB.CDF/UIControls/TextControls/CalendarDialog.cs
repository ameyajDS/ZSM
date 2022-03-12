using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    internal partial class CalendarDialog : Form
    {
        private DateTime? selectedDateTime = null;
        public CalendarDialog()
        {
            InitializeComponent();
        }
        public DateTime? ShowDialog(DateTime? initialValue, IWin32Window owner, DCCTextField owningField)
        {
            try
            {
                this.dtpSelectDateTime.Value = initialValue.HasValue ? initialValue.Value : DateTime.Now;
            }
            catch//in case of any error, set todays date.
            {
                this.dtpSelectDateTime.Value = DateTime.Now;
            }


            if (initialValue.HasValue)
            {
                this.selectedDateTime = initialValue.Value;
            }
            this.ShowDialog(owner);
            return this.selectedDateTime;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            this.selectedDateTime = this.dtpSelectDateTime.Value;
            this.Dispose();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

    }
}