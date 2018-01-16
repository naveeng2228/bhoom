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
    public class Role
    {
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public string Description { get; set; }

        //CompanyDetails
        public int CompanyID { get; set; }
        public int WorkAreaID { get; set; }

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
        /// Insert a new Role to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Role objRole = this;
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_Roles";
            switch (DBTYpe)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("RoleID", objRole.RoleID));
                        parms.Add(new SqlParameter("RoleName", objRole.RoleName));
                        parms.Add(new SqlParameter("Description", objRole.Description));
                        parms.Add(new SqlParameter("CompanyID", objRole.CompanyID));
                        parms.Add(new SqlParameter("WorkAreaID", objRole.WorkAreaID));
                        parms.Add(new SqlParameter("CreatedDate", objRole.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objRole.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objRole.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objRole.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objRole.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objRole.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objRole.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a Role in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Role objRole = this;
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_Roles";
            switch (DBTYpe)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("RoleID", objRole.RoleID));
                        parms.Add(new SqlParameter("RoleName", objRole.RoleName));
                        parms.Add(new SqlParameter("Description", objRole.Description));
                        parms.Add(new SqlParameter("CompanyID", objRole.CompanyID));
                        parms.Add(new SqlParameter("WorkAreaID", objRole.WorkAreaID));
                        parms.Add(new SqlParameter("CreatedDate", objRole.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objRole.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objRole.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objRole.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objRole.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objRole.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objRole.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a Role in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            Role objRole = this;
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_Roles";
            switch (DBTYpe)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("RoleID", objRole.RoleID));
                        parms.Add(new SqlParameter("CompanyID", objRole.CompanyID));
                        parms.Add(new SqlParameter("WorkAreaID", objRole.WorkAreaID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a Role in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            Role objRole = this;
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_Roles";
            switch (DBTYpe)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("RoleID", objRole.RoleID));
                        parms.Add(new SqlParameter("CompanyID", objRole.CompanyID));
                        parms.Add(new SqlParameter("WorkAreaID", objRole.WorkAreaID));
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
        private DataTable Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            DataTable _result = null;
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_Roles";
            switch (DBTYpe)
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

                        _result = ObjDB.ExecuteDataTable(Query, parms.ToArray());
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
        public DataTable Select(Status status)
        {
            DataTable _result = null;
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
        public DataTable Select()
        {
            DataTable _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }

        /// <summary>
        /// Mapping roles to users
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="RoleID"></param>
        /// <returns></returns>
        public int UserRoleAssignment(string UserID, int RoleID)
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

                        parms.Add(new SqlParameter("UserId", UserID));
                        parms.Add(new SqlParameter("RoleId", RoleID));

                        parms.Add(new SqlParameter("Flag", 9));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        public int ApplyFormWiseSecurity(List<Permissions> permissions)
        {
            int _result = 0;
            string DBTYpe = HttpContext.Current.Session["__DBTYpe__"].ToString();
            string Query = "SP_UserController";
            switch (DBTYpe)
            {
                // MS-SQL
                case "0":
                    {
                        foreach (Permissions permission in permissions)
                        {
                            DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                            List<SqlParameter> parms = new List<SqlParameter>();

                            parms.Add(new SqlParameter("ModuleID", permission.ModuleID));
                            parms.Add(new SqlParameter("FormID", permission.FormID));
                            parms.Add(new SqlParameter("UserID", permission.UserID));
                            parms.Add(new SqlParameter("RoleId", permission.RoleID));
                            parms.Add(new SqlParameter("CanView", permission.CanView));
                            parms.Add(new SqlParameter("CanSave", permission.CanSave));
                            parms.Add(new SqlParameter("CanDelete", permission.CanDelete));

                            parms.Add(new SqlParameter("Flag", 10));

                            _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        }
                        break;
                    }
            }
            return _result;
        }
    }
}
