using System;
using System.ComponentModel;
using System.Data;
using System.Windows.Forms;
using DCC.DBFacade;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.ZOS.ZSM.Controls.Misc
{
    public partial class DepartmentChooser : UserControl
    {
        ZSM_MUMDbFacade dbFacade = null;

        /// <summary>
        /// This class represents arguments passed when the PersonSelectionChangedEventArgs is raised. 
        /// </summary>
        public class SubDepartmentChangedEventArgs : EventArgs
        {
            private int? subDepartmentId;
            /// <summary>
            /// Represents the person id
            /// </summary>
            public int? SubDepartmentId
            {
                get { return subDepartmentId; }
                internal set { subDepartmentId = value; }
            }
        }

        string applicationIdForDbConnection = null;
        [Browsable(false)]
        [ReadOnly(true)]
        public string ApplicationIdForDbConnection
        {
            get
            {
                return this.applicationIdForDbConnection;
            }
            set
            {
                this.applicationIdForDbConnection = value;
            }
        }

        public DepartmentChooser()
        {
            InitializeComponent();
            this.Load += new EventHandler(DepartmentChooser_Load);
        }

        void DepartmentChooser_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(this.applicationIdForDbConnection))
                {
                    this.applicationIdForDbConnection = GlobalAppVariables.AppContext.ApplicationId;
                }
                dbFacade = new ZSM_MUMDbFacade(this.ApplicationIdForDbConnection);
            }
            catch
            {
                //do nothing
            }
        }


        public int? SatsangCentreId
        {
            get;
            set;
        }

        public string DepartmentCode
        {
            get;
            set;
        }

        public short? SelectedDepartment
        {
            get
            {
                return this.lkpDepartment.IdTextAsShort;
            }
            set
            {
                this.lkpDepartment.IdText = value.ToString();
            }
        }

        public short? SelectedSubDepartment
        {
            get
            {
                if (this.lkpSubDepartment.Enabled)
                    return this.lkpSubDepartment.IdTextAsShort;
                else
                    return null;
            }
            set
            {
                this.lkpSubDepartment.IdText = value.ToString();
            }
        }


        public string DepartmentBindingKey
        {
            get
            {
                return this.lkpDepartment.DisplayTextBindingKey;
            }
            set
            {
                this.lkpDepartment.DisplayTextBindingKey = value;
            }
        }


        public string SubDepartmentBindingKey
        {
            get
            {
                return this.lkpSubDepartment.DisplayTextBindingKey;
            }
            set
            {
                this.lkpSubDepartment.DisplayTextBindingKey = value;
            }
        }

        public string SelectedDepartmentName
        {
            get
            {
                return this.lkpDepartment.DisplayText;
            }
            set
            {
                ZSMUtility.setDisplayValueText(this.lkpDepartment, value);
            }
        }

        public string SelectedSubDepartmentName
        {
            get
            {
                if (this.lkpSubDepartment.Enabled)
                    return this.lkpSubDepartment.DisplayText;
                else
                    return default(string);
            }
            set
            {
                ZSMUtility.setDisplayValueText(this.lkpSubDepartment, value);
            }
        }
        public bool IsValid()
        {
            if (this.Manadatory)
            {
                return this.SelectedDepartment.HasValue;
            }
            return true;

        }
        public bool ReadOnly
        {
            get
            {
                return this.lkpDepartment.ReadOnly;
            }
            set
            {
                this.lkpDepartment.ReadOnly = value;
                this.lkpSubDepartment.ReadOnly = value;
            }
        }
        public void ClearControl()
        {
            this.lkpSubDepartment.Visible = true;
            this.lkpSubDepartment.Enabled = true;
            this.lkpDepartment.ClearControlValues();
            this.lkpSubDepartment.ClearControlValues();
        }

        public bool Manadatory
        {
            get
            {
                return this.lkpDepartment.Mandatory;
            }
            set
            {
                this.lkpDepartment.Mandatory = value;
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

        private void lkpSubDepartment_LookupDialogShowing(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.lkpDepartment.IdText))
            {
                e.LookupSqlString = e.LookupSqlString.Replace("(1=2)", string.Format("sd.department_id = {0} AND dsc.satsang_centre_id = {1} ", this.lkpDepartment.IdText, this.SatsangCentreId.GetValueOrDefault(0)));
            }
        }

        private void lkpDepartment_LookupDialogShowing(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupEventArgs e)
        {
            string defaultFilter = "dsc.satsang_centre_id = " + this.SatsangCentreId.GetValueOrDefault(0);
            if (!string.IsNullOrEmpty(DepartmentCode))
            {
                defaultFilter += " AND department_cd = '" + DepartmentCode + "'";
            }
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", defaultFilter);
        }

        private void lkpDepartment_LookupResultSet(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs e)
        {
            DataTable dT = this.dbFacade.ObjDBManager.ExecuteSQL("select * from sub_departments where department_id =  " + this.lkpDepartment.IdText).Tables[0];
            this.lkpSubDepartment.ReadOnly = !(dT.Rows.Count > 0);
            this.lkpSubDepartment.Mandatory = (e.LookupResult.SelectedRecords[0]["sub_department_mandatory"].ToString() == "Yes");
        }




    }
}
