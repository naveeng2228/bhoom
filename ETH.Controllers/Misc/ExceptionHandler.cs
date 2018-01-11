using System;
using System.Web;
using System.IO;
using System.Data.SqlClient;

namespace ETH.Controllers.Misc
{
    public class ExceptionHandler<T>
    {
        public static bool WriteException(T Ex, bool canWriteToLogFile = true, bool canWriteToDB = true)
        {
            LogStatus statusObj = new LogStatus();
            statusObj.LogFileWriteStatus = canWriteToLogFile ? writeToLogFile(Ex) : false;
            statusObj.LogFileWriteStatus = canWriteToDB && Ex.GetType() != typeof(SqlException) ? writeToDB(Ex) : false;
            statusObj.Status = statusObj.LogFileWriteStatus && statusObj.DBWriteStatus ? true : false;
            return false;
        }

        public static bool WriteCustomException(string Message)
        {
            //string filePath = "http://localhost:49966/Logs/ErrorLogs.txt";
            string RootFolderPath = HttpContext.Current.Server.MapPath("~/");
            string FolderPath = "Logs/";
            string FileName = "ErrorLogs";
            string Extension = ".txt";
            string FullPath = string.Concat(RootFolderPath, FolderPath, FileName, Extension);

            FileInfo logFile = new FileInfo(FullPath);
            if (!logFile.Exists)
            {
                logFile.Create();
            }

            using (StreamWriter writer = new StreamWriter(logFile.FullName, true))
            {
                writer.WriteLine("Log Type : Exception");
                writer.WriteLine("Log Message : " + Message);
                writer.WriteLine("Log Date : " + DateTime.Now.ToString("dddd, dd MMM, yyyy"));
                writer.WriteLine("Log Time : " + DateTime.Now.ToString("hh:mm:ss tt").ToUpper());
                writer.WriteLine(Environment.NewLine + "-----------------------------------------------------------------------------" + Environment.NewLine);
            }

            return true;
        }

        private static bool writeToLogFile(T Ex)
        {
            Exception ex = Ex as Exception;
            //string filePath = "http://localhost:49966/Logs/ErrorLogs.txt";
            string RootFolderPath = HttpContext.Current.Server.MapPath("~/");
            string FolderPath = "Logs/";
            string FileName = "ErrorLogs";
            string Extension = ".txt";
            string FullPath = string.Concat(RootFolderPath, FolderPath, FileName, Extension);

            FileInfo logFile = new FileInfo(FullPath);
            if (!logFile.Exists)
            {
                logFile.Create();
            }

            using (StreamWriter writer = new StreamWriter(logFile.FullName, true))
            {
                writer.WriteLine("Log Type : Exception");
                writer.WriteLine("Log Message : " + ex.Message);
                writer.WriteLine("StackTrace : " + ex.StackTrace);
                writer.WriteLine("Log Date : " + DateTime.Now.ToString("dddd, dd MMM, yyyy"));
                writer.WriteLine("Log Time : " + DateTime.Now.ToString("hh:mm:ss tt").ToUpper());
                //writer.WriteLine("Message :" + ex.Message + "<br/>" + Environment.NewLine + "StackTrace :" + ex.StackTrace +
                //   "" + Environment.NewLine + "Date :" + DateTime.Now.ToString("dddd, dd MMM, yyyy") + " " + "Time :" + DateTime.Now.ToString("hh:mm:ss tt").ToUpper());
                writer.WriteLine(Environment.NewLine + "-----------------------------------------------------------------------------" + Environment.NewLine);
            }

            return true;
        }

        private static bool writeToDB(T Ex)
        {
            return true;
        }
    }

    internal class LogStatus
    {
        public bool LogFileWriteStatus { get; set; }
        public bool DBWriteStatus { get; set; }
        public bool Status { get; set; }
    }
}
