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
    public partial class SewadarTypesCombo : BaseCDBMasterCombo
    {
        public SewadarTypesCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(SewadarTypesCombo_Load);
        }

        void SewadarTypesCombo_Load(object sender, EventArgs e)
        {
            try
            {
                IDbManager objDbManager = UtilityManager.CreateDBManagerInstance("CDB_APP");
                DataTable dt = objDbManager.ExecuteSQL("select sewadartype_id, sewadartype_nm from sewadar_types where GETDATE() between effective_from and effective_till and is_used_in_RMS = 'Yes'").Tables[0];
                this.SetDataSource(dt, "sewadartype_nm", "sewadartype_id");
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }

        //public byte? SelectedValueAsByte()
        //{            
        //   return (byte?)this.SelectedValueAsShort();            
        //}
    }
}
