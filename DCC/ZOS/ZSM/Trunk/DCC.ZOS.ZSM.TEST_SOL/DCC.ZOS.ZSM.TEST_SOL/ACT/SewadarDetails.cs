using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DCC.UMB.TAF.View;

namespace DCC.ZOS.ZSM.TEST.ACT
{
    public class SewadarDetails : TAFAbstractScreen
    {
        public SewadarDetails(White.Core.Application application, string[] menuPath)
            : base(application, menuPath)
        {

        }

        public TAFTextField txtSewadarId { get { return this.GetTextField("intSewadarId"); } }

        public TAFTextField txtName { get { return this.GetTextField("txtName"); } }

        public TAFComboBox zsmGenderComboBox { get { return this.GetComboBox("zsmGenderCombo1"); } }

        public TAFTextField sewadarStatusCombo { get { return this.GetTextField("txtSewadarStatus"); } }

        public TAFTextField dtGlobalStatus { get { return this.GetTextField("dtmSewadarStatus"); } }

        public TAFTextField statusName { get { return this.GetTextField("dtmSewadarStatus"); } }

        public TAFTextField intAge { get { return this.GetTextField("dccLongIntegerField1"); } }

        public TAFTextField txtAddress1 { get { return this.GetTextField("txtAddress1"); } }

        public TAFTextField txtAddress2 { get { return this.GetTextField("txtAddress2"); } }

        public TAFTextField lkpCountry { get { return this.GetTextField("CountryLookup"); } }

        public TAFTextField lkpState { get { return this.GetTextField("StateLookup"); } }

        public TAFTextField lkpDistrictCities { get { return this.GetTextField("DistrictorCitiesLookup"); } }

        public TAFTextField lkpPostOffice { get { return this.GetTextField("postOfficeOrCityLookup"); } }

        public TAFTextField txtPin { get { return this.GetTextField("txtPin"); } }

        public TAFTextArea txtMobilephone { get { return this.GetTextArea("txtMobilePh"); } }

        public TAFTextArea txtResidencePh { get { return this.GetTextArea("txtResidencePh"); } }

        public TAFTextArea txtOfficePhone { get { return this.GetTextArea("txtOffPh"); } }

        public TAFComboBox comboBoxOccupation { get { return this.GetComboBox("cmbOccupation"); } }

        public TAFGrid gridSkills { get { return this.GetGrid("grdSkills"); } }

        public TAFGrid gridQualifications { get { return this.GetGrid("grdQualifications"); } }

        public TAFComboBox comboBoxAttendsWeeklySatsang { get { return this.GetComboBox("cmbAttendsWeeklySatsang"); } }

       // public TAFGrid gridQualifications { get { return this.GetGrid("grdQualifications"); } }

        public TAFTextField txtlkpWeeklySatsangCentre { get { return this.GetTextField("lkpWeeklySatsangCentre"); } }  //lkp?

        public TAFComboBox comboBoxAddressProof { get { return this.GetComboBox("cmbAddressProof"); } }

        public TAFTextField txtOtherAddressProof { get { return this.GetTextField("txtOtherAddressProof"); } }

        public TAFComboBox comboBoxhHypertension { get { return this.GetComboBox("cmbHypertension"); } }

        public TAFComboBox comboBoxhDiabetic { get { return this.GetComboBox("cmbDiabetic"); } }

        public TAFComboBox comboBoxSkinProblem { get { return this.GetComboBox("cmbSkinProblem"); } }

        public TAFComboBox comboBoxEpillepsy { get { return this.GetComboBox("cmbEpillepsy"); } }

        public TAFTextField txtDisability { get { return this.GetTextField("txtDisability"); } }

        public TAFGrid gridRemarks { get { return this.GetGrid("grdRemarks"); } }

        public TAFTextField txtGRNo { get { return this.GetTextField("txtGRNo"); } }

        public TAFComboBox sewadarStatusComboBox { get { return this.GetComboBox("sewadarStatusCombo1"); } }

        public TAFTextField txtDtCurrentStatus { get { return this.GetTextField("dtCurrentStatus"); } }

        public TAFTextField txtZsmSatsangCentresLookup1 { get { return this.GetTextField("zsmSatsangCentresLookup1"); } }

        public TAFTextField txtCurrentDepartment { get { return this.GetTextField("txtCurrentDepartment"); } }

        public TAFTextField txtDtDepJoiningDate { get { return this.GetTextField("dtDepJoiningDate"); } }

        public TAFTextField txtDtAppDate { get { return this.GetTextField("dtAppDate"); } }

    }
}
