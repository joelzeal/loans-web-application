<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="SUSUContributionReceipt_Group.aspx.cs" Inherits="LoanWebApplication4.admin.SUSUContributionReceipt_Group" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register src="../UserControls/GroupInvestmentToolBarWebUserControl.ascx" tagname="GroupInvestmentToolBarWebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                 <h2>SUSU Contribution Receipt</h2>&nbsp;</td>
            <td align="right">
                
                <%--<uc1:InvestmentToolBarWebUserControl ID="InvestmentToolBarWebUserControl1" 
                    runat="server" />--%>

                <uc1:GroupInvestmentToolBarWebUserControl ID="GroupInvestmentToolBarWebUserControl1" 
                    runat="server" />

            </td>
        </tr>
    </table>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <rsweb:ReportViewer Width="100%" Height="700px" ID="ReportViewer1" 
            runat="server" Font-Names="Verdana" Font-Size="8pt" 
            InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
            WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Reports\SUSUContributionReceipt_Group.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="GroupsSqlDataSource" 
                        Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="CompanyProfileSqlDataSource" 
                        Name="DataSet3" />
                    <rsweb:ReportDataSource DataSourceId="vwSUSUContributionsSqlDataSource" 
                        Name="DataSet2" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="GroupsSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            SelectCommand="SELECT * FROM [LoanGroups] WHERE ([GroupId] = @GroupId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="GroupId" QueryStringField="gid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="vwSUSUContributionsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT ContributionId, InvestmentId, ContributionAmount, CreatedDate, CreatedBy, Description, ContributionBy, RecievedBy, ContributionScheduleID, ContributionAmountInWords, ReceiptNumber, TotalContribution FROM vwSUSUContributionReceipt WHERE (ContributionId = @contributionId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="contributionId" QueryStringField="cid" />
            </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="CompanyProfileSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            SelectCommand="SELECT TOP (1) CompanyName, CompanyId, address, Email, website, EndOfDayLastRunDate, DefaultInterestRateTypeId, SimpleInterestRate, CompoundFrequency, CompoundInterestRate, DefaultersInteresty, ExcludeSundaysFromCalculations, ExcludeSaturdayFromCalculations, CompanyLogo, LogoFileExt, AutoGenerateAccountNumbers FROM CompanyProfile">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="contributionSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            
            SelectCommand="SELECT Contributions.*, ContributionId AS Expr1 FROM Contributions WHERE (ContributionId = @ContributionId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContributionId" QueryStringField="cid" />
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
