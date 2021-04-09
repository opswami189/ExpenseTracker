using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace ExpenseTracker
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(HttpContext.Current.Request.IsAuthenticated)
            {
                LblUserName.Text = "Welcome" + " " + HttpContext.Current.User.Identity.Name + " " + "!";
            }
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

    }
}