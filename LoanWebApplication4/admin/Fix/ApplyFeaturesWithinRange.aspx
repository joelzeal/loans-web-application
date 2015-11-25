<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="ApplyFeaturesWithinRange.aspx.cs" Inherits="LoanWebApplication4.admin.ApplyFeaturesWithinRange" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 46px;
        }
        .style4
        {
            width: 64px;
        }
        .style5
        {
            width: 110px;
        }
        .style6
        {
            width: 204px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Applied Interest Report</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<br />
<table border="0" cellpadding="0" cellspacing="5" >
    <tr>
            <td class="style5" valign="top">
                Account Type:</td>
            <td class="style2" valign="top">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="250px" 
                    AutoPostBack="True" DataSourceID="AccountTypesSqlDataSource" 
                    DataTextField="Description" DataValueField="AccountTypeId" 
                    >
                </asp:DropDownList>
                <asp:SqlDataSource ID="AccountTypesSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                    SelectCommand="SELECT * FROM [AccountTypes] ORDER BY [Description]">
                </asp:SqlDataSource>
            </td>
            <td valign="top" class="style6">
                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                ControlToValidate="DropDownList1" ErrorMessage="*" Operator="NotEqual" 
                                SetFocusOnError="True" style="color: #CC3300" 
                                ValueToCompare="-----Select Account Type------"></asp:CompareValidator>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
        </tr>
         
        <tr>
            <td class="style5">Start Date:
            </td>
            <td>
                <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtStartDate_CalendarExtender" runat="server" 
                    TargetControlID="txtStartDate" Format="dd-MMM-yyyy">
                </asp:CalendarExtender>
            </td> <td align="right" class="style6">End Date:
            </td>
            <td>
                <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" 
                    TargetControlID="txtEndDate" Format="dd-MMM-yyyy">
                </asp:CalendarExtender>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                 &nbsp;</td>
        </tr>
         
         <tr>
            <td class="style5">&nbsp;</td>
            <td>
                <asp:LinkButton Text="Apply Account Type features" CssClass="button" 
                    runat="server" onclick="Unnamed1_Click" />
            </td><td class="style6">&nbsp;</td>
            <td>
               
            </td>
            <td class="style4">
               
                &nbsp;</td>
            <td>
               
                &nbsp;</td>
        </tr>
    </table>
    <div class="seperator"></div>
    </asp:Content>
