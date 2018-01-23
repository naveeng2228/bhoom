using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ETH.BLL;
using System.Configuration;
using ETH.SecurityManagement;

namespace Website
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["__Config__"] == null)
            {
                string DBTYpe = ConfigurationManager.AppSettings["DBType"].ToString();
                string CustomerID = ConfigurationManager.AppSettings["CustomerID"].ToString();
                string AppDateFormat = ConfigurationManager.AppSettings["AppDateFormat"].ToString();
                string AppTimeFormat = ConfigurationManager.AppSettings["AppTimeFormat"].ToString();
                string MinCompanyYearOfEstablishment = ConfigurationManager.AppSettings["MinCompanyYearOfEstablishment"].ToString();

                Config ObjConfig = new Config();
                ObjConfig.DBType = DBTYpe;
                ObjConfig.CustomerID = CustomerID;
                ObjConfig.AppDateFormat = AppDateFormat;
                ObjConfig.AppTimeFormat = AppTimeFormat;
                ObjConfig.MinCompanyYearOfEstablishment = Convert.ToInt32(MinCompanyYearOfEstablishment);

                //Allowances objAllow = new Allowances(DBTYpe);
                Session["__Config__"] = ObjConfig;
            }
            Response.Redirect("~/login");
        }
    }
}