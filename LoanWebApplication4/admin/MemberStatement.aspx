<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="MemberStatement.aspx.cs" Inherits="LoanWebApplication4.admin.MemberStatement" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" width="97%" Height="800px" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="admin\Report1.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="DepositSqlDataSource1" Name="DataSet1" />
                <rsweb:ReportDataSource DataSourceId="MembersSqlDataSource" Name="DataSet2" />
                <rsweb:ReportDataSource DataSourceId="WithdrawalSqlDataSource" 
                    Name="DataSet3" />
                <rsweb:ReportDataSource DataSourceId="CompanyProfileSqlDataSource" 
                    Name="DataSet4" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="CompanyProfileSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT TOP (1) CompanyId, CompanyName, address, Email, website FROM CompanyProfile">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="WithdrawalSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [MemberWithdrawals] WHERE ([MemberId] = @MemberId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [Members] WHERE ([MemberId] = @MemberId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DepositSqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [MemberDeposits] WHERE ([MemberId] = @MemberId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberId" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

