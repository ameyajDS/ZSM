using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.ZOS.ZSM;
using DCC.UMB.CDF.MGMT.Global;
using DCC.ZOS.ZSM.Controls.Utils;
using System.Windows.Forms;


namespace DCC.ZOS.ZSM.ENT
{
    partial class SewaExemptions : ZSMAbstractScreen
    {

        public SewaExemptions()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_SEWA_EXEMPTIONS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            qualification_id = 0,
            qualification_type,
            qualification_cd,
            qualification_nm,
            remarks,
            effective_from,
            effective_till,
            txn_ts

        }

        #endregion

        #region Nested type:   grdApplicableSewasColNames

        private enum grdApplicableSewasColNames
        {
           grd_sewa_id = 0,
           grd_old_sewa_id,
           exemption_days
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
                this.intID.ReadOnly = true;
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
                this.intID.ReadOnly = false;
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

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = this.intID.DisplayText;
            this.LoadApplicableSewasGrid(this.intID.DisplayTextAsShort);
            this.intID.ReadOnly = true;
        }

        private void LoadApplicableSewasGrid(short? shtQualId)
        {
            DataSet dset;
            dset = this.dbFacade.QuerySewaExemptionsApplicableSewa(shtQualId);
            this.grdApplicableSewas.RetrieveRecords(dset.Tables[0], false, RowStates.Old);
        }
        

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewSewaExemptionSQLSelectQuery query = new ViewSewaExemptionSQLSelectQuery();

            //This line avoids the if condition and specifies that qualification_id is a primary/indexed key.
            query.sewa_exemption_id.IsExcluisive = true;

            query.sewa_exemption_id.Equal(this.intID.DisplayText);
            query.sewa_exemption_nm.Contains(this.txtName.DisplayText);
            query.sewa_exemption_type.Contains(this.cmbSewaExemptionType.SelectedValueAsStr);
            query.sewa_applicability.Contains(this.chkSewaApplicability.BlnString);
            query.is_computed.Contains(this.chkIsComputed.BlnString);           


            //[[This pair will specify that get me all those records which are effective as on a date,
            //specified by the date range pair (notice that at run time in query mode the pair hides one 
            //field and allows only one field to be entered)
            query.effective_from.LessThanEqualTo(this.dtmEffectiveRange.FromDate);
            query.effective_till.GreaterThanEqualTo(this.dtmEffectiveRange.FromDate);
            //]]
            return dbFacade.ExecuteSelectQuery(query);
            
        }


        public override void CreateData()
        {
            short  generatedId = default(short);
            this.dbFacade.InsertSewaExemption(ref generatedId,
                                                this.txtName.DisplayText,
                                                this.cmbSewaExemptionType.SelectedValueAsStr,
                                                this.chkSewaApplicability.BlnString,
                                                this.chkIsComputed.BlnString,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.AddDbTasks(SaveApplicableSewasGridAsTask((short?)generatedId));
            this.dbFacade.ExecuteDbTasks();
            //]] 
        }

        public override void UpdateData()
        {
            dbFacade.AddDbTasks(SaveApplicableSewasGridAsTask((short?)this.intID.DisplayTextAsInteger));
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            dbFacade.AddDbTask(this.dbFacade.UpdateSewaExemptionAsTask((short)this.intID.DisplayTextAsInteger.Value,
                                                this.txtName.DisplayText,
                                                this.cmbSewaExemptionType.SelectedValueAsStr,
                                                this.chkSewaApplicability.BlnString,
                                                this.chkIsComputed.BlnString,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate,
                                                txn_ts
                                                ));
            //[[All the grid updates in database is done in one shot.
            this.dbFacade.ExecuteDbTasks();
            //]]                

        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteSewaExemption((short)this.intID.DisplayTextAsInteger.Value, txn_ts);
            return true;
        }

        private List<string> SaveApplicableSewasGridAsTask(short? sewaExemptionId)
        {
            List<string> allTasks = new List<string>();
            try
            {
                if (this.grdApplicableSewas.Rows.Count > 0)
                {
                    Hashtable overiddingParamValues = new Hashtable();
                    overiddingParamValues.Add("sewa_exemption_id", sewaExemptionId);
                    allTasks = this.grdApplicableSewas.GetAllDBTasks(this.dbFacade, "DeleteSewaExemptionsApplicableSewaAsTask", "UpdateSewaExemptionsApplicableSewaAsTask", "InsertSewaExemptionsApplicableSewaAsTask", overiddingParamValues, string.Empty, string.Empty, string.Empty);

                }

                return allTasks;
            }
            catch
            {
                throw;
            }          
            
        }      

         
    }
}