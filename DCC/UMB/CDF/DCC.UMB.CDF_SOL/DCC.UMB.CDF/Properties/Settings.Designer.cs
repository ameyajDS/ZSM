//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.225
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DCC.UMB.CDF.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "10.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.WebServiceUrl)]
        [global::System.Configuration.DefaultSettingValueAttribute("http://localhost/DCC.UMB.CDFWS/DBManager/DbManagerWS.asmx")]
        public string DCC_CMN_CDF_DbManagerWebService_DbManagerWS {
            get {
                return ((string)(this["DCC_CMN_CDF_DbManagerWebService_DbManagerWS"]));
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("sa")]
        public string UN {
            get {
                return ((string)(this["UN"]));
            }
            set {
                this["UN"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("sa")]
        public string PW {
            get {
                return ((string)(this["PW"]));
            }
            set {
                this["PW"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("(local)")]
        public string SN {
            get {
                return ((string)(this["SN"]));
            }
            set {
                this["SN"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("SAM")]
        public string AID {
            get {
                return ((string)(this["AID"]));
            }
            set {
                this["AID"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("c:\\")]
        public string PDP {
            get {
                return ((string)(this["PDP"]));
            }
            set {
                this["PDP"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("\"C:\\CruiseControlBase\\WorkingBase\\DERA_APPS\\DCC\\SSM\\RMS\\Branches\\v2.00\\DCC.SSM.RM" +
            "S_SOL\\DCC.SSM.RMS\\DCC.SSM.RMS.csproj\"")]
        public string DEBUG {
            get {
                return ((string)(this["DEBUG"]));
            }
            set {
                this["DEBUG"] = value;
            }
        }
    }
}
