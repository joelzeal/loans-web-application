using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("Members.aspx");
            if (!IsPostBack)
            {

                LoanWebApplication4.Sevices.FinanceManagerWebService proxy = new Sevices.FinanceManagerWebService();
                proxy.RunCalculcateDefaultersInterest();



                try
                {
                    litDepositsTotal.Text = Utils.GetDataContext().vwDepositesTodays.Sum(d => d.ContributionAmount).Value.ToString("C");
                }
                catch (Exception)
                {
                    litDepositsTotal.Text = 0.ToString("C");
                }
                try
                {
                    litTotalWithDrawalTotal.Text = Utils.GetDataContext().vwWithdrawalsTodays.Sum(d => d.WithdrawalAmount).Value.ToString("C");
                }
                catch (Exception)
                {

                    litTotalWithDrawalTotal.Text = 0.ToString("C");
                }
                try
                {
                    litLoanDefaults.Text = Utils.GetDataContext().DefultersViews.Sum(d => d.Amount - d.TotalRepayment).Value.ToString("C");
                }
                catch (Exception)
                {

                    litLoanDefaults.Text = 0.ToString("C");
                }
                try
                {
                    litTodayLoansTotal.Text = Utils.GetDataContext().vwLoansTodays.Sum(d => d.Amount).Value.ToString("C");
                }
                catch (Exception)
                {
                    litTodayLoansTotal.Text = 0.ToString("C");
                }

                    Repeater1.DataSource = Utils.GetDataContext().vwDepositesTodays;
                    Repeater2.DataSource = Utils.GetDataContext().vwWithdrawalsTodays;
                    Repeater3.DataSource = Utils.GetDataContext().vwLoansTodays;
                    Repeater5.DataSource = Utils.GetDataContext().DefultersViews;

                    Repeater1.DataBind();
                    Repeater2.DataBind();
                    Repeater3.DataBind();
                    Repeater5.DataBind();
             
                //  
            }

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            vwDepositesToday _member = e.Item.DataItem as vwDepositesToday;
            ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = _member.IsGroup == "true" ? "GroupInvestmentContribution.aspx?gid=" + _member.CustomerID + "&invId=" + _member.InvestmentID :
                "InvestmentContribution.aspx?mid=" + _member.CustomerID + "&invId=" + _member.InvestmentID;
        }

        protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            vwWithdrawalsToday _member = e.Item.DataItem as vwWithdrawalsToday;
            ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = _member.IsGroup == "true" ? "GroupInvestmentWithdrawal.aspx?gid=" + _member.CustomerID + "&invId=" + _member.InvestmentID :
                "InvestmentWithdrawal.aspx?mid=" + _member.CustomerID + "&invId=" + _member.InvestmentID;
        }


        protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            vwLoansToday _member = e.Item.DataItem as vwLoansToday;
            ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = _member.IsGroup == "true" ? "GroupLoanRepayment.aspx?gid=" + _member.CustomerId + "&lid=" + _member.LoanID :
                "LoanRepayment.aspx?mid=" + _member.CustomerId + "&lid=" + _member.LoanID;
        }

        protected void Repeater5_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DefultersView _member = e.Item.DataItem as DefultersView;
            ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = _member.IsGroup == "true" ? "GroupLoanRepayment.aspx?gid=" + _member.CustomerId + "&lid=" + _member.LoanID :
                "LoanRepayment.aspx?mid=" + _member.CustomerId + "&lid=" + _member.LoanID;
        }
    }
}