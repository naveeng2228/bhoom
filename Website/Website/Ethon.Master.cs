using ETH.BLL;
using ETH.BLL.Misc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class Ethon : System.Web.UI.MasterPage
    {
        Config objConfig = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLoginStatus();
            if (objConfig != null)
            {
                if(!IsPostBack)
                {
                    try
                    {

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
    }
}