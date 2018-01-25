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
    public class Company
    {
        public string CustomerID { get; set; }

        public string CompanyID { get; set; }
        public string CompanyName { get; set; }
        public string CompanyCode { get; set; }
        public string Description { get; set; }
        public string YearOfEstablishment { get; set; }
        public string CompanyLogo { get; set; }

        public string CompanyEmail { get; set; }
        public string PrimaryAddress { get; set; }
        public string StateID { get; set; }
        public string CountryID { get; set; }
        public int Pincode { get; set; }
        public string Website { get; set; }
        public string PhoneNumber { get; set; }

        public int Priority { get; set; }
        public string CST { get; set; }
        public string TIN { get; set; }
        public string PAN { get; set; }
        public string TAN { get; set; }
        public string GST { get; set; }

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
        /// Insert a new Company to db (Master)
        /// </summary>
        /// <returns></returns>
        public int Insert()
        {
            int _result = 0;
            Company objCompany = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Company";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerID", objCompany.CustomerID));
                        parms.Add(new SqlParameter("CompanyID", objCompany.CompanyID));
                        parms.Add(new SqlParameter("CompanyName", objCompany.CompanyName));
                        parms.Add(new SqlParameter("CompanyCode", objCompany.CompanyCode));
                        parms.Add(new SqlParameter("Description", objCompany.Description));
                        parms.Add(new SqlParameter("YearOfEstablishment", objCompany.YearOfEstablishment));
                        parms.Add(new SqlParameter("CompanyLogo", objCompany.CompanyLogo));
                        parms.Add(new SqlParameter("CompanyEmail", objCompany.CompanyEmail));
                        parms.Add(new SqlParameter("PrimaryAddress", objCompany.PrimaryAddress));
                        parms.Add(new SqlParameter("StateID", objCompany.StateID));
                        parms.Add(new SqlParameter("CountryID", objCompany.CountryID));
                        parms.Add(new SqlParameter("Pincode", objCompany.Pincode));
                        parms.Add(new SqlParameter("PhoneNumber", objCompany.PhoneNumber));
                        parms.Add(new SqlParameter("Website", objCompany.Website));
                        parms.Add(new SqlParameter("Priority", objCompany.Priority));
                        parms.Add(new SqlParameter("CST", objCompany.CST));
                        parms.Add(new SqlParameter("TIN", objCompany.TIN));
                        parms.Add(new SqlParameter("PAN", objCompany.PAN));
                        parms.Add(new SqlParameter("TAN", objCompany.TAN));
                        parms.Add(new SqlParameter("GST", objCompany.GST));
                        parms.Add(new SqlParameter("CreatedDate", objCompany.CreatedDate));
                        parms.Add(new SqlParameter("CreatedTime", objCompany.CreatedTime));
                        parms.Add(new SqlParameter("CreatedBy", objCompany.CreatedBy));
                        parms.Add(new SqlParameter("ModifiedDate", objCompany.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objCompany.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objCompany.ModifiedBy));
                        parms.Add(new SqlParameter("Status",((int) objCompany.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Insert).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Update a Company in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Update()
        {
            int _result = 0;
            Company objCompany = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Company";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerID", objCompany.CustomerID));
                        parms.Add(new SqlParameter("CompanyID", objCompany.CompanyID));
                        parms.Add(new SqlParameter("CompanyName", objCompany.CompanyName));
                        parms.Add(new SqlParameter("CompanyCode", objCompany.CompanyCode));
                        parms.Add(new SqlParameter("Description", objCompany.Description));
                        parms.Add(new SqlParameter("YearOfEstablishment", objCompany.YearOfEstablishment));
                        parms.Add(new SqlParameter("CompanyLogo", objCompany.CompanyLogo));
                        parms.Add(new SqlParameter("CompanyEmail", objCompany.CompanyEmail));
                        parms.Add(new SqlParameter("PrimaryAddress", objCompany.PrimaryAddress));
                        parms.Add(new SqlParameter("StateID", objCompany.StateID));
                        parms.Add(new SqlParameter("CountryID", objCompany.CountryID));
                        parms.Add(new SqlParameter("Pincode", objCompany.Pincode));
                        parms.Add(new SqlParameter("PhoneNumber", objCompany.PhoneNumber));
                        parms.Add(new SqlParameter("Website", objCompany.Website));
                        parms.Add(new SqlParameter("Priority", objCompany.Priority));
                        parms.Add(new SqlParameter("CST", objCompany.CST));
                        parms.Add(new SqlParameter("TIN", objCompany.TIN));
                        parms.Add(new SqlParameter("PAN", objCompany.PAN));
                        parms.Add(new SqlParameter("TAN", objCompany.TAN));
                        parms.Add(new SqlParameter("GST", objCompany.GST));
                        parms.Add(new SqlParameter("ModifiedDate", objCompany.ModifiedDate));
                        parms.Add(new SqlParameter("ModifiedTime", objCompany.ModifiedTime));
                        parms.Add(new SqlParameter("ModifiedBy", objCompany.ModifiedBy));
                        parms.Add(new SqlParameter("Status", ((int)objCompany.Status).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.Update).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Partial delete a Company in db (Master)
        /// </summary>
        /// <returns></returns>
        public int PartialDelete()
        {
            int _result = 0;
            Company objCompany = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Company";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerID", objCompany.CustomerID));
                        parms.Add(new SqlParameter("CompanyID", objCompany.CompanyID));
                        parms.Add(new SqlParameter("Status", ((int)Status.PartiallyDeleted).ToString()));

                        parms.Add(new SqlParameter("Flag", ((int)DB_Flags.PartialDelete).ToString()));

                        _result = ObjDB.ExecuteNonQuery(Query, parms.ToArray());
                        break;
                    }
            }
            return _result;
        }

        /// <summary>
        /// Delete a Company in db (Master)
        /// </summary>
        /// <returns></returns>
        public int Delete()
        {
            int _result = 0;
            Company objCompany = this;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Company";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();

                        parms.Add(new SqlParameter("CustomerID", objCompany.CustomerID));
                        parms.Add(new SqlParameter("CompanyID", objCompany.CompanyID));
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
        private List<Company> Select(Status status, DB_Flags flag, bool ShowAll = false)
        {
            List<Company> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Company";
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
                        _result = Helper.DataTableToList<Company>(_data);

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
        public List<Company> Select(Status status)
        {
            List<Company> _result = null;
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
        public List<Company> Select()
        {
            List<Company> _result = null;
            _result = Select(Status.Active, DB_Flags.SelectActive, true);
            return _result;
        }

        /// <summary>
        /// Select by UserID
        /// </summary>
        /// <returns></returns>
        public List<Company> Select(string CustomerID)
        {
            List<Company> _result = null;
            Config ObjConfig = (Config)HttpContext.Current.Session["__Config__"];
            string Query = "SP_Company";
            switch (ObjConfig.DBType)
            {
                // MS-SQL
                case "0":
                    {
                        DBController ObjDB = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        parms.Add(new SqlParameter("CustomerID", CustomerID));
                        parms.Add(new SqlParameter("Status", ((int)Status.Active).ToString()));
                        parms.Add(new SqlParameter("Flag", 10));

                        DataTable _data = ObjDB.ExecuteDataTable(Query, parms.ToArray());
                        _result = Helper.DataTableToList<Company>(_data);
                        break;
                    }
            }
            return _result;
        }
    }
}
