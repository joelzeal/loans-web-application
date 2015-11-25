<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="LoanStatement_Real_Group.aspx.cs" Inherits="LoanWebApplication4.admin.LoanStatement_Real_Group" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>


<%@ Register src="../UserControls/GroupLoansToolBarWebUserControl.ascx" tagname="GroupLoansToolBarWebUserControl" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
     <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td> <h2>  Group  Loan Statement </h2>
            </td>
             <td align="right">
                 <uc1:GroupLoansToolBarWebUserControl ID="GroupLoansToolBarWebUserControl1" 
                     runat="server" />
            </td>
        </tr>
    </table>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<br />
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" Height="100%" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\LoanStatement_Group.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="vwGroupLoansSqlDataSource" 
                    Name="vwMemberLoanDataSet" />
                <rsweb:ReportDataSource DataSourceId="RepaymentsSqlDataSource" 
                    Name="LoanRepaymentDataSet" />
                <rsweb:ReportDataSource DataSourceId="PenaltiesSqlDataSource" 
                    Name="PenaltyCalculatingDataSet" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="PenaltiesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        SelectCommand="SELECT LoanPenalty.* FROM LoanPenalty WHERE (LoanID = @LoanID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="LoanID" QueryStringField="lid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="RepaymentsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        SelectCommand="SELECT Repayments.* FROM Repayments WHERE (LoanId = @LoanId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="LoanId" QueryStringField="lid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="vwGroupLoansSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
         SelectCommand="SELECT Principal, Amount, Duration, InterestTypeId, RawDurationEntered, ExpectedRepaymentEndDate, totalRepayment, RepaymentFreqDescription, LoanID, Interest, InterestTypeDescription, LoanDurationDescription, CollateralName, CollateralDescription, GroupName, GroupDescription FROM vwGroupLoan WHERE (LoanID = @LoanID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="LoanID" QueryStringField="lid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
</asp:Content>
