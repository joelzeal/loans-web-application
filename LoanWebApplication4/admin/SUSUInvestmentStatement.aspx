<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="SUSUInvestmentStatement.aspx.cs" Inherits="LoanWebApplication4.admin.SUSUInvestmentStatement" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;SUSU Investment Statement</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<br />
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" Height="100%" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\SUSUInvestmentStatement.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="vwMemberInvestmentSqlDataSource" 
                    Name="DataSet1" />
                <rsweb:ReportDataSource DataSourceId="ContributionsSqlDataSource" 
                    Name="ContributionDataSet" />
                <rsweb:ReportDataSource DataSourceId="WithdrawalSqlDataSource" 
                    Name="WithdrawalDataSet" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="WithdrawalSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [MemberWithdrawals] WHERE ([InvestmentID] = @InvestmentID) ORDER BY [DateCreated]">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvestmentID" QueryStringField="InvId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ContributionsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [Contributions] WHERE ([InvestmentId] = @InvestmentId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvestmentId" QueryStringField="invID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="vwMemberInvestmentSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        SelectCommand="SELECT MemberId, MemberName, AccountNumber, TotalContribution, MaturityDate, IsMatured, InvestmentAmount, InsterstRate, Duration, DurationDescription, MaturedAmount, ContributionFreqAmount, InvestmentDuration, InvestmentID, GroupId, GroupName, GroupAccountNumber FROM vwMemberSUSUInvestment WHERE (InvestmentID = @InvestmentID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvestmentID" QueryStringField="invID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
</asp:Content>
