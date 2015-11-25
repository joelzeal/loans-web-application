<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="Groups.aspx.cs" Inherits="LoanWebApplication4.Groups" %>
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
<h1>Groups</h1>
<hr />
<br />
    <div style="text-align:center;width:110px"><a href="MemberGroupDetails.aspx">
 <img alt="add member" class="style1" 
        src="../images/1324638439_user-group-new.png" /><br />
        Add New Group</a> 
</div>
   
    <br />
        <asp:GridView ID="GridView1" Width="100%" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="MembersSqlDataSource" ForeColor="#333333" 
        GridLines="None" DataKeyNames="GroupId" EmptyDataText="No group data">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
            <asp:TemplateField HeaderText="No." HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
                 <asp:TemplateField  >
                    <ItemTemplate >
                        <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField Text="Details" DataNavigateUrlFields="GroupId" 
                    DataNavigateUrlFormatString="~/admin/MemberGroupDetails.aspx?groupId={0}" 
                    NavigateUrl="~/admin/MemberGroupDetails.aspx" />
                <asp:BoundField DataField="GroupName" HeaderText="Group Name" 
                    SortExpression="GroupName" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="AccountNumber" HeaderText="Account Number" 
                    SortExpression="AccountNumber" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description">
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
    <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="UPDATE LoanGroups SET IsDeleted = 1 WHERE (GroupId = @GroupId)" 
        InsertCommand="INSERT INTO [LoanGroups] ([GroupName], [Description], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [AccountNumber]) VALUES (@GroupName, @Description, @CreatedBy, @CreatedDate, @ModifiedBy, @ModifiedDate, @AccountNumber)" 
        SelectCommand="SELECT GroupId, GroupName, Description, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, AccountNumber, IsDeleted, AccountTypeId FROM LoanGroups WHERE (IsDeleted = 0) ORDER BY GroupName" 
        
    
        
        
        UpdateCommand="UPDATE [LoanGroups] SET [GroupName] = @GroupName, [Description] = @Description, [CreatedBy] = @CreatedBy, [CreatedDate] = @CreatedDate, [ModifiedBy] = @ModifiedBy, [ModifiedDate] = @ModifiedDate, [AccountNumber] = @AccountNumber WHERE [GroupId] = @GroupId">
        <DeleteParameters>
            <asp:Parameter Name="GroupId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GroupName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="AccountNumber" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GroupName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="AccountNumber" Type="String" />
            <asp:Parameter Name="GroupId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
