using ETH.BLL;
using ETH.SecurityManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LoginManagement ObjLogin = new LoginManagement();
            LoginHistory ObjLoginHistory = ObjLogin.VerifyLogin(txtEmail.Text, txtPassword.Text);
            if (ObjLoginHistory != null)
            {
                Session["__LoginHistory__"] = ObjLoginHistory;
                Response.Redirect("~/Dashboard");
            }
        }
    }
}