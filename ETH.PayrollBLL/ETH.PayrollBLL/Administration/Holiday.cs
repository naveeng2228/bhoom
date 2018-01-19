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
    public class Holiday
    {
        public string CompanyID { get; set; }
        public string HolidayGroupID { get; set; }
        public int ID { get; set; }
        public string Name { get; set; }
        public int Year { get; set; }
        public string Reason { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string FromTime { get; set; }
        public string ToTime { get; set; }

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
        /// Insert a new Holiday to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Holiday objHoliday = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Holiday";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objHoliday.CompanyID));
                        parms.Add(new SqlParameter("HolidayGroupID", objHoliday.HolidayGroupID));
                        parms.Add(new SqlParameter("ID", objHoliday.ID));
                        parms.Add(new SqlParameter("Name", objHoliday.Name));
                        parms.Add(new SqlParameter("Year", objHoliday.Year));
                        parms.Add(new SqlParameter("Reason", objHoliday.Reason));
                        parms.Add(new SqlParameter("FromDate", objHoliday.FromDate));
                        parms.Add(new SqlParameter("FromTime", objHoliday.FromTime));
                        parms.Add(new SqlParameter("ToDate", objHoliday.ToDate));
                        parms.Add(new SqlParameter("ToTime", objHoliday.ToTime));
                        parms.Add(new SqlParameter("CreatedDate", objHoliday.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objHoliday.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objHoliday.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objHoliday.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objHoliday.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objHoliday.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objHoliday.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a Holiday in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Holiday objHoliday = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Holiday";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objHoliday.CompanyID));
                        parms.Add(new SqlParameter("HolidayGroupID", objHoliday.HolidayGroupID));
                        parms.Add(new SqlParameter("ID", objHoliday.ID));
                        parms.Add(new SqlParameter("Name", objHoliday.Name));
                        parms.Add(new SqlParameter("Year", objHoliday.Year));
                        parms.Add(new SqlParameter("Reason", objHoliday.Reason));
                        parms.Add(new SqlParameter("FromDate", objHoliday.FromDate));
                        parms.Add(new SqlParameter("FromTime", objHoliday.FromTime));
                        parms.Add(new SqlParameter("ToDate", objHoliday.ToDate));
                        parms.Add(new SqlParameter("ToTime", objHoliday.ToTime));
                        parms.Add(new SqlParameter("ModifiedDate", objHoliday.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objHoliday.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objHoliday.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objHoliday.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a Holiday in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            Holiday objHoliday = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Holiday";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objHoliday.CompanyID));
                        parms.Add(new SqlParameter("HolidayGroupID", objHoliday.HolidayGroupID));
                        parms.Add(new SqlParameter("ID", objHoliday.ID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a Holiday in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            Holiday objHoliday = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Holiday";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CompanyID", objHoliday.CompanyID));
                        parms.Add(new SqlParameter("HolidayGroupID", objHoliday.HolidayGroupID));
                        parms.Add(new SqlParameter("ID", objHoliday.ID));
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
        private List<Holiday> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<Holiday> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Holiday";
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
                        _result = Helper.DataTableToList<Holiday>(_data);
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
        public List<Holiday> Select(Status status)
        {
            List<Holiday> _result = null;
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
        public List<Holiday> Select()
        {
            List<Holiday> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }
    }
}