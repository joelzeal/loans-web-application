using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class MemberGroupDetails : System.Web.UI.Page
    {
       
        FinanceManagerDataContext db = new FinanceManagerDataContext();
        public LoanGroup CurrentLoanGroup
        {
            get
            {
                if (Session["CurrentLoanGroup"] == null)
                {
                    Session["CurrentLoanGroup"] = new LoanGroup();
                }
                return (LoanGroup)Session["CurrentLoanGroup"];
            }
            set
            {
                Session["CurrentLoanGroup"] = value;
            }
        }

        public List<MembersView> GroupMembers
        {
            get
            {
                if (Session["GroupMembers"] == null)
                    Session["GroupMembers"] = new List<MembersView>();
                return (List<MembersView>)Session["GroupMembers"];
            }
            set
            {
                Session["GroupMembers"] = value;
            }
        }

        public List<MembersView> NonGroupMembers
        {
            get
            {
                if (Session["NonGroupMembers"] == null)
                    Session["NonGroupMembers"] = new List<MembersView>();

                return (List<MembersView>)Session["NonGroupMembers"];
            }
            set
            {
                Session["NonGroupMembers"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["GroupId"] != null)
                {
                    CurrentLoanGroup = db.LoanGroups.FirstOrDefault(g => g.GroupId == Convert.ToInt32(Request.QueryString["GroupId"]));


                    txtGroupName.Text = CurrentLoanGroup.GroupName.ToString();
                    txtDecription.Text = CurrentLoanGroup.Description.ToString();
                    txtAccountNumber.Text = CurrentLoanGroup.AccountNumber;
                    cboBranches.SelectedValue = CurrentLoanGroup.BranchID.ToString();


                    GetAllNonGroupMembers(CurrentLoanGroup.GroupId);
                    GetGroupMembers(CurrentLoanGroup.GroupId);

                    lstMembers.DataSource = GroupMembers;
                    lstMembers.DataTextField = "Member";
                    lstMembers.DataValueField = "MemberId";
                    lstMembers.DataBind();

                    lstNonMembers.DataSource = NonGroupMembers;
                    lstNonMembers.DataTextField = "Member";
                    lstNonMembers.DataValueField = "MemberId";
                    lstNonMembers.DataBind();

                    //HyperLink1.NavigateUrl = "GroupWithdrawal.aspx?gid=" + CurrentLoanGroup.GroupId;
                    //HyperLink2.NavigateUrl = "GroupDeposit.aspx?gid=" + CurrentLoanGroup.GroupId; 
                    InvestmentHyperLink.NavigateUrl = "GroupInvestments.aspx?gid=" + CurrentLoanGroup.GroupId;
                    LoanHyperLink.NavigateUrl = "GroupLoansLoans.aspx?gid=" + CurrentLoanGroup.GroupId;

                    try
                    {
                        DropDownList1.SelectedValue = CurrentLoanGroup.AccountTypeId.ToString();
                    }
                    catch (Exception)
                    {
                        
                    }
                   
                }
                else
                {
                    //get the current group id when a group id is passed.
                    //if (Request.QueryString["GroupId"] != null)
                    //    CurrentLoanGroup = db.LoanGroups.FirstOrDefault(g => g.GroupId == Convert.ToInt32(Request.QueryString["GroupId"]));
                    CurrentLoanGroup = new LoanGroup();
                    GroupMembers = new List<MembersView>();

                    GetAllNonGroupMembers(CurrentLoanGroup.GroupId);
                    GetGroupMembers(CurrentLoanGroup.GroupId);

                    lstMembers.DataSource = GroupMembers.OrderBy( g => g.Member).ToList();
                    lstMembers.DataTextField = "Member";
                    lstMembers.DataValueField = "MemberId";
                    lstMembers.DataBind();

                    lstNonMembers.DataSource = NonGroupMembers.OrderBy( g => g.Member).ToList();
                    lstNonMembers.DataTextField = "Member";
                    lstNonMembers.DataValueField = "MemberId";
                    lstNonMembers.DataBind();
                }
            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            //MemberSqlDataSource.UpdateParameters[""].DefaultValue = ((FileUpload)FormView1.FindControl("FileUpload1")).FileBytes;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Request.QueryString["GroupId"] != null)
            {
                CurrentLoanGroup = db.LoanGroups.FirstOrDefault(g => g.GroupId == CurrentLoanGroup.GroupId); // fetch CurrentGroup again fo update
                CurrentLoanGroup.GroupName = txtGroupName.Text;
                CurrentLoanGroup.Description = txtDecription.Text;
                CurrentLoanGroup.AccountNumber = txtAccountNumber.Text;
                CurrentLoanGroup.AccountTypeId = Convert.ToInt32(DropDownList1.SelectedValue);
                CurrentLoanGroup.BranchID = Convert.ToInt32( cboBranches.SelectedValue);


                foreach (MembersView item in GroupMembers)
                {
                    if (!CurrentLoanGroup.GroupMembers.Any(g => g.MemberID == item.MemberId))
                    {
                        CurrentLoanGroup.GroupMembers.Add(new GroupMember() { MemberID = item.MemberId });
                    }
                }
                db.SubmitChanges();
                // Utils.GetDataContext().SubmitChanges();
            }
            else
            {
                CurrentLoanGroup.GroupName = txtGroupName.Text;
                CurrentLoanGroup.Description = txtDecription.Text;
                CurrentLoanGroup.AccountNumber = txtAccountNumber.Text;
                CurrentLoanGroup.AccountTypeId = Convert.ToInt32(DropDownList1.SelectedValue);
                CurrentLoanGroup.BranchID = Convert.ToInt32(cboBranches.SelectedValue);
                foreach (MembersView item in GroupMembers)
                {
                    if (!CurrentLoanGroup.GroupMembers.Any(g => g.MemberID == item.MemberId))
                    {
                        CurrentLoanGroup.GroupMembers.Add(new GroupMember() { MemberID = item.MemberId });
                    }
                }
                CurrentLoanGroup.IsDeleted = false;
                //db.LoanGroups.InsertOnSubmit(CurrentLoanGroup);


                //GET account type
                AccountType accType = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == CurrentLoanGroup.AccountTypeId);

                Utils.createAccountForGroup(CurrentLoanGroup, accType, CheckBox1.Checked);
                db.SubmitChanges();

                //audit
                Utils.logAction("Insert", CurrentLoanGroup);


                //Utils.GetDataContext().LoanGroups.InsertOnSubmit(CurrentLoanGroup);
                //Utils.GetDataContext().SubmitChanges();


                //if (CheckBox1.Checked)
                //{
                //    CurrentLoanGroup.AccountNumber = Utils.GenerateAccountNumber(CurrentLoanGroup.GroupId);
                //    db.SubmitChanges();
                //}
            }
            if (Request.QueryString["RedirectUrl"] == null)
            {
               //redirect to goups
                Response.Redirect("Groups.aspx");
            }
            else
            {
                Response.Redirect(Request.QueryString["RedirectUrl"] + "?GroupId=" + CurrentLoanGroup.GroupId);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // SaveFileDialog
        }




        //get all group members
        List<MembersView> GetGroupMembers(int? groupID = null)
        {
            List<MembersView> _groupMembers = new List<MembersView>();
            if (groupID == null || groupID == 0)//group not saved yet
            {
                return GroupMembers;
            }
            else
            {
                LoanGroup _loangroup = db.LoanGroups.FirstOrDefault<LoanGroup>(l => l.GroupId == groupID);
                foreach (GroupMember item in _loangroup.GroupMembers.OrderBy(m => m.Member.MemberFirstName))
                {
                    _groupMembers.Add(new MembersView() { Member = ConcatMemberName(item.Member), MemberId = item.MemberID.Value });
                }
                GroupMembers = _groupMembers;
                return _groupMembers;
            }
        }


        //get all non group members
        List<MembersView> GetAllNonGroupMembers(int? groupID = null)
        {
            List<MembersView> _groupMembers = new List<MembersView>();
            if (groupID == null || groupID == 0)//group not saved yet
            {
                foreach (MembersView item in db.MembersViews)
                {
                    if (!GroupMembers.Any(g => g.MemberId == item.MemberId))
                    {
                        _groupMembers.Add(item);
                    }
                }
                NonGroupMembers = _groupMembers;
                return _groupMembers.OrderBy(g => g.Member).ToList();
            }
            else
            {
                //LoanGroup _loangroup = Utils.GetDataContext().LoanGroups.FirstOrDefault<LoanGroup>(l => l.GroupId = groupID);
                foreach (MembersView item in Utils.GetDataContext().MembersViews)// CurrentLoanGroup.GroupMembers)
                {
                    if (CurrentLoanGroup.GroupMembers.Any(m => m.MemberID == item.MemberId) == false)
                    { 
                        _groupMembers.Add(new MembersView() { Member = item.Member, MemberId = item.MemberId });
                    }
                }
                NonGroupMembers = _groupMembers;
                return _groupMembers.OrderBy(g => g.Member).ToList();
            }
        }

        string ConcatMemberName(Member member)
        {
            return member.MemberFirstName + " " + member.OtherName + " " + member.MemberLastName;
        }


        //add member
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int _selectedMEmber = Convert.ToInt32(lstNonMembers.SelectedValue);
                MembersView mv = NonGroupMembers.FirstOrDefault(m => m.MemberId == _selectedMEmber);
                NonGroupMembers.Remove(mv);



                GroupMembers.Add(mv);
                lstMembers.DataSource = GroupMembers;
                lstMembers.DataTextField = "Member";
                lstMembers.DataValueField = "MemberId";
                lstMembers.DataBind();

                lstNonMembers.DataSource = NonGroupMembers;
                lstNonMembers.DataTextField = "Member";
                lstNonMembers.DataValueField = "MemberId";
                lstNonMembers.DataBind();
            }
            catch (Exception)
            {

            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int _selectedMEmber = Convert.ToInt32(lstMembers.SelectedValue);
                MembersView mv = GroupMembers.FirstOrDefault(m => m.MemberId == _selectedMEmber);
                GroupMembers.Remove(mv);



                NonGroupMembers.Add(mv);
                lstMembers.DataSource = GroupMembers;
                lstMembers.DataTextField = "Member";
                lstMembers.DataValueField = "MemberId";
                lstMembers.DataBind();

                lstNonMembers.DataSource = NonGroupMembers;
                lstNonMembers.DataTextField = "Member";
                lstNonMembers.DataValueField = "MemberId";
                lstNonMembers.DataBind();
            }
            catch (Exception)
            {

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["RedirectUrl"] == null)
            {
                Response.Redirect("groups.aspx");
            }
            else
            {
                if (CurrentLoanGroup.GroupId == 0)
                    Response.Redirect("groups.aspx");

                Response.Redirect(Request.QueryString["RedirectUrl"] + "?GroupId=" + CurrentLoanGroup.GroupId);
            }
        }


        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                txtAccountNumber.Enabled = false;
                txtAccountNumber.BackColor = System.Drawing.Color.YellowGreen;
            }
            else
            {
                txtAccountNumber.Enabled = true;
                txtAccountNumber.BackColor = System.Drawing.Color.White;
            }
        }

    }
}