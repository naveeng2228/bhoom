using ETH.BLL;
using ETH.BLL.Misc;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace ETH.BLL
{
    public class EventManager
    {
        public Guid EventID { get; set; }
        public string EventName { get; set; }
        public EventState EventState { get; set; }
        public string FormID { get; set; }
        public string ModuleID { get; set; }
        
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
        /// Insert a new EventManager to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            EventManager objEventManager = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_EventManager";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("EventID", objEventManager.EventID));
                        parms.Add(new SqlParameter("EventName", objEventManager.EventName));
                        parms.Add(new SqlParameter("EventState", objEventManager.EventState));
                        parms.Add(new SqlParameter("FormID", objEventManager.FormID));
                        parms.Add(new SqlParameter("ModuleID", objEventManager.ModuleID));
                        parms.Add(new SqlParameter("CreatedDate", objEventManager.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objEventManager.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objEventManager.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objEventManager.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objEventManager.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objEventManager.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objEventManager.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Insert));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a EventManager in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            EventManager objEventManager = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_EventManager";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("EventID", objEventManager.EventID));
                        parms.Add(new SqlParameter("EventName", objEventManager.EventName));
                        parms.Add(new SqlParameter("EventState", objEventManager.EventState));
                        parms.Add(new SqlParameter("FormID", objEventManager.FormID));
                        parms.Add(new SqlParameter("ModuleID", objEventManager.ModuleID));
                        parms.Add(new SqlParameter("ModifiedDate", objEventManager.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objEventManager.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objEventManager.ModifiedBy));
                        parms.Add(new SqlParameter("Status", objEventManager.Status));

                        parms.Add(new SqlParameter("Flag", DB_Flags.Update));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a EventManager in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete(string EventID)
        {
            int _result = 0;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_EventManager";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("EventID", EventID));
                        parms.Add(new SqlParameter("Status", Status.PartiallyDeleted));

                        parms.Add(new SqlParameter("Flag", DB_Flags.PartialDelete));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a EventManager in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete(string EventID)
        {
            int _result = 0;
            EventManager objEventManager = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_EventManager";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("EventID", EventID));
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
        private List<EventManager> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<EventManager> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_EventManager";
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
                        _result = Helper.DataTableToList<EventManager>(_data);

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
        public List<EventManager> Select(Status status)
        {
            List<EventManager> _result = null;
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
        public List<EventManager> Select()
        {
            List<EventManager> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }

        /// <summary>
        /// Private method to select based on status
        /// </summary>
        /// <param name="status"></param>
        /// <param name="flag"></param>
        /// <param name="ShowAll"></param>
        /// <returns></returns>
        public List<EventManager> Select(string EventID)
        {
            List<EventManager> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_EventManager";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        parms.Add(new SqlParameter("EventID", EventID));
                        parms.Add(new SqlParameter("Flag", 9));

                        DataTable _data = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        _result = Helper.DataTableToList<EventManager>(_data);

                        break;
                    }
            }
            return _result;
        }

    }
}
