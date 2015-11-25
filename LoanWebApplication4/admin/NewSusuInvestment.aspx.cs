using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class NewSusuInvestment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0) //individuals selected
            {
                if (DropDownList1.SelectedIndex == 0 || DropDownList1.SelectedIndex == -1)
                {
                    //dataSection.Visible = false;
                    //loanDataSection.Visible = false;
                    //memberHeader.Visible = false;
                    //LoanHeader.Visible = false;

                }
                else
                {
                    //dataSection.Visible = true;
                    //loanDataSection.Visible = true;
                    //memberHeader.Visible = true;
                    //LoanHeader.Visible = true;


                }
            }
            else
            {
                if (cboGroupName.SelectedIndex == 0 || cboGroupName.SelectedIndex == -1)
                {
                    //dvGroupdataSection.Visible = false;
                    //loanDataSection.Visible = false;
                    //memberHeader.Visible = false;
                    //LoanHeader.Visible = false;
                }
                else
                {
                    //dvGroupdataSection.Visible = true;
                    //loanDataSection.Visible = true;
                    //memberHeader.Visible = true;
                    //LoanHeader.Visible = true;
                }
            }
           
            if (!IsPostBack)
            {
                //hide member and group combos
                tblMember.Visible = false;
                tblGroup.Visible = false;

                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                    //InterestTextBox.Text = cProfile.CompoundInterestRate.ToString();

                }

                if (Request.QueryString["mid"] != null)
                {
                    if (DropDownList1.SelectedIndex == 0)
                    {
                        dataSection.Visible = false;
                    }
                    else
                    {
                        dataSection.Visible = true;
                    }

                    Image1.ImageUrl = "ImageDisplay.ashx?mid=" + DropDownList1.SelectedValue;
                   // MultiView1.SetActiveView(View1);
                }
                //txtStartCalculationFrom_CalendarExtender.SelectedDate = DateTime.Today.Date;
                //cboInterestDuration.Items.Insert(0, new ListItem() { Value = "[Select Interest Duration]", Text = "[Select Interest Duration]" });
            }
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem() { Text = "[Select Member]" , Value = "-1"});
            if (Request.QueryString["mid"] != null)
            {
                DropDownList1.SelectedValue = Request.QueryString["mid"];
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                dataSection.Visible = false;
            }
            else
            {
                dvGroupdataSection.Visible = false;
                dataSection.Visible = true;
            }


            Image1.ImageUrl = "ImageDisplay.ashx?mid=" + DropDownList1.SelectedValue;
           // MultiView1.SetActiveView(View1);
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

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                tblMember.Visible = true;
                tblGroup.Visible = false;

                //hide group and show member
                if (DropDownList1.SelectedIndex > 0)
                {
                    dvGroupdataSection.Visible = false;
                    dataSection.Visible = true;
                    memberHeader.InnerText = "Member Headers";

                }
                else
                {
                    dataSection.Visible = false;
                   // loanDataSection.Visible = false;
                    memberHeader.Visible = false;
                   // LoanHeader.Visible = false;
                }
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                tblMember.Visible = false;
                tblGroup.Visible = true;

                //hide member and show group 
                if (cboGroupName.SelectedIndex > 0)
                {
                    dvGroupdataSection.Visible = true;
                    dataSection.Visible = false;
                    memberHeader.InnerText = "Group Headers";
                }
                else
                {
                    dataSection.Visible = false;
                   // loanDataSection.Visible = false;
                    memberHeader.Visible = false;
                   // LoanHeader.Visible = false;
                }
            }
        }

        protected void btnGroup_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void cboGroupName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboGroupName.SelectedIndex == 0)
            {
                dvGroupdataSection.Visible = false;
                dvGroupdataSection.Visible = false;
                //loanDataSection.Visible = false;
                memberHeader.Visible = false;
                // LoanHeader.Visible = false;
            }
            else
            {
                dataSection.Visible = false;
                dvGroupdataSection.Visible = true;
                //  loanDataSection.Visible = true;
                memberHeader.Visible = true;
                //  LoanHeader.Visible = true;
                //  MultiView1.SetActiveView(View1);
            }
        }

        protected void cboGroupName_DataBound(object sender, EventArgs e)
        {
            cboGroupName.Items.Insert(0, new ListItem() { Text = "[Select Group]", Value = "-1" });
        }


        //save investment
        protected void Button1_Click1(object sender, EventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                Investment inv = new Investment();
                inv.IsActive = true;
                if (RadioButtonList1.SelectedIndex == 0) //individual
                {
                    //no member selected
                    if (DropDownList1.SelectedIndex == 0)
                        return;

                    inv.Balance = 0;
                    inv.MemberID = Convert.ToInt32(DropDownList1.SelectedValue);
                    inv.InsterstRate = 0;

                    inv.InvestmentTypeId = 2; //2 for susu investments
                    db.Investments.InsertOnSubmit(inv);
                    db.SubmitChanges();

                    //audit
                    Utils.logAction("Insert", inv);

                    Response.Redirect("SUSUInvestmentContribution.aspx?InvId=" + inv.InvestmentID + "&mid=" + inv.MemberID);

                }
                else // group
                {
                    //no group selected
                    if (cboGroupName.SelectedIndex == 0)
                        return;

                    inv.Balance = 0;
                    inv.GroupId = Convert.ToInt32(cboGroupName.SelectedValue);

                    inv.InvestmentTypeId = 2; //2 for susu investments
                    db.Investments.InsertOnSubmit(inv);
                    db.SubmitChanges();

                    //audit
                    Utils.logAction("Insert", inv);

                    Response.Redirect("GroupsSUSUInvestmentContribution.aspx?InvId=" + inv.InvestmentID + "&gid=" + inv.GroupId);
                }
                
            }
        }
    }
}