<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="Members.aspx.cs" Inherits="LoanWebApplication4.Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 48px;
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Members</h1>
<hr />
<br />
    <div style="text-align: center; width: 110px">
        <a href="MemberDetails.aspx">
            <img alt="add member" class="style1" src="../images/1324638439_user-group-new.png" /><br />
            Add New Member</a>
    </div>
    <br />
    <asp:GridView ID="GridView1" Width="100%" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333"
        GridLines="None" DataKeyNames="MemberId" PageSize="30" 
        EmptyDataText="No member data">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="No." HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId"
                InsertVisible="False" ReadOnly="True" Visible="False"></asp:BoundField>
            <asp:HyperLinkField Text="Details" DataNavigateUrlFields="MemberId" DataNavigateUrlFormatString="~/admin/MemberDetails.aspx?mid={0}"
                NavigateUrl="~/admin/MemberDetails.aspx" />
            <asp:BoundField DataField="MemberFirstName" HeaderText="First Name" SortExpression="MemberFirstName">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MemberLastName" HeaderText="Last Name" SortExpression="MemberLastName">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MemberBranch" HeaderText="Branch" SortExpression="MemberBranch">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="AccountNumber" HeaderText="Account Number" SortExpression="AccountNumber">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerSettings PageButtonCount="50" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>"
        DeleteCommand="DELETE FROM Members WHERE (MemberId = @MemberId)" InsertCommand="INSERT INTO [Members] ([MemberFirstName], [MemberLastName], [MemberPhoto], [Balance], [MemberBranch], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [AccountNumber]) VALUES (@MemberFirstName, @MemberLastName, @MemberPhoto, @Balance, @MemberBranch, @CreatedBy, @CreatedDate, @ModifiedBy, @ModifiedDate, @AccountNumber)"
        SelectCommand="SELECT MemberId, MemberFirstName, MemberLastName, MemberPhoto, Balance, MemberBranch, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, AccountNumber, CurrentLoanId, Fax, Telephone, Address, ResidentialAddress, BusinessAddress, Gender, OtherName, ContactPerson, IdentityTypeID, IdentityNumber, DOB, Mobile, IsDeleted FROM Members WHERE (IsDeleted = 0) ORDER BY MemberFirstName, MemberLastName, OtherName"
        UpdateCommand="UPDATE [Members] SET [MemberFirstName] = @MemberFirstName, [MemberLastName] = @MemberLastName, [MemberPhoto] = @MemberPhoto, [Balance] = @Balance, [MemberBranch] = @MemberBranch, [CreatedBy] = @CreatedBy, [CreatedDate] = @CreatedDate, [ModifiedBy] = @ModifiedBy, [ModifiedDate] = @ModifiedDate, [AccountNumber] = @AccountNumber WHERE [MemberId] = @MemberId"
        EnableViewState="False" OnDeleting="item_Deleting" OnUpdating="item_Updating">
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
            <asp:Parameter Name="AccountNumber" Type="String" />
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
            <asp:Parameter Name="AccountNumber" Type="String" />
            <asp:Parameter Name="MemberId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
