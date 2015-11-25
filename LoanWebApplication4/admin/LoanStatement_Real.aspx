<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="LoanStatement_Real.aspx.cs" Inherits="LoanWebApplication4.admin.LoanStatement_Real" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register src="../UserControls/LoansToolBarWebUserControl.ascx" tagname="LoansToolBarWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
     <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td> <h2>  Loan Statement </h2>
            </td>
             <td align="right">
                 <uc1:LoansToolBarWebUserControl ID="LoansToolBarWebUserControl1" 
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
        <LocalReport ReportPath="Reports\LoanStatement.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="vwMemberLoansSqlDataSource" 
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
    <asp:SqlDataSource ID="vwMemberLoansSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [vwMemberLoan] WHERE ([LoanID] = @LoanID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="LoanID" QueryStringField="lid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
</asp:Content>
