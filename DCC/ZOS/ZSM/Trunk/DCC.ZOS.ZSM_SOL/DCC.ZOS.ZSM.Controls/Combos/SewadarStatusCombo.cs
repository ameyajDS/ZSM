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
    public partial class SewadarStatusCombo : DCCComboBox
    {
        public bool isGlobal
        {
            get;
            set;
        }

        public SewadarStatusSysInfoCode StatusSystemInfoCode
        {
            get;
            set;
        }


        public SewadarStatusCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(SewadarStatusCombo_Load);
            StatusSystemInfoCode = SewadarStatusSysInfoCode.All; //SETTING DEFAULT STATUS
        }

        void SewadarStatusCombo_Load(object sender, EventArgs e)
        {
            try
            {
                IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                
                string strQuery = "SELECT sewadar_status_cd, sewadar_status_nm FROM sewadar_status WHERE (GETDATE() BETWEEN effective_from AND effective_till) AND is_global = "
                        + (isGlobal ? "'Yes'" : "'No'");
                switch (StatusSystemInfoCode)
                { 
                    case SewadarStatusSysInfoCode.RegularSewadar:
                        strQuery += " AND sewadar_status_cd IN (SELECT value_varchar FROM system_information_values WHERE system_info_cd = 'SttsRglSwd')";
                        break;
                }
                DataTable dt = objDbManager.ExecuteSQL(strQuery).Tables[0];
                    
                this.SetDataSource(dt, "sewadar_status_nm", "sewadar_status_cd");
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }

    }
}
