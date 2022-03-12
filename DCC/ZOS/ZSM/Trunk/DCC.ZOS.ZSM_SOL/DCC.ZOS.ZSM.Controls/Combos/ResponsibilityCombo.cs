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
    public partial class ResponsibilityCombo : DCCComboBox
    {
        public bool isGlobal
        {
            get;
            set;
        }

        public ResponsibilityCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(ResponsibilityCombo_Load);
        }

        void ResponsibilityCombo_Load(object sender, EventArgs e)
        {
            if (this.TryLoadingFromCache()) return;
            try
            {
                IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                DataTable dt = objDbManager.ExecuteSQL("select responsibility from responsibilities WHERE (GETDATE() BETWEEN effective_from AND effective_till) ORDER BY responsibility_sq").Tables[0];
                this.SetDataSource(dt, "responsibility", "responsibility");
                
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }

    }
}
