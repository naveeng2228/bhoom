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
        EventManager objCurrentEvent = null;
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
            CurrentCompanyID = RouteData.Values.Keys.Contains("CompanyId") ? RouteData.Values["CompanyId"].ToString() : "";
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

            var statuses = Enum.GetValues(typeof(Status));
            ddlStatus.DataSource = statuses;
            ddlStatus.DataBind();

            LoadCompanies();
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
            hdnPriority.Value = company.Priority.ToString();
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

                        // Add Workareas link beside menu.
                        Workarea objWorkArea = new Workarea();
                        List<Workarea> _workareas = objWorkArea.Select(company.CompanyID);
                        if (_workareas != null)
                        {
                            if(_workareas.Count > 0)
                            {
                                string WorkareaListUrl = ResolveUrl("~/") + "administration/manageworkarea/" + company.CompanyID;
                                _result.AppendFormat(" &rArr; <a href='{0}'>Workareas</a>", WorkareaListUrl);
                            }
                        }

                        _result.Append("</li>");
                    }
                    _result.Append("</ul>");
                    divCompaniesList.InnerHtml = _result.ToString();
                    divNoCompanies.Visible = false;
                    divUpdateCompany.Visible = true;
                }
                else
                {
                    divCompaniesList.InnerHtml = "<p>No companies available.</p>";
                    divNoCompanies.Visible = true;
                    divUpdateCompany.Visible = false;
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
            objCompany.CustomerID = objConfig.CustomerID;
            objCompany.CompanyID = txtCompanyID.Text;
            objCompany.CompanyName = txtCompanyName.Text;
            objCompany.CompanyCode = txtCompanyCode.Text;
            objCompany.Description = txtDescription.Text;
            objCompany.YearOfEstablishment = ddlYear.SelectedValue;
            objCompany.CompanyLogo = UploadLogo(fuLogo, objCompany.CompanyName);
            objCompany.CompanyEmail = txtCompanyEmail.Text;
            objCompany.PrimaryAddress = txtPrimaryAddress.Text;
            objCompany.CountryID = ddlCountry.SelectedValue;
            objCompany.StateID = ddlState.SelectedValue;
            objCompany.Pincode = txtPincode.Text == "" ? 0 : Convert.ToInt32(txtPincode.Text);
            objCompany.Website = txtWebsite.Text;
            objCompany.PhoneNumber = txtPhoneNumber.Text;
            objCompany.Priority = Convert.ToInt32(hdnPriority.Value);
            objCompany.CST = txtCST.Text;
            objCompany.TIN = txtTIN.Text;
            objCompany.PAN = txtPAN.Text;
            objCompany.TAN = txtTAN.Text;
            objCompany.GST = txtGST.Text;

            objCompany.ModifiedBy = objConfig.UserInfo.Id.ToString();
            objCompany.ModifiedDate = DateTime.Now.ToString(objConfig.AppDateFormat);
            objCompany.ModifiedTime = DateTime.Now.ToString(objConfig.AppTimeFormat);

            objCompany.Status = (Status)Enum.Parse(typeof(Status), ddlStatus.SelectedValue);

            if (objCompany.Update() > 0)
            {
                LoadDefaults();
                ShowMessage(string.Format("Company: {0}, updated successfully.", objCompany.CompanyName));
            }
            else
            {
                ShowMessage(string.Format("Something went wrong. Please try again after sometime."));
            }
        }

        private void ShowMessage(string Message)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "custom-alert", string.Format("showMessage('{0}');", Message), true);
        }

        private string UploadLogo(FileUpload fuLogo, String CompanyName)
        {
            if (!fuLogo.HasFile)
            {
                return string.Empty;
            }

            string DirectoryPath = Server.MapPath("~/Administration/logos");
            string LogoName = string.Format("{0}_{1}{2}", CompanyName, DateTime.Now.ToBinary().ToString(), Path.GetExtension(fuLogo.PostedFile.FileName));
            fuLogo.PostedFile.SaveAs(LogoName);
            return LogoName;
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
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