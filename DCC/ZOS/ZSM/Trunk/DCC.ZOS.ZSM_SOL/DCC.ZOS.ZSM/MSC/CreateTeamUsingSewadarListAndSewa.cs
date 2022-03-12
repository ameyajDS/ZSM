using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.MSC
{
    public partial class CreateTeamUsingSewadarListAndSewa : ZSMAbstractScreen
    {
        int sewaId;
        int satsangCentreId;

        public CreateTeamUsingSewadarListAndSewa()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                return Screens.MSC_CREATE_TEAMS_USING_LIST_SEWA;
            }
        }

        public override void ShowScreen(UMB.CDF.Configuration.UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            string[] args = screenParameters.Split('|');
            satsangCentreId = int.Parse(args[0]);
            sewaId = int.Parse(args[1]);
        }

        public override void CreateData()
        {
            if (!String.IsNullOrEmpty(sewadarListLookup1.IdText))
            {
                this.dbFacade.MakeCombinedSewaTeams(satsangCentreId, sewaId, int.Parse(sewadarListLookup1.IdText), lstDepartment.GetItemsAsXML(true));
                this.ObjectIdForLogOperation = this.sewadarListLookup1.IdText;
            }
        }

        private void lstDepartment_LookupDialogShowing(object sender, UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(1=1)", "dsc.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }
    }
}
