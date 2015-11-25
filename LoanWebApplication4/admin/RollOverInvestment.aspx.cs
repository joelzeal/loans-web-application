using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class RollOverInvestment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ReportViewer1.LocalReport.SubreportProcessing += new Microsoft.Reporting.WebForms.SubreportProcessingEventHandler(LocalReport_SubreportProcessing);

            //load data for the dropdown datagrid 
            //var loanSchedules = Utils.GetDataContext().RepaymentSchedules.Where(l => l.LoanId == Convert.ToInt32(Request.QueryString["lid"]) && Convert.ToBoolean(l.IsPaymentMade) == false).OrderBy(r => r.RepaymentDate);
            //FriendGridView.DataSource = loanSchedules;
            //FriendGridView.DataBind();
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
            txtFriend.Text = (FriendGridView.Rows[FriendGridView.SelectedIndex].Cells[6].Controls[1] as System.Web.UI.WebControls.Label).Text;// HiddenField1.Value;
            //RepaymentAmountTextBox.Text = RemoveCurrencySymbolFromText((FriendGridView.Rows[FriendGridView.SelectedIndex].Cells[2].Controls[1] as System.Web.UI.WebControls.Label).Text);
            InvestmentIDHiddenField.Value = FriendGridView.SelectedDataKey.Value.ToString();
           // FormView1.DataSource = FriendGridView.Rows[FriendGridView.SelectedIndex].DataItem;
            FormView1.DataBind();
            Button1.Visible = true;
        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex > 0)
            {
                plDetails.Visible = true;
                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    int _fixedDepositeInvestmentTypeId = 3;
                    var _vwInvestments = db.vwMemberInvestmentWithTotalContributionAndWithdrawals.Where(m => m.MemberID == Convert.ToInt32(DropDownList1.SelectedValue) && DateTime.Today.Date >= m.MaturityDate.Value.Date && m.InvestmentTypeId == _fixedDepositeInvestmentTypeId);
                    FriendGridView.DataSource = _vwInvestments;
                    FriendGridView.DataBind();

                }
            }
            else
            {
                plDetails.Visible = false;
            }
        }


        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                tblMember.Visible = true;
                tblGroup.Visible = false;

                ////hide group and show member
                //if (DropDownList1.SelectedIndex > 0)
                //{
                //    dvGroupdataSection.Visible = false;
                //    dataSection.Visible = true;
                //    memberHeader.InnerText = "Member Headers";

                //}
                //else
                //{
                //    dataSection.Visible = false;
                //    loanDataSection.Visible = false;
                //    memberHeader.Visible = false;
                //    LoanHeader.Visible = false;
                //}
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                tblMember.Visible = false;
                tblGroup.Visible = true;

                ////hide member and show group 
                //if (cboGroupName.SelectedIndex > 0)
                //{
                //    dvGroupdataSection.Visible = true;
                //    dataSection.Visible = false;
                //    memberHeader.InnerText = "Group Headers";
                //}
                //else
                //{
                //    dataSection.Visible = false;
                //    loanDataSection.Visible = false;
                //    memberHeader.Visible = false;
                //    LoanHeader.Visible = false;
                //}
            }
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            //withdraw all money
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                MemberWithdrawal _memberWithdrawal = new MemberWithdrawal() {
                    CreatedBy = HttpContext.Current.User.Identity.Name,
                    DateCreated = DateTime.Now,
                    IsDeleted = false,
                    InvestmentID = Convert.ToInt32( InvestmentIDHiddenField.Value),
                    Narration = "Withdrawal For Rollover",
                    WithdrawalIssuedByUserName = HttpContext.Current.User.Identity.Name, WithdrawnBy = "System", WithdrawalAmount = Convert.ToDecimal( txtFriend.Text)
                    
                };

                //submit withdrawal changes
                db.MemberWithdrawals.InsertOnSubmit(_memberWithdrawal);


                //update the status of the current investment
                Investment _currentinvestment = db.Investments.FirstOrDefault(i => i.InvestmentID == Convert.ToInt32(InvestmentIDHiddenField.Value));
                _currentinvestment.IsActive = false;

                //get company profile
                 LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                
                //get compound type -- thus, annully, monthly, weekly etc
                int compoundType = cProfile.CompoundFrequency.Value; 

                LoanDuration _loanDuration = db.LoanDurations.FirstOrDefault(l => l.LoanDurationId == _currentinvestment.DurationTypeId.Value);//Convert.ToInt32(cboLoanDurationType.SelectedValue));
                if (_loanDuration == null)
                    return;



                //calculate matured amount for the new investment
                double _maturedAmountForNewInvestment;
                DateTime _maturityDate = DateTime.Now;

                decimal period = _currentinvestment.Duration.Value * _loanDuration.NumberOfMonths.Value / 12;
                if (_currentinvestment.InterestTypeId.Value == 1) //compound
                {
                    _maturedAmountForNewInvestment = Utils.calculateCompoundInterest(Convert.ToDouble(_currentinvestment.MaturedAmount.Value), Convert.ToDouble(_currentinvestment.InsterstRate.Value), period, Utils.GetCompoundType(compoundType));
                }
                else //2 for simple interest
                {
                    _maturedAmountForNewInvestment = Utils.calculateSimpleInterest(Convert.ToDouble(_currentinvestment.MaturedAmount.Value), Convert.ToDouble(_currentinvestment.InsterstRate.Value), period);
                }





                //create new investment
                Investment _newInvestment = new Investment()
                {
                    IsActive = true,
                    InvestmentTypeId = _currentinvestment.InvestmentTypeId,
                    IsMatured = false,
                    //ContributionFreqAmount = _currentinvestment.ContributionFreqAmount, //not calculating ContributionFreqAmount because after an investment is rolled over it becomes a fixed deposit
                    Duration = _currentinvestment.Duration,
                    DurationTypeId = _currentinvestment.DurationTypeId,
                    GroupId = RadioButtonList1.SelectedIndex == 1 ? _currentinvestment.GroupId : null,
                    InterestTypeId = _currentinvestment.InterestTypeId,
                    InvestmentAmount = _currentinvestment.MaturedAmount,
                    MaturedAmount = (decimal)_maturedAmountForNewInvestment,
                    InvestmentCalculationStartDate = DateTime.Today,
                    MaturityDate = _maturityDate,
                    MemberID = RadioButtonList1.SelectedIndex == 0 ? _currentinvestment.MemberID : null,
                    ParentInvestmentID = _currentinvestment.InvestmentID,
                    InsterstRate = _currentinvestment.InsterstRate 
                };


                //calculate maturity date
                //variable to hold period for the calculation of MaturityDate calculation
                int tempPeriod;
                tempPeriod = Convert.ToInt32(_currentinvestment.Duration.Value) * _loanDuration.NumberOfMonths.Value;


                //start calculation from the LoanCalculationStartDate specified
                _newInvestment.MaturityDate = _newInvestment.InvestmentCalculationStartDate.Value.AddMonths(tempPeriod);

                //if the expected repayment end date falls on a weekend, move it to a working
                if (_newInvestment.MaturityDate.Value.DayOfWeek == DayOfWeek.Saturday)
                {
                    _newInvestment.MaturityDate = _newInvestment.MaturityDate.Value.AddDays(2);
                }
                else if (_newInvestment.MaturityDate.Value.DayOfWeek == DayOfWeek.Sunday)
                {
                    _newInvestment.MaturityDate = _newInvestment.MaturityDate.Value.AddDays(1);
                }

                db.Investments.InsertOnSubmit(_newInvestment);
                db.SubmitChanges();


                //audit
                Utils.logAction("Insert", _newInvestment);
                Utils.logAction("Insert", _memberWithdrawal);

                //set current receipt number
                Parameter prm = db.Parameters.FirstOrDefault();

                //increase receipt number by one
                prm.ReceiptNumber++;
                Contribution _newDeposit = new Contribution()
                {
                    ContributionAmount = _currentinvestment.MaturedAmount,
                    InvestmentId = _currentinvestment.InvestmentID,
                    ContributionAmountInWords = Utils.ConvertMoneyToText(_currentinvestment.MaturedAmount.ToString()),
                    ContributionBy = "System",
                    Description = "Rollover from Investment: " + _currentinvestment.InvestmentID.ToString(),
                    ReceiptNumber = prm.ReceiptNumber.Value.ToString().PadLeft(6, '0'),
                    RecievedBy = User.Identity.Name
                };
                 
                Response.Redirect(DropDownList1.SelectedIndex > 0 ? "MemberInvestments.aspx?mid=" + DropDownList1.SelectedValue : "GroupInvestments.aspx?gid=" + cboGroupName.SelectedValue);
            }
        }

        protected void cboGroupName_DataBound(object sender, EventArgs e)
        {
            cboGroupName.Items.Insert(0, new ListItem() { Text = "[Select Group]", Value = "-1" });
        }

        protected void cboGroupName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboGroupName.SelectedIndex > 0)
            {
                plDetails.Visible = true;
                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    var _vwInvestments = db.vwMemberInvestmentWithTotalContributionAndWithdrawals.Where(m => m.GroupId == Convert.ToInt32(cboGroupName.SelectedValue));
                    FriendGridView.DataSource = _vwInvestments;
                    FriendGridView.DataBind();
                }
            }
            else
            {
                plDetails.Visible = false;
            }
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem() { Text = "[Select Member]", Value = "-1" });
            //if (Request.QueryString["mid"] != null)
            //{
            //    DropDownList1.SelectedValue = Request.QueryString["mid"];
            //}
        }
      
    }
}