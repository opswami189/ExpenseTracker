using ExpenseTracker.NewFolder1;
using System;
using System.Linq;
using System.Web;

namespace ExpenseTracker
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            if (context != null && context.Session != null)
            {
                context.Session["Id"] = ((System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData;
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (var ctx = new PaymentContext())
            {
                var mode = new PaymentMode();

                mode.Mode = TxtMode.Text;

                int UserId = Convert.ToInt32(((System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData);

                mode.UserProfileId = UserId;

                mode.IsDeleted = false;

                if (ctx.PaymentModes.Any(x => (x.Mode == TxtMode.Text) && x.UserProfileId == UserId))
                {
                    LblMessage.Text = null;
                    LblError.Text = "* Payment mode already exists!";
                }
                else
                {
                    ctx.PaymentModes.Add(mode);
                    ctx.SaveChanges();
                    LblError.Text = null;
                    LblMessage.Text = "Payment mode Added";
                }
            }
            GridViewModes.DataBind();
            TxtMode.Text = null;
        }
    }
}