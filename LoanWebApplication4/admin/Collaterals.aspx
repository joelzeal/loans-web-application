<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="Collaterals.aspx.cs" Inherits="LoanWebApplication4.admin.Collaterals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 89px;
        }
        .style5
        {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
    Collaterals
</h1>
<hr />
<div class="DataSection">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CollateralID" 
        DataSourceID="CollateralsSqlDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            CollateralID:
            <asp:Label ID="CollateralIDLabel1" runat="server" 
                Text='<%# Eval("CollateralID") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            CreatedBy:
            <asp:TextBox ID="CreatedByTextBox" runat="server" 
                Text='<%# Bind("CreatedBy") %>' />
            <br />
            CreatedDate:
            <asp:TextBox ID="CreatedDateTextBox" runat="server" 
                Text='<%# Bind("CreatedDate") %>' />
            <br />
            ModifiedBy:
            <asp:TextBox ID="ModifiedByTextBox" runat="server" 
                Text='<%# Bind("ModifiedBy") %>' />
            <br />
            ModifiedDate:
            <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                Text='<%# Bind("ModifiedDate") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="style4">
                        Description:
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Description") %>' Width="200px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="DescriptionTextBox" ErrorMessage="*" ForeColor="Red" 
                            ValidationGroup="g3"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Save" ValidationGroup="g3" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            CollateralID:
            <asp:Label ID="CollateralIDLabel" runat="server" 
                Text='<%# Eval("CollateralID") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            CreatedBy:
            <asp:Label ID="CreatedByLabel" runat="server" 
                Text='<%# Bind("CreatedBy") %>' />
            <br />
            CreatedDate:
            <asp:Label ID="CreatedDateLabel" runat="server" 
                Text='<%# Bind("CreatedDate") %>' />
            <br />
            ModifiedBy:
            <asp:Label ID="ModifiedByLabel" runat="server" 
                Text='<%# Bind("ModifiedBy") %>' />
            <br />
            ModifiedDate:
            <asp:Label ID="ModifiedDateLabel" runat="server" 
                Text='<%# Bind("ModifiedDate") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView></div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="CollateralID" 
    DataSourceID="CollateralsSqlDataSource" ForeColor="#333333" 
    GridLines="None" Width="100%" EmptyDataText="No collaterals added.">
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
            <asp:BoundField DataField="CollateralID" 
                HeaderText="CollateralID" InsertVisible="False" ReadOnly="True" 
                SortExpression="CollateralID" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataRowStyle Font-Italic="True" />
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
    <asp:SqlDataSource ID="CollateralsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
        DeleteCommand="DELETE FROM [Collaterals] WHERE [CollateralID] = @CollateralID" 
        InsertCommand="INSERT INTO [Collaterals] ([Description], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (@Description, @CreatedBy, @CreatedDate, @ModifiedBy, @ModifiedDate)" 
        SelectCommand="SELECT * FROM [Collaterals]" 
        UpdateCommand="UPDATE [Collaterals] SET [Description] = @Description, [CreatedBy] = @CreatedBy, [CreatedDate] = @CreatedDate, [ModifiedBy] = @ModifiedBy, [ModifiedDate] = @ModifiedDate WHERE [CollateralID] = @CollateralID">
        <DeleteParameters>
            <asp:Parameter Name="CollateralID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="CollateralID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
