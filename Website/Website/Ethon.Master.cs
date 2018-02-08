using ETH.BLL;
using ETH.BLL.Misc;
using ETH.BLL.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
                if (!IsPostBack)
                {
                    try
                    {
                        BindUserMenu(objConfig.UserInfo.Id);
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

            shortcode.InnerHtml = string.Format("<b>{0}</b>");
        }

        private void BindUserMenu(int userId)
        {
            MasterMenu ObjMenu = new MasterMenu();
            List<MasterMenu> items = ObjMenu.getMenuItems(userId.ToString());
            string[] Modules = items.Select(x => x.ModuleID).Distinct().ToArray();
            StringBuilder _menu = new StringBuilder("<ul class='sidebar-menu' data-widget='tree'>");
            foreach (string module in Modules)
            {
                var Forms = items.Where(x => x.ModuleID == module).ToArray();
                _menu.AppendFormat("<li id='liModule_{0}' class='treeview'>", Forms[0].ModuleName.Replace(" ", string.Empty).ToLower());
                _menu.AppendFormat("<a href='{0}'>", ResolveUrl("~/") + Forms[0].ModuleUrl);
                _menu.AppendFormat("<i class='fa fa-laptop'></i><span>{0}</span>", Forms[0].ModuleName);
                _menu.Append("<span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a>");
                _menu.AppendFormat("<ul id='ul_{0}' class='treeview-menu'>", Forms[0].ModuleName.Replace(" ", string.Empty).ToLower());
                foreach (var item in Forms)
                {
                    _menu.AppendFormat("<li id='liForm_{2}'><a href='{0}'><i class='fa fa-circle-o'></i> &nbsp; {1}</a></li>", ResolveUrl("~/") + item.FormUrl, item.FormName, item.FormName.Replace(" ", string.Empty).ToLower());
                }
                _menu.Append("</ul>");
                _menu.Append("</li>");
            }
            _menu.Append("</ul>");

            divSidemenu.InnerHtml = _menu.ToString();
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

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            if (Session["__Config__"] != null)
            {
                Session["__Config__"] = null;
                Session.Clear();
                Session.Abandon();
            }

            string loggedOutPageUrl = ResolveUrl("~/") + "login";
            Response.Write("<script language='javascript'>");
            Response.Write("function ClearHistory()");
            Response.Write("{");
            Response.Write(" var backlen=history.length;");
            Response.Write(" history.go(-backlen);");
            Response.Write(" window.location.href='" + loggedOutPageUrl + "'; ");
            Response.Write("}");
            Response.Write("</script>");
        }
    }
}