using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class TotalAppliedInterestAndDeductionsReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportViewer1.LocalReport.SubreportProcessing += new Microsoft.Reporting.WebForms.SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
        }

        void LocalReport_SubreportProcessing(object sender, Microsoft.Reporting.WebForms.SubreportProcessingEventArgs e)
        {
            e.DataSources.Add(new ReportDataSource("DataSet1", "SqlDataSource1"));
            //this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmStartDate", txtStartDate.Text));
            //this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //InvestmentsSqlDatasouce.SelectParameters["InvestmentTypeID"].DefaultValue = DropDownList1.SelectedValue;
            //InvestmentSqlDataSource.Select(new DataSourceSelectArguments());
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmStartDate", txtStartDate.Text));
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));
            this.ReportViewer1.LocalReport.Refresh();
        }

        //protected void UsersDropDownList_DataBound(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        UsersDropDownList.Items.Insert(0, new ListItem("<All>", "all"));
        //    }
        //}
    }
}