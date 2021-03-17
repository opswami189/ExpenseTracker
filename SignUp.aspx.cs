using ExpenseTracker.NewFolder1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExpenseTracker
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (var ctx = new PaymentContext())
            {
                var user = new UserProfile() { FirstName = TxtFirstName.Text, LastName = TxtLastName.Text, EmailId = TxtEmail.Text, Password = TxtPassword.Text, MobileNo = TxtMobileNo.Text };
                if(TxtFirstName.Text!=""|| TxtEmail.Text!=""|| TxtPassword.Text!="")
                {
                    ctx.userProfiles.Add(user);
                    ctx.SaveChanges();
                }
                else
                {
                    LblEnterDetails.Text = "* First Name, Email Id and Password can't be empty";
                }
                
            }
            if (TxtFirstName.Text != "" || TxtEmail.Text != "" || TxtPassword.Text != "")
            {
                TxtFirstName.Text = null;
                TxtLastName.Text = null;
                TxtEmail.Text = null;
                TxtPassword.Text = null;
                TxtMobileNo.Text = null;
                LblFeedback.Text = "Your account has been created!";
                LblRedirect.Text = "Redirecting to LogIn page.....";
                Response.AppendHeader("Refresh", "5;url=SignIn.aspx");
            }
             

        }
    }
}