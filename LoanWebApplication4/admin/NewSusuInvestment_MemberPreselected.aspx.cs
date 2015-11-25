using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class NewSusuInvestment_MemberPreselected : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                    //InterestTextBox.Text = cProfile.CompoundInterestRate.ToString();
                }

                if (Request.QueryString["mid"] != null)
                {
                    dataSection.Visible = true;
                    Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                }
                else if (Request.QueryString["gid"] != null)
                {
                    dvGroupdataSection.Visible = true;
                    dataSection.Visible = false;
                    memberHeader.InnerText = "Group Headers";
                }
            }
        }

         
 

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MemberDetails.aspx?RedirectUrl=NewLoan.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
                //LinkButton1_Click(this, e);
                //MultiView1.SetActiveView(View2);
           
        }


        protected void btnGroup_Click(object sender, ImageClickEventArgs e)
        {

        }
       


        //save investment
        protected void Button1_Click1(object sender, EventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                Investment inv;
                if (Request.QueryString["InvId"] != null)
                {
                    inv = db.Investments.FirstOrDefault(i => i.InvestmentID == Convert.ToInt32(Request.QueryString["InvId"]));
                }
                else
                {
                    inv = new Investment();
                }

                 
                inv.IsActive = true;
                if (Request.QueryString["mid"] != null) //individual
                {
                   
                    inv.Balance = 0;
                    inv.MemberID = Convert.ToInt32(Request.QueryString["mid"]);

                    inv.InsterstRate = 0;

                    inv.InvestmentTypeId = 2; //2 for susu investments
                    inv.CreatedDate = DateTime.Now;


                    if (Request.QueryString["InvId"] == null)
                    {
                        db.Investments.InsertOnSubmit(inv);
                    }
                    db.SubmitChanges();

                    //audit
                    Utils.logAction("Insert", inv);

                    Response.Redirect("SUSUInvestmentContribution.aspx?InvId=" + inv.InvestmentID + "&mid=" + inv.MemberID);

                }
                else // group
                {
                    inv.Balance = 0;
                    inv.GroupId = Convert.ToInt32(Request.QueryString["gid"]);

                    inv.InvestmentTypeId = 2; //2 for susu investments

                    if (Request.QueryString["InvId"] == null)
                    {
                        db.Investments.InsertOnSubmit(inv);
                    }

                    //db.Investments.InsertOnSubmit(inv);
                    db.SubmitChanges();

                    //audit
                    Utils.logAction("Insert", inv);

                    Response.Redirect("GroupsSUSUInvestmentContribution.aspx?InvId=" + inv.InvestmentID + "&gid=" + inv.GroupId);
                }
                
            }
        }
    }
}