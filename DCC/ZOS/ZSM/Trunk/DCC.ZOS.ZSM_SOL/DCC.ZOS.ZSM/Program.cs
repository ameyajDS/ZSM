using System;
using System.Windows.Forms;
using System.Configuration;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.View.Menu;
using DCC.UMB.CDF.Log;
using DCC.ZOS.ZSM.Controls.Configuration;
using DCC.ZOS.ZSM.ENT;
using DCC.ZOS.ZSM.ACT;
using DCC.ZOS.ZSM.ATT;
using DCC.ZOS.ZSM.SETUP;
using DCC.ZOS.ZSM.RPT;
using System.Reflection;
using DCC.ZOS.ZSM.PHT;


namespace DCC.ZOS.ZSM
{
    internal static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        private static void Main(string[] args)
        {
            try
            {
                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                string commandLineArgument = ConfigurationSettings.AppSettings["ConnectionString"];

                if (args != null && args.Length > 0)
                {
                    commandLineArgument = args[0];
                }
                UIManager.StartFramework(commandLineArgument, MenuClicked);
            }
            catch (Exception ex)
            {
                Logger.Debug(ex.Message);
                Logger.Debug(ex.StackTrace);
                if (ex.InnerException != null)
                {
                    Logger.Debug("" + ex.InnerException.Message);
                    Logger.Debug("" + ex.InnerException.StackTrace);
                }
                MessageBox.Show(ex.Message);
                MessageBox.Show(ex.StackTrace);
                throw;
            }
        }


        private static void MenuClicked(DCCToolStripMenuItem menuItem)
        {
            try
            {

                //[[FOR ZSM we dont want to export reports out of the report viewer control
                GlobalAppVariables.ObjMDIMain.EnableReportExport = (string.Compare(GlobalAppVariables.AppContext.Argument3, "Yes", true) == 0);
                //]]

                string applicationId = GlobalAppVariables.AppContext.ApplicationId;
                string SessionID = GlobalAppVariables.AppContext.SessionId;


                if (menuItem.GroupId == "ENT")
                {
                    OpenScreen_ENT(menuItem.Name, applicationId);
                }
                else if (menuItem.GroupId == "ACT")
                {
                    OpenScreen_ACT(menuItem.Name, applicationId);
                }
                else if (menuItem.GroupId == "STP")
                {
                    OpenScreen_SETUP(menuItem.Name, applicationId);
                }
                else if (menuItem.GroupId == "ATT")
                {
                    OpenScreen_ATT(menuItem.Name, applicationId);
                }
                else if (menuItem.GroupId == "RPT")
                {
                    OpenScreen_RPT(menuItem.Name, applicationId);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private static void OpenScreen_ACT(string screenName, string applicationId)
        {
            switch (screenName)
            {
                case "Sewadars Photo Clicking":
                    UIManager.OpenForm(typeof(PhotoClicking), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Sewadars":
                    UIManager.OpenForm(typeof(Sewadars), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Sewadars Details":
                    UIManager.OpenForm(typeof(SewadarsDetails), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Sewadars Information":
                    UIManager.OpenForm(typeof(SewadarsInformation), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Trainee Sewadars":
                    UIManager.OpenForm(typeof(TraineeSewadarsInformation), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Open Sewadars":
                    UIManager.OpenForm(typeof(OpenSewadarsInformation), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Guide Sewadars":
                    UIManager.OpenForm(typeof(GuideSewadarsInformation), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Generic Reports":
                    UIManager.OpenForm(typeof(GenericReports), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Department Transfers":
                    UIManager.OpenForm(typeof(DepartmentTransfers), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Satsang Centre Transfers":
                    UIManager.OpenForm(typeof(SatsangCentreTransfers), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Sewadars Lists":
                    UIManager.OpenForm(typeof(SewadarLists), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Merge Sewadars":
                    UIManager.OpenForm(typeof(MergeSewadars), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Migrate Sewadars":
                    UIManager.OpenForm(typeof(MigrateSewadars), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Register Sewadars in Bulk":
                    UIManager.OpenForm(typeof(RegisterSewadarsInBulk), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Import Sewadar List Bulk":
                    UIManager.OpenForm(typeof(ImportSewadarList), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Upload Data in Bulk":
                    UIManager.OpenForm(typeof(DataUpload), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Scan Badges":
                    UIManager.OpenForm(typeof(BadgeScan), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Scanning Control Dates":
                    UIManager.OpenForm(typeof(ScanningControlDates), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Roster Printing":
                    UIManager.OpenForm(typeof(RosterPrinting), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Badge Printing":
                    UIManager.OpenForm(typeof(BadgePrinting), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Sewadars Particulars":
                    UIManager.OpenForm(typeof(SewadarsParticulars), UIModes.Insert, applicationId, GlobalAppVariables.AppContext.Argument1 + ",Dummy,Sewadar");
                    break;
                case "Sewadars in Sewadar Lists":
                    UIManager.OpenForm(typeof(SewadarsInSewadarLists), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Import Existing Sewadars Photos":
                    UIManager.OpenForm(typeof(ImportExistingSewadarsPhotos), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Import New Sewadars Photos":
                    UIManager.OpenForm(typeof(ImportNewSewadarsPhotos), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Speakers":
                    UIManager.OpenForm(typeof(Speakers), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Sewadar Photoclicking":
                      UIManager.OpenForm(typeof(SewadarPhotoClicking), UIModes.Insert, applicationId, string.Empty);
                      break;
                case "Import Scanned Badges":
                      UIManager.OpenForm(typeof(ImportScannedBadgesForJob), UIModes.Query, applicationId, string.Empty);
                      break;
                case "Sewadar References":
                      UIManager.OpenForm(typeof(SewadarReferences), UIModes.Query, applicationId, string.Empty);
                      break;
                case "Sewadar Applications":
                      UIManager.OpenForm(typeof(SewadarApplications), UIModes.Query, applicationId, string.Empty);
                      break;
            }

        }


        private static void OpenScreen_SETUP(string screenName, string applicationId)
        {
            switch (screenName)
            {
                case "Badge Templates":
                    UIManager.OpenForm(typeof(BadgeTemplates), UIModes.Query, applicationId, string.Empty);
                    break;
                case "System Information Codes":
                    UIManager.OpenForm(typeof(SystemInformationCodes), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Sewas":
                    UIManager.OpenForm(typeof(Sewas), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Sewa Teams":
                    UIManager.OpenForm(typeof(SewaTeams), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Scanning Jobs":
                    UIManager.OpenForm(typeof(ScanningJobs), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Scanning Jobs Validations":
                    UIManager.OpenForm(typeof(ScanningJobsValidations), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Generic Attributes":
                    UIManager.OpenForm(typeof(GenericAttributes), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Credit Specifications":
                    UIManager.OpenForm(typeof(CreditSpecifications), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Users":
                    UIManager.OpenForm(typeof(Users), UIModes.Query, applicationId, string.Empty);
                    break;

            }
        }


        private static void OpenScreen_ATT(string screenName, string applicationId)
        {
            switch (screenName)
            {
                case "Summary (Sewadar-wise)":
                    UIManager.OpenForm(typeof(SewadarWiseSewaSummaries), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Arbitrary - Daily Presences":
                    UIManager.OpenForm(typeof(ArbitraryDailyPresences), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Arbitrary - Shift Presences":
                    UIManager.OpenForm(typeof(ArbitraryShiftPresences), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Arbitrary - Summarised Exemptions":
                    UIManager.OpenForm(typeof(ArbitrarySummarisedExemptions), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Team - Daily (Day-wise)":
                    UIManager.OpenForm(typeof(SewaTeamAttendence), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Team - Daily (Sewadar-wise)":
                    UIManager.OpenForm(typeof(TeamDailyAttendence), UIModes.Insert, applicationId, string.Empty);
                    break;
                case "Fingerprint Attendance":
                    UIManager.OpenForm(typeof(ImportFingerprintAttendance), UIModes.Insert, applicationId, string.Empty);
                    break;
            }
        }


        private static void OpenScreen_RPT(string screenName, string applicationId)
        {
            switch (screenName)
            {
                case "Sewadars Reports":
                    UIManager.OpenForm(typeof(SewadarReports), UIModes.Insert, applicationId, "1");
                    break;
                case "Attendance Reports":
                    UIManager.OpenForm(typeof(AttendanceReports), UIModes.Insert, applicationId, "2");
                    break;
                case "Miscellaneous Reports":
                    UIManager.OpenForm(typeof(MiscellaneousReports), UIModes.Insert, applicationId, "3");
                    break;
                case "Discrepancy Reports":
                    UIManager.OpenForm(typeof(DiscrepancyReports), UIModes.Insert, applicationId, "4");
                    break;
                case "Photo Reports":
                    UIManager.OpenForm(typeof(PhotoReports), UIModes.Insert, applicationId, "5");
                    break;
                case "Export Daily Attendance Reports":
                    UIManager.OpenForm(typeof(GenerateDailyAttendanceReports), UIModes.Insert, applicationId, "6");
                    break;
            }
        }

        private static void OpenScreen_ENT(string screenName, string applicationId)
        {
            switch (screenName)
            {
                case "Countries":
                    UIManager.OpenForm(typeof(Countries), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Districts":
                    UIManager.OpenForm(typeof(DistrictOrCities), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Initiation Places":
                    UIManager.OpenForm(typeof(InitiationPlaces), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Occupations":
                    UIManager.OpenForm(typeof(Occupations), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Relations":
                    UIManager.OpenForm(typeof(Relations), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Skills":
                    UIManager.OpenForm(typeof(Skills), UIModes.Query, applicationId, string.Empty);
                    break;
                case "States":
                    UIManager.OpenForm(typeof(States), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Qualifications":
                    UIManager.OpenForm(typeof(Qualifications), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Qualification Subjects":
                    UIManager.OpenForm(typeof(QualificationSubjects), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Post Offices / Cities":
                    UIManager.OpenForm(typeof(PostOfficesOrCities), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Satsang Centres":
                    UIManager.OpenForm(typeof(SatsangCentresDetails), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Sewa Exemptions":
                    UIManager.OpenForm(typeof(SewaExemptions), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Weekly Sewa Locations":
                    UIManager.OpenForm(typeof(WeeklySewaLocations), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Departments":
                    UIManager.OpenForm(typeof(Departments), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Colours":
                    UIManager.OpenForm(typeof(Colours), UIModes.Query, applicationId, string.Empty);
                    break;
                case "Medical Disabilities":
                    UIManager.OpenForm(typeof(MedicalDisabilities), UIModes.Query, applicationId, string.Empty);
                    break;

            }
        }

    }
}
