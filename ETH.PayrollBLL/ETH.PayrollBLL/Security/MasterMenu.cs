using ETH.BLL.AppMasters;
using ETH.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace ETH.BLL.Security
{
    public class MasterMenu
    {
        public string ModuleID { get; set; }
        public string ModuleName { get; set; }
        public string ModuleUrl { get; set; }
        public string ModuleDescription { get; set; }
        public string FormId { get; set; }
        public string FormName { get; set; }
        public string FormUrl { get; set; }
        public int CanView { get; set; }
        public int CanSave { get; set; }
        public int CanDelete { get; set; }


        public List<MasterMenu> getMenuItems(string UserID)
        {
            List<MasterMenu> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Roles";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        parms.Add(new SqlParameter("UserId", UserID));
                        parms.Add(new SqlParameter("Flag", 11));

                        DataTable _data = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        _result = Helper.DataTableToList<MasterMenu>(_data);

                        break;
                    }
            }
            return _result;
        }
    }
}
