using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class RunEndOfDay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Utils.CalculateDefaultersInterest();
            if (HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.IsInRole("SystemAdmin"))
            {
                System.Threading.Tasks.Task.Factory.StartNew(() => { Utils.CalculateDefaultersInterest(); }).Start();
                Button1.Enabled = false;
            }
            else
            {
                errorPanel.Visible = true;
            }
        }
    }
}