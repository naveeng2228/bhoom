﻿using ETH.BLL.Security;
using ETH.BLL.Misc;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

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
                objLogin.hasActiveSession = ActiveSessionID == string.Empty ? false : true;
                if (LastLoginDateInfo.Count > 0)
                {
                    objLogin.LastLoginDate = LastLoginDateInfo.Where(x => x.Key == "Date").FirstOrDefault().Value;
                    objLogin.LastLoginTime = LastLoginDateInfo.Where(x => x.Key == "Time").FirstOrDefault().Value;
                }

                if (InsertLoginHistory(objLogin) > 0)
                {
                    return objLogin;
                }

            }
            return null;
        }

        /// <summary>
        /// This method will insert a new login entry to LoginHistory Table
        /// </summary>
        /// <param name="objLogin"></param>
        /// <returns></returns>
        private int InsertLoginHistory(LoginHistory objLogin)
        {
            int _result = 0;
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_UserController";
            switch (DBTYpe)
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
                        parms.Add(new SqlParameter("hasActiveSession", objLogin.hasActiveSession));
                        parms.Add(new SqlParameter("AuthenticatedOTP", objLogin.AuthenticatedOTP));
                        parms.Add(new SqlParameter("CreatedDate", objLogin.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objLogin.CreatedTime));

                        // Flag: 3 refers to Insert record to LoginHistory Table
                        parms.Add(new SqlParameter("Flag", 3));
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
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_UserController";
            switch (DBTYpe)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("sessionId", sessionId));
                        // Flag: 0 refers to VerifyUser
                        parms.Add(new SqlParameter("Flag", 2));
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
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_UserController";
            switch (DBTYpe)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("UserId", UserId));
                        // Flag: 0 refers to VerifyUser
                        parms.Add(new SqlParameter("Flag", 1));
                        DataTable _result = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        if(_result != null)
                        {
                            if(_result.Rows.Count > 0)
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
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_UserController";
            switch(DBTYpe)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("username", _Username));
                        parms.Add(new SqlParameter("password", _Password));
                        // Flag: 0 refers to VerifyUser
                        parms.Add(new SqlParameter("Flag", 0));
                        Object _result = ObjDB.ExecuteScalar(Query, parms.ToArray());
                        UserId = _result != DBNull.Value ? _result.ToString() : string.Empty;
                        break;
                    }
            }
            return UserId;
        }
    }
}
