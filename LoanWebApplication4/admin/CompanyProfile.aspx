<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="LoanWebApplication4.admin.CompanyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     
    <style type="text/css">
        .style1
        {
            width: 149px;
        }
    </style>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
    Company Profile
</h2>
<br />
   <div class="DataSection">
   <table >
                <tr>
                    <td class="style1">
                        Company Name:
                    </td>
                    <td>
                        <asp:TextBox ID="CompanyNameTextBox" runat="server" 
                            Text='<%# Bind("CompanyName") %>' Width="320px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Address:
                    </td>
                    <td>
                        <asp:TextBox ID="addressTextBox" runat="server" Height="76px" 
                            Text='<%# Bind("address") %>' TextMode="MultiLine" Width="350px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' 
                            Width="320px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Website:
                    </td>
                    <td>
                        <asp:TextBox ID="websiteTextBox" runat="server" Text='<%# Bind("website") %>' 
                            Width="320px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Category of RMFI:</td>
                    <td>
                        <asp:TextBox ID="RMFICategoryText" runat="server" Text='<%# Bind("RMFICategory") %>' 
                            Width="320px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:Image ID="Image1" ImageUrl="~/LogoHandler.ashx" runat="server" Height="105px" Width="143px" />
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                             Text="Save" onclick="UpdateButton_Click" />
                        &nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
   </div>
</asp:Content>
