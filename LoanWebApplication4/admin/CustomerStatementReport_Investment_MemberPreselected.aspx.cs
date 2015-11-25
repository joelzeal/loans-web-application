using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class CustomerStatementReport_Investment_MemberPreselected : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Button1_Click();
            }

            ReportViewer1.LocalReport.SubreportProcessing += new Microsoft.Reporting.WebForms.SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
        }

        void LocalReport_SubreportProcessing(object sender, Microsoft.Reporting.WebForms.SubreportProcessingEventArgs e)
        {
            if (e.ReportPath == "rptCompanyProfile")
            {
                e.DataSources.Add(new ReportDataSource("DataSet1", "SqlDataSource1"));
            }
            else if (e.ReportPath == "rptInvTransactions_Imperial_Trust_Sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                InvestmentTransactionsSqlDataSource.SelectParameters["InvestmentID"].DefaultValue = prmCollection["prmInvestmentID"].Values[0];
                e.DataSources.Add(new ReportDataSource("InvestmentTransactionDataSet", "InvestmentTransactionsSqlDataSource"));
            }

            //else if (e.ReportPath == "rptAppliedInvestmentForStatement_Sub")
            //{
            //    ReportParameterInfoCollection prmCollection = e.Parameters;
            //    AppliedInterestSqlDataSource.SelectParameters["InvestmentID"].DefaultValue = prmCollection["prmInvestmentID"].Values[0];
            //    e.DataSources.Add(new ReportDataSource("DataSet1", "AppliedInterestSqlDataSource"));
            //}

            //else if (e.ReportPath == "rptAppliedDeductionForStatement_Sub")
            //{
            //    ReportParameterInfoCollection prmCollection = e.Parameters;
            //    AppliedDeductionsSqlDataSource.SelectParameters["InvestmentID"].DefaultValue = prmCollection["prmInvestmentID"].Values[0];
            //    e.DataSources.Add(new ReportDataSource("DataSet1", "AppliedDeductionsSqlDataSource"));
            //}

        }

        protected void Button1_Click()
        {
            
            //this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));

            if (Request.QueryString["mid"] != null)//member
            {
                InvestmentsSqlDataSource.SelectParameters["MemberID"].DefaultValue = Request.QueryString["mid"];

                InvestmentsSqlDataSource.SelectParameters["GroupID"].DefaultValue = "0";

               
                 Member _member;
                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                     _member = db.Members.FirstOrDefault(m => m.MemberId == Convert.ToInt32(Request.QueryString["mid"]));
                    
                }
                this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmCustomerName", _member.MemberFirstName.ToString() + " " + _member.MemberLastName.ToString() + " - " + _member.AccountNumber ));
            }
            else if (Request.QueryString["gid"] != null)//group
            {
                InvestmentsSqlDataSource.SelectParameters["GroupID"].DefaultValue = Request.QueryString["gid"];

                InvestmentsSqlDataSource.SelectParameters["MemberID"].DefaultValue = "0";



                LoanGroup _group;
                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    _group = db.LoanGroups.FirstOrDefault(m => m.GroupId == Convert.ToInt32(Request.QueryString["gid"]));

                }
                this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmCustomerName", _group.GroupName + " - " + _group.AccountNumber));
            }
            InvestmentsSqlDataSource.Select(new DataSourceSelectArguments());

            this.ReportViewer1.LocalReport.Refresh();
        }

        protected void UsersDropDownList_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // UsersDropDownList.Items.Insert(0, new ListItem("<All>", "all"));
            }
        }

    }
}