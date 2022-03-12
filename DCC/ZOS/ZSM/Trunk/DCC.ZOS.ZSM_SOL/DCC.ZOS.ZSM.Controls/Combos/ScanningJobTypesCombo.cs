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

namespace DCC.ZOS.ZSM.Controls.Combos
{
 
        public partial class ScanningJobTypesCombo : DCCComboBox
        {
            public ScanningJobTypesCombo()
            {
                InitializeComponent();
                this.Load += new EventHandler(ScanningJobTypesCombo_Load);
            }

            void ScanningJobTypesCombo_Load(object sender, EventArgs e)
            {
                try
                {
                    IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                    DataTable dt = objDbManager.ExecuteSQL("select scanning_job_type_cd as valueText,scanning_job_type_cd as displayText from scanning_job_types WHERE GETDATE() BETWEEN effective_from AND effective_till").Tables[0];
                    this.SetDataSource(dt, "displayText", "valueText");

                }
                catch (Exception ex)
                {
                    //do nothing, as this could happend when the control is in design mode and appcontext is null.
                }
            }

        }




}
