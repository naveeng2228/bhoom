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
                        List<LoginHistory> logHIstory = Helper.DataTableToList<LoginHistory>(_result);
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
