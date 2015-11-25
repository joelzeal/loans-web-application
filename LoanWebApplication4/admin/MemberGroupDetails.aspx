<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="MemberGroupDetails.aspx.cs" Inherits="LoanWebApplication4.MemberGroupDetails" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
        .style3
        {
            height: 26px;
        }
        .style4
        {
            height: 26px;
            width: 125px;
        }
        .style5
        {
            width: 95px;
        }
        .style6
        {
            height: 26px;
            width: 179px;
        }
        .style7
        {
            width: 179px;
        }
        .style8
        {
            width: 125px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Group Details</h1>
   <%-- <asp:HyperLink ID="HyperLink1" runat="server" Style="font-weight: 700">Withdrawal</asp:HyperLink>&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" Style="font-weight: 700">Deposit</asp:HyperLink>--%>
    <div class="links">
         <asp:HyperLink ID="InvestmentHyperLink" runat="server" Style="font-weight: 700">Investment</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="LoanHyperLink" runat="server" style="font-weight: 700">Loan</asp:HyperLink>
    </div>
   <div class="seperator"></div>
    <div>
            <asp:ValidationSummary CssClass="errorDiv" ID="ValidationSummary1" runat="server" />
        <div class="seperator"></div>
        <div class="DataSection">
                    <table style="width: 98%;">
                        <tr>
                            <td class="style4">
                                Group Name:
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="txtGroupName" runat="server" Width="300px" />
                            </td>
                            <td class="style3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtGroupName" ErrorMessage="Group name is required" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                Description:
                            </td>
                            <td class="style7">
                                <asp:TextBox ID="txtDecription" runat="server" Width="300px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style8">
                                Branch:</td>
                            <td class="style7">
                                <asp:DropDownList ID="cboBranches" runat="server" 
                                    DataSourceID="BranchesSqlDataSource" DataTextField="BranchName" 
                                    DataValueField="BranchID" Width="300px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="BranchesSqlDataSource" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                    SelectCommand="SELECT * FROM [Branches] ORDER BY [BranchName]">
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style8">
                                Account Number:</td>
                            <td class="style7">
                                <asp:ScriptManager ID="ScriptManager2" runat="server">
                                </asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtAccountNumber" runat="server" Width="300px" />
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox1" runat="server" 
                                    Text="Auto generate account number" AutoPostBack="True" 
                                    oncheckedchanged="CheckBox1_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                Account Type:</td>
                            <td class="style7">
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="AccountsTypeSqlDataSource" DataTextField="Description" 
                                    DataValueField="AccountTypeId" Width="300px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="AccountsTypeSqlDataSource" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                                    SelectCommand="SELECT * FROM [AccountTypes] ORDER BY [Description]">
                                </asp:SqlDataSource>
                                
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style1" colspan="3">
                                <h4 style="border-style: solid none none none; border-width: 1px; border-color: #99CCFF">
                                    &nbsp;</h4></td>
                        </tr>
                      
                           </table>
                           <table>
                              <tr>
                            <td class="style1">
                                <strong>Group Members:</strong></td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style1">
                                <strong>Members:</strong></td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:TextBox ID="txtSearch1" runat="server" Width="336px" Visible="False"></asp:TextBox>
                            </td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style1">
                                <asp:TextBox ID="txtSearch2" runat="server" Width="336px" Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:ListBox ID="lstMembers" runat="server" Height="284px" Width="336px">
                                </asp:ListBox>
                                        </ContentTemplate>
                                   
                                </asp:UpdatePanel>
                            </td>
                            <td class="style7" align="center">
                                <asp:ImageButton ID="ImageButton2" runat="server" 
                                    ImageUrl="~/images/Leftarrow.png" onclick="ImageButton2_Click" 
                                    ToolTip="Add member"  /><br />
                                <asp:ImageButton ID="ImageButton3" runat="server" 
                                    ImageUrl="~/images/Rightarrow.png" onclick="ImageButton3_Click" 
                                    ToolTip="Remove member" />
                            </td>
                            <td class="style1">
                                <asp:ListBox ID="lstNonMembers" runat="server" Height="284px" Width="336px">
                                </asp:ListBox>
                            </td>
                        </tr>
                           <tr>
                            <td class="style5">
                                &nbsp;</td>
                            <td class="style7">
                                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                                &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" 
                                    onclick="Button2_Click" />
                               </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                           </table>
                           </div>
    </div>
    <br />
</asp:Content>
