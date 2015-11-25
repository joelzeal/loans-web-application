using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class Members : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("Members", "Open");

            //var _controls = this.Controls.OfType<SqlDataSource>();
            //foreach (SqlDataSource item in _controls)
            //{
            //    item.Deleting += new SqlDataSourceCommandEventHandler(item_Deleting);
            //    item.Updating += new SqlDataSourceCommandEventHandler(item_Updating);
            //}
        }

        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Members", "Edit");
        }

       protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Members", "Delete");
        }

    }
}