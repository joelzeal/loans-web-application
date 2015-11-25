using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class WithdrawalsReportForMobileBanker : System.Web.UI.Page
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
            else if (e.ReportPath == "rptWithdrawalByMobileBanker_sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                //e.DataSources.Add(new ReportDataSource("DataSet1", "SqlDataSource1"));
                WithdrawalsSqlDataSource.SelectParameters["StartDate"].DefaultValue =  txtStartDate.Text.Length > 0 ? txtStartDate.Text : "1/1/1999";
                WithdrawalsSqlDataSource.SelectParameters["EndDate"].DefaultValue = txtEndDate.Text.Length > 0 ? txtEndDate.Text : "1/1/2020";
                WithdrawalsSqlDataSource.SelectParameters["MobileBankerID"].DefaultValue = e.Parameters["prmMobileBankerId"].Values[0]; // 2 for SUSU investment
                WithdrawalsSqlDataSource.SelectParameters["ReceivedBy"].DefaultValue = UsersDropDownList.SelectedValue;

                e.DataSources.Add(new ReportDataSource("DataSet1", "WithdrawalsSqlDataSource"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmStartDate", txtStartDate.Text));
            this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));
            this.ReportViewer1.LocalReport.Refresh();
        }

        protected void UsersDropDownList_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UsersDropDownList.Items.Insert(0, new ListItem("<All>", "all"));
            }
        }

        protected void cboMobileBankers_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cboMobileBankers.Items.Insert(0, new ListItem("<All>", "0"));
            }
        }
    }
}