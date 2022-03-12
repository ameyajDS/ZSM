using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DCC.UMB.CDF;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.View.Menu;
using System.Configuration;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls;
using System.IO;
using DCC.DBFacade;
using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Drawing2D;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.DB;
using System.Reflection;
using System.Collections;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.Log;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.ZOS.ZSM.MSC;
using System.Timers;
using DCC.UMB.CDF.Lookup.Modal;

namespace DCC.ZOS.ZSM.ACT
{

    public partial class Sewadars : ZSMAbstractScreen
    {
        private enum GridColumns
        {
            sewadar_photo,
            photo_dt
        }


        private enum GrdListColumns
        {
            sewadar_grno,
            satsang_centre_id
        }

        bool photoChanged = false;
        int? sewadarId = null;
        bool sewadarDetailsRecorded = false;

        public Sewadars()
        {
            InitializeComponent();
            ZSMUtility.MakeGridReadOnly(this.grdRemarks);
            this.sewadarStatusCombo1.isGlobal = true;
        }

        public override string ScreenId { get { return Screens.ACT_SEWADARS; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        public override void ClearControls()
        {
            base.ClearControls();
            this.ImgSewadarPhoto.ClearControlValues();
            photoChanged = false;
            sewadarDetailsRecorded = false;
            sewadarId = null;
        }

        protected override void InitializeDbFacade()
        {
            base.InitializeDbFacade();
            this.grdRemarks.SetComboBoxColumnDataSource("remarks_type", ZSMUtility.GetRemarkTypes(this.dbFacade), "remarks_type", "remarks_type");
            this.cmbRemarksType.SetDataSource(ZSMUtility.GetRemarkTypes(this.dbFacade), "remarks_type", "remarks_type");
        }
        private void makeEditableOnlyInQueryMode(bool isQueryMode)
        {
            this.txtGRNo.ReadOnly = !isQueryMode;
            this.txtSewadarStatus.ReadOnly = !isQueryMode;
            this.dtmSewadarStatus.ReadOnly = !isQueryMode;
            this.zsmSatsangCentresLookup1.ReadOnly = !isQueryMode;
            this.dtAppDate.ReadOnly = !isQueryMode;
            this.intSewadarId.ReadOnly = !isQueryMode;
            this.cmbRemarksType.Visible = isQueryMode;
            this.txtRemarks.Visible = isQueryMode;
        }

        private void showStatus(bool show)
        {
            this.sewadarStatusCombo1.Visible = show;
            this.dtGlobalStatus.Visible = show;
            this.initiationPlacesLookup1.TabIndex = show ? 13 : 11;
            this.dtInitiation.TabIndex = show ? 12 : 10;
            this.patronCombo1.TabIndex = show ? 14 : 12;
            this.dtPhotoDate.TabIndex = show ? 15 : 13;

        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);
            this.txtFirstName.Focus();
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                showStatus(false);
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
            }
            else if (uiMode == UIModes.Query || uiMode == UIModes.Update)
            {
                ClearControls();
                showStatus(true);
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
                if (!string.IsNullOrEmpty(screenParameters))
                {
                    this.intSewadarId.DisplayText = screenParameters;
                    GlobalAppVariables.ObjMDIMain.FireRetrieveMode();
                }
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
                makeEditableOnlyInQueryMode(uiMode == UIModes.Query);
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


        public override void SetLookupResult(LookupResult result, Control targetControl)
        {
            base.SetLookupResult(result, targetControl);
            if (targetControl == this.grdRemarks)//which means that the called screen has returned back
            {
                //[[If the called screen has return by none mode, i.e. user chose to not to record
                //values in the part, and closed the screen, then abort the sequence of pooping up 
                //the screens, and simply return back to insert mode of this screen
                if (this.CurrentUIMode == UIModes.Insert)
                {
                    if (result.ReturnMode == DCC.UMB.CDF.Lookup.Modal.LookupReturnModes.None)
                    {
                        this.sewadarDetailsRecorded = true;
                    }
                    GlobalAppVariables.ObjMDIMain.FireInsertMode();
                }
            }
        }

        protected override bool IsAValidScreenAction(string actionId)
        {
            bool retVal = true;
            if (this.grdList.CurrentRowIndex >= 0)
            {
                int? currSatsangCentre = this.grdList.AsInt(GrdListColumns.satsang_centre_id.ToString());
                switch (actionId)
                {
                    case "Sewadar Information":
                        if (currSatsangCentre.HasValue && currSatsangCentre.Value != ZSMUtility.GetSatsangCentreId())
                            retVal = false;
                        break;
                    case "Sewadar Particulars":
                        if ((currSatsangCentre == null) ||
                            (currSatsangCentre.HasValue && (currSatsangCentre.Value != ZSMUtility.GetSatsangCentreId()))
                           )
                            retVal = false;
                        break;
                    case "Add Photo":
                        if (this.ImgSewadarPhoto.EmbeddedPictureBox.Image != null)
                            return false;
                        break;
                    case "Change Photo":
                    case "Delete Photo":
                        if (this.ImgSewadarPhoto.EmbeddedPictureBox.Image == null)
                            return false;
                        break;
                }
            }
            return retVal && base.IsAValidScreenAction(actionId);
        }

        private void ExecuteScreenActionInDb(string actionId)
        {
            try
            {
                this.dbFacade.BeginTrans();
                switch (actionId)
                {
                    case "Change Status":
                        byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
                        this.dbFacade.UpdateSewadarGlobalStatus(this.intSewadarId.DisplayTextAsInteger,
                            this.sewadarStatusCombo1.SelectedValueAsStr, this.dtGlobalStatus.DisplayTextAsDateTime,
                            txn_ts);
                        ZSMUtility.LogAction(this, this.dbFacade, actionId + "|" + this.sewadarStatusCombo1.SelectedValueAsStr,
                            this.intSewadarId.DisplayTextAsInteger, null, null, this.zsmSatsangCentresLookup1.IdTextAsInteger, this.txtGRNo.DisplayText);
                        break;
                    case "Add Photo":
                        if (this.ImgSewadarPhoto.EmbeddedPictureBox.Image != null)
                        {
                            this.dbFacade.InsertSewadarsPhoto(this.intSewadarId.DisplayTextAsInteger, this.ImgSewadarPhoto.ImageInByteArray, this.dtPhotoDate.DisplayTextAsDateTime);
                            ZSMUtility.LogAction(this, this.dbFacade, actionId, this.intSewadarId.DisplayTextAsInteger, null, null, this.zsmSatsangCentresLookup1.IdTextAsInteger, this.txtGRNo.DisplayText);
                        }
                        break;
                    case "Change Photo":
                        if (photoChanged)
                        {
                            this.dbFacade.InsertSewadarsPhoto(this.intSewadarId.DisplayTextAsInteger, this.ImgSewadarPhoto.ImageInByteArray, this.dtPhotoDate.DisplayTextAsDateTime);
                            ImageCache.InvalidateSewadarImage(this.intSewadarId.DisplayTextAsInteger);
                            ZSMUtility.LogAction(this, this.dbFacade, actionId, this.intSewadarId.DisplayTextAsInteger, null, null, this.zsmSatsangCentresLookup1.IdTextAsInteger, this.txtGRNo.DisplayText);
                        }
                        break;
                    case "Delete Photo":
                        if (photoChanged)
                        {
                            this.dbFacade.InsertSewadarsPhoto(this.intSewadarId.DisplayTextAsInteger, null, this.dtPhotoDate.DisplayTextAsDateTime);
                            ImageCache.InvalidateSewadarImage(this.intSewadarId.DisplayTextAsInteger);
                            ZSMUtility.LogAction(this, this.dbFacade, actionId, this.intSewadarId.DisplayTextAsInteger, null, null, this.zsmSatsangCentresLookup1.IdTextAsInteger, this.txtGRNo.DisplayText);
                        }
                        break;
                }
                this.dbFacade.CommitTrans();
                UIManager.ShowMessage(MsgCodes.ProcessMsg, actionId, MessageTypes.Plain);
            }
            catch (Exception)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }

        }

        public override void ExecuteScreenAction(string actionId)
        {
            int? currSatsangCentreId = null;
            string currSewadarGrno = null;
            if (string.Compare(actionId, "Sewadar Information") == 0
                || string.Compare(actionId, "Sewadar Particulars") == 0)
            {
                currSatsangCentreId = this.grdList.AsInt(GrdListColumns.satsang_centre_id.ToString());
                currSewadarGrno = this.grdList.AsStr(GrdListColumns.sewadar_grno.ToString());
            }

            switch (actionId)
            {
                case "Change Status":
                case "Add Photo":
                case "Change Photo":
                case "Delete Photo":
                    ExecuteScreenActionInDb(actionId);
                    break;
                case "Sewadar Details":
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select satsang_centre_id, sewadar_grno  from ViewSewadarsDetail where sewadar_id = " + this.intSewadarId.DisplayText).Tables[0];
                    if (dT.Rows.Count > 0)
                    {
                        UIManager.OpenForm(typeof(SewadarsDetails), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    }
                    else
                    {
                        UIManager.OpenForm(typeof(SewadarsDetails), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    }

                    break;
                case "Sewadar Information":
                    if (DbManager.IsNotNull(currSatsangCentreId) && !string.IsNullOrEmpty(currSewadarGrno))
                    {
                        UIManager.OpenForm(typeof(SewadarsInformation), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, currSewadarGrno + "|" + currSatsangCentreId, this, this);
                    }
                    else
                    {
                        UIManager.OpenForm(typeof(SewadarsInformation), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    }
                    break;
                case "Sewadar Particulars":
                    if (DbManager.IsNotNull(currSatsangCentreId) && !string.IsNullOrEmpty(currSewadarGrno))
                    {
                        UIManager.OpenForm(typeof(SewadarsParticulars), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, currSatsangCentreId + "," + currSewadarGrno + ",Sewadar", this, this);
                    }
                    break;
                case "History":
                    UIManager.OpenForm(typeof(History), UIModes.Reference, GlobalAppVariables.AppContext.ApplicationId, this.intSewadarId.DisplayText, this, this);
                    break;
            }
        }

        void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            ((System.Timers.Timer)sender).Stop();
            UIManager.ShowMessage(MsgCodes.ProcessMsg, "Sewadar Saved. Launched Sewadar Detail Screen for Sewadar Id: " + this.sewadarId.ToString() + " ...", MessageTypes.Plain);
        }

        public DCCGrid GetRemarksGrid()
        {
            return this.grdRemarks;
        }

        public override void Save()
        {
            base.Save();
            //[[After completing of saving of screen open Sewadars Details
            if (this.CurrentUIMode == UIModes.Insert && !this.sewadarDetailsRecorded)
            {
                if (DbManager.IsNotNull(this.sewadarId))
                {
                    this.sewadarDetailsRecorded = true;
                    UIManager.OpenForm(typeof(SewadarsDetails), UIModes.New,
                        GlobalAppVariables.AppContext.ApplicationId,
                        this.sewadarId.ToString(), this, this.grdRemarks
                        );
                    System.Timers.Timer timer = new System.Timers.Timer(500);//start a timer to print a delayed message to user, the exception below will break CDF save sequence
                    timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
                    timer.Start();
                    //[[Throw excepiton to override the default behavior of CDF, which essentially is to reopen
                    //the screen in insert mode
                    throw new Exception("");//Exception with no message would prevent it to be displayed to user.
                    //]]
                }
            }
            //]]
        }

        public override void LoadBrowseView(int rowIndex)
        {
            makeEditableOnlyInQueryMode(false);
            showStatus(true);
            photoChanged = false;
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1, this.grdRemarks);
            this.dbFacade.ClearDbTasks();
            this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarsRemarkAsTask(this.intSewadarId.DisplayTextAsInteger));
            if (!ImageCache.ContainsSewadarImage(this.intSewadarId.DisplayTextAsInteger))
            {
                this.dbFacade.AddDbTask(this.dbFacade.QuerySewadarsPhotoAsTask(this.intSewadarId.DisplayTextAsInteger));
            }
            DataSet dSet = this.dbFacade.ExecuteDbTasks();
            DataTable dT = dSet.Tables[0];
            this.grdRemarks.RetrieveRecords(dT, false, RowStates.Old);
            DataTable dtPersonPhoto = null;
            if (!ImageCache.ContainsSewadarImage(this.intSewadarId.DisplayTextAsInteger))
            {
                dtPersonPhoto = dSet.Tables[1];
                if (dtPersonPhoto.Rows.Count > 0)
                    ImageCache.SetSewadarImage(this.intSewadarId.DisplayTextAsInteger, dtPersonPhoto);
            }
            else
            {
                dtPersonPhoto = ImageCache.GetSewadarImage(this.intSewadarId.DisplayTextAsInteger);
            }
            if (dtPersonPhoto.Rows.Count > 0)
            {
                byte[] array = (byte[])dtPersonPhoto.Rows[0]["sewadar_photo"];
                this.ImgSewadarPhoto.SetImage(array);
            }
            else
            {
                this.ImgSewadarPhoto.ClearControlValues();
            }
            this.ObjectIdForLogOperation = this.intSewadarId.DisplayText;
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarSQLSelectQuery query = new ViewSewadarSQLSelectQuery();

            //This line avoids the if condition and specifies that sewadar_id is a primary/indexed key.
            query.sewadar_id.IsExcluisive = true;

            query.sewadar_id.Equal(this.intSewadarId.DisplayText);
            query.first_nm.StartsWith(this.txtFirstName.DisplayText);
            query.middle_nm.StartsWith(this.txtMiddleName.DisplayText);
            query.last_nm.StartsWith(this.txtSurName.DisplayText);
            query.gender.Equal(this.zsmGenderCombo1.SelectedValue);
            query.birth_dtm.Between(this.dtmBirthDate);
            query.initiation_by.Equal(this.patronCombo1.SelectedValue);
            query.initiation_place_id.Equal(this.initiationPlacesLookup1.IdTextAsInteger);
            query.initiation_dt.Equal(this.dtInitiation.DisplayTextAsDateTime);
            query.global_sewadar_status_cd.Equal(this.sewadarStatusCombo1.SelectedValue);
            query.global_sewadar_status_dt.Between(this.dtGlobalStatus);
            query.sewadar_grno.Equal(this.txtGRNo.DisplayText);
            query.sewadar_status_nm.Equal(this.txtSewadarStatus.DisplayText);
            query.sewadar_status_dtm.Between(this.dtmSewadarStatus);
            query.satsang_centre_id.Equal(this.zsmSatsangCentresLookup1.IdText);
            query.appointment_dt.Between(this.dtAppDate);
            query.is_married.Equal(this.chkMarried.BlnString);

            string toExecuteQuery = default(string);
            toExecuteQuery = query.GetSQLSelectQuery();

            if (!string.IsNullOrEmpty(toExecuteQuery) && (DbManager.IsNotNull(this.cmbRemarksType.SelectedValue) || !string.IsNullOrEmpty(this.txtRemarks.DisplayText)))
            {
                if (!query.IsAnyWhereClauseDefined())
                {
                    toExecuteQuery = toExecuteQuery
                        + " WHERE ";
                }
                else
                {
                    toExecuteQuery = toExecuteQuery
                        + " AND ";
                }
                toExecuteQuery = toExecuteQuery.Replace("ViewSewadar", "ViewSewadar v");
                toExecuteQuery += string.Format("EXISTS (SELECT 1 FROM sewadars_remarks a WHERE a.sewadar_id = v.sewadar_id AND a.remarks_type = '{0}' AND a.remarks LIKE '{1}%')", this.cmbRemarksType.SelectedValueAsStr, this.txtRemarks.DisplayText);
            }
            return dbFacade.ObjDBManager.ExecuteReaderSQL(toExecuteQuery);
        }


        public override void CreateData()
        {
            if (!DbManager.IsNotNull(this.sewadarId))
            {
                int generatedId = default(int);
                this.dbFacade.InsertSewadar(ref generatedId,
                                            this.txtFirstName.DisplayText, this.txtMiddleName.DisplayText,
                                            this.txtSurName.DisplayText, this.zsmGenderCombo1.SelectedValueAsStr,
                                            this.dtmBirthDate.DisplayTextAsDateTime, this.chkMarried.BlnString,
                                            this.dtInitiation.DisplayTextAsDateTime, this.initiationPlacesLookup1.IdTextAsShort,
                                            this.patronCombo1.SelectedValueAsByte);
                this.InfoMessageToShow = "The Generated Sewadar Id is : " + generatedId;
                this.sewadarId = generatedId;
                this.ObjectIdForLogOperation = generatedId.ToString();
            }
        }
        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            List<string> tasks = new List<string>();
            tasks.Add(this.dbFacade.UpdateSewadarAsTask(this.intSewadarId.DisplayTextAsInteger,
                                        this.txtFirstName.DisplayText, this.txtMiddleName.DisplayText,
                                        this.txtSurName.DisplayText, this.zsmGenderCombo1.SelectedValueAsStr,
                                        this.dtmBirthDate.DisplayTextAsDateTime, this.chkMarried.BlnString,
                                        this.dtInitiation.DisplayTextAsDateTime, this.initiationPlacesLookup1.IdTextAsShort,
                                        this.patronCombo1.SelectedValueAsByte, txn_ts));
            //if (photoChanged)
            //{
            //    tasks.Add(this.dbFacade.InsertSewadarsPhotoAsTask(this.intSewadarId.DisplayTextAsInteger, this.ImgSewadarPhoto.ImageInByteArray, this.dtPhotoDate.DisplayTextAsDateTime));
            //    ImageCache.InvalidateSewadarImage(this.intSewadarId.DisplayTextAsInteger);
            //}
            this.dbFacade.AddDbTasks(tasks);
            this.dbFacade.ExecuteDbTasks();

        }
        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteSewadar(this.intSewadarId.DisplayTextAsInteger, txn_ts);

            return true;
        }

        private void dtmBirthDate_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (DbManager.IsNotNull(this.dtmBirthDate.DisplayTextAsDateTime))
            {
                if (this.dtmBirthDate.DisplayTextAsDateTime.Value.Year <= 1753)
                {
                    UIManager.ShowMessage(MsgCodes.GreaterOrEqualValueReqd, "Birth Date|" + "1753|");
                    e.Cancel = true;
                }
                else if (this.dtmBirthDate.DisplayTextAsDateTime.Value >= DateTime.Now)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, this.dtmBirthDate.DisplayText + "| DOB ");
                    e.Cancel = true;
                }
                else
                {
                    this.intAge.DisplayText = (DateTime.Now.Year - this.dtmBirthDate.DisplayTextAsDateTime.Value.Year).ToString();
                }
            }
        }

        private void dtInitiation_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                if (this.dtInitiation.DisplayTextAsDateTime.HasValue)
                {
                    if (this.dtInitiation.DisplayTextAsDateTime.Value > DateTime.Now)
                    {
                        UIManager.ShowMessage(MsgCodes.InvalidValue, this.dtInitiation.DisplayText + "| Initiation Date ");
                        e.Cancel = true;
                    }
                    else if (this.dtInitiation.DisplayTextAsDateTime.Value.Year <= dtmBirthDate.DisplayTextAsDateTime.Value.Year)
                    {
                        UIManager.ShowMessage(MsgCodes.GreaterValueReqd, "Initiation Date|" + "Birth Date|");
                        e.Cancel = true;
                    }
                }
            }
        }

        private void sewadarStatusCombo1_SelectedValueChanged(object sender, EventArgs e)
        {
            if (this.CurrentUIMode != UIModes.Query)
            {
                this.dtGlobalStatus.DisplayTextAsDateTime = DbManager.IsNotNull(this.sewadarStatusCombo1.SelectedValue) ? (DateTime?)DateTime.Now : null;
            }
        }

        private void ImgSewadarPhoto_ImageChanged(object sender, EventArgs e)
        {
            this.dtPhotoDate.DisplayTextAsDateTime = DateTime.Now.Date;
            this.photoChanged = true;
        }

        private void dtPhotoDate_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {

            if (this.dtPhotoDate.DisplayTextAsDateTime.HasValue)
            {
                if (this.dtPhotoDate.DisplayTextAsDateTime.Value > DateTime.Now)
                {
                    UIManager.ShowMessage(MsgCodes.InvalidValue, this.dtPhotoDate.DisplayText + "| Photo Date ");
                    e.Cancel = true;
                }
            }
        }

        private void dtInitiation_Validated(object sender, EventArgs e)
        {
            var dateTime = dtInitiation.DisplayTextAsDateTime;
            if (dateTime.HasValue)
            {
                var correctedDate = new DateTime(dateTime.Value.Year, dateTime.Value.Month, dateTime.Value.Day, 0, 0, 0);
                dtInitiation.DisplayTextAsDateTime = correctedDate;
            }
        }

        private void dtmBirthDate_Validated(object sender, EventArgs e)
        {
            var dateTime = dtmBirthDate.DisplayTextAsDateTime;
            if (dateTime.HasValue)
            {
                var correctedDate = new DateTime(dateTime.Value.Year, dateTime.Value.Month, dateTime.Value.Day, 0, 0, 0);
                dtmBirthDate.DisplayTextAsDateTime = correctedDate;
            }
        }

    }
}
