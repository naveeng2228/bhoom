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
    public class Workarea
    {
        public string CustomerID { get; set; }
        public string CompanyID { get; set; }

        public string WorkareaID { get; set; }
        public string WorkareaName { get; set; }
        public string WorkareaCode { get; set; }
        public string YearOfEstablishment { get; set; }
        public int Priority { get; set; }

        public string PrimaryAddress { get; set; }
        public string CountryID { get; set; }
        public string StateID { get; set; }
        public string Pincode { get; set; }
        public string PhoneNumber { get; set; }
        public string FaxNumber { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }

        public string LeaveGroupID { get; set; }
        public string ShiftGroupID { get; set; }
        public string AllowanceGroupID { get; set; }
        public string HolidayGroupID { get; set; }

        public string CST { get; set; }
        public string TIN { get; set; }
        public string TAN { get; set; }
        public string PAN { get; set; }
        public string GST { get; set; }

        public string PFCode { get; set; }
        public string ESICode { get; set; }

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
        /// Insert a new workarea to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Workarea objWorkarea = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Workarea";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerID", objWorkarea.CustomerID));
                        parms.Add(new SqlParameter("CompanyID", objWorkarea.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objWorkarea.WorkareaID));
                        parms.Add(new SqlParameter("WorkareaName", objWorkarea.WorkareaName));
                        parms.Add(new SqlParameter("WorkareaCode", objWorkarea.WorkareaCode));
                        parms.Add(new SqlParameter("YearOfEstablishment", objWorkarea.YearOfEstablishment));
                        parms.Add(new SqlParameter("Priority", objWorkarea.Priority));

                        parms.Add(new SqlParameter("PhoneNumber", objWorkarea.PhoneNumber));
                        parms.Add(new SqlParameter("FaxNumber", objWorkarea.FaxNumber));
                        parms.Add(new SqlParameter("Email", objWorkarea.Email));
                        parms.Add(new SqlParameter("PrimaryAddress", objWorkarea.PrimaryAddress));
                        parms.Add(new SqlParameter("StateID", objWorkarea.StateID));
                        parms.Add(new SqlParameter("CountryID", objWorkarea.CountryID));
                        parms.Add(new SqlParameter("Pincode", objWorkarea.Pincode));
                        parms.Add(new SqlParameter("Website", objWorkarea.Website));

                        parms.Add(new SqlParameter("LeaveGroupID", objWorkarea.LeaveGroupID));
                        parms.Add(new SqlParameter("ShiftGroupID", objWorkarea.ShiftGroupID));
                        parms.Add(new SqlParameter("AllowanceGroupID", objWorkarea.AllowanceGroupID));
                        parms.Add(new SqlParameter("HolidayGroupID", objWorkarea.HolidayGroupID));

                        parms.Add(new SqlParameter("CST", objWorkarea.CST));
                        parms.Add(new SqlParameter("TIN", objWorkarea.TIN));
                        parms.Add(new SqlParameter("PAN", objWorkarea.PAN));
                        parms.Add(new SqlParameter("TAN", objWorkarea.TAN));
                        parms.Add(new SqlParameter("GST", objWorkarea.GST));

                        parms.Add(new SqlParameter("PFCode", objWorkarea.PFCode));
                        parms.Add(new SqlParameter("ESICode", objWorkarea.ESICode));

                        parms.Add(new SqlParameter("CreatedDate", objWorkarea.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objWorkarea.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objWorkarea.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objWorkarea.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objWorkarea.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objWorkarea.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objWorkarea.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a workarea in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Workarea objWorkarea = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Workarea";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerID", objWorkarea.CustomerID));
                        parms.Add(new SqlParameter("CompanyID", objWorkarea.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objWorkarea.WorkareaID));
                        parms.Add(new SqlParameter("WorkareaName", objWorkarea.WorkareaName));
                        parms.Add(new SqlParameter("WorkareaCode", objWorkarea.WorkareaCode));
                        parms.Add(new SqlParameter("YearOfEstablishment", objWorkarea.YearOfEstablishment));
                        parms.Add(new SqlParameter("Priority", objWorkarea.Priority));

                        parms.Add(new SqlParameter("PhoneNumber", objWorkarea.PhoneNumber));
                        parms.Add(new SqlParameter("FaxNumber", objWorkarea.FaxNumber));
                        parms.Add(new SqlParameter("Email", objWorkarea.Email));
                        parms.Add(new SqlParameter("PrimaryAddress", objWorkarea.PrimaryAddress));
                        parms.Add(new SqlParameter("StateID", objWorkarea.StateID));
                        parms.Add(new SqlParameter("CountryID", objWorkarea.CountryID));
                        parms.Add(new SqlParameter("Pincode", objWorkarea.Pincode));
                        parms.Add(new SqlParameter("Website", objWorkarea.Website));

                        parms.Add(new SqlParameter("LeaveGroupID", objWorkarea.LeaveGroupID));
                        parms.Add(new SqlParameter("ShiftGroupID", objWorkarea.ShiftGroupID));
                        parms.Add(new SqlParameter("AllowanceGroupID", objWorkarea.AllowanceGroupID));
                        parms.Add(new SqlParameter("HolidayGroupID", objWorkarea.HolidayGroupID));

                        parms.Add(new SqlParameter("CST", objWorkarea.CST));
                        parms.Add(new SqlParameter("TIN", objWorkarea.TIN));
                        parms.Add(new SqlParameter("PAN", objWorkarea.PAN));
                        parms.Add(new SqlParameter("TAN", objWorkarea.TAN));
                        parms.Add(new SqlParameter("GST", objWorkarea.GST));

                        parms.Add(new SqlParameter("PFCode", objWorkarea.PFCode));
                        parms.Add(new SqlParameter("ESICode", objWorkarea.ESICode));

                        parms.Add(new SqlParameter("CreatedDate", objWorkarea.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objWorkarea.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objWorkarea.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objWorkarea.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objWorkarea.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objWorkarea.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objWorkarea.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a workarea in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            Workarea objWorkarea = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Workarea";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerID", objWorkarea.CustomerID));
                        parms.Add(new SqlParameter("CompanyID", objWorkarea.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objWorkarea.WorkareaID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a workarea in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            Workarea objWorkarea = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Workarea";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerID", objWorkarea.CustomerID));
                        parms.Add(new SqlParameter("CompanyID", objWorkarea.CompanyID));
                        parms.Add(new SqlParameter("WorkareaID", objWorkarea.WorkareaID));
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
            string Query = "SP_Workarea";
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
