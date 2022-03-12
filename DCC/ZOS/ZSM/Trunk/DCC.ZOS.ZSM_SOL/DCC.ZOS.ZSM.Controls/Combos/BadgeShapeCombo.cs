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
    public partial class BadgeShapeCombo : DCCComboBox
    {
        public static List<KeyValuePair<string, string>> GetBadgeShapeList()
        {
            List<KeyValuePair<string, string>> badgeShape = new List<KeyValuePair<string, string>>();
            badgeShape.Add(new KeyValuePair<string, string>("Vertical", "Vertical"));
            badgeShape.Add(new KeyValuePair<string, string>("Horizontal", "Horizontal"));
            badgeShape.Add(new KeyValuePair<string, string>("Triangular", "Triangular"));
            return badgeShape;
        }
    
        public BadgeShapeCombo()
        {            
            InitializeComponent();
            this.ClearControlValues();
            this.SetDataSource(BadgeShapeCombo.GetBadgeShapeList(), "Key", "Value");
        }

    }
}
