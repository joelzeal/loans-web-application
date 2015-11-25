using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class LoanSsttings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Utils.IsAuthorized("Settings_LoandAndInvestment", "Open");
        }



protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_LoandAndInvestment", "Edit");
        }

       protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_LoandAndInvestment", "Delete");
        }

       protected void item_inserting(object sender, SqlDataSourceCommandEventArgs e)
       {
           Utils.IsAuthorized("Settings_LoandAndInvestment", "Create");
       }


        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
           
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
 Response.Write("<script>alert('Data Successfully saved.');</script>");
        }
    }
}