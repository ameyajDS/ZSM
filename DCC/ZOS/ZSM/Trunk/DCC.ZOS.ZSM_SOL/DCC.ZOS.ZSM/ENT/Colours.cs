using System;
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
    partial class Colours : ZSMAbstractScreen
    {

        public Colours()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_COLOURS;
            }
        }

        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            colour_id = 0,				
            colour_nm	,			
            red_component,			
            green_component		,
            blue_component		,	
            
            remarks				,
            txn_ts,
            effective_from,
            effective_till,
            old_colour_id,
            
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
            //this.intID.ReadOnly = true;
            if (uiMode == UIModes.Insert)
            {
                ClearControls();
                this.intID.ReadOnly = true;
                short currentColourId = default(short);
                this.dbFacade.GetMaxColourId(ref currentColourId);
                this.intID.DisplayText = currentColourId.ToString();
                
            }
            else if (uiMode == UIModes.Query)
            {
                this.intID.ReadOnly = false;
                ClearControls();
                //this.intID.ReadOnly = false;
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
            this.intID.ReadOnly = true;
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = this.intID.DisplayText;
            paintButton();
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewColourSQLSelectQuery query = new ViewColourSQLSelectQuery();

            //This line avoids the if condition and specifies that colour_id is a primary/indexed key.
            query.colour_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intID
            //field as the between clause bounds. 
            query.colour_id.Equal(this.intID.DisplayText);
            //]]

            query.colour_nm.Contains(this.txtName.DisplayText);

            query.red_component.Equal(this.intRedComponent.DisplayTextAsInteger);
            query.blue_component.Equal(this.intBlueComponent.DisplayTextAsInteger);
            query.green_component.Equal(this.intGreenComponent.DisplayTextAsInteger);
            
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
            this.dbFacade.InsertColour(this.intID.DisplayTextAsShort,
                                                this.txtName.DisplayText,
                                                this.intRedComponent.DisplayTextAsByte,
                                                this.intGreenComponent.DisplayTextAsByte,
                                                this.intBlueComponent.DisplayTextAsByte,
                                                this.txtRemarks.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = this.intID.DisplayText;
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            short? oldColourId = this.grdList.AsShort(grdListColNames.old_colour_id.ToString());
            this.dbFacade.UpdateColour(this.intID.DisplayTextAsShort,
                                                this.txtName.DisplayText,
                                                this.intRedComponent.DisplayTextAsByte,
                                                this.intGreenComponent.DisplayTextAsByte,
                                                this.intBlueComponent.DisplayTextAsByte, 
                                                this.txtRemarks.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate,
                                                txn_ts,
                                                oldColourId
                                               );

        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            short? oldColourId = this.grdList.AsShort(grdListColNames.old_colour_id.ToString());
            this.dbFacade.DeleteColour(oldColourId, txn_ts);
            return true;
        }

        private void paintButton()
        {
            if (this.intRedComponent.DisplayTextAsInteger.HasValue &&
                this.intBlueComponent.DisplayTextAsInteger.HasValue &&
                this.intGreenComponent.DisplayTextAsInteger.HasValue)
            {
                this.btnColor.BackColor = System.Drawing.Color.FromArgb(this.intRedComponent.DisplayTextAsInteger.Value, this.intGreenComponent.DisplayTextAsInteger.Value, this.intBlueComponent.DisplayTextAsInteger.Value);
            }
        }

        private void intBlueComponent_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            paintButton();
        }

        private void intGreenComponent_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            paintButton();
        }

        private void intRedComponent_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            paintButton();
        }

        
      
       

    
    }
}