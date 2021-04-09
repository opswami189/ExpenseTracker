using ExpenseTracker.NewFolder1;
using System;
using System.Linq;
using System.Web;

namespace ExpenseTracker
{
    public partial class AddBeneficiary : System.Web.UI.Page
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
                bool nameIsValid = false;
                var beneficiary = new Beneficiary();
                if(TxtName.Text.Trim().Length <2)
                {
                    LblError.Text = "* Inavlid Beneficiary Name!";
                }
                else
                {
                    beneficiary.Name = TxtName.Text;
                    nameIsValid = true;
                }

                beneficiary.MobileNo = TxtMobileNo.Text;

                int UserId = Convert.ToInt32(((System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData);

                beneficiary.UserProfileId = UserId;

                beneficiary.IsDeleted = false;

                if (ctx.Beneficiaries.Any(x => (x.Name == TxtName.Text) && x.UserProfileId == UserId))
                {
                    LblMessage.Text = null;
                    LblError.Text = "* Beneficiary already exists!";
                }
                if(nameIsValid)
                {
                    ctx.Beneficiaries.Add(beneficiary);
                    ctx.SaveChanges();
                    LblError.Text = null;
                    LblMessage.Text = "Beneficiary Added";
                }

            }
            GridViewBeneficiaries.DataBind();
            TxtName.Text = null;
            TxtMobileNo.Text = null;
        }
    }
}