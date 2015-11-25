using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class LoanRepayment1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                lblLoanBalance.Text = GetLoanBalance().ToString("C");

                var loanSchedules = Utils.GetDataContext().RepaymentSchedules.Where(l => l.LoanId == Convert.ToInt32(Request.QueryString["lid"]));
                FriendGridView.DataSource = loanSchedules;
                FriendGridView.DataBind();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("SearchPage.aspx?str=" + txtSearch.Text);
        }

        protected void NavigationMenu_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        //protected void FriendGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType != DataControlRowType.DataRow)
        //        return;

        //    // On MouseOver set the cursor to hand and save the backcolor in a field and set it to #bbbbbb
        //    e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';"
        //    + "this.originalBackgroundColor=this.style.backgroundColor;"
        //    + "this.style.backgroundColor='#bbbbbb';";

        //    // On MouseOut set the backcolor to the value it had before
        //    e.Row.Attributes["onmouseout"] =
        //    "this.style.backgroundColor=this.originalBackgroundColor;";

        //    // On Click send a SelectEvent so that the SelectedIndexChanged-EventHandler gets called
        //    e.Row.Attributes["onclick"] =
        //    ClientScript.GetPostBackClientHyperlink(FriendGridView, "Select$" + e.Row.RowIndex);
        //}

        //protected void FriendGridView_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    // assign firstname only
        //    txtFriend.Text = FriendGridView.SelectedRow != null ? Server.HtmlDecode(
        //                                                            FriendGridView.SelectedRow.Cells[1].Text) : "";
        //}

        protected void RepaymentSqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblLoanBalance.Text = GetLoanBalance().ToString("C");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        decimal GetLoanBalance()
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                try
                {
                    decimal totalRepayment = 0;
                    totalRepayment = db.Loans.FirstOrDefault(l => l.LoanID == Convert.ToInt32(Request.QueryString["lid"])).Repayments.Sum(r => r.RepaymentAmount).Value;
                    Loan _loan = db.Loans.FirstOrDefault(l => l.LoanID == Convert.ToInt32(Request.QueryString["lid"]));
                    lblTotalRepayment.Text = totalRepayment.ToString("C");

                    if (_loan.Amount.Value - totalRepayment <= 0)
                    {
                        _loan.IsPaidup = true;
                        db.SubmitChanges();

                        // DivMemberDetails.Style.Clear();// = "DataSectionGreen";
                        // DivMemberDetails.Attributes["class"] = "DataSectionGreen";


                    }

                    return _loan.Amount.Value - totalRepayment;
                }
                catch (Exception)
                {
                    return 0;
                }
            }
        }

        protected void FriendGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             if (e.Row.RowType != DataControlRowType.DataRow)
                 return;

             // On MouseOver set the cursor to hand and save the backcolor in a field and set it to #bbbbbb
             e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';"
             + "this.originalBackgroundColor=this.style.backgroundColor;"
             + "this.style.backgroundColor='#bbbbbb';";

             // On MouseOut set the backcolor to the value it had before
             e.Row.Attributes["onmouseout"] =
             "this.style.backgroundColor=this.originalBackgroundColor;";

             // On Click send a SelectEvent so that the SelectedIndexChanged-EventHandler gets called
             e.Row.Attributes["onclick"] =
             ClientScript.GetPostBackClientHyperlink(FriendGridView, "Select$" + e.Row.RowIndex);
             //HiddenField1.Value = e.Row.RowIndex.ToString();
        }

        protected void FriendGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
             //assign firstname only
               // txtFriend.Text = FriendGridView.SelectedRow != null ? Server.HtmlDecode(
                                                                   //     FriendGridView.SelectedRow.Cells[1].Text) : "";
            txtFriend.Text = (FriendGridView.Rows[FriendGridView.SelectedIndex].Cells[0].Controls[1] as System.Web.UI.WebControls.Label).Text;// HiddenField1.Value;
        }
    }
}