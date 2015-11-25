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
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["mid"] != null)
                    {
                        loadMemberDetails();
                    }
                }
            }
            catch (Exception)
            {
                
            }
        }

        void loadMemberDetails()
        {
            CurrentMember = Utils.GetDataContext().Members.First<Member>(m => m.MemberId == Convert.ToInt32(Request.QueryString["mid"]));
            MemberFirstNameTextBox.Text = CurrentMember.MemberFirstName;
            MemberLastNameTextBox.Text = CurrentMember.MemberLastName;
            if (CurrentMember.BranchID.HasValue)
            {
                 cboBranches.SelectedValue =  CurrentMember.BranchID.Value.ToString();
            }
           
            //BalanceTextBox.Text = CurrentMember.Balance.Value.ToString();
            Image1.ImageUrl = "ImageDisplay.ashx?mid=" + CurrentMember.MemberId;
            Image2.ImageUrl = "SignatureImageDisplay.ashx?mid=" + CurrentMember.MemberId;
            Image3.ImageUrl = "IDPhotoImageDisplay.ashx?mid=" + CurrentMember.MemberId;
            //HyperLink1.NavigateUrl = "Withdrawal.aspx?mid=" + CurrentMember.MemberId;
            HyperLink2.NavigateUrl = "MemberInvestments.aspx?mid=" + CurrentMember.MemberId;
            // HyperLink3.NavigateUrl = "MemberStatement.aspx?mid=" + CurrentMember.MemberId;
            HyperLink4.NavigateUrl = "MemberLoans.aspx?mid=" + CurrentMember.MemberId;
            AccountTextBox.Text = CurrentMember.AccountNumber;
            MemberOtherNameTextBox.Text = CurrentMember.OtherName;
            MemberDOBNameTextBox.Text = CurrentMember.DOB.HasValue == true ? CurrentMember.DOB.Value.ToString("dd-MMM-yyyy") : "";
            MemberFaxTextBox0.Text = CurrentMember.Fax;
            MemberIDNumberTextBox.Text = CurrentMember.IdentityNumber;
            MemberMobileTextBox.Text = CurrentMember.Mobile;
            MemberResidentialTextBox.Text = CurrentMember.ResidentialAddress;
            MemberTelTextBox.Text = CurrentMember.Telephone;
            MemberBusinessLocationTextBox.Text = CurrentMember.BusinessAddress;
            MemberContactNumberTextBox.Text = CurrentMember.ContactPersonPhone;
            txtNextOfKin.Text = CurrentMember.NextOfKin;
            txtNextOfKinTelephone.Text = CurrentMember.NextOfKinTelephone;
            // cboAccountType.SelectedValue = CurrentMember.AccountTypeID.HasValue ? CurrentMember.AccountTypeID.Value.ToString() : ;
            if (CurrentMember.Gender != null && CurrentMember.Gender.Length > 0)
            {
                cboGender.SelectedValue = CurrentMember.Gender;
            }



            if (CurrentMember.AccountTypeID.HasValue)
            {
                cboAccountType.SelectedValue = CurrentMember.AccountTypeID.Value.ToString();
            }
            try
            {
                //cboAccountType.SelectedValue = CurrentMember.AccountTypeID.ToString();
            }
            catch (Exception)
            {
            }

            if (CurrentMember.IdentityTypeID.HasValue == true)
            {
                DropDownList1.SelectedValue = CurrentMember.IdentityTypeID.Value.ToString();
            }
            MemberContactPersonTextBox.Text = CurrentMember.ContactPerson;


            //disable account number edit
            AccountTextBox.Enabled = false;
            CheckBox1.Enabled = false;
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            //MemberSqlDataSource.UpdateParameters[""].DefaultValue = ((FileUpload)FormView1.FindControl("FileUpload1")).FileBytes;
        }


        void CreateMember()
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                if (Request.QueryString["mid"] != null) //editing
                {
                    Utils.IsAuthorized("Members", "Edit");

                    CurrentMember = db.Members.First<Member>(m => m.MemberId == Convert.ToInt32(Request.QueryString["mid"]));
                    CurrentMember.BranchID = Convert.ToInt32( cboBranches.SelectedValue);
                    CurrentMember.MemberFirstName = MemberFirstNameTextBox.Text;
                    CurrentMember.MemberLastName = MemberLastNameTextBox.Text;
                    //CurrentMember.MemberBranch = MemberBranchTextBox.Text;
                    //CurrentMember.Balance.Value.ToString() = BalanceTextBox.Text;
                    if (FileUpload1.HasFile)
                        CurrentMember.MemberPhoto = FileUpload1.FileBytes;
                    if (FileUpload2.HasFile)
                        CurrentMember.Signature = FileUpload2.FileBytes;
                    if (FileUpload3.HasFile)
                        CurrentMember.IDPhoto = FileUpload3.FileBytes;

                    CurrentMember.AccountNumber = AccountTextBox.Text;

                    CurrentMember.AccountNumber = AccountTextBox.Text;
                    CurrentMember.OtherName = MemberOtherNameTextBox.Text;
                    CurrentMember.DOB = Convert.ToDateTime(MemberDOBNameTextBox.Text);
                    CurrentMember.Fax = MemberFaxTextBox0.Text;
                    CurrentMember.IdentityNumber = MemberIDNumberTextBox.Text;
                    CurrentMember.Mobile = MemberMobileTextBox.Text;
                    CurrentMember.ResidentialAddress = MemberResidentialTextBox.Text;
                    CurrentMember.Telephone = MemberTelTextBox.Text;
                    CurrentMember.IdentityTypeID = Convert.ToInt32(DropDownList1.SelectedValue);
                    CurrentMember.ContactPerson = MemberContactPersonTextBox.Text;
                    CurrentMember.BusinessAddress = MemberBusinessLocationTextBox.Text;
                    CurrentMember.AccountTypeID = Convert.ToInt32(cboAccountType.SelectedValue);
                    CurrentMember.ContactPersonPhone = MemberContactNumberTextBox.Text;

                    CurrentMember.NextOfKin = txtNextOfKin.Text;
                    CurrentMember.NextOfKinTelephone = txtNextOfKinTelephone.Text;
                    CurrentMember.Gender = cboGender.SelectedValue;
                    //audit
                    Utils.logAction("Edit", CurrentMember);

                    //CurrentMember.AccountTypeId = Convert.ToInt32( cboAccountType.SelectedValue);
                    db.SubmitChanges();
                }
                else //inserting 
                {
                    Utils.IsAuthorized("Members", "Create");
                    CurrentMember = new Member() { Balance = 0M };


                    CurrentMember.BranchID = Convert.ToInt32(cboBranches.SelectedValue);
                    CurrentMember.MemberFirstName = MemberFirstNameTextBox.Text;
                    CurrentMember.MemberLastName = MemberLastNameTextBox.Text;
                    //CurrentMember.MemberBranch = MemberBranchTextBox.Text;
                    if (FileUpload1.HasFile)
                        CurrentMember.MemberPhoto = FileUpload1.FileBytes;
                    if (FileUpload2.HasFile)
                        CurrentMember.Signature = FileUpload2.FileBytes;
                    if (FileUpload3.HasFile)
                        CurrentMember.IDPhoto = FileUpload3.FileBytes;
                    // BalanceTextBox.Text = "00.00";
                    CurrentMember.AccountNumber = AccountTextBox.Text;

                    CurrentMember.AccountNumber = AccountTextBox.Text;
                    CurrentMember.OtherName = MemberOtherNameTextBox.Text;
                    CurrentMember.DOB = Convert.ToDateTime(MemberDOBNameTextBox.Text);
                    CurrentMember.Fax = MemberFaxTextBox0.Text;
                    CurrentMember.IdentityNumber = MemberIDNumberTextBox.Text;
                    CurrentMember.Mobile = MemberMobileTextBox.Text;
                    CurrentMember.ResidentialAddress = MemberResidentialTextBox.Text;
                    CurrentMember.Telephone = MemberTelTextBox.Text;
                    CurrentMember.IdentityTypeID = Convert.ToInt32(DropDownList1.SelectedValue);
                    CurrentMember.ContactPerson = MemberContactPersonTextBox.Text;
                    CurrentMember.BusinessAddress = MemberBusinessLocationTextBox.Text;
                    //CurrentMember.AccountTypeId = Convert.ToInt32(cboAccountType.SelectedValue);
                    CurrentMember.ContactPersonPhone = MemberContactNumberTextBox.Text;
                    CurrentMember.AccountTypeID = Convert.ToInt32(cboAccountType.SelectedValue);
                    CurrentMember.Gender = cboGender.SelectedValue;

                    CurrentMember.NextOfKin = txtNextOfKin.Text;
                    CurrentMember.NextOfKinTelephone = txtNextOfKinTelephone.Text;
                    CurrentMember.IsDeleted = false;

                    //GET account type
                    AccountType accType = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == CurrentMember.AccountTypeID);

                    Utils.createAccount(CurrentMember, accType, CheckBox1.Checked);
                 
                    //audit
                    Utils.logAction("Insert", CurrentMember);

                    //if (CheckBox1.Checked)
                    //{

                    //    CurrentMember.AccountNumber = Utils.GenerateAccountNumber(CurrentMember.MemberId);
                    //    db.SubmitChanges();
                    //}
                }
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            //create member
            CreateMember();

            if (Request.QueryString["RedirectUrl"] == null)
            {
                Response.Redirect("Members.aspx");
            }
            else
            {
                Response.Redirect(Request.QueryString["RedirectUrl"] + "?mid=" + CurrentMember.MemberId + "&isI=1");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           // SaveFileDialog
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                AccountTextBox.Enabled = false;
                AccountTextBox.BackColor = System.Drawing.Color.YellowGreen;
            }
            else
            {
                AccountTextBox.Enabled = true;
                AccountTextBox.BackColor = System.Drawing.Color.White;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            CreateMember();

            ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
        "<script>alert('Member details saved successfully')</script>");

            Response.Redirect("MemberDetails.aspx?mid=" + CurrentMember.MemberId);
        }
    }
}