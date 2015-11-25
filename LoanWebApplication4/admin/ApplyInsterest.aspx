<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="ApplyInsterest.aspx.cs" Inherits="LoanWebApplication4.admin.ApplyInsterest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 119px;
        }
        .style2
        {
            width: 256px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        Apply Interest</h1>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                Account Type:</td>
            <td class="style2">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="250px" 
                    AutoPostBack="True" DataSourceID="AccountTypesSqlDataSource" 
                    DataTextField="Description" DataValueField="AccountTypeId" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    ondatabound="DropDownList1_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="AccountTypesSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                    SelectCommand="SELECT * FROM [AccountTypes] ORDER BY [Description]">
                </asp:SqlDataSource>
            </td>
            <td>
                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                ControlToValidate="DropDownList1" ErrorMessage="*" Operator="NotEqual" 
                                SetFocusOnError="True" style="color: #CC3300" 
                                ValueToCompare="-----Select Account Type------"></asp:CompareValidator>
                            </td>
        </tr>
        <tr>
            <td class="style1">
                Rate:</td>
            <td class="style2">
                <asp:TextBox ID="TextBox1" runat="server" Width="245px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Rate is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="Button1" runat="server" Text="Apply Interest" 
                    onclick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                
            </td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                ValidationGroup="vg1234">Check All</asp:LinkButton>
            &nbsp;&nbsp;
           <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" 
                ValidationGroup="vg1234">Uncheck All</asp:LinkButton>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Width="100%" AutoGenerateColumns="False" 
                DataSourceID="vwMembersWithInvestmentsSqlDataSource" 
                DataKeyNames="InvestmentID">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField SortExpression="MemberId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MemberId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                Text=" " />
                        </ItemTemplate>
                        <HeaderStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="InvestmentID" HeaderText="InvestmentID" 
                        SortExpression="InvestmentID" Visible="False" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AccountNumber" HeaderText="AccountNumber" 
                        SortExpression="AccountNumber">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MemberId" HeaderText="MemberId" 
                        SortExpression="MemberId" Visible="False" />
                    <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" 
                        SortExpression="AccountTypeID" Visible="False" />
                    <asp:BoundField DataField="TotalInterestApplied" 
                        HeaderText="Total Interest Applied" SortExpression="TotalInterestApplied">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Balance" SortExpression="Balance">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Balance") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Balance") %>'></asp:Label>
                            <asp:HiddenField ID="HiddenField1" runat="server" 
                                Value='<%# Eval("InvestmentID") %>' />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="vwMembersWithInvestmentsSqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                
                SelectCommand="SELECT * FROM [vwMembersWithInvestments] WHERE ([AccountTypeID] = @AccountTypeID) ORDER BY [Name]" 
                onselecting="vwMembersWithInvestmentsSqlDataSource_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="AccountTypeID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
