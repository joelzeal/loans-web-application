using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace LoanWebApplication4.admin
{
    public partial class NewLoan_MemberPreSelected : System.Web.UI.Page
    {
        public Loan LoadedLoan
        {
            get
            {
                return Session["LoadedLoan"] as Loan;
            }
            set { Session["LoadedLoan"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["load"] != null)
                {
                    if (Request.QueryString["load"] == "1")
                    {
                        LoadCachedData();
                    }
                }
            }

            if (Request.QueryString["lid"] != null)
            {
                if (!IsPostBack)
                {
                    LoadExistingLoanData(Convert.ToInt32(Request.QueryString["lid"]));
                }
            }
            else
            {
                txtStartCalculationFromNew.DtSelectedDate = DateTime.Today.Date;
                txtLoanDateNew.DtSelectedDate = DateTime.Today.Date;
            }

            if (Request.QueryString["mid"] != null)
            {
                dataSection.Visible = true;
                loanDataSection.Visible = true;
                memberHeader.Visible = true;
                LoanHeader.Visible = true;

                Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                MultiView1.SetActiveView(View1);

            }
            else if (Request.QueryString["gid"] != null)
            {
                dvGroupdataSection.Visible = true;
                loanDataSection.Visible = true;
                memberHeader.Visible = true;
                LoanHeader.Visible = true;
            }


            if (!IsPostBack)
            {

                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                    InterestTextBox.Text = cProfile.CompoundInterestRate.ToString();

                }


               
                cboInterestDuration.Items.Insert(0, new ListItem() { Value = "[Select Interest Duration]", Text = "[Select Interest Duration]" });
            }
        }

        bool LoadExistingLoanData(int loanId)
        {
            LoadedLoan = Utils.GetDataContext().Loans.FirstOrDefault(l => l.LoanID == Convert.ToInt32(Request.QueryString["lid"]));
            if (LoadedLoan != null)
            {
                //bind controls
                PrincipalTextBox.Text = LoadedLoan.Principal.Value.ToString();
                InterestTypeDropDownList.SelectedValue = LoadedLoan.InterestTypeId.Value.ToString();
                try
                {
                    //if (LoadedLoan.LoanDurationTypeID.HasValue)
                        //cboInterestDuration.SelectedValue = LoadedLoan.LoanDurationTypeID.Value.ToString();
                }
                catch (Exception)
                {
                    
                }
                txtLoanDateNew.DtSelectedDate = LoadedLoan.CreatedDate.Value;

                InterestTextBox.Text = LoadedLoan.Interest.Value.ToString();
                try
                {
                    cboLoanDurationType.SelectedValue = LoadedLoan.LoanDurationTypeID.Value.ToString();
                }
                catch (Exception)
                {
                    
                }
                DurationTextBox.Text = LoadedLoan.Duration.Value.ToString();
                RepaymentFrequencyDropdownList.SelectedValue = LoadedLoan.RepaymentFrequencyId.Value.ToString();
                //cboInterestDuration.SelectedValue = LoadedLoan.DurationType.ToString();

                try
                {
                    cboGuarantor.SelectedValue = LoadedLoan.GuarantorID.Value.ToString();
                }
                catch (Exception)
                {

                }
                if (LoadedLoan.CollateralID.HasValue)
                {
                    cboCollateral.SelectedValue = LoadedLoan.CollateralID.Value.ToString();
                }

                txtCollateralDesc.Text = LoadedLoan.CollateralDescription;
                //txtLoanDate.Text = LoadedLoan.Lo
                txtStartCalculationFromNew.DtSelectedDate = LoadedLoan.LoanCalculationStartDate.Value.Date;

                //assign loan type only if it exits
                if (LoadedLoan.LoanTypeID.HasValue)
                    cboLoanType.SelectedValue = LoadedLoan.LoanTypeID.Value.ToString();
                return true;
            }
            else
            {
                return false;
            }
        }

        bool LoadCachedData()
        {
            Loan _tempLoan = (Loan)Session["tempLoanDetails"];

            //bind controls
            PrincipalTextBox.Text = _tempLoan.Principal.Value.ToString();
            InterestTypeDropDownList.SelectedValue = _tempLoan.InterestTypeId.Value.ToString();
            if (_tempLoan.LoanDurationTypeID.HasValue)
                cboInterestDuration.SelectedValue = _tempLoan.LoanDurationTypeID.Value.ToString();

            InterestTextBox.Text = _tempLoan.Interest.Value.ToString();
            cboLoanDurationType.SelectedValue = _tempLoan.LoanDurationTypeID.Value.ToString();
            DurationTextBox.Text = _tempLoan.Duration.Value.ToString();
            RepaymentFrequencyDropdownList.SelectedValue = _tempLoan.RepaymentFrequencyId.Value.ToString();
           // cboInterestDuration.SelectedValue = _tempLoan.DurationType.ToString();
            txtLoanDateNew.DtSelectedDate = _tempLoan.CreatedDate.Value;
            txtStartCalculationFromNew.DtSelectedDate = _tempLoan.LoanCalculationStartDate.Value;

            //show or hide documents
            //if (_tempLoan.LoanCollateralDocuments.Count > 0)
            //{
            //    Panel1.Visible = true;
            //}
            //else
            //{
            //    Panel1.Visible = false;
            //}
            try
            {
                cboGuarantor.SelectedValue = _tempLoan.GuarantorID.Value.ToString();
            }
            catch (Exception)
            {

            }
            if (_tempLoan.CollateralID.HasValue)
            {
                cboCollateral.SelectedValue = _tempLoan.CollateralID.Value.ToString();
            }

            txtCollateralDesc.Text = _tempLoan.CollateralDescription;
            //txtLoanDate.Text = _tempLoan.Lo
            txtStartCalculationFromNew.DtSelectedDate = _tempLoan.LoanCalculationStartDate.Value.Date;

            //assign loan type only if it exits
            if (_tempLoan.LoanTypeID.HasValue)
                cboLoanType.SelectedValue = _tempLoan.LoanTypeID.Value.ToString();
            return true;

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
                decimal period;
                if (DurationTextBox.Text.ToLower().Contains("annual") || DurationTextBox.Text.ToLower().Contains("year"))
                {
                    period = decimal.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value / 12;
                }
                else
                {
                    period = decimal.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value;
                }


                //LoanPreset _loanPreset = db.LoanPresets.First(l => l.LoanPresetId == Convert.ToInt32(cboInterestDuration.SelectedValue));
                double interestRate = double.Parse(InterestTextBox.Text);//Utils.CalculateInterestRateByDuration(decimal.Parse(InterestTextBox.Text), period);

                // int period = int.Parse(DurationTextBox.Text);
                int compoundType = cProfile.CompoundFrequency.Value;
                RepaymentFrequency _repaymentFrequency = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));
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

                DateTime expectedRepaymentEndDate = txtStartCalculationFromNew.DtSelectedDate.AddMonths(tempPeriod);
                TimeSpan tSpan = expectedRepaymentEndDate - txtStartCalculationFromNew.DtSelectedDate;
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

                double principal = double.Parse(PrincipalTextBox.Text);

                // double interestRate = Convert.ToDouble(InterestTextBox.Text); //Convert.ToDouble(cProfile.CompoundInterestRate.Value);
                LoanDuration _loanDuration = db.LoanDurations.FirstOrDefault(l => l.LoanDurationId == Convert.ToInt32(cboLoanDurationType.SelectedValue));
                if (_loanDuration == null)
                    return;

                decimal period;
                if (DurationTextBox.Text.ToLower().Contains("annual") || DurationTextBox.Text.ToLower().Contains("year"))
                {
                    period = decimal.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value / 12;
                }
                else
                {
                    period = decimal.Parse(DurationTextBox.Text) * _loanDuration.NumberOfMonths.Value;
                }

                //LoanPreset _loanPreset = db.LoanPresets.First(l => l.LoanPresetId == Convert.ToInt32(cboInterestDuration.SelectedValue));
                double interestRate = double.Parse(InterestTextBox.Text);//Utils.CalculateInterestRateByDuration(decimal.Parse(InterestTextBox.Text), period);

                // int period = int.Parse(DurationTextBox.Text);
                int compoundType = cProfile.CompoundFrequency.Value;
                RepaymentFrequency _repaymentFrequency = db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == int.Parse(RepaymentFrequencyDropdownList.SelectedValue));
                double amount;

                if (InterestTypeDropDownList.SelectedValue == "1") //compound
                {
                    amount = Utils.calculateCompoundInterest(principal, interestRate, period, Utils.GetCompoundType(compoundType));
                }
                else //2 for simple interest
                {
                    amount = Utils.calculateSimpleInterest(principal, interestRate, period);
                }

                Loan newLoan = null;
                if (Request.QueryString["lid"] != null)
                {
                    newLoan = db.Loans.FirstOrDefault(l => l.LoanID == Convert.ToInt32(Request.QueryString["lid"]));
                }
                else
                {
                    newLoan = new Loan();
                }


                //newLoan.ActualRepaymentEndDate = DateTime.Today.AddMonths(period);
                newLoan.Amount = (decimal)amount;

                if (Request.QueryString["mid"] != null) // individuals
                {
                    newLoan.MemberId = Convert.ToInt32(Request.QueryString["mid"]);
                }
                else if (Request.QueryString["gid"] != null)// groups selected
                {
                    newLoan.GroupID = Convert.ToInt32(Request.QueryString["gid"]);
                }

                newLoan.Principal = (decimal)principal;
                newLoan.RepaymentFrequencyId = _repaymentFrequency.RepaymentFrequencyId;
                newLoan.IsPaidup = false;
                newLoan.Interest = (decimal)interestRate;
                newLoan.Duration = decimal.Parse(DurationTextBox.Text);
                newLoan.InterestTypeId = Convert.ToInt32(InterestTypeDropDownList.SelectedValue);
                newLoan.payWithContribution = false;
                newLoan.LoanCalculationStartDate = txtStartCalculationFromNew.DtSelectedDate;
                newLoan.LoanTypeID = Convert.ToInt32(cboLoanType.SelectedValue);
                newLoan.IsDeleted = false;
                newLoan.LoanDurationTypeID = Convert.ToInt32(cboLoanDurationType.SelectedValue);
                newLoan.DurationType = Convert.ToInt32(cboInterestDuration.SelectedValue);
                newLoan.CreatedDate = txtLoanDateNew.DtSelectedDate;
                //if (FileUpload1.HasFile)
                //{
                //    newLoan.LoanCollateralDocuments.Add(new LoanCollateralDocument() { DocumentContent = FileUpload1.FileBytes, FileExtension= Path.GetExtension(  FileUpload1.FileName), DocumentName = FileUpload1.FileName });
                //}
                //if (FileUpload2.HasFile)
                //{
                //    newLoan.LoanCollateralDocuments.Add(new LoanCollateralDocument() { DocumentContent = FileUpload2.FileBytes, FileExtension = Path.GetExtension(FileUpload2.FileName), DocumentName = FileUpload2.FileName });
                //}
                //if (FileUpload3.HasFile)
                //{
                //    newLoan.LoanCollateralDocuments.Add(new LoanCollateralDocument() { DocumentContent = FileUpload3.FileBytes, FileExtension = Path.GetExtension(FileUpload3.FileName), DocumentName = FileUpload3.FileName });
                //}
                //if (FileUpload4.HasFile)
                //{
                //    newLoan.LoanCollateralDocuments.Add(new LoanCollateralDocument() { DocumentContent = FileUpload4.FileBytes, FileExtension = Path.GetExtension(FileUpload4.FileName), DocumentName = FileUpload4.FileName });
                //}


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



                //ensure that nothing gets assigned to the collateral ID field if nothing is selected
                if (cboCollateral.SelectedIndex > 0)
                    newLoan.CollateralID = Convert.ToInt16(cboCollateral.SelectedValue);
                newLoan.CollateralDescription = txtCollateralDesc.Text;

                //do not insert guarantor if its not selected
                if (cboGuarantor.SelectedIndex > 0)
                {
                    newLoan.GuarantorID = Convert.ToInt16(cboGuarantor.SelectedValue);
                }

               newLoan.LoanCalculationStartDate = txtStartCalculationFromNew.DtSelectedDate;


                TimeSpan tSpan = newLoan.ExpectedRepaymentEndDate.Value - newLoan.LoanCalculationStartDate.Value;
                double numberOfDaysBetweenExpectedEndDateAndNow = tSpan.TotalDays;

                // numberOfDaysBetweenExpectedEndDateAndNow = 30 * period; //assuming there are 30 days in a month
                //decimal xx = numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                int xx = (int)numberOfDaysBetweenExpectedEndDateAndNow / _repaymentFrequency.NumberOfDays.Value;
                newLoan.RepaymentFreqAmount = ((decimal)amount / xx);

                //current user
                newLoan.CreatedBy = this.User.Identity.Name;
                newLoan.CreatedDate = txtLoanDateNew.DtSelectedDate;

                if (Request.QueryString["lid"] == null)
                {
                    Utils.IsAuthorized("Loans", "Create");
                    db.Loans.InsertOnSubmit(newLoan);
                    //audit
                    
                    newLoan.CreatedBy = HttpContext.Current.User.Identity.Name;
                    Utils.logAction("Insert", newLoan);
                }
                else
                {
                    Utils.IsAuthorized("Loans", "Edit");
                    newLoan.ModifiedBy = HttpContext.Current.User.Identity.Name;
                    newLoan.ModifiedDate = DateTime.Now;
                    Utils.logAction("Edit", newLoan);
                }

                db.SubmitChanges();



                Utils.GenerateRepaymentSchedule_new(tempPeriod, _repaymentFrequency, newLoan);

                //Response.Redirect("MemberDetails.aspx?mid=" + DropDownList1.SelectedValue);
                if (Request.QueryString["mid"] != null)
                {
                    Response.Redirect("LoanStatement.aspx?lid=" + newLoan.LoanID + "&mid=" + Request.QueryString["mid"]);
                }
                else
                {
                    Response.Redirect("LoanStatement_group.aspx?lid=" + newLoan.LoanID + "&gid=" + Request.QueryString["gid"]);
                }
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
            _guarantor.Fax = MemberFaxTextBox0.Text;
            _guarantor.IdentityNumber = MemberIDNumberTextBox.Text;
            _guarantor.Mobile = MemberMobileTextBox.Text;
            _guarantor.ResidentialAddress = MemberResidentialTextBox.Text;
            _guarantor.Telephone = MemberTelTextBox.Text;
            //_guarantor.IdentityTypeID = Convert.ToInt32(DropDownList1.SelectedValue);
            //_guarantor.ContactPerson = MemberContactPersonTextBox.Text;

            Utils.GetDataContext().Guarantors.InsertOnSubmit(_guarantor);
            Utils.GetDataContext().SubmitChanges();

            //audit
            Utils.logAction("Insert", _guarantor);

            GuarantorsSqlDataSource.DataBind();
            cboGuarantor.SelectedValue = _guarantor.GuarantorId.ToString();
        }



        protected void btnGroup_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MemberGroupDetails.aspx?RedirectUrl=NewLoan.aspx");
        }

        protected void cboLoanType_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cboLoanType.Items.Insert(0, new ListItem() { Value = "----Select----", Text = "----Select----" });
            }
        }

        protected void Unnamed1_Click(object sender, ImageClickEventArgs e)
        {
            if (LoadedLoan != null)
            {
                Session["tempLoanDetails"] = LoadedLoan;
            }
            else
            {
                Loan _cachedLoan = new Loan();
              
                _cachedLoan.  Principal = Convert.ToDecimal(PrincipalTextBox.Text);
                _cachedLoan.  RepaymentFrequencyId = Convert.ToInt32(RepaymentFrequencyDropdownList.SelectedValue);
              _cachedLoan.   IsPaidup = false;
               _cachedLoan.   Interest = Convert.ToDecimal(InterestTextBox.Text);
               _cachedLoan.  Duration = decimal.Parse(DurationTextBox.Text);
              _cachedLoan.   InterestTypeId = Convert.ToInt32(InterestTypeDropDownList.SelectedValue);
               _cachedLoan.   payWithContribution = false;
               _cachedLoan.  LoanCalculationStartDate = txtStartCalculationFromNew.DtSelectedDate;
               _cachedLoan.   LoanTypeID = Convert.ToInt32(cboLoanType.SelectedValue);
               _cachedLoan.   IsDeleted = false;
               _cachedLoan.LoanDurationTypeID = Convert.ToInt32(cboLoanDurationType.SelectedValue);
               _cachedLoan.DurationType = Convert.ToInt32(cboInterestDuration.SelectedValue);
               _cachedLoan.CreatedDate = txtLoanDateNew.DtSelectedDate;
               Session["tempLoanDetails"] = _cachedLoan;
            }

            string url = "";
            if (Request.QueryString["mid"] != null)
            {
                url = "&mid=" + Request.QueryString["mid"];
            }
            if (Request.QueryString["lid"] != null)
            {
                url += "&lid=" + Request.QueryString["lid"];
            }
            Response.Redirect("GuarantorDetails.aspx?redirectUrl=NewLoan_MemberPreSelected.aspx?load=1" + url);
        }

        protected void cboGuarantor_DataBound(object sender, EventArgs e)
        {
            if (Request.QueryString["gtId"] != null)
            {
                cboGuarantor.SelectedValue = Request.QueryString["gtId"].ToString();
            }
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            int commandArg = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            LoanCollateralDocument doc = Utils.GetDataContext().LoanCollateralDocuments.FirstOrDefault(d => d.LoanCollateralDocumentId == commandArg);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/octet-stream"; //you need to know the MIME type of the image
            Response.AddHeader("Content-Disposition", "attachment; filename=" + doc.DocumentName);
            Response.BinaryWrite(doc.DocumentContent.ToArray()); //bytes array retrieved from database
            Response.End();

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            int commandArg = Convert.ToInt32(((ImageButton)sender).CommandArgument);
            LoanCollateralDocument doc = Utils.GetDataContext().LoanCollateralDocuments.FirstOrDefault(d => d.LoanCollateralDocumentId == commandArg);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/octet-stream"; //you need to know the MIME type of the image
            Response.AddHeader("Content-Disposition", "attachment; filename=" + doc.DocumentName);
            Response.BinaryWrite(doc.DocumentContent.ToArray()); //bytes array retrieved from database
            Response.End();
        }
    }
}