<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="RepaymentReceipt2.aspx.cs" Inherits="LoanWebApplication4.admin.RepaymentReceipt2" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <rsweb:ReportViewer Width="100%" Height="750px" ID="ReportViewer1" 
            runat="server" Font-Names="Verdana" Font-Size="8pt" 
            InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
            WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Reports\LoanRepaymentReceipt.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="MemberSqlDataSource" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="vwLoanRepaymentSqlDataSource" 
                        Name="DataSet2" />
                    <rsweb:ReportDataSource DataSourceId="CompanyProfileSqlDataSource" 
                        Name="DataSet3" />
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
        <asp:SqlDataSource ID="MemberSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            SelectCommand="SELECT * FROM [Members] WHERE ([MemberId] = @MemberId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
