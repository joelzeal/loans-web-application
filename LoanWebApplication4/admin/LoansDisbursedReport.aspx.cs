using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class LoansDisbursedReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportViewer1.LocalReport.SubreportProcessing += new Microsoft.Reporting.WebForms.SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
        
        }

        void LocalReport_SubreportProcessing(object sender, Microsoft.Reporting.WebForms.SubreportProcessingEventArgs e)
        {
            if (e.ReportPath == "rptCompanyProfile")
            {
                e.DataSources.Add(new ReportDataSource("DataSet1", "SqlDataSource1"));
            }
            else if (e.ReportPath == "rptLoansDisbursed_Sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                //e.DataSources.Add(new ReportDataSource("DataSet1", "SqlDataSource1"));
                DisbursedLoansSqlDataSource0.SelectParameters["StartDate"].DefaultValue = prmCollection["prmStartDate"].Values[0];
                DisbursedLoansSqlDataSource0.SelectParameters["EndDate"].DefaultValue = prmCollection["prmEndDate"].Values[0];
                DisbursedLoansSqlDataSource0.SelectParameters["LoanTypeID"].DefaultValue = prmCollection["prmLoanTypeID"].Values[0];

                e.DataSources.Add(new ReportDataSource("DataSet1", "DisbursedLoansSqlDataSource0"));

                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmStartDate", txtStartDate.Text));
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));
            this.ReportViewer1.LocalReport.Refresh();
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem() {  Value = "0", Text = "[All]" });
        }
    }
}