using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class FixedDepositInvestmentWithdrawal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                Session["CurrentUser_session"] = User.Identity.Name;

                  
            }
            
        }

        //public decimal withdrawalAmount {

        //    get { return Convert.ToDecimal(Session["withdrawalAmount"]); }
        //    set { Session["withdrawalAmount"] = value; }
        
        //}

        protected void WithdrawalHistorySqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //MemberSqlDataSource1.UpdateParameters["WithdrawalAmount"].DefaultValue = withdrawalAmount.ToString();
            //MemberSqlDataSource1.Update();
        }

        protected void WithdrawalAmountTextBox_TextChanged(object sender, EventArgs e)
        {
            //withdrawalAmount = Convert.ToDecimal(((TextBox)sender).Text);
        }

        protected void FormView2_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            FormView3.DataBind();
           // MemberSqlDataSource1.Select(new DataSourceSelectArguments());
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("InvestmentStatement_Real.aspx?InvId=" + Request.QueryString["InvId"] + "&mid=" + Request.QueryString["mid"]);
        }

        protected void FormView3_DataBound(object sender, EventArgs e)
        {
            var currentInvesment = (vwMemberFixedDepositInvestment_MemberDetailsAdded)FormView3.DataItem;
            if (currentInvesment.MaturityDate <= DateTime.Now)
            {
                WithdrawalAmountTextBox.Text = currentInvesment.MaturedAmount.Value.ToString();
            }
            else
            {
                WithdrawalAmountTextBox.Text = currentInvesment.InvestmentAmount.Value.ToString();
            }
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            //fixed deposit doesnt allow part withdrawal. The whole amount should be withdrawn
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                MemberWithdrawal _memberWithdrawal = new MemberWithdrawal()
                {
                    CreatedBy = HttpContext.Current.User.Identity.Name,
                    DateCreated = DateTime.Now, IsDeleted = false,
                     WithdrawalIssuedByUserName = User.Identity.Name,
                      InvestmentID = Convert.ToInt32(Request.QueryString["invId"]), Narration = "Fixed Deposit withdrawal"
                      , WithdrawalAmount = Convert.ToDecimal( WithdrawalAmountTextBox.Text) , WithdrawnBy = WithdrawalAmountTextBox.Text
                };

                Investment _investment = db.Investments.FirstOrDefault(i => i.InvestmentID == Convert.ToInt32(Request.QueryString["InvId"]));
                _investment.IsActive = false;

                db.MemberWithdrawals.InsertOnSubmit(_memberWithdrawal);
                db.SubmitChanges();

                //audit
                Utils.logAction("Insert", _memberWithdrawal);

                Response.Redirect("FixedDepositInvestmentStatement.aspx?invId=" + Request.QueryString["invId"] + "&gid=" + Request.QueryString["gid"]);
            }
        }
    }
}