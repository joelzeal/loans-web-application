using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class OverdueLoansReport : System.Web.UI.Page
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
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmStartDate", txtStartDate.Text));
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));
            this.ReportViewer1.LocalReport.Refresh();
        }
    }
}