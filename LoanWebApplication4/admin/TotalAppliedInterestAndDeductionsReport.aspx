<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="TotalAppliedInterestAndDeductionsReport.aspx.cs" Inherits="LoanWebApplication4.admin.TotalAppliedInterestAndDeductionsReport" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        width: 165px;
    }
    .style2
    {
        width: 180px;
        text-align: right;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2> Applied interests and deductions Summary Report</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<br />
<div class="reportParamterSection">
    <table border="0" cellpadding="0" cellspacing="5" >
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td> <td align="right" class="style1">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
         
        <tr>
            <td>Start Date:
            </td>
            <td>
                <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtStartDate_CalendarExtender" runat="server" 
                    TargetControlID="txtStartDate" Format="dd-MMM-yyyy">
                </asp:CalendarExtender>
            </td> <td align="right" class="style1">End Date:
            </td>
            <td>
                <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" 
                    TargetControlID="txtEndDate" Format="dd-MMM-yyyy">
                </asp:CalendarExtender>
            </td>
        </tr>
         
         <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Run" onclick="Button1_Click" />
            </td><td class="style1">&nbsp;</td>
            <td>
               
            </td>
        </tr>
    </table>    
 </div>
    <div class="seperator"></div>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" Height="100%" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\rptAppliedInterestsAndDeductionsSummary.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="spGetAppliedDeductionsSummaryDataSource" 
                    Name="DataSet1" />
                <rsweb:ReportDataSource DataSourceId="spGetAppliedInsterestSummarySqlDataSource" 
                    Name="DataSet2" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="spGetAppliedDeductionsSummaryDataSource" 
    runat="server" 
    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
    SelectCommand="spGetAppliedDeductionsSummary" 
    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStartDate" Name="StartDate" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEndDate" Name="EndDate" PropertyName="Text" 
                Type="DateTime" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="spGetAppliedInsterestSummarySqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="spGetAppliedInsterestSummary" 
    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStartDate" Name="StartDate" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEndDate" Name="EndDate" PropertyName="Text" 
                Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
</asp:Content>
