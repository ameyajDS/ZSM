using System;
using System.ComponentModel;
using System.Data;
using System.Windows.Forms;
using DCC.DBFacade;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Utils;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.Controls.Misc
{
    public partial class AddressBox : UserControl
    {

        public AddressBox()
        {
            InitializeComponent();           
        }

        #region Properties


        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the first line of address")]
        public string AddressLine1
        {
            get { return txtAddress1.DisplayTextBindingKey; }
            set { txtAddress1.DisplayTextBindingKey = value; }
        }

        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the Second line of address")]
        public string AddressLine2
        {
            get { return txtAddress2.DisplayTextBindingKey; }
            set { txtAddress2.DisplayTextBindingKey = value; }
        }
        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the country's DisplayTextBindingKey of address")]
        public string Country_DisplayTextBindingKey
        {
            get { return CountryLookup.DisplayTextBindingKey; }
            set { CountryLookup.DisplayTextBindingKey = value; }
        }
        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the country's IdTextBindingKey of address")]
        public string Country_ValueText
        {
            get { return CountryLookup.IdTextBindingKey; }
            set { CountryLookup.IdTextBindingKey = value; }
        }
        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the State's DisplayTextBindingKey of address")]
        public string State_DisplayTextBindingKey
        {
            get { return StateLookup.DisplayTextBindingKey; }
            set { StateLookup.DisplayTextBindingKey = value; }
        }
        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the State's IdTextBindingKey of address")]
        public string State_ValueText
        {
            get { return StateLookup.IdTextBindingKey; }
            set { StateLookup.IdTextBindingKey = value; }
        }
        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the district/city's DisplayTextBindingKey of address")]
        public string DistrictOrCity_DisplayTextBindingKey
        {
            get { return DistrictorCitiesLookup.DisplayTextBindingKey; }
            set { DistrictorCitiesLookup.DisplayTextBindingKey = value; }
        }
        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the district/city's IdTextBindingKey of address")]
        public string DistrictOrCity_IdTextBindingKey
        {
            get { return DistrictorCitiesLookup.IdTextBindingKey; }
            set { DistrictorCitiesLookup.IdTextBindingKey = value; }
        }
        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the Pin of address")]
        public string Pin_DisplayTextBindingKey
        {
            get { return txtPin.DisplayTextBindingKey; }
            set { txtPin.DisplayTextBindingKey = value; }
        }

        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the PostOfficeOrCity's DisplayTextBindingKey of address")]
        public string PostOfficeOrCity_DisplayTextBindingKey
        {
            get { return postOfficeOrCityLookup.DisplayTextBindingKey; }
            set { postOfficeOrCityLookup.DisplayTextBindingKey = value; }
        }
        [Category("DCC.ZOS.ZSM.Controls")]
        [Description("It gives the PostOfficeOrCity's IdTextBindingKey of address")]
        public string PostOfficeOrCity_IdTextBindingKey
        {
            get { return postOfficeOrCityLookup.IdTextBindingKey; }
            set { postOfficeOrCityLookup.IdTextBindingKey = value; }
        }
        #endregion
       

        private void StateLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.CountryLookup.DisplayText))
            {
                e.LookupSqlString = e.LookupSqlString.ToLower().Replace("where ", string.Format("WHERE c.country_id = {0} AND ", this.CountryLookup.IdText));
            }
        }

        private void DistrictorCitiesLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.StateLookup.DisplayText))
            {
                e.LookupSqlString = e.LookupSqlString.ToLower().Replace("where ", string.Format("WHERE s.state_id = {0} AND ", this.StateLookup.IdText));
            }
        }

        private void postOfficeOrCityLookup_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            if (!string.IsNullOrEmpty(this.DistrictorCitiesLookup.DisplayText))
            {
                e.LookupSqlString = e.LookupSqlString.ToLower().Replace("where ", string.Format("WHERE d.district_or_city_id = {0} AND ", this.DistrictorCitiesLookup.IdText));
            }
        }

        public void setCountry(string id, string str)
        {
            ZSMUtility.setDisplayValueText(this.CountryLookup, str);
            this.CountryLookup.IdText = id;
        }

        public void setState(string id, string str)
        {
            ZSMUtility.setDisplayValueText(this.StateLookup, str);
            this.StateLookup.IdText = id;
        }

        public void setDistrict(string id, string str)
        {
            ZSMUtility.setDisplayValueText(this.DistrictorCitiesLookup, str);
            this.DistrictorCitiesLookup.IdText = id;
        }
    }
}
