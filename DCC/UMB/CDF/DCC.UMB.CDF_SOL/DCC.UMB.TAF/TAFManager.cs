using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace DCC.UMB.TAF
{
    public class TAFManager
    {
        public static void StartTAF()
        {
            //[[this is set to tell CDF not to show suggestion box
            System.Environment.SetEnvironmentVariable("TAF_ENV", "TRUE", EnvironmentVariableTarget.User);
            //]]
        }
        public static void StopTAF()
        {
            System.Environment.SetEnvironmentVariable("TAF_ENV", null, EnvironmentVariableTarget.User);
        }

        private static int screenLoadWaitSeconds = 3;
        /// <summary>
        /// Specifies how many seconds TAF should wait after invoking a screen via menu click. Deafult value is 3
        /// </summary>
        public static int ScreenLoadWaitSeconds
        {
            get { return screenLoadWaitSeconds; }
            set { screenLoadWaitSeconds = value; }
        }

        private static int screenSaveWaitSeconds = 3;
        /// <summary>
        /// Specifies how many seconds TAF should wait after save button is pressed. Default value is 3
        /// </summary>
        public static int ScreenSaveWaitSeconds
        {
            get { return screenSaveWaitSeconds; }
            set { screenSaveWaitSeconds = value; }
        }

        private static int screenNavigationWaitSeconds = 3;
        /// <summary>
        /// Specifies how many seconds TAF shouold wait when Next, Back, Last or First operations are invoked on a screen. Default value is 3.
        /// </summary>
        public static int ScreenNavigationWaitSeconds
        {
            get { return screenNavigationWaitSeconds; }
            set { screenNavigationWaitSeconds = value; }
        }

        /// <summary>
        /// Generates a unique string from current system datetime.
        /// </summary>
        public static string UniqueString
        {
            get
            {
                DateTime dtm = DateTime.Now;
                Thread.Sleep(20);
                return dtm.ToString("ddMMyyHHmmss");
            }
        }

        /// <summary>
        /// This function generates a guid and then chops off that guid to the length specified.
        /// If 0 is specified as length then the entire guid is returned.
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string GetSmallUniqueString(int length)
        {
            if (length > 0)
            {
                return Guid.NewGuid().ToString().Replace("-", "_").Substring(0, length - 1);
            }
            else
            {
                return Guid.NewGuid().ToString().Replace("-", "_");
            }
        }
    }
    public enum GridRowStates
    {
        New = 1,
        Old,
        Updated,
        Deleted,
        None
    }
}
