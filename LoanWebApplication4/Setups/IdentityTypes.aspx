<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="IdentityTypes.aspx.cs" Inherits="LoanWebApplication4.admin.IdentityTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
    Identification Types
</h2>
<br />
 <div class="DataSection">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="IdentificationTypeId" 
        DataSourceID="IDTypesSqlDataSource" DefaultMode="Insert" Width="316px">
        <EditItemTemplate>
            IdentificationTypeId:
            <asp:Label ID="IdentificationTypeIdLabel1" runat="server" 
                Text='<%# Eval("IdentificationTypeId") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td>
                        Description:
                    </td>
                    <td>
                        &nbsp;<asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Description") %>' Width="200px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            IdentificationTypeId:
            <asp:Label ID="IdentificationTypeIdLabel" runat="server" 
                Text='<%# Eval("IdentificationTypeId") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    </div>
    <asp:SqlDataSource ID="IDTypesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [IdentificationTypes] WHERE [IdentificationTypeId] = @IdentificationTypeId" 
        InsertCommand="INSERT INTO [IdentificationTypes] ([Description]) VALUES (@Description)" 
        SelectCommand="SELECT * FROM [IdentificationTypes]" 
        
        UpdateCommand="UPDATE [IdentificationTypes] SET [Description] = @Description WHERE [IdentificationTypeId] = @IdentificationTypeId" 
        ondeleting="item_Deleting" oninserting="item_inserting" 
        onupdating="item_Updating">
        <DeleteParameters>
            <asp:Parameter Name="IdentificationTypeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="IdentificationTypeId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="IdentificationTypeId" 
    DataSourceID="IDTypesSqlDataSource" ForeColor="#333333" 
    GridLines="None" Width="97%" EmptyDataText="No data">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
             <asp:CommandField ShowDeleteButton="false" ShowEditButton="True">
            <HeaderStyle Width="10px" />
            </asp:CommandField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="10px" />
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description">
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
<asp:SqlDataSource ID="RepaymentFrequenciesSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
    DeleteCommand="DELETE FROM [RepaymentFrequencies] WHERE [RepaymentFrequencyId] = @RepaymentFrequencyId" 
    InsertCommand="INSERT INTO [RepaymentFrequencies] ([NumberOfDays], [Description]) VALUES (@NumberOfDays, @Description)" 
    SelectCommand="SELECT * FROM [RepaymentFrequencies] ORDER BY [Description]" 
    UpdateCommand="UPDATE [RepaymentFrequencies] SET [NumberOfDays] = @NumberOfDays, [Description] = @Description WHERE [RepaymentFrequencyId] = @RepaymentFrequencyId">
    <DeleteParameters>
        <asp:Parameter Name="RepaymentFrequencyId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="NumberOfDays" Type="Int32" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="NumberOfDays" Type="Int32" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="RepaymentFrequencyId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
