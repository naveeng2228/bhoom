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
    public class LeaveType
    {
        public string CompanyID { get; set; }
        public string LeaveGroupID { get; set; }
        public int ID { get; set; }
        public string LeaveName { get; set; }
        public string Abbreviation { get; set; }
        public bool IsPaidType { get; set; }
        public bool IsEncashable { get; set; }
        public bool IsCummulative { get; set; }
        public int NoOfDays { get; set; }

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
        /// Insert a new LeaveType to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            LeaveType objLeaveType = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_LeaveType";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objLeaveType.CompanyID));
                        parms.Add(new SqlParameter("LeaveGroupID", objLeaveType.LeaveGroupID));
                        parms.Add(new SqlParameter("ID", objLeaveType.ID));
                        parms.Add(new SqlParameter("LeaveName", objLeaveType.LeaveName));
                        parms.Add(new SqlParameter("Abbrivation", objLeaveType.Abbreviation));
                        parms.Add(new SqlParameter("IsPaidType", objLeaveType.IsPaidType));
                        parms.Add(new SqlParameter("IsEncashable", objLeaveType.IsEncashable));
                        parms.Add(new SqlParameter("IsCummulative", objLeaveType.IsCummulative));
                        parms.Add(new SqlParameter("NoOfDays", objLeaveType.NoOfDays));
                        parms.Add(new SqlParameter("CreatedDate", objLeaveType.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objLeaveType.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objLeaveType.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objLeaveType.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objLeaveType.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objLeaveType.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objLeaveType.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Insert).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a LeaveType in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            LeaveType objLeaveType = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_LeaveType";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objLeaveType.CompanyID));
                        parms.Add(new SqlParameter("LeaveGroupID", objLeaveType.LeaveGroupID));
                        parms.Add(new SqlParameter("ID", objLeaveType.ID));
                        parms.Add(new SqlParameter("LeaveName", objLeaveType.LeaveName));
                        parms.Add(new SqlParameter("Abbrivation", objLeaveType.Abbreviation));
                        parms.Add(new SqlParameter("IsPaidType", objLeaveType.IsPaidType));
                        parms.Add(new SqlParameter("IsEncashable", objLeaveType.IsEncashable));
                        parms.Add(new SqlParameter("IsCummulative", objLeaveType.IsCummulative));
                        parms.Add(new SqlParameter("NoOfDays", objLeaveType.NoOfDays));
                        parms.Add(new SqlParameter("ModifiedDate", objLeaveType.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objLeaveType.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objLeaveType.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objLeaveType.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Update).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a LeaveType in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            LeaveType objLeaveType = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_LeaveType";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objLeaveType.CompanyID));
                        parms.Add(new SqlParameter("LeaveGroupID", objLeaveType.LeaveGroupID));
                        parms.Add(new SqlParameter("ID", objLeaveType.ID));
                        parms.Add(new SqlParameter("Status", ((int)Status.PartiallyDeleted).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.PartialDelete).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a LeaveType in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            LeaveType objLeaveType = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_LeaveType";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objLeaveType.CompanyID));
                        parms.Add(new SqlParameter("LeaveGroupID", objLeaveType.LeaveGroupID));
                        parms.Add(new SqlParameter("ID", objLeaveType.ID));
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
        private List<LeaveType> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<LeaveType> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_LeaveType";
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
                        _result = Helper.DataTableToList<LeaveType>(_data);

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
        public List<LeaveType> Select(Status status)
        {
            List<LeaveType> _result = null;
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
        public List<LeaveType> Select()
        {
            List<LeaveType> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }
    }
}