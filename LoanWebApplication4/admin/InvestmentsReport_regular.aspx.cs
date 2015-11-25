using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class InvestmentsReport_regular : System.Web.UI.Page
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
            else if (e.ReportPath == "rptInvestments_WithInvestmentDescription_sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                //e.DataSources.Add(new ReportDataSource("DataSet1", "SqlDataSource1"));
                InvestmentsSqlDatasouce.SelectParameters["StartDate"].DefaultValue = prmCollection["prmStartDate"].Values[0];
                InvestmentsSqlDatasouce.SelectParameters["EndDate"].DefaultValue = prmCollection["prmEndDate"].Values[0];
                InvestmentsSqlDatasouce.SelectParameters["InvestmentTypeID"].DefaultValue = "1";//prmCollection["prmInvestmentTypeID"].Values[0];
                InvestmentsSqlDatasouce.SelectParameters["InvestmeneDescriptionID"].DefaultValue = prmCollection["prmInvestmentDescriptionID"].Values[0];


                e.DataSources.Add(new ReportDataSource("DataSet1", "InvestmentsSqlDatasouce"));
            }
           
            //this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmStartDate", txtStartDate.Text));
            //this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //InvestmentsSqlDatasouce.SelectParameters["InvestmentTypeID"].DefaultValue = DropDownList1.SelectedValue;
            InvestmentSqlDataSource.Select(new DataSourceSelectArguments());
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmStartDate", txtStartDate.Text));
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmInvestmentTypeID", DropDownList1.SelectedValue)); //1 is the investmentType id for Regular Investments
            this.ReportViewer1.LocalReport.Refresh();
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem() { Text = "<All>" , Value = "0"});
        }
    }
}