using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DCC.ZOS.ZSM.TEST.Activities;
using DCC.UMB.TAF.View;
using White.Core;
using DCC.UMB.TAF;
using DCC.ZOS.ZSM.TEST.ACT;

namespace DCC.ZOS.ZSM.TEST
{
    public class Program
    {
        [STAThread]
        public static void Main(string[] args)
        {
            TAFManager.StartTAF();
           TestSewadarOperations sewadarOpt = new TestSewadarOperations();
            //TestSewadaDetailsOperations sewadarDetailsOpt = new TestSewadaDetailsOperations();
            //TestSewadarsInformationOperations sewadarInformation = new TestSewadarsInformationOperations();
            try
            {          
               sewadarOpt.Setup();
               sewadarOpt.TestInsertNewSewadarRecord();
               
                //sewadarInformation.TearDown();
               //sewadarDetailsOpt.Setup();
                 }
            finally
            {
                sewadarOpt.TearDown();
                
    
            }

        }
    }
}
