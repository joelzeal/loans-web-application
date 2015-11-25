using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class AccountTypeFeatures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["accType"] != null)
            {
                Label1.Text = Utils.GetDataContext() .AccountTypes.FirstOrDefault(a => a.AccountTypeId == Convert.ToInt32(Request.QueryString["accType"])).Description;

            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AccountTypesSetup.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AccountTypeFeatureEdit.aspx?accType=" + Request.QueryString["accType"]);
        }
    }
}