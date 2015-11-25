<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="LoanDefaults.aspx.cs" Inherits="LoanWebApplication4.LoanDefaults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Loan Defaults</h2>
<br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="100%" AutoGenerateColumns="False" 
    DataKeyNames="LoanID" DataSourceID="DefaultersSqlDataSource">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Member">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("IsGroup").ToString().ToLower() == "true" ?  Eval("LoanID", "~/admin/GroupLoanRepayment.aspx?lid={0}") + "&gid=" + Eval("MemberID") : Eval("LoanID", "~/admin/LoanRepayment.aspx?lid={0}") + "&mid=" + Eval("MemberID") %>' 
                        Text='<%# Eval("MemberName") %>'></asp:HyperLink>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="MemberName" HeaderText="MemberName" ReadOnly="True" 
                SortExpression="MemberName" Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Amount" DataFormatString="{0:C}" HeaderText="Amount" 
                SortExpression="Amount">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="ExpectedRepaymentEndDate" 
                HeaderText="ExpectedRepaymentEndDate" SortExpression="ExpectedRepaymentEndDate">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Duration" HeaderText="Duration" 
                SortExpression="Duration">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="TotalRepayment" DataFormatString="{0:C}" 
                HeaderText="TotalRepayment" ReadOnly="True" SortExpression="TotalRepayment">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="LoanID" HeaderText="LoanID" ReadOnly="True" 
                SortExpression="LoanID" Visible="False" />
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
<asp:SqlDataSource ID="DefaultersSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
    SelectCommand="SELECT * FROM [DefultersView]"></asp:SqlDataSource>
</asp:Content>
