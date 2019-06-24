using System;
using System.Collections.Generic;
using System.Text;

namespace System
{
    class PlatformApis
    {
        public static string GetOSVersion()
        {
            return "1.0.0";
        }

        public static string GetOSName()
        {
            return Environment.OSVersion.ToString();
        }
    }
}
