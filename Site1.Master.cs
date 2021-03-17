using ExpenseTracker.NewFolder1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExpenseTracker
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] != null)
            {
                LblUserName.Text = "Welcome" + " " + Session["name"] + " " + "!";
                BtnSignIn.Visible = false;
            }
        }

        protected void LinkManageExpense_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("SignIn.aspx", false);
            
        }

    }
}