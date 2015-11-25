using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class LoanRepaymentWithInvestment_Group : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //  string str = HttpContext.Current.Request.UrlReferrer.ToString();
                if (!IsPostBack)
                {
                    Utils.CurrentUrl = HttpContext.Current.Request.UrlReferrer.ToString();
                    if (Request.QueryString["ra"] != null)
                    {
                        txtRepaymentAmount.Text = Request.QueryString["ra"];
                    }
                    //var _investments = Utils.GetDataContext().RepaymentSchedules.Where(l => l.LoanId == Convert.ToInt32(Request.QueryString["lid"]) && Convert.ToBoolean(l.IsPaymentMade) == false).OrderBy(r => r.RepaymentDate);
                    //FriendGridView.DataSource = loanSchedules;
                    //FriendGridView.DataBind();
                }
            }
            catch (Exception)
            {
                
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
            txtInvestment.Text = (FriendGridView.Rows[FriendGridView.SelectedIndex].Cells[3].Controls[1] as System.Web.UI.WebControls.Label).Text;// HiddenField1.Value;
            //RepaymentAmountTextBox.Text = RemoveCurrencySymbolFromText((FriendGridView.Rows[FriendGridView.SelectedIndex].Cells[2].Controls[1] as System.Web.UI.WebControls.Label).Text);
            InvestmentHiddenField.Value = FriendGridView.SelectedDataKey.Value.ToString();
        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (txtInvestment.Text.Length > 0 )
            {
                if (Convert.ToDecimal(txtRepaymentAmount.Text) > Convert.ToDecimal(txtInvestment.Text))
                {
                    errorPanel.Visible = true;
                    lblError.Text = "Repayment amount cannot be greaated the balance of the selected investment.";
                }
                else
                {
                    //CustomValidator1.IsValid = true;
                    errorPanel.Visible = false;
                    Response.Redirect(Utils.CurrentUrl + "&invID=" + InvestmentHiddenField.Value + "&ra=" + txtRepaymentAmount.Text);
                }
            }
            else
            {
                Response.Redirect(Utils.CurrentUrl);
            }
        }

        //protected void cboInvestments_DataBound(object sender, EventArgs e)
        //{
        //    if (cboInvestments.Items.Count == 0)
        //    {
        //        cboInvestments.Visible = false;
        //        Label1.Visible = true;
        //        LinkButton1.Text = "Go back";
        //        CancelLinkButton.Visible = false;
        //    }
        //    else
        //    {
        //        cboInvestments.Visible = true;
        //        Label1.Visible = false;
        //        CancelLinkButton.Visible = true;
        //    }
        //}

        protected void CancelLinkButton_Click(object sender, EventArgs e)
        {
            //if (cboInvestments.SelectedIndex > -1)
            //{
            Response.Redirect(Utils.CurrentUrl);//+ "&invID=" + cboInvestments.SelectedValue);
            //}
        }

        protected void FriendGridView_DataBound(object sender, EventArgs e)
        {
            if (FriendGridView.Rows.Count > 0)
            {
                Label1.Visible = false;
            }
            else
            {
                Label1.Visible = true;
            }
           // Label1.Visible =
        }
    }
}