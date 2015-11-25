using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class GroupInvestmentContribution : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                Session["CurrentUser_session"] = User.Identity.Name;
                DateWebUserControl1.DtSelectedDate = DateTime.Now;
            }
        }

        public decimal DepositAmount {

            get { return Convert.ToDecimal(Session["DepositAmount"]); }
            set { Session["DepositAmount"] = value; }
        
        }


        protected void WithdrawalHistorySqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //MemberSqlDataSource1.UpdateParameters["DepositAmount"].DefaultValue = DepositAmount.ToString();
            //MemberSqlDataSource1.Update();
        }

        protected void DepositAmountTextBox_TextChanged(object sender, EventArgs e)
        {
            //DepositAmount = Convert.ToDecimal(((TextBox)sender).Text);
        }

        protected void FormView2_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            FormView3.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("InvestmentStatement_Real.aspx?InvId=" + Request.QueryString["InvId"] + "&mid=" + Request.QueryString["mid"]);
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            //if (DropDownList1.SelectedIndex == 1 && chequeNumberTextBox.Text.Trim().Length == 0)
            //{
            //    lblChequeError.Visible = true;
            //    return;
            //}
            //else
            //{
            //    lblChequeError.Visible = false;
            //}

            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                //set current receipt number
                Parameter prm = db.Parameters.FirstOrDefault();

                //increase receipt number by one
                prm.ReceiptNumber++;
                Contribution _contribution = new Contribution()
                {
                    InvestmentId = Convert.ToInt32(Request.QueryString["InvId"]),
                    ContributionAmount = Convert.ToDecimal(ContributionAmountTextBox.Text.Trim()),
                    ContributionAmountInWords = Utils.ConvertMoneyToText(ContributionAmountTextBox.Text.Trim()),
                    ContributionBy = ContributionByTextBox.Text,
                    Description = "Investment deposit",
                    ReceiptNumber = prm.ReceiptNumber.Value.ToString().PadLeft(6, '0'),
                    RecievedBy = Session["CurrentUser_session"].ToString(), IsDeleted = false, 
                    CreatedDate = DateWebUserControl1.DtSelectedDate,
                    CreatedBy = HttpContext.Current.User.Identity.Name,
                   PaymentMethodId = PaymentMethodWebUserControl1.PaymentTypeID,
                   ChequeNumber = PaymentMethodWebUserControl1.ChequeNumber
                };

                //if (DropDownList1.SelectedIndex == 0)
                //{
                //    _contribution.ChequeNumber = chequeNumberTextBox.Text;
                //}


                db.Contributions.InsertOnSubmit(_contribution);
                db.SubmitChanges();

                //audit
                Utils.logAction("Insert", _contribution);

                Response.Redirect("ContributionReceipt_Group.aspx?cid=" + _contribution.ContributionId.ToString() + "&gid=" + _contribution.Investment.GroupId);
            }
        }

        protected void WithdrawalHistorySqlDataSource1_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Deposit", "Delete");
        }

    }
}