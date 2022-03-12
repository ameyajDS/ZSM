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
using DCC.SSM.ZMS.Controls.Misc;
using System.Threading;
using DCC.ZOS.ZSM.MSC;

namespace DCC.ZOS.ZSM.ACT
{

    public partial class SewadarsParticulars : ZSMAbstractScreen
    {
        private List<AttributeRecorder> lstAllRecorders = new List<AttributeRecorder>();
        public string AttributeGroup { get; set; }
        int? SatsangCentreId { get; set; }
        string SewadarGrNo { get; set; }
        
        public SewadarsParticulars()
        {
            InitializeComponent();
            this.AttributeGroup = "Sewadar";
            this.sewadarHeader1.SewadarSelectionChanged += new EventHandler<DCC.ZOS.ZSM.Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs>(sewadarHeader1_SewadarSelectionChanged);
            this.sewadarHeader1.SttsCode = "SttsPrtclr";
            this.sewadarHeader1.HeaderType = SewadarHeaderType.SewadarGRNoWise;
        }

        public override string ScreenId { get { return Screens.ACT_SEWADARS_PARTICULARS; } }

        public override DCCGrid ListViewGrid
        {
            get { return this.grdList; }
        }
        public override void ClearControls()
        {
            base.ClearControls();
            this.pictureBox1.Image = null;
            this.RemoveAllRecorders();
            this.sewadarHeader1.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
        }

        public override bool IsReadyToSave()
        {
            if (!base.IsReadyToSave()) return false;
            if (this.dbFacade.ObjDBManager.ExecuteSQL(
                "select 1 FROM ViewSewadarHeaderOnGRNo vs JOIN system_information_values siv ON vs.sewadar_status_cd = siv.system_info_value AND siv.system_info_cd = 'SttsPrtclr' AND vs.satsang_centre_id = " + 
                this.sewadarHeader1.SatsangCentreId + " AND vs.sewadar_grno = '" + this.sewadarHeader1.txtGRNo.DisplayText +
                "'").Tables[0].Rows.Count == 0)
            {
                UIManager.ShowMessage(MsgCodes.OperationNotAllowed, "Save|person with given status not allowed", MessageTypes.Error);
                return false;
            }

            foreach (AttributeRecorder recorder in lstAllRecorders)
            {
                if (!recorder.IsReadyToSave()) return false;
            }
            
            return true;
        }
        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewadarsParticularsSQLSelectQuery query = new ViewSewadarsParticularsSQLSelectQuery();
            query.full_nm.Contains(this.sewadarHeader1.TxtName.DisplayText);
            query.sewadar_grno.Contains(this.sewadarHeader1.TxtGRNo.DisplayText);
            query.full_nm.Contains(this.sewadarHeader1.TxtName.DisplayText);
            query.satsang_centre_id.Equal(ZSMUtility.GetSatsangCentreId());
            query.sewadar_id.Equal(this.sewadarHeader1.intSewadarId.IdTextAsInteger);
            return dbFacade.ExecuteSelectQuery(query);
        }
        public override void LoadBrowseView(int rowIndex)
        {
            this.ObjectIdForLogOperation = CreateObjectIdForLogOperation();
            this.MakeSewadarHeaderReadonly(true);
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.CreateAndLoadRecorderControls(false);
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            if (!string.IsNullOrEmpty(screenParameters))
            {
                string[] tokens = screenParameters.Split(new char[] { ',' });
                this.SatsangCentreId = int.Parse(tokens[0]);
                this.SewadarGrNo = tokens[1];
                this.AttributeGroup = tokens[2]; 
            }
            this.MakeSewadarHeaderReadonly(true);
            this.ShowListView(this.scListOrBrowse, false);
            switch (uiMode)
            {
                case UIModes.Insert:                    
                    ClearControls();
                    
                    this.sewadarHeader1.txtName.ReadOnly = false;
                    this.sewadarHeader1.txtGRNo.ReadOnly = false;
                    this.sewadarHeader1.intSewadarId.ReadOnly = false;
                    this.CreateAndLoadRecorderControls(false);
                    break;
                case UIModes.Query:
                    this.MakeSewadarHeaderReadonly(false);
                    base.ClearControls();
                    this.RemoveAllRecorders();
                    this.sewadarHeader1.txtSatsangCentre.DisplayText = ZSMUtility.GetSatsangCentreName();
                    break;
                case UIModes.Retrieve:
                    break;
                case UIModes.Browse:
                    this.MakeSewadarHeaderReadonly(true);
                    this.ShowListView(this.scListOrBrowse, false);
                    break;
                case UIModes.List:
                    this.ShowListView(this.scListOrBrowse, true);
                    break;
                case UIModes.New:
                    ClearControls();
                    if (!string.IsNullOrEmpty(screenParameters))
                    {
                        this.sewadarHeader1.SetNameAndFireEvent(null, this.SatsangCentreId, this.SewadarGrNo);

                        this.sewadarHeader1.txtName.ReadOnly = false;
                        this.sewadarHeader1.txtGRNo.ReadOnly = false;
                        this.sewadarHeader1.intSewadarId.ReadOnly = false;
                        this.CreateAndLoadRecorderControls(false);
                    }                    
                    break;
                case UIModes.Update:
                    this.MakeSewadarHeaderReadonly(true);
                    break;
                case UIModes.Reference:
                    this.sewadarHeader1.SetNameAndFireEvent(null, this.SatsangCentreId, this.SewadarGrNo);
                    this.CreateAndLoadRecorderControls(true);
                    break;
                case UIModes.Params:
                    break;
                case UIModes.Report:
                    break;
                case UIModes.Tabular:
                    break;
                case UIModes.None:
                    break;
                default:
                    break;
            }
        }

        public override void ExecuteScreenAction(string actionId)
        {
            switch (actionId)
            {
                case "Sewadar":
                    UIManager.OpenForm(typeof(Sewadars), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, this.sewadarHeader1.intSewadarId.DisplayText, this, this);
                    break;
                case "Sewadar Details":
                    DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select 1 from ViewSewadarsDetail where sewadar_id = " + this.sewadarHeader1.intSewadarId.DisplayText).Tables[0];
                    if (dT.Rows.Count > 0)
                    {
                        UIManager.OpenForm(typeof(SewadarsDetails), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, this.sewadarHeader1.intSewadarId.DisplayText, this, this);
                    }
                    else
                    {
                        UIManager.OpenForm(typeof(SewadarsDetails), UIModes.New, GlobalAppVariables.AppContext.ApplicationId, this.sewadarHeader1.intSewadarId.DisplayText, this, this);
                    }
                    break;
                case "Sewadar Information":
                    int? currSatsangCentre = this.sewadarHeader1.SatsangCentreId;
                    string grNo = this.sewadarHeader1.txtGRNo.DisplayText;
                    if (DbManager.IsNotNull(currSatsangCentre) && !string.IsNullOrEmpty(grNo))
                    {
                        UIManager.OpenForm(typeof(SewadarsInformation), UIModes.Update, GlobalAppVariables.AppContext.ApplicationId, grNo + "|" + currSatsangCentre, this, this);
                    }
                    break;
                case "Sewadar History":
                    UIManager.OpenForm(typeof(SewadarHistory), UIModes.Reference, GlobalAppVariables.AppContext.ApplicationId, ZSMUtility.GetSatsangCentreId().ToString() + "|" + this.sewadarHeader1.txtGRNo.DisplayText, this, this);
                    break;
            }
        }


        void sewadarHeader1_SewadarSelectionChanged(object sender, DCC.ZOS.ZSM.Controls.Misc.SewadarHeader.SewadarSelectionChangedEventArgs e)
        {
            this.SewadarGrNo = this.sewadarHeader1.txtGRNo.DisplayText;
            if (CurrentUIMode == UIModes.Insert || CurrentUIMode == UIModes.New)
            {
                DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL(string.Format("select 1 from ViewSewadarsParticulars where sewadar_grno = '{0}' AND satsang_centre_id = {1}", this.sewadarHeader1.txtGRNo.DisplayText, ZSMUtility.GetSatsangCentreId())).Tables[0];
                if (dT.Rows.Count > 0)
                {
                    bool isNotCalledFromValidatingOfALookup = this.Validate();
                    //[[If user has tabbed out of one of the 3 Sewadar lookups in Sewadar Header, SewadarSelectionChanged event gets
                    //called by the Validating event of the Lookup. In that case this.Validate() of FireRetrieveMode() always returns
                    //false and no data is retrieved. Hence call FireRetrieveMode() only when this.Validate() returns true
                    if (isNotCalledFromValidatingOfALookup)
                    {
                        this.sewadarHeader1.UseFocusLostEvent = false;
                        this.CurrentUIMode = (this.CurrentUIMode == UIModes.New) ? UIModes.Update : UIModes.Query;
                        GlobalAppVariables.ObjMDIMain.FireRetrieveMode();
                    }
                    //]]
                    //[[Setting UseFocusLostEvent property true causes SewadarSelectionChanged event to be called again on FocusLost
                    //event of Lookup (FocusLost event is called after Validating event). Hence the control will come back to
                    //this method and above if condition will be true this time. Also note that we are setting back UseFocusLostEvent
                    //property to false when if condition holds true.
                    else
                    {
                        this.sewadarHeader1.UseFocusLostEvent = true;
                    }
                    //]]
                }
            }
            this.ObjectIdForLogOperation = this.CreateObjectIdForLogOperation();
            LoadImage();
            //Thread thread = new Thread(new ThreadStart(LoadImage));
            //thread.Start();
        }

        private void LoadImage()
        {
            ZSMUtility.LoadOnlySewadarImageFromDBToPictureBox(this.sewadarHeader1.intSewadarId.IdTextAsInteger, ref this.pictureBox1);
        }

        private void MakeSewadarHeaderReadonly(bool readOnly)
        {
            this.sewadarHeader1.txtGRNo.ReadOnly = readOnly;
            this.sewadarHeader1.TxtName.ReadOnly = readOnly;
            this.sewadarHeader1.txtSatsangCentre.ReadOnly = true;
            this.sewadarHeader1.txtSewadarStatus.ReadOnly = readOnly;
            this.sewadarHeader1.intAge.ReadOnly = readOnly;
            this.sewadarHeader1.intSewadarId.ReadOnly = readOnly;
            this.sewadarHeader1.cmbGender.ReadOnly = readOnly;
        }

        public override void CreateData()
        {
            dbFacade.ClearDbTasks();
            dbFacade.AddDbTask(dbFacade.InsertSewadarsParticularAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.TxtGRNo.DisplayText));
            List<string> allTasks = GetDeleteAndInsertTasksForSewadarParticulars();
            dbFacade.AddDbTasks(allTasks);
            this.ObjectIdForLogOperation = CreateObjectIdForLogOperation();
            if (allTasks.Count != 1)
                dbFacade.ExecuteDbTasks();
            this.sewadarHeader1.Focus();
        }
        public List<string> GetDeleteAndInsertTasksForSewadarParticulars()
        {
            List<string> returnList = new List<string>();
            returnList.Add(dbFacade.DeleteSewadarAttributesAsTask(this.sewadarHeader1.txtGRNo.DisplayText, ZSMUtility.GetSatsangCentreId(), this.AttributeGroup));
            foreach (AttributeRecorder recorder in lstAllRecorders)
            {
                string task = recorder.GetInsertSQLString();
                if(!string.IsNullOrEmpty(task))
                    returnList.Add(task);
            }
            return returnList;
        }

        public override void UpdateData()
        {
            dbFacade.ClearDbTasks();
            List<string> allTasks =  GetDeleteAndInsertTasksForSewadarParticulars();
            dbFacade.AddDbTasks(allTasks);
            if (allTasks.Count == 1)
                this.dbFacade.AddDbTask(this.dbFacade.DeleteSewadarsParticularAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.TxtGRNo.DisplayText, this.grdList.AsTxnTs("txn_ts")));
            else
                this.dbFacade.AddDbTask(this.dbFacade.UpdateSewadarsParticularAsTask(ZSMUtility.GetSatsangCentreId(), this.sewadarHeader1.TxtGRNo.DisplayText, this.grdList.AsTxnTs("txn_ts")));
            dbFacade.ExecuteDbTasks();
            this.sewadarHeader1.Focus();
            if (allTasks.Count == 1)
                GlobalAppVariables.ObjMDIMain.FireQueryMode();
        }

        public override bool DeleteData()
        {
            dbFacade.DeleteSewadarAttributes(this.sewadarHeader1.txtGRNo.DisplayText, ZSMUtility.GetSatsangCentreId(), this.AttributeGroup);
            return true;
        }

        //private string GrNo { get; set; }
        private void CreateAndLoadRecorderControls(bool readOnlyRecorder)
        {
            this.tlpRecorders.Visible = false;
            try
            {
                //[[First remove all the recorders from the tlpRecorders panel
                RemoveAllRecorders();
                //]]
                DataSet dset = this.dbFacade.GetSewadarAttributes(this.sewadarHeader1.txtGRNo.DisplayText, ZSMUtility.GetSatsangCentreId(), this.AttributeGroup);
                DataTable dt = dset.Tables[0];
                foreach (DataRow existingValuesRow in dt.Rows)
                {
                    short attributeId = DbManager.GetShort(existingValuesRow["attribute_id"]);
                    AttributeRecorder recorder = AttributeRecorder.CreateRecorder(attributeId, ZSMUtility.GetSatsangCentreId().Value,
                               this.sewadarHeader1.txtGRNo.DisplayText, existingValuesRow);
                    EventHandler<EventArgs> recorderDataChangedEventHandler = new EventHandler<EventArgs>(recorder_DataChanged);
                    recorder.RecorderDataChanged += recorderDataChangedEventHandler;
                    lstAllRecorders.Add(recorder);
                    if (readOnlyRecorder)
                    {
                        recorder.MarkAllFieldsReadOnly();
                    }
                }
                foreach (AttributeRecorder recorder in lstAllRecorders)
                {
                    this.tlpRecorders.RowCount += 1;
                    this.tlpRecorders.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 23F));                                
                    this.tlpRecorders.Controls.Add(recorder, 0, this.tlpRecorders.RowCount - 1);                    
                    recorder.Dock = System.Windows.Forms.DockStyle.Fill;                    
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                this.tlpRecorders.Visible = true;
            }
        }
        void recorder_DataChanged(object sender, EventArgs e)
        {
            //if (this.cmbRecordingState.SelectedText == "Pending" || this.cmbRecordingState.SelectedValue == null)
            //{
            //    this.cmbRecordingState.SelectedText = "Recorded";
            //}
        }
        private void RemoveAllRecorders()
        {
            List<Control> lstControlsToRemove = new List<Control>();
            foreach (Control control in tlpRecorders.Controls)
            {
                if (control.GetType() == typeof(AttributeRecorder))
                {
                    lstControlsToRemove.Add(control);
                }
            }
            foreach (Control c in lstControlsToRemove)
            {
                this.tlpRecorders.Controls.Remove(c);
                this.lstAllRecorders.Remove((AttributeRecorder)c);
            }
            tlpRecorders.RowCount = 0;
            foreach (RowStyle s in this.tlpRecorders.RowStyles)
            {
                s.Height = 23;
                s.SizeType = SizeType.Absolute;
            }
        }

        private string CreateObjectIdForLogOperation()
        {
            return string.Format("{0}|{1}|{2}", this.sewadarHeader1.txtGRNo.DisplayText, ZSMUtility.GetSatsangCentreId().Value.ToString(), this.AttributeGroup);
        }
        public override void SetLookupResult(DCC.UMB.CDF.Lookup.Modal.LookupResult result, Control targetControl)
        {
            base.SetLookupResult(result, targetControl);
            if (targetControl == this.sewadarHeader1.txtGRNo || targetControl == this.sewadarHeader1.txtName || targetControl == this.sewadarHeader1.intSewadarId)
            {
                this.CreateAndLoadRecorderControls(false);
            }
        }

          
    }
}
