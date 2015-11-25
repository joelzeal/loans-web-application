using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace LoanWebApplication4.admin
{
    public partial class CustomerStatementReport_Investment_New_Type2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    RadioButtonList1.SelectedIndex = 0;
            //}
            ReportViewer1.LocalReport.SubreportProcessing += new Microsoft.Reporting.WebForms.SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
        }

        void LocalReport_SubreportProcessing(object sender, Microsoft.Reporting.WebForms.SubreportProcessingEventArgs e)
        {
            if (e.ReportPath == "rptCompanyProfile")
            {
                e.DataSources.Add(new ReportDataSource("DataSet1", "SqlDataSource1"));
            }
            else if (e.ReportPath == "rptInvestmentTransactions_Sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                InvestmentTransactionsSqlDataSource.SelectParameters["InvestmentID"].DefaultValue = prmCollection["prmInvestmentID"].Values[0];
                e.DataSources.Add(new ReportDataSource("InvestmentTransactionDataSet", "InvestmentTransactionsSqlDataSource"));
            }
            else if (e.ReportPath == "rptAppliedInvestmentForStatement_Sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                AppliedInterestSqlDataSource.SelectParameters["InvestmentID"].DefaultValue = prmCollection["prmInvestmentID"].Values[0];
                e.DataSources.Add(new ReportDataSource("DataSet1", "AppliedInterestSqlDataSource"));
            }
            else if (e.ReportPath == "rptAppliedDeductionForStatement_Sub")
            {
                ReportParameterInfoCollection prmCollection = e.Parameters;
                AppliedDeductionsSqlDataSource.SelectParameters["InvestmentID"].DefaultValue = prmCollection["prmInvestmentID"].Values[0];
                e.DataSources.Add(new ReportDataSource("DataSet1", "AppliedDeductionsSqlDataSource"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            //this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmEndDate", txtEndDate.Text));

            if (RadioButtonList1.SelectedIndex == 0)//member
            {
                InvestmentsSqlDataSource.SelectParameters["MemberID"].DefaultValue = DropDownList1.SelectedValue;
               // LoansSqlDataSource.SelectParameters["MemberID"].DefaultValue = DropDownList1.SelectedValue;

                InvestmentsSqlDataSource.SelectParameters["GroupID"].DefaultValue = "0";
                //LoansSqlDataSource.SelectParameters["GroupID"].DefaultValue = "0";

                this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmCustomerName", DropDownList1.SelectedItem.Text));
            }
            else if (RadioButtonList1.SelectedIndex == 1)//group
            {
                InvestmentsSqlDataSource.SelectParameters["GroupID"].DefaultValue = cboGroupName.SelectedValue;
                //LoansSqlDataSource.SelectParameters["GroupID"].DefaultValue = cboGroupName.SelectedValue;

                InvestmentsSqlDataSource.SelectParameters["MemberID"].DefaultValue = "0";
                //LoansSqlDataSource.SelectParameters["MemberID"].DefaultValue = "0";

                this.ReportViewer1.LocalReport.SetParameters(new ReportParameter("prmCustomerName", cboGroupName.SelectedItem.Text));
            }
            //LoansSqlDataSource.Select(new DataSourceSelectArguments());
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

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)//member
            {
                tblMember.Visible = true;
                tblGroup.Visible = false;

                //InvestmentsSqlDataSource.SelectParameters["MemberID"].DefaultValue = DropDownList1.SelectedValue;
                //LoansSqlDataSource.SelectParameters["MemberID"].DefaultValue = DropDownList1.SelectedValue;
            }
            else if (RadioButtonList1.SelectedIndex == 1)//group
            {
                tblMember.Visible = false;
                tblGroup.Visible = true;

                //InvestmentsSqlDataSource.SelectParameters["GroupID"].DefaultValue = cboGroupName.SelectedValue;
                //LoansSqlDataSource.SelectParameters["GroupID"].DefaultValue = cboGroupName.SelectedValue;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (RadioButtonList1.SelectedIndex == 0)//member
            //{
            //    InvestmentsSqlDataSource.SelectParameters["MemberID"].DefaultValue = DropDownList1.SelectedValue;
            //    LoansSqlDataSource.SelectParameters["MemberID"].DefaultValue = DropDownList1.SelectedValue;
            //}
        }

        protected void cboGroupName_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (RadioButtonList1.SelectedIndex == 1)//group
            //{
            //    InvestmentsSqlDataSource.SelectParameters["GroupID"].DefaultValue = cboGroupName.SelectedValue;
            //    LoansSqlDataSource.SelectParameters["GroupID"].DefaultValue = cboGroupName.SelectedValue;
            //}
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string memberID = "";
                if (Request.QueryString["mid"] != null)
                {
                    memberID = Request.QueryString["mid"];
                    DropDownList1.SelectedValue = memberID;
                    RadioButtonList1.SelectedIndex = 0;

                    Button1_Click(this, new EventArgs());
                }
                else if(Request.QueryString["gid"] != null)
                {
                    memberID = Request.QueryString["gid"];
                    cboGroupName.SelectedValue = memberID;
                    RadioButtonList1.SelectedIndex = 1;

                    Button1_Click(this, new EventArgs());
                }
            }
        }
    }
}