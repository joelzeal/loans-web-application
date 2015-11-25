<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="MobileBankerDetails.aspx.cs" Inherits="LoanWebApplication4.MobileBankerDetails" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
        .style3
        {
            height: 26px;
            width: 181px;
        }
        .style5
        {
        }
        .style7
        {
            width: 179px;
        }
        .style2
        {
            width: 307px;
        }
        .style8
        {
            width: 162px;
        }
        .style9
        {
            width: 270px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1>
        Mobile Banker Details</h1>
    <br />
    <div>
        <div class="DataSection">


                    <table style="width:100%;">
                        <tr>
                            <td class="style9" rowspan="8" >
                                   <table border="0" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td >
                                <asp:Image ID="Image1" Width="190px" CssClass="memberImageBox" runat="server" ImageUrl="~/images/NoImage.png" />
                                <center>
                                    Member Photo
                                </center>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<asp:LinkButton ID="LinkButton1"   runat="server" onclick="LinkButton1_Click">Upload Photo</asp:LinkButton>--%>
                                <asp:FileUpload ID="FileUpload1"  runat="server" Width="190px" />
                            </td>
                        </tr>
                    </table></td>
                            <td class="style8" >
                                FirstName:
                            </td>
                            <td class="style2" >
                                <asp:TextBox ID="FirstNameTextBox" runat="server" 
                            Text='<%# Bind("FirstName") %>' Width="300px" />
                            </td>
                            <td class="style3" >
                                &nbsp;</td>
                            <td >
                                Address:</td>
                            <td rowspan="3" valign="top">
                                <asp:TextBox ID="AddressTextBox" runat="server" Height="63px" 
                            Text='<%# Bind("Address") %>' Width="400px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td >
                                &nbsp;</td>
                        </tr>
                        <tr >
                            <td class="style8" >
                                OtherName:</td>
                            <td class="style2" >
                                <asp:TextBox ID="OtherNameTextBox" runat="server" 
                            Text='<%# Bind("OtherName") %>' Width="300px" />
                            </td>
                            <td class="style3" >
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style8" >
                                LastName:
                            </td>
                            <td class="style2" >
                                <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' 
                            Width="300px" />
                            </td>
                            <td class="style3" >
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td __designer:mapid="1b6">
                                &nbsp;</td>
                        </tr>
                        <tr __designer:mapid="1b7">
                            <td class="style8" __designer:mapid="1b8">
                                Telephone:
                            </td>
                            <td class="style2" __designer:mapid="1b9">
                                <asp:TextBox ID="TelephoneTextBox" runat="server" 
                            Text='<%# Bind("Telephone") %>' Width="300px" />
                            </td>
                            <td class="style3" __designer:mapid="1bb">
                                &nbsp;</td>
                            <td __designer:mapid="1bc">
                                &nbsp;</td>
                            <td __designer:mapid="1bd">
                                &nbsp;</td>
                            <td __designer:mapid="1be">
                                &nbsp;</td>
                        </tr>
                        <tr __designer:mapid="1bf">
                            <td class="style8" __designer:mapid="1c0">
                                Mobile Banker Code:</td>
                            <td class="style2" __designer:mapid="1c1">
                                <asp:TextBox ID="MobileBankerCodeTextBox" runat="server" 
                            Text='<%# Bind("MobileBankerCode") %>' Width="300px" />
                            </td>
                            <td class="style3" __designer:mapid="1c3">
                                &nbsp;</td>
                            <td __designer:mapid="1c4">
                                &nbsp;</td>
                            <td __designer:mapid="1c5">
                                &nbsp;</td>
                            <td __designer:mapid="1c6">
                                &nbsp;</td>
                        </tr>
                        <tr __designer:mapid="1c7">
                            <td class="style8" __designer:mapid="1c8">
                                &nbsp;</td>
                            <td class="style2" __designer:mapid="1c9">
                                &nbsp;</td>
                            <td class="style3" __designer:mapid="1cc">
                                &nbsp;</td>
                            <td __designer:mapid="1cd">
                                &nbsp;</td>
                            <td __designer:mapid="1ce">
                                &nbsp;</td>
                            <td __designer:mapid="1cf">
                                &nbsp;</td>
                        </tr>
                        <tr __designer:mapid="1c7">
                            <td class="style8" __designer:mapid="1c8">
                                &nbsp;</td>
                            <td class="style2" __designer:mapid="1c9">
                                &nbsp;</td>
                            <td class="style3" __designer:mapid="1cc">
                                &nbsp;</td>
                            <td __designer:mapid="1cd">
                                &nbsp;</td>
                            <td __designer:mapid="1ce">
                                &nbsp;</td>
                            <td __designer:mapid="1cf">
                                &nbsp;</td>
                        </tr>
                        <tr __designer:mapid="1c7">
                            <td class="style8" __designer:mapid="1c8">
                                &nbsp;</td>
                            <td class="style2" __designer:mapid="1c9">
                                &nbsp;</td>
                            <td class="style3" __designer:mapid="1cc">
                                &nbsp;</td>
                            <td __designer:mapid="1cd">
                                &nbsp;</td>
                            <td __designer:mapid="1ce">
                                &nbsp;</td>
                            <td __designer:mapid="1cf">
                                &nbsp;</td>
                        </tr>
                    </table>
                           <hr  />
                           <table>
                              <tr>
                            <td class="style1">
                                &nbsp;</td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style1">
                                &nbsp;</td>
                        </tr>
                              <tr>
                            <td class="style1">
                                <strong>Mobile Banker&#39;s Customers:</strong></td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style1">
                                <strong>Availbale Customers:</strong></td>
                        </tr>
                     <%--   <tr>
                            <td class="style1">
                                <asp:TextBox ID="txtSearch1" runat="server" Width="336px" Visible="False"></asp:TextBox>
                            </td>
                            <td class="style7">
                                &nbsp;</td>
                            <td class="style1">
                                <asp:TextBox ID="txtSearch2" runat="server" Width="336px" Visible="False"></asp:TextBox>
                            </td>
                        </tr>--%>
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
                            <td class="style5" colspan="3">
                            <center>
                                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />&nbsp;<asp:Button 
                                    ID="btnSaveAndExit" runat="server" Text="Save and Exit" 
                                    onclick="btnSaveAndExit_Click"  />
                                &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" 
                                    onclick="Button2_Click" /></center>
                               </td>
                        </tr>
                           </table>
                           </div>
    </div>
    <br />
</asp:Content>
