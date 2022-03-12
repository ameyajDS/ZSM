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
 
        public partial class ColourCombo : DCCComboBox
        {
            public bool isGlobal
            {
                get;
                set;
            }

            public ColourCombo()
            {
                InitializeComponent();
                this.Load += new EventHandler(ColourCombo_Load);
            }

            void ColourCombo_Load(object sender, EventArgs e)
            {
                try
                {
                    IDbManager objDbManager = UtilityManager.CreateDBManagerInstanceForCurrentApp();
                    DataTable dt = objDbManager.ExecuteSQL("select colour_id,colour_nm from colours WHERE GETDATE() BETWEEN effective_from AND effective_till").Tables[0];
                    this.SetDataSource(dt, "colour_nm", "colour_id");

                }
                catch (Exception ex)
                {
                    //do nothing, as this could happend when the control is in design mode and appcontext is null.
                }
            }

        }




}
