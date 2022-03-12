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
    public partial class PatronCombo : BaseCDBMasterCombo
    {
        public PatronCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(PatronCombo_Load);
        }


        void PatronCombo_Load(object sender, EventArgs e)
        {
            try
            {
                IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                DataTable dt = objDbManager.ExecuteSQL("select patron_id, patron_nm from CDB..patrons").Tables[0];
                this.SetDataSource(dt, "patron_nm", "patron_id");
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }
       

        
    }
}
