using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DCC.UMB.TAF.View;

namespace DCC.ZOS.ZSM.TEST.ACT
{
    public class SewadarsInformation : TAFAbstractScreen
    {
        public SewadarsInformation(White.Core.Application application, string[] menuPath)
            : base(application, menuPath)
        {
            
        }

        public TAFTextField txtSewadarId { get { return this.GetTextField("intSewadarId"); } }

        public TAFComboBox zsmGenderComboBox { get { return this.GetComboBox("zsmGenderCombo1"); } }

        public TAFTextField txtName { get { return this.GetTextField("txtName"); } }

        public TAFTextField intAge { get { return this.GetTextField("dccLongIntegerField1"); } }
        
        public TAFTextField sewadarGlobalStatus { get { return this.GetTextField("txtSewadarStatus"); } }

        public TAFTextField statusDate { get { return this.GetTextField("dtmSewadarStatus"); } }

        public TAFTextField satsangCenter { get { return this.GetTextField("txtSatsangCentre"); } }   

        public TAFTextField txtGRNo { get { return this.GetTextField("txtGRNo"); } }

        public TAFTextField department { get { return this.GetTextField("lkpDepartment"); } }

        public TAFTextField subDepartment { get { return this.GetTextField("lkpSubDepartment"); } }

        public TAFTextField deptJoiningDate { get { return this.GetTextField("dtDepJoiningDate"); } }

        public TAFCheckBox outStationSewadar { get { return this.GetCheckBox("chkOutStationSewadar"); } }

        public TAFComboBox sewadarStatusComboBox { get { return this.GetComboBox("sewadarStatusCombo1"); } }

        public TAFTextField currentStatusDate { get { return this.GetTextField("dtmCurrentStatusDate"); } }

        public TAFTextField appDate { get { return this.GetTextField("dtAppDate"); } }

        public TAFComboBox responsibilityComboBox { get { return this.GetComboBox("responsibilityCombo1"); } }   

        public TAFTextField resposibilityDate { get { return this.GetTextField("dtmResposibility"); } }

        //Ref1

        public TAFTextField ref1satsangCenter { get { return this.GetTextField("ref1ZsmSatsangCentresLookup"); } }

        public TAFTextField ref1GrNoLookup { get { return this.GetTextField("ref1GrNoLookup1"); } }

        public TAFTextField txtRefName { get { return this.GetTextField("txtRefName"); } }

        public TAFTextField ref1Relations { get { return this.GetTextField("relationsLookup1"); } }

        public TAFTextField ref1Department { get { return this.GetTextField("txtRef1Department"); } }

        //Ref2

        public TAFTextField ref2satsangCenter { get { return this.GetTextField("ref2ZsmSatsangCentresLookup"); } }

        public TAFTextField ref2GrNoLookup { get { return this.GetTextField("ref2GrNoLookup1"); } }

        public TAFTextField txtRef2Name { get { return this.GetTextField("txtRef2Name"); } }

        public TAFTextField ref2Relations { get { return this.GetTextField("relationsLookup2"); } }

        public TAFTextField ref2Department { get { return this.GetTextField("txtRef2Department"); } }

        //Sponsorer

        public TAFTextField sponZsmSatsangCentres { get { return this.GetTextField("sponZsmSatsangCentresLookup"); } }

        public TAFTextField sponGrNn { get { return this.GetTextField("sponGrNoLookup"); } }

        public TAFTextField sponSewadarID { get { return this.GetTextField("sponSewadarIDLookup"); } }

        public TAFTextField sponSewadarName { get { return this.GetTextField("sponSewadarLookup"); } }

        public TAFTextField sponResponsibility { get { return this.GetTextField("sponResponsibilityCombo"); } }  

        public TAFTextField sponsorerStatus { get { return this.GetTextField("sponStatus"); } }

        public TAFTextField sponsorerYearsInSewa { get { return this.GetTextField("sponIntYearsInSewa"); } }


        //Sewa Samiti

        public TAFTextField ssZsmSatsangCentres { get { return this.GetTextField("ssZsmSatsangCentresLookup"); } }

        public TAFTextField ssGrNn { get { return this.GetTextField("ssGrNoLookup"); } }

        public TAFTextField ssSewadarID { get { return this.GetTextField("ssSewadarIDLookup"); } }

        public TAFTextField ssSewadarName { get { return this.GetTextField("ssSewadarLookup"); } }

     //   public TAFComboBox ssResponsibility { get { return this.GetComboBox("ssResponsibilityCombo"); } }
        public TAFTextField ssResponsibility { get { return this.GetTextField("ssResponsibilityCombo"); } } 

        public TAFTextField ssStatus { get { return this.GetTextField("ssStatus"); } }

        public TAFTextField ssYearsInSewa { get { return this.GetTextField("ssintYearsInSewa"); } }
        
        //Security Approver

        public TAFTextField approvZsmSatsangCentres { get { return this.GetTextField("approvSatsangCentresLookup"); } }

        public TAFTextField approvGrNn { get { return this.GetTextField("approvGrNoLookup"); } }

        public TAFTextField approvSewadarID { get { return this.GetTextField("approvSewadarIDLookup"); } }

        public TAFTextField approvSewadarName { get { return this.GetTextField("approvSewadarNameLookup"); } }

        //public TAFComboBox approvResponsibility { get { return this.GetComboBox("approvResponsibilityCombo"); } }
        public TAFTextField approvResponsibility { get { return this.GetTextField("approvResponsibilityCombo"); } }  

        public TAFTextField approvStatus { get { return this.GetTextField("approvStatus"); } }

        public TAFTextField approvYearsInSewa { get { return this.GetTextField("approvIntYearsInSewa"); } }

        //Area Secretary
        public TAFTextField areaSecZsmSatsangCentresLookup { get { return this.GetTextField("areaSecZsmSatsangCentresLookup"); } }

        public TAFTextField areaSecCentreFunctionariesLookup { get { return this.GetTextField("areaSecCentreFunctionariesLookup"); } }

        public TAFTextField secZsmSatsangCentresLookup { get { return this.GetTextField("secZsmSatsangCentresLookup"); } }

        public TAFTextField secCentreFunctionariesLookup { get { return this.GetTextField("secCentreFunctionariesLookup"); } }

        public TAFTextField weeklySewaLocationLookup { get { return this.GetTextField("weeklySewaLocationLookup"); } }

        public TAFTextField weeklyZmsDepartmentsLookup { get { return this.GetTextField("weeklyZmsDepartmentsLookup"); } }
        
        
    }
}
