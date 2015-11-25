using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class NewInvestment_FixedDeposit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0) //individuals selected
            {
                if (DropDownList1.SelectedIndex == 0 || DropDownList1.SelectedIndex == -1)
                {
                    dataSection.Visible = false;
                    loanDataSection.Visible = false;
                    memberHeader.Visible = false;
                    LoanHeader.Visible = false;

                }
                else
                {
                    dataSection.Visible = true;
                    loanDataSection.Visible = true;
                    memberHeader.Visible = true;
                    LoanHeader.Visible = true;


                }
            }
            else
            {
                if (cboGroupName.SelectedIndex == 0 || cboGroupName.SelectedIndex == -1)
                {
                    dvGroupdataSection.Visible = false;
                    loanDataSection.Visible = false;
                    memberHeader.Visible = false;
                    LoanHeader.Visible = false;
                }
                else
                {
                    dvGroupdataSection.Visible = true;
                    loanDataSection.Visible = true;
                    memberHeader.Visible = true;
                    LoanHeader.Visible = true;
                }
            }
           
            if (!IsPostBack)
            {
                //hide member and group combos
                tblMember.Visible = false;
                tblGroup.Visible = false;

                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                    InterestTextBox.Text = cProfile.CompoundInterestRate.ToString();

                }

                if (Request.QueryString["mid"] != null)
                {
                    if (DropDownList1.SelectedIndex == 0)
                    {
                        dataSection.Visible = false;
                    }
                    else
                    {
                        dataSection.Visible = true;
                    }

                    Image1.ImageUrl = "ImageDisplay.ashx?mid=" + DropDownList1.SelectedValue;
                    MultiView1.SetActiveView(View1);
                }
                //txtStartCalculationFrom_CalendarExtender.SelectedDate = DateTime.Today.Date;
                cboInterestDuration.Items.Insert(0, new ListItem() { Value = "[Select Interest Duration]", Text = "[Select Interest Duration]" });
            }
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem() { Text = "[Select Member]" , Value = "-1"});
            if (Request.QueryString["mid"] != null)
            {
                DropDownList1.SelectedValue = Request.QueryString["mid"];
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                dataSection.Visible = false;
            }
            else
            {
                dvGroupdataSection.Visible = false;
                dataSection.Visible = true;
            }

           
               Image1.ImageUrl = "ImageDisplay.ashx?mid=" + DropDownList1.SelectedValue;
                MultiView1.SetActiveView(View1);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MemberDetails.aspx?RedirectUrl=NewLoan.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
                LinkButton1_Click(this, e);
                MultiView1.SetActiveView(View2);
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            

            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();

                double principal = double.Parse(PrincipalTextBox.Text);

                // double interestRate = Convert.ToDouble(InterestTextBox.Text); //Convert.ToDouble(cProfile.CompoundInterestRate.Value);
                LoanDuration _loanDuration = db.LoanDurations.FirstOrDefault(l => l.LoanDurationId == Convert.ToInt32(cboLoanDurationType.SelectedValue));
                if (_loanDuration == null)
                    return;

                decimal period = decimal.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value / 12;

                //LoanPreset _loanPreset = db.LoanPresets.First(l => l.LoanPresetId == Convert.ToInt32(cboInterestDuration.SelectedValue));
                double interestRate = double.Parse(InterestTextBox.Text);//Utils.CalculateInterestRateByDuration(decimal.Parse(InterestTextBox.Text), period);

                // int period = int.Parse(DurationTextBox.Text);
                int compoundType = cProfile.CompoundFrequency.Value;
                //RepaymentFrequency _repaymentFrequency = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));
                double amount;

                if (InterestTypeDropDownList.SelectedValue == "1") //compound
                {
                    amount = Utils.calculateCompoundInterest(principal, interestRate, period, Utils.GetCompoundType(compoundType));
                }
                else //2 for simple interest
                {
                    amount = Utils.calculateSimpleInterest(principal, interestRate, period);
                }


                lblTotalAmount.Text = amount.ToString("C");

                //variable to hold period for the calculation of expectedEndDate calculation
                int tempPeriod;
                tempPeriod = int.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value;

               
                //double numberOfDaysBetweenExpectedEndDateAndNow = tSpan.TotalDays;//30 * period; //assuming there are 30 days in a month
                //int xx = (int)numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                //lblRepaymentAmountByFrequency.Text = (double.Parse(PrincipalTextBox.Text) / xx).ToString("C");
                lblDuration.Text = DurationTextBox.Text + " (" + cboLoanDurationType.SelectedItem.Text + ")";
                lblPrincipal.Text = Convert.ToDecimal(PrincipalTextBox.Text).ToString("C");
                lblInterestRate.Text = InterestTextBox.Text + "%";
                //litFrequencyDescription.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
                //litFrequencyDescription0.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;

            }
            
        }

        protected void RepaymentFrequencyDropdownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get description for repayment frequency
            //litFrequencyDescription.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
            //litFrequencyDescription0.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();

                double InvsetmentAmount = double.Parse(PrincipalTextBox.Text);
                double MaturedInvestmentAmount;// = double.Parse(lblTotalAmount.Text);

                // double interestRate = Convert.ToDouble(InterestTextBox.Text); //Convert.ToDouble(cProfile.CompoundInterestRate.Value);
                LoanDuration _loanDuration = db.LoanDurations.FirstOrDefault(l => l.LoanDurationId == Convert.ToInt32(cboLoanDurationType.SelectedValue));
                if (_loanDuration == null)
                    return;

                //int period = int.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value;
                decimal period = decimal.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value / 12;

                //LoanPreset _loanPreset = db.LoanPresets.First(l => l.LoanPresetId == Convert.ToInt32(cboInterestDuration.SelectedValue));
                //double interestRate = Utils.CalculateInterestRateByDuration(_loanPreset.InsterestRate.Value, period);

                //double interestRate = Utils.CalculateInterestRateByDuration(decimal.Parse(InterestTextBox.Text), period);
                double interestRate = double.Parse(InterestTextBox.Text);

                // int period = int.Parse(DurationTextBox.Text);
                int compoundType = cProfile.CompoundFrequency.Value;

                //using repayment frequency for contribution frequency
                //RepaymentFrequency _repaymentFrequency = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));
                double amount;

                if (InterestTypeDropDownList.SelectedValue == "1") //compound
                {
                    amount = Utils.calculateCompoundInterest(InvsetmentAmount, interestRate, period, Utils.GetCompoundType(compoundType));
                }
                else //2 for simple interest
                {
                    amount = Utils.calculateSimpleInterest(InvsetmentAmount, interestRate, period);
                }

                Investment newInvestment = new Investment();


                //set invementType to 3 for fixed deposit investment
                newInvestment.InvestmentTypeId = 3;

                //newLoan.ActualRepaymentEndDate = DateTime.Today.AddMonths(period);
               // newLoan.Amount = (decimal)amount;

                if (RadioButtonList1.SelectedIndex == 0) // individuals
                { 
                    newInvestment.MemberID = Convert.ToInt32(DropDownList1.SelectedValue);
                }
                else // groups selected
                {
                    newInvestment.GroupId = Convert.ToInt32(cboGroupName.SelectedValue);
                }

                newInvestment.InvestmentAmount = (decimal)InvsetmentAmount;
                //newInvestment.ContributionFrequencyId = _repaymentFrequency.RepaymentFrequencyId;
                newInvestment.IsMatured = false;
                newInvestment.InsterstRate = (decimal)interestRate;
                newInvestment.Duration = decimal.Parse(DurationTextBox.Text); 
                newInvestment.InterestTypeId = Convert.ToInt32(InterestTypeDropDownList.SelectedValue);
                //newLoan.payWithContribution = false;
                newInvestment.InvestmentCalculationStartDate = DateTime.Now;
                newInvestment.IsActive = true;

                //variable to hold period for the calculation of MaturityDate calculation
                int tempPeriod;
                tempPeriod = int.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value;


                //start calculation from the LoanCalculationStartDate specified
                newInvestment.MaturityDate = newInvestment.InvestmentCalculationStartDate.Value.AddMonths(tempPeriod);

                //if the expected repayment end date falls on a weekend, move it to a working
                if (newInvestment.MaturityDate.Value.DayOfWeek == DayOfWeek.Saturday)
                {
                   newInvestment.MaturityDate =  newInvestment.MaturityDate.Value.AddDays(2);
                }
                else if (newInvestment.MaturityDate.Value.DayOfWeek == DayOfWeek.Sunday)
                {
                    newInvestment.MaturityDate = newInvestment.MaturityDate.Value.AddDays(1);
                }

                newInvestment.DurationTypeId = Convert.ToInt32(cboLoanDurationType.SelectedValue);
                //newLoan.RawDurationEntered = DurationTextBox.Text;
                
                newInvestment.InvestmentCalculationStartDate = DateTime.Now;


                TimeSpan tSpan = newInvestment.MaturityDate.Value - newInvestment.InvestmentCalculationStartDate.Value;// -DateTime.Today;
                double numberOfDaysBetweenExpectedEndDateAndNow = tSpan.TotalDays;

                //int xx = (int)numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;

                //int numberOfDaysBetweenExpectedEndDateAndNow = 30 * period; //assuming there are 30 days in a month
                //decimal xx = numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                //newInvestment.ContributionFreqAmount = ((decimal)newInvestment.InvestmentAmount / xx);

                //maturity amount
                MaturedInvestmentAmount = amount;
                newInvestment.CreatedBy = this.User.Identity.Name;
                newInvestment.MaturedAmount = (decimal)amount;

                //set invementType to 3 for fixed deposit investment
                newInvestment.InvestmentTypeId = 3;


                Parameter prm = db.Parameters.FirstOrDefault();

                //increase receipt number by one
                prm.ReceiptNumber++;


                db.Investments.InsertOnSubmit(newInvestment);
                db.SubmitChanges();

                //audit
                Utils.logAction("Insert", newInvestment);

                //add contribution since it a fixed deposit
                Contribution _contribution = new Contribution()
                {
                    ContributionAmount = newInvestment.InvestmentAmount,
                    ContributionBy = "Self",
                    ContributionAmountInWords = Utils.ConvertMoneyToText(newInvestment.InvestmentAmount.ToString()),
                    Description = "Fixed deposit contribution",
                    ReceiptNumber = prm.ReceiptNumber.Value.ToString().PadLeft(6, '0'),
                    RecievedBy = User.Identity.Name,
                    InvestmentId = newInvestment.InvestmentID, IsDeleted = false
                };


                db.Contributions.InsertOnSubmit(_contribution);
                db.SubmitChanges();

                //audit
                Utils.logAction("Insert", _contribution);
               
                ResponseHelper.Redirect(this.Response, "ContributionReceipt.aspx?cid=" + _contribution.ContributionId.ToString() + "&mid=" + _contribution.Investment.MemberID, "_blank", "menubar=0,width=100,height=100");
                Response.Redirect("FixedDepositInvestmentStatement.aspx?invID=" + newInvestment.InvestmentID);
               
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
        }

        protected void cboInterestDuration_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                LoanPreset _loanPreset = db.LoanPresets.First(l => l.LoanPresetId == Convert.ToInt32(cboInterestDuration.SelectedValue));
                InterestTextBox.Text = _loanPreset.InsterestRate.ToString();
            }
        }

       

        protected void cboInterestDuration_DataBound(object sender, EventArgs e)
        {
            cboInterestDuration.Items.Insert(0, new ListItem() { Text = "----Select----" });
        }

        protected void cboLoanDurationType_DataBound(object sender, EventArgs e)
        {
            cboLoanDurationType.Items.Insert(0, new ListItem() { Text = "----Select----" });
        }

        //protected void RepaymentFrequencyDropdownList_DataBound(object sender, EventArgs e)
        //{
        //    RepaymentFrequencyDropdownList.Items.Insert(0, new ListItem() { Text = "----Select----" });
        //}

        protected void Button2_Click(object sender, EventArgs e)
        {
            Guarantor _guarantor = new Guarantor();

           
            _guarantor.GuarantorFirstName = MemberFirstNameTextBox.Text;
            _guarantor.GuarantorLastName = MemberLastNameTextBox.Text;
           // _guarantor.MemberBranch = MemberBranchTextBox.Text;
            //_guarantor.Balance.Value.ToString() = BalanceTextBox.Text;
            if (FileUpload1.HasFile)
                _guarantor.GuarantorPhoto = FileUpload1.FileBytes;
           // _guarantor.AccountNumber = AccountTextBox.Text;

           // _guarantor.AccountNumber = AccountTextBox.Text;
            _guarantor.OtherName = MemberOtherNameTextBox.Text;
            _guarantor.DOB = Convert.ToDateTime(MemberDOBNameTextBox.Text);
            _guarantor.Fax = MemberFaxTextBox0.Text;
            _guarantor.IdentityNumber = MemberIDNumberTextBox.Text;
            _guarantor.Mobile = MemberMobileTextBox.Text;
            _guarantor.ResidentialAddress = MemberResidentialTextBox.Text;
            _guarantor.Telephone = MemberTelTextBox.Text;
            _guarantor.IdentityTypeID = Convert.ToInt32(DropDownList1.SelectedValue);
            //_guarantor.ContactPerson = MemberContactPersonTextBox.Text;

            Utils.GetDataContext().Guarantors.InsertOnSubmit(_guarantor);
            Utils.GetDataContext().SubmitChanges();

            //audit
            Utils.logAction("Insert", _guarantor);
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                tblMember.Visible = true;
                tblGroup.Visible = false;

                //hide group and show member
                if (DropDownList1.SelectedIndex > 0)
                {
                    dvGroupdataSection.Visible = false;
                    dataSection.Visible = true;
                    memberHeader.InnerText = "Member Headers";
                    
                }
                else
                {
                    dataSection.Visible = false;
                    loanDataSection.Visible = false;
                    memberHeader.Visible = false;
                    LoanHeader.Visible = false;
                }
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                tblMember.Visible = false;
                tblGroup.Visible = true;

                //hide member and show group 
                if (cboGroupName.SelectedIndex > 0)
                {
                    dvGroupdataSection.Visible = true;
                    dataSection.Visible = false;
                    memberHeader.InnerText = "Group Headers";
                }
                else
                {
                    dataSection.Visible = false;
                    loanDataSection.Visible = false;
                    memberHeader.Visible = false;
                    LoanHeader.Visible = false;
                }
            }
        }

        protected void btnGroup_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void cboGroupName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboGroupName.SelectedIndex == 0)
            {
                dvGroupdataSection.Visible = false;
                dvGroupdataSection.Visible = false;
                loanDataSection.Visible = false;
                memberHeader.Visible = false;
                LoanHeader.Visible = false;
            }
            else
            {
                dataSection.Visible = false;
                dvGroupdataSection.Visible = true;
                loanDataSection.Visible = true;
                memberHeader.Visible = true;
                LoanHeader.Visible = true;
                MultiView1.SetActiveView(View1);
            }
        }

        protected void cboGroupName_DataBound(object sender, EventArgs e)
        {
            cboGroupName.Items.Insert(0, new ListItem() { Text = "[Select Group]", Value = "-1" });
        }

    }
}