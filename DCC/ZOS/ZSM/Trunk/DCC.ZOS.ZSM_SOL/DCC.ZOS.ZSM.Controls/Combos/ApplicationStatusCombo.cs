using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Utils;
using DCC.ZOS.ZSM.Controls.Configuration;

namespace DCC.ZOS.ZSM.Controls.Combos
{
    public partial class ApplicationStatusCombo : DCCComboBox
    {

        public ApplicationStatusCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(SewadarStatusCombo_Load);

        }

        void SewadarStatusCombo_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add(new DataColumn("sewadar_status_nm"));
                dt.Columns.Add(new DataColumn("sewadar_status_cd"));
                List<String> applicationStatuses = new List<String> { "Entered", "Pending", "Processed", "Verified", "Rejected", "Error" };
                foreach (string appStatus in applicationStatuses)
                {
                    DataRow dr = dt.NewRow();
                    dr[0] = appStatus;
                    dr[1] = appStatus;
                    dt.Rows.Add(dr);
                }
                this.SetDataSource(dt, "sewadar_status_nm", "sewadar_status_cd");
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }

    }
}
