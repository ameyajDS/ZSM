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
    public partial class MergeSewaTeamsForASewa : ZSMAbstractScreen
    {
        int? sewaTeamId = null;
        int? sewaId = null;
        public MergeSewaTeamsForASewa()
        {
            InitializeComponent();
        }


        public override string ScreenId { get { return Screens.MERGE_SEWA_TEAMS; } }

        public override void ShowScreen(UMB.CDF.Configuration.UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            string[] args = screenParameters.Split('|');
            sewaId = int.Parse(args[1]);
            sewaTeamId = int.Parse(args[0]);
        }

        public override void CreateData()
        {
            this.dbFacade.MergeTeamsForASewa(sewaTeamId, this.sewaTeamsLookup1.IdTextAsInteger);
            this.ObjectIdForLogOperation = this.sewaTeamsLookup1.IdText;
        }

        private void sewaTeamsLookup1_LookupDialogShowing(object sender, UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "ss.sewa_id = " + sewaId.GetValueOrDefault(0));
        }
    }
}
