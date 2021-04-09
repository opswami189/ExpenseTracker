using System;
using System.Web;

namespace ExpenseTracker
{
    public partial class ViewPayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            if (context != null && context.Session != null)
            {
                context.Session["Id"] = ((System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData;

            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}