using ExpenseTracker.NewFolder1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExpenseTracker
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void BtnCategory_Click(object sender, EventArgs e)
        {
            using (var ctx = new PaymentContext())
            {
                var category = new Category() { CategoryType = TxtCategoryType.Text };

                if (TxtCategoryType.Text != "" && TxtCategoryType.Text != " ")
                {
                    if (ctx.Categories.Any(x => x.CategoryType == TxtCategoryType.Text))
                    {
                        LblMessage.ForeColor = System.Drawing.Color.Red;
                        LblMessage.Text = "* Category already exists!";
                    }
                    else
                    {
                        ctx.Categories.Add(category);
                        ctx.SaveChanges();
                        LblMessage.ForeColor = System.Drawing.Color.Green;
                        LblMessage.Text = "Category Added";
                    }
                }
                else
                {
                    LblMessage.ForeColor = System.Drawing.Color.Red;
                    LblMessage.Text = "* Category name can not be empty!";
                }
            }
            GridViewCategories.DataBind();
            TxtCategoryType.Text = null;
        }
    }
}