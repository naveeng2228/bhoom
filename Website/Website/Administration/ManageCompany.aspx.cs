using ETH.BLL;
using ETH.BLL.Administration;
using ETH.BLL.AppMasters;
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
    public partial class ManageCompany : Form
    {
        Config objConfig = null;
        EventManager objCurrentEvent = null;
        string CurrentCompanyID = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLoginStatus();
            if (objConfig != null)
            {
                AssignPageDefaults();
                CurrentCompanyID = RouteData.Values.Keys.Contains("CompanyId") ? RouteData.Values["CompanyId"].ToString() : "";
                if (!IsPostBack)
                {
                    try
                    {
                        ViewState["__UpdateButton__Clicked__"] = "NO";
                        List<int> Years = new List<int>();
                        for (int i = objConfig.MinCompanyYearOfEstablishment; i <= Convert.ToInt32(DateTime.Now.ToString("yyyy")); i++)
                        {
                            Years.Add(i);
                        }

                        ddlYear.DataSource = Years;
                        ddlYear.DataBind();
                        ddlYear.SelectedValue = DateTime.Now.ToString("yyyy");

                        // Load Countries
                        Country objCountry = new Country();
                        List<Country> countries = objCountry.Select(Status.Active);
                        ddlCountry.DataSource = countries;
                        ddlCountry.DataValueField = "CountryID";
                        ddlCountry.DataTextField = "CountryName";
                        ddlCountry.DataBind();

                        LoadCompanies();
                    }
                    catch (Exception Ex)
                    {
                        ExceptionHandler<Exception>.WriteException(Ex);
                    }


                    objCurrentEvent = (EventManager)Session["__CURRENT_EVENT__"];
                }
            }
        }

        private void LoadCompanyDetails(Company company)
        {
            txtCompanyID.Text = company.CompanyID;
            txtCompanyName.Text = company.CompanyName;
            txtCompanyCode.Text = company.CompanyCode;
            txtDescription.Text = company.Description;
            ddlYear.SelectedValue = company.YearOfEstablishment;
            //Logo needs to be displayed here
            txtCompanyEmail.Text = company.CompanyEmail;
            txtPrimaryAddress.Text = company.PrimaryAddress;
            ddlCountry.SelectedValue = company.CountryID;
            LoadStates(company.CountryID);
            ddlState.SelectedValue = company.StateID;
            txtPincode.Text = company.Pincode.ToString();
            txtWebsite.Text = company.Website;
            txtPhoneNumber.Text = company.PhoneNumber;
            txtCST.Text = company.CST;
            txtTIN.Text = company.TIN;
            txtPAN.Text = company.PAN;
            txtTAN.Text = company.TAN;
            txtGST.Text = company.GST;
            ddlStatus.SelectedValue = company.Status.ToString();
        }

        private void AssignPageDefaults()
        {
            FormID = "10002";
            var form = Select(FormID);
            FormName = form.FormName;
            ModuleID = form.ModuleID;
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
                    if (CurrentCompanyID == string.Empty)
                    {
                        // If the call is not for companyid, then get details of first company in the list.
                        CurrentCompanyID = liCompanies[0].CompanyID;
                    }

                    _result.Append("<ul class='list-group list-group-unbordered'>");
                    foreach (Company company in liCompanies)
                    {
                        if (company.CompanyID == CurrentCompanyID)
                        {
                            LoadCompanyDetails(company);
                        }
                        string CompanyDetailsUrl = ResolveUrl("~/") + "administration/managecompany/" + company.CompanyID;
                        _result.Append("<li class='list-group-item'>");
                        _result.AppendFormat("<a href='{0}'><b>{1}</b></a>", CompanyDetailsUrl, company.CompanyName);
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtCompanyID.Text == "")
            {
                return;
            }

            Company objCompany = new Company();
            objCompany.CompanyID = txtCompanyID.Text;
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStates(ddlCountry.SelectedValue);
        }

        private void LoadStates(string CountryID)
        {
            State objState = new State();
            List<State> states = objState.Select(CountryID);

            ddlState.DataSource = states;
            ddlState.DataValueField = "StateID";
            ddlState.DataTextField = "StateName";
            ddlState.DataBind();
        }

        public void ShowAlert(string Message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert-message", string.Format("alert('{0}');", Message), true);
        }
    }
}