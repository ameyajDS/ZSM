using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DCC.UMB.CDF.UIControls.Grid;

namespace DCC.UMB.CDF.MGMT.TAF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ITAFService" in both code and config file together.
    [ServiceContract]
    public interface ITAFGridService
    {
      
        [OperationContract]
        int GetRowCount(string gridAutomationId);

        [OperationContract]
        void SetCellInFocus(string gridAutomationId, int rowPositon, string columnName);

        [OperationContract]
        int InsertRowLast(string gridAutomationId);//returns the position of the inserted row
        
        [OperationContract]
        int InsertRowAbove(string gridAutomationId);//returns the position of the inserted row 

        [OperationContract]
        int InsertRowBelow(string gridAutomationId);//returns the position of the inserted row



        [OperationContract]
        void DeleteRow(string gridAutomationId);//Deletes the currently selected row 

        [OperationContract]
        string GetValueAsStr(string gridAutomationId, int rowPosition, string columnName);

        [OperationContract]
        int? GetValueAsInt(string gridAutomationId, int rowPosition, string columnName);

        [OperationContract]
        short? GetValueAsShort(string gridAutomationId,int rowPosition, string columnName);

        [OperationContract]
        double? GetValueAsDouble(string gridAutomationId, int rowPosition, string columnName);

        [OperationContract]
        DateTime? GetValueAsDateTime(string gridAutomationId, int rowPosition, string columnName);


        [OperationContract]
        void SetStringValue(string gridAutomationId, int rowPosition, string columnName, string value, bool tabOut);


        [OperationContract]
        void SetDropDownValue(string gridAutomationId, int rowPosition, string columnName, string value, bool tabOut);

        
        [OperationContract]
        void SetIntValue(string gridAutomationId, int rowPosition, string columnName, int? value, bool tabOut);

        [OperationContract]
        void SetDoubleValue(string gridAutomationId, int rowPosition, string columnName, double? value, bool tabOut);

        [OperationContract]
        void SetDateTimeValue(string gridAutomationId, int rowPosition, string columnName, DateTime? value, bool tabOut);

        [OperationContract]
        void SetShortValue(string gridAutomationId, int rowPosition, string columnName, short? value, bool tabOut);
        
        [OperationContract]
        void SetCheckboxValue(string gridAutomationId, int rowPosition, string columnName, bool isChecked, bool tabOut);

        [OperationContract]
        int? FindText(string gridAutomationId, string columnName, string searchText, bool ignoreCase);

        [OperationContract]
        int GetRowCountForState(string gridAutomationId, string state);
        
    }
}
