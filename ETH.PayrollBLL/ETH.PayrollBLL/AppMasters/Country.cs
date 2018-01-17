using ETH.BLL.Misc;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace ETH.BLL.AppMasters
{
    public class Country
    {
        public string CountryID { get; set; }
        public string CountryName { get; set; }

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
        /// Insert a new Country to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Country objCountry = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Countries";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CountryID", objCountry.CountryID));
                        parms.Add(new SqlParameter("CountryName", objCountry.CountryName));
                        parms.Add(new SqlParameter("CreatedDate", objCountry.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objCountry.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objCountry.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objCountry.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objCountry.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objCountry.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objCountry.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a Country in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Country objCountry = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Countries";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CountryID", objCountry.CountryID));
                        parms.Add(new SqlParameter("CountryName", objCountry.CountryName));
                        parms.Add(new SqlParameter("ModifiedDate", objCountry.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objCountry.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objCountry.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objCountry.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a Country in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete(string CountryID)
        {
            int _result = 0;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Countries";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CountryID", CountryID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a Country in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete(string CountryID)
        {
            int _result = 0;
            Country objCountry = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Countries";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CountryID", CountryID));
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
            string Query = "SP_Countries";
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
            switch(status)
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
