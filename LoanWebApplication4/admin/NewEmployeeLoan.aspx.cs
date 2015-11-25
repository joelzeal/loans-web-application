using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class NewEmployeeLoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("EmployeeLoans", "Open");

            //if (Request.QueryString["GroupId"] != null)
            //{
            //    dataSection.Visible = true;
            //    loanDataSection.Visible = true;
            //    memberHeader.Visible = true;
            //    LoanHeader.Visible = true;
            //}


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



            if (!IsPostBack)
            {
                //hide member and group combos
                //tblMember.Visible = false;
                tblGroup.Visible = false;

                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                    InterestTextBox.Text = cProfile.CompoundInterestRate.ToString();

                }

                if (Request.QueryString["mid"] != null)
                {
                    //if (Request.QueryString["isI"] != null)
                    //{
                        
                    //}

                   
                        dataSection.Visible = true;
                    
                    Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                   // DropDownList1_SelectedIndexChanged(this, new EventArgs());

                    MultiView1.SetActiveView(View1);
                }
                if (Request.QueryString["lid"] != null)
                {
                    LoadExistingLoanData(Convert.ToInt32(Request.QueryString["lid"]));
                }
                else
                {
                    DateWebUserControlStartCalculationDate.DtSelectedDate = DateTime.Today.Date;
                }

                cboInterestDuration.Items.Insert(0, new ListItem() { Value = "[Select Interest Duration]", Text = "[Select Interest Duration]" });
            }
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem() { Text = "[Select Member]", Value = "-1" });
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
                //dvGroupdataSection.Visible = false;
                dataSection.Visible = true;
            }


            Image1.ImageUrl = "ImageDisplay.ashx?mid=" + DropDownList1.SelectedValue;
            MultiView1.SetActiveView(View1);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MemberDetails.aspx?RedirectUrl=NewEmployeeLoan.aspx");
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
                RepaymentFrequency _repaymentFrequency = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));
                double amount;

                if (InterestTypeDropDownList.SelectedValue == "1") //compound
                {
                    amount = principal + (interestRate * principal)/100;
                    //amount = Utils.calculateCompoundInterest(principal, interestRate, period, Utils.GetCompoundType(compoundType));
                }
                else //2 for simple interest
                {
                    amount = principal + (interestRate * principal)/100;
                    //amount = Utils.calculateSimpleInterest(principal, interestRate, period);
                }


                lblTotalAmount.Text = amount.ToString("C");

                //variable to hold period for the calculation of expectedEndDate calculation
                int tempPeriod;
                tempPeriod = int.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value;

                DateTime expectedRepaymentEndDate = DateWebUserControlStartCalculationDate.DtSelectedDate.AddMonths(tempPeriod);
                TimeSpan tSpan = expectedRepaymentEndDate - DateWebUserControlStartCalculationDate.DtSelectedDate;

                if (RepaymentFrequencyDropdownList.SelectedItem.Text.ToLower().Contains("month"))
                {
                    //get number of months between expected end date and calculation start date
                    int numberOfMonths = ((expectedRepaymentEndDate.Year - DateWebUserControlStartCalculationDate.DtSelectedDate.Year) * 12) + expectedRepaymentEndDate.Month - DateWebUserControlStartCalculationDate.DtSelectedDate.Month;


                    //double numberOfDaysBetweenExpectedEndDateAndNow = tSpan.TotalDays;//30 * period; //assuming there are 30 days in a month
                    //int xx = (int)numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                    lblRepaymentAmountByFrequency.Text = (amount / numberOfMonths).ToString("C");
                    lblDuration.Text = DurationTextBox.Text + " (" + cboLoanDurationType.SelectedItem.Text + ")";
                    lblPrincipal.Text = Convert.ToDecimal(PrincipalTextBox.Text).ToString("C");
                    lblInterestRate.Text = InterestTextBox.Text + "%";
                    litFrequencyDescription.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
                    litFrequencyDescription0.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
                }
                else
                {

                    double numberOfDaysBetweenExpectedEndDateAndNow = tSpan.TotalDays;//30 * period; //assuming there are 30 days in a month
                    int xx = (int)numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                    lblRepaymentAmountByFrequency.Text = (amount / xx).ToString("C");
                    lblDuration.Text = DurationTextBox.Text + " (" + cboLoanDurationType.SelectedItem.Text + ")";
                    lblPrincipal.Text = Convert.ToDecimal(PrincipalTextBox.Text).ToString("C");
                    lblInterestRate.Text = InterestTextBox.Text + "%";
                    litFrequencyDescription.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
                    litFrequencyDescription0.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
                }
            }

        }

        public Loan LoadedLoan
        {
            get
            {
                return Session["LoadedLoan"] as Loan;
            }
            set { Session["LoadedLoan"] = value; }
        }


        bool LoadExistingLoanData(int loanId)
        {
                LoadedLoan = Utils.GetDataContext().Loans.FirstOrDefault(l => l.LoanID == Convert.ToInt32(Request.QueryString["lid"]));
                if (LoadedLoan != null)
                { 
                    //bind controls
                    PrincipalTextBox.Text = LoadedLoan.Principal.Value.ToString();
                    InterestTypeDropDownList.SelectedValue = LoadedLoan.InterestTypeId.Value.ToString();
                    //cboInterestDuration.SelectedValue = LoadedLoan.
                    InterestTextBox.Text = LoadedLoan.Interest.Value.ToString();
                    cboLoanDurationType.SelectedValue = LoadedLoan.DurationType.Value.ToString();
                    DurationTextBox.Text = LoadedLoan.Duration.Value.ToString();
                    RepaymentFrequencyDropdownList.SelectedValue = LoadedLoan.RepaymentFrequencyId.Value.ToString();
                    cboGuarantor.SelectedValue = LoadedLoan.GuarantorID.Value.ToString();
                    cboCollateral.SelectedValue = LoadedLoan.CollateralID.Value.ToString();
                    txtCollateralDesc.Text = LoadedLoan.CollateralDescription;
                    //txtLoanDate.Text = LoadedLoan.Lo
                    DateWebUserControlStartCalculationDate.DtSelectedDate = LoadedLoan.LoanCalculationStartDate.Value.Date;

                    return true;
                }
                else
                {
                    return false;
                }

                //Utils.logAction("Edit", 
            }
        


        //DateTime RemoveWeekends(DateTime expectedEndDateWithWeekends, DateTime calculationStartDate)
        //{
        //    TimeSpan ts = calculationStartDate - expectedEndDateWithWeekends;
        //    DateTime tempCalculationStartDate = calculationStartDate;
        //    for (int i = 1; i < ts.TotalDays; i++)
        //    {
        //        tempCalculationStartDate= tempCalculationStartDate.AddDays(i);
        //        if (!(tempCalculationStartDate.DayOfWeek == DayOfWeek.Saturday || tempCalculationStartDate.DayOfWeek == DayOfWeek.Sunday))
        //        { 

        //        }
        //    }
        //}


        protected void RepaymentFrequencyDropdownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get description for repayment frequency
            litFrequencyDescription.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;
            litFrequencyDescription0.Text = RepaymentFrequencyDropdownList.SelectedItem.Text;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Utils.IsAuthorized("EmployeeLoans", "Create");

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
                RepaymentFrequency _repaymentFrequency = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));
                double amount = 0;

                if (InterestTypeDropDownList.SelectedValue == "1") //compound
                {
                    amount = principal + (interestRate * principal)/100;
                    //amount = Utils.calculateCompoundInterest(principal, interestRate, period, Utils.GetCompoundType(compoundType));
                }
                else //2 for simple interest
                {
                    amount = principal + (interestRate * principal)/100;
                        //Utils.calculateSimpleInterest(principal, interestRate, period);
                }

                Loan newLoan = new Loan();
                //newLoan.ActualRepaymentEndDate = DateTime.Today.AddMonths(period);
                newLoan.Amount = (decimal)amount;


                newLoan.MemberId = Convert.ToInt32(DropDownList1.SelectedValue);


                newLoan.Principal = (decimal)principal;
                newLoan.RepaymentFrequencyId = _repaymentFrequency.RepaymentFrequencyId;
                newLoan.IsPaidup = false;
                newLoan.Interest = (decimal)interestRate;
                newLoan.Duration = decimal.Parse(DurationTextBox.Text);
                newLoan.InterestTypeId = Convert.ToInt32(InterestTypeDropDownList.SelectedValue);
                newLoan.payWithContribution = false;
                newLoan.LoanCalculationStartDate = DateWebUserControlStartCalculationDate.DtSelectedDate;
                newLoan.LoanTypeID =  Convert.ToInt32( cboLoanDurationType.SelectedValue);
                newLoan.IsDeleted = false;

                //variable to hold period for the calculation of expectedEndDate calculation
                int tempPeriod;
                tempPeriod = int.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value;

                //start calculation from the LoanCalculationStartDate specified
                newLoan.ExpectedRepaymentEndDate = newLoan.LoanCalculationStartDate.Value.AddMonths(tempPeriod);

                //if the expected repayment end date falls on a weekend, move it to a working
                if (newLoan.ExpectedRepaymentEndDate.Value.DayOfWeek == DayOfWeek.Saturday)
                {
                    newLoan.ExpectedRepaymentEndDate = newLoan.ExpectedRepaymentEndDate.Value.AddDays(2);
                }
                else if (newLoan.ExpectedRepaymentEndDate.Value.DayOfWeek == DayOfWeek.Sunday)
                {
                    newLoan.ExpectedRepaymentEndDate = newLoan.ExpectedRepaymentEndDate.Value.AddDays(1);
                }

                newLoan.DurationType = Convert.ToInt32(cboLoanDurationType.SelectedValue);
                newLoan.RawDurationEntered = DurationTextBox.Text;
                //if (newLoan.ExpectedRepaymentEndDate.Value.DayOfWeek == DayOfWeek.Saturday)
                //{
                //    newLoan.ExpectedRepaymentEndDate = newLoan.ExpectedRepaymentEndDate.Value.Date.AddDays(2);
                //}
                //else if (newLoan.ExpectedRepaymentEndDate.Value.DayOfWeek == DayOfWeek.Saturday)
                //{
                //    newLoan.ExpectedRepaymentEndDate = newLoan.ExpectedRepaymentEndDate.Value.Date.AddDays(1);
                //}



                //ensure that nothing gets assigned to the collateral ID field if nothing is selected
                if (cboCollateral.SelectedIndex > 0)
                    newLoan.CollateralID = Convert.ToInt16(cboCollateral.SelectedValue);
                newLoan.CollateralDescription = txtCollateralDesc.Text;

                //do not insert guarantor if its not selected
                if (cboGuarantor.SelectedIndex > 0)
                {
                    newLoan.GuarantorID = Convert.ToInt16(cboGuarantor.SelectedValue);
                }

                newLoan.LoanCalculationStartDate = DateWebUserControlStartCalculationDate.DtSelectedDate;
                newLoan.CreatedDate = DateWebUserControlLoanDate.DtSelectedDate;

                if (RepaymentFrequencyDropdownList.SelectedItem.Text.ToLower().Contains("month"))
                {
                    //get number of months between expected end date and calculation start date
                    int numberOfMonths = ((newLoan.ExpectedRepaymentEndDate.Value.Year - DateWebUserControlStartCalculationDate.DtSelectedDate.Year) * 12) + newLoan.ExpectedRepaymentEndDate.Value.Month - DateWebUserControlStartCalculationDate.DtSelectedDate.Month;

                    newLoan.RepaymentFreqAmount = ((decimal)amount / numberOfMonths);
                }
                else
                {
                    TimeSpan tSpan = newLoan.ExpectedRepaymentEndDate.Value - newLoan.LoanCalculationStartDate.Value;
                    double numberOfDaysBetweenExpectedEndDateAndNow = tSpan.TotalDays;

                    // numberOfDaysBetweenExpectedEndDateAndNow = 30 * period; //assuming there are 30 days in a month
                    //decimal xx = numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                    int xx = (int)numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                    newLoan.RepaymentFreqAmount = ((decimal)amount / xx);
                }

                //current user
                newLoan.CreatedBy = this.User.Identity.Name;

                db.Loans.InsertOnSubmit(newLoan);
                db.SubmitChanges();

                //audit
                Utils.logAction("Insert", newLoan);

                Utils.GenerateRepaymentSchedule_new(tempPeriod, _repaymentFrequency, newLoan);

                //Response.Redirect("MemberDetails.aspx?mid=" + DropDownList1.SelectedValue);

                Response.Redirect("LoanStatement.aspx?lid=" + newLoan.LoanID);

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

        protected void cboCollateral_DataBound(object sender, EventArgs e)
        {
            cboCollateral.Items.Insert(0, new ListItem() { Text = "----Select----" });
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
            //_guarantor.Fax = MemberFaxTextBox0.Text;
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

            GuarantorsSqlDataSource.DataBind();
            cboGuarantor.SelectedValue = _guarantor.GuarantorId.ToString();
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

           // tblMember.Visible = true;
            tblGroup.Visible = false;

            //hide group and show member
            if (DropDownList1.SelectedIndex > 0)
            {
               // dvGroupdataSection.Visible = false;
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

    }

}
