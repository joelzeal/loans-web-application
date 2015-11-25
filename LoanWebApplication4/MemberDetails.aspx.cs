using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class MemberDetails : System.Web.UI.Page
    {
        public Member CurrentMember
        {
            get
            {
                return (Member)Session["CurrentMember"];
            }
            set
            {
                Session["CurrentMember"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["mid"] != null)
                { 
                     CurrentMember = Utils.GetDataContext().Members.First<Member>(m => m.MemberId == Convert.ToInt32(Request.QueryString["mid"]));
                MemberFirstNameTextBox.Text = CurrentMember.MemberFirstName;
                MemberLastNameTextBox.Text = CurrentMember.MemberLastName;
                MemberBranchTextBox.Text = CurrentMember.MemberBranch;
                BalanceTextBox.Text = CurrentMember.Balance.Value.ToString();
                Image1.ImageUrl = "ImageDisplay.ashx?mid=" + CurrentMember.MemberId;
                }
            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            //MemberSqlDataSource.UpdateParameters[""].DefaultValue = ((FileUpload)FormView1.FindControl("FileUpload1")).FileBytes;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["mid"] != null)
            {
             
                 CurrentMember.MemberBranch = MemberBranchTextBox.Text;
              CurrentMember.MemberFirstName = MemberFirstNameTextBox.Text;
                CurrentMember.MemberLastName= MemberLastNameTextBox.Text ;
                CurrentMember.MemberBranch= MemberBranchTextBox.Text ;
                //CurrentMember.Balance.Value.ToString() = BalanceTextBox.Text;

               
                Utils.GetDataContext().SubmitChanges();
            }
            else {
                CurrentMember = new Member() { Balance = 0M};


                CurrentMember.MemberBranch = MemberBranchTextBox.Text;
                CurrentMember.MemberFirstName = MemberFirstNameTextBox.Text;
                CurrentMember.MemberLastName = MemberLastNameTextBox.Text;
                CurrentMember.MemberBranch = MemberBranchTextBox.Text;
                CurrentMember.MemberPhoto = FileUpload1.FileBytes;
                BalanceTextBox.Text = "00.00";

                Utils.GetDataContext().Members.InsertOnSubmit(CurrentMember);
                Utils.GetDataContext().SubmitChanges();


            }
            Response.Redirect("Members.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           // SaveFileDialog
        }
    }
}