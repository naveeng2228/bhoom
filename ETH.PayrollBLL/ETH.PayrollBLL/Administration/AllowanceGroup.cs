using ETH.BLL.Misc;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace ETH.BLL.Administration
{
    public class AllowanceGroup
    {
        public string AllowanceGroupID { get; set; }
        public string AllowanceGroupName { get; set; }

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
        /// Insert a new AllowanceGroup to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            AllowanceGroup objAllowanceGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_AllowanceGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("AllowanceGroupID", objAllowanceGroup.AllowanceGroupID));
                        parms.Add(new SqlParameter("AllowanceGroupName", objAllowanceGroup.AllowanceGroupName));
                        parms.Add(new SqlParameter("CreatedDate", objAllowanceGroup.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objAllowanceGroup.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objAllowanceGroup.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objAllowanceGroup.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objAllowanceGroup.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objAllowanceGroup.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objAllowanceGroup.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a AllowanceGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            AllowanceGroup objAllowanceGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_AllowanceGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("AllowanceGroupID", objAllowanceGroup.AllowanceGroupID));
                        parms.Add(new SqlParameter("AllowanceGroupName", objAllowanceGroup.AllowanceGroupName));
                        parms.Add(new SqlParameter("ModifiedDate", objAllowanceGroup.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objAllowanceGroup.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objAllowanceGroup.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objAllowanceGroup.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a AllowanceGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            AllowanceGroup objAllowanceGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_AllowanceGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("AllowanceGroupID", objAllowanceGroup.AllowanceGroupID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a AllowanceGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            AllowanceGroup objAllowanceGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_AllowanceGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("AllowanceGroupID", objAllowanceGroup.AllowanceGroupID));
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
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_AllowanceGroup";
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
    }
}