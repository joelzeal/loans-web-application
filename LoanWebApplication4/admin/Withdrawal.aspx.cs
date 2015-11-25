using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class Withdrawal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                SignatureImage.ImageUrl = "SignatureImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                IDCardImage.ImageUrl = "IDPhotoImageDisplay.ashx?mid=" + Request.QueryString["mid"];
            }
        }

        public decimal withdrawalAmount {

            get { return Convert.ToDecimal(Session["withdrawalAmount"]); }
            set { Session["withdrawalAmount"] = value; }
        
        }

        protected void WithdrawalHistorySqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            MemberSqlDataSource1.UpdateParameters["WithdrawalAmount"].DefaultValue = withdrawalAmount.ToString();
            MemberSqlDataSource1.Update();
        }

        protected void WithdrawalAmountTextBox_TextChanged(object sender, EventArgs e)
        {
            withdrawalAmount = Convert.ToDecimal(((TextBox)sender).Text);
        }
    }
}