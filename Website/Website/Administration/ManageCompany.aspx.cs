using ETH.BLL;
using ETH.BLL.Administration;
using ETH.BLL.AppMasters;
using ETH.BLL.Misc;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website.Administration
{
    public partial class ManageCompany : Form
    {
        Config objConfig = null;
        string CurrentCompanyID = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLoginStatus();
            if (objConfig != null)
            {
                AssignPageDefaults();
                if (!IsPostBack)
                {
                    try
                    {
                        LoadDefaults();
                    }
                    catch (Exception Ex)
                    {
                        ExceptionHandler<Exception>.WriteException(Ex);
                    }
                }
            }
        }

        private void LoadDefaults()
        {
            LoadCompanies();
        }

        private void AssignPageDefaults()
        {
            FormID = "10002";
            var formData = Select(FormID);
            FormName = formData.FormName;
            ModuleID = formData.ModuleID;
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
            Company objCompany = new Company();
            List<Company> liCompanies = objCompany.Select(objConfig.CustomerID);
            gvCompanies.DataSource = liCompanies;
            gvCompanies.DataBind();
        }

        protected void gvCompanies_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument == null)
            {
                return;
            }

            if (e.CommandName == "iEd")
            {
                Response.Redirect("~/administration/updatecompany/" + e.CommandArgument.ToString());
            }
            else if (e.CommandName == "iDel")
            {
                Company objCompany = new Company();
                objCompany.CompanyID = e.CommandArgument.ToString();
                objCompany.PartialDelete();
            }
        }

        protected void gvCompanies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCompanies.PageIndex = e.NewPageIndex;
            LoadCompanies();
        }
    }
}