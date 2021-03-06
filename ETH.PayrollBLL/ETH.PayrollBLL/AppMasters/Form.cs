﻿using ETH.BLL.Misc;
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
    public class Form : System.Web.UI.Page
    {
        public string ModuleID { get; set; }
        public string FormID { get; set; }
        public string FormName { get; set; }
        public string FormUrl { get; set; }

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
        /// Insert a new Form to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Form objForm = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Forms";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ModuleID", objForm.ModuleID));
                        parms.Add(new SqlParameter("FormID", objForm.FormID));
                        parms.Add(new SqlParameter("FormName", objForm.FormName));
                        parms.Add(new SqlParameter("FormUrl", objForm.FormUrl));
                        parms.Add(new SqlParameter("CreatedDate", objForm.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objForm.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objForm.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objForm.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objForm.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objForm.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objForm.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Insert).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a Form in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Form objForm = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Forms";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ModuleID", objForm.ModuleID));
                        parms.Add(new SqlParameter("FormID", objForm.FormID));
                        parms.Add(new SqlParameter("FormName", objForm.FormName));
                        parms.Add(new SqlParameter("FormUrl", objForm.FormUrl));
                        parms.Add(new SqlParameter("ModifiedDate", objForm.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objForm.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objForm.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objForm.Status)));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Update).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a Form in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            Form objForm = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Forms";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ModuleID", objForm.ModuleID));
                        parms.Add(new SqlParameter("FormID", objForm.FormID));
                        parms.Add(new SqlParameter("Status", ((int)Status.PartiallyDeleted).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.PartialDelete).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a Form in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            Form objForm = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Forms";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("ModuleID", objForm.ModuleID));
                        parms.Add(new SqlParameter("FormID", objForm.FormID));
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
        private List<Form> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<Form> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Forms";
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
                        _result = Helper.DataTableToList<Form>(_data);
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
        public List<Form> Select(Status status)
        {
            List<Form> _result = null;
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
        public List<Form> Select()
        {
            List<Form> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }

        /// <summary>
        /// Select all irrespective of status
        /// </summary>
        /// <returns></returns>
        public Form Select(string FormID)
        {
            Form _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Forms";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        parms.Add(new SqlParameter("FormID", FormID));
                        parms.Add(new SqlParameter("Flag", 9));

                        DataTable _data = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        var _myresult = Helper.DataTableToList<Form>(_data);
                        if(_myresult != null)
                        {
                            if(_myresult.Count > 0)
                            {
                                _result = _myresult[0];
                            }
                        }
                        break;
                    }
            }
            return _result;
        }
    }
}
