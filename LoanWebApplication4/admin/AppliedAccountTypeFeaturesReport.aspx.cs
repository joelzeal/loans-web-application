﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class AppliedAccountTypeFeaturesReport : System.Web.UI.Page
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



            if (e.ReportPath == "rptCompanyProfile")
            {
                e.DataSources.Add(new ReportDataSource("DataSet1", "SqlDataSource1"));
            }
            else if (e.ReportPath == "rptAppliedFeatureDetailsType1_sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                vwAccountTypeFeaturesDetailsSqlDataSource.SelectParameters["AppliedFeatureHistoryId"].DefaultValue = prmCollection["prmAppliedFeatureHistoryId"].Values[0];
                e.DataSources.Add(new ReportDataSource("AppliedFeatureDetailsDataSet", "vwAccountTypeFeaturesDetailsSqlDataSource"));
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
            //if (!IsPostBack)
            //{
            //    UsersDropDownList.Items.Insert(0, new ListItem("<All>", "all"));
            //}
        }
    }
}