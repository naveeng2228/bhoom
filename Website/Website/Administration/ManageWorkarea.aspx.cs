using ETH.BLL;
using ETH.BLL.Administration;
using ETH.BLL.AppMasters;
using ETH.BLL.Misc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website.Administration
{
    public partial class ManageWorkarea : Form
    {
        Config objConfig = null;
        string CurrentCompanyID = string.Empty;
        string CurrentWorkareaID = string.Empty;

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

        private void AssignPageDefaults()
        {
            FormID = "10003";
            var formData = Select(FormID);
            FormName = formData.FormName;
            ModuleID = formData.ModuleID;
        }

        private void LoadDefaults()
        {
            CurrentCompanyID = RouteData.Values.Keys.Contains("CompanyId") ? RouteData.Values["CompanyId"].ToString() : "";
            LoadCompanyDropdown();

            if (CurrentCompanyID == "")
            {
                if (ddlCompanies.Items.Count > 0)
                {
                    CurrentCompanyID = ddlCompanies.Items[0].Value;
                }
            }
            CurrentWorkareaID = RouteData.Values.Keys.Contains("WorkareaId") ? RouteData.Values["WorkareaId"].ToString() : "";

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

            // Load Shift Groups
            ShiftGroup objShiftGroup = new ShiftGroup();
            List<ShiftGroup> ShiftGroups = objShiftGroup.Select(Status.Active);
            ddlShiftGroup.DataSource = ShiftGroups;
            ddlShiftGroup.DataValueField = "ShiftGroupID";
            ddlShiftGroup.DataTextField = "ShiftGroupName";
            ddlShiftGroup.DataBind();

            // Load Holiday Groups
            HolidayGroup objHolidayGroup = new HolidayGroup();
            List<HolidayGroup> HolidayGroups = objHolidayGroup.Select(Status.Active);
            ddlHolidayGroup.DataSource = HolidayGroups;
            ddlHolidayGroup.DataValueField = "HolidayGroupID";
            ddlHolidayGroup.DataTextField = "HolidayGroupName";
            ddlHolidayGroup.DataBind();

            // Load Leave Groups
            LeaveGroup objLeaveGroup = new LeaveGroup();
            List<LeaveGroup> LeaveGroups = objLeaveGroup.Select(Status.Active);
            ddlLeaveGroup.DataSource = LeaveGroups;
            ddlLeaveGroup.DataValueField = "LeaveGroupID";
            ddlLeaveGroup.DataTextField = "LeaveGroupName";
            ddlLeaveGroup.DataBind();

            // Load Allowance Groups
            AllowanceGroup objAllowanceGroup = new AllowanceGroup();
            List<AllowanceGroup> AllowanceGroups = objAllowanceGroup.Select(Status.Active);
            ddlAllowanceGroup.DataSource = AllowanceGroups;
            ddlAllowanceGroup.DataValueField = "AllowanceGroupID";
            ddlAllowanceGroup.DataTextField = "AllowanceGroupName";
            ddlAllowanceGroup.DataBind();

            var statuses = Enum.GetValues(typeof(Status));
            ddlStatus.DataSource = statuses;
            ddlStatus.DataBind();

            LoadWorkareas(CurrentCompanyID);
        }

        private void LoadCompanyDropdown()
        {
            Company ObjCompany = new Company();
            List<Company> companies = ObjCompany.Select(objConfig.CustomerID);
            ddlCompanies.DataSource = companies;
            ddlCompanies.DataValueField = "CompanyID";
            ddlCompanies.DataTextField = "CompanyName";
            ddlCompanies.DataBind();

            ddlCompanies.SelectedIndex = 0;
        }

        private void LoadWorkareas(string CompanyID)
        {
            StringBuilder _result = new StringBuilder();
            Workarea objWorkarea = new Workarea();
            List<Workarea> liWorkareas = objWorkarea.Select(CompanyID);
            if (liWorkareas != null)
            {
                if (liWorkareas.Count > 0)
                {
                    if (CurrentWorkareaID == string.Empty)
                    {
                        // If the call is not for companyid, then get details of first company in the list.
                        CurrentWorkareaID = liWorkareas[0].WorkareaID;
                    }

                    _result.Append("<ul class='list-group list-group-unbordered'>");
                    foreach (Workarea workarea in liWorkareas)
                    {
                        if (workarea.WorkareaID == CurrentWorkareaID && workarea.CompanyID == CurrentCompanyID)
                        {
                            LoadWorkareaDetails(workarea);
                        }
                        string WorkareaDetailsUrl = ResolveUrl("~/") + "administration/manageworkarea/" + workarea.CompanyID + "/" + workarea.WorkareaID;
                        _result.Append("<li class='list-group-item'>");
                        _result.AppendFormat("<a href='{0}'><b>{1}</b></a>", WorkareaDetailsUrl, workarea.WorkareaName);
                        _result.Append("</li>");
                    }
                    _result.Append("</ul>");
                    divWorkareasList.InnerHtml = _result.ToString();
                    divNoWorkareas.Visible = false;
                    divUpdateWorkarea.Visible = true;
                }
                else
                {
                    divWorkareasList.InnerHtml = "<p>No workareas available.</p>";
                    divNoWorkareas.Visible = true;
                    divUpdateWorkarea.Visible = false;
                }
            }
        }

        private void LoadWorkareaDetails(Workarea objWorkarea)
        {
            txtWorkareaID.Text = objWorkarea.WorkareaID;
            txtCompanyID.Text = objWorkarea.CompanyID;
            txtWorkareaName.Text = objWorkarea.WorkareaName;
            txtWorkareaCode.Text = objWorkarea.WorkareaCode;
            ddlYear.SelectedValue = objWorkarea.YearOfEstablishment;
            txtWorkareaEmail.Text = objWorkarea.Email;
            txtPrimaryAddress.Text = objWorkarea.PrimaryAddress;
            ddlCountry.SelectedValue = objWorkarea.CountryID;
            LoadStates(objWorkarea.CountryID);
            ddlState.SelectedValue = objWorkarea.StateID;
            txtPincode.Text = objWorkarea.Pincode;
            txtWebsite.Text = objWorkarea.Website;
            txtPhoneNumber.Text = objWorkarea.PhoneNumber;
            hdnPriority.Value = objWorkarea.Priority.ToString();
            txtCST.Text = objWorkarea.CST;
            txtTIN.Text = objWorkarea.TIN;
            txtPAN.Text = objWorkarea.PAN;
            txtTAN.Text = objWorkarea.TAN;
            txtGST.Text = objWorkarea.GST;
            txtPFCode.Text = objWorkarea.PFCode;
            txtESICode.Text = objWorkarea.ESICode;
            ddlHolidayGroup.SelectedValue = objWorkarea.HolidayGroupID;
            ddlLeaveGroup.SelectedValue = objWorkarea.LeaveGroupID;
            ddlShiftGroup.SelectedValue = objWorkarea.ShiftGroupID;
            ddlAllowanceGroup.SelectedValue = objWorkarea.AllowanceGroupID;
        }

        protected void ddlCompanies_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCompanies.SelectedIndex > 0)
            {
                LoadWorkareas(ddlCompanies.SelectedValue);
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStates(ddlCountry.SelectedValue);
        }

        private T CheckDBNull<T>(Object Value)
        {
            return Value != DBNull.Value ? (T)Value : default(T);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtCompanyID.Text == "" || txtWorkareaID.Text == "")
            {
                return;
            }

            Workarea objWorkarea = new Workarea();
            objWorkarea.CustomerID = objConfig.CustomerID;
            objWorkarea.WorkareaID = txtWorkareaID.Text;
            objWorkarea.CompanyID = txtCompanyID.Text;
            objWorkarea.WorkareaName = txtWorkareaName.Text;
            objWorkarea.WorkareaCode = txtWorkareaCode.Text;
            objWorkarea.YearOfEstablishment = ddlYear.SelectedValue;
            objWorkarea.Email = txtWorkareaEmail.Text;
            objWorkarea.PrimaryAddress = txtPrimaryAddress.Text;
            objWorkarea.CountryID = ddlCountry.SelectedValue;
            objWorkarea.StateID = ddlState.SelectedValue;
            objWorkarea.Pincode = txtPincode.Text;
            objWorkarea.Website = txtWebsite.Text;
            objWorkarea.PhoneNumber = txtPhoneNumber.Text;
            objWorkarea.Priority = Convert.ToInt32(hdnPriority.Value);
            objWorkarea.CST = txtCST.Text;
            objWorkarea.TIN = txtTIN.Text;
            objWorkarea.PAN = txtPAN.Text;
            objWorkarea.TAN = txtTAN.Text;
            objWorkarea.GST = txtGST.Text;
            objWorkarea.PFCode = txtPFCode.Text;
            objWorkarea.ESICode = txtESICode.Text;
            objWorkarea.HolidayGroupID = ddlHolidayGroup.SelectedValue;
            objWorkarea.LeaveGroupID = ddlLeaveGroup.SelectedValue;
            objWorkarea.ShiftGroupID = ddlShiftGroup.SelectedValue;
            objWorkarea.AllowanceGroupID = ddlAllowanceGroup.SelectedValue;

            objWorkarea.ModifiedBy = objConfig.UserInfo.Id.ToString();
            objWorkarea.ModifiedDate = DateTime.Now.ToString(objConfig.AppDateFormat);
            objWorkarea.ModifiedTime = DateTime.Now.ToString(objConfig.AppTimeFormat);

            objWorkarea.Status = (Status)Enum.Parse(typeof(Status), ddlStatus.SelectedValue);

            if (objWorkarea.Update() > 0)
            {
                LoadDefaults();
                ShowMessage(string.Format("Workarea: {0}, updated successfully.", objWorkarea.WorkareaName));
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