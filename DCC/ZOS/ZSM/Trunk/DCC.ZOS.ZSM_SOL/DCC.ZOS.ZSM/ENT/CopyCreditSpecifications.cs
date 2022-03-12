using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;
using DCC.DBFacade;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.Controller;
using System.Xml;

namespace DCC.ZOS.ZSM.ENT
{
    public partial class CopyCreditSpecifications : Form
    {
        private ZSM_MUMDbFacade dbFacade = null;
        private short? creditSpecificationsId = null;
        private short? generatedCreditSpecificationId = null;

        public CopyCreditSpecifications()
        {
            InitializeComponent();
            this.dbFacade = new ZSM_MUMDbFacade(GlobalAppVariables.AppContext.ApplicationId);
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {            
            this.Dispose();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            try
            {
                this.dbFacade.BeginTrans();
                DataSet dset = this.dbFacade.CopyCreditSpecificationsAndItsSewas(this.creditSpecificationsId, this.txtNewCreditSpecificationName.DisplayText);
                this.generatedCreditSpecificationId = (short?)dset.Tables[0].Rows[0][0];
                this.dbFacade.CommitTrans();
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                UIManager.DisposeException(ex);
            }
            finally
            {
                this.Dispose();
            }

        }

        public short? ShowDialog(IDbManager objDbManager, short? creditSpeicifationsId, string creditSpecificationsName, Form owner)
        {
            this.creditSpecificationsId = creditSpeicifationsId;
            this.txtNewCreditSpecificationName.DisplayText = creditSpecificationsName;
            this.ShowDialog(owner);
            return this.generatedCreditSpecificationId;
        }

    }
}
