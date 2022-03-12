using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using White.Core;
using NUnit.Framework;
using System.Threading;
using DCC.ZOS.ZSM.TEST.Infrastructure;
using DCC.UMB.TAF.View;
using White.Core.InputDevices;


////////////////////////////////////////////Second form/////////////////////////////    
namespace DCC.ZOS.ZSM.TEST.ACT
{
    public class TestSewadaDetailsOperations
    {
        private static Application _application = null;
        private static SewadarDetails sewadarDetailsScreen = null;

        public void Setup()
        {
            string currentPath = System.Windows.Forms.Application.StartupPath;
            string appPath = currentPath + @"\..\..\..\..\DCC.ZOS.ZSM_SOL\DCC.ZOS.ZSM\bin\Debug\DCC.ZOS.ZSM.exe";
            _application = Application.Launch(appPath);

            // Thread.Sleep(2000);
            InitializeScreen(_application, new string[] { "Activities", "Sewadars Details" });
          
        }

        public static void InitializeScreen(Application application, string[] menuItem)
        {
           _application = application;
           sewadarDetailsScreen = new SewadarDetails(application, menuItem);
          
            //*because when automation code is executed .It is already into "open" mode
          //  sewadarDetailsScreen.Open();
           TestSewadaDetailsOperations.InsertSewadarDetailsForId();
        }

        public void TestGetRecordUsingSystemId()
        {
            sewadarDetailsScreen.txtSewadarId.Text = "6047";

            sewadarDetailsScreen.Get();
            sewadarDetailsScreen.ReEvaluateAllItems();

            Assert.IsTrue(sewadarDetailsScreen.txtName.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtSewadarId.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.zsmGenderComboBox.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.sewadarStatusCombo.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.dtGlobalStatus.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.statusName.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.intAge.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtMobilephone.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtResidencePh.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtOfficePhone.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.comboBoxOccupation.Text.Length > 0);
            //Assert.IsTrue(sewadarDetailsScreen.gridSkills.GetRowCount.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.comboBoxAttendsWeeklySatsang.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtlkpWeeklySatsangCentre.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.comboBoxAddressProof.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.comboBoxhHypertension.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.comboBoxhDiabetic.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.comboBoxSkinProblem.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.comboBoxEpillepsy.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtDisability.Text.Length > 0);
            // Assert.IsTrue(sewadarDetailsScreen.gridRemarks.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtGRNo.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.sewadarStatusComboBox.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtDtCurrentStatus.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtZsmSatsangCentresLookup1.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtCurrentDepartment.Text.Length > 0);
            Assert.IsTrue(sewadarDetailsScreen.txtDtDepJoiningDate.Text.Length > 0);

        }

        public static void InsertSewadarDetailsForId()
        {            
            sewadarDetailsScreen.ReEvaluateAllItems();  
            SetSewadarDetails();
            //updateGridRemarks();
            sewadarDetailsScreen.Save();
           TestSewadarsInformationOperations.InitializeScreen(_application, new string[] { "Sewadars Information" });
          // TestSewadarsInformationOperations.InsertSewadarDetailsForId();
             
        }


        private static void updateGridRemarks()
        {
            TAFGrid grd = sewadarDetailsScreen.GetGrid("grdRemarks");
            grd.InsertRowBelow();
            //grd.SetStringValue(0,new enum, "Annotations", true);
            //grd.SetCellValue(0, 1, "Abc", true);
        }

        private static void SetSewadarDetails()
        {
            
         sewadarDetailsScreen.txtAddress1.Text = AutomationHelper.GetRandomString();
            sewadarDetailsScreen.txtAddress2.Text =AutomationHelper.GetRandomString();
            sewadarDetailsScreen.lkpCountry.Text = "India";
            sewadarDetailsScreen.lkpState.Text = "West Bengal";
            sewadarDetailsScreen.lkpDistrictCities.Text = "Kolkata";
            sewadarDetailsScreen.lkpPostOffice.Text = "Kolkata";
            sewadarDetailsScreen.txtPin.Text = "400040";
          sewadarDetailsScreen.txtMobilephone.Text ="9999099990";
          sewadarDetailsScreen.txtOfficePhone.Text = "022240393274";
           sewadarDetailsScreen.txtResidencePh.Text = "022267424499";
          
          //sewadarDetailsScreen.gridSkills.SetStringValue(0,, "computers", true);
           //sewadarDetailsScreen.gridSkills.SetStringValue();

          // sewadarDetailsScreen.GetGrid("grdSkills");
        //   sewadarDetailsScreen.gridSkills.InsertRowLast();
          // Keyboard.Instance.HoldKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.DOWN);
         //  Keyboard.Instance.PressSpecialKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.DOWN);
          // Keyboard.Instance.LeaveKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.DOWN);

            //Bachelor of Computer Science
           sewadarDetailsScreen.comboBoxOccupation.Text = "Business";
           sewadarDetailsScreen.comboBoxOccupation.Text = "Student";
           sewadarDetailsScreen.comboBoxOccupation.Text = "Retired";
           sewadarDetailsScreen.comboBoxOccupation.Text = "House-wife";
           sewadarDetailsScreen.comboBoxOccupation.Text = "Self-employed";
           sewadarDetailsScreen.comboBoxOccupation.Text = "Un-employed";
           sewadarDetailsScreen.comboBoxOccupation.Text = "Service";

            sewadarDetailsScreen.comboBoxAttendsWeeklySatsang.Text = "Yes";
            sewadarDetailsScreen.txtlkpWeeklySatsangCentre.Text = "Kolkata";
            sewadarDetailsScreen.comboBoxAddressProof.Text = "Passport";
            sewadarDetailsScreen.comboBoxAddressProof.Text = "Ration Card";
            sewadarDetailsScreen.comboBoxAddressProof.Text = "Voter's Card";
            sewadarDetailsScreen.comboBoxAddressProof.Text = "Purchase deed";
            sewadarDetailsScreen.comboBoxAddressProof.Text = "Rent Agreement";
            sewadarDetailsScreen.comboBoxAddressProof.Text = "Sr Citizen	Card";
            sewadarDetailsScreen.comboBoxAddressProof.Text = "Property Tax";
            sewadarDetailsScreen.comboBoxAddressProof.Text = "Society Receipt";
            sewadarDetailsScreen.comboBoxhHypertension.Text = "No";
            sewadarDetailsScreen.comboBoxhDiabetic.Text = "Yes";
            sewadarDetailsScreen.comboBoxSkinProblem.Text = "No";
            sewadarDetailsScreen.comboBoxEpillepsy.Text = "No";
            sewadarDetailsScreen.txtDisability.Text = "No";

           
        }
        public void TearDown()
        {
            _application.KillAndSaveState();
        }

    }
}
