using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class MemberLoans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("Loans", "Open");

            if (!IsPostBack)
            {


                Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                SignatureImage.ImageUrl = "SignatureImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                IDCardImage.ImageUrl = "IDPhotoImageDisplay.ashx?mid=" + Request.QueryString["mid"];
            }
        }

        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Loans", "Edit");
        }

        protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Loans", "Delete");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                if (db.Loans.Any(l => l.MemberId == Convert.ToInt32(Request.QueryString["mid"]) && l.IsPaidup == false))
                {
                    //Response.Write("<script> alert('The current member has an unpaid loan. A new loan cannot be created for this member.')</script>");

                    ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
        "<script>alert('The current member has an unpaid loan. A new loan cannot be created for this member.')</script>");
                }
                else
                {
                    Response.Redirect("NewLoan_MemberPreSelected.aspx?mid=" + Request.QueryString["mid"]);
                }
            }
           
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btnStatement = (ImageButton)sender;
            Response.Redirect("LoanStatement_Real.aspx?lid=" + btnStatement.CommandArgument + "&mid=" + btnStatement.Attributes["mid"].ToString());
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btnSchedule= (ImageButton)sender;
            Response.Redirect("LoanStatement.aspx?lid=" + btnSchedule.CommandArgument + "&mid=" + btnSchedule.Attributes["mid"].ToString());
        }
    }
}