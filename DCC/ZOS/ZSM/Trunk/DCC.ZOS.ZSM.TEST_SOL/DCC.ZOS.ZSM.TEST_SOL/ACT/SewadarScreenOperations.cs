//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using DCC.UMB.TAF.View;
//using System.IO;
//using White.Core.UIItems.WindowItems;
//using White.Core;
//using White.Core.UIItems;
//using White.Core.InputDevices;

//namespace DCC.ZOS.ZSM.TEST.ACT
//{
//    public class SewadarScreenOperations : TAFAbstractScreen
//    {
//        private Window _mainWindow;

//        public Boolean GetSuccess { get; private set; }
//        public Boolean QuerySuccess { get; private set; }
//        public Boolean InsertSuccess { get; private set; }

//        public SewadarScreenOperations(Application application, params string[] menuPath) : base(application, menuPath)
//        {
//            _mainWindow = application.GetWindow("Zonal Sewadar Management");
//        }

                
//        public Boolean GetRecordUsingSystemId(int id)
//        {
//            this.Open("Activities", "Sewadars");
//            this.GetTextField("intSewadarId").Text = id.ToString();
//            this.Get();
//            this.Clear();
//            this.Close();
//            return false;
//        }
        
//        public void InsertNewSewadarRecord()
//        {
//            this.OpenScreen("Activities", "Sewadars");
//            this.Insert();
//          //  EvaluateAllItems();
//            SetSewadarData();
//            this.Save();
//            Window saveDialog = _mainWindow.MessageBox("Information");
//            if (saveDialog != null)
//            {
//                saveDialog.Get<Button>("OK").Click();
//            //    EvaluateAllItems();
//                SetSewadarDetails();
//                updateGridRemarks();
//                this.Save();
//           //     EvaluateAllItems();
//                SetSewadarInformation();
//                this.Save();
//                saveDialog = _mainWindow.MessageBox("Information");
//                if (saveDialog != null)
//                {
//                    saveDialog.Get<Button>("OK").Click();
//                }
//            }
//        }
        
//        public void InsertSewadarDetailsForId(int id)
//        {
//            this.OpenScreen("Activities", "Sewadars Details");
//            this.Insert();
//            this.GetTextField("intSewadarId").Text = id.ToString();
//            SetSewadarDetails();
//            updateGridRemarks();
//            this.Save();
//        }

//        public void InsertSewadarInformationForId(int id)
//        {
//            this.OpenScreen("Activities", "Sewadars Information");
//            this.Insert();
            
//            this.GetTextField("intSewadarId").Text = id.ToString();
//            SetSewadarInformation();
            
//            this.Save();
//        }

//        private void SetSewadarData()
//        {
//            this.GetTextField("txtFirstName").Text = GetRandomString();
//            this.GetTextField("txtMiddleName").Text = GetRandomString();
//            this.GetTextField("txtSurName").Text = GetRandomString();
//            this.GetComboBox("zsmGenderCombo1").Text = "Male";
//            this.GetTextField("dtmBirthDate").Text = "01 Mar 1988";
//        }

//        private void SetSewadarDetails()
//        {

//            this.GetTextField("txtAddress1").Text = GetRandomString();
//            this.GetTextField("txtAddress2").Text = GetRandomString();
//            this.GetTextField("CountryLookup").Text = "India";
//            this.GetTextField("StateLookup").Text = "Maharashtra";
//            this.GetTextField("DistrictorCitiesLookup").Text = "Mumbai";
//            this.GetTextField("postOfficeOrCityLookup").Text = "Bandra";
//            this.GetTextField("txtPin").Text = "400040";
//            this.GetTextArea("txtMobilePh").Text = "99990 99990";
//            this.GetTextArea("txtOffPh").Text = "022 24039 3274";
//            this.GetTextArea("txtResidencePh").Text = "022 26742 4499";
//            this.GetComboBox("cmbOccupation").Text = "Service";
//            this.GetComboBox("cmbAttendsWeeklySatsang").Text = "Yes";
//            this.GetTextField("lkpWeeklySatsangCentre").Text = "BANDRA";
//            this.GetComboBox("cmbAddressProof").Text = "Passport";
//            this.GetComboBox("cmbAddressProof").Text = "Ration Card";
//            this.GetComboBox("cmbAddressProof").Text = "Voter's Card";
//            this.GetComboBox("cmbAddressProof").Text = "Purchase deed";
//            this.GetComboBox("cmbAddressProof").Text = "Rent Agreement";
//            this.GetComboBox("cmbAddressProof").Text = "Sr Citizen	Card";
//            this.GetComboBox("cmbAddressProof").Text = "Property Tax";
//            this.GetComboBox("cmbAddressProof").Text = "Society Receipt";
//            this.GetComboBox("cmbHypertension").Text = "No";
//            this.GetComboBox("cmbDiabetic").Text = "Yes";
//            this.GetComboBox("cmbSkinProblem").Text = "No";
//            this.GetComboBox("cmbEpillepsy").Text = "No";
//        }

//        private void SetSewadarInformation()
//        {
//            this.GetTextField("lkpDepartment").Text = "Langar";
//            this.GetTextField("lkpSubDepartment").Text = "Jatha 01";
//            this.GetComboBox("sewadarStatusCombo1").Text = "Temporary";
//            this.GetTextField("ref1ZsmSatsangCentresLookup").Text = "Mumbai";
//            this.GetTextField("ref1GrNoLookup1").Text = "G07580";
//            this.GetTextField("relationsLookup1").Text = "Cousin Brother";
//            this.GetTextField("ref2ZsmSatsangCentresLookup").Text = "Mumbai";
//            this.GetTextField("ref2GrNoLookup1").Text = "G07579";
//            this.GetTextField("relationsLookup2").Text = "Cousin";
//            this.GetTextField("sponGrNoLookup1").Text = "G00232";
//            this.GetTextField("ssGrNoLookup3").Text = "G03323";
//            this.GetTextField("appGrNoLookup2").Text = "G00032";

//            AttachedKeyboard keyTab = this._mainWindow.Keyboard;
//            keyTab.PressSpecialKey(White.Core.WindowsAPI.KeyboardInput.SpecialKeys.TAB);
//        }

//        private void updateGridRemarks()
//        {
//            TAFGrid grd = this.GetGrid("grdRemarks");
//            grd.InsertRowBelow();
//            //grd.SetStringValue(0,new enum, "Annotations", true);
//            grd.SetCellValue(0, 1, "Abc", true);
//        }

//        private string GetRandomString()
//        {
//            return `.GetRandomFileName().Replace(".","");
//        }
//    }
//}
