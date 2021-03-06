﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Website
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        private void RegisterRoutes(RouteCollection routes)
        {
            #region Default Roots
            routes.MapPageRoute("Home-Page", "home", "~/Default.aspx");
            routes.MapPageRoute("Default-Page", "default", "~/Default.aspx");
            routes.MapPageRoute("Login-Page", "login", "~/Login.aspx");
            routes.MapPageRoute("Forgot-Page", "forgot", "~/Forgot.aspx");
            #endregion

            routes.MapPageRoute("Dashboard", "dashboard", "~/dashboard.aspx");

            #region Administration
            routes.MapPageRoute("administration-home", "administration", "~/Administration/Default.aspx");

            // COMPANY ROUTES
            routes.MapPageRoute("administration-managecompany-def", "administration/managecompany", "~/Administration/ManageCompany.aspx");
            routes.MapPageRoute("administration-managecompany", "administration/managecompany/{CompanyId}", "~/Administration/ManageCompany.aspx");

            // WORKAREA ROUTES
            routes.MapPageRoute("administration-manageworkarea-def-1", "administration/manageworkarea", "~/Administration/ManageWorkarea.aspx");
            routes.MapPageRoute("administration-manageworkarea-def-2", "administration/manageworkarea/{CompanyId}", "~/Administration/ManageWorkarea.aspx");
            routes.MapPageRoute("administration-manageworkarea", "administration/manageworkarea/{CompanyId}/{workareaid}", "~/Administration/ManageWorkarea.aspx");

            // LEAVE GROUP ROUTES
            routes.MapPageRoute("administration-manageleavegroup-def", "leavemanagement/manageleavegroups", "~/Administration/ManageLeaveGroups.aspx");
            routes.MapPageRoute("administration-manageleavegroup", "leavemanagement/manageleavegroups/{LeaveGroupId}", "~/Administration/ManageLeaveGroups.aspx");
            routes.MapPageRoute("administration-createleavegroup-def", "leavemanagement/createleavegroups", "~/Administration/AddLeaveGroup.aspx");
            #endregion

            #region Attendance
            routes.MapPageRoute("attendance-home", "attendance", "~/Attendance/Default.aspx");
            #endregion

            #region Payroll
            routes.MapPageRoute("payroll-home", "payroll", "~/Payroll/Default.aspx");
            #endregion

            #region Security
            routes.MapPageRoute("security-home", "security", "~/Security/Default.aspx");
            #endregion

            #region Leave Management
            routes.MapPageRoute("leavemanagement-home", "leavemanagement", "~/LeaveManagement/Default.aspx");
            #endregion

            #region Others
            routes.MapPageRoute("other-home", "other", "~/Other/Default.aspx");
            #endregion

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}