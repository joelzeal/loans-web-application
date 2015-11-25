using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class NewInvestment : System.Web.UI.Page
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

                //set invevstment date to current date
                txtInvestmentDate.Text = DateTime.Today.ToString("dd/MM/yyyy");

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
                txtStartCalculationFrom_CalendarExtender.SelectedDate = DateTime.Today.Date;
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
                RepaymentFrequency _repaymentFrequency = null;

                //check if repayment frequency has been selected
                int _repaymentFrequencyID;
                int.TryParse(RepaymentFrequencyDropdownList.SelectedValue, out _repaymentFrequencyID);

                if (_repaymentFrequencyID > 0)
                 _repaymentFrequency = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));

               

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

                DateTime expectedRepaymentEndDate = DateTime.Parse(txtStartCalculationFrom.Text).AddMonths(tempPeriod);
                TimeSpan tSpan = expectedRepaymentEndDate - DateTime.Parse(txtStartCalculationFrom.Text);
                double numberOfDaysBetweenExpectedEndDateAndNow = tSpan.TotalDays;//30 * period; //assuming there are 30 days in a month
                if (_repaymentFrequencyID > 0)
                {
                    int xx = (int)numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                    lblRepaymentAmountByFrequency.Text = (double.Parse(PrincipalTextBox.Text) / xx).ToString("C");
                    litFrequencyDescription.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
                    litFrequencyDescription0.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
                }
                else
                {
                    lblRepaymentAmountByFrequency.Text = "N/A";
                    litFrequencyDescription.Text = "N/A";
                    litFrequencyDescription0.Text = String.Empty;
                }

                lblDuration.Text = DurationTextBox.Text + " (" + cboLoanDurationType.SelectedItem.Text + ")";
                lblPrincipal.Text = Convert.ToDecimal(PrincipalTextBox.Text).ToString("C");
                lblInterestRate.Text = InterestTextBox.Text + "%";
            }
            
        }

        protected void RepaymentFrequencyDropdownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get description for repayment frequency
            litFrequencyDescription.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
            litFrequencyDescription0.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;

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
                RepaymentFrequency _repaymentFrequency = null;            // = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));
                //check if repayment frequency has been selected
                int _repaymentFrequencyID;
                int.TryParse(RepaymentFrequencyDropdownList.SelectedValue, out _repaymentFrequencyID);

                if (_repaymentFrequencyID > 0)
                    _repaymentFrequency = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));




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


                //set invementType to 1 for regular investment
                newInvestment.InvestmentTypeId = 1;

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
                if (_repaymentFrequencyID > 0)
                {
                    newInvestment.ContributionFrequencyId = _repaymentFrequency.RepaymentFrequencyId;
                }
                newInvestment.IsMatured = false;
                newInvestment.InsterstRate = (decimal)interestRate;
                newInvestment.Duration = decimal.Parse(DurationTextBox.Text);
                newInvestment.InterestTypeId = Convert.ToInt32(InterestTypeDropDownList.SelectedValue);
                //newLoan.payWithContribution = false;
                newInvestment.InvestmentCalculationStartDate = DateTime.Parse(txtStartCalculationFrom.Text);
                newInvestment.InvestmentDescriptionId = Convert.ToInt32(cboInvestmentDescription.SelectedValue);
                //newInvestment.InvestmentTypeId = Convert.ToInt32(cboInvestmentType.SelectedValue);


                //variable to hold period for the calculation of MaturityDate calculation
                int tempPeriod;
                tempPeriod = int.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value;


                //start calculation from the LoanCalculationStartDate specified
                newInvestment.MaturityDate = newInvestment.InvestmentCalculationStartDate.Value.AddMonths(tempPeriod);

                //if the expected repayment end date falls on a weekend, move it to a working
                if (newInvestment.MaturityDate.Value.DayOfWeek == DayOfWeek.Saturday)
                {
                    newInvestment.MaturityDate = newInvestment.MaturityDate.Value.AddDays(2);
                }
                else if (newInvestment.MaturityDate.Value.DayOfWeek == DayOfWeek.Sunday)
                {
                    newInvestment.MaturityDate = newInvestment.MaturityDate.Value.AddDays(1);
                }

                newInvestment.DurationTypeId = Convert.ToInt32(cboLoanDurationType.SelectedValue);
                //newLoan.RawDurationEntered = DurationTextBox.Text;

                newInvestment.InvestmentCalculationStartDate = DateTime.Parse(txtStartCalculationFrom.Text);


                TimeSpan tSpan = newInvestment.MaturityDate.Value - newInvestment.InvestmentCalculationStartDate.Value;// -DateTime.Today;
                double numberOfDaysBetweenExpectedEndDateAndNow = tSpan.TotalDays;

                if (_repaymentFrequencyID > 0)
                {
                    int xx = (int)numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;

                    //int numberOfDaysBetweenExpectedEndDateAndNow = 30 * period; //assuming there are 30 days in a month
                    //decimal xx = numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                    newInvestment.ContributionFreqAmount = ((decimal)newInvestment.InvestmentAmount / xx); 
                }
                else
                {
                    newInvestment.ContributionFreqAmount = 0;
                }

                //maturity amount
                MaturedInvestmentAmount = amount;
                newInvestment.CreatedBy = this.User.Identity.Name;
                newInvestment.MaturedAmount = (decimal)amount;
                newInvestment.InvestmentTypeId = 1; //investmentTypeId 1 means regular investment
                newInvestment.IsActive = true;
                newInvestment.CreatedDate = Convert.ToDateTime(txtInvestmentDate.Text);

                db.Investments.InsertOnSubmit(newInvestment);
                db.SubmitChanges();

                //db.submitti

                //audit
                Utils.logAction("Insert", newInvestment);

                if (_repaymentFrequencyID > 0)
                {
                    Utils.GenerateContributionSchedule(tempPeriod, _repaymentFrequency, newInvestment);
                }
                Response.Redirect("InvestmentStatement_real.aspx?invID=" + newInvestment.InvestmentID + "&mid=" + Request.QueryString["mid"]);
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

        protected void RepaymentFrequencyDropdownList_DataBound(object sender, EventArgs e)
        {
            RepaymentFrequencyDropdownList.Items.Insert(0, new ListItem() { Text = "----Select----" });
           // RepaymentFrequencyDropdownList.Items.Insert(1, new ListItem() { Text = "None" , Value = "0"});
        }

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

        //protected void cboInvestmentType_DataBound(object sender, EventArgs e)
        //{
        //    cboInvestmentType.Items.Insert(0, new ListItem() { Text = "----Select----" });
        //}

        protected void cboInvestmentDescription_DataBound(object sender, EventArgs e)
        {
            cboInvestmentDescription.Items.Insert(0, new ListItem() { Text = "----Select----", Value = "0" });
        }




    }
}