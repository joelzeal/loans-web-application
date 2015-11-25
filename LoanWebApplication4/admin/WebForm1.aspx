<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LoanWebApplication4.admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:GridView ID="FriendGridView" runat="server" AutoGenerateColumns="False" OnRowDataBound="FriendGridView_RowDataBound"
                        OnSelectedIndexChanged="FriendGridView_SelectedIndexChanged" 
            CellPadding="4" ForeColor="#333333" 
            GridLines="None" DataKeyNames="RepaymentScheduleId" 
        DataSourceID="LoanScheduleSqlDataSource">
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:TemplateField HeaderText="Repayment Date" SortExpression="Repayment Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RepaymentDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Bind("RepaymentDate", "{0:D}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RepaymentScheduleId" 
                                HeaderText="RepaymentScheduleId" InsertVisible="False" ReadOnly="True" 
                                SortExpression="RepaymentScheduleId" Visible="False" />
                            <asp:TemplateField HeaderText="Expected Repayment Amount" 
                                SortExpression="ExpectedRepaymentAmount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" 
                                        Text='<%# Bind("ExpectedRepaymentAmount") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("ExpectedRepaymentAmount", "{0:C}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Balance" HeaderText="Balance" 
                                SortExpression="Balance" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
    <asp:SqlDataSource ID="LoanScheduleSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        SelectCommand="SELECT * FROM [RepaymentSchedule]"></asp:SqlDataSource>
</asp:Content>
