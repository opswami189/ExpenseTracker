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
                Response.Redirect("SignIn.aspx", false);
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (var ctx = new PaymentContext())
            {
                var mode = new PaymentMode() { Mode = TxtMode.Text };
                if(TxtMode.Text=="")
                {
                    LblRedirect.Text = "* Mode can not be empty!";
                }
                else if(ctx.PaymentModes.Any(x=>x.Mode==TxtMode.Text))
                {
                    LblRedirect.Text = "* Payment mode already exists!";
                }
                
                else
                {
                    ctx.PaymentModes.Add(mode);
                    ctx.SaveChanges();
                }
                
            }
            GridViewModes.DataBind();
            TxtMode.Text = null;
        }
    }
}