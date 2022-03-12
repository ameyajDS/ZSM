using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Reflection;

namespace DCC.UMB.TAF
{
    public class Logger
    {
        private static StreamWriter writer = null;
        
        static Logger()
        {
            FileInfo execInfo=new FileInfo(Assembly.GetExecutingAssembly().Location);
            
            writer = new StreamWriter(execInfo.Directory.FullName + "\\" + DateTime.Now.ToString("yyyy_MM_dd_hh_mm_ss") + ".log",false);
        }
        public static void Debug(string s)
        {
            string message = string.Format("{0}-M: {1}", DateTime.Now.ToString("mm:ss"), s);
            Console.WriteLine(message);
            try
            {
                writer.WriteLine(message);
                writer.Flush();
            }
            catch (Exception ex)
            {
                //do nothing
            }
        }
        public static void Error(string s)
        {
            string message = string.Format("{0}-M: {1}", DateTime.Now.ToString("mm:ss"), s);
            Console.WriteLine(message);
            try
            {
                writer.WriteLine(message);
                writer.Flush();
            }
            catch (Exception)
            {
                //do nothing
            }
        }
    }
}
