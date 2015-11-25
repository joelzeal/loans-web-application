<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="RecordMobileBankerCashCollection.aspx.cs" Inherits="LoanWebApplication4.admin.RecordMobileBankerCashCollection" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%--<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            width: 118px;
        }
        .style5
        {
            width: 50px;
        }
        .style7
        {
        }
        .style8
        {
            width: 122px;
        }
        .style9
        {
            width: 118px;
            font-size: medium;
        }
        .style10
        {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>
   Mobile Banker Cash Collection - <asp:Label ID="lblMobileBanker" runat="server" Text="Label"></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</h2>
<br />
<div class="DataSection">
    <asp:DataList ID="DataList1" runat="server" Width="100%" 
        DataKeyField="MemberId" RepeatColumns="2" RepeatDirection="Horizontal" 
        ShowFooter="False" Font-Bold="False" Font-Italic="False" 
        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
        HorizontalAlign="Justify">
        <ItemTemplate>
            <table >
                <tr>
                    <td class="style8" rowspan="4">
                        <asp:Image CssClass="memberImageBox2" ID="Image1" runat="server"  Height="94px" Width="94px"
                            ImageUrl='<%# "ImageDisplay.ashx?mid=" + Eval("MemberId") %>' />
                    </td>
                    <td class="style9">
                        <strong>Member:</strong></td>
                    <td class="style7">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' 
                            style="font-size: medium; font-weight: 700;"></asp:Label>
                        &nbsp;<span class="style10">-</span>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("AccountNumber") %>' 
                            style="font-size: medium; font-weight: 700;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Date:</td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Convert.ToDateTime( Eval("PaymentDate")).ToString("dd-MMM-yyyy")  %>' 
                            Width="200px"></asp:TextBox>
                       <%-- <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                            TargetControlID="TextBox1">
                        </asp:CalendarExtender>--%>
                        <asp:CalendarExtender ID="TextBox1_CalendarExtender" Format="dd-MMM-yyyy" runat="server" 
                            TargetControlID="TextBox1">
                        </asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red" 
                            ValidationGroup="vg12"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Contribution By:</td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("ContributedBy") %>' 
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red" 
                            ValidationGroup="vg12"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style3">
                        <strong>Amount:</strong></td>
                    <td class="style7">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#  Eval("PaidAmount") %>' 
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red" 
                            ValidationGroup="vg12"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            </table>
            <asp:HiddenField ID="HiddenField1" runat="server" 
                Value='<%# Eval("MemberId") %>' />
            <br />
            <div style="border-top:1px dotted gray;height:25px"></div>
        </ItemTemplate>
    </asp:DataList>
    
     <table style="width: 100%;">
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </td>
            
        </tr>
     
    </table>
    </div>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [Members]"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server">
    </asp:ObjectDataSource>

</asp:Content>
