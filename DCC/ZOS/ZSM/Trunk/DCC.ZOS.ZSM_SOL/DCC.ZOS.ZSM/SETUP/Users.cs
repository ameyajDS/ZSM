using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.ZOS.ZSM.Controls.Utils;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.ZOS.ZSM;
using DCC.UMB.CDF.MGMT.Global;


namespace DCC.ZOS.ZSM.SETUP
{
    public partial class Users : ZSMAbstractScreen
    {
        public Users()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                return Screens.SETUP_USERS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            user_no,
            user_id,
            user_nm,
            email_id,
            activation_dt,
            deactivation_dt,
            is_open_sewadar,
            sewadar_id,
            is_locked,
            user_role_id,
            application_id,
            grd_user_no,
            grd_user_nm,
            grd_user_id,
            grd_sewadar_id,
            grd_email_id,
            grd_activation_dt,
            grd_is_open_sewadar,
            grd_deactivation_dt,
            grd_is_locked,
            grd_user_role_id,
            grd_application_id
        }
        #endregion


        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        } 

        public override void ClearControls()
        {
            base.ClearControls();
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
               // this.txtGMTDiff.DisplayText = "0.00";
                this.intUser_no.ReadOnly = true;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intUser_no.ReadOnly = false;
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.List)
            {
                this.ShowListView(this.scListOrBrowse, true);
            }
            else if (uiMode == UIModes.Browse)
            {
                this.ShowListView(this.scListOrBrowse, false);
            }
        }
        /*
        public void LoadGrids()
        {
            dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QueryUsersApplicationAsTask(this.intUser_no.IdTextAsInteger));
        }

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = this.intUser_no.DisplayText;
            this.intUser_no.ReadOnly = true;
        }

        */

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewUsersSQLSelectQuery query = new ViewUsersSQLSelectQuery();
            query.user_no.IsExcluisive = true;
            query.user_no.Equal(this.intUser_no.DisplayText);
            query.user_id.Contains(this.txtUser_id.DisplayText);
            query.user_nm.Contains(this.txtUser_nm.DisplayText);
            query.email_id.Contains(this.txtEmail_id.DisplayText);
            query.sewadar_id.Equal(this.intSewadar_id.DisplayText);
            query.application_id.Equal(this.txtApplication_id);
            query.user_role_id.Equal(this.txtUser_role_id);
            return dbFacade.ExecuteSelectQuery(query);
        }
        /*
        public override void CreateData()
        {
            int generatedId = default(int);
            this.dbFacade.CreateUser(   this.txtUser_id.DisplayText,
                                        this.txtUser_nm.DisplayText,
                                        this.txtPassword,
                                        this.txtEmail_id.DisplayText,
                                        this.txtApplication_id,
                                        this.txtUser_role_id,
                                        this.intSewadar_id.DisplayTextAsInteger,
                                        this.chkIs_open_sewadar.DisplayTextBindingKey,
                                        this.dtmDeactivation_dt.DisplayTextAsDateTime,
                                        ref generatedId);
        }
        */
        private void dccGrid1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void tableLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dccGrid1_CellContentClick_2(object sender, DataGridViewCellEventArgs e)
        {

        }

        public override void CreateData()
        {

        }

        private void dccGrid1_CellContentClick_3(object sender, DataGridViewCellEventArgs e)
        {

        }
       
    }
}
