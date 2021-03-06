﻿using ETH.BLL.Misc;
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
    public class HolidayGroup
    {
        public string HolidayGroupID { get; set; }
        public string CompanyID { get; set; }
        public string HolidayGroupName { get; set; }

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
        /// Insert a new HolidayGroup to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            HolidayGroup objHolidayGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_HolidayGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("HolidayGroupID", objHolidayGroup.HolidayGroupID));
                        parms.Add(new SqlParameter("CompanyID", objHolidayGroup.CompanyID));
                        parms.Add(new SqlParameter("HolidayGroupName", objHolidayGroup.HolidayGroupName));
                        parms.Add(new SqlParameter("CreatedDate", objHolidayGroup.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objHolidayGroup.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objHolidayGroup.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objHolidayGroup.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objHolidayGroup.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objHolidayGroup.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objHolidayGroup.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Insert).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a HolidayGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            HolidayGroup objHolidayGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_HolidayGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("HolidayGroupID", objHolidayGroup.HolidayGroupID));
                        parms.Add(new SqlParameter("CompanyID", objHolidayGroup.CompanyID));
                        parms.Add(new SqlParameter("HolidayGroupName", objHolidayGroup.HolidayGroupName));
                        parms.Add(new SqlParameter("ModifiedDate", objHolidayGroup.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objHolidayGroup.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objHolidayGroup.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objHolidayGroup.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Update).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a HolidayGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            HolidayGroup objHolidayGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_HolidayGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("HolidayGroupID", objHolidayGroup.HolidayGroupID));
                        parms.Add(new SqlParameter("Status", ((int)Status.PartiallyDeleted).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.PartialDelete).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a HolidayGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            HolidayGroup objHolidayGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_HolidayGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("HolidayGroupID", objHolidayGroup.HolidayGroupID));
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
        private List<HolidayGroup> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<HolidayGroup> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_HolidayGroup";
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
                        _result = Helper.DataTableToList<HolidayGroup>(_data);
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
        public List<HolidayGroup> Select(Status status)
        {
            List<HolidayGroup> _result = null;
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
        public List<HolidayGroup> Select()
        {
            List<HolidayGroup> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }


        /// <summary>
        /// Select by CompanyID
        /// </summary>
        /// <returns></returns>
        public List<HolidayGroup> Select(string CompanyID)
        {
            List<HolidayGroup> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_HolidayGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        parms.Add(new SqlParameter("CompanyID", CompanyID));
                        parms.Add(new SqlParameter("Status", ((int)Status.Active).ToString()));
                        parms.Add(new SqlParameter("Flag", 9));

                        DataTable _data = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        _result = Helper.DataTableToList<HolidayGroup>(_data);
                        break;
                    }
            }
            return _result;
        }


        /// <summary>
        /// Generate New Id
        /// </summary>
        /// <returns></returns>
        public static string GenerateID()
        {
            string _result = string.Empty;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_HolidayGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        parms.Add(new SqlParameter("Flag", 11));

                        int data = (int)ObjDB.ExecuteScalar(Query, parms.ToArray());
                        _result = (data + 1).ToString();
                        break;
                    }
            }
            return _result;
        }
    }
}