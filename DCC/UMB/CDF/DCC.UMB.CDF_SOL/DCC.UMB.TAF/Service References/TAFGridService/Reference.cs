//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.239
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DCC.UMB.TAF.TAFGridService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="TAFGridService.ITAFGridService")]
    public interface ITAFGridService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/GetRowCount", ReplyAction="http://tempuri.org/ITAFGridService/GetRowCountResponse")]
        int GetRowCount(string gridAutomationId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/SetCellInFocus", ReplyAction="http://tempuri.org/ITAFGridService/SetCellInFocusResponse")]
        void SetCellInFocus(string gridAutomationId, int rowPositon, string columnName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/InsertRowLast", ReplyAction="http://tempuri.org/ITAFGridService/InsertRowLastResponse")]
        int InsertRowLast(string gridAutomationId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/InsertRowAbove", ReplyAction="http://tempuri.org/ITAFGridService/InsertRowAboveResponse")]
        int InsertRowAbove(string gridAutomationId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/InsertRowBelow", ReplyAction="http://tempuri.org/ITAFGridService/InsertRowBelowResponse")]
        int InsertRowBelow(string gridAutomationId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/DeleteRow", ReplyAction="http://tempuri.org/ITAFGridService/DeleteRowResponse")]
        void DeleteRow(string gridAutomationId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/GetValueAsStr", ReplyAction="http://tempuri.org/ITAFGridService/GetValueAsStrResponse")]
        string GetValueAsStr(string gridAutomationId, int rowPosition, string columnName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/GetValueAsInt", ReplyAction="http://tempuri.org/ITAFGridService/GetValueAsIntResponse")]
        System.Nullable<int> GetValueAsInt(string gridAutomationId, int rowPosition, string columnName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/GetValueAsShort", ReplyAction="http://tempuri.org/ITAFGridService/GetValueAsShortResponse")]
        System.Nullable<short> GetValueAsShort(string gridAutomationId, int rowPosition, string columnName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/GetValueAsDouble", ReplyAction="http://tempuri.org/ITAFGridService/GetValueAsDoubleResponse")]
        System.Nullable<double> GetValueAsDouble(string gridAutomationId, int rowPosition, string columnName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/GetValueAsDateTime", ReplyAction="http://tempuri.org/ITAFGridService/GetValueAsDateTimeResponse")]
        System.Nullable<System.DateTime> GetValueAsDateTime(string gridAutomationId, int rowPosition, string columnName);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/SetStringValue", ReplyAction="http://tempuri.org/ITAFGridService/SetStringValueResponse")]
        void SetStringValue(string gridAutomationId, int rowPosition, string columnName, string value, bool tabOut);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/SetDropDownValue", ReplyAction="http://tempuri.org/ITAFGridService/SetDropDownValueResponse")]
        void SetDropDownValue(string gridAutomationId, int rowPosition, string columnName, string value, bool tabOut);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/SetIntValue", ReplyAction="http://tempuri.org/ITAFGridService/SetIntValueResponse")]
        void SetIntValue(string gridAutomationId, int rowPosition, string columnName, System.Nullable<int> value, bool tabOut);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/SetDoubleValue", ReplyAction="http://tempuri.org/ITAFGridService/SetDoubleValueResponse")]
        void SetDoubleValue(string gridAutomationId, int rowPosition, string columnName, System.Nullable<double> value, bool tabOut);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/SetDateTimeValue", ReplyAction="http://tempuri.org/ITAFGridService/SetDateTimeValueResponse")]
        void SetDateTimeValue(string gridAutomationId, int rowPosition, string columnName, System.Nullable<System.DateTime> value, bool tabOut);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/SetShortValue", ReplyAction="http://tempuri.org/ITAFGridService/SetShortValueResponse")]
        void SetShortValue(string gridAutomationId, int rowPosition, string columnName, System.Nullable<short> value, bool tabOut);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/SetCheckboxValue", ReplyAction="http://tempuri.org/ITAFGridService/SetCheckboxValueResponse")]
        void SetCheckboxValue(string gridAutomationId, int rowPosition, string columnName, bool isChecked, bool tabOut);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/FindText", ReplyAction="http://tempuri.org/ITAFGridService/FindTextResponse")]
        System.Nullable<int> FindText(string gridAutomationId, string columnName, string searchText, bool ignoreCase);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITAFGridService/GetRowCountForState", ReplyAction="http://tempuri.org/ITAFGridService/GetRowCountForStateResponse")]
        int GetRowCountForState(string gridAutomationId, string state);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ITAFGridServiceChannel : DCC.UMB.TAF.TAFGridService.ITAFGridService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class TAFGridServiceClient : System.ServiceModel.ClientBase<DCC.UMB.TAF.TAFGridService.ITAFGridService>, DCC.UMB.TAF.TAFGridService.ITAFGridService {
        
        public TAFGridServiceClient() {
        }
        
        public TAFGridServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public TAFGridServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public TAFGridServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public TAFGridServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public int GetRowCount(string gridAutomationId) {
            return base.Channel.GetRowCount(gridAutomationId);
        }
        
        public void SetCellInFocus(string gridAutomationId, int rowPositon, string columnName) {
            base.Channel.SetCellInFocus(gridAutomationId, rowPositon, columnName);
        }
        
        public int InsertRowLast(string gridAutomationId) {
            return base.Channel.InsertRowLast(gridAutomationId);
        }
        
        public int InsertRowAbove(string gridAutomationId) {
            return base.Channel.InsertRowAbove(gridAutomationId);
        }
        
        public int InsertRowBelow(string gridAutomationId) {
            return base.Channel.InsertRowBelow(gridAutomationId);
        }
        
        public void DeleteRow(string gridAutomationId) {
            base.Channel.DeleteRow(gridAutomationId);
        }
        
        public string GetValueAsStr(string gridAutomationId, int rowPosition, string columnName) {
            return base.Channel.GetValueAsStr(gridAutomationId, rowPosition, columnName);
        }
        
        public System.Nullable<int> GetValueAsInt(string gridAutomationId, int rowPosition, string columnName) {
            return base.Channel.GetValueAsInt(gridAutomationId, rowPosition, columnName);
        }
        
        public System.Nullable<short> GetValueAsShort(string gridAutomationId, int rowPosition, string columnName) {
            return base.Channel.GetValueAsShort(gridAutomationId, rowPosition, columnName);
        }
        
        public System.Nullable<double> GetValueAsDouble(string gridAutomationId, int rowPosition, string columnName) {
            return base.Channel.GetValueAsDouble(gridAutomationId, rowPosition, columnName);
        }
        
        public System.Nullable<System.DateTime> GetValueAsDateTime(string gridAutomationId, int rowPosition, string columnName) {
            return base.Channel.GetValueAsDateTime(gridAutomationId, rowPosition, columnName);
        }
        
        public void SetStringValue(string gridAutomationId, int rowPosition, string columnName, string value, bool tabOut) {
            base.Channel.SetStringValue(gridAutomationId, rowPosition, columnName, value, tabOut);
        }
        
        public void SetDropDownValue(string gridAutomationId, int rowPosition, string columnName, string value, bool tabOut) {
            base.Channel.SetDropDownValue(gridAutomationId, rowPosition, columnName, value, tabOut);
        }
        
        public void SetIntValue(string gridAutomationId, int rowPosition, string columnName, System.Nullable<int> value, bool tabOut) {
            base.Channel.SetIntValue(gridAutomationId, rowPosition, columnName, value, tabOut);
        }
        
        public void SetDoubleValue(string gridAutomationId, int rowPosition, string columnName, System.Nullable<double> value, bool tabOut) {
            base.Channel.SetDoubleValue(gridAutomationId, rowPosition, columnName, value, tabOut);
        }
        
        public void SetDateTimeValue(string gridAutomationId, int rowPosition, string columnName, System.Nullable<System.DateTime> value, bool tabOut) {
            base.Channel.SetDateTimeValue(gridAutomationId, rowPosition, columnName, value, tabOut);
        }
        
        public void SetShortValue(string gridAutomationId, int rowPosition, string columnName, System.Nullable<short> value, bool tabOut) {
            base.Channel.SetShortValue(gridAutomationId, rowPosition, columnName, value, tabOut);
        }
        
        public void SetCheckboxValue(string gridAutomationId, int rowPosition, string columnName, bool isChecked, bool tabOut) {
            base.Channel.SetCheckboxValue(gridAutomationId, rowPosition, columnName, isChecked, tabOut);
        }
        
        public System.Nullable<int> FindText(string gridAutomationId, string columnName, string searchText, bool ignoreCase) {
            return base.Channel.FindText(gridAutomationId, columnName, searchText, ignoreCase);
        }
        
        public int GetRowCountForState(string gridAutomationId, string state) {
            return base.Channel.GetRowCountForState(gridAutomationId, state);
        }
    }
}
