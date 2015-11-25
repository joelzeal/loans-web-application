using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FinanceManagerDataContext db = new FinanceManagerDataContext();
            //db.CreateDatabase();
            Response.Redirect("~/admin/Default.aspx");
        }
    }
}
