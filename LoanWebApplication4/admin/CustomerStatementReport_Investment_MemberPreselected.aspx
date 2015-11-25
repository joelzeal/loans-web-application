<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="CustomerStatementReport_Investment_MemberPreselected.aspx.cs" Inherits="LoanWebApplication4.admin.CustomerStatementReport_Investment_MemberPreselected" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Customer Investment Statement</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<br />
<div class="reportParamterSection">
 </div>
    <div class="seperator"></div>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" Height="100%" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\rptCustomerStatement_Investment_Imperial_Trust.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="InvestmentsSqlDataSource" 
                    Name="InvestmentDataSet" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="InvestmentsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="spGetInvestmentForMembersAndGroupsByID" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="MemberID" Type="Int32" />
            <asp:Parameter Name="GroupID" Type="Int32" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="InvestmentTransactionsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="spInvTransactionsWithInterestAndCharges" 
    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="InvestmentID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--<asp:SqlDataSource ID="AppliedInterestSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [AppliedInterest] WHERE (([InvestmentID] = @InvestmentID) AND ([IsDeleted] = @IsDeleted)) ORDER BY [CreatedDate]">
        <SelectParameters>
            <asp:Parameter Name="InvestmentID" Type="Int32" />
            <asp:Parameter DefaultValue="False" Name="IsDeleted" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
    <%--<asp:SqlDataSource ID="AppliedDeductionsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        SelectCommand="SELECT * FROM AppliedDeduction WHERE (InvestmentID = @InvestmentID)">
        <SelectParameters>
            <asp:Parameter Name="InvestmentID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
</asp:Content>
