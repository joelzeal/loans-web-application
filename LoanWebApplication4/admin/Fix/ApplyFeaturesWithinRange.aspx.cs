using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class ApplyFeaturesWithinRange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            DateTime tempDate;
            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);
            double numberofdays = Convert.ToInt32((endDate - startDate).TotalDays);
            tempDate = startDate;
            for (int i = 0; i < numberofdays; i++)
            {
                tempDate = startDate.AddDays(i);
                runAppliedInterest(tempDate);
            }
        }


        void runAppliedInterest(DateTime dateToApply)
        {
           
            //if(dateToApply.Date == ()
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                AccountType accType = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == Convert.ToInt32(DropDownList1.SelectedValue));

                //clear fail messages
                db.FailMessages.DeleteAllOnSubmit(db.FailMessages);
                db.SubmitChanges();

               #region LoopRegion
                
                foreach (AccountTypeFeature item in accType.AccountTypeFeatures)
                {
                    AppliedFeatureHistory _appHistory = item.AppliedFeatureHistories.LastOrDefault();
                    if (_appHistory != null)
                    {
                        if (item.CalculationFrequencyID.Value == 1) //monthly
                        {
                            //AppliedFeatureHistory _appHistory = item.AppliedFeatureHistories.LastOrDefault();
                            DateTime tempDateTime = _appHistory.AppliedForDate.Value.AddMonths(1);
                            if (tempDateTime.Date != dateToApply.Date)
                            {
                                db.FailMessages.InsertOnSubmit(new FailMessage() { FailMessageId = Guid.NewGuid(), Message = "Monthly feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than a month. This feature was skipped." });
                                db.SubmitChanges();

                                continue;
                            }
                        }
                        else if (item.CalculationFrequencyID.Value == 2) //annually
                        {
                            DateTime tempDateTime = _appHistory.AppliedForDate.Value.AddYears(1);
                            if (tempDateTime != dateToApply.Date)
                            {
                                db.FailMessages.InsertOnSubmit(new FailMessage() { Message = "Annual feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than a year. This feature was skipped." });
                                db.SubmitChanges();
                                continue;
                            }
                        }
                        else if (item.CalculationFrequencyID.Value == 3) //custom
                        {
                            DateTime tempDateTime = _appHistory.AppliedForDate.Value.AddDays(item.CustomCalculationFreqNumberOfDays.Value);
                            if (_appHistory.AppliedForDate.Value.AddDays(item.CustomCalculationFreqNumberOfDays.Value) != dateToApply.Date)
                            {
                                db.FailMessages.InsertOnSubmit(new FailMessage() { Message = "Custom feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than " + item.CustomCalculationFreqNumberOfDays.Value + " day(s). This feature was skipped." });
                                db.SubmitChanges();
                                continue;
                            }
                        }
                    }

                    AppliedFeatureHistory appliedFeatureHistory = new AppliedFeatureHistory();
                    appliedFeatureHistory.AccountTypeFeatureID = item.AccountFeatureID;
                    appliedFeatureHistory.ActionInitiatedBy = "Manually run";
                    appliedFeatureHistory.AppliedBy = User.Identity.Name;
                    switch (item.CalculateOn)
                    {
                        case 1:
                            #region MemberRegion
                            List<Member> accountMembers = new List<Member>();

                           accountMembers.AddRange(accType.Members.Where(m => m.IsDeleted == false && (dateToApply - m.CreatedDate.Value.AddMonths(1)).Days >= 0));
                            //accountMembers.AddRange(accType.Members.Where(m => m.IsDeleted == false && (dateToApply - m.CreatedDate.Value.AddMonths(1)).Days >= 28));


                            foreach (Member Memberitem in accType.Members)
                            {
                                
                            }



                            foreach (Member item_member in accType.Members.Where(m => m.IsDeleted == false && (dateToApply - m.CreatedDate.Value.AddMonths(1)).Days >= 29))
                            {
                                //accountMembers.Add(item_member);
                            }

                            foreach (Member member in accountMembers)
                            {
                                Investment tempInv = member.Investments.FirstOrDefault(i => i.AccountTypeId == member.AccountType.AccountTypeId);

                                if (tempInv == null) //for some reason member doesn't have an investment. Add an investment
                                {
                                    continue;
                                }

                                int investmentID = tempInv.InvestmentID;


                                decimal valueToapply; decimal balance;
                                balance = Utils.GetMemberBalance(member.MemberId, dateToApply.Date);
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
                                aFeature.CreatedBy = User.Identity.Name;
                                aFeature.CreatedDate = DateTime.Now;
                                aFeature.InvestmentID = investmentID;
                                aFeature.Narration = "Account type feature manually applied.";

                                appliedFeatureHistory.AppliedAccountFeatures.Add(aFeature);
                                // db.AppliedAccountFeatures.InsertOnSubmit(aFeature);


                                if (item.IsDeduction.Value) //insert into appliedCharges Table
                                {
                                    AppliedDeduction aDeduction = new AppliedDeduction();
                                    aDeduction.CreatedBy = User.Identity.Name;
                                    aDeduction.CreatedDate = DateTime.Now;
                                    aDeduction.DeductionAmount = valueToapply;
                                    aDeduction.InvestmentID = aFeature.InvestmentID;
                                    aDeduction.Rate = item.ValueToApply;
                                    aDeduction.Narration = "Service charge";
                                    aDeduction.AppliedFor = dateToApply;
                                    aDeduction.IsDeleted = false;

                                    //db.AppliedDeductions.InsertOnSubmit(aDeduction);
                                    appliedFeatureHistory.AppliedDeductions.Add(aDeduction);
                                }

                                else //insert into Applied interest table
                                {
                                    AppliedInterest aInterest = new AppliedInterest();
                                    aInterest.CreatedBy = User.Identity.Name;
                                    aInterest.CreatedDate = DateTime.Now;
                                    aInterest.InterestAmount = valueToapply;
                                    aInterest.InvestmentID = aFeature.InvestmentID;
                                    aInterest.Rate = item.ValueToApply;
                                    aInterest.Narration = "Applied interest";
                                    aInterest.AppliedFor = dateToApply;
                                    aInterest.IsDeleted = false;
                                    appliedFeatureHistory.AppliedInterests.Add(aInterest);
                                    // db.AppliedInterests.InsertOnSubmit(aInterest);
                                }

                            }
                            #endregion
                            #region groupRegion
                            //run on group

                            List<LoanGroup> accountGroups = new List<LoanGroup>();

                            accountGroups.AddRange(accType.LoanGroups.Where(m => m.IsDeleted == false | m.IsDeleted == null && m.CreatedDate.Value.AddMonths(1) >= DateTime.Today.Date));


                            foreach (LoanGroup group in accountGroups)
                            {
                                int investmentTypeID = group.Investments.FirstOrDefault(i => i.InvestmentTypeId == db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == group.AccountTypeId.Value).DefaultInvestmentTypeID.Value).InvestmentID;
                                decimal valueToapply; decimal balance;
                                balance = Utils.GetGroupBalance(group.GroupId, dateToApply);
                                if (item.IsPercentage.Value)
                                {
                                    valueToapply = (item.ValueToApply.Value / 100) * balance;
                                }
                                else
                                {
                                    valueToapply = item.ValueToApply.Value;
                                }


                                AppliedAccountFeature aFeature = new AppliedAccountFeature();
                                aFeature.AccountNumber = group.AccountNumber;
                                aFeature.AccountTypeFeatureID = item.AccountFeatureID;
                                aFeature.AppliedValue = item.IsDeduction.Value ? valueToapply * -1 : valueToapply;
                                aFeature.CreatedBy = User.Identity.Name;
                                aFeature.CreatedDate = DateTime.Now;
                                aFeature.InvestmentID = investmentTypeID;
                                aFeature.Narration = "Account type feature manually applied.";

                                appliedFeatureHistory.AppliedAccountFeatures.Add(aFeature);
                                //db.AppliedAccountFeatures.InsertOnSubmit(aFeature);


                                if (item.IsDeduction.Value) //insert into appliedCharges Table
                                {
                                    AppliedDeduction aDeduction = new AppliedDeduction();
                                    aDeduction.CreatedBy = User.Identity.Name;
                                    aDeduction.CreatedDate = DateTime.Now;
                                    aDeduction.DeductionAmount = valueToapply;
                                    aDeduction.InvestmentID = aFeature.InvestmentID;
                                    aDeduction.Rate = item.ValueToApply;
                                    //aDeduction.IsDeleted = false;
                                    appliedFeatureHistory.AppliedDeductions.Add(aDeduction);
                                    //db.AppliedDeductions.InsertOnSubmit(aDeduction);
                                }

                                else //insert into Applied interest table
                                {
                                    AppliedInterest aInterest = new AppliedInterest();
                                    aInterest.CreatedBy = User.Identity.Name;
                                    aInterest.CreatedDate = DateTime.Now;
                                    aInterest.InterestAmount = valueToapply;
                                    aInterest.InvestmentID = aFeature.InvestmentID;
                                    aInterest.Rate = item.ValueToApply;
                                    //aInterest.IsDeleted = false;
                                    appliedFeatureHistory.AppliedInterests.Add(aInterest);
                                    //db.AppliedInterests.InsertOnSubmit(aInterest);
                                }

                            }
                            #endregion
                            break;

                        case 4:
                            #region MemberRegion

                            List<Member> accountMembers1 = new List<Member>();

                            accountMembers1.AddRange(accType.Members.Where(m => m.IsDeleted == false && (dateToApply.Date- m.CreatedDate.Value.Date.AddMonths(1)).Days >= 0));



                            foreach (Member member in accountMembers1)
                            {
                                AccountType temAcctounType = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == member.AccountTypeID.Value);
                                int? invID = temAcctounType.DefaultInvestmentTypeID.Value;

                                Investment tempInvestment = member.Investments.FirstOrDefault(i => i.InvestmentTypeId == invID);
                                if (tempInvestment == null) //for some reason member doesn't have an investment. Add an investment
                                {
                                    continue;
                                    //tempInvestment = new Investment()
                                    //{
                                    //    AccountTypeId = item.AccountTypeID,
                                    //    CreatedBy = User.Identity.Name,
                                    //    CreatedDate = DateTime.Now,
                                    //    InvestmentTypeId = 1,
                                    //    IsActive = true,
                                    //    IsDeleted = false
                                    //};

                                    //member.Investments.Add(tempInvestment);
                                    //db.SubmitChanges();
                                }

                                int investmentTypeID = tempInvestment.InvestmentID;

                                decimal valueToapply; decimal totalWithdrawal;
                                totalWithdrawal = Utils.GetMemberTotalWithdrawalsBetweenDate(member.MemberId, dateToApply.AddMonths(-1), dateToApply);
                                //if withdrawal for the month is 0, do nothing
                                if (totalWithdrawal == 0)
                                {
                                    continue;
                                }

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
                                aFeature.CreatedBy = User.Identity.Name;
                                aFeature.CreatedDate = DateTime.Now;
                                aFeature.InvestmentID = investmentTypeID;
                                aFeature.Narration = "Account type feature manually applied.";

                                appliedFeatureHistory.AppliedAccountFeatures.Add(aFeature);
                                // db.AppliedAccountFeatures.InsertOnSubmit(aFeature);


                                if (item.IsDeduction.Value) //insert into appliedCharges Table
                                {

                                    AppliedDeduction aDeduction = new AppliedDeduction();
                                    aDeduction.CreatedBy = User.Identity.Name;
                                    aDeduction.CreatedDate = DateTime.Now;
                                    aDeduction.DeductionAmount = valueToapply;
                                    aDeduction.InvestmentID = aFeature.InvestmentID;
                                    aDeduction.Rate = item.ValueToApply;
                                    aDeduction.IsDeleted = false;
                                    aDeduction.Narration = "Service charge";
                                    aDeduction.AppliedFor = dateToApply;
                                    appliedFeatureHistory.AppliedDeductions.Add(aDeduction);
                                    //db.AppliedInterests.InsertOnSubmit(aInterest);
                                }

                                else //insert into Applied interest table
                                {

                                    AppliedInterest aInterest = new AppliedInterest();
                                    aInterest.CreatedBy = User.Identity.Name;
                                    aInterest.CreatedDate = DateTime.Now;
                                    aInterest.InterestAmount = valueToapply;
                                    aInterest.InvestmentID = aFeature.InvestmentID;
                                    aInterest.Rate = item.ValueToApply;
                                    aInterest.IsDeleted = false;
                                    aInterest.Narration = "Service charge";
                                    aInterest.AppliedFor = dateToApply;
                                    appliedFeatureHistory.AppliedInterests.Add(aInterest);

                                    //db.AppliedDeductions.InsertOnSubmit(aDeduction);
                                }

                            }
                            #endregion
                            #region groupRegion
                            //run on group
                            List<LoanGroup> accountGroups1 = new List<LoanGroup>();

                            accountGroups1.AddRange(accType.LoanGroups.Where(m => m.IsDeleted == false | m.IsDeleted == null && m.CreatedDate.Value.AddMonths(1) >= DateTime.Today.Date));

                            foreach (LoanGroup group in accountGroups1)
                            {
                                int investmentTypeID = group.Investments.FirstOrDefault(i => i.InvestmentTypeId == db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == group.AccountTypeId.Value).DefaultInvestmentTypeID.Value).InvestmentID;
                                decimal valueToapply; decimal balance;
                                balance = Utils.GetMemberTotalWithdrawalsBetweenDate(group.GroupId, dateToApply.AddMonths(-1), dateToApply);
                                //balance = Utils.GetGroupTotalWithdrawals(group.GroupId, dateToApply);
                                if (item.IsPercentage.Value)
                                {
                                    valueToapply = (item.ValueToApply.Value / 100) * balance;
                                }
                                else
                                {
                                    valueToapply = item.ValueToApply.Value;
                                }


                                AppliedAccountFeature aFeature = new AppliedAccountFeature();
                                aFeature.AccountNumber = group.AccountNumber;
                                aFeature.AccountTypeFeatureID = item.AccountFeatureID;
                                aFeature.AppliedValue = item.IsDeduction.Value ? valueToapply * -1 : valueToapply;
                                aFeature.CreatedBy = User.Identity.Name;
                                aFeature.CreatedDate = DateTime.Now;
                                aFeature.InvestmentID = investmentTypeID;
                                aFeature.Narration = "Account type feature manually applied.";
                                appliedFeatureHistory.AppliedAccountFeatures.Add(aFeature);

                                // db.AppliedAccountFeatures.InsertOnSubmit(aFeature);


                                if (item.IsDeduction.Value) //insert into appliedCharges Table
                                {
                                    AppliedDeduction aDeduction = new AppliedDeduction();
                                    aDeduction.CreatedBy = User.Identity.Name;
                                    aDeduction.CreatedDate = DateTime.Now;
                                    aDeduction.DeductionAmount = valueToapply;
                                    aDeduction.InvestmentID = aFeature.InvestmentID;
                                    aDeduction.Rate = item.ValueToApply;
                                    aDeduction.IsDeleted = false;
                                    aDeduction.Narration = "Service charge";
                                    aDeduction.AppliedFor = dateToApply;
                                    appliedFeatureHistory.AppliedDeductions.Add(aDeduction);
                                    //db.AppliedDeductions.InsertOnSubmit(aDeduction);
                                }

                                else //insert into Applied interest table
                                {
                                    AppliedInterest aInterest = new AppliedInterest();
                                    aInterest.CreatedBy = User.Identity.Name;
                                    aInterest.CreatedDate = DateTime.Now;
                                    aInterest.InterestAmount = valueToapply;
                                    aInterest.InvestmentID = aFeature.InvestmentID;
                                    aInterest.Rate = item.ValueToApply;
                                    aInterest.Narration = "Service charge";
                                    aInterest.AppliedFor = dateToApply;
                                    aInterest.IsDeleted = false;
                                    appliedFeatureHistory.AppliedInterests.Add(aInterest);
                                    //db.AppliedInterests.InsertOnSubmit(aInterest);
                                }
                            }
                            #endregion
                            break;
                    }
                    appliedFeatureHistory.AppliedDate = DateTime.Now;
                    appliedFeatureHistory.AppliedForDate = dateToApply;

                    if (appliedFeatureHistory.AppliedInterests.Count > 0 || appliedFeatureHistory.AppliedDeductions.Count > 0)
                    {
                        db.AppliedFeatureHistories.InsertOnSubmit(appliedFeatureHistory);
                        db.SubmitChanges();
                    }
                }
                 #endregion
            }
        }
    }
}