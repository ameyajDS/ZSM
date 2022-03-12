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

namespace DCC.ZOS.ZSM.ENT
{
    public partial class QualificationSubjects : CDBAbstractScreen
    {
        public QualificationSubjects()
        {
            InitializeComponent();
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_QUALIFICATION_SUBJECTS;
            }
        }
        #region Nested type: grdListColNames

        private enum grdListColNames
        {
            occupation_id = 0,
            occupation_cd,
            occupation_nm,
            txn_ts,
            effective_from,
            effective_till           
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
            this.intID.ReadOnly = true;
        }


        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewQlfctnSubjectSQLSelectQuery query = new ViewQlfctnSubjectSQLSelectQuery();

            //This line avoids the if condition and specifies that qlfctn_subject_id is a primary/indexed key.
            query.qlfctn_subject_id.IsExcluisive = true;

            //[[Notice we are passing a control as parameter and not a value.
            //CDF will take care of wrapping the two values specified in intID 
            //field as the between clause bounds. 
            query.qlfctn_subject_id.Equal(this.intID.DisplayText);
            //]]

            query.qlfctn_subject_nm.Contains(this.txtName.DisplayText);
            query.qlfctn_subject_cd.Contains(this.txtCode.DisplayText);
            query.description.Contains(this.txtDescription.DisplayText);
          
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
            short generatedId = default(short);
            this.dbFacade.InsertQlfctnSubject(ref generatedId,
                                                this.txtCode.DisplayText,
                                                this.txtName.DisplayText,   
                                                this.txtDescription.DisplayText,
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
            this.ObjectIdForLogOperation = generatedId.ToString();
        }
        public override void UpdateData()
        {            
            this.dbFacade.UpdateQlfctnSubject((short)this.intID.DisplayTextAsInteger.Value,
                                                this.txtCode.DisplayText,
                                                this.txtName.DisplayText,
                                                this.txtDescription.DisplayText,                                                
                                                this.dtmEffectiveRange.FromDate,
                                                this.dtmEffectiveRange.ToDate);
                                               
        }
        public override void DeleteData()
        {
            
            this.dbFacade.DeleteQlfctnSubject((short)this.intID.DisplayTextAsInteger.Value);
                                             
        }

          
    }
}