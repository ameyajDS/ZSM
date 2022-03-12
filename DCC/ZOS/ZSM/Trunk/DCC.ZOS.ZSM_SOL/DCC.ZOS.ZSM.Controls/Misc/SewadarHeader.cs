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
using System.Collections.Generic;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;
using DCC.UMB.CDF.Lookup.Modal;

namespace DCC.ZOS.ZSM.Controls.Misc
{
    public partial class SewadarHeader : UserControl
    {
        public SewadarHeaderType HeaderType { get; set; }

        private ZSM_MUMDbFacade dbFacade;
        public event EventHandler<SewadarSelectionChangedEventArgs> SewadarSelectionChanged;
        public event EventHandler<LookupEventArgs> SewadarLookupDailogShowing;

        public bool UseFocusLostEvent { get; set; }
        string sttsCode = default(string);


        public string SttsCode
        {
            get
            {
                return sttsCode;
            }
            set
            {
                sttsCode = value;
                this.txtName.SttsCode = sttsCode;
                this.intSewadarId.SttsCode = sttsCode;
                this.txtGRNo.SttsCode = sttsCode;
            }
        }

        public SewadarHeader()
        {
            InitializeComponent();
            this.HeaderType = SewadarHeaderType.SewadarIDWise;
        }

        /// <summary>
        /// Typically useful to load data from grdList
        /// </summary>
        public void LoadImageAndDataFromGridToContainer(DCCGrid grid, int rowIndex)
        {
            UtilityManager.GetContainerScreen(this).LoadDataFromGridToContainer(grid, rowIndex, this.tlpTop);
        }

        public void ClearControls(params Control[] controlsNotToBeCleared)
        {
            UtilityManager.ClearAllControlsOfContainer(this.tlpTop, false, UtilityManager.GetContainerScreen(this), controlsNotToBeCleared);
        }

        public void makeReadOnlyFieldQueriable(bool isQueryMode)
        {
            this.intAge.ReadOnly = !isQueryMode;
            this.txtSewadarStatus.ReadOnly = !isQueryMode;
            this.txtDepartmentName.ReadOnly = !isQueryMode;
            this.txtSubDepartment.ReadOnly = !isQueryMode;
            this.dtDepJoiningDate.ReadOnly = !isQueryMode;
            this.dtmSewadarStatus.ReadOnly = !isQueryMode;
        }

        public void makeHeaderReadOnly()
        {
            this.txtName.ReadOnly = true;
            this.txtGRNo.ReadOnly = true;
            this.intSewadarId.ReadOnly = true;
        }

        public void SetGRNoAndFireEvent(string grNo, int? satsangCentreId)
        {

            DataTable sewadarInfo = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select centre_nm, sewadar_grno, full_nm, sewadar_id, age, gender, sewadar_status_nm, sewadar_status_cd, sewadar_status_dtm, department_nm, sub_department_nm, department_dt from ViewSewadarsRegistration where sewadar_grno = '{0}' AND satsang_centre_id = '{1}'", grNo, satsangCentreId)).Tables[0];
            //if(!DbManager.IsNotNull(this.SatsangCentreId))
            //{
            //    this.SatsangCentreId = DbManager.GetNullableInteger(sewadarInfo.Rows[0]["satsang_centre_id"]);
            //}
            this.SatsangCentreId = satsangCentreId;
            if (this.txtSatsangCentre.Lookup)
            {
                this.txtSatsangCentre.IdText = this.SatsangCentreId.ToString();
                ZSMUtility.setDisplayValueText(this.txtSatsangCentre, sewadarInfo.Rows[0]["centre_nm"].ToString());
            }
            UtilityManager.GetContainerScreen(this).LoadDataToContainer(sewadarInfo, this.tlpTop, this.txtSatsangCentre);
            RaiseSewadarSelectionChangedEvent();
        }

        public void SetNameAndFireEvent(int? sewadarId, int? satsangCentreId, string sewadarGRno)
        {
            string viewName;
            string whereCondition;
            if (HeaderType == SewadarHeaderType.SewadarIDWise)
            {
                viewName = "ViewSewadarHeader";
                whereCondition = " where sewadar_id = " + sewadarId;
            }
            else
            {
                viewName = "ViewSewadarHeaderOnGRNo";
                whereCondition = " where satsang_centre_id = " + satsangCentreId + " and sewadar_grno = '" + sewadarGRno + "'";
            }            

            DataTable sewadarInfo = this.dbFacade.ObjDBManager.ExecuteSQL("select satsang_centre_id, centre_nm, sewadar_grno, full_nm, sewadar_id, age, gender, sewadar_status_nm, sewadar_status_dtm, department_nm, sub_department_nm, department_dt from " + viewName + whereCondition).Tables[0];
            if(!DbManager.IsNotNull(this.SatsangCentreId))
            {
                this.SatsangCentreId = DbManager.GetNullableInteger(sewadarInfo.Rows[0]["satsang_centre_id"]);
            }
            if (this.txtSatsangCentre.Lookup)
            {
                this.txtSatsangCentre.IdText = this.SatsangCentreId.ToString();
                ZSMUtility.setDisplayValueText(this.txtSatsangCentre, sewadarInfo.Rows[0]["centre_nm"].ToString());
            }
            else
            {
                this.txtSatsangCentre.DisplayText = sewadarInfo.Rows[0]["centre_nm"].ToString();
            }
            UtilityManager.GetContainerScreen(this).LoadDataToContainer(sewadarInfo, this.tlpTop, this.txtSatsangCentre);
            RaiseSewadarSelectionChangedEvent();
        }

        private void RaiseSewadarSelectionChangedEvent()
        {
            EventHandler<SewadarSelectionChangedEventArgs> handler = SewadarSelectionChanged;
            SewadarSelectionChangedEventArgs args = new SewadarSelectionChangedEventArgs();
            args.SewadarId = this.txtName.IdTextAsInteger;
            if (handler != null)
            {
                handler(this, args);
            }
        }

        private void RaiseLookupDailogShowingEvent(LookupEventArgs e)
        {
            EventHandler<LookupEventArgs> handler = SewadarLookupDailogShowing;
            if (handler != null)
            {
                handler(this, e);
            }
        }

        public  DCCTextField TxtName
        {
            get { return this.txtName; }
        }

        public int? SatsangCentreId
        {
            get;
            set;
        }

        public DCCTextField TxtGRNo
        {
            get { return this.txtGRNo; }
        }


        public int? SewadarId
        {
            get { return this.intSewadarId.IdTextAsInteger; }
        }

        public void HideSatsangCentre()
        {
            this.txtSatsangCentre.Visible = false;
        }
     

        /// <summary>
        /// This class represents arguments passed when the SewadarSelectionChangedEventArgs is raised. 
        /// </summary>
        public class SewadarSelectionChangedEventArgs : EventArgs
        {
            private int? sewadarId;
            /// <summary>
            /// Represents the sewadar id
            /// </summary>
            public int? SewadarId
            {
                get { return sewadarId; }
                internal set { sewadarId = value; }
            }
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

        private void SewadarHeader_Load(object sender, EventArgs e)
        {
            if (!IsDesignerHosted)
            {
                dbFacade = new ZSM_MUMDbFacade(GlobalAppVariables.AppContext.ApplicationId);
                this.SatsangCentreId = ZSMUtility.GetSatsangCentreId();
            }
        }


        private void intSewadarId_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (HeaderType == SewadarHeaderType.SewadarGRNoWise)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("ViewSewadarHeader", "ViewSewadarHeaderOnGRNo");
            }
            if (DbManager.IsNotNull(this.SatsangCentreId))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.SatsangCentreId);
                this.RaiseLookupDailogShowingEvent(e);
            }

        }

        private void txtName_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (HeaderType == SewadarHeaderType.SewadarGRNoWise)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("ViewSewadarHeader", "ViewSewadarHeaderOnGRNo");
            }
            if (DbManager.IsNotNull(this.SatsangCentreId))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.SatsangCentreId);
                this.RaiseLookupDailogShowingEvent(e);
            }

        }

        private void txtGRNo_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (HeaderType == SewadarHeaderType.SewadarGRNoWise)
            {
                e.LookupSqlString = e.LookupSqlString.Replace("ViewSewadarHeader", "ViewSewadarHeaderOnGRNo");
            }
            if (DbManager.IsNotNull(this.SatsangCentreId))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("2=2", "vs.satsang_centre_id = " + this.SatsangCentreId);
                this.RaiseLookupDailogShowingEvent(e);
            }
        }



        private void txtSatsangCentre_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            if (DbManager.IsNotNull(this.txtSatsangCentre.IdTextAsInteger))
            {
                this.SatsangCentreId = this.txtSatsangCentre.IdTextAsInteger;
                this.ClearControls(this.txtSatsangCentre);
            }
        }


        private void txtGRNoLookupResultSet()
        {
            //if (UtilityManager.GetContainerScreen(this).CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.txtGRNo.DisplayText) && DbManager.IsNotNull(this.txtGRNo.LookupResult))
                {
                    LookupResult lr = this.txtGRNo.LookupResult;
                    ZSMUtility.setDisplayValueText(this.txtName, DbManager.GetString(lr.SelectedRecords[0]["full_nm"]));
                    this.txtName.IdText = lr.SelectedRecords[0]["sewadar_id"].ToString();
                    this.txtNameLookupResultSet((int?)lr.SelectedRecords[0]["satsang_centre_id"],
                        lr.SelectedRecords[0]["sewadar_grno"].ToString());
                }
            }
        }

        private void txtNameLookupResultSet(int? satsangCentreId, string sewadarGRno)
        {
            if (DbManager.IsNotNull(this.txtName.IdTextAsInteger))
            {

                SetNameAndFireEvent(this.txtName.IdTextAsInteger, satsangCentreId, sewadarGRno);
                //RaiseSewadarSelectionChangedEvent();
            }
        }

        private void intSewadarIdLookupResultSet()
        {
            //if (UtilityManager.GetContainerScreen(this).CurrentUIMode != UIModes.Query)
            {
                if (!string.IsNullOrEmpty(this.intSewadarId.DisplayText) && DbManager.IsNotNull(this.intSewadarId.LookupResult))
                {
                    LookupResult lr = this.intSewadarId.LookupResult;
                    ZSMUtility.setDisplayValueText(this.txtName, DbManager.GetString(lr.SelectedRecords[0]["full_nm"]));
                    this.txtName.IdText = lr.SelectedRecords[0]["sewadar_id"].ToString();
                    this.txtNameLookupResultSet((int?)lr.SelectedRecords[0]["satsang_centre_id"],
                        lr.SelectedRecords[0]["sewadar_grno"].ToString());
                }
            }
        }

        private void txtGRNo_FocusLost(object sender, EventArgs e)
        {
            if (this.UseFocusLostEvent)
            {
                LookupResult lr = this.txtGRNo.LookupResult;
                if (lr != null)
                {
                    this.txtNameLookupResultSet((int?)lr.SelectedRecords[0]["satsang_centre_id"],
                        lr.SelectedRecords[0]["sewadar_grno"].ToString());
                }
            }
        }

        private void txtName_FocusLost(object sender, EventArgs e)
        {
            if (this.UseFocusLostEvent)
            {
                LookupResult lr = this.txtName.LookupResult;
                if (lr != null)
                {
                    this.txtNameLookupResultSet((int?)lr.SelectedRecords[0]["satsang_centre_id"],
                        lr.SelectedRecords[0]["sewadar_grno"].ToString());
                }
            }
        }

        private void intSewadarId_FocusLost(object sender, EventArgs e)
        {
            if (this.UseFocusLostEvent)
            {
                LookupResult lr = this.intSewadarId.LookupResult;
                if (lr != null)
                {
                    this.txtNameLookupResultSet((int?)lr.SelectedRecords[0]["satsang_centre_id"],
                        lr.SelectedRecords[0]["sewadar_grno"].ToString());
                }
            }
        }

        private void txtGRNo_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.txtGRNoLookupResultSet();
        }

        private void txtName_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            LookupResult lr = this.txtName.LookupResult;
            this.txtNameLookupResultSet((int?)lr.SelectedRecords[0]["satsang_centre_id"],
                    lr.SelectedRecords[0]["sewadar_grno"].ToString());
        }

        private void intSewadarId_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            this.intSewadarIdLookupResultSet();
        }
      
    }
}
