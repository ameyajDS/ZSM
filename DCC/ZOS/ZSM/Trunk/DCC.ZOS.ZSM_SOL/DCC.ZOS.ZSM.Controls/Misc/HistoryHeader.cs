using System;
using System.Data;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.DBFacade;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.MGMT.Global;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.Controls.Misc
{
    public partial class HistoryHeader : UserControl
    {
        private ZSM_MUMDbFacade dbFacade;
        public HistoryHeader()
        {
            InitializeComponent();
            this.sewadarHeader1.SttsCode = "sttsCode";
            ZSMUtility.MakeGridReadOnly(this.grdHistory);
        }

        public bool IsDesignerHosted
        {
            get
            {
                return IsControlDesignerHosted(this);
            }
        }

        public static bool IsControlDesignerHosted(Control ctrl)
        {
            if (ctrl != null)
            {
                if (ctrl.Site != null)
                {
                    if (ctrl.Site.DesignMode == true)
                        return true;
                    else
                    {
                        if (IsControlDesignerHosted(ctrl.Parent))
                            return true;
                        else
                            return false;
                    }
                }
                else
                {
                    if (IsControlDesignerHosted(ctrl.Parent))
                        return true;
                    else
                        return false;
                }
            }
            else
                return false;
        }

        private void sewadarHeader1_SewadarSelectionChanged(object sender, SewadarHeader.SewadarSelectionChangedEventArgs e)
        {
            if (DbManager.IsNotNull(e.SewadarId))
            {
                DataTable dT = this.dbFacade.QuerySewadarHistory(e.SewadarId).Tables[0];
                this.grdHistory.RetrieveRecords(dT, false, RowStates.Old);
            }
        }

        private void HistoryHeader_Load(object sender, EventArgs e)
        {
            if (!IsDesignerHosted)
            {
                dbFacade = new ZSM_MUMDbFacade(GlobalAppVariables.AppContext.ApplicationId);
            }
        }
       
    }
}
