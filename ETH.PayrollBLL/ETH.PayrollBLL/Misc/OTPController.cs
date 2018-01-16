using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETH.BLL.Misc
{
    public static class OTPController
    {
        public static string GenerateOTP(string SessionId)
        {
            string NewOTP = string.Empty;
            Random OTPGenerator = new Random();
            NewOTP = OTPGenerator.Next(0, 1000000).ToString("D6");
            SaveOTP(SessionId);
            return NewOTP;
        }

        private static void SaveOTP(string sessionId)
        {            
            //Save To DB Code
        }

        public static bool VerifyOTP(string SessionId, string OTP)
        {
            bool Verified = false;
            //Verify from DB Code
            return Verified;
        }
    }
}
