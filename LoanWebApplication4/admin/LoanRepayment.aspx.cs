using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class LoanRepayment : System.Web.UI.Page
    {
        public int? InvestmentID
        {
            get { return Convert.ToInt32(Session["InvestmentID"]); }
            set
            {
                Session["InvestmentID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("LoanRepayment", "Open");

            if (!IsPostBack)
            {
                Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                lblLoanBalance.Text = GetLoanBalance().ToString("C");

                var loanSchedules = Utils.GetDataContext().RepaymentSchedules.Where(l => l.LoanId == Convert.ToInt32( Request.QueryString["lid"]) && Convert.ToBoolean( l.IsPaymentMade) == false).OrderBy( r => r.RepaymentDate);
                FriendGridView.DataSource = loanSchedules;
                FriendGridView.DataBind();

                //set values for repayment values that were previouly entered before navigatio navigation to the LoanRepaymentWithInvestment.aspx page
                if (Utils.CurrentScheduleID != "")
                {
                    txtFriend.Text = Utils.CurrentscheduleDate;
                    PaidTextBox.Text = Utils.CurrentPaidBy;
                    RepaymentAmountTextBox.Text = Utils.CurrentRepaymentAmount;
                    ScheduleIDHiddenField.Value = Utils.CurrentScheduleID;
                }

                //get investment Id
                if (Request.QueryString["InvID"] != null)
                {
                    LinkButton1.Visible = true;
                    InvestmentID = Convert.ToInt32(Request.QueryString["InvID"]);
                }
                else
                {
                    LinkButton1.Visible = false;
                }
                

                if (Request.QueryString["ra"] != null)
                {
                    RepaymentAmountTextBox.Text = Request.QueryString["ra"];
                }
            }
            else
            {
                //find out why i'm doing this here. Commented it out cos i'm not sure why i'm doing this.
                //if (Request.QueryString["invId"] != null)
                //{
                //    RepaymentAmountTextBox.Text = Request.QueryString["invAmount"];
                //}
                //ErrorLabel.Visible = true;
            }

           // DivMemberDetails.Attributes["height"] = DivRepaymentDetails.Attributes["height"];
        }

        decimal GetLoanBalance()
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                try
                {
                    decimal totalRepayment = 0;
                    totalRepayment = db.Loans.FirstOrDefault(l => l.LoanID == Convert.ToInt32(Request.QueryString["lid"])).Repayments.Where(r => r.isDeleted == false). Sum(r => r.RepaymentAmount).Value;
                    Loan _loan = db.Loans.FirstOrDefault(l => l.LoanID == Convert.ToInt32(Request.QueryString["lid"]));
                    lblTotalRepayment.Text = totalRepayment.ToString("C");

                    decimal totalPenalty =0;
                    //caculate total balance
                    try
                    {
                         totalPenalty = db.LoanPenalties.Where<LoanPenalty>(p => p.LoanID == _loan.LoanID && p.IsReleived == false).Sum(lp => lp.PenaltyAmount.Value);
                    }
                    catch (Exception)
                    {
                        totalPenalty = 0;
                    }
                    lblTotalPenalty.Text = totalPenalty.ToString("C");

                    if (totalPenalty <= 0)
                    {
                        lblTotalPenalty.Visible = false;
                        LitPenaltyLabel.Visible = false;
                    }
                    else
                    {
                        //change color scheme
                        DivMemberDetails.Attributes["class"] = "OverDueDataSection";
                        DivRepaymentDetails.Attributes["class"] = "OverDueDataSection";
                        DivNewRepayment .Attributes["class"] = "OverDueDataSection";
                    }

                    if (_loan.Amount.Value - totalRepayment <= 0)
                    {
                        _loan.IsPaidup = true;
                        db.SubmitChanges();

                        DivRepaymentDetails.Attributes["class"] = "DataSectionGreen";
                        DivMemberDetails.Attributes["class"] = "DataSectionGreen";
                        DivNewRepayment.Attributes["class"] = "DataSectionGreen";
                       // DivNewRepayment.Style = new CssStyleCollection(

                       Style style = new Style();
                       CssStyleCollection css = style.GetStyleAttributes(DivMemberDetails);
                        css.Add("height", "800px");

                    }

                    return _loan.Amount.Value - totalRepayment;
                }
                catch (Exception)
                {
                    return 0;
                }
            }
        }

        protected void RepaymentSqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblLoanBalance.Text = GetLoanBalance().ToString("C");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FriendGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             if (e.Row.RowType != DataControlRowType.DataRow)
                 return;

             // On MouseOver set the cursor to hand and save the backcolor in a field and set it to #bbbbbb
             e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';"
             + "this.originalBackgroundColor=this.style.backgroundColor;"
             + "this.style.backgroundColor='#bbbbbb';";

             // On MouseOut set the backcolor to the value it had before
             e.Row.Attributes["onmouseout"] =
             "this.style.backgroundColor=this.originalBackgroundColor;";

             // On Click send a SelectEvent so that the SelectedIndexChanged-EventHandler gets called
             e.Row.Attributes["onclick"] =
             ClientScript.GetPostBackClientHyperlink(FriendGridView, "Select$" + e.Row.RowIndex);
             //HiddenField1.Value = e.Row.RowIndex.ToString();
        }

        protected void FriendGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
             //assign firstname only
               // txtFriend.Text = FriendGridView.SelectedRow != null ? Server.HtmlDecode(
                                                                   //     FriendGridView.SelectedRow.Cells[1].Text) : "";
            txtFriend.Text = (FriendGridView.Rows[FriendGridView.SelectedIndex].Cells[0].Controls[1] as System.Web.UI.WebControls.Label).Text;// HiddenField1.Value;
            RepaymentAmountTextBox.Text = RemoveCurrencySymbolFromText((FriendGridView.Rows[FriendGridView.SelectedIndex].Cells[2].Controls[1] as System.Web.UI.WebControls.Label).Text);
            ScheduleIDHiddenField.Value = FriendGridView.SelectedDataKey.Value.ToString();
        }

        string RemoveCurrencySymbolFromText(string text)
        {
            int number = 1;
            string str = number.ToString("C");
            str = str.Split('1')[0];
            return text.Remove(0, str.ToCharArray().Length);
        }


        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("LoanRepayment", "Edit");
        }

        protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("LoanRepayment", "Delete");
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {

            Utils.IsAuthorized("LoanRepayment", "Create");


            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                //check if investment has any contributions that can be used as loan payment
                //update investment
                Investment _investment;
                Loan _loan = db.Loans.FirstOrDefault(l => l.LoanID == Convert.ToInt32(Request.QueryString["lid"]));
                // int _investmentID ;
                //if (Request.QueryString["invID"] == null || Request.QueryString["invID"] == "")
                if (InvestmentID != null && InvestmentID > 0)
                {
                    // _investmentID = Convert.ToInt32(Request.QueryString["invID"]);

                    _investment = Utils.GetDataContext().Investments.FirstOrDefault(i => i.InvestmentID == InvestmentID);

                    //total contributions towards the selected investment
                    decimal? totalContributions = _investment.Contributions.Sum(c => c.ContributionAmount.Value);
                    if (totalContributions != null)
                    {
                        if (totalContributions < Convert.ToDecimal(RepaymentAmountTextBox.Text))
                        {
                            ErrorLabel.Text = "Repayment amount cannot be greater than the selected investment amount.";
                            ErrorLabel.Visible = true;
                            return;
                        }
                        else
                        {
                            //update investment withdrawal
                            MemberWithdrawal _withdrawal = new MemberWithdrawal()
                            {
                                CreatedBy = HttpContext.Current.User.Identity.Name, DateCreated = DateTime.Now,
                                InvestmentID = InvestmentID,
                                Narration = "Payment For Loan",
                                WithdrawalAmount = Convert.ToDecimal(RepaymentAmountTextBox.Text),
                                WithdrawalIssuedByUserName = User.Identity.Name,
                                WithdrawnBy = PaidTextBox.Text,
                                MemberId = Convert.ToInt32(Request.QueryString["mid"]), IsDeleted = false
                            };

                            //_investment.MemberWithdrawals.Add(new MemberWithdrawal()
                            //{
                            //    InvestmentID = InvestmentID,
                            //    Narration = "Payment For Loan",
                            //    WithdrawalAmount = Convert.ToDecimal(RepaymentAmountTextBox.Text),
                            //    WithdrawalIssuedByUserName = User.Identity.Name,
                            //    WithdrawnBy = PaidTextBox.Text,
                            //    MemberId = Convert.ToInt32(Request.QueryString["mid"])
                            //});

                            db.MemberWithdrawals.InsertOnSubmit(_withdrawal);
                            db.SubmitChanges();

                            //audit
                            Utils.logAction("Insert", _withdrawal);
                        }
                    }
                    else //contributions
                    {
                        ErrorLabel.Text = "Repayment amount cannot be greater than the selected investment amount.";
                        ErrorLabel.Visible = true;
                        return;
                    }
                }

                //set discription for repayment; payment by cash or with investment.
                string _description = Request.QueryString["invID"] == null || Request.QueryString["invID"] == "" ? "Loan repayment by cash" : "Loan repayment with investment";

                int? _repaidWithInvestmentID = InvestmentID;
                if (InvestmentID == 0)
                    _repaidWithInvestmentID = null;

                decimal _repaymentAmount = Convert.ToDecimal(RepaymentAmountTextBox.Text);
                decimal _interestRepayment = 0; //= (_loan.Interest.Value / 100) * _repaymentAmount;
                decimal _principalRepayment = 0;
                RepaymentSchedule _repaymentSchedule = db.RepaymentSchedules.FirstOrDefault(r => r.LoanId == Convert.ToInt32(Request.QueryString["lid"]));
                if (_repaymentSchedule != null)
                {
                    _interestRepayment = _repaymentSchedule.InterestPayment.Value;
                    _principalRepayment = _repaymentAmount - _interestRepayment;
                }
                //decimal _repaymentAmount = Convert.ToDecimal(RepaymentAmountTextBox.Text);
                //decimal _interestRepayment = (_loan.Interest.Value / 100) * _repaymentAmount;

                Repayment _loanRepayment = new Repayment()
                {
                    LoanId = Convert.ToInt32(Request.QueryString["lid"]),
                    Description = _description,
                    RepaymentAmount = _repaymentAmount,
                    RepaymentBy = PaidTextBox.Text,
                    CreatedDate = DateWebUserControl1.DtSelectedDate,
                    CreatedBy = User.Identity.Name,
                    RepaidWithInvestmentID = _repaidWithInvestmentID,
                    InterestPayment = _interestRepayment,
                    PrincipalPayment =  _principalRepayment, 
                    isDeleted = false,
                     ChequeNumber = "Cash"
                };

                //set current receipt number
                Parameter prm = db.Parameters.FirstOrDefault();

                //set vale for receipt number if its zero
                if (prm.ReceiptNumber == null)
                    prm.ReceiptNumber = 0;

                prm.ReceiptNumber++;
                //pad current receipt number with zeros
                _loanRepayment.ReceiptNumber = prm.ReceiptNumber.Value.ToString().PadLeft(6, '0');

                //set repayment amount in wores value
                _loanRepayment.RepaymentAmountInWords = Utils.ConvertMoneyToText(_loanRepayment.RepaymentAmount.ToString());


                db.Repayments.InsertOnSubmit(_loanRepayment);

                //update the selected schedule date
                if (ScheduleIDHiddenField.Value != "")
                {
                   // RepaymentSchedule _repaymentSchedule = db.RepaymentSchedules.FirstOrDefault(r => r.RepaymentScheduleId == Convert.ToInt32(ScheduleIDHiddenField.Value));
                    if (_repaymentSchedule != null)
                        _repaymentSchedule.IsPaymentMade = true;
                }

                //submit changes to the database
                db.SubmitChanges();

                //audit
                Utils.logAction("Insert", _loanRepayment);

                //rebind the repayment history data
                GridView1.DataBind();

                //update the total repayment date in the UI
                GetLoanBalance();

                //rebind loan schedules dropdown
                var loanSchedules = Utils.GetDataContext().RepaymentSchedules.Where(l => l.LoanId == Convert.ToInt32(Request.QueryString["lid"]) && Convert.ToBoolean(l.IsPaymentMade) == false).OrderBy(r => r.RepaymentDate);
                FriendGridView.DataSource = loanSchedules;
                FriendGridView.DataBind();


                //clear controls
                PaidTextBox.Text = "";
                txtFriend.Text = "";
                RepaymentAmountTextBox.Text = "";

               // ScriptManager.RegisterStartupScript(this, GetType(), "Receipt", "openWindow('RepaymentReceipt.aspx?rid='" +  _loanRepayment.RepaymentId.ToString() + "&mid=" + _loanRepayment.Loan.MemberId + "');", true);
                //Response.Write("<SCRIPT language=javascript>var w=window.open('RepaymentReceipt.aspx?rid=' +  _loanRepayment.RepaymentId.ToString() + '&mid=' + _loanRepayment.Loan.MemberId','OrderStatus','height=800,width=800');</SCRIPT>");
               Response.Redirect("RepaymentReceipt2.aspx?rid=" +  _loanRepayment.RepaymentId.ToString() + "&mid=" + _loanRepayment.Loan.MemberId);
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {

            //save selected schedule date, selected current sechedule id, paidBy
            Utils.CurrentPaidBy = PaidTextBox.Text;
            Utils.CurrentRepaymentAmount = RepaymentAmountTextBox.Text;
            Utils.CurrentscheduleDate = txtFriend.Text;
            Utils.CurrentScheduleID = ScheduleIDHiddenField.Value;
            Response.Redirect("LoanRepaymentWithInvestment.aspx?mid=" + Request.QueryString["mid"] + "&ra=" + RepaymentAmountTextBox.Text);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //show loan statement

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //http://localhost:1165/admin/LoanRepayment.aspx?lid=59&mid=25&invID=24
            Response.Redirect("LoanRepayment.aspx?lid=" + Request.QueryString["lid"] + "&mid=" + Request.QueryString["mid"] + "&ra=" + Request.QueryString["ra"]);
        }
    }

    
}