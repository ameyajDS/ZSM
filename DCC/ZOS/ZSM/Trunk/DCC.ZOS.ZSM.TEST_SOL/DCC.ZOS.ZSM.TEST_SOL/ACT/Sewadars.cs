using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DCC.UMB.TAF.View;


namespace DCC.ZOS.ZSM.TEST.ACT
{
    public class Sewadars : TAFAbstractScreen
    {
        public Sewadars(White.Core.Application application, string[] menuPath)
            : base(application, menuPath)
        {

        }

        public TAFTextField txtSewadarId { get { return this.GetTextField("intSewadarId"); } }

        public TAFTextField txtFirstName { get { return this.GetTextField("txtFirstName"); } }

        public TAFTextField txtMiddleName { get { return this.GetTextField("txtMiddleName"); } }

        public TAFTextField txtLastName { get { return this.GetTextField("txtSurName"); } }

        public TAFComboBox zsmGenderComboBox { get { return this.GetComboBox("zsmGenderCombo1"); } }

        public TAFTextField dtmBirthDate { get { return this.GetTextField("dtmBirthDate"); } }

        public TAFCheckBox chkMarried { get { return this.GetCheckBox("chkMarried"); } }

        public TAFComboBox sewadarStatusCombo { get { return this.GetComboBox("sewadarStatusCombo1"); } }

        public TAFTextField dtGlobalStatus { get { return this.GetTextField("dtGlobalStatus"); } }

        public TAFTextField dtInitiation { get { return this.GetTextField("dtInitiation"); } }

        public TAFTextField initiationPlacesLookup { get { return this.GetTextField("initiationPlacesLookup1"); } }
        
        public  TAFComboBox  sewadarInitiatedByComboBox{ get  {return this.GetComboBox("patronCombo1"); } }

    }
}
