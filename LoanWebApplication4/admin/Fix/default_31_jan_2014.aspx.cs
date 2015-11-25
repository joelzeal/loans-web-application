using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin.Fix
{
    public partial class default_31_jan_2014 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //fix Account types
            FinanceManagerDataContext db = new FinanceManagerDataContext();
            foreach (Member item in db.Members)
            {
                try
                {
                    Investment tempInvestment = item.Investments.FirstOrDefault(i => i.InvestmentTypeId == 1 || i.InvestmentTypeId == 2);
                    tempInvestment.InvestmentTypeId = 1; //change investment type to local ....This applies tp Imperial trust
                    tempInvestment.AccountTypeId = item.AccountTypeID;

                    //create investments for those accounts that dont have investment
                    if (item.Investments.Count == 0)
                    {
                        item.Investments.Add(new Investment()
                        {
                            AccountTypeId = item.AccountTypeID,
                            CreatedBy = User.Identity.Name,
                            CreatedDate = DateTime.Now,
                            InvestmentTypeId = 1,
                            IsActive = true,
                            IsDeleted = false
                        });

                        db.SubmitChanges();
                    }
                }
                catch (Exception)
                {

                }
                finally
                {
                    db.SubmitChanges();
                }
            }
        }
    }
}