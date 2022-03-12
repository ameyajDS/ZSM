using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class ShowLogs : Form
    {
        public ShowLogs()
        {
            InitializeComponent();
        }

        public void SetDataSource(DataTable table)
        {
            if (table.Rows.Count > 0)
            {
                foreach (DataColumn col in table.Columns)
                {
                    switch (col.ColumnName)
                    {
                        case "controlling_dt":
                            col.ColumnName = "Controlling Date";
                            break;
                        case "import_username":
                            col.ColumnName = "Imported By";
                            break;

                        case "process_dt":
                            col.ColumnName = "Processing DateTime";
                            break;

                        case "process_username":
                            col.ColumnName = "Processed By";
                            break;
                    }
                }
            }
            grdLog.DataSource = table;
            
            grdLog.EditMode = DataGridViewEditMode.EditProgrammatically;
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
