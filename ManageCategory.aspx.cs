using ExpenseTracker.NewFolder1;
using System;
using System.Linq;
using System.Web;

namespace ExpenseTracker
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            if (context != null && context.Session != null)
            {
                context.Session["Id"] = ((System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData;
            }
        }

        protected void BtnCategory_Click(object sender, EventArgs e)
        {
            using (var ctx = new PaymentContext())
            {
                var category = new Category();

                category.CategoryType = TxtCategoryType.Text;

                int UserId = Convert.ToInt32(((System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData);

                category.UserProfileId = UserId;

                category.IsDeleted = false;

                if (ctx.Categories.Any(x => (x.CategoryType == TxtCategoryType.Text) && x.UserProfileId == UserId))
                {
                    LblMessage.Text = null;
                    LblError.ForeColor = System.Drawing.Color.Red;
                    LblError.Text = "* Category already exists!";
                }
                else
                {
                    ctx.Categories.Add(category);
                    ctx.SaveChanges();
                    LblError.Text = null;
                    LblMessage.Text = "Category Added";
                }
            }
            GridViewCategories.DataBind();
            TxtCategoryType.Text = null;
        }
    }
}