using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ETH.DAL;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace ETH.PayrollBLL
{
    public class Allowances
    {
        public int AllowanceID { get; set; }
        public string AllowanceName { get; set; }
        public int Type { get; set; }
        public float Value { get; set; }
        public int BasedON { get; set; }
        public int Status { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedTime { get; set; }
        public string ModifiedDate { get; set; }
        public string ModifiedTime { get; set; }

        //0: MSSQL, 1: MYSQL, 2: Oracle
        private string DBType { get; set; }

        public Allowances(string _DBType)
        {
            DBType = _DBType;
        }

        public DataTable getAll(int Status = 1, bool includeStatus = false)
        {
            string Query = "";
            DataTable dt = null;
            switch (DBType)
            {
                case "0":
                    {
                        DBController objDBCtrl = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        parms.Add(new SqlParameter());
                        dt = objDBCtrl.ExecuteDataTable<SqlParameter>(Query, parms.ToArray());
                        break;
                    }
                case "1":
                    {
                        DBController objDBCtrl = new DBController(DBController.DBTypes.MSSQL);
                        List<MySqlParameter> parms = new List<MySqlParameter>();
                        parms.Add(new MySqlParameter());
                        dt = objDBCtrl.ExecuteDataTable<MySqlParameter>(Query, parms.ToArray());
                        break;
                    }
                case "2":
                    {
                        break;
                    }
            }
            return dt;
        }

        public Allowances getAllowanceByID(string id, int Status = 1, bool includeStatus = false)
        {
            return this;
        }

        public Allowances getEarnings(int Status = 1, bool includeStatus = false)
        {
            return this;
        }

        public Allowances getDeductions(int Status = 1, bool includeStatus = false)
        {
            return this;
        }

        public Allowances searchAllowances(string filterby, string value, int Status = 1, bool includeStatus = false)
        {
            return this;
        }

        public int InsertAllowance()
        {
            Allowances objAll = this;
            string Query = "";
            int returnValue = 0;
            switch (DBType)
            {
                case "0":
                    {
                        DBController objDBCtrl = new DBController(DBController.DBTypes.MSSQL);
                        List<SqlParameter> parms = new List<SqlParameter>();
                        parms.Add(new SqlParameter());
                        objDBCtrl.ExecuteNonQuery<SqlParameter>(Query, parms.ToArray());
                        break;
                    }
                case "1":
                    {
                        DBController objDBCtrl = new DBController(DBController.DBTypes.MSSQL);
                        List<MySqlParameter> parms = new List<MySqlParameter>();
                        parms.Add(new MySqlParameter());
                        objDBCtrl.ExecuteNonQuery<MySqlParameter>(Query, parms.ToArray());
                        break;
                    }
                case "2":
                    {
                        break;
                    }
            }
            return returnValue;
        }
    }
}
