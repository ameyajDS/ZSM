using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DCC.UMB.CDF.UIControls.Windows;
using Microsoft.Reporting.WinForms;

namespace DCC.UMB.CDF.Report
{
    internal class AbstractReportContainer : AbstractScreen
    {
        internal event EventHandler<ParameterValuesRequiredEventArgs> ParameterValueRequired;
        internal event EventHandler<ParameterValuesRequiredEventArgs> FormulaValueRequired;
        internal event EventHandler<DataTableRequiredEventArgs> ReportDataTableRequired;
        internal event EventHandler<ParameterValuesRequiredEventArgs> ZoomModeRequired;

        internal virtual void LoadReport(string reportServerURL, string reportFilePath)
        {
            throw new Exception("This method must be overloaded by a suitable report viewer container");
        }
        public override string ScreenId
        {
            get
            {
                return "NOT SUPPORTED IN PRINT MODE";
            }
        }

        public virtual bool EnableReportExport { get; set; }       

        internal object GetParameterValue(string parameterName)
        {
            EventHandler<ParameterValuesRequiredEventArgs> handler = ParameterValueRequired;
            if (handler != null)
            {
                ParameterValuesRequiredEventArgs args = new ParameterValuesRequiredEventArgs();
                args.ParameterName = parameterName;
                handler(this, args);
                return args.ParameterValues;
            }
            return null;
        }

        internal object GetFormulaValue(string formulaName)
        {
            EventHandler<ParameterValuesRequiredEventArgs> handler = FormulaValueRequired;
            if (handler != null)
            {
                ParameterValuesRequiredEventArgs args = new ParameterValuesRequiredEventArgs();
                args.ParameterName = formulaName;
                handler(this, args);
                return args.ParameterValues;
            }
            return null;
        }

        internal DataTable GetReportDataTable(string tableName)
        {
            EventHandler<DataTableRequiredEventArgs> handler = ReportDataTableRequired;
            if(handler!=null)
            {
                DataTableRequiredEventArgs args = new    DataTableRequiredEventArgs();
                args.DataTableName = tableName;
                handler(this, args);
                return args.ReportDataTable;
            }
            return null;
        }
        internal  ZoomMode GetZoomModeValue()
        {
            EventHandler<ParameterValuesRequiredEventArgs> handler = ZoomModeRequired;
            if (handler != null)
            {
                ParameterValuesRequiredEventArgs args = new ParameterValuesRequiredEventArgs();
                handler(this, args);
                return (ZoomMode)args.ParameterValues;
            }
            return ZoomMode.Percent;
        }
    }
    internal class ParameterValuesRequiredEventArgs : EventArgs
    {
        private string parameterName;
        private object parameterValues;
        public string ParameterName
        {
            get { return parameterName; }
            set { parameterName = value; }
        }

        public object ParameterValues
        {
            get { return parameterValues; }
            set { parameterValues = value; }
        }
    }

    internal class DataTableRequiredEventArgs : EventArgs
    {
        private string dataTableName;
        private DataTable reportDataTable;
        public string DataTableName
        {
            get { return dataTableName; }
            set { dataTableName = value; }
        }

        public DataTable ReportDataTable
        {
            get { return reportDataTable; }
            set { reportDataTable = value; }
        }
    }

}
