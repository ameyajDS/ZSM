using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Windows.Forms;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;

namespace SamplePackage
{
    
    public partial class SampleScreen : AbstractScreen
    {
        public SampleScreen()
        {
            InitializeComponent();
        }

        
        public override string ScreenId
        {
            get
            {
                //TODO -- Screen ID goes here
                return "Your Screen Id goes here";
            }
        }

        public override DCCGrid ListViewGrid
        {
            get
            {
                return this.grdList;
            }
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode,screenParameters);
            if(uiMode==UIModes.Insert)
            {
                ClearControlsAndSetLooksAsPerCurrentMode(true);
                //TODO -- your custom after clearing the screen controls go here
            }
            else if(uiMode==UIModes.Query)
            {
                ClearControlsAndSetLooksAsPerCurrentMode(true);
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControlsAndSetLooksAsPerCurrentMode(true);
            }
            else if(uiMode == UIModes.Browse)
            {
                this.listBrowseSplitContainer.Panel2Collapsed = true;
                this.listBrowseSplitContainer.Panel1Collapsed = false;
            }
            else if (uiMode == UIModes.List)
            {
                this.listBrowseSplitContainer.Panel2Collapsed = false;
                this.listBrowseSplitContainer.Panel1Collapsed = true;
            }
        }
        

        public override bool IsReadyToSave()
        {
            //TODO -- Implement the final validation logic before the screen is saved. 
            return true;
        }






        public override void ClearControls()
        {
            //TODO -- Clear the screen controls here
        }

        
        public override void Save()
        {
            //TODO implement the Save method here
        }
        
        
    }
}