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
    public class ShiftGroup
    {
        public string ShiftGroupID { get; set; }
        public string CompanyID { get; set; }
        public string ShiftGroupName { get; set; }

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
        /// Insert a new ShiftGroup to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            ShiftGroup objShiftGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_ShiftGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ShiftGroupID", objShiftGroup.ShiftGroupID));
                        parms.Add(new SqlParameter("CompanyID", objShiftGroup.CompanyID));
                        parms.Add(new SqlParameter("ShiftGroupName", objShiftGroup.ShiftGroupName));
                        parms.Add(new SqlParameter("CreatedDate", objShiftGroup.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objShiftGroup.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objShiftGroup.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objShiftGroup.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objShiftGroup.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objShiftGroup.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objShiftGroup.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Insert).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a ShiftGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            ShiftGroup objShiftGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_ShiftGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ShiftGroupID", objShiftGroup.ShiftGroupID));
                        parms.Add(new SqlParameter("CompanyID", objShiftGroup.CompanyID));
                        parms.Add(new SqlParameter("ShiftGroupName", objShiftGroup.ShiftGroupName));
                        parms.Add(new SqlParameter("ModifiedDate", objShiftGroup.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objShiftGroup.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objShiftGroup.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objShiftGroup.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Update).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a ShiftGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            ShiftGroup objShiftGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_ShiftGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ShiftGroupID", objShiftGroup.ShiftGroupID));
                        parms.Add(new SqlParameter("Status", ((int)Status.PartiallyDeleted).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.PartialDelete).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a ShiftGroup in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            ShiftGroup objShiftGroup = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_ShiftGroup";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ShiftGroupID", objShiftGroup.ShiftGroupID));
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
        private List<ShiftGroup> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<ShiftGroup> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_ShiftGroup";
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
                        _result = Helper.DataTableToList<ShiftGroup>(_data);

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
        public List<ShiftGroup> Select(Status status)
        {
            List<ShiftGroup> _result = null;
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
        public List<ShiftGroup> Select()
        {
            List<ShiftGroup> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }


        /// <summary>
        /// Select by CompanyID
        /// </summary>
        /// <returns></returns>
        public List<ShiftGroup> Select(string CompanyID)
        {
            List<ShiftGroup> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_ShiftGroup";
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
                        _result = Helper.DataTableToList<ShiftGroup>(_data);
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
            string Query = "SP_ShiftGroup";
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