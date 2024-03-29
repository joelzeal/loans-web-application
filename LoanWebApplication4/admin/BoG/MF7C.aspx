﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="MF7C.aspx.cs" Inherits="LoanWebApplication4.admin.MF7C" %>
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
    <h2>Monthly Report on Twenty (20) Largest Depositors Report - MF7C</h2>
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
                &nbsp;</td>
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
        </tr>
    </table>    
 </div>
    <div class="seperator"></div>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" 
        Font-Names="Verdana" Font-Size="8pt" Height="100%" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\BoG\rptInvestments_TopTen.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ExposuresSqlDatasouce" 
                    Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="ExposuresSqlDatasouce" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="spGetInvestmentForMembersAndGroups_TopTen" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStartDate" DefaultValue="1/1/2000" 
                Name="StartDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEndDate" DefaultValue="1/1/2000" 
                Name="EndDate" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="InvestmentTypeID" Type="Int32" />
            <asp:Parameter Name="InvestmeneDescriptionID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT  top(1) * FROM [CompanyProfile]"></asp:SqlDataSource>
</asp:Content>
