using ETH.BLL;
using ETH.BLL.Administration;
using ETH.BLL.AppMasters;
using ETH.BLL.Misc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website.Administration
{
    public partial class AddLeaveGroup : Form
    {
        Config objConfig = null;
        EventManager objCurrentEvent = null;
        string CurrentLeaveGroupID = string.Empty;

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
            FormID = "10008";
            var formData = Select(FormID);
            FormName = formData.FormName;
            ModuleID = formData.ModuleID;
        }

        private void LoadDefaults()
        {
            ResetFields();
            CurrentLeaveGroupID = RouteData.Values.Keys.Contains("LeaveGroupId") ? RouteData.Values["LeaveGroupId"].ToString() : "";

            var statuses = Enum.GetValues(typeof(Status));
            ddlStatus.DataSource = statuses;
            ddlStatus.DataBind();

            BindLeaveGroups();
            BindCompany();
        }

        private void ResetFields()
        {
            CurrentLeaveGroupID = string.Empty;
            txtLeaveGroupID.Text = "";
            txtLeaveGroupName.Text = "";
            ddlCompanies.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
        }

        private void BindCompany()
        {
            Company objCompany = new Company();
            List<Company> liCompanies = objCompany.Select(objConfig.CustomerID);
            ddlCompanies.DataSource = objConfig.UserInfo.CompanyID != "" ? liCompanies.Where(x => x.CompanyID == objConfig.UserInfo.CompanyID) : liCompanies;
            ddlCompanies.DataValueField = "CompanyID";
            ddlCompanies.DataTextField = "CompanyName";
            ddlCompanies.DataBind();
        }

        private void GenerateNewLeaveGroupID()
        {
            txtLeaveGroupID.Text = "LGI_" + LeaveGroup.GenerateID();
        }

        private void BindLeaveGroups()
        {
            LeaveGroup ObjLeaveGroup = new LeaveGroup();
            Company objCompany = new Company();
            List<Company> liCompanies = objCompany.Select(objConfig.CustomerID);
            if (liCompanies != null)
            {
                if (liCompanies.Count > 0)
                {
                    string CompanyID = objConfig.UserInfo.CompanyID != "" ? objConfig.UserInfo.CompanyID : liCompanies[0].CompanyID;
                    List<LeaveGroup> liLeaveGroups = ObjLeaveGroup.Select(CompanyID);
                    gvLeaveGroups.DataSource = liLeaveGroups;
                    gvLeaveGroups.DataBind();
                }
            }
        }

        private void LoadLeaveGroupDetails(LeaveGroup ObjLeaveGroup)
        {
            txtLeaveGroupID.Text = ObjLeaveGroup.LeaveGroupID;
            ddlCompanies.SelectedValue = ObjLeaveGroup.CompanyID;
            txtLeaveGroupName.Text = ObjLeaveGroup.LeaveGroupName;
            ddlStatus.SelectedValue = ObjLeaveGroup.Status.ToString();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (txtLeaveGroupID.Text == "")
            {
                return;
            }

            LeaveGroup objLeaveGroup = new LeaveGroup();
            objLeaveGroup.LeaveGroupID = txtLeaveGroupID.Text;
            objLeaveGroup.CompanyID = ddlCompanies.SelectedValue;
            objLeaveGroup.LeaveGroupName = txtLeaveGroupName.Text;

            objLeaveGroup.CreatedBy = objConfig.UserInfo.Id.ToString();
            objLeaveGroup.CreatedDate = DateTime.Now.ToString(objConfig.AppDateFormat);
            objLeaveGroup.CreatedTime = DateTime.Now.ToString(objConfig.AppTimeFormat);

            objLeaveGroup.ModifiedBy = objConfig.UserInfo.Id.ToString();
            objLeaveGroup.ModifiedDate = DateTime.Now.ToString(objConfig.AppDateFormat);
            objLeaveGroup.ModifiedTime = DateTime.Now.ToString(objConfig.AppTimeFormat);

            objLeaveGroup.Status = (Status)Enum.Parse(typeof(Status), ddlStatus.SelectedValue);

            if (objLeaveGroup.Insert() > 0)
            {
                LoadDefaults();
                ShowMessage(string.Format("Leave Group: {0}, created successfully.", objLeaveGroup.LeaveGroupName));
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

        protected void gvLeaveGroups_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string LeaveGroupID = e.CommandArgument.ToString();
            if (e.CommandName == "iDel")
            {
                LeaveGroup objLeaveGroup = new LeaveGroup();
                objLeaveGroup.LeaveGroupID = LeaveGroupID;
                objLeaveGroup.PartialDelete();
                LoadDefaults();
            }
        }

        protected void gvLeaveGroups_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLeaveGroups.PageIndex = e.NewPageIndex;
            BindLeaveGroups();
        }

        protected void btnGenerateID_Click(object sender, EventArgs e)
        {
            GenerateNewLeaveGroupID();
        }
    }
}