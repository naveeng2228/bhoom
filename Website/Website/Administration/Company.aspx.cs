using ETH.BLL;
using ETH.BLL.Misc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website.Administration
{
    public partial class Company : System.Web.UI.Page
    {
        Config objConfig = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLoginStatus();
            if (objConfig != null)
            {
                if (!IsPostBack)
                {
                    try
                    {
                        LoadCompanies();
                    }
                    catch (Exception Ex)
                    {
                        ExceptionHandler<Exception>.WriteException(Ex);
                    }
                }
            }
        }

        private void CheckLoginStatus()
        {
            if (Session["__Config__"] != null)
            {
                objConfig = (Config)Session["__Config__"];
                if (objConfig.UserInfo != null)
                {
                    // User Logged In
                }
                else
                {
                    Response.Redirect("~/login");
                }
            }
            else
            {
                Response.Redirect("~/login");
            }
        }

        private void LoadCompanies()
        {
            ETH.BLL.Administration.Company objCompany = new ETH.BLL.Administration.Company();
            DataTable dtCompanies = objCompany.Select(Status.Active);
        }
    }
}