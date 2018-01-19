using ETH.BLL;
using ETH.BLL.Misc;
using ETH.BLL.Security;
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
                        BindUserMenu(objConfig.UserInfo.UserId);
                    }
                    catch (Exception Ex)
                    {
                        ExceptionHandler<Exception>.WriteException(Ex);
                    }
                }
            }
        }

        private void BindUserMenu(string userId)
        {
            MasterMenu ObjMenu = new MasterMenu();
            List<MasterMenu> items = ObjMenu.getMenuItems(userId);
            foreach (var item in items)
            {

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