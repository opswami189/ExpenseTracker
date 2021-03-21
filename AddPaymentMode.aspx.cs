using ExpenseTracker.NewFolder1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExpenseTracker
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (var ctx = new PaymentContext())
            {
                var mode = new PaymentMode() { Mode = TxtMode.Text };
                if(TxtMode.Text !="" && TxtMode.Text!=" ")
                {
                    if (ctx.PaymentModes.Any(x => x.Mode == TxtMode.Text))
                    {
                        LblMessage.ForeColor = System.Drawing.Color.Red;
                        LblMessage.Text = "* Payment mode already exists!";
                    }
                    else
                    {
                        ctx.PaymentModes.Add(mode);
                        ctx.SaveChanges();
                        LblMessage.ForeColor = System.Drawing.Color.Green;
                        LblMessage.Text = "Payment mode Added";
                    }
                }
                else
                {
                    LblMessage.ForeColor = System.Drawing.Color.Red;
                    LblMessage.Text = "* Mode can not be empty!";
                }
            }
            GridViewModes.DataBind();
            TxtMode.Text = null;
        }
    }
}