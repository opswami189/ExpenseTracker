using ExpenseTracker.NewFolder1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExpenseTracker
{
    public partial class AddExpense : System.Web.UI.Page
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
                var payment = new Payment()
                {
                    UserProfileId = Convert.ToInt32(Session["Id"]),
                    TransactionDate = Convert.ToDateTime(TxtDate.Text),
                    Amount = int.Parse(TxtAmount.Text),
                    CategoryId = int.Parse(DropDownCategory.SelectedValue),
                    IsCredit = CheckBoxIsCredit.Checked,
                    BeneficiaryId = int.Parse(DropDownBeneficiary.SelectedValue),
                    PaymentModeId = int.Parse(DropDownMode.SelectedValue),
                    PaymentDetails = TxtDetails.Text
                };

                ctx.Payments.Add(payment);
                ctx.SaveChanges();

            }
            TxtDetails.Text = null;
        }

        protected void TxtDate_TextChanged1(object sender, EventArgs e)
        {

        }
    }
}