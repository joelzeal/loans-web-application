using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class DefaultPageSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            DateTime trialStartDate = new DateTime(2014, 1, 3);
            if (DateTime.Today >= trialStartDate.AddDays(30))
            {
                Response.Redirect("trialExpiration.aspx");
            }*/
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("SearchPage.aspx?str=" + txtSearch.Text);
        }

        //check to see if there are any due fixed deposites
        
    }
}
