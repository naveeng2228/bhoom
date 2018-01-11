using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETH.Controllers.Misc
{
    public static class SessionController
    {
        public static string VerifyActiveSession(string UserId)
        {
            string ActiveSessionId = string.Empty;
            return ActiveSessionId;
        }

        public static string GenerateNewSessionId(string UserId)
        {
            string SessionId = string.Empty;
            Guid NewSessionId = Guid.NewGuid();
            SessionId = CryptographyController.Encrypt(NewSessionId.ToString(), UserId);
            return SessionId;
        }
    }
}
