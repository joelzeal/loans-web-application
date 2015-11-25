using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class IdentityTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Utils.IsAuthorized("Settings_IDTypes", "Open");

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {

        }

        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_IDTypes", "Edit");
        }

        protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_IDTypes", "Delete");
        }

        protected void item_inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_IDTypes", "Create");
        }
    }
}