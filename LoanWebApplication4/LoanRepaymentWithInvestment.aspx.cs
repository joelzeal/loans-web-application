using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class LoanRepaymentWithInvestment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //  string str = HttpContext.Current.Request.UrlReferrer.ToString();
            if (!IsPostBack)
            {
                Utils.CurrentUrl = HttpContext.Current.Request.UrlReferrer.ToString();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (cboInvestments.SelectedIndex > -1)
            {
                Response.Redirect(Utils.CurrentUrl + "&invID=" + cboInvestments.SelectedValue);
            }
            else
            {
                Response.Redirect(Utils.CurrentUrl);
            }

        }

        protected void cboInvestments_DataBound(object sender, EventArgs e)
        {
            if (cboInvestments.Items.Count == 0)
            {
                cboInvestments.Visible = false;
                Label1.Visible = true;
                LinkButton1.Text = "Go back";
                CancelLinkButton.Visible = false;
            }
            else
            {
                cboInvestments.Visible = true;
                Label1.Visible = false;
                CancelLinkButton.Visible = true;
            }
        }

        protected void CancelLinkButton_Click(object sender, EventArgs e)
        {
            if (cboInvestments.SelectedIndex > -1)
            {
                Response.Redirect(Utils.CurrentUrl + "&invID=" + cboInvestments.SelectedValue);
            }
        }
    }
}