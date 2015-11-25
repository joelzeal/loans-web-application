<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true"
    CodeBehind="MobileBankersList.aspx.cs" Inherits="LoanWebApplication4.admin.MobileBankersList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; width: 110px">
        <a href="MobileBankerDetails.aspx">
            <img alt="add mobile banker" class="style1" src="../images/1324638439_user-group-new.png" /><br />
            Add New Mobile Banker</a>
    </div>
    <h2>
        Mobile Bankers Setup</h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="MobileBankerid" DataSourceID="MobileBankersListSqlDataSource"
        EmptyDataText="No data available." ForeColor="#333333" GridLines="None" 
        Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
        <asp:TemplateField HeaderText="No." HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <%--<asp:CommandField ShowEditButton="True">
                <HeaderStyle HorizontalAlign="Left" Width="50px" />
            </asp:CommandField>--%>
            <asp:HyperLinkField DataNavigateUrlFields="MobileBankerid" 
                DataNavigateUrlFormatString="~/admin/MobileBankerDetails.aspx?mobiId={0}" 
                NavigateUrl="~/admin/MobileBankerDetails.aspx" Text="Edit">
            <HeaderStyle Width="70px" />
            </asp:HyperLinkField>
          <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>

            <asp:HyperLinkField DataNavigateUrlFields="MobileBankerid" DataNavigateUrlFormatString="~/admin/RecordMobileBankerCashCollection.aspx?mobiId={0}"
                NavigateUrl="~/admin/RecordMobileBankerCashCollection.aspx" Text="Record Cash Collected">
                <HeaderStyle HorizontalAlign="Left" Width="130px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="MobileBankerid" HeaderText="MobileBankerid" InsertVisible="False"
                ReadOnly="True" SortExpression="MobileBankerid" Visible="False" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="OtherName" HeaderText="Other Name" SortExpression="OtherName">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
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
    <asp:SqlDataSource ID="MobileBankersListSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [MobileBankers] WHERE [MobileBankerid] = @MobileBankerid" 
        InsertCommand="INSERT INTO [MobileBankers] ([FirstName], [OtherName], [LastName], [Telephone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MobileBankerCode], [Address], [IsDeleted]) VALUES (@FirstName, @OtherName, @LastName, @Telephone, @CreatedDate, @CreatedBy, @ModifiedDate, @ModifiedBy, @MobileBankerCode, @Address, @IsDeleted)" 
        SelectCommand="SELECT * FROM [MobileBankers] ORDER BY [FirstName]" 
        
        UpdateCommand="UPDATE [MobileBankers] SET [FirstName] = @FirstName, [OtherName] = @OtherName, [LastName] = @LastName, [Telephone] = @Telephone, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [MobileBankerCode] = @MobileBankerCode, [Address] = @Address, [IsDeleted] = @IsDeleted WHERE [MobileBankerid] = @MobileBankerid" 
        ondeleting="item_Deleting" onupdating="item_Updating">
        <DeleteParameters>
            <asp:Parameter Name="MobileBankerid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="OtherName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="MobileBankerCode" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="IsDeleted" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="OtherName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="MobileBankerCode" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="IsDeleted" Type="Boolean" />
            <asp:Parameter Name="MobileBankerid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
