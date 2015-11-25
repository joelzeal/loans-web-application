<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="RepaymentReceipt_Group.aspx.cs" Inherits="LoanWebApplication4.admin.RepaymentReceipt_Group" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <rsweb:ReportViewer Width="100%" Height="100%" ID="ReportViewer1" 
            runat="server" Font-Names="Verdana" Font-Size="8pt" 
            InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
            WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Reports\LoanRepaymentReceipt_Group.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="vwLoanRepaymentSqlDataSource" 
                        Name="DataSet2" />
                    <rsweb:ReportDataSource DataSourceId="CompanyProfileSqlDataSource" 
                        Name="DataSet3" />
                    <rsweb:ReportDataSource DataSourceId="GroupSqlDataSource" 
                        Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="CompanyProfileSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            SelectCommand="SELECT TOP (1) CompanyName, CompanyId, address, Email, website, EndOfDayLastRunDate, DefaultInterestRateTypeId, SimpleInterestRate, CompoundFrequency, CompoundInterestRate, DefaultersInteresty, ExcludeSundaysFromCalculations, ExcludeSaturdayFromCalculations, CompanyLogo, LogoFileExt, AutoGenerateAccountNumbers FROM CompanyProfile">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="vwLoanRepaymentSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            SelectCommand="SELECT * FROM [vwLoanRepayment] WHERE ([RepaymentId] = @RepaymentId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="RepaymentId" QueryStringField="rid" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="GroupSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            
            SelectCommand="SELECT LoanGroups.* FROM LoanGroups WHERE (GroupId = @GroupId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="GroupId" QueryStringField="gid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
