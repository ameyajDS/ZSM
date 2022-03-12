using System;
using System.Windows.Forms;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    public partial class DCCTextEditor : Form
    {
        private DCCTextField parent;
        public DCCTextEditor()
        {
            InitializeComponent();
        }
        public DCCTextEditor(DCCTextField parent, string content, bool readOnly)
            : this()
        {
            this.parent = parent;
            this.txtEditor.Text = content;
            this.txtEditor.ReadOnly = readOnly;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            this.parent.txtField.Text = this.txtEditor.Text;
            this.btnCancel_Click(sender, e);
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}