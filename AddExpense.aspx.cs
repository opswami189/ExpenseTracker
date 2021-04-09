using ExpenseTracker.NewFolder1;
using System;
using System.Web;

namespace ExpenseTracker
{
    public partial class AddExpense : System.Web.UI.Page
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
            bool amountIsValid = true;
            using (var ctx = new PaymentContext())
            {
                var payment = new Payment();
                payment.TransactionDate = DateTime.Parse(TxtDate.Text);

                payment.UserProfileId = Convert.ToInt32(((System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData);
                try
                {
                    payment.Amount = decimal.Parse(TxtAmount.Text);
                }
                catch
                {
                    amountIsValid = false;
                }
                
                payment.CategoryId = int.Parse(DropDownCategory.SelectedValue);

                payment.IsCredit = CheckBoxIsCredit.Checked;

                try
                {
                    payment.BeneficiaryId = int.Parse(DropDownBeneficiary.SelectedValue);
                }
                catch
                {
                    payment.BeneficiaryId = null;
                }

                payment.PaymentModeId = int.Parse(DropDownMode.SelectedValue);

                payment.PaymentDetails = TxtDetails.Text;

                if (amountIsValid)
                {
                    ctx.Payments.Add(payment);
                    ctx.SaveChanges();
                    TxtDate.Text = null;
                    TxtAmount.Text = null;
                    DropDownCategory.SelectedValue = null;
                    CheckBoxIsCredit.Checked = false;
                    DropDownBeneficiary.SelectedValue = null;
                    TxtDetails.Text = null;
                    LblError.Text = null;
                    LblMessage.Text = "Payment Added";
                }
                else
                {
                    if (!amountIsValid)
                    {
                        LblError.Text = "Invalid Amount!";
                    }
                }
            }
        }
    }
}