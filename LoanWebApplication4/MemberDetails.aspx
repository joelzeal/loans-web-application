<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberDetails.aspx.cs" Inherits="LoanWebApplication4.MemberDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 92px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <h1>Member Details</h1>
    <asp:HyperLink ID="HyperLink1" runat="server" style="font-weight: 700">Withdrawal</asp:HyperLink>&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" style="font-weight: 700">Deposit</asp:HyperLink> 
            <div >
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                         <asp:Image ID="Image1" Height="200px" CssClass="memberImageBox"  runat="server" />
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                </table>
               
            </div>
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="style1">
                        First Name:
                    </td>
                    <td>
                        <asp:TextBox ID="MemberFirstNameTextBox" runat="server" 
                             Width="200px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Last Name:
                    </td>
                    <td>
                        <asp:TextBox ID="MemberLastNameTextBox" runat="server" 
                           Width="200px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Branch:
                    </td>
                    <td>
                        <asp:TextBox ID="MemberBranchTextBox" runat="server" 
                            Width="200px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Balance:
                    </td>
                    <td>
                        <asp:TextBox ID="BalanceTextBox" runat="server" ReadOnly="True" 
                            Width="200px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Save" onclick="Button1_Click" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
</asp:Content>
