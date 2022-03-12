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
    public partial class BadgeTemplateCombo : DCCComboBox
    {
        public bool isGlobal
        {
            get;
            set;
        }

        public BadgeTemplateCombo()
        {
            InitializeComponent();
            this.Load += new EventHandler(BadgeTemplateCombo_Load);
        }

        void BadgeTemplateCombo_Load(object sender, EventArgs e)
        {
            if (this.TryLoadingFromCache()) return;
            try
            {
                IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                DataTable dt = objDbManager.ExecuteSQL("select badge_template_id, badge_template_nm from badge_templates").Tables[0];
                this.SetDataSource(dt, "badge_template_nm", "badge_template_id");
                
            }
            catch (Exception ex)
            {
                //do nothing, as this could happend when the control is in design mode and appcontext is null.
            }
        }

    }
}
