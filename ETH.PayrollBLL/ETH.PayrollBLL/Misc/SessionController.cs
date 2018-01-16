using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ETH.BLL.Misc
{
    public static class SessionController
    {
        public static string VerifyActiveSession(string UserId)
        {
            string ActiveSessionId = string.Empty;
            if (HttpContext.Current.Session["__LoginHistory__"] != null)
            {
                LoginHistory objLoginHistory = (LoginHistory)HttpContext.Current.Session["__LoginHistory__"];
                if (objLoginHistory.UserId == UserId && objLoginHistory.hasActiveSession == true)
                {
                    ActiveSessionId = objLoginHistory.SessionId;
                }
            }
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
