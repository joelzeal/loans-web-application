using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class GroupInvestments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
               // Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                //show appropriate panel
                LoanGroup _currentMember = Utils.GetLoanGroup(Convert.ToInt32(Request.QueryString["gid"])); 
                lblAccountHeader.Text = _currentMember.AccountType.Description;
                ////switch (_currentMember.AccountTypeId)
                ////{
                ////    case 1:
                ////        regularInvestmentPanel.Visible = true;
                ////        SusuInvestmentPanel.Visible = false;

                ////        lblAccountHeader.Text = _currentMember.AccountType.Description;

                ////        break;
                ////    case 2:
                ////        regularInvestmentPanel.Visible = true;
                ////        SusuInvestmentPanel.Visible = false;

                ////        lblAccountHeader.Text = _currentMember.AccountType.Description;

                ////        break;

                ////    case 3:
                ////        regularInvestmentPanel.Visible = false;
                ////        SusuInvestmentPanel.Visible = true;

                ////        lblAccountHeader1.Text = _currentMember.AccountType.Description;

                ////        break;
                ////}
            }
        }



        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewInvestment_MemberPreSelected.aspx?gid=" + Request.QueryString["gid"]);
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewSusuInvestment_MemberPreselected.aspx?gid=" + Request.QueryString["gid"]);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewInvestment_FixedDeposit_MemberPreSelected.aspx?gid=" + Request.QueryString["gid"]);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}