<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="FixedDepositInvestmentStatement.aspx.cs" Inherits="LoanWebApplication4.admin.FixedDepositInvestmentStatement" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register src="../UserControls/InvestmentToolBarWebUserControl.ascx" tagname="InvestmentToolBarWebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                 <h2>Fixed Deposit Investment Statement</h2>&nbsp;</td>
            <td align="right">
               
                <%--<uc1:InvestmentToolBarWebUserControl ID="InvestmentToolBarWebUserControl1" 
                    runat="server" />--%>
               
            </td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" Height="100%" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\rptFixedDepositInvestment.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="vwMemberInvestmentSqlDataSource" 
                    Name="DataSet1" />
                <rsweb:ReportDataSource DataSourceId="ContributionsSqlDataSource" 
                    Name="DataSet2" />
                <rsweb:ReportDataSource DataSourceId="WithdrawalSqlDataSource" 
                    Name="DataSet3" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="WithdrawalSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [MemberWithdrawals] WHERE ([InvestmentID] = @InvestmentID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvestmentID" QueryStringField="invId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ContributionsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        SelectCommand="SELECT ContributionId, ContributionAmount, CreatedDate, CreatedBy, Description, ContributionBy, RecievedBy, ContributionScheduleID, ContributionAmountInWords, ReceiptNumber, InvestmentId FROM Contributions WHERE (InvestmentId = @InvestmentId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvestmentId" QueryStringField="invID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="vwMemberInvestmentSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        SelectCommand="SELECT MemberId, MemberName, AccountNumber, TotalContribution, MaturityDate, IsMatured, InvestmentAmount, InsterstRate, Duration, DurationDescription, MaturedAmount, ContributionFreqAmount, InvestmentDuration, InterestTypeDescription, InvestmentID, GroupId, GroupName, GroupAccountNumber FROM vwMemberFixedDepositInvestment WHERE (InvestmentID = @InvestmentID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvestmentID" QueryStringField="invID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
</asp:Content>
