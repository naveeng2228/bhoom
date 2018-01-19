using ETH.BLL;
using ETH.BLL.Administration;
using ETH.BLL.Misc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website.Administration
{
    public partial class ManageCompany : System.Web.UI.Page
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
            StringBuilder _result = new StringBuilder();
            Company objCompany = new Company();
            List<Company> liCompanies = objCompany.Select(objConfig.CustomerID);
            if (liCompanies != null)
            {
                if (liCompanies.Count > 0)
                {
                    _result.Append("<ul class='list-group list-group-unbordered'>");
                    foreach (Company company in liCompanies)
                    {
                        _result.Append("<li class='list-group-item'>");
                        _result.Append(string.Format("<b>{0}</b>", company.CompanyName));
                        _result.Append("</li>");
                    }
                    _result.Append("</ul>");
                    divCompaniesList.InnerHtml = _result.ToString();
                }
                else
                {
                    divCompaniesList.InnerHtml = "<p>No companies available.</p>";
                }
            }
        }

        private T CheckDBNull<T>(Object Value)
        {
            return Value != DBNull.Value ? (T)Value : default(T);
        }
    }
}