using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class ApplyInsterest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //check all the items in the grid
            foreach (GridViewRow item in GridView1.Rows)
            {
                (item.FindControl("CheckBox1") as CheckBox).Checked = true;
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            //check all the items in the grid
            foreach (GridViewRow item in GridView1.Rows)
            {
                (item.FindControl("CheckBox1") as CheckBox).Checked = false;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            vwMembersWithInvestmentsSqlDataSource.DataBind();
        }

        protected void vwMembersWithInvestmentsSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem() { Value = "-1", Text="-----Select Account Type------" });
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                decimal _currentBalance;
                bool _isChecked = false;
                int _currentInvestmentId = 0;
                bool IsAccountsSelected = false;


                //clear everthing in AppliedInterest_Temps
                db.AppliedInterest_Temps.DeleteAllOnSubmit(db.AppliedInterest_Temps);
                db.SubmitChanges();

                foreach (GridViewRow item in GridView1.Rows)
                {
                    IsAccountsSelected = true;

                    //get the current balance
                    _currentBalance = Convert.ToDecimal((item.FindControl("Label1") as Label).Text);

                    //get investmentId 
                    _currentInvestmentId = Convert.ToInt32( (item.FindControl("HiddenField1") as HiddenField).Value);


                    //check if the account is selected
                    _isChecked = (item.FindControl("CheckBox1") as CheckBox).Checked;
                    if (_isChecked)
                    {
                        AppliedInterest _appliedInterest = new AppliedInterest();
                        _appliedInterest.CreatedBy = HttpContext.Current.User.Identity.Name;
                        _appliedInterest.CreatedDate = DateTime.Now;
                       // _currentInvestmentId = Convert.ToInt32(item.Cells[0].Text);
                        _appliedInterest.InterestAmount = _currentBalance * Convert.ToDecimal(TextBox1.Text)/100;
                        _appliedInterest.InvestmentID = _currentInvestmentId;
                        _appliedInterest.Rate = Convert.ToDecimal(TextBox1.Text);
                        _appliedInterest.InvestmentID = _currentInvestmentId;

                        db.AppliedInterests.InsertOnSubmit(_appliedInterest);



                        AppliedInterest_Temp _appliedInterest_temp = new AppliedInterest_Temp();
                        _appliedInterest_temp.CreatedBy = HttpContext.Current.User.Identity.Name;
                        _appliedInterest_temp.CreatedDate = DateTime.Now;
                        // _currentInvestmentId = Convert.ToInt32(item.Cells[0].Text);
                        _appliedInterest_temp.InterestAmount = _currentBalance * Convert.ToDecimal(TextBox1.Text) / 100;
                        _appliedInterest_temp.InvestmentID = _currentInvestmentId;
                        _appliedInterest_temp.Rate = Convert.ToDecimal(TextBox1.Text);
                        //_appliedInterest_temp.AppliedInterestID = _appliedInterest.AppliedInterestID;
                        _appliedInterest_temp.InvestmentID = _currentInvestmentId;
                        
                        db.AppliedInterest_Temps.InsertOnSubmit(_appliedInterest_temp);
                        
                    }
                }

                if (IsAccountsSelected)
                {
                    //try to see if everything will get inserted
                    db.SubmitChanges();
                    Response.Redirect("AppliedInterestForPrintReport.aspx");
                }
               
            }
        }
    }
}