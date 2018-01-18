using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ETH.DAL
{
    public static class SQLHelper
    {
        /// <summary>  
        /// string server, string database, string login, string pass, int port  
        /// </summary>  
        //public static readonly string connectionString = "Data Source = (local); Initial Catalog = db; User Id: sa; Password = Admin@1234;";
        public static readonly string connectionString = "Data Source = 10.10.60.71; Initial Catalog = e_erp; User Id= devadmin; Password = devadmin;";

        #region ExecuteNonQuery

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows;
                    }
                    catch (SqlException e)
                    {
                        connection.Close();
                        throw e;
                    }
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        int rows = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        return rows;
                    }
                    catch (SqlException e)
                    {
                        throw e;
                    }
                }
            }
        }

        #endregion

        #region ExecuteScalar

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        object obj = cmd.ExecuteScalar();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (SqlException e)
                    {
                        connection.Close();
                        throw e;
                    }
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        object obj = cmd.ExecuteScalar();
                        cmd.Parameters.Clear();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (SqlException e)
                    {
                        throw e;
                    }
                }
            }
        }
        #endregion

        #region ExecuteReader

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public static SqlDataReader ExecuteReader(string strSQL)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(strSQL, connection);
            SqlDataReader myReader = null;
            try
            {
                connection.Open();
                myReader = cmd.ExecuteReader();

                return myReader;
            }
            catch (SqlException e)
            {
                throw e;
            }
            finally
            {
                myReader.Close();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public static SqlDataReader ExecuteReader(string SQLString, params SqlParameter[] cmdParms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader myReader = null;
            try
            {
                PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                myReader = cmd.ExecuteReader();
                cmd.Parameters.Clear();
                return myReader;
            }
            catch (SqlException e)
            {
                throw e;
            }
            finally
            {
                myReader.Close();
                cmd.Dispose();
                connection.Close();
            }
        }
        #endregion

        #region ExecuteTransaction

        /// <summary>
        /// 
        /// </summary>
        /// <param name="commands"></param>
        /// <returns></returns>
        public static bool ExecuteTransaction(params SqlCommand[] commands)
        {
            bool TransactionStatus = false;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlTransaction trans = connection.BeginTransaction("MyTransaction"))
                {
                    try
                    {
                        foreach (SqlCommand cmd in commands)
                        {
                            using (cmd)
                            {
                                PrepareCommand(cmd, connection, trans);
                                cmd.ExecuteNonQuery();
                                cmd.Parameters.Clear();
                            }
                        }
                        trans.Commit();
                        TransactionStatus = true;
                    }
                    catch (SqlException ex)
                    {
                        trans.Rollback();
                        TransactionStatus = false;
                    }
                }
            }
            return TransactionStatus;
        }

        #endregion

        #region ExecuteDataTable

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                DataSet ds = new DataSet();
                try
                {
                    connection.Open();
                    SqlDataAdapter command = new SqlDataAdapter(SQLString, connection);
                    command.Fill(ds, "ds");
                }
                catch (SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
                return ds.Tables[0];
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        da.Fill(ds, "ds");
                        cmd.Parameters.Clear();
                    }
                    catch (SqlException ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    return ds.Tables[0];
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="startResord"></param>
        /// <param name="maxRecord"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string cmdText, int startResord, int maxRecord)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                DataSet ds = new DataSet();
                try
                {
                    connection.Open();
                    SqlDataAdapter command = new SqlDataAdapter(cmdText, connection);
                    command.Fill(ds, startResord, maxRecord, "ds");
                }
                catch (SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
                return ds.Tables[0];
            }
        }

        #endregion

        #region Prepare Command

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="conn"></param>
        /// <param name="trans"></param>
        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            if (trans != null)
                cmd.Transaction = trans;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="conn"></param>
        /// <param name="trans"></param>
        /// <param name="cmdText"></param>
        /// <param name="cmdParms"></param>
        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, string cmdText, SqlParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
                cmd.Transaction = trans;
            cmd.CommandType = CommandType.Text;
            if(cmdParms.Length > 0)
            {
                cmd.CommandType = CommandType.StoredProcedure;
            }
            if (cmdParms != null)
            {
                foreach (SqlParameter parameter in cmdParms)
                {
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                    (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parameter);
                }
            }
        }
        #endregion

        #region PageList Without Proc

        /// <summary>
        /// 
        /// </summary>
        /// <param name="recordCount"></param>
        /// <param name="selectList"></param>
        /// <param name="tableName"></param>
        /// <param name="whereStr"></param>
        /// <param name="orderExpression"></param>
        /// <param name="pageIdex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static DataTable getPager(out int recordCount, string selectList, string tableName, string whereStr, string orderExpression, int pageIdex, int pageSize)
        {
            int rows = 0;
            DataTable dt = new DataTable();
            MatchCollection matchs = Regex.Matches(selectList, @"top\s+\d{1,}", RegexOptions.IgnoreCase);
            string sqlStr = sqlStr = string.Format("select {0} from {1} where 1=1 {2}", selectList, tableName, whereStr);
            if (!string.IsNullOrEmpty(orderExpression)) { sqlStr += string.Format(" Order by {0}", orderExpression); }
            if (matchs.Count > 0)
            {
                DataTable dtTemp = ExecuteDataTable(sqlStr);
                rows = dtTemp.Rows.Count;
            }
            else
            {
                string sqlCount = string.Format("select count(*) from {0} where 1=1 {1} ", tableName, whereStr);
                object obj = ExecuteScalar(sqlCount);
                if (obj != null)
                {
                    rows = Convert.ToInt32(obj);
                }
            }
            dt = ExecuteDataTable(sqlStr, (pageIdex - 1) * pageSize, pageSize);
            recordCount = rows;
            return dt;
        }

        #endregion
    }
}
