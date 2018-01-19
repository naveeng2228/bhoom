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
    public class Department
    {
        public string CompanyID { get; set; }
        public string WorkareaID { get; set; }
        public string DivisionID { get; set; }
        public string DepartmentID { get; set; }
        public string DepartmentName { get; set; }

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
        /// Insert a new Department to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Department objDepartment = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Department";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objDepartment.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objDepartment.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objDepartment.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objDepartment.DepartmentID));
                        parms.Add(new SqlParameter("DepartmentName", objDepartment.DepartmentName));
                        parms.Add(new SqlParameter("CreatedDate", objDepartment.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objDepartment.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objDepartment.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objDepartment.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objDepartment.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objDepartment.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objDepartment.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a Department in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Department objDepartment = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Department";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        
                        parms.Add(new SqlParameter("CompanyID", objDepartment.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objDepartment.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objDepartment.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objDepartment.DepartmentID));
                        parms.Add(new SqlParameter("DepartmentName", objDepartment.DepartmentName));
                        parms.Add(new SqlParameter("ModifiedDate", objDepartment.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objDepartment.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objDepartment.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objDepartment.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a Department in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            Department objDepartment = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Department";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objDepartment.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objDepartment.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objDepartment.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objDepartment.DepartmentID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a Department in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            Department objDepartment = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Department";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objDepartment.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objDepartment.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objDepartment.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objDepartment.DepartmentID));
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
        private List<Department> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<Department> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Department";
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
                        _result = Helper.DataTableToList<Department>(_data);
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
        public List<Department> Select(Status status)
        {
            List<Department> _result = null;
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
        public List<Department> Select()
        {
            List<Department> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }
    }
}