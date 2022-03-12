using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DCC.UMB.CDF.Crypto;

namespace DCC.UMB.CDF.Web.Launcher.auth
{
    public class CommandArgsProvider
    {
        private static List<KeyValuePair<Guid, string>> lstArgs = new List<KeyValuePair<Guid, string>>();
        public static void AddGuid(Guid guid, string strCommandLineArgs)
        {
            lstArgs.Add(new KeyValuePair<Guid, string>(guid, strCommandLineArgs));
        }
        public static string GetArgsAndDisposeGuid(Guid guid)
        {
            string targetArgs = null;
            object targetPairToDispose = null;
            foreach (KeyValuePair<Guid, string> args in lstArgs)
            {
                if (args.Key == guid)
                {
                    targetArgs = args.Value;
                    targetPairToDispose = args;
                }
            }
            if (targetPairToDispose != null)
            {
                lstArgs.Remove((KeyValuePair<Guid, string>)targetPairToDispose);
                return Encrypt(targetArgs);
            }
            return null;
        }
        public static string Encrypt(string plainText)
        {            
            return EncryptDecrypt.Encrypt(plainText);
        }

        public static string Decrypt(string cipherText)
        {
            return EncryptDecrypt.Decrypt(cipherText);
        }
    }
}
