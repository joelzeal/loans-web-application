using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class AppliedFeaturesComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FailMessagesSqlDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            //if (DataList1.Items.Count > 0)
            //{
            //    panelFailMessages.Visible = true;
            //}
            //else
            //{
            //    panelFailMessages.Visible = false;
            //}
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            lblFailCount.Text = DataList1.Items.Count.ToString();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AppliedAccountTypeFeaturesReport.aspx");
        }
    }
}