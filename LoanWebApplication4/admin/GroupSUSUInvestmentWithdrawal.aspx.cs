using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class GroupSUSUInvestmentWithdrawal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                Session["CurrentUser_session"] = User.Identity.Name;
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
    }
}