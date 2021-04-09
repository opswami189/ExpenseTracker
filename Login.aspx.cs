using ExpenseTracker.NewFolder1;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace ExpenseTracker
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnLogIn_Click(object sender, EventArgs e)
        {

            using (var ctx = new PaymentContext())
            {
                var userProfile = ctx.userProfiles.FirstOrDefault(x => (x.EmailId == TxtUserId.Text && x.Password == TxtPassword.Text));
                string userName = userProfile.FirstName;
                bool isPersistent = ChkRememberMe.Checked;

                if (userProfile != null)
                {
                    string userId = userProfile.Id.ToString();
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                    userName,
                    DateTime.Now,
                    DateTime.Now.AddMonths(1),
                    isPersistent,
                    userId,
                    FormsAuthentication.FormsCookiePath);

                    // Encrypt the ticket.
                    string encTicket = FormsAuthentication.Encrypt(ticket);

                    // Create the cookie.
                    HttpCookie ck = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
                    ck.Path = FormsAuthentication.FormsCookiePath;
                    if(isPersistent)
                    {
                        ck.Expires = DateTime.Now.AddMonths(1);
                    }
                    Response.Cookies.Add(ck);
                    // Redirect back to original URL.
                    Response.Redirect(FormsAuthentication.GetRedirectUrl(userName, isPersistent));
                    FormsAuthentication.RedirectFromLoginPage(TxtUserId.Text, ChkRememberMe.Checked);
                    
                }
                else
                {
                    LblError.ForeColor = System.Drawing.Color.Red;
                    LblError.Text = "Invalid User";
                }
            }
        }
    }
}