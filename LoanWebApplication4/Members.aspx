<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="LoanWebApplication4.Members" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <a href="MemberDetails.aspx">Add New Member</a> <br />
    <asp:GridView ID="GridView1" Width="97%" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="MembersSqlDataSource" ForeColor="#333333" 
    GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:HyperLinkField Text="Details" DataNavigateUrlFields="MemberId" 
                DataNavigateUrlFormatString="~/MemberDetails.aspx?mid={0}" 
                NavigateUrl="~/MemberDetails.aspx" />
            <asp:BoundField DataField="MemberFirstName" HeaderText="First Name" 
                SortExpression="MemberFirstName" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MemberLastName" HeaderText="Last Name" 
                SortExpression="MemberLastName" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Balance" HeaderText="Balance" 
                SortExpression="Balance" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MemberBranch" HeaderText="Branch" 
                SortExpression="MemberBranch" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
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
    <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [Members] WHERE [MemberId] = @MemberId" 
        InsertCommand="INSERT INTO [Members] ([MemberFirstName], [MemberLastName], [MemberPhoto], [Balance], [MemberBranch], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (@MemberFirstName, @MemberLastName, @MemberPhoto, @Balance, @MemberBranch, @CreatedBy, @CreatedDate, @ModifiedBy, @ModifiedDate)" 
        SelectCommand="SELECT * FROM [Members]" 
        UpdateCommand="UPDATE [Members] SET [MemberFirstName] = @MemberFirstName, [MemberLastName] = @MemberLastName, [MemberPhoto] = @MemberPhoto, [Balance] = @Balance, [MemberBranch] = @MemberBranch, [CreatedBy] = @CreatedBy, [CreatedDate] = @CreatedDate, [ModifiedBy] = @ModifiedBy, [ModifiedDate] = @ModifiedDate WHERE [MemberId] = @MemberId">
        <DeleteParameters>
            <asp:Parameter Name="MemberId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MemberFirstName" Type="String" />
            <asp:Parameter Name="MemberLastName" Type="String" />
            <asp:Parameter Name="MemberPhoto" Type="Object" />
            <asp:Parameter Name="Balance" Type="Decimal" />
            <asp:Parameter Name="MemberBranch" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MemberFirstName" Type="String" />
            <asp:Parameter Name="MemberLastName" Type="String" />
            <asp:Parameter Name="MemberPhoto" Type="Object" />
            <asp:Parameter Name="Balance" Type="Decimal" />
            <asp:Parameter Name="MemberBranch" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="MemberId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
