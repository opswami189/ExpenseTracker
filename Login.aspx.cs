using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using ExpenseTracker.NewFolder1;

namespace ExpenseTracker
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void BtnLogIn_Click(object sender, EventArgs e)
        {
            
            using(var ctx = new PaymentContext())
            {
               
                var userProfile = ctx.userProfiles.FirstOrDefault(x => (x.EmailId == TxtUserId.Text && x.Password == TxtPassword.Text));
                if (userProfile != null)
                {
                    Session["Id"] = userProfile.Id;
                    Session["name"] = userProfile.FirstName;
                    Response.Redirect("AddExpense.aspx",false);

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