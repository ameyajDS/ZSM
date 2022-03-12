using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using White.Core;
using NUnit.Framework;
using System.Threading;
using DCC.UMB.TAF.View;
using White.Core.UIItems;
using System.IO;
using DCC.ZOS.ZSM.TEST.Infrastructure;
using White.Core.InputDevices;


namespace DCC.ZOS.ZSM.TEST.ACT
{
    public class TestSewadarOperations
    {

        private Application application = null;
        public Sewadars sewadarScreen = null;
        public void Setup()
        {
            string currentPath = System.Windows.Forms.Application.StartupPath;
            string appPath = currentPath + @"\..\..\..\..\DCC.ZOS.ZSM_SOL\DCC.ZOS.ZSM\bin\Debug\DCC.ZOS.ZSM.exe";
            application = Application.Launch(appPath);

            Thread.Sleep(8000);

            sewadarScreen = new Sewadars(application, new string[] { "Activities", "Sewadars" });
            
            sewadarScreen.Open();

        }

        public void TestGetRecordUsingSystemId()
        {

            sewadarScreen.txtSewadarId.Text = "1024"; //"866";
            sewadarScreen.Get();
            Assert.IsTrue(sewadarScreen.txtFirstName.Text.Length > 0);
            Assert.IsTrue(sewadarScreen.txtMiddleName.Text.Length > 0);
            Assert.IsTrue(sewadarScreen.txtLastName.Text.Length > 0);
            Assert.IsTrue(sewadarScreen.zsmGenderComboBox.Text.Length > 0);
            Assert.IsTrue(sewadarScreen.dtGlobalStatus.Text.Length > 0);
            Assert.IsTrue(sewadarScreen.sewadarStatusCombo.Text.Length > 0);
            Assert.IsTrue(sewadarScreen.dtInitiation.Text.Length > 0);
            Assert.IsTrue(sewadarScreen.dtGlobalStatus.Text.Length > 0);
            
            Assert.IsTrue(sewadarScreen.initiationPlacesLookup.Text.Length > 0);
            Assert.IsTrue(sewadarScreen.sewadarInitiatedByComboBox.Text.Length > 0);


        }

        public void TestInsertNewSewadarRecord()
        {

            sewadarScreen.Insert();
            SetSewadarData();
            sewadarScreen.Save();
            var saveDialog = sewadarScreen.ObjWindow.MessageBox("Information");
           
            if (saveDialog != null)
            {
                saveDialog.Get<Button>("OK").Click();
                Thread.Sleep(1000);

              //TestSewadaDetailsOperations.InitializeScreen(application,new string[] {"Activities"});    //commneted
               TestSewadaDetailsOperations.InitializeScreen(application, new string[] { "Sewadars Details" });
               
            //  TestSewadaDetailsOperations.InsertSewadarDetailsForId();
                     
                ////SetSewadarInformation();
                //this.Save();
                //saveDialog = _mainWindow.MessageBox("Information");
                //if (saveDialog != null)
                //{
                //    saveDialog.Get<Button>("OK").Click();
                //}
            }
           



        }

        

        //public void InsertSewadarInformationForId(int id)
        //{
        //    this.OpenScreen("Activities", "Sewadars Information");
        //    this.Insert();

        //    this.GetTextField("intSewadarId").Text = id.ToString();
        //    SetSewadarInformation();

        //    this.Save();
        //}

        private void SetSewadarData()
        {
           sewadarScreen.txtFirstName.Text = AutomationHelper.GetRandomString();
           sewadarScreen.txtMiddleName.Text =AutomationHelper.GetRandomString();
           sewadarScreen.txtLastName.Text = AutomationHelper.GetRandomString();
            sewadarScreen.zsmGenderComboBox.Text = "Male";
            sewadarScreen.dtmBirthDate.Text = "01 Mar 1988";
            sewadarScreen.chkMarried.Checked = true;

                             
            sewadarScreen.dtInitiation.Text = "01 Mar 2013";
             sewadarScreen.initiationPlacesLookup.Text = "Kolkata";
             sewadarScreen.sewadarInitiatedByComboBox.UIItem.SetValue("BABA GURINDER SINGH JI");

            /*Keyboard.Instance.HoldKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.ALT);
          
             * //Keyboard.Instance.PressSpecialKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.F4);
            //Keyboard.Instance.LeaveKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.ALT);
            sewadarScreen.InitiatedByCombo.Focus();
             Keyboard.Instance.HoldKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.DOWN);
           // Keyboard.Instance.PressSpecialKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.Enter);
            Keyboard.Instance.LeaveKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.DOWN);
            */
               
               //keyTab = this._mainWindow.Keyboard;
            //keyTab.PressSpecialKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.TAB);
            //}
           // var initiationSelectAValueDlg = sewadarScreen.ObjWindow.MessageBox("Select a value");
           // if (initiationSelectAValueDlg != null)
            //{
              //  initiationSelectAValueDlg.Get<Button>("Close").Click();
           // }

        }
        
        

        //private void SetSewadarInformation()
        //{
        //    this.GetTextField("lkpDepartment").Text = "Langar";
        //    this.GetTextField("lkpSubDepartment").Text = "Jatha 01";
        //    this.GetComboBox("sewadarStatusCombo1").Text = "Temporary";
        //    this.GetTextField("ref1ZsmSatsangCentresLookup").Text = "Mumbai";
        //    this.GetTextField("ref1GrNoLookup1").Text = "G07580";
        //    this.GetTextField("relationsLookup1").Text = "Cousin Brother";
        //    this.GetTextField("ref2ZsmSatsangCentresLookup").Text = "Mumbai";
         //   this.GetTextField("ref2GrNoLookup1").Text = "G07579";
        //    this.GetTextField("relationsLookup2").Text = "Cousin";
        //    this.GetTextField("sponGrNoLookup1").Text = "G00232";
        //    this.GetTextField("ssGrNoLookup3").Text = "G03323";
        //    this.GetTextField("appGrNoLookup2").Text = "G00032";

        //    AttachedKeyboard keyTab = this._mainWindow.Keyboard;
        //    keyTab.PressSpecialKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.TAB);
        //}

        

        
        public void TearDown()
        {
            application.KillAndSaveState();
        }


    }
}
