using ExpenseTracker.NewFolder1;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace ExpenseTracker
{
    public partial class AddBeneficiary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
            {
                Response.Redirect("login.aspx", false);
            }
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (var ctx = new PaymentContext())
            {
                var pmt = new Beneficiary() { Name = TxtName.Text, MobileNo = TxtMobileNo.Text };

                if (TxtName.Text != "" && TxtName.Text != " ")
                {
                    if (ctx.Beneficiaries.Any(x => (x.Name == TxtName.Text)))
                    {
                        LblMessage.ForeColor = System.Drawing.Color.Red;
                        LblMessage.Text = "* Beneficiary already exists!";
                    }
                    else
                    {
                        ctx.Beneficiaries.Add(pmt);
                        ctx.SaveChanges();
                        LblMessage.ForeColor = System.Drawing.Color.Green;
                        LblMessage.Text = "Beneficiary Added";
                    }
                }
                else
                {
                    LblMessage.ForeColor = System.Drawing.Color.Red;
                    LblMessage.Text = "* Name can not be empty!";
                }
            }
            GridViewBeneficiaries.DataBind();
            TxtName.Text = null;
            TxtMobileNo.Text = null;
        }

        protected void GridViewBeneficiaries_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewBeneficiaries.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GridViewBeneficiaries_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewBeneficiaries.EditIndex = -1;
            BindData();
        }
        protected void GridViewBeneficiaries_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Id = (int)e.Keys["Id"];
            string Name = (string)e.NewValues["Name"];
            string MobileNo = (string)e.NewValues["MobileNo"];

            // Update here the database record for the selected ID


            GridViewBeneficiaries.EditIndex = -1;
            BindData();
        }
        protected void GridViewBeneficiaries_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = (int)e.Keys["Id"];

            SqlCommand cmd = new SqlCommand("delete from [Beneficiary] where Id=@Id", conn);
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            // Delete here the database record for the selected patientID

            BindData();
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ExpenseTrackerConnectionString"].ConnectionString);

        private void BindData()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Beneficiary]", conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Close();
            GridViewBeneficiaries.DataSource = null;
            GridViewBeneficiaries.DataBind();
        }
    }
}