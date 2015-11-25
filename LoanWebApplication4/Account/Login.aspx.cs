using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //System.Threading.Tasks.Task.Factory.StartNew(() => CheckDueInvestments());
            //System.Threading.Tasks.Task.Factory.StartNew(() => { Utils.CalculateDefaultersInterest(); });
            //RegisterHyperLink.NavigateUrl = "~/UserRegistrationPage.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginUser_LoggedIn(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/");
        }

        protected void LoginUser_LoginError(object sender, EventArgs e)
        {
            FailureText.Text = "Your login attempt was not successful. Please try again.";
            ErrorPanel.Visible = true;
        }

        void CheckDueInvestments()
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                foreach (Investment item in db.Investments.Where(i => i.InvestmentTypeId == (int)Utils.EnumInvestmentTypes.FixedDeposit))
                {
                    if (DateTime.Today.Date >= item.MaturityDate.Value.Date)
                    {
                        item.IsMatured = true;
                        db.SubmitChanges();
                    }
                }
            }

        }
    }
}
