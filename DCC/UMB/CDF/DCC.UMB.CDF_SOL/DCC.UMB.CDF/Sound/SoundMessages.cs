using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using DCC.UMB.CDF.Utils;

namespace DCC.UMB.CDF.Sound
{
    internal class SoundManager
    {
        public const UInt32 SND_ASYNC = 1;
        public const UInt32 SND_MEMORY = 4;
    
        // this is the overload we want to play embedded resource...
        [DllImport("Winmm.dll")]
        public static extern bool PlaySound(byte[] data, IntPtr hMod, UInt32 dwFlags);

        private static void PlayWavResource(string savResourceName)
        {
            Stream str = UtilityManager.GetEmbeddedFile(typeof(SoundManager), "Sound." + savResourceName);
            if (str == null)
            {
                return;
            }
            // bring stream into a byte array
            byte[] bStr = new Byte[str.Length];
            str.Read(bStr, 0, (int)str.Length);
            // play the resource
            PlaySound(bStr, IntPtr.Zero, SND_ASYNC | SND_MEMORY);
        }
        public static void PlayWarningSound()
        {
            PlayWavResource("warningMessage.wav");
        }
        public static void PlayErrorSound()
        {
            PlayWavResource("errorMessage.wav");
        }
        public static void PlayPlainSound()
        {
            PlayWavResource("plainMessage.wav");
        }
        public static void PlayFatalSound()
        {
            PlayWavResource("casualityMessage.wav");
        }
    }
}
