using ETH.BLL.Security;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
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
            LoadSessions(UserId);
            if (HttpContext.Current.Session["__Config__"] != null)
            {
                Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
                LoginHistory[] objLoginHistory = ObjConfig.LoginHistory;
                foreach (LoginHistory history in objLoginHistory)
                {
                    if (history.UserId == UserId && history.hasActiveSession == true)
                    {
                        ActiveSessionId = history.SessionId;
                        return ActiveSessionId;
                    }
                }
            }
            return ActiveSessionId;
        }

        private static void LoadSessions(string UserId)
        {
            DataTable _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_LoginHistory";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("UserId", UserId));
                        // Flag: 0 refers to VerifyUser
                        parms.Add(new SqlParameter("Flag", 11));
                        _result = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        IList<LoginHistory> logHIstory = _result.AsEnumerable().Select(row => new LoginHistory {
                            LoginId = row.Field<Int64>("LoginId"),
                            UserId = row.Field<string>("UserId"),
                            UserName = row.Field<string>("UserName"),
                            IPAddress = row.Field<string>("IPAddress"),
                            SessionId = row.Field<string>("SessionId"),
                            LastLoginDate = row.Field<string>("LastLoginDate"),
                            LastLoginTime = row.Field<string>("LastLoginTime"),
                            CreatedDate = row.Field<string>("CreatedDate"),
                            CreatedTime = row.Field<string>("CreatedTime"),
                            hasActiveSession = row.Field<bool>("hasActiveSession"),
                            AuthenticatedOTP = row.Field<string>("AuthenticatedOTP")
                        }).ToList();
                        ObjConfig.LoginHistory = logHIstory.ToArray();
                        HttpContext.Current.Session["__Config__"] = ObjConfig;
                        break;
                    }
            }
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
