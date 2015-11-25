using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class AccountTypesSetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("Settings_AccountTypes", "Open");
        }


        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_AccountTypes", "Edit");
        }

        protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_AccountTypes", "Delete");
        } 
        
        protected void item_insering(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_AccountTypes", "Create");
        }
    }
}