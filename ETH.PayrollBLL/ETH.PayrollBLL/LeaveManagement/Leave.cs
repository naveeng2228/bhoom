using ETH.BLL.Misc;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace ETH.BLL.LeaveManagement
{
    public class Leave
    {
        public int ID { get; set; }
        public string EmployeeID { get; set; }
        public string CompanyID { get; set; }
        public string WorkareaID { get; set; }
        public string DivisionID { get; set; }
        public string DepartmentID { get; set; }
        public string DesignationID { get; set; }


        public string ApplyDate { get; set; }
        public string SanctionedBy { get; set; }
        public int LeaveTypeID { get; set; }
        public string Reason { get; set; }
        public float TotalLeaves { get; set; }
        public float AvailableLeaves { get; set; }
        public string FromDate { get; set; }
        public string FromTime { get; set; }
        public string ToDate { get; set; }
        public string ToTime { get; set; }
        public float NoOfDays { get; set; }

        // In case of Compensation Off
        public string CompOffFromDate { get; set; }
        public string CompOffToDate { get; set; }

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
        /// Insert a new Leave to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Leave objLeave = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Leave";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ID", objLeave.ID));
                        parms.Add(new SqlParameter("EmployeeID", objLeave.EmployeeID));
                        parms.Add(new SqlParameter("CompanyID", objLeave.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objLeave.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objLeave.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objLeave.DepartmentID));
                        parms.Add(new SqlParameter("DesignationID", objLeave.DesignationID));
                        parms.Add(new SqlParameter("ApplyDate", objLeave.ApplyDate));
                        parms.Add(new SqlParameter("SanctionedBy", objLeave.SanctionedBy));
                        parms.Add(new SqlParameter("LeaveTypeID", objLeave.LeaveTypeID));
                        parms.Add(new SqlParameter("Reason", objLeave.Reason));
                        parms.Add(new SqlParameter("TotalLeaves", objLeave.TotalLeaves));
                        parms.Add(new SqlParameter("AvailableLeaves", objLeave.AvailableLeaves));
                        parms.Add(new SqlParameter("FromDate", objLeave.FromDate));
                        parms.Add(new SqlParameter("FromTime", objLeave.FromTime));
                        parms.Add(new SqlParameter("ToDate", objLeave.ToDate));
                        parms.Add(new SqlParameter("ToTime", objLeave.ToTime));
                        parms.Add(new SqlParameter("NoOfDays", objLeave.NoOfDays));
                        parms.Add(new SqlParameter("CompOffFromDate", objLeave.CompOffFromDate));
                        parms.Add(new SqlParameter("CompOffToDate", objLeave.CompOffToDate));

                        parms.Add(new SqlParameter("CreatedDate", objLeave.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objLeave.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objLeave.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objLeave.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objLeave.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objLeave.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objLeave.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a Leave in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Leave objLeave = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Leave";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ID", objLeave.ID));
                        parms.Add(new SqlParameter("EmployeeID", objLeave.EmployeeID));
                        parms.Add(new SqlParameter("CompanyID", objLeave.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objLeave.WorkareaID));
                        parms.Add(new SqlParameter("DivisionID", objLeave.DivisionID));
                        parms.Add(new SqlParameter("DepartmentID", objLeave.DepartmentID));
                        parms.Add(new SqlParameter("DesignationID", objLeave.DesignationID));
                        parms.Add(new SqlParameter("ApplyDate", objLeave.ApplyDate));
                        parms.Add(new SqlParameter("SanctionedBy", objLeave.SanctionedBy));
                        parms.Add(new SqlParameter("LeaveTypeID", objLeave.LeaveTypeID));
                        parms.Add(new SqlParameter("Reason", objLeave.Reason));
                        parms.Add(new SqlParameter("TotalLeaves", objLeave.TotalLeaves));
                        parms.Add(new SqlParameter("AvailableLeaves", objLeave.AvailableLeaves));
                        parms.Add(new SqlParameter("FromDate", objLeave.FromDate));
                        parms.Add(new SqlParameter("FromTime", objLeave.FromTime));
                        parms.Add(new SqlParameter("ToDate", objLeave.ToDate));
                        parms.Add(new SqlParameter("ToTime", objLeave.ToTime));
                        parms.Add(new SqlParameter("NoOfDays", objLeave.NoOfDays));
                        parms.Add(new SqlParameter("CompOffFromDate", objLeave.CompOffFromDate));
                        parms.Add(new SqlParameter("CompOffToDate", objLeave.CompOffToDate));

                        parms.Add(new SqlParameter("ModifiedDate", objLeave.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objLeave.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objLeave.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objLeave.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a Leave in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            Leave objLeave = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Leave";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ID", objLeave.ID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a Leave in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            Leave objLeave = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Leave";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ID", objLeave.ID));
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
        private List<Leave> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<Leave> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Leave";
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
                        _result = Helper.DataTableToList<Leave>(_data);

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
        public List<Leave> Select(Status status)
        {
            List<Leave> _result = null;
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
        public List<Leave> Select()
        {
            List<Leave> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }
    }
}