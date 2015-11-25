using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class InvestmentWithdrawal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("Withdrawal", "Open");

            if (!IsPostBack)
            {
                Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                Session["CurrentUser_session"] = User.Identity.Name;
            }
        }



        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Withdrawal", "Edit");
        }

        protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Withdrawal", "Delete");
        }

        protected void item_inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Withdrawal", "Create");
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


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("InvestmentStatement_Real.aspx?InvId=" + Request.QueryString["InvId"] + "&mid=" + Request.QueryString["mid"]);
        }

        protected void FormView2_ItemInserted1(object sender, FormViewInsertedEventArgs e)
        {
            FormView3.DataBind();


            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                Member _member = db.Members.FirstOrDefault(m => m.MemberId == Convert.ToInt32(Request.QueryString["mid"]));
                //int investmentTypeID = ( db.Investments.FirstOrDefault(i => i.InvestmentID == Convert.ToInt32( Request.QueryString["InvId"])).InvestmentTypeId.Value);
                //AccountType accType = db.AccountTypes.FirstOrDefault(a => a.DefaultInvestmentTypeID == investmentTypeID);


                //withdrawal
                List<AccountTypeFeature> aFeatures = _member.AccountType.AccountTypeFeatures.Where(a => a.CalculateOn == 2).ToList();
                foreach (AccountTypeFeature item in aFeatures)
                {
                    decimal valueToApply = 0;
                    if (item.IsPercentage.Value)
                    {
                        valueToApply = item.ValueToApply.Value / 100 * Convert.ToDecimal(Session["WithdrawnAmount"]);
                    }
                    else
                    {
                        valueToApply = item.ValueToApply.Value;
                    }



                    if (item.IsDeduction.Value) //is deduction
                    {
                        AppliedDeduction aDeduction = new AppliedDeduction();
                        aDeduction.CreatedBy = User.Identity.Name;
                        aDeduction.CreatedDate = DateTime.Now;
                        aDeduction.DeductionAmount = valueToApply;
                        aDeduction.InvestmentID = Convert.ToInt32(Request.QueryString["InvId"]);
                        //aDeduction.IsDeleted = false;
                        aDeduction.Rate = item.ValueToApply;
                        db.AppliedDeductions.InsertOnSubmit(aDeduction);
                    }
                    else //is addition
                    {
                        AppliedInterest aInterest = new AppliedInterest();
                        aInterest.CreatedBy = User.Identity.Name;
                        aInterest.CreatedDate = DateTime.Now;
                        aInterest.InterestAmount = valueToApply;
                        aInterest.InvestmentID = Convert.ToInt32(Request.QueryString["InvId"]);
                        //aDeduction.IsDeleted = false;
                        aInterest.Rate = item.ValueToApply;
                        db.AppliedInterests.InsertOnSubmit(aInterest);
                    }

                    db.SubmitChanges();
                    ////AppliedAccountFeature aAccountFeature = new AppliedAccountFeature();
                    ////aAccountFeature.InvestmentID = Convert.ToInt32(Request.QueryString["InvId"]);
                    ////aAccountFeature.AccountNumber =
                }
            }
        }

        protected void FormView2_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            TextBox txt = (TextBox) FormView2.FindControl("WithdrawalAmountTextBox0");
            Session["WithdrawnAmount"] = Convert.ToDecimal( txt.Text);
        }
    }
}