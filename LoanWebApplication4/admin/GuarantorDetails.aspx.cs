using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class GuarantorDetails : System.Web.UI.Page
    {
        public Guarantor CurrentGuarantorber
        {
            get
            {
                return (Guarantor)Session["CurrentGuarantor"];
            }
            set
            {
                Session["CurrentGuarantor"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           // Utils.IsAuthorized("Guarantors", "Open");


            if (!IsPostBack)
            {
                if (Request.QueryString["mid"] != null)
                {
                    //CurrentMember = Utils.GetDataContext().Members.First<Member>(m => m.MemberId == Convert.ToInt32(Request.QueryString["mid"]));
                    //MemberFirstNameTextBox.Text = CurrentMember.MemberFirstName;
                    //MemberLastNameTextBox.Text = CurrentMember.MemberLastName;
                    ////MemberBranchTextBox.Text = CurrentMember.MemberBranch;
                    ////BalanceTextBox.Text = CurrentMember.Balance.Value.ToString();
                    //Image1.ImageUrl = "ImageDisplay.ashx?mid=" + CurrentMember.MemberId;
                    ////HyperLink1.NavigateUrl = "Withdrawal.aspx?mid=" + CurrentMember.MemberId;
                    ////HyperLink2.NavigateUrl = "Deposit.aspx?mid=" + CurrentMember.MemberId;
                    ////HyperLink3.NavigateUrl = "MemberStatement.aspx?mid=" + CurrentMember.MemberId;
                    //HyperLink4.NavigateUrl = "MemberLoans.aspx?mid=" + CurrentMember.MemberId;
                    ////AccountTextBox.Text = CurrentMember.AccountNumber;
                    //MemberOtherNameTextBox.Text = CurrentMember.OtherName;
                    //MemberDOBNameTextBox.Text = CurrentMember.DOB.HasValue == true ? CurrentMember.DOB.Value.ToString("dd/MM/yyyy") : "";
                    //MemberFaxTextBox0.Text = CurrentMember.Fax;
                    //MemberIDNumberTextBox.Text = CurrentMember.IdentityNumber;
                    //MemberMobileTextBox.Text = CurrentMember.Mobile;
                    //MemberResidentialTextBox.Text = CurrentMember.ResidentialAddress;
                    //MemberTelTextBox.Text = CurrentMember.Telephone;
                    //if(CurrentMember.IdentityTypeID.HasValue == true)
                    //{
                    //    DropDownList1.SelectedValue = CurrentMember.IdentityTypeID.Value.ToString() ;
                    //}
                    //MemberContactPersonTextBox.Text = CurrentMember.ContactPerson;
                }
            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            //MemberSqlDataSource.UpdateParameters[""].DefaultValue = ((FileUpload)FormView1.FindControl("FileUpload1")).FileBytes;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

                Utils.IsAuthorized("Guarantors", "Create");
                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    CurrentGuarantorber = new Guarantor()
                    {
                        GuarantorFirstName = MemberFirstNameTextBox.Text,
                        GuarantorLastName = MemberLastNameTextBox.Text,
                        Address = MemberResidentialTextBox.Text,
                        BusinessAddress = MemberBusinessLocationTextBox.Text,
                        CreatedBy = HttpContext.Current.User.Identity.Name,
                       // DOB = MemberDOBNameTextBox.Text,
                        Telephone = MemberTelTextBox.Text,
                        IdentityNumber = MemberIDNumberTextBox.Text,
                        IdentityTypeID = Convert.ToInt32(DropDownList1.SelectedValue)
                    };

                    CurrentGuarantorber.GuarantorPhoto = FileUpload1.FileBytes;
//DateWebUserControl1.DtSelectedDate;
                    CurrentGuarantorber.DOB = DateWebUserControl1.DtSelectedDate;// Convert.ToDateTime(MemberDOBNameTextBox.Text);
                    CurrentGuarantorber.Fax = MemberFaxTextBox0.Text;
                    CurrentGuarantorber.IdentityNumber = MemberIDNumberTextBox.Text;
                    CurrentGuarantorber.Mobile = MemberMobileTextBox.Text;
                    CurrentGuarantorber.ResidentialAddress = MemberResidentialTextBox.Text;
                    CurrentGuarantorber.Telephone = MemberTelTextBox.Text;
                    CurrentGuarantorber.IdentityTypeID = Convert.ToInt32(DropDownList1.SelectedValue);
                    // CurrentGuarantorber.ContactPerson = MemberContactPersonTextBox.Text;

                    db.Guarantors.InsertOnSubmit(CurrentGuarantorber);
                    db.SubmitChanges();

                    txtResult.Text = CurrentGuarantorber.GuarantorId.ToString();

                    string url = "";
                    if (Request.QueryString["lid"] != null)
                    {
                        url = "&lid=" + Request.QueryString["lid"];
                    }
                    Response.Redirect(Request.QueryString["redirectUrl"] + "&mid=" + Request.QueryString["mid"] + url + "&gtId=" + CurrentGuarantorber.GuarantorId);
                    //ClientScript.RegisterStartupScript(typeof(Page), "SymbolError","GetRowValue(" + CurrentGuarantorber.GuarantorId + ");", true);
                }
            //}
               
            //}
            //if (Request.QueryString["RedirectUrl"] == null)
            //{
            //    Response.Redirect("Members.aspx");
            //}
            //else
            //{
            //    Response.Redirect(Request.QueryString["RedirectUrl"]+"?mid=" + CurrentMember.MemberId);
            //}
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           // SaveFileDialog
        }
    }
}