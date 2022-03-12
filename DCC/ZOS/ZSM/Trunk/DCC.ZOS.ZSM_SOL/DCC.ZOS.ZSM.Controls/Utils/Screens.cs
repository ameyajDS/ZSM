using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.UIControls.TextControls;


namespace DCC.ZOS.ZSM.Controls.Utils
{
    public class Utility
    {

        public class ListDetails
        {
            private string cd;
            private string name;
            public string CD
            {
                get
                {
                    return cd;
                }
            }

            public ListDetails(string name, string cd)
            {
                this.name = name;
                this.cd = cd;
            }
            public override string ToString()
            {
                return name + "," + cd;
            }
        }

        public static List<ListDetails> GetSortOrderList()
        {
            List<ListDetails> lstSortOrder = new List<ListDetails>();
            lstSortOrder.Add(new ListDetails("Gender-wise", "Gender-wise"));
            lstSortOrder.Add(new ListDetails("Mixed", "Mixed"));
            return lstSortOrder;
        }

        public static bool isListBoxValuesSpecified(DCCListBox missingCriteriaListBox1)
        {
            bool isSpecified = true;
            if (missingCriteriaListBox1.GetItems(true).Count > 0 &&
                    missingCriteriaListBox1.GetItems(true)[0].ValueMember == null)
            {
                if (missingCriteriaListBox1.GetItems(true).Count < 2)
                    isSpecified = false;
            }
            else
            {
                if (missingCriteriaListBox1.GetItems(true).Count < 1)
                    isSpecified = false;
            }
            return isSpecified;
        }

    }

    public class SewadarTypes
    {
        public const string OPEN_SWD = "O";
        public const string TRAINEE_SWD = "T";
        public const string GUIDE_SWD = "G";
    }

    public class Screens
    {
        public const string ENT_COUNTRIES = "ENT_01";
        public const string ENT_STATES = "ENT_02";
        public const string ENT_DISTRICT_OR_CITIES = "ENT_03";
        public const string ENT_OCCUPATIONS = "ENT_04";
        public const string ENT_SKILLS = "ENT_05";
        public const string ENT_COLOURS = "ENT_06";        
        public const string ENT_RELATIONS = "ENT_07";
        public const string ENT_QUALIFICATIONS = "ENT_08";
        public const string ENT_QUALIFICATION_SUBJECTS = "ENT_09";
        public const string ENT_INITIATION_PLACES = "ENT_10";
        public const string ENT_SATSANG_CENTERS_DETAILS = "ENT_11";
        public const string ENT_POSTOFFICESORCITIES = "ENT_12";
        public const string ENT_SEWA_EXEMPTIONS = "ENT_13";
        public const string ENT_WEEKLY_SEWA_LOCATIONS = "ENT_14";
        public const string ENT_DEPARTMENTS = "ENT_15";
        public const string ENT_MEDICAL_DISABILITIES = "ENT_16";
        

        public const string ENT_BADGE_TEMPLATES = "STP_01";
        
        public const string SETUP_SEWAS = "STP_03";
        public const string SETUP_SCANNING_JOBS = "STP_04";
        public const string SETUP_SEWA_TEAMS = "STP_05";
        public const string SETUP_SYSTEM_INFORMATION_CODES = "STP_06";
        public const string SETUP_SCANNING_JOBS_VALIDATIONS = "STP_07";
        public const string SETUP_GENERIC_ATTRIBUTES = "STP_08";
        public const string SETUP_CREDIT_SPECIFICATIONS = "STP_02";
        public const string SETUP_USERS = "STP_09";
               
        public const string ATT_SEWADAR_WISE_SEWA_SUMMARIES = "ATT_01";
        public const string ATT_ARBITRARY_DAILY_PRESENCES = "ATT_02";
        public const string ATT_ARBITRARY_SUMMARISED_EXEMPTIONS = "ATT_03";
        public const string ATT_TEAM_DAILY_DAY_WISE = "ATT_04";
        public const string ATT_TEAM_DAILY_SEWADAR_WISE = "ATT_05";
        public const string ATT_ARBITRARY_SHIFT_PRESENCES = "ATT_06";
        public const string ACT_IMPORT_FINGERPRINT_ATTENDANCE = "ATT_07";


        public const string ACT_SEWADARS = "ACT_01";
        public const string ACT_SEWADARS_DETAILS = "ACT_02";
        public const string ACT_SEWADARS_INFORMATION = "ACT_03";
        public const string ACT_SEWADARS_PARTICULARS = "ACT_04";
        public const string ACT_DEPARTMENT_TRANSFERS = "ACT_05";
        public const string ACT_SATSANG_CENTRE_TRANSFERS = "ACT_06";
        public const string ACT_BADGE_PRINTING = "ACT_07";
        public const string ACT_ROSTER_PRINTING = "ACT_08";
        public const string ACT_IMPORT_EXISTING_SEWADARS_PHOTOS = "ACT_09";
        public const string ACT_IMPORT_NEW_SEWADARS_PHOTOS = "ACT_10";
        public const string ACT_SPEAKERS = "ACT_11";
        public const string ACT_SEWADARS_LISTS = "ACT_12";
        public const string ACT_MERGE_SEWADARS= "ACT_13";
        public const string ACT_SEWADARS_IN_SEWADAR_LIST = "ACT_14";
        public const string ACT_SCANNING_CONTROL_DATES = "ACT_19";
        public const string ACT_BADGE_SCANNING = "ACT_20";
        public const string ACT_BADGE_SCAN_CONTROLLING_DATE = "ACT_21";
        public const string ACT_TRAINEE_SEWADARS_INFORMATION = "ACT_22";
        public const string ACT_OPEN_SEWADARS_INFORMATION = "ACT_23";
        public const string MSC_MIGRATE_SEWADARS = "ACT_24";
        public const string ACT_REGISTER_SEWADARS_IN_BULK = "ACT_25";
        public const string ACT_SEWADAR_LIST_IN_BULK = "ACT_26";
        public const string ACT_UPLOAD_DATA_IN_BULK = "ACT_27";
        public const string ACT_SEWADAR_PHOTO_CLICKING = "ACT_28";
        public const string ACT_IMPORT_SCANNED_BADGES = "ACT_29";
        public const string ACT_SEWADARS_REFERENCES = "ACT_30";
        public const string ACT_SEWADARS_APPLICATIONS = "ACT_31";
        public const string ACT_GUIDE_SEWADARS_INFORMATION = "ACT_32";

        public const string RPT_SEWADARS_REPORTS = "RPT_01";
        public const string RPT_ATTENDANCE_REPORTS = "RPT_02";
        public const string RPT_MISCELLANEOUS_REPORTS = "RPT_03";
        public const string RPT_DISCREPANCY_REPORTS = "RPT_04";
        public const string RPT_PHOTO_REPORTS = "RPT_05";
        public const string RPT_GENERATE_DAILY_ATTENDANCE = "RPT_06";

        public const string PHOTO_EXISTING_SEWADARS_PHOTO_CLICKING = "PHT_01";
        public const string PHOTO_NEW_SEWADARS_PHOTO_CLICKING = "PHT_02";

        public const string MSC_HISTORY = "MSC_01";
        public const string MSC_SEWADAR_HISTORY = "MSC_02";
        public const string MSC_SEWA_SUMMARY = "MSC_03";
        public const string MSC_SEWADAR_TEAM_TRANSFERS = "MSC_04";
        public const string MSC_PRINT_SEWADAR_DETAILS = "MSC_05";
        public const string MERGE_SEWA_TEAMS = "MSC_06";
        public const string MSC_CREATE_TEAMS_USING_LIST_SEWA = "MSC_07";
        
    }
}
