using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class MobileBankersList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("MobileBankers", "Open");
        }

        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("MobileBankers", "Edit");
        }

        protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("MobileBankers", "Delete");
        }
    }
}