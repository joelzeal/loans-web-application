using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class ApplyAccountTypeFeatures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("ApplyAccountTypeFeature", "Open");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //check all the items in the grid
            foreach (GridViewRow item in GridView1.Rows)
            {
                (item.FindControl("CheckBox1") as CheckBox).Checked = true;
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            //check all the items in the grid
            foreach (GridViewRow item in GridView1.Rows)
            {
                (item.FindControl("CheckBox1") as CheckBox).Checked = false;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadMembers();
        }

        void loadMembers()
        { 
               List<vwMembersWithInvestment> membersWithInvestments = new List<vwMembersWithInvestment>();
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                AccountType accType = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == Convert.ToInt32(DropDownList1.SelectedValue));
                if (chkOnlyMembersOlderThanAMonth.Checked )
                {
                    membersWithInvestments.AddRange(db.vwMembersWithInvestments.Where(a => a.AccountTypeID == Convert.ToInt32(DropDownList1.SelectedValue) && (DateTime.Today.Date - a.CreatedDate.Value.AddMonths(1)).Days >= 30));
                    
                }
                else
                {
                    membersWithInvestments.AddRange(db.vwMembersWithInvestments.Where(a => a.AccountTypeID == Convert.ToInt32(DropDownList1.SelectedValue)));
                }
            }
           GridView1.DataSource = membersWithInvestments;
            GridView1.DataBind();
        }


        protected void vwMembersWithInvestmentsSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem() { Value = "-1", Text = "-----Select Account Type------" });
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //List<FailMessage> failMessages = new List<FailMessage>();
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                AccountType accType = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == Convert.ToInt32(DropDownList1.SelectedValue));

                //clear fail messages
                db.FailMessages.DeleteAllOnSubmit(db.FailMessages);
                db.SubmitChanges();

                foreach (AccountTypeFeature item in accType.AccountTypeFeatures)
                {
                    AppliedFeatureHistory _appHistory = item.AppliedFeatureHistories.LastOrDefault();
                    if (_appHistory != null)
                    {
                        if (item.CalculationFrequencyID.Value == 1) //monthly
                        {
                            //AppliedFeatureHistory _appHistory = item.AppliedFeatureHistories.LastOrDefault();
                            DateTime tempDateTime = _appHistory.AppliedDate.Value.AddMonths(1);
                            if (tempDateTime > DateTime.Today)
                            {
                                db.FailMessages.InsertOnSubmit(new FailMessage() { FailMessageId = Guid.NewGuid(), Message = "Monthly feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than a month. This feature was skipped." });
                                db.SubmitChanges();

                                continue;
                            }
                        }
                        else if (item.CalculationFrequencyID.Value == 2) //annually
                        {
                            DateTime tempDateTime = _appHistory.AppliedDate.Value.AddYears(1);
                            if (tempDateTime > DateTime.Today)
                            {
                                db.FailMessages.InsertOnSubmit(new FailMessage() { Message = "Annual feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than a year. This feature was skipped." });
                                db.SubmitChanges();
                                continue;
                            }
                        }
                        else if (item.CalculationFrequencyID.Value == 3) //custom
                        {
                            DateTime tempDateTime = _appHistory.AppliedDate.Value.AddDays(item.CustomCalculationFreqNumberOfDays.Value);
                            if (_appHistory.AppliedDate.Value.AddDays(item.CustomCalculationFreqNumberOfDays.Value) > DateTime.Today)
                            {
                                db.FailMessages.InsertOnSubmit(new FailMessage() { Message = "Custom feature was last applied on " + item.AppliedFeatureHistories.LastOrDefault().AppliedDate.Value + " which is less than " + item.CustomCalculationFreqNumberOfDays.Value + " day(s). This feature was skipped." });
                                db.SubmitChanges();
                                continue;
                            }
                        }
                    }

                    AppliedFeatureHistory appliedFeatureHistory = new AppliedFeatureHistory();
                    appliedFeatureHistory.AppliedForDate = DateTime.Now;
                    appliedFeatureHistory.AccountTypeFeatureID = item.AccountFeatureID;
                    appliedFeatureHistory.ActionInitiatedBy = "Manually run";
                    appliedFeatureHistory.AppliedBy = User.Identity.Name;
                    switch (item.CalculateOn)
                    {
                        case 1:

                            #region MemberRegion
                            List<Member> accountMembers = new List<Member>();
                            if (chkOnlyMembersOlderThanAMonth.Checked) //load only members that a month old in the system
                            {
                                accountMembers.AddRange(accType.Members.Where(m => m.IsDeleted == false && (DateTime.Today.Date - m.CreatedDate.Value.AddMonths(1)).Days >= 30 ));
                            }
                            else //everybody
                            {
                                accountMembers.AddRange(accType.Members);
                            }

                            foreach (Member member in accountMembers)
                            {
                                Investment tempInv = member.Investments.FirstOrDefault(i => i.AccountTypeId == member.AccountType.AccountTypeId);

                                if (tempInv == null) //for some reason member doesn't have an investment. Add an investment
                                {
                                    continue;
                                    //tempInv = new Investment()
                                    //{
                                    //    AccountTypeId = item.AccountTypeID,
                                    //    CreatedBy = User.Identity.Name,
                                    //    CreatedDate = DateTime.Now,
                                    //    InvestmentTypeId = 1,
                                    //    IsActive = true,
                                    //    IsDeleted = false
                                    //};

                                    //member.Investments.Add(tempInv);
                                    //db.SubmitChanges();
                                }

                                int investmentID = tempInv.InvestmentID;


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
                                    aDeduction.IsDeleted = false;
                                    aDeduction.Narration = "Service charge";
                                    aDeduction.AppliedFor = DateTime.Now; 

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
                                    aInterest.AppliedFor = DateTime.Now;
                                    appliedFeatureHistory.AppliedInterests.Add(aInterest);
                                    // db.AppliedInterests.InsertOnSubmit(aInterest);
                                }

                            }
                            #endregion
                            #region groupRegion
                            //run on group

                            List<LoanGroup> accountGroups = new List<LoanGroup>();
                            if (chkOnlyMembersOlderThanAMonth.Checked) //load only members that a month old in the system
                            {
                                accountGroups.AddRange(accType.LoanGroups.Where(m => m.IsDeleted == false | m.IsDeleted == null && m.CreatedDate.Value.AddMonths(1) >= DateTime.Today.Date));
                            }
                            else //everybody
                            {
                                accountGroups.AddRange(accType.LoanGroups.Where(m => m.IsDeleted == false | m.IsDeleted == null));
                            }


                            foreach (LoanGroup group in accountGroups)
                            {
                                int investmentTypeID = group.Investments.FirstOrDefault(i => i.InvestmentTypeId == db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == group.AccountTypeId.Value).DefaultInvestmentTypeID.Value).InvestmentID;
                                decimal valueToapply; decimal balance;
                                balance = Utils.GetGroupBalance(group.GroupId, DateTime.Today.Date);
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
                                 aDeduction.IsDeleted = false;
                                    aDeduction.Narration = "Service charge";
                                    aDeduction.AppliedFor = DateTime.Now; 
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
                                    aInterest.IsDeleted = false;
                                    aInterest.Narration = "Applied interest";
                                    aInterest.AppliedFor = DateTime.Now;
                                    appliedFeatureHistory.AppliedInterests.Add(aInterest);
                                    //db.AppliedInterests.InsertOnSubmit(aInterest);
                                }

                            }
                            #endregion
                            break;

                        case 4:
                            #region MemberRegion

                             List<Member> accountMembers1 = new List<Member>();
                            if (chkOnlyMembersOlderThanAMonth.Checked) //load only members that a month old in the system
                            {
                                accountMembers1.AddRange(accType.Members.Where(m => m.IsDeleted == false && (DateTime.Today.Date - m.CreatedDate.Value.AddMonths(1)).Days >= 30 ));
                            }
                            else //everybody
                            {
                                accountMembers1.AddRange(accType.Members);
                            }


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
                                //totalWithdrawal = Utils.GetMemberTotalWithdrawals(member.MemberId, DateTime.Today.Date);

                                totalWithdrawal = Utils.GetMemberTotalWithdrawalsBetweenDate(member.MemberId, DateTime.Now.Date.AddMonths(-1), DateTime.Now.Date);
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
                                    aDeduction.AppliedFor = DateTime.Now; 
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
                                    aInterest.Narration = "Applied interest";
                                    aInterest.AppliedFor = DateTime.Now;
                                    appliedFeatureHistory.AppliedInterests.Add(aInterest);

                                    //db.AppliedDeductions.InsertOnSubmit(aDeduction);
                                }

                            }
                            #endregion
                            #region groupRegion
                            //run on group
                             List<LoanGroup> accountGroups1 = new List<LoanGroup>();
                            if (chkOnlyMembersOlderThanAMonth.Checked) //load only members that a month old in the system
                            {
                                accountGroups1.AddRange(accType.LoanGroups.Where(m => m.IsDeleted == false | m.IsDeleted == null && m.CreatedDate.Value.AddMonths(1) >= DateTime.Today.Date));
                            }
                            else //everybody
                            {
                                accountGroups1.AddRange(accType.LoanGroups.Where(m => m.IsDeleted == false | m.IsDeleted == null));
                            }
                            foreach (LoanGroup group in accountGroups1)
                            {
                                int investmentTypeID = group.Investments.FirstOrDefault(i => i.InvestmentTypeId == db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == group.AccountTypeId.Value).DefaultInvestmentTypeID.Value).InvestmentID;
                                decimal valueToapply; decimal balance;
                                //balance = Utils.GetGroupTotalWithdrawals(group.GroupId, DateTime.Today.Date);

                                balance = Utils.GetMemberTotalWithdrawalsBetweenDate(group.GroupId, DateTime.Now.Date.AddMonths(-1), DateTime.Now.Date);
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
                                    aDeduction.AppliedFor = DateTime.Now; 
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
                                    aInterest.IsDeleted = false;
                                    aInterest.Narration = "Applied interest";
                                    aInterest.AppliedFor = DateTime.Now;
                                    appliedFeatureHistory.AppliedInterests.Add(aInterest);
                                    //db.AppliedInterests.InsertOnSubmit(aInterest);
                                }

                            }
                            #endregion
                            break;
                    }
                    appliedFeatureHistory.AppliedDate = DateTime.Now;
                    appliedFeatureHistory.AppliedForDate= DateTime.Now;
                    db.AppliedFeatureHistories.InsertOnSubmit(appliedFeatureHistory);
                    db.SubmitChanges();

                }

            }
            Response.Redirect("AppliedFeaturesComplete.aspx");
        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count > 0)
            {
                Button1.Enabled = true;
            }
            else
            {
                Button1.Enabled = false;
            }
        }

        protected void chkOnlyMembersOlderThanAMonth_CheckedChanged(object sender, EventArgs e)
        {
            loadMembers();
        }

    }
}