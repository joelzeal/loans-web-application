using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LoanWebApplication4;
using System.Text;
using PortSight.SecureAccess.ARObjects;


public static class Utils
{
    public static string CurrentUrl;
    public static string CurrentRepaymentAmount;
    public static string CurrentScheduleID;
    public static string CurrentscheduleDate;
    public static string CurrentPaidBy;
    public static DateTime webServiceLastRunDate;


    static FinanceManagerDataContext context = new FinanceManagerDataContext();
    public static FinanceManagerDataContext GetDataContext()
    {
        context = new FinanceManagerDataContext();
        return context;

    }


    static public void IsAuthorized(string applicationPartName, string action)
    {
        if (!ARHelper.IsAuthorized(HttpContext.Current.User.Identity.Name, "iCredit." + applicationPartName, action))
        {
            //e.Cancel = true;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Sorry, You are not authorized to delete data!');", true);
            HttpContext.Current.Response.Redirect("AccessDenied.aspx");
        }
    }


    static public void LogTransaction(string applicationPartName, string action)
    {
        //if (!ARHelper.IsAuthorized(HttpContext.Current.User.Identity.Name, "iCredit." + applicationPartName, action))
        //{
            //e.Cancel = true;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Sorry, You are not authorized to delete data!');", true);
            //HttpContext.Current.Response.Redirect("AccessDenied.aspx");
        //}
        ARHelper.Log(HttpContext.Current.User.Identity.Name, action, applicationPartName + "-Deletion");
    }


    static public bool IsAuthorizedReturn(string applicationPartName, string action)
    {
        if (!ARHelper.IsAuthorized(HttpContext.Current.User.Identity.Name, "iCredit." + applicationPartName, action))
        {
            //e.Cancel = true;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Sorry, You are not authorized to delete data!');", true);
            HttpContext.Current.Response.Redirect("AccessDenied.aspx");
            return false;
        }
        else
        {
            return true;
        }
    }

    public enum EnumInvestmentTypes
    {
        Regular = 1,
        SUSU = 2,
        FixedDeposit = 3
    }

    /// <summary>
    /// Creates a member account and automatically creates an investment for the member and returns the member id
    /// </summary>
    /// <param name="member"></param>
    /// <param name="enumIvestmentType"></param>
    /// <returns></returns>
    public static int createAccount(Member member, EnumInvestmentTypes enumIvestmentType, bool AutoGenerateAccountNumber)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            member.Investments.Add(new Investment() { InvestmentTypeId = (int)enumIvestmentType, IsActive = true, CreatedDate = DateTime.Now, CreatedBy = HttpContext.Current.User.Identity.Name, InvestmentAmount = 0 });
            member.CreatedDate = DateTime.Now;
            db.Members.InsertOnSubmit(member);
            db.SubmitChanges();

            if (AutoGenerateAccountNumber)
            {
                member.AccountNumber = Utils.GenerateAccountNumber(member.MemberId);
                db.SubmitChanges();
            }
        }
        return member.MemberId;
    }


    /// <summary>
    /// Creates a member account and automatically creates an investment for the member and returns the member id
    /// </summary>
    /// <param name="member"></param>
    /// <param name="enumIvestmentType"></param>
    /// <returns></returns>
    public static int createAccount(Member member, AccountType accountType, bool AutoGenerateAccountNumber)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            member.Investments.Add(new Investment()
            {
                IsDeleted = false,
                InvestmentTypeId = accountType.DefaultInvestmentTypeID,
                IsActive = true,
                CreatedDate = DateTime.Now,
                CreatedBy = HttpContext.Current.User.Identity.Name,
                InvestmentAmount = 0,
                AccountTypeId = accountType.AccountTypeId
            });
            member.CreatedDate = DateTime.Now;
            db.Members.InsertOnSubmit(member);
            db.SubmitChanges();


            if (AutoGenerateAccountNumber)
            {
                //member.AccountNumber = Utils.GenerateAccountNumber(member.MemberId);
                member.AccountNumber = Utils.GenerateAccountNumber(member.AccountTypeID.Value, member.BranchID.Value);
                db.SubmitChanges();
            }
        }
        return member.MemberId;
    }


    public static int? GetMobileBanker(int memberId)
    {

        try
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                return db.MobileBankerCustomers.FirstOrDefault(m => m.MemberId == memberId).MobileBanker.MobileBankerid;
            }
        }
        catch (Exception)
        {
            return null;
        }

    }

    /// <summary>
    /// Creates a member account and automatically creates an investment for the member and returns the member id
    /// </summary>
    /// <param name="group"></param>
    /// <param name="enumIvestmentType"></param>
    /// <returns></returns>
    //public static int createAccountForGroup(LoanGroup group, EnumInvestmentTypes enumIvestmentType, bool AutoGenerateAccountNumber)
    //{
    //    using (FinanceManagerDataContext db = new FinanceManagerDataContext())
    //    {
    //        group.Investments.Add(new Investment() { InvestmentTypeId = (int)enumIvestmentType, IsActive = true, CreatedDate = DateTime.Now });
    //        db.LoanGroups.InsertOnSubmit(group);
    //        db.SubmitChanges();

    //        if (AutoGenerateAccountNumber)
    //        {
    //            group.AccountNumber = Utils.GenerateAccountNumber(group.GroupId);
    //            db.SubmitChanges();
    //        }
    //    }
    //    return group.GroupId;
    //}


    /// <summary>
    /// Creates a member account and automatically creates an investment for the member and returns the member id
    /// </summary>
    /// <param name="group"></param>
    /// <param name="enumIvestmentType"></param>
    /// <returns></returns>
    public static int createAccountForGroup(LoanGroup group, AccountType  accountType, bool AutoGenerateAccountNumber)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            group.Investments.Add(new Investment() { InvestmentTypeId = accountType.DefaultInvestmentTypeID,
                IsActive = true, CreatedDate = DateTime.Now, IsDeleted = false , AccountTypeId = accountType.AccountTypeId});
            group.CreatedDate = DateTime.Now;
            db.LoanGroups.InsertOnSubmit(group);
            db.SubmitChanges();

            if (AutoGenerateAccountNumber)
            {
                group.AccountNumber = Utils.GenerateAccountNumber(group.AccountTypeId.Value, group.BranchID.Value);
                db.SubmitChanges();
            }
        }
        return group.GroupId;
    }


    public enum CompoundType
    {
        Monthly = 12,
        Quaterly = 4,
        Semiannually = 2,
        Annually = 1
    }


    public enum FeatureCalculationComponent
    {
        Balance = 1,
        PerWithdrawal = 2,
        PerDeposit = 3,
        TotalWithdrawal = 4
    }

    // public static string GetLoanDurationDescritiont


    static public double calculateCompoundInterest(double Principal, double InterestRate, decimal periods, CompoundType compoundType)
    {
        double InterestEarned, AnnualRate;
        double FutureValue, RatePerPeriod;
        //int  CompoundType;

        AnnualRate = InterestRate / 100;

        //if (rdoMonthly.Checked)
        //    CompoundType = 12;
        //else if (rdoQuarterly.Checked)
        //    CompoundType = 4;
        //else if (rdoSemiannually.Checked)
        //    CompoundType = 2;
        //else
        //    CompoundType = 1;

        //NumberOfPeriods = Int32.Parse(txtPeriods.Text);
        double i = AnnualRate / (int)compoundType;
        double n = (int)compoundType * ((double)periods);

        RatePerPeriod = AnnualRate / ((double)periods);
        FutureValue = Principal * Math.Pow(1 + i, n);
        InterestEarned = FutureValue - Principal;


        return FutureValue;
        //txtInterestEarned.Text = InterestEarned.ToString("C");
        //txtAmountEarned.Text = FutureValue.ToString("C");
    }


    static public CompoundType GetCompoundType(int typeId)
    {
        CompoundType cType;
        switch (typeId)
        {
            case 1: cType = CompoundType.Annually;
                break;
            case 2: cType = CompoundType.Semiannually;
                break;
            case 4: cType = CompoundType.Quaterly;
                break;
            case 12: cType = CompoundType.Monthly;
                break;
            default: cType = CompoundType.Annually;
                break;
        }
        return cType;
    }


    public static void GenerateRepaymentSchedule(int months, RepaymentFrequency repaymentFrequency, Loan currentLoan)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            List<string> repaymentDays = new List<string>();
            DateTime tempDatertime = DateTime.Today;
            DateTime tempResultantDate = DateTime.Today;
            bool isSunday = false;
            CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
            for (int i = 0; i < months; i++)
            {
                for (int j = 0; j < repaymentFrequency.NumberOfDays; j++)
                {
                    if (tempDatertime.AddDays(1).DayOfWeek == DayOfWeek.Saturday)
                    {
                        if (cProfile.ExcludeSaturdayFromCalculations.Value)
                        {
                            tempResultantDate = tempDatertime.AddDays(3);
                            // tempDatertime = tempDatertime.AddDays(1);
                            //tempResultantDate.AddDays(3);
                            // isSunday = false;
                        }
                    }
                    else if (tempDatertime.AddDays(1).DayOfWeek == DayOfWeek.Sunday)
                    {
                        if (cProfile.ExcludeSundaysFromCalculations.Value)
                        {
                            tempResultantDate = tempDatertime.AddDays(2); //if day lands on sunday, move day to monday

                            // tempResultantDate.AddDays(2);
                            //  isSunday = true;
                        }
                    }
                    else
                    {
                        tempResultantDate = tempDatertime.AddDays(1);
                    }
                    tempDatertime = tempDatertime.AddDays(1);


                    //if (isSunday)
                    //{
                    //    tempDatertime = tempDatertime.AddDays(-1); //come back to sunday
                    //}
                    //else {
                    //    tempDatertime = tempDatertime.AddDays(-2); //come back to sutarday
                    //}


                }
                var _repaymentSchedule = new RepaymentSchedule() { LoanId = currentLoan.LoanID, ExpectedRepaymentAmount = currentLoan.RepaymentFreqAmount, RepaymentDate = tempResultantDate };
                db.RepaymentSchedules.InsertOnSubmit(_repaymentSchedule);

                //audit
                Utils.logAction("Insert", _repaymentSchedule);
                db.SubmitChanges();
            }

        }
    }


    public static void GenerateRepaymentSchedule_new(int months, RepaymentFrequency repaymentFrequency, Loan currentLoan)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            decimal tempLoanAmount = currentLoan.Amount.Value;
            decimal repaymentIntervals = (decimal)(currentLoan.ExpectedRepaymentEndDate.Value.Date - currentLoan.LoanCalculationStartDate.Value).Days / (repaymentFrequency.ConversionUnit.Value * (decimal)months);
            DateTime tempScheduleDate = currentLoan.LoanCalculationStartDate.Value;
            DateTime tempDate = currentLoan.LoanCalculationStartDate.Value;
            CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();

            decimal numberOfPayments = Math.Round((currentLoan.ExpectedRepaymentEndDate.Value - currentLoan.LoanCalculationStartDate.Value).Days / repaymentIntervals, MidpointRounding.AwayFromZero);


            for (decimal i = 0; i < numberOfPayments; i++)
            {
                tempScheduleDate = tempDate = tempDate.AddDays((int)repaymentIntervals);
                if (tempScheduleDate.DayOfWeek == DayOfWeek.Sunday)
                {
                    tempScheduleDate = tempScheduleDate.AddDays(1);
                }
                else if (tempScheduleDate.DayOfWeek == DayOfWeek.Saturday)
                {
                    tempScheduleDate = tempScheduleDate.AddDays(2);
                }


                //get the loan amount
                tempLoanAmount -= currentLoan.RepaymentFreqAmount.Value;

                decimal _repaymentAmount = currentLoan.RepaymentFreqAmount.Value;
                // decimal _interestRepayment = (currentLoan.Interest.Value / 100) * _repaymentAmount;
                decimal _interestRepayment = (currentLoan.Amount.Value - currentLoan.Principal.Value) / numberOfPayments;



                //create new loan schedule
                var _repaymentSchedule = new RepaymentSchedule()
                {
                    Balance = tempLoanAmount,
                    IsPaymentMade = false,
                    ExpectedRepaymentAmount = currentLoan.RepaymentFreqAmount,
                    LoanId = currentLoan.LoanID,
                    RepaymentDate = tempScheduleDate,
                    InterestPayment = _interestRepayment,
                    PrincipalPayment = _repaymentAmount - _interestRepayment
                };
                db.RepaymentSchedules.InsertOnSubmit(_repaymentSchedule);
                db.SubmitChanges();

                //audit
                Utils.logAction("Insert", _repaymentSchedule);
            }

            //DateTime.Now.Month

        }
    }



    public static void GenerateContributionSchedule(int months, RepaymentFrequency repaymentFrequency, Investment currentLoan)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {

            decimal repaymentIntervals = (decimal)(currentLoan.MaturityDate.Value.Date - currentLoan.InvestmentCalculationStartDate.Value).Days / (repaymentFrequency.ConversionUnit.Value * (decimal)months);
            DateTime tempScheduleDate = currentLoan.InvestmentCalculationStartDate.Value;
            DateTime tempDate = currentLoan.InvestmentCalculationStartDate.Value;
            CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
            decimal balance = 0;
            for (decimal i = 0; i < Math.Round((currentLoan.MaturityDate.Value - currentLoan.InvestmentCalculationStartDate.Value).Days / repaymentIntervals, MidpointRounding.AwayFromZero); i++)
            {
                tempScheduleDate = tempDate = tempDate.AddDays((int)repaymentIntervals);
                if (tempScheduleDate.DayOfWeek == DayOfWeek.Sunday)
                {
                    tempScheduleDate = tempScheduleDate.AddDays(1);
                }
                else if (tempScheduleDate.DayOfWeek == DayOfWeek.Saturday)
                {
                    tempScheduleDate = tempScheduleDate.AddDays(2);
                }


                //decimal totalAmountContributed = db.Contributions.Where<Contribution>(cont => cont.InvestmentId == currentLoan.InvestmentID).Sum<Contribution>(c => c.ContributionAmount).Value;

                //update balance
                balance += currentLoan.ContributionFreqAmount.Value;

                var _contributionSchedule = new ContributionSchedule()
                {
                    IsContributionMade = false,
                    ExpectedContributionAmount = currentLoan.ContributionFreqAmount,
                    InvestmentId = currentLoan.InvestmentID,
                    ContributionDate = tempScheduleDate,
                    Balance = balance
                };

                db.SubmitChanges();
                db.ContributionSchedules.InsertOnSubmit(_contributionSchedule);

                //audit
                Utils.logAction("Insert", _contributionSchedule);
            }

            //DateTime.Now.Month

        }
    }





    public static string GenerateAccountNumber(int uniqueId)
    {
        StringBuilder strbuilder = new StringBuilder();
        strbuilder.Append(DateTime.Now.Year);
        strbuilder.Append(DateTime.Now.Month);
        strbuilder.Append(DateTime.Now.Day);
        strbuilder.Append(DateTime.Now.Hour);
        strbuilder.Append(DateTime.Now.Minute);
        strbuilder.Append(DateTime.Now.Second);
        strbuilder.Append(uniqueId);

        return strbuilder.ToString();
    }


    public static string GenerateAccountNumber(int AccountTypeId, int branchId)
    {
        Branch _branch;
        AccountType _accType;
        StringBuilder strbuilder;
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            _branch = db.Branches.FirstOrDefault(b => b.BranchID == branchId);
            _accType = db.AccountTypes.FirstOrDefault(b => b.AccountTypeId == AccountTypeId);

            strbuilder = new StringBuilder();
            strbuilder.Append(DateTime.Now.Year);
            strbuilder.Append(DateTime.Now.Month);
            strbuilder.Append(DateTime.Now.Day);
            strbuilder.Append(_branch.BranchCode);
            strbuilder.Append(_accType.AccountTypeId);


            if (_accType.LastMemberID.HasValue == false)
            {
                _accType.LastMemberID = 1;
            }
            else
            {
                _accType.LastMemberID = _accType.LastMemberID + 1;
            }
            strbuilder.Append((_accType.LastMemberID).ToString().PadLeft(5, '0'));
            db.SubmitChanges();

        }

        return strbuilder.ToString();
    }

    //get members that are a month old from a given date having a given account Type
    public static List<Member> GetMembersAMonthOld(int accountTypeID, DateTime date)
    {
        List<Member> members = new List<Member>();
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            return db.Members.Where(a => a.AccountTypeID == accountTypeID && (date - a.CreatedDate.Value.AddMonths(1)).Days >= 30).ToList();
        }
    }

    //public static DateTime GetDateWithoutHolidaysAndWeekends(DateTime startDate, DateTime endDate)
    //{
    //    int numberOfDays = 0;
    //    TimeSpan tSpan = endDate - startDate;
    //    for (int i = 0; i < tSpan.Days; i++)
    //    {

    //    }
    //}

    //bool isAHoliday(DateTime date)
    //{
    //    using (FinanceManagerDataContext db = new FinanceManagerDataContext())
    //    {
    //        Holiday _holiday = db.Holidays.FirstOrDefault(h => h.HolidayDate.Value.Date == date.Date);
    //        if (_holiday == null)
    //            return false;
    //        else
    //            return true;
    //    }
    //}

    static public double CalculateInterestRateByDuration(decimal interestRateForDuration, int duration, int numberOfMonths)
    {
        double temp = (double)(interestRateForDuration * (duration * numberOfMonths) / 12);
        return temp;/// 12;
    }

    static public double CalculateInterestRateByDuration(decimal interestRateForDuration, int duration)
    {
        double temp = (double)(interestRateForDuration * duration / 12);
        return temp;/// 12;
    }

    static public double calculateSimpleInterest(double Principal, double InterestRate, decimal Periods)
    {
        double FutureValue = Principal * ((double)Periods) * InterestRate / 100;

        return Principal + FutureValue;
        //  return FutureValue;
    }

    public static SearchResultComplexType SearchMember(string searchStrin)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            List<Member> members = (from m in db.Members
                                    where m.AccountNumber.ToLower() == searchStrin.ToLower() ||
                                    m.MemberFirstName.ToLower().Contains(searchStrin) || m.MemberLastName.ToLower().Contains(searchStrin)
                                    select m).ToList<Member>();

            List<vwGroup> groups = (from m in db.vwGroups
                                    where m.GroupName.ToLower() == searchStrin.ToLower() ||
                                    m.Description.ToLower().Contains(searchStrin)
                                    select m).ToList<vwGroup>();

            SearchResultComplexType _mySearchResultComplexType = new SearchResultComplexType() { GroupsFound = groups, MembersFound = members, NumberOFGroupsFound = groups.Count, NumberOfMembers = members.Count };
            return _mySearchResultComplexType;
        }
    }



    //<asp:ListItem Value="1"></asp:ListItem>
    //                     <asp:ListItem Value="2"></asp:ListItem>
    public static string InterestTypeName(int interestTypeID)
    {
        if (interestTypeID == 1)
        {
            return "Compound Interest";
        }
        else
        {
            return "Simple Interest";
        }
    }

    public static string RepaymentFreqName(int freqID)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            return db.RepaymentFrequencies.FirstOrDefault(r => r.RepaymentFrequencyId == freqID).Description;
        }
    }
    public static string LoanStatus(bool? isPaidUp)
    {
        if (isPaidUp.Value == true)
        {
            return "Paid Up";
        }
        else
        {
            return "Active";
        }
    }


    public static string IdentityType(object idType)
    {
        try
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                return db.IdentificationTypes.FirstOrDefault(r => r.IdentificationTypeId == Convert.ToInt32(idType)).Description;
            }
        }
        catch (Exception)
        {
            return String.Empty;
        }
    }

    public static Member GetMemberAcountType(int memberId)
    {
        try
        {

            return GetDataContext().Members.FirstOrDefault(r => r.MemberId == memberId);

        }
        catch (Exception)
        {
            return null;
        }
    }


    public static LoanGroup GetLoanGroup(int groupId)
    {
        try
        {
            return GetDataContext().LoanGroups.FirstOrDefault(r => r.GroupId == groupId);

        }
        catch (Exception)
        {
            return null;
        }
    }

    public static string GetIsMaturedStatusImage(object maturityDate)
    {
        try
        {
            if ((DateTime)maturityDate > DateTime.Today)
            {
                return "~/images/No.png";
            }
            else
            {
                return "~/images/Yes.png";
            }
        }
        catch (Exception)
        {
            return "~/images/No.png";
        }
    }


    public static void MarkMaturedInvestmentsAsSo()
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            foreach (Investment invItem in db.Investments)
            {
                try
                {
                    if (invItem.MaturityDate.Value.Date >= DateTime.Today.Date)
                    {
                        invItem.IsMatured = true;
                    }
                }
                catch (Exception)
                {

                }
            }
            db.SubmitChanges();
        }
    }


    public static void logAction(string Action, object objInQuestion)
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            try
            {
                AuditTrail _newAudit = new AuditTrail()
                   {
                       Action = Action,
                       AffectedTable = (objInQuestion.GetType()).Name,
                       CreatedBy = HttpContext.Current.User.Identity.Name,
                       CreatedDate = DateTime.Now,
                       ActionDescription = getPropertiesOfObject(objInQuestion),
                       AuditTrailId = Guid.NewGuid()
                   };
                db.AuditTrails.InsertOnSubmit(_newAudit);
                db.SubmitChanges();
            }
            catch (Exception)
            {

            }
        }

    }

    public static void CalculateDefaultersInterest()
    {
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            TimeSpan tspan;
            CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
            //try
            //{
            //    tspan = DateTime.Today.Date - cProfile.EndOfDayLastRunDate.Value.Date;

            //    if (tspan.Days > 0)
            //    {
            //        for (int i = 1; i <= tspan.Days; i++)
            //        {
            //calculate loan penalty for each loan
            calculatePenaltyForEachLoan(db, cProfile);
            //        }
            //    }
            //}
            //catch (Exception)
            //{
            //    //caculate penalty for each Loan
            //    calculatePenaltyForEachLoan(db, cProfile, null);
            //}


            //update last run date
            cProfile.EndOfDayLastRunDate = DateTime.Now;
            db.SubmitChanges();
        }
    }


    static void calculatePenaltyForEachLoan(FinanceManagerDataContext dataContext, CompanyProfile cProfile)
    {
        //set grace period to zero if null
        if (cProfile.GracePeriodDays == null)
            cProfile.GracePeriodDays = 0;

        //select loans that have not been paid up and thier expected repayment dates are due. Given a grace period

        DateTime TodayPlusGracePeriod = DateTime.Today.Date.AddDays(cProfile.GracePeriodDays.Value);


        foreach (Loan Loanitem in dataContext.Loans.Where(l => l.IsPaidup.Value == false && TodayPlusGracePeriod >= l.ExpectedRepaymentEndDate.Value.Date)) //iterate through unpaid loans
        {

            LoanPenalty _loanPenalty = null;
            //get most recent penalty for current loan (Last penalty calculates)
            try
            {
                _loanPenalty = dataContext.LoanPenalties.Where<LoanPenalty>(l => l.LoanID == Loanitem.LoanID).OrderBy(lp => lp.CreatedDate).LastOrDefault();
            }
            catch (Exception)
            {

            }

            //get the frequency of calculation of penalty eg. every 30days
            int? _PenaltyCalculationFrequencyDays = cProfile.PenaltyCalculationFrequencyDays.Value;
            if (_PenaltyCalculationFrequencyDays == null)
                _PenaltyCalculationFrequencyDays = 0;

            if (_loanPenalty != null)
            {
                int numberOfTimesToRunPenalty = (DateTime.Today.Date - _loanPenalty.CreatedDate.Value.Date).Days / _PenaltyCalculationFrequencyDays.Value;
                if (numberOfTimesToRunPenalty > 0)
                    for (int i = 0; i < numberOfTimesToRunPenalty; i++)
                    {
                        decimal totalPenalty2;
                        try
                        {
                            totalPenalty2 = Loanitem.LoanPenalties.Sum(p => p.PenaltyAmount).Value;
                        }
                        catch (Exception)
                        {
                            totalPenalty2 = 0;
                        }

                        decimal balance2 = Loanitem.Amount.Value + totalPenalty2 - Loanitem.Repayments.Sum(r => r.RepaymentAmount).Value;
                        decimal penaltyInsterst2 = (cProfile.DefaultersInteresty.Value / 100) * balance2;

                        LoanPenalty _newLoanPenalty = new LoanPenalty();
                        _newLoanPenalty.CreatedDate = DateTime.Now;
                        _newLoanPenalty.LoanID = Loanitem.LoanID;
                        _newLoanPenalty.PenaltyAmount = penaltyInsterst2;
                        _newLoanPenalty.IsReleived = false;
                        _newLoanPenalty.PenaltyRate = cProfile.DefaultersInteresty.Value;
                        dataContext.LoanPenalties.InsertOnSubmit(_newLoanPenalty);

                        //audit
                        Utils.logAction("Insert", _newLoanPenalty);
                    }
            }
            else
            {
                //get the number of days between the lastRundate and today.
                int numberOfTimesToRunPenalty = (DateTime.Today.Date - cProfile.EndOfDayLastRunDate.Value).Days / _PenaltyCalculationFrequencyDays.Value;
                if (numberOfTimesToRunPenalty > 0)
                    for (int i = 0; i < numberOfTimesToRunPenalty; i++)
                    {
                        decimal totalPenalty2 = 0;


                        decimal balance2 = Loanitem.Amount.Value + totalPenalty2 - Loanitem.Repayments.Sum(r => r.RepaymentAmount).Value;
                        decimal penaltyInsterst2 = (cProfile.DefaultersInteresty.Value / 100) * balance2;

                        LoanPenalty _newLoanPenalty = new LoanPenalty();
                        _newLoanPenalty.CreatedDate = DateTime.Now;
                        _newLoanPenalty.LoanID = Loanitem.LoanID;
                        _newLoanPenalty.PenaltyAmount = penaltyInsterst2;
                        _newLoanPenalty.IsReleived = false;
                        _newLoanPenalty.PenaltyRate = cProfile.DefaultersInteresty.Value;
                        dataContext.LoanPenalties.InsertOnSubmit(_newLoanPenalty);

                        try
                        {
                            //test if this bit of the code works
                            totalPenalty2 = Loanitem.LoanPenalties.Sum(p => p.PenaltyAmount).Value;
                        }
                        catch (Exception)
                        {
                            totalPenalty2 = 0;
                        }
                        //audit
                        Utils.logAction("Insert", _newLoanPenalty);
                    }
            }
        }
    }

    public static string ConvertMoneyToText(string value)
    {
        value = value.Replace(",", "").Replace("$", "");
        int decimalCount = 0;
        int Val = value.Length - 1;
        for (int x = 0; x <= Val; x++)
        {
            char Val2 = value[x];
            if (Val2.ToString() == ".")
            {
                decimalCount++;
                if (decimalCount > 1)
                {
                    throw new ArgumentException("Only monetary values are accepted");
                }
            }
            Val2 = value[x];
            char Valtemp = value[x];
            if (!(char.IsDigit(value[x]) | (Val2.ToString() == ".")) & !((x == 0) & (Valtemp.ToString() == "-")))
            {
                throw new ArgumentException("Only monetary values are accepted");
            }
        }
        string returnValue = "";
        string[] parts;
        if (value.Contains("."))
            parts = value.Split(new char[] { '.' });
        else
            parts = (value + ".00").Split(new char[] { '.' });


        parts[1] = new string((parts[1] + "00").Substring(0, 2).ToCharArray());
        bool IsNegative = parts[0].Contains("-");
        if (parts[0].Replace("-", "").Length > 0x12)
        {
            throw new ArgumentException("Maximum value is $999,999,999,999,999,999.99");
        }
        if (IsNegative)
        {
            parts[0] = parts[0].Replace("-", "");
            returnValue = returnValue + "Minus ";
        }
        if (parts[0].Length > 15)
        {
            returnValue = ((((returnValue + HundredsText(parts[0].PadLeft(0x12, '0').Substring(0, 3)) + "Quadrillion ")
                + HundredsText(parts[0].PadLeft(0x12, '0').Substring(3, 3)) + "Trillion ") +
                HundredsText(parts[0].PadLeft(0x12, '0').Substring(6, 3)) + "Billion ") +
                HundredsText(parts[0].PadLeft(0x12, '0').Substring(9, 3)) + "Million ") +
                HundredsText(parts[0].PadLeft(0x12, '0').Substring(12, 3)) + "Thousand ";
        }
        else if (parts[0].Length > 12)
        {
            returnValue = (((returnValue + HundredsText(parts[0].PadLeft(15, '0').Substring(0, 3)) +
                "Trillion ") + HundredsText(parts[0].PadLeft(15, '0').Substring(3, 3)) + "Billion ") +
                HundredsText(parts[0].PadLeft(15, '0').Substring(6, 3)) + "Million ") +
                HundredsText(parts[0].PadLeft(15, '0').Substring(9, 3)) + "Thousand ";
        }
        else if (parts[0].Length > 9)
        {
            returnValue = ((returnValue + HundredsText(parts[0].PadLeft(12, '0').Substring(0, 3)) +
                "Billion ") + HundredsText(parts[0].PadLeft(12, '0').Substring(3, 3)) + "Million ") +
                HundredsText(parts[0].PadLeft(12, '0').Substring(6, 3)) + "Thousand ";
        }
        else if (parts[0].Length > 6)
        {
            returnValue = (returnValue + HundredsText(parts[0].PadLeft(9, '0').Substring(0, 3)) +
                "Million ") + HundredsText(parts[0].PadLeft(9, '0').Substring(3, 3)) + "Thousand ";
        }
        else if (parts[0].Length > 3)
        {
            returnValue = returnValue + HundredsText(parts[0].PadLeft(6, '0').Substring(0, 3)) +
                "Thousand ";
        }
        string hundreds = parts[0].PadLeft(3, '0');
        int tempInt = 0;
        hundreds = hundreds.Substring(hundreds.Length - 3, 3);
        if (int.TryParse(hundreds, out tempInt) == true)
        {
            if (int.Parse(hundreds) < 100)
            {
                //returnValue = returnValue + "and ";
            }
            returnValue = returnValue + HundredsText(hundreds) + "Cedi";
            if (int.Parse(hundreds) != 1)
            {
                returnValue = returnValue + "s";
            }
            if (int.Parse(parts[1]) != 0)
            {
                returnValue = returnValue + " and ";
            }
        }
        if ((parts.Length == 2) && (int.Parse(parts[1]) != 0))
        {
            returnValue = returnValue + HundredsText(parts[1].PadLeft(3, '0')) + "Peswa";
            if (int.Parse(parts[1]) != 1)
            {
                returnValue = returnValue + "s";
            }
        }
        return returnValue;
    }


    static string[] Tens = new string[] { 
			"Ten",
			"Twenty", 
			"Thirty", 
			"Forty", 
			"Fifty", 
			"Sixty", 
			"Seventy", 
			"Eighty", 
			"Ninety" };
    static string[] Ones = new string[] { 
			"One",
			"Two",
			"Three",
			"Four",
			"Five",
			"Six",
			"Seven",
			"Eight",
			"Nine",
			"Ten",
			"Eleven",
			"Twelve", 
			"Thirteen", 
			"Fourteen", 
			"Fifteen", 
			"Sixteen", 
			"Seventeen", 
			"Eighteen", 
			"Nineteen" };



    private static string HundredsText(string value)
    {
        char Val_1;
        char Val_2;

        string returnValue = "";
        bool IsSingleDigit = true;
        char Val = value[0];
        if (int.Parse(Val.ToString()) != 0)
        {
            Val_1 = value[0];
            returnValue = returnValue + Ones[int.Parse(Val_1.ToString()) - 1] + " Hundred ";
            IsSingleDigit = false;
        }
        Val_1 = value[1];
        if (int.Parse(Val_1.ToString()) > 1)
        {
            Val = value[1];
            returnValue = returnValue + Tens[int.Parse(Val.ToString()) - 1] + " ";
            Val_1 = value[2];
            if (int.Parse(Val_1.ToString()) != 0)
            {
                Val = value[2];
                returnValue = returnValue + Ones[int.Parse(Val.ToString()) - 1] + " ";
            }
            return returnValue;
        }
        Val_1 = value[1];
        if (int.Parse(Val_1.ToString()) == 1)
        {
            Val = value[1];
            Val_2 = value[2];
            return (returnValue + Ones[int.Parse(Val.ToString() + Val_2.ToString()) - 1] + " ");
        }
        Val_2 = value[2];
        if (int.Parse(Val_2.ToString()) == 0)
        {
            return returnValue;
        }
        if (!IsSingleDigit)
        {
            returnValue = returnValue + "and ";
        }
        Val_2 = value[2];
        return (returnValue + Ones[int.Parse(Val_2.ToString()) - 1] + " ");
    }


    public static string getPropertiesOfObject(object myObject)
    {
        var stringPropertyNamesAndValues = myObject.GetType()
.GetProperties()
.Where(pi => pi.PropertyType == typeof(string) || pi.PropertyType == typeof(int) && pi.GetGetMethod() != null)
.Select(pi => new
{
    Name = pi.Name,
    Value = pi.GetGetMethod().Invoke(myObject, null)
});

        string returnString = "";
        foreach (var pair in stringPropertyNamesAndValues)
        {
            returnString += String.Format("{0}:{1}, ", pair.Name, pair.Value);
        }

        return returnString;
    }


    public static decimal GetMemberBalance(int memberId, DateTime AsOfDate)
    {
        Member _member = GetDataContext().Members.FirstOrDefault(m => m.MemberId == memberId);
        int investmentTypeId = GetDataContext().AccountTypes.FirstOrDefault(a => a.AccountTypeId == _member.AccountTypeID.Value).DefaultInvestmentTypeID.Value;

        Investment memberInvestment = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId);


        decimal deposits = memberInvestment.Contributions.Where(c => c.CreatedDate.Value.Date <= AsOfDate.Date).Sum(c => c.ContributionAmount).Value;
        decimal withdrawals = memberInvestment.MemberWithdrawals.Where(c => c.DateCreated.Value.Date <= AsOfDate.Date).Sum(w => w.WithdrawalAmount).Value;


        //Applied interests
        //
        decimal totalAppliedInterest = memberInvestment.AppliedInterests.Where(i => i.AppliedFor.Value.Date <= AsOfDate.Date).Sum(i => i.InterestAmount.Value);
        decimal totalAppliedDeduction = memberInvestment.AppliedDeductions.Where(d => d.AppliedFor.Value.Date <= AsOfDate.Date).Sum(d => d.DeductionAmount.Value);

        return deposits - withdrawals;
    }


    public static decimal GetGroupBalance(int groupId, DateTime AsOfDate)
    {
        LoanGroup _member = GetDataContext().LoanGroups.FirstOrDefault(m => m.GroupId == groupId);
        int investmentTypeId = GetDataContext().AccountTypes.FirstOrDefault(a => a.AccountTypeId == _member.AccountTypeId.Value).DefaultInvestmentTypeID.Value;

        Investment  GroupInvestment= _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId);


        decimal deposits = GroupInvestment.Contributions.Where(c => c.CreatedDate.Value.Date <= AsOfDate.Date).Sum(c => c.ContributionAmount).Value;
        decimal withdrawals = GroupInvestment.MemberWithdrawals.Where(c => c.DateCreated.Value.Date <= AsOfDate.Date).Sum(w => w.WithdrawalAmount).Value;

        return deposits - withdrawals;
    }



    public static decimal GetMemberTotalWithdrawals(int memberId, DateTime AsOfDate)
    {
        Member _member = GetDataContext().Members.FirstOrDefault(m => m.MemberId == memberId);
        int investmentTypeId = GetDataContext().AccountTypes.FirstOrDefault(a => a.AccountTypeId == _member.AccountTypeID.Value).DefaultInvestmentTypeID.Value;

        //decimal deposits = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId).Contributions.Sum(c => c.ContributionAmount).Value;
        decimal withdrawals = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId).MemberWithdrawals.Where(w => w.DateCreated <= AsOfDate).Sum(w => w.WithdrawalAmount).Value;

        return withdrawals;
    }


    public static decimal GetMemberTotalWithdrawalsBetweenDate(int memberId, DateTime StartDate, DateTime EndDate)
    {
        Member _member = GetDataContext().Members.FirstOrDefault(m => m.MemberId == memberId);
        int investmentTypeId = GetDataContext().AccountTypes.FirstOrDefault(a => a.AccountTypeId == _member.AccountTypeID.Value).DefaultInvestmentTypeID.Value;

        //decimal deposits = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId).Contributions.Sum(c => c.ContributionAmount).Value;
        decimal withdrawals = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId).MemberWithdrawals.Where(w => w.DateCreated.Value.Date <= EndDate.Date && w.DateCreated.Value.Date > StartDate.Date).Sum(w => w.WithdrawalAmount).Value;

        return withdrawals;
    }


    public static decimal GetGroupTotalWithdrawals(int groupId, DateTime AsOfDate)
    {
        LoanGroup _member = GetDataContext().LoanGroups.FirstOrDefault(m => m.GroupId == groupId);
        int investmentTypeId = GetDataContext().AccountTypes.FirstOrDefault(a => a.AccountTypeId == _member.AccountTypeId.Value).DefaultInvestmentTypeID.Value;

        //decimal deposits = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId).Contributions.Sum(c => c.ContributionAmount).Value;
        decimal withdrawals = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId).MemberWithdrawals.Where(w => w.DateCreated <= AsOfDate).Sum(w => w.WithdrawalAmount).Value;

        return withdrawals;
    }



    public static decimal GetMemberTotalDeposits(int memberId)
    {
        Member _member = GetDataContext().Members.FirstOrDefault(m => m.MemberId == memberId);
        int investmentTypeId = GetDataContext().AccountTypes.FirstOrDefault(a => a.AccountTypeId == _member.AccountTypeID.Value).DefaultInvestmentTypeID.Value;

        decimal deposits = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId).Contributions.Sum(c => c.ContributionAmount).Value;
        //decimal withdrawals = _member.Investments.FirstOrDefault(i => i.InvestmentTypeId == investmentTypeId).MemberWithdrawals.Sum(w => w.WithdrawalAmount).Value;

        return deposits;
    }



    static void AppliedAccountTypeFeaturesEndOfDay()
    {
        List<FailMessages> failMessages = new List<FailMessages>();
        using (FinanceManagerDataContext db = new FinanceManagerDataContext())
        {
            //AccountType accType = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == Convert.ToInt32(DropDownList1.SelectedValue));


            foreach (AccountType accType in db.AccountTypes)
            {
                foreach (AccountTypeFeature item in accType.AccountTypeFeatures)
                {
                    AppliedFeatureHistory _appHistory = item.AppliedFeatureHistories.LastOrDefault();
                    if (_appHistory != null)
                    {
                        if (item.CalculationFrequencyID.Value == 1) //monthly
                        {
                            //AppliedFeatureHistory _appHistory = item.AppliedFeatureHistories.LastOrDefault();

                            if (_appHistory.AppliedDate.Value.AddMonths(1) < DateTime.Today)
                            {
                                failMessages.Add(new FailMessages() { Message = "Monthly feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than a month. This feature was skipped." });
                                continue;
                            }

                        }
                        else if (item.CalculationFrequencyID.Value == 2) //annually
                        {
                            if (_appHistory.AppliedDate.Value.AddYears(1) < DateTime.Today)
                            {
                                failMessages.Add(new FailMessages() { Message = "Annual feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than a year. This feature was skipped." });
                                continue;
                            }
                        }
                        else if (item.CalculationFrequencyID.Value == 3) //custom
                        {
                            if (_appHistory.AppliedDate.Value.AddDays(item.CustomCalculationFreqNumberOfDays.Value) < DateTime.Today)
                            {
                                failMessages.Add(new FailMessages() { Message = "Custom feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than " + item.CustomCalculationFreqNumberOfDays.Value + " day(s). This feature was skipped." });
                                continue;
                            }
                        }
                    }


                    switch (item.CalculateOn)
                    {
                        case 1:
                            foreach (Member member in accType.Members.Where(m => m.IsDeleted == false))
                            {
                                int investmentTypeID = member.Investments.FirstOrDefault(i => i.InvestmentTypeId == db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == member.AccountTypeID.Value).DefaultInvestmentTypeID.Value).InvestmentID;
                                decimal valueToapply; decimal balance;
                                balance = Utils.GetMemberBalance(member.MemberId, DateTime.Today.Date);
                                if (item.IsPercentage.Value)
                                {
                                    valueToapply = (item.ValueToApply.Value / 100) * balance;
                                }
                                else
                                {
                                    valueToapply = item.ValueToApply.Value;
                                }


                                AppliedAccountFeature aFeature = new AppliedAccountFeature();
                                aFeature.AccountNumber = member.AccountNumber;
                                aFeature.AccountTypeFeatureID = item.AccountFeatureID;
                                aFeature.AppliedValue = item.IsDeduction.Value ? valueToapply * -1 : valueToapply;
                                aFeature.CreatedBy = HttpContext.Current.User.Identity.Name;
                                aFeature.CreatedDate = DateTime.Now;
                                aFeature.InvestmentID = investmentTypeID;
                                aFeature.Narration = "Account type feature manually applied.";


                                db.AppliedAccountFeatures.InsertOnSubmit(aFeature);


                                if (item.IsDeduction.Value) //insert into appliedCharges Table
                                {
                                    AppliedInterest aInterest = new AppliedInterest();
                                    aInterest.CreatedBy = HttpContext.Current.User.Identity.Name;
                                    aInterest.CreatedDate = DateTime.Now;
                                    aInterest.InterestAmount = valueToapply;
                                    aInterest.InvestmentID = aFeature.InvestmentID;
                                    aInterest.Rate = item.ValueToApply;

                                    db.AppliedInterests.InsertOnSubmit(aInterest);
                                }

                                else //insert into Applied interest table
                                {
                                    AppliedDeduction aDeduction = new AppliedDeduction();
                                    aDeduction.CreatedBy = HttpContext.Current.User.Identity.Name;
                                    aDeduction.CreatedDate = DateTime.Now;
                                    aDeduction.DeductionAmount = valueToapply;
                                    aDeduction.InvestmentID = aFeature.InvestmentID;
                                    aDeduction.Rate = item.ValueToApply;

                                    db.AppliedDeductions.InsertOnSubmit(aDeduction);
                                }

                            }

                            AppliedFeatureHistory appliedFeatureHistory = new AppliedFeatureHistory();
                            appliedFeatureHistory.AccountTypeFeatureID = item.AccountFeatureID;
                            appliedFeatureHistory.ActionInitiatedBy = "Manually run";
                            appliedFeatureHistory.AppliedBy = HttpContext.Current.User.Identity.Name;
                            appliedFeatureHistory.AppliedDate = DateTime.Now;

                            db.AppliedFeatureHistories.InsertOnSubmit(appliedFeatureHistory);
                            db.SubmitChanges();
                            break;


                        case 4:
                            foreach (Member member in accType.Members.Where(m => m.IsDeleted == false))
                            {
                                int investmentTypeID = member.Investments.FirstOrDefault(i => i.InvestmentTypeId == db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == member.AccountTypeID.Value).DefaultInvestmentTypeID.Value).InvestmentID;
                                decimal valueToapply; decimal totalWithdrawal;
                                totalWithdrawal = Utils.GetMemberTotalWithdrawals(member.MemberId, DateTime.Today.Date);
                                if (item.IsPercentage.Value)
                                {
                                    valueToapply = (item.ValueToApply.Value / 100) * totalWithdrawal;
                                }
                                else
                                {
                                    valueToapply = item.ValueToApply.Value;
                                }


                                AppliedAccountFeature aFeature = new AppliedAccountFeature();
                                aFeature.AccountNumber = member.AccountNumber;
                                aFeature.AccountTypeFeatureID = item.AccountFeatureID;
                                aFeature.AppliedValue = item.IsDeduction.Value ? valueToapply * -1 : valueToapply;
                                aFeature.CreatedBy = HttpContext.Current.User.Identity.Name;
                                aFeature.CreatedDate = DateTime.Now;
                                aFeature.InvestmentID = investmentTypeID;
                                aFeature.Narration = "Account type feature manually applied.";


                                db.AppliedAccountFeatures.InsertOnSubmit(aFeature);


                                if (item.IsDeduction.Value) //insert into appliedCharges Table
                                {
                                    AppliedInterest aInterest = new AppliedInterest();
                                    aInterest.CreatedBy = HttpContext.Current.User.Identity.Name;
                                    aInterest.CreatedDate = DateTime.Now;
                                    aInterest.InterestAmount = valueToapply;
                                    aInterest.InvestmentID = aFeature.InvestmentID;
                                    aInterest.Rate = item.ValueToApply;

                                    db.AppliedInterests.InsertOnSubmit(aInterest);
                                }

                                else //insert into Applied interest table
                                {
                                    AppliedDeduction aDeduction = new AppliedDeduction();
                                    aDeduction.CreatedBy = HttpContext.Current.User.Identity.Name;
                                    aDeduction.CreatedDate = DateTime.Now;
                                    aDeduction.DeductionAmount = valueToapply;
                                    aDeduction.InvestmentID = aFeature.InvestmentID;
                                    aDeduction.Rate = item.ValueToApply;

                                    db.AppliedDeductions.InsertOnSubmit(aDeduction);
                                }

                            }

                            AppliedFeatureHistory appliedFeatureHistory1 = new AppliedFeatureHistory();
                            appliedFeatureHistory1.AccountTypeFeatureID = item.AccountFeatureID;
                            appliedFeatureHistory1.ActionInitiatedBy = "Manually run";
                            appliedFeatureHistory1.AppliedBy = HttpContext.Current.User.Identity.Name;
                            appliedFeatureHistory1.AppliedDate = DateTime.Now;

                            db.AppliedFeatureHistories.InsertOnSubmit(appliedFeatureHistory1);
                            db.SubmitChanges();
                            break;
                    }
                }
            }
        }
    }


}
