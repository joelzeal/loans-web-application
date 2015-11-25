<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="SearchPage.aspx.cs" Inherits="LoanWebApplication4.admin.SearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 108px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background: #F9F9F9; padding: 20px">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr valign="middle">
                <td valign="middle">
                    Search:
                </td>
                <td valign="middle">
                    &nbsp;
                    <asp:TextBox ID="txtSearch" runat="server" Width="433px"></asp:TextBox>
                </td>
                <td valign="middle">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="../images/searchButton.png" runat="server"
                        OnClick="ImageButton1_Click" />
                </td>
            </tr>
        </table>
    </div>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" class="style1">
                <br />
                <asp:LinkButton ID="btnMembers" runat="server" OnClick="btnMembers_Click">Members</asp:LinkButton>
                <br />
                <asp:LinkButton ID="btnGroup" runat="server" OnClick="btnGroup_Click">Groups</asp:LinkButton>
                <br />
            </td>
            <td>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="MemberView" runat="server">
                        <h3>
                            <strong>Search Results (Members)</strong></h3>
                        <div style="border-bottom: 1px solid gray">
                        </div>
                        <br />
                        <asp:Label ID="lblNoResults" runat="server" Style="font-style: italic" Text="No match found for your search."
                            Visible="false"></asp:Label>
                        <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                            <ItemTemplate>
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
                                                     <asp:HyperLink ID="hplInvestments" Text="Investments" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                  <asp:HyperLink ID="hplLoans" Text="Loans" runat="server" />
                                                        <%--<asp:Label ID="Label1" runat="server" Text='<%# "Balance: " + Eval("Balance") %>'></asp:Label>--%>
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
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:View>
                    <asp:View ID="GroupView" runat="server">
                        <h3>
                            <strong>Search Results (Groups)</strong></h3>
                        <div style="border-bottom: 1px solid gray">
                        </div>
                        <br />
                        <asp:Label ID="lblGroupMessage" runat="server" Style="font-style: italic" Text="No match found for your search."
                            Visible="False"></asp:Label><asp:Repeater ID="GroupResultsRepeater" runat="server"
                                OnItemDataBound="GroupResultsRepeater_ItemDataBound">
                                <ItemTemplate>
                                    <asp:HyperLink ID="mainLink" runat="server">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr valign="top">
                                                <td>
                                                    <asp:Image ID="Image1" Width="50px" ImageUrl="~/images/Groups.png" CssClass="memberImageBox2"
                                                        runat="server" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" style="margin-left: 10px; width: 100%">
                                                        <tr>
                                                            <td>
                                                                <b>
                                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("GroupName") %>' /></b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# "Description: " + Eval("Description") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# "Number of Members: " + Eval("GroupMemberCount") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                             <asp:HyperLink ID="hplGroupInvestments" Text="Investments" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                  <asp:HyperLink ID="hplGroupLoans" Text="Loans" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:HyperLink><br /></ItemTemplate></asp:Repeater></asp:View></asp:MultiView></td></tr></table><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
