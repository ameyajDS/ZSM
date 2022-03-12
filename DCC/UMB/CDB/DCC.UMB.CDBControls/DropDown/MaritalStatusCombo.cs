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

namespace DCC.UMB.CDBControls.DropDown
{
    public partial class MaritalStatusCombo : BaseCDBMasterCombo
    {
        private IDbManager objDbManager = null;
        DataTable dtMaritalStatus;
        public MaritalStatusCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(MaritalStatusCombo_Load);
        }

       
        void MaritalStatusCombo_Load(object sender, EventArgs e)
        {
            try
            {
                IDbManager objDbManager = UtilityManager.CreateDBManagerInstance("CDB_APP");
                DataTable dt = objDbManager.ExecuteSQL("select marital_status from marital_status where GETDATE() between effective_from and effective_till").Tables[0];
                this.SetDataSource(dt, "marital_status", "marital_status");
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }
       

        
    }
}
