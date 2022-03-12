using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.Utils;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls;
using Microsoft.Reporting.WinForms;

namespace DCC.UMB.CDF.Report
{
    public class AbstractParametersScreen : AbstractScreen
    {
        
        protected override void InitializeDbFacade()
        {
            //
        }
        
        public virtual bool IsReadyToPrint()
        {
            return true;
        }

        public virtual object GetReportFormulaValues(string FormulaName)
        {
            return null;
        }

        /// <summary>
        /// This method is called when the child screen is in parameter mode and 
        /// user clicks on the Print/PrintPreview buttons of the tool bar.
        /// This method is called as many times as number of parameters defined in
        /// the report. The child screen (the parameter screen) must return the value
        /// of the parameter whose name is passed to this method. A good implementation
        /// would be to have a switch statement on the parameter name .
        /// Further, the return type is an object, this specifies that the any type of 
        /// parameter can be specified.
        /// For parameters which can take on multiple values return array of values.
        /// </summary>
        /// <param name="parameterName"></param>
        /// <returns></returns>
        public virtual object GetReportParameterValues(string parameterName)
        {
            switch (parameterName)
            {
                case "Font":
                    return "Verdana";
                case "ExtraLargeFont":
                    return "16pt";
                case "LargeFont":
                    return "11pt";
                case "MediumFont":
                    return "10pt";
                case "SmallFont":
                    return "9pt";
                case "TinyFont":
                    return "6pt";
                case "ReportId":
                    return this.ScreenId;
                case "ReportTitle":
                    return GlobalAppVariables.AppContext.GetScreenName(this.ApplicationId, this.ScreenId);
            }
            //[[Now go through all the control of this screen and see if the control has the idtextbindingkey defined. If yes,
            //the binding key will be equal to the name of the parameter. If a matching key is found, then return the value automatically
            List<Control> lstAllControls = new List<Control>();
            UtilityManager.GetAllControlsInContainer(this, lstAllControls);
            Control matchingControl = GetCorrespondingControlForReportParameter(parameterName, lstAllControls);
            if (matchingControl != null)
            {
                if (matchingControl is DCCTextField && 
                    ((DCCTextField)matchingControl).Lookup &&
                    ((DCCTextField)matchingControl).LookupResult!=null)
                {
                    return ((DCCTextField)matchingControl).LookupResult.ValueMember.ToString();
                }
                if (matchingControl is DCCTextField &&
                    !((DCCTextField)matchingControl).Lookup )
                {
                    return ((DCCTextField)matchingControl).DisplayText;
                }
                else if (matchingControl is DCCListBox)
                {
                    return ((DCCListBox)matchingControl).GetItemsAsXML(false);
                }
                else if (matchingControl is DCCDateTimeField)
                {
                    DateTime? dtm = ((DCCDateTimeField)matchingControl).DisplayTextAsDateTime;
                    if(dtm.HasValue)
                    {
                        return dtm.Value.ToString("dd-MMM-yyyy");
                    }
                    else
                    {
                        return null;
                    }                    
                }
                else if (matchingControl is DCCCheckBox)
                {
                    return ((DCCCheckBox)matchingControl).Checked.ToString();
                }
                else if (matchingControl is DCCComboBox)
                {
                    object selectedValue = ((DCCComboBox)matchingControl).SelectedValue;
                    return selectedValue == null ? null : selectedValue.ToString();
                }
                else if (matchingControl is DateRangePair)
                {
                    DateTime? dtm =((DateRangePair)matchingControl).GetDateTimeForBindingKey(parameterName);
                    if(dtm.HasValue)
                    {
                        return dtm.Value.ToString("dd-MMM-yyyy");
                    }
                    else
                    {
                        return null;
                    } 
                }
            }
            
            //]]
            return null;
        }

        private Control GetCorrespondingControlForReportParameter(string parameterName, List<Control> lstAllControls)
        {
            foreach (Control ctrl in lstAllControls)
            {
                if (ctrl is IDCCDataBinder)
                {
                    string idTextBindingKeyOfControl = ((IDCCDataBinder)ctrl).IdTextBindingKey;
                    if (!string.IsNullOrEmpty(idTextBindingKeyOfControl) && idTextBindingKeyOfControl==parameterName)
                    {
                        return ctrl;
                    }
                }
                else if (ctrl is DateRangePair)
                {
                    string fromDateFieldBindingKey = ((DateRangePair)ctrl).FromDateFieldBindingKey;
                    string toDateFieldBindingKey = ((DateRangePair)ctrl).ToDateFieldBindingKey;
                    if (!string.IsNullOrEmpty(fromDateFieldBindingKey) && fromDateFieldBindingKey == parameterName)
                    {
                        return ctrl;
                    }
                    else if (!string.IsNullOrEmpty(toDateFieldBindingKey) && toDateFieldBindingKey == parameterName)
                    {
                        return ctrl;
                    }
                }
            }
            return null;
        }

        public virtual DataTable GetReportDataTable(string tableName)
        {
            return new DataTable();
        }

        /// <summary>
        /// This is the complete path of the report file. This path can be on local or a valid UNC
        /// Further the report can be either a rpt file (created using Crystal Reprots) or a
        /// rdl/rdlc file created using Microsoft Reporting Services solution. The appropriate 
        /// viewer would be used to render the report.
        /// </summary>
        public virtual string ReportPath
        {
            get
            {
                throw new Exception("Property 'Report Path' must be overridden by a Screen implementing parameters mode");
            }
        }       
        public virtual string ReportServerURL
        {
            get
            {
                throw new Exception("Property 'Report Server URL' must be overridden by a Screen implementing parameters mode");
            }
        }
        /// <summary>
        /// This method is registered to MDIMain's method FirePrint() as a delegate
        /// and will be invoked when the report container wants to get the report
        /// parameters. This method internally called virtual method of this same class
        /// to get it from the inheriting class, which in-fact is the parameter screen.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        internal void reportContainer_ParameterValueRequired(object sender, ParameterValuesRequiredEventArgs e)
        {
            e.ParameterValues = this.GetReportParameterValues(e.ParameterName);
        }

        internal void reportContainer_FormulaValueRequired(object sender, ParameterValuesRequiredEventArgs e)
        {
            e.ParameterValues = this.GetReportFormulaValues(e.ParameterName);
        }

        internal void reportContainer_DataTableRequired(object sender, DataTableRequiredEventArgs e)
        {
            e.ReportDataTable = this.GetReportDataTable(e.DataTableName);
        }

        internal void reportContainer_ZoomMode(object sender, ParameterValuesRequiredEventArgs e)
        {
            e.ParameterValues = this.GetZoomModeValue();
        }

        public virtual ZoomMode GetZoomModeValue()
        {
            return ZoomMode.Percent;
        }
       
    }
}
