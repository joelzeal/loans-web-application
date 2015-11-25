using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class GroupLoansLoans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("Loans", "Open");
            if (!IsPostBack)
            {
               
                //Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
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
                if (db.Loans.Any(l => l.MemberId == Convert.ToInt32(Request.QueryString["gid"]) && l.IsPaidup == false))
                {
                    //Response.Write("<script> alert('The current member has an unpaid loan. A new loan cannot be created for this member.')</script>");

                    ClientScript.RegisterClientScriptBlock(GetType(), "Javascript",
        "<script>alert('The current group has an unpaid loan. A new loan cannot be created for this group.')</script>");
                }
                else
                {
                    Response.Redirect("NewLoan_MemberPreSelected.aspx?gid=" + Request.QueryString["gid"]);
                }
            }

           // Response.Redirect("NewLoan_MemberPreSelected.aspx?gid=" + Request.QueryString["gid"]);
        }


        //print statement
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btnStatement = (ImageButton)sender;
            Response.Redirect("LoanStatement_Real_Group.aspx?lid=" + btnStatement.CommandArgument + "&gid=" + btnStatement.Attributes["gid"].ToString());
        
        }

        //print schedule
        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btnSchedule = (ImageButton)sender;
            Response.Redirect("LoanStatement_group.aspx?lid=" + btnSchedule.CommandArgument + "&gid=" + btnSchedule.Attributes["gid"].ToString());
       
        }
    }
}