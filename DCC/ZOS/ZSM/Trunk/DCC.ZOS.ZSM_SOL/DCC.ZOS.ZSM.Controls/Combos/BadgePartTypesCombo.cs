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
    public partial class BadgePartTypesCombo : DCCComboBox
    {
        public bool isGlobal
        {
            get;
            set;
        }

        public BadgePartTypesCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(BadgeTemplateCombo_Load);
        }

        void BadgeTemplateCombo_Load(object sender, EventArgs e)
        {            
            try
            {
                IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                DataTable dt = objDbManager.ExecuteSQL("select badge_part_type from badge_part_types").Tables[0];
                this.SetDataSource(dt, "badge_part_type", "badge_part_type");
                
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }

    }
}
