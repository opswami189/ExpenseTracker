using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace ExpenseTracker
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            if (context != null && context.Session != null)
            {
                context.Session["Id"] = ((System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData;

            }
            ChartCMC.Series["Series1"].Label = "#PERCENT\n#VALX";
            ChartCMD.Series["Series1"].Label = "#PERCENT\n#VALX";
            ChartPMC.Series["Series1"].Label = "#PERCENT\n#VALX";
            ChartPMD.Series["Series1"].Label = "#PERCENT\n#VALX";
            ChartCYC.Series["Series1"].Label = "#PERCENT\n#VALX";
            ChartCYD.Series["Series1"].Label = "#PERCENT\n#VALX";

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}