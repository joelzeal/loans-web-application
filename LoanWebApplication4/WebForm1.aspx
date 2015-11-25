<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LoanWebApplication4.WebForm1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td>
                                 <asp:HyperLink ID="mainLink" runat="server">
                                    <asp:Image ID="Image1" Width="50px" CssClass="memberImageBox2" runat="server" />
                                    </asp:HyperLink>
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" style="margin-left: 10px; width: 100%">
                                        <tr>
                                            <td>
                                                <b>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("MemberFirstName") +" "+ Eval("MemberLastName") + " - "+ Eval("AccountNumber")  %>' /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                               <asp:HyperLink ID="hplInvestments" Text="Investments" runat="server" />&nbsp;
                                                  <asp:HyperLink ID="hplLoans" Text="Loans" runat="server" />
                                                <%--<asp:Label ID="Label1" runat="server" Text='<%# "Balance: " + Eval("Balance") %>'></asp:Label>--%>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                </asp:ScriptManager>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1183px">
        <LocalReport ReportPath="Reports\rptAppliedFeatureDetailsType1_sub.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource2" 
                    Name="AppliedFeatureDetailsDataSet" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT Description, FeatureDescription, AppliedDate, AppliedBy, ActionInitiatedBy, IsPercentage, ValueToApply, MemberName, AccountNumber, AppliedValue, AppliedFeatureHistoryId FROM vwAppliedAccountTypeFeatureDetails">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [AppliedDeduction]"></asp:SqlDataSource>
    </form>
   </body>
</html>
