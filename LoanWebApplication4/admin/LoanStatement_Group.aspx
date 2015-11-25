<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="LoanStatement_Group.aspx.cs" Inherits="LoanWebApplication4.admin.LoanStatement_Group" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Src="../UserControls/GroupLoansToolBarWebUserControl.ascx" TagName="GroupLoansToolBarWebUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table width="100%">
        <tr>
            <td>
                <h2>
                    Group Loan Schedule</h2>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td align="right">
                <uc1:GroupLoansToolBarWebUserControl ID="GroupLoansToolBarWebUserControl1" runat="server" />
            </td>
        </tr>
    </table>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" Font-Names="Verdana"
        Font-Size="8pt" Height="100%" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\LoanSchedule_Group.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="vwMemberLoansSqlDataSource" Name="vwMemberLoanDataSet" />
                <rsweb:ReportDataSource DataSourceId="LoanScheduleSqlDataSource" Name="RepaymentScheduleDataset" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="LoanScheduleSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        SelectCommand="SELECT RepaymentSchedule.* FROM RepaymentSchedule WHERE (LoanId = @LoanId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="LoanId" QueryStringField="lid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="vwMemberLoansSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        SelectCommand="SELECT Principal, Amount, Duration, InterestTypeId, RawDurationEntered, ExpectedRepaymentEndDate, totalRepayment, RepaymentFreqDescription, LoanID, Interest, InterestTypeDescription, LoanDurationDescription, CollateralName, CollateralDescription, GroupName, GroupDescription FROM vwGroupLoan WHERE (LoanID = @LoanID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="LoanID" QueryStringField="lid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
</asp:Content>
