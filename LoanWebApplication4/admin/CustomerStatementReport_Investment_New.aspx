<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="CustomerStatementReport_Investment_New.aspx.cs" Inherits="LoanWebApplication4.admin.CustomerStatementReport_Investment_New" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 73px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Customer Investment Statement</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<br />
<div class="reportParamterSection">
    <table border="0" cellpadding="0" cellspacing="5" >
        <tr>
            <td>
                &nbsp;</td> 
            <td>
                &nbsp;</td>
        </tr>
          <tr>
            <td>
                Select a member/group from the dropdown list below or add a new member/group to proceed.</td> 
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
               <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    Width="102px" AutoPostBack="True">
                    <asp:ListItem>Individual</asp:ListItem>
                    <asp:ListItem>Group</asp:ListItem>
                </asp:RadioButtonList></td> 
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
               <div >
        
 

    <table border="0" server="true" id="tblMember" visible="false" width="100%" runat="server" cellpadding="0" cellspacing="0">
        <tr>
            <td class="style2">

                Member:</td>
             <td>
              <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="MembersSqlDataSource"
                                DataTextField="Member" DataValueField="MemberId" ondatabound="DropDownList1_DataBound"
                               >
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table  border="0" server="true" visible="false" id="tblGroup" width="100%" runat="server" cellpadding="0" cellspacing="0">
        <tr>
            <td class="style2">

                Group:</td>
             <td>
              <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:DropDownList ID="cboGroupName" runat="server" DataSourceID="MemberGroupsSqlDataSource"
                                DataTextField="GroupName" DataValueField="GroupId"
                                >
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
     </div>
            </td> 
            <td>
                &nbsp;</td>
        </tr>
         
         <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Run" onclick="Button1_Click" 
                    Width="200px" />
                            <asp:SqlDataSource ID="MemberGroupsSqlDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                SelectCommand="SELECT * FROM [vwGroups] ORDER BY [GroupName]">
                            </asp:SqlDataSource>
                
               
                <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
                    SelectCommand="SELECT * FROM [MembersView] ORDER BY [Member]"></asp:SqlDataSource>
            </td>
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
        <LocalReport ReportPath="Reports\rptCustomerStatement_Investment_new.rdlc">
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
        SelectCommand="spInvestmentTransactions" 
    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="InvestmentID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="AppliedInterestSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [AppliedInterest] WHERE (([InvestmentID] = @InvestmentID) AND ([IsDeleted] = @IsDeleted)) ORDER BY [CreatedDate]">
        <SelectParameters>
            <asp:Parameter Name="InvestmentID" Type="Int32" />
            <asp:Parameter DefaultValue="False" Name="IsDeleted" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="AppliedDeductionsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        
        
        SelectCommand="SELECT AppliedDeductionID, InvestmentID, Rate, CreatedDate, CreatedBy, DeductionAmount, IsDeleted FROM AppliedDeduction WHERE (InvestmentID = @InvestmentID) ORDER BY CreatedDate">
        <SelectParameters>
            <asp:Parameter Name="InvestmentID" Type="Int32" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
