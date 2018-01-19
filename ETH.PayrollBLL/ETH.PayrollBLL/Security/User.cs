using ETH.BLL.Misc;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace ETH.BLL.Security
{
    public class User
    {
        //Basic Details
        public string CustomerId { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public UserType UserType { get; set; }

        //CompanyDetails
        public string CompanyID { get; set; }
        public string WorkAreaID { get; set; }

        //HINT
        public string PasswordQuestion1 { get; set; }
        public string PasswordAnswer1 { get; set; }
        public string PasswordQuestion2 { get; set; }
        public string PasswordAnswer2 { get; set; }

        //Personal Details
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public Gender Gender { get; set; }
        public MaritalStatus MaritalStatus { get; set; }
        public string DateOfBirth { get; set; }
        public int Age { get; set; }
        public string ProfilePicUrl { get; set; }
        public string UniqueAccessPath { get; set; }

        //Communication Details
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string CountryId { get; set; }
        public string StateId { get; set; }
        public string PrimaryAddress { get; set; }

        //Auto Input Fields
        public string CreatedDate { get; set; }
        public string CreatedTime { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedDate { get; set; }
        public string ModifiedTime { get; set; }
        public string ModifiedBy { get; set; }

        //User Status
        public Status Status { get; set; }

        /// <summary>
        /// Insert a new User to db
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            User objUser = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_UserController";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerId", objUser.CustomerId));
                        parms.Add(new SqlParameter("UserId", objUser.UserId));
                        parms.Add(new SqlParameter("UserName", objUser.UserName));
                        parms.Add(new SqlParameter("Password", objUser.Password));
                        parms.Add(new SqlParameter("UserType", objUser.UserType));
                        parms.Add(new SqlParameter("CompanyID", objUser.CompanyID));
                        parms.Add(new SqlParameter("WorkAreaID", objUser.WorkAreaID));
                        parms.Add(new SqlParameter("PasswordQuestion1", objUser.PasswordQuestion1));
                        parms.Add(new SqlParameter("PasswordAnswer1", objUser.PasswordAnswer1));
                        parms.Add(new SqlParameter("PasswordQuestion2", objUser.PasswordQuestion2));
                        parms.Add(new SqlParameter("PasswordAnswer2", objUser.PasswordAnswer2));
                        parms.Add(new SqlParameter("FirstName", objUser.FirstName));
                        parms.Add(new SqlParameter("MiddleName", objUser.MiddleName));
                        parms.Add(new SqlParameter("LastName", objUser.LastName));
                        parms.Add(new SqlParameter("Gender", objUser.Gender));
                        parms.Add(new SqlParameter("MaritalStatus", objUser.MaritalStatus));
                        parms.Add(new SqlParameter("DateOfBirth", objUser.DateOfBirth));
                        parms.Add(new SqlParameter("Age", objUser.Age));
                        parms.Add(new SqlParameter("ProfilePicUrl", objUser.ProfilePicUrl));
                        parms.Add(new SqlParameter("UniqueAccessPath", objUser.UniqueAccessPath));
                        parms.Add(new SqlParameter("Mobile", objUser.Mobile));
                        parms.Add(new SqlParameter("Email", objUser.Email));
                        parms.Add(new SqlParameter("CountryId", objUser.CountryId));
                        parms.Add(new SqlParameter("StateId", objUser.StateId));
                        parms.Add(new SqlParameter("PrimaryAddress", objUser.PrimaryAddress));
                        parms.Add(new SqlParameter("CreatedDate", objUser.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objUser.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objUser.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objUser.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objUser.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objUser.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objUser.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a user in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            User objUser = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_UserController";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerId", objUser.CustomerId));
                        parms.Add(new SqlParameter("UserId", objUser.UserId));
                        parms.Add(new SqlParameter("UserName", objUser.UserName));
                        parms.Add(new SqlParameter("Password", objUser.Password));
                        parms.Add(new SqlParameter("UserType", objUser.UserType));
                        parms.Add(new SqlParameter("CompanyID", objUser.CompanyID));
                        parms.Add(new SqlParameter("WorkAreaID", objUser.WorkAreaID));
                        parms.Add(new SqlParameter("PasswordQuestion1", objUser.PasswordQuestion1));
                        parms.Add(new SqlParameter("PasswordAnswer1", objUser.PasswordAnswer1));
                        parms.Add(new SqlParameter("PasswordQuestion2", objUser.PasswordQuestion2));
                        parms.Add(new SqlParameter("PasswordAnswer2", objUser.PasswordAnswer2));
                        parms.Add(new SqlParameter("FirstName", objUser.FirstName));
                        parms.Add(new SqlParameter("MiddleName", objUser.MiddleName));
                        parms.Add(new SqlParameter("LastName", objUser.LastName));
                        parms.Add(new SqlParameter("Gender", objUser.Gender));
                        parms.Add(new SqlParameter("MaritalStatus", objUser.MaritalStatus));
                        parms.Add(new SqlParameter("DateOfBirth", objUser.DateOfBirth));
                        parms.Add(new SqlParameter("Age", objUser.Age));
                        parms.Add(new SqlParameter("ProfilePicUrl", objUser.ProfilePicUrl));
                        parms.Add(new SqlParameter("UniqueAccessPath", objUser.UniqueAccessPath));
                        parms.Add(new SqlParameter("Mobile", objUser.Mobile));
                        parms.Add(new SqlParameter("Email", objUser.Email));
                        parms.Add(new SqlParameter("CountryId", objUser.CountryId));
                        parms.Add(new SqlParameter("StateId", objUser.StateId));
                        parms.Add(new SqlParameter("PrimaryAddress", objUser.PrimaryAddress));
                        parms.Add(new SqlParameter("CreatedDate", objUser.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objUser.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objUser.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objUser.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objUser.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objUser.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objUser.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a user in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            User objUser = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_UserController";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerId", objUser.CustomerId));
                        parms.Add(new SqlParameter("UserId", objUser.UserId));
                        parms.Add(new SqlParameter("CompanyID", objUser.CompanyID));
                        parms.Add(new SqlParameter("WorkAreaID", objUser.WorkAreaID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a State in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            User objUser = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_UserController";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerId", objUser.CustomerId));
                        parms.Add(new SqlParameter("UserId", objUser.UserId));
                        parms.Add(new SqlParameter("CompanyID", objUser.CompanyID));
                        parms.Add(new SqlParameter("WorkAreaID", objUser.WorkAreaID));
                        parms.Add(new SqlParameter("Status", Status.Deleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.FullDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Private method to select based on status
        /// </summary>
        /// <param name="status"></param>
        /// <param name="flag"></param>
        /// <param name="ShowAll"></param>
        /// <returns></returns>
        private List<User> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<User> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_UserController";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        if (!ShowAll)
                        {
                            parms.Add(new SqlParameter("Status", status));
                        }
                        parms.Add(new SqlParameter("Flag", flag));

                        DataTable _data = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        _result = Helper.DataTableToList<User>(_data);

                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Select based on status
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        public List<User> Select(Status status)
        {
            List<User> _result = null;
            switch (status)
            {
                case Status.Active:
                    {
                        _result = Select(status, DB_Flags.SelectActive);
                        break;
                    }

                case Status.Inactive:
                    {
                        _result = Select(status, DB_Flags.SelectInactive);
                        break;
                    }

                case Status.PartiallyDeleted:
                    {
                        _result = Select(status, DB_Flags.SelectPartialDeleted);
                        break;
                    }

                case Status.Deleted:
                    {
                        _result = Select(status, DB_Flags.SelectFullDeleted);
                        break;
                    }

                default:
                    {
                        _result = Select(status, DB_Flags.SelectActive);
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Select all irrespective of status
        /// </summary>
        /// <returns></returns>
        public List<User> Select()
        {
            List<User> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }
    }
}
