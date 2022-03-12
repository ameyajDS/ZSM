using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.MGMT.View
{
    public partial class MessageDetailViewer : Form
    {
        public MessageDetailViewer()
        {
            InitializeComponent();
        }
        public void SetMessageDetails(string messageDetails)
        {
            this.txtMessageDetails.Text = messageDetails;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void MessageDetailViewer_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
            {
                this.Dispose();
                e.SuppressKeyPress = true;
            }
        }
    }
}