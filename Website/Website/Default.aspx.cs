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
            string DBTYpe = ConfigurationManager.AppSettings["DBType"].ToString();
            //Allowances objAllow = new Allowances(DBTYpe);
            Session["__DBTYpe__"] = DBTYpe;
            Response.Redirect("~/login");
        }
    }
}