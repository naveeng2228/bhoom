using ETH.BLL.Security;
using ETH.BLL.Misc;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using ETH.BLL;

namespace ETH.SecurityManagement
{
    public class LoginManagement
    {
        private string _Username, _Password;

        /// <summary>
        /// This method will verify user login and returns user object
        /// </summary>
        /// <param name="Username"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        public LoginHistory VerifyLogin(string Username, string Password)
        {
            _Username = Username;
            _Password = Password;

            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string CurrentDate = DateTime.Now.ToString(ObjConfig.AppDateFormat);
            string CurrentTime = DateTime.Now.ToString(ObjConfig.AppTimeFormat);

            string UserId = VerifyUser();
            if (UserId != string.Empty)
            {
                // Verify if user already have a active session
                string ActiveSessionID = SessionController.VerifyActiveSession(UserId);

                // Get user's most recent login info
                List<KeyValuePair<string, string>> LastLoginDateInfo = GetLastLoginInfo(UserId);


                LoginHistory objLogin = new LoginHistory();
                objLogin.UserName = Username;
                objLogin.UserId = UserId;
                objLogin.IPAddress = NetworkController.GetIPAddress();
                objLogin.SessionId = ActiveSessionID == string.Empty ? SessionController.GenerateNewSessionId(UserId) : ActiveSessionID;
                objLogin.hasActiveSession = true;
                objLogin.LastLoginDate = CurrentDate;
                objLogin.LastLoginTime = CurrentTime;
                if (LastLoginDateInfo.Count > 0)
                {
                    objLogin.LastLoginDate = LastLoginDateInfo.Where(x => x.Key == "Date").FirstOrDefault().Value;
                    objLogin.LastLoginTime = LastLoginDateInfo.Where(x => x.Key == "Time").FirstOrDefault().Value;
                }
                objLogin.CreatedDate = CurrentDate;
                objLogin.CreatedTime = CurrentTime;

                if (InsertLoginHistory(objLogin) > 0)
                {
                    DataTable dtUserInfo = GetUserByUserID(UserId);
                    IList<User> users = dtUserInfo.AsEnumerable().Select(row => new User
                    {
                        //Age = row.Field<int>("Age"),
                        CompanyID = CheckDBNull(row.Field<string>("CompanyID")),
                        CountryId = CheckDBNull(row.Field<string>("CountryId")),
                        CreatedBy = CheckDBNull(row.Field<string>("CreatedBy")),
                        CreatedDate = CheckDBNull(row.Field<string>("CreatedDate")),
                        //CreatedTime = CheckDBNull(row.Field<string>("CreatedTime")),
                        //CustomerId = CheckDBNull(row.Field<string>("CustomerId")),
                        DateOfBirth = CheckDBNull(row.Field<string>("DateOfBirth")),
                        Email = CheckDBNull(row.Field<string>("Email")),
                        FirstName = CheckDBNull(row.Field<string>("FirstName")),
                        Gender = row.Field<Gender>("Gender"),
                        LastName = CheckDBNull(row.Field<string>("LastName")),
                        //MaritalStatus = row.Field<MaritalStatus>("MaritalStatus")),
                        MiddleName = CheckDBNull(row.Field<string>("MiddleName")),
                        Mobile = CheckDBNull(row.Field<Int64>("Mobile")),
                        ModifiedBy = CheckDBNull(row.Field<string>("ModifiedBy")),
                        ModifiedDate = CheckDBNull(row.Field<string>("ModifiedDate")),
                        //ModifiedTime = CheckDBNull(row.Field<string>("ModifiedTime")),
                        Password = CheckDBNull(row.Field<string>("Password")),
                        PasswordAnswer1 = CheckDBNull(row.Field<string>("PasswordAnswer1")),
                        PasswordAnswer2 = CheckDBNull(row.Field<string>("PasswordAnswer2")),
                        PasswordQuestion1 = CheckDBNull(row.Field<string>("PasswordQuestion1")),
                        PasswordQuestion2 = CheckDBNull(row.Field<string>("PasswordQuestion2")),
                        PrimaryAddress = CheckDBNull(row.Field<string>("PrimaryAddress")),
                        ProfilePicUrl = CheckDBNull(row.Field<string>("ProfilePicUrl")),
                        StateId = CheckDBNull(row.Field<string>("StateId")),
                        Status = row.Field<Status>("Status"),
                        UniqueAccessPath = CheckDBNull(row.Field<string>("UniqueAccessPath")),
                        UserId = CheckDBNull(row.Field<int>("Id")),
                        UserName = CheckDBNull(row.Field<string>("UserName")),
                        UserType = row.Field<UserType>("UserType"),
                        WorkAreaID = CheckDBNull(row.Field<string>("WorkAreaID"))
                    }).ToList();
                    if (users.Count > 0)
                    {
                        ObjConfig.UserInfo = users[0];
                        HttpContext.Current.Session["__Config__"] = ObjConfig;
                    }
                    return objLogin;
                }

            }
            return null;
        }

        private string CheckDBNull(Object Value)
        {
            return Value == DBNull.Value ? Value.ToString() : string.Empty;
        }

        /// <summary>
        /// This method will insert a new login entry to LoginHistory Table
        /// </summary>
        /// <param name="objLogin"></param>
        /// <returns></returns>
        private int InsertLoginHistory(LoginHistory objLogin)
        {
            int _result = 0;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_LoginHistory";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("UserId", objLogin.UserId));
                        parms.Add(new SqlParameter("UserName", objLogin.UserName));

                        parms.Add(new SqlParameter("LastLoginDate", objLogin.LastLoginDate));
                        parms.Add(new SqlParameter("LastLoginTime", objLogin.LastLoginTime));
                        parms.Add(new SqlParameter("IPAddress", objLogin.IPAddress));
                        parms.Add(new SqlParameter("SessionId", objLogin.SessionId));
                        parms.Add(new SqlParameter("hasActiveSession", objLogin.hasActiveSession.ToString().ToLower()));
                        parms.Add(new SqlParameter("AuthenticatedOTP", objLogin.AuthenticatedOTP));
                        parms.Add(new SqlParameter("CreatedDate", objLogin.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objLogin.CreatedTime));

                        // Flag: 3 refers to Insert record to LoginHistory Table
                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));
                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// This method will get userid based on sessionid.
        /// </summary>
        /// <param name="sessionId"></param>
        /// <returns></returns>
        public string GetUserIdBySession(string sessionId)
        {
            string UserId = string.Empty;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_LoginHistory";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("sessionId", sessionId));
                        // Flag: 0 refers to VerifyUser
                        parms.Add(new SqlParameter("Flag", 10));
                        Object _result = ObjDB.ExecuteScalar(Query, parms.ToArray());
                        UserId = _result != DBNull.Value ? _result.ToString() : string.Empty;
                        break;
                    }
            }
            return UserId;
        }

        /// <summary>
        /// This method will get the last login info based on parms.
        /// </summary>
        /// <param name="UserId"></param>
        /// <returns></returns>
        private List<KeyValuePair<string, string>> GetLastLoginInfo(string UserId)
        {
            List<KeyValuePair<string, string>> Info = new List<KeyValuePair<string, string>>();
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
                        parms.Add(new SqlParameter("Flag", 9));
                        DataTable _result = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        if (_result != null)
                        {
                            if (_result.Rows.Count > 0)
                            {
                                DataRow _row = _result.Rows[0];
                                if (_row["LastLoginDate"] != DBNull.Value)
                                {
                                    KeyValuePair<string, string> rec = new KeyValuePair<string, string>("Date", _row["LastLoginDate"].ToString());
                                    Info.Add(rec);
                                }
                                if (_row["LastLoginTime"] != DBNull.Value)
                                {
                                    KeyValuePair<string, string> rec = new KeyValuePair<string, string>("Time", _row["LastLoginTime"].ToString());
                                    Info.Add(rec);
                                }
                            }
                        }
                        break;
                    }
            }
            return Info;
        }

        /// <summary>
        /// This method will verify whether the user exists or not
        /// </summary>
        /// <returns></returns>
        private string VerifyUser()
        {
            string UserId = string.Empty;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_UserController";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("username", _Username));
                        parms.Add(new SqlParameter("password", _Password));
                        // Flag: 0 refers to VerifyUser
                        parms.Add(new SqlParameter("Flag", 9));
                        Object _result = ObjDB.ExecuteScalar(Query, parms.ToArray());
                        UserId = _result != DBNull.Value ? _result.ToString() : string.Empty;
                        break;
                    }
            }
            return UserId;
        }

        /// <summary>
        /// This method will get userid based on sessionid.
        /// </summary>
        /// <param name="sessionId"></param>
        /// <returns></returns>
        public DataTable GetUserByUserID(string UserId)
        {
            DataTable _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_UserController";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("UserId", UserId));
                        // Flag: 0 refers to VerifyUser
                        parms.Add(new SqlParameter("Flag", 10));
                        _result = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }
    }
}
