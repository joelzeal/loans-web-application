<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="LoansDisbursedReport.aspx.cs" Inherits="LoanWebApplication4.admin.LoansDisbursedReport" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Loans Disbursed Report</h2>
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
            <td>
                &nbsp;</td>
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
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Loan Type:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="LoanTypesSqlDataSource" DataTextField="Description" 
                    DataValueField="LoanTypeId" ondatabound="DropDownList1_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="LoanTypesSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                    SelectCommand="SELECT * FROM [LoanTypes] ORDER BY [Description]">
                </asp:SqlDataSource>
            </td>
        </tr>
         
         <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Run" onclick="Button1_Click" />
            </td><td class="style1">&nbsp;</td>
            <td>
               
            </td>
            <td>
               
                &nbsp;</td>
            <td>
               
                &nbsp;</td>
        </tr>
    </table>    
 </div>
    <div class="seperator"></div>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" Height="100%" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\rptLoansDisbursed.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="DisbursedLoansSqlDataSource" 
                    Name="DataSet1" />
                <rsweb:ReportDataSource DataSourceId="TotalsSqlDataSource" Name="DataSet2" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="TotalsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="spGetLoansForMembersAndGroups_Totals" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStartDate" Name="StartDate" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEndDate" Name="EndDate" PropertyName="Text" 
                Type="DateTime" />
            <asp:ControlParameter ControlID="DropDownList1" Name="LoanTypeID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DisbursedLoansSqlDataSource0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="spGetLoansForMembersAndGroups" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1/1/2000" Name="StartDate" Type="DateTime" />
            <asp:Parameter DefaultValue="1/1/2000" Name="EndDate" Type="DateTime" />
            <asp:Parameter DefaultValue="" Name="LoanTypeID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DisbursedLoansSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="spGetLoanTypesForMembersAndGroups" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStartDate" DefaultValue="1/1/2000" 
                Name="StartDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEndDate" DefaultValue="1/1/2000" 
                Name="EndDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" 
                Name="LoanTypeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
