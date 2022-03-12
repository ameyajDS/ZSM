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
using DCC.UMB.CDF.Configuration;
namespace DCC.UMB.CDBControls.DropDown
{
    public partial class SocietiesCombo : BaseCDBMasterCombo
    {
        public SocietiesCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(SocietiesCombo_Load);
        }

        void SocietiesCombo_Load(object sender, EventArgs e)
        {
            try
            {
                IDbManager objDbManager = UtilityManager.CreateDBManagerInstance("CDB_APP");
                DataTable dt = objDbManager.ExecuteSQL("SELECT society_id, society_cd, society_nm FROM cdb..societies WHERE GETDATE() BETWEEN effective_from AND effective_till").Tables[0];
                string displayTextPropertyName = "society_nm";
                switch (this.DisplayTextAs)
                {
                    case DisplayTextStyles.Id:
                        displayTextPropertyName = "society_id";
                        break;
                    case DisplayTextStyles.Name:
                        displayTextPropertyName = "society_nm";
                        break;
                    case DisplayTextStyles.Code:
                        displayTextPropertyName = "society_cd";
                        break;
                    default:
                        break;
                }
                this.SetDataSource(dt, displayTextPropertyName, "society_id");
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }

        private DisplayTextStyles displayTextAs = DisplayTextStyles.Name;
        [Category("DCC.UMB.CDF.UIControls")]
        public DisplayTextStyles DisplayTextAs
        {
            get
            {
                return this.displayTextAs;
            }
            set
            {
                this.displayTextAs = value;
            }
        }
        
    }
}
