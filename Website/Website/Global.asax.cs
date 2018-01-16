using System;
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