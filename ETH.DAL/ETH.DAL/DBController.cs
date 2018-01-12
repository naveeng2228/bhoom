using ETH.DAL;
//using MySql.Data.MySqlClient;
using System.Data;
using System.Data.SqlClient;

namespace ETH.DAL
{
    public class DBController
    {
        public enum DBTypes
        {
            MSSQL = 0,
            MySQL = 1,
            //Oracle = 2
        }

        private DBTypes myDBType;

        public DBController()
        {
            // Default DB Type is MYSQL
            myDBType = DBTypes.MySQL;
        }

        public DBController(DBTypes type)
        {
            myDBType = type;
        }

        #region ExecuteNonQuery

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <returns></returns>
        public int ExecuteNonQuery(string SQLString)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteNonQuery(SQLString);
                return -1;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteNonQuery(SQLString);
            }
            else
            {
                return -1;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public int ExecuteNonQuery<TParams>(string SQLString, params TParams[] cmdParms)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteNonQuery(SQLString, cmdParms as MySqlParameter[]);
                return -1;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteNonQuery(SQLString, cmdParms as SqlParameter[]);
            }
            else
            {
                return -1;
            }
        }

        #endregion

        #region ExecuteScalar

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <returns></returns>
        public object ExecuteScalar(string SQLString)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteScalar(SQLString);
                return -1;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteScalar(SQLString);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public object ExecuteScalar<TParams>(string SQLString, params TParams[] cmdParms)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteScalar(SQLString, cmdParms as MySqlParameter[]);
                return -1;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteScalar(SQLString, cmdParms as SqlParameter[]);
            }
            else
            {
                return null;
            }
        }
        #endregion

        #region ExecuteReader

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public object ExecuteReader(string SQLString)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteReader(SQLString);
                return -1;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteReader(SQLString);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public object ExecuteReader<TParams>(string SQLString, params TParams[] cmdParms)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteReader(SQLString, cmdParms as MySqlParameter[]);
                return -1;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteReader(SQLString, cmdParms as SqlParameter[]);
            }
            else
            {
                return null;
            }
        }
        #endregion

        #region ExecuteTransaction

        /// <summary>
        /// 
        /// </summary>
        /// <param name="commands"></param>
        /// <returns></returns>
        public bool ExecuteTransaction<TCommand>(params TCommand[] cmds)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteTransaction(cmds as MySqlCommand[]);
                return false;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteTransaction(cmds as SqlCommand[]);
            }
            else
            {
                return false;
            }
        }

        #endregion

        #region ExecuteDataTable

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <returns></returns>
        public DataTable ExecuteDataTable(string SQLString)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteDataTable(SQLString);
                return null;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteDataTable(SQLString);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQLString"></param>
        /// <param name="cmdParms"></param>
        /// <returns></returns>
        public DataTable ExecuteDataTable<TParams>(string SQLString, params TParams[] cmdParms)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteDataTable(SQLString, cmdParms as MySqlParameter[]);
                return null;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteDataTable(SQLString, cmdParms as SqlParameter[]);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="startResord"></param>
        /// <param name="maxRecord"></param>
        /// <returns></returns>
        public DataTable ExecuteDataTable(string cmdText, int startResord, int maxRecord)
        {
            if (myDBType == DBTypes.MySQL)
            {
                //return MySQLHelper.ExecuteDataTable(cmdText, startResord, maxRecord);
                return null;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.ExecuteDataTable(cmdText, startResord, maxRecord);
            }
            else
            {
                return null;
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
        public DataTable getPager(out int recordCount, string selectList, string tableName, string whereStr, string orderExpression, int pageIdex, int pageSize)
        {
            if (myDBType == DBTypes.MySQL)
            {
                // return MySQLHelper.getPager(out recordCount, selectList, tableName, whereStr, orderExpression, pageIdex, pageSize);
                recordCount = 0;
                return null;
            }
            else if (myDBType == DBTypes.MSSQL)
            {
                return SQLHelper.getPager(out recordCount, selectList, tableName, whereStr, orderExpression, pageIdex, pageSize);
            }
            else
            {
                recordCount = 0;
                return null;
            }
        }

        #endregion
    }
}
