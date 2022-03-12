using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using White.Core;
using NUnit.Framework;
using System.Threading;
using White.Core.InputDevices;



namespace DCC.ZOS.ZSM.TEST.ACT
{
    public class TestSewadarsInformationOperations
    {
        private static Application application1 = null;
        private static SewadarsInformation sewadarInformationScreen = null;

        public void Setup()
        {
            string currentPath = System.Windows.Forms.Application.StartupPath;
            string appPath = currentPath + @"\..\..\..\..\DCC.ZOS.ZSM_SOL\DCC.ZOS.ZSM\bin\Debug\DCC.ZOS.ZSM.exe";
            application1 = Application.Launch(appPath);

            //Thread.Sleep(2000);
            // sewadarInformationScreen = new SewadarsInformation(application, new string[] { "Activities", "Sewadars Information" });
            //sewadarInformationScreen.Open();

            InitializeScreen(application1, new string[] { "Activities", "Sewadars Information" });
        }

        public static void InitializeScreen(Application _application, string[] menuItem)
        {
            application1 = _application;
            sewadarInformationScreen = new SewadarsInformation(application1, menuItem);

            //*because when automation code is executed .It is already into "open" mode henece commented
            //  sewadarDetailsScreen.Open();
           TestSewadarsInformationOperations.InsertSewadarInformationForId();
           sewadarInformationScreen.Save();
           sewadarInformationScreen.Close();//This will completely close the screen

           
        }

        
        public static void InsertSewadarInformationForId()
        {
            sewadarInformationScreen.ReEvaluateAllItems();
            SetSewadarDetails();
            //updateGridRemarks();
           
            ///////to close
            //Keyboard.Instance.HoldKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.ALT);
            //Keyboard.Instance.PressSpecialKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.F4);
            //Keyboard.Instance.LeaveKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.ALT);
          
        }
        private static void SetSewadarDetails()
        {

            sewadarInformationScreen.department.Text = "Canteen";
            sewadarInformationScreen.subDepartment.Text = "Kitchen";
            sewadarInformationScreen.deptJoiningDate.Text = "10 Oct 2013";
            sewadarInformationScreen.outStationSewadar.Checked = true;

            sewadarInformationScreen.sewadarStatusComboBox.Text = "Temporary";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "Cancelled";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "Left";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "Un-fit";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "Permanent";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "In-active";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "Shifted";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "Retired";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "Wait-listed";
            sewadarInformationScreen.sewadarStatusComboBox.Text = "Non-Initiate";

            //  sewadarInformationScreen.currentStatusDate.Text ="10 Oct 2013 12:00PM";
            sewadarInformationScreen.appDate.Text = "10 Oct 2013";

            sewadarInformationScreen.responsibilityComboBox.Text = "Head";
            sewadarInformationScreen.responsibilityComboBox.Text = "Second Head";
            sewadarInformationScreen.responsibilityComboBox.Text = "Third Head";
            sewadarInformationScreen.responsibilityComboBox.Text = "Fourth Head";

            //  sewadarInformationScreen.resposibilityDate.Text = "9 Oct 2013";


            //reference 1//
            sewadarInformationScreen.ref1satsangCenter.Text = "Kolkata";
            sewadarInformationScreen.ref1GrNoLookup.Text = "G00147";
            sewadarInformationScreen.ref1Relations.Text = "Cousin";
            //sewadarInformationScreen.ref1satsangCenter.Text = "Kolkata";

            //reference 2  
            sewadarInformationScreen.ref2satsangCenter.Text = "Kolkata";
            sewadarInformationScreen.ref2GrNoLookup.Text = "G00172";
            sewadarInformationScreen.ref2Relations.Text = "Father";             //Aunty";

            //Sponsors   it should fill all other fields once GR is selected i.e status also
            sewadarInformationScreen.sponZsmSatsangCentres.Text = "Kolkata";
            sewadarInformationScreen.sponGrNn.Text = "M00008";
            // sewadarInformationScreen.sponSewadarID.Text = "616";
            // sewadarInformationScreen.sponSewadarName.Text = "GHIINER A ADIYEAV";
            //  sewadarInformationScreen.sponResponsibility.Text="Head";  //no combo is present UI 
            // sewadarInformationScreen.sponResponsibility.UIItem.SetValue("Head");/////if combo is used

            // sewadarInformationScreen.sponsorerStatus.Text = "Permanent";
            //sewadarInformationScreen.sponsorerYearsInSewa.Text = "5 yrs";

            //Security approver //it should fill all other fields once GR is i.e status also  
            sewadarInformationScreen.approvZsmSatsangCentres.Text = "Kolkata";
            sewadarInformationScreen.approvGrNn.Text = "G00147";
            //   sewadarInformationScreen.approvSewadarID.Text = "5434";
            // sewadarInformationScreen.approvSewadarName.Text = "GHEINES G ANEKENA";
            //sewadarInformationScreen.approvResponsibility.Text="Head"; //no combo is present UI verify....henc chged in sewadarInformation.cs
            //sewadarInformationScreen.approvStatus.Text = "Permanent";
            //sewadarInformationScreen.approvYearsInSewa.Text = "6 yrs";

            //sewa samiti
            sewadarInformationScreen.ssZsmSatsangCentres.Text = "Kolkata";
            sewadarInformationScreen.ssGrNn.Text = "G00147";
            // sewadarInformationScreen.ssSewadarID.Text = "13113";
            // sewadarInformationScreen.ssSewadarName.Text = "RAANDEP A RKASEAR";
            //  sewadarInformationScreen.ssResponsibility.UIItem.SetValue("Head");/////if combo is used
            //sewadarInformationScreen.ssResponsibility.Text = "Head";   //whne textfields is used
            // sewadarInformationScreen.ssStatus.Text = "Permanent";
            // sewadarInformationScreen.ssYearsInSewa.Text = "8 yrs";

            //secretsary///had to use mumbai because no records for kolkata;
            // sewadarInformationScreen.secZsmSatsangCentresLookup.Text = "Mumbai";
            sewadarInformationScreen.secZsmSatsangCentresLookup.Text = "Pune- I (Kesanand)";
            sewadarInformationScreen.secCentreFunctionariesLookup.Text = "Col. V. R. Patil";

            //area secretary
            sewadarInformationScreen.areaSecZsmSatsangCentresLookup.Text = "Mumbai";
            sewadarInformationScreen.areaSecCentreFunctionariesLookup.Text = "Gurdipsingh Gabadia";


            //weekly sewa
           // sewadarInformationScreen.weeklySewaLocationLookup.Text = "Kolkata";
           // sewadarInformationScreen.weeklyZmsDepartmentsLookup.Text = "Electric";


           
        }

        public void TestGetRecordUsingSystemId()
        {
            sewadarInformationScreen.txtSewadarId.Text = "6047";
            sewadarInformationScreen.Get();
            sewadarInformationScreen.ReEvaluateAllItems();

            //asser Statements
            Assert.IsTrue(sewadarInformationScreen.txtName.Text.Length > 0, "Name not found");
            Assert.IsTrue(sewadarInformationScreen.zsmGenderComboBox.Text.Length > 0, "Gender not found");
            Assert.IsTrue(sewadarInformationScreen.intAge.Text.Length > 0, "Age not found");
            //global status is empty for most of them except if sewadar is cancelled or removed
            //Assert.IsTrue(sewadarInformationScreen.sewadarGlobalStatus.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.statusDate.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.satsangCenter.Text.Length > 0, "Satsang Center not found");
            Assert.IsTrue(sewadarInformationScreen.txtGRNo.Text.Length > 0, "GrNo. not found");
            Assert.IsTrue(sewadarInformationScreen.department.Text.Length > 0, "Dept Name not found");
            Assert.IsTrue(sewadarInformationScreen.subDepartment.Text.Length > 0, "Sub-Dept Name not found");
            Assert.IsTrue(sewadarInformationScreen.deptJoiningDate.Text.Length > 0, "Dept joining date not found");
            Assert.IsFalse(sewadarInformationScreen.outStationSewadar.Checked, "Sewadar is outstation");
            Assert.IsTrue(sewadarInformationScreen.currentStatusDate.Text.Length > 0, "Current Status date not found");
            Assert.IsTrue(sewadarInformationScreen.appDate.Text.Length > 0, "Application date not found");
            //reshma
            Assert.IsTrue(sewadarInformationScreen.responsibilityComboBox.Text.Length > 0, "Responsibily  not found");
            //
            //RESPOSIBILITY IS EMPTY MOST OF THE TIMES EXCEPT FOR HEADS
            //Assert.IsNull(sewadarInformationScreen.responsibility.Text, "Sewadar responsibility not found");
            //Assert.IsTrue(sewadarInformationScreen.resposibilityDate.Text.Length > 0, "Responsibility date not found");
            //Ref1
            Assert.IsTrue(sewadarInformationScreen.ref1satsangCenter.Text.Length > 0, "Ref1 Satsang Center not found");
            Assert.IsTrue(sewadarInformationScreen.ref1GrNoLookup.Text.Length > 0, "Ref1 GrNo not found");
            Assert.IsTrue(sewadarInformationScreen.txtRefName.Text.Length > 0, "Ref1 Name not found");
            //Assert.IsTrue(sewadarInformationScreen.ref1Relations.Text.Length > 0, "Ref1 Relation not found");
            Assert.IsTrue(sewadarInformationScreen.ref1Department.Text.Length > 0, "Ref1 Department not found");

            //Ref2
            Assert.IsTrue(sewadarInformationScreen.ref2satsangCenter.Text.Length > 0, "Ref2 Satsang Center not found");
            Assert.IsTrue(sewadarInformationScreen.ref2GrNoLookup.Text.Length > 0, "Ref2 GrNo not found");
            Assert.IsTrue(sewadarInformationScreen.txtRef2Name.Text.Length > 0, "Ref2 Name not found");
            //Assert.IsTrue(sewadarInformationScreen.ref2Relations.Text.Length > 0, "Ref2 Relation not found");
            Assert.IsTrue(sewadarInformationScreen.ref2Department.Text.Length > 0, "Ref2 Department not found");
            //sponserer
            Assert.IsTrue(sewadarInformationScreen.sponZsmSatsangCentres.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.sponGrNn.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.sponSewadarID.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.sponSewadarName.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.sponResponsibility.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.sponsorerStatus.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.sponsorerYearsInSewa.Text.Length > 0);
            //Sewa Samiti
            //Assert.IsTrue(sewadarInformationScreen.ssZsmSatsangCentres.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.ssGrNn.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.ssSewadarID.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.ssSewadarName.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.ssResponsibility.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.ssStatus.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.ssYearsInSewa.Text.Length > 0);
            //Security Approver
            Assert.IsTrue(sewadarInformationScreen.approvZsmSatsangCentres.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.approvGrNn.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.approvSewadarID.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.approvSewadarName.Text.Length > 0);
            //Assert.IsTrue(sewadarInformationScreen.approvResponsibility.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.approvStatus.Text.Length > 0);
            Assert.IsTrue(sewadarInformationScreen.approvYearsInSewa.Text.Length > 0);

        }

        public void TearDown()
        {
            application1.KillAndSaveState();
        }

    }
}
