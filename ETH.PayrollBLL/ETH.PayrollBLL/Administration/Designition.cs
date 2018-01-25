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
    public class Designition
    {
        public string CompanyID { get; set; }
        public string WorkareaID { get; set; }
        public string DivisionID { get; set; }
        public string DepartmentID { get; set; }
        public string DesignitionID { get; set; }
        public string DesignitionName { get; set; }

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
        /// Insert a new Designition to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Designition objDesignition = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Designition";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objDesignition.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objDesignition.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objDesignition.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objDesignition.DepartmentID));
                        parms.Add(new SqlParameter("DesignitionID", objDesignition.DesignitionID));
                        parms.Add(new SqlParameter("DesignitionName", objDesignition.DesignitionName));
                        parms.Add(new SqlParameter("CreatedDate", objDesignition.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objDesignition.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objDesignition.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objDesignition.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objDesignition.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objDesignition.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objDesignition.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Insert).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a Designition in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Designition objDesignition = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Designition";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objDesignition.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objDesignition.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objDesignition.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objDesignition.DepartmentID));
                        parms.Add(new SqlParameter("DesignitionID", objDesignition.DesignitionID));
                        parms.Add(new SqlParameter("DesignitionName", objDesignition.DesignitionName));
                        parms.Add(new SqlParameter("ModifiedDate", objDesignition.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objDesignition.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objDesignition.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objDesignition.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Update).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a Designition in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            Designition objDesignition = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Designition";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objDesignition.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objDesignition.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objDesignition.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objDesignition.DepartmentID));
                        parms.Add(new SqlParameter("DesignitionID", objDesignition.DesignitionID));
                        parms.Add(new SqlParameter("Status", ((int)Status.PartiallyDeleted).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.PartialDelete).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a Designition in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            Designition objDesignition = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Designition";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objDesignition.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objDesignition.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objDesignition.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objDesignition.DepartmentID));
                        parms.Add(new SqlParameter("DesignitionID", objDesignition.DesignitionID));
                        parms.Add(new SqlParameter("Status", ((int)Status.Deleted).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.FullDelete).ToString()));

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
        private List<Designition> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<Designition> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Designition";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        if (!ShowAll)
                        {
                            parms.Add(new SqlParameter("Status", ((int)status).ToString()));
                        }
                        parms.Add(new SqlParameter("Flag", ((int)flag).ToString()));

                        DataTable _data = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        _result = Helper.DataTableToList<Designition>(_data);
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
        public List<Designition> Select(Status status)
        {
            List<Designition> _result = null;
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
        public List<Designition> Select()
        {
            List<Designition> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }
    }
}